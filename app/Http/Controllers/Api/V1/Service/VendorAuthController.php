<?php

namespace App\Http\Controllers\Api\V1\Service;


use App\Exports\DisbursementHistoryExport;
use App\Models\DisbursementDetails;
use App\Models\Item;
use App\Models\Zone;
use App\Models\AddOn;
use App\Models\Order;
use App\Models\Store;
use App\Models\Module;
use App\Models\Vendor;
use App\Models\Message;
use App\Models\UserInfo;
use App\Scopes\StoreScope;
use App\Models\DataSetting;
use App\Models\StoreConfig;
use App\Models\StoreWallet;
use App\Models\TempProduct;
use App\Models\Translation;
use Illuminate\Support\Str;
use App\Models\Conversation;
use App\Models\StoreSchedule;
use App\CentralLogics\Helpers;
use App\Models\Withdrawdata;
use App\Exports\StoreListExport;
use App\Models\OrderTransaction;
use App\CentralLogics\StoreLogic;
use App\Models\AccountTransaction;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;
use Rap2hpoutre\FastExcel\FastExcel;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password;
use App\Exports\StoreWiseItemReviewExport;
use App\Exports\StoreCashTransactionExport;
use App\Exports\StoreOrderTransactionExport;
use MatanYadaev\EloquentSpatial\Objects\Point;
use App\Exports\StoreWithdrawTransactionExport;
use App\Exports\StoreWiseWithdrawTransactionExport;
use App\Models\BusinessSetting;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class VendorAuthController extends Controller
{
    public function getZoneAndLang():JsonResponse{
        $languages = BusinessSetting::where('key','language')->first();
        $lang_details = [];
        foreach(json_decode($languages->value) as $key=>$lang){
            $lang_details[$key]['lang_name'] = Helpers::get_language_name($lang). '(' . strtoupper($lang) . ')';
            $lang_details[$key]['lang_code'] = $lang;
        }

        $zone = Zone::active()->select('id','name')->get();
        return response()->json([
            'zone'=>$zone,
            'lang'=>$lang_details,
        ]);
    }
    public function store(Request $data):JsonResponse{
        $validator = Validator::make($data->all(), [
            'f_name' => 'required|max:100',
            'l_name' => 'nullable|max:100',
            'name.0' => 'required',
            'name.*' => 'max:191',
            'address' => 'required|max:1000',
            'latitude' => 'required',
            'longitude' => 'required',
            'email' => 'required|unique:vendors',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:20|unique:vendors',
            'minimum_delivery_time' => 'required',
            'maximum_delivery_time' => 'required',
            'delivery_time_type'=>'required',
            'password' => ['required', Password::min(8)->mixedCase()->letters()->numbers()->symbols()->uncompromised()],
            'zone_id' => 'required',
            'module_id' => 'required',
            'logo' => 'required',
            'tax' => 'required'
        ], [
            'f_name.required' => translate('messages.first_name_is_required'),
            'name.0.required'=>translate('default_name_is_required'),
        ]);

        // dd($data->file('logo'));
        if($data->zone_id)
        {
            $zone = Zone::query()
            ->whereContains('coordinates', new Point($data->latitude, $data->longitude, POINT_SRID))
            ->where('id',$data->zone_id)
            ->first();
            if(!$zone){
                $validator->getMessageBag()->add('latitude', translate('messages.coordinates_out_of_zone'));
                return response()->json($validator->errors());
            }
        }

        if ($data->delivery_time_type == 'min') {
            $minimum_delivery_time = (int) $data->input('minimum_delivery_time');
            if ($minimum_delivery_time < 10) {
                $validator->getMessageBag()->add('minimum_delivery_time', translate('messages.minimum_delivery_time_should_be_more_than_10_min'));
                return response()->json($validator->errors());
            }
        }
       
        if ($validator->fails()) {
            return response()->json($validator->errors());
        }

        // dd($data->address);
        $vendor = new Vendor();
        $vendor->f_name = $data->f_name;
        $vendor->l_name = $data->l_name;
        $vendor->email = $data->email;
        $vendor->phone = $data->phone;
        $vendor->password = bcrypt($data->password);
        $vendor->save();

        $store = new Store;
        $store->name = $data->name[array_search('default', $data->lang)];
        $store->phone = $data->phone;
        $store->email = $data->email;
        $store->logo = Helpers::upload('store/', 'png', $data->file('logo'));
        $store->cover_photo = Helpers::upload('store/cover/', 'png', $data->file('cover_photo'));
        $store->address = $data->address[array_search('default', $data->lang)];
        $store->latitude = $data->latitude;
        $store->longitude = $data->longitude;
        $store->vendor_id = $vendor->id;
        $store->zone_id = $data->zone_id;
        $store->tax = $data->tax;
        $store->delivery_time = $data->minimum_delivery_time .'-'. $data->maximum_delivery_time.' '.$data->delivery_time_type;
        $store->module_id =$data->module_id;
        
        try {
            $store->save();
            $store->module->increment('stores_count');
            if(config('module.'.$store->module->module_type)['always_open'])
            {
                StoreLogic::insert_schedule($store->id);
            }
            $default_lang = str_replace('_', '-', app()->getLocale());
            $dataS = [];
            foreach ($data->lang as $index => $key) {
                if($default_lang == $key && !($data->name[$index])){
                    if ($key != 'default') {
                        array_push($dataS, array(
                            'translationable_type' => 'App\Models\Store',
                            'translationable_id' => $store->id,
                            'locale' => $key,
                            'key' => 'name',
                            'value' => $store->name,
                        ));
                    }
                }else{
                    if ($data->name[$index] && $key != 'default') {
                        array_push($dataS, array(
                            'translationable_type' => 'App\Models\Store',
                            'translationable_id' => $store->id,
                            'locale' => $key,
                            'key' => 'name',
                            'value' => $data->name[$index],
                        ));
                    }
                }
                if($default_lang == $key && !($data->address[$index])){
                    if ($key != 'default') {
                        array_push($dataS, array(
                            'translationable_type' => 'App\Models\Store',
                            'translationable_id' => $store->id,
                            'locale' => $key,
                            'key' => 'address',
                            'value' => $store->address,
                        ));
                    }
                }else{
                    if ($data->address[$index] && $key != 'default') {
                        array_push($dataS, array(
                            'translationable_type' => 'App\Models\Store',
                            'translationable_id' => $store->id,
                            'locale' => $key,
                            'key' => 'address',
                            'value' => $data->address[$index],
                        ));
                    }
                }
            }
            Translation::insert($dataS);
        } catch (\Exception $ex) {
            info($ex->getMessage());
        }
        // Toastr::success(translate('messages.store').translate('messages.added_successfully'));
        return response()->json([
            'success' => translate('messages.store').' '.translate('messages.added_successfully'),
        ]);
    }
}