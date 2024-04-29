<?php

namespace App\Http\Controllers\CustomModule\Subscription;

use App\Http\Controllers\Controller;
use App\Models\Modules\Subscription\SubscriptionPackage;
use App\Models\Translation;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class SubscriptionCreateController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function __construct()
    {
        // $this->middleware('subscription');
    }
    public function index(Request $data)
    {
        $module_type = 'settings';
        $packages = SubscriptionPackage::with('module')
            ->latest()->paginate(config('default_pagination'));
        if($data->id){
            $package = SubscriptionPackage::withoutGlobalScope('translate')->where('id',$data->id)->first();
            return view('admin-views.custom-modules.subscription.index',compact('packages','package','module_type'));
        }else{
            return view('admin-views.custom-modules.subscription.index',compact('packages','module_type'));
        }
        
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'=>'required|max:150',
            'name.0'=>'required',
            'package_details'=>'required',
            'package_details.0'=>'required',
            'price'=>'required',
            'currency'=>'required',
            'module'=>'required',
            'package_type'=>'required',
            'purchase_type'=>'required',
            'discount_type'=>'required',
            'validity'=>'required',
            'purchase_limit'=>'required',
            'purchase_limit_time'=>'required',
            'maximum_order_limit'=>'required',
        ],[
            'name.required' => translate('messages.Name is required!'),
            'name.0.required' => translate('default_name_is_required'),
            'package_details.required' => translate('messages.Package details is required!'),
            'package_details.0.required' => translate('default_package_details_is_required'),
            'price.required' => translate('price_is_required'),
            'currency.required' => translate('currency_is_required'),
            'module.required' => translate('module_is_required'),
            'package_type.required' => translate('package_type_is_required'),
            'purchase_type.required' => translate('purchase_type_is_required'),
            'discount_type.required' => translate('discount_type_is_required'),
            'validity.required' => translate('validity_is_required'),
            'purchase_limit.required' => translate('purchase_limit_is_required'),
            'purchase_limit_time.required' => translate('purchase_limit_time_is_required'),
            'maximum_order_limit.required' => translate('maximum_order_limit_is_required'),
            
        ]);

        $package = new SubscriptionPackage();
        $package->name = $request->name[array_search('default', $request->lang)];
        $package->details = $request->package_details ? $request->package_details[array_search('default', $request->lang)]:'';
        $package->price = $request->price?$request->price:0;
        $package->currency = $request->currency;
        $package->module_id = $request->module;
        $package->package_type = $request->package_type;
        $package->purchase_type = $request->purchase_type;
        $package->discount = $request->discount?$request->discount:0;
        $package->discount_type = $request->discount_type?$request->discount_type:'Flat';
        $package->validity = $request->validity;
        $package->purchase_limit = $request->purchase_limit;
        $package->purchase_limit_time = $request->purchase_limit_time;
        $package->purchase_with_point = $request->purchase_with_point?1:0;
        $package->gift_it = $request->gift_it?1:0;
        $package->maximum_order_limit = $request->maximum_order_limit;
        $package->save();

        $default_lang = str_replace('_', '-', app()->getLocale());
        $data = [];
        foreach ($request->lang as $index => $key) {
            if ($default_lang == $key && !($request->name[$index])) {
                if ($key != 'default') {
                    array_push($data, array(
                        'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                        'translationable_id'    => $package->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $package->name,
                    ));
                }
            } else {

                if ($request->name[$index] && $key != 'default') {
                    array_push($data, array(
                        'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                        'translationable_id'    => $package->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $request->name[$index],
                    ));
                }
            }

            if ($request->package_details) {
                if ($default_lang == $key && !($request->package_details[$index])) {
                    if ($key != 'default') {
                        array_push($data, array(
                            'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                            'translationable_id'    => $package->id,
                            'locale'                => $key,
                            'key'                   => 'package_details',
                            'value'                 => $package->title,
                        ));
                    }
                } else {

                    if ($request->package_details[$index] && $key != 'default') {
                        array_push($data, array(
                            'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                            'translationable_id'    => $package->id,
                            'locale'                => $key,
                            'key'                   => 'package_details',
                            'value'                 => $request->package_details[$index],
                        ));
                    }
                }
            }
        }
        if (count($data)) {
            Translation::insert($data);
        }
        Toastr::success(translate('messages.category_added_successfully'));
        return back();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // dd($request->all());
        $request->validate([
            'name'=>'required|max:150',
            'name.0'=>'required',
            'package_details'=>'required',
            'package_details.0'=>'required',
            'price'=>'required',
            'currency'=>'required',
            'module'=>'required',
            'package_type'=>'required',
            'purchase_type'=>'required',
            'discount_type'=>'required',
            'validity'=>'required',
            'purchase_limit'=>'required',
            'purchase_limit_time'=>'required',
            'maximum_order_limit'=>'required',
        ],[
            'name.required' => translate('messages.Name is required!'),
            'name.0.required' => translate('default_name_is_required'),
            'package_details.required' => translate('messages.Package details is required!'),
            'package_details.0.required' => translate('default_package_details_is_required'),
            'price.required' => translate('price_is_required'),
            'currency.required' => translate('currency_is_required'),
            'module.required' => translate('module_is_required'),
            'package_type.required' => translate('package_type_is_required'),
            'purchase_type.required' => translate('purchase_type_is_required'),
            'discount_type.required' => translate('discount_type_is_required'),
            'validity.required' => translate('validity_is_required'),
            'purchase_limit.required' => translate('purchase_limit_is_required'),
            'purchase_limit_time.required' => translate('purchase_limit_time_is_required'),
            'maximum_order_limit.required' => translate('maximum_order_limit_is_required'),
            
        ]);

        $package = SubscriptionPackage::findOrFail($id);
        $package->name = $request->name[array_search('default', $request->lang)];
        $package->details = $request->package_details ? $request->package_details[array_search('default', $request->lang)]:'';
        $package->price = $request->price?$request->price:0;
        $package->currency = $request->currency;
        $package->module_id = $request->module;
        $package->package_type = $request->package_type;
        $package->purchase_type = $request->purchase_type;
        $package->discount = $request->discount?$request->discount:0;
        $package->discount_type = $request->discount_type?$request->discount_type:'Flat';
        $package->validity = $request->validity;
        $package->purchase_limit = $request->purchase_limit;
        $package->purchase_limit_time = $request->purchase_limit_time;
        $package->purchase_with_point = $request->purchase_with_point?1:0;
        $package->gift_it = $request->gift_it?1:0;
        $package->maximum_order_limit = $request->maximum_order_limit;
        $package->save();

        $default_lang = str_replace('_', '-', app()->getLocale());
        foreach ($request->lang as $index => $key) {
            if ($default_lang == $key && !($request->name[$index])) {
                if ($key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                            'translationable_id'    => $package->id,
                            'locale'                => $key,
                            'key'                   => 'name'
                        ],
                        ['value'                 => $package->name]
                    );
                    if ($request->package_details) {
                        Translation::updateOrInsert(
                            [
                                'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                                'translationable_id'    => $package->id,
                                'locale'                => $key,
                                'key'                   => 'package_details'
                            ],
                            ['value'                 => $package->details]
                        );
                    }
                    
                }
            } else {

                if ($request->name[$index] && $key != 'default') {
                    Translation::updateOrInsert(
                        [
                            'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                            'translationable_id'    => $package->id,
                            'locale'                => $key,
                            'key'                   => 'name'
                        ],
                        ['value'                 => $request->name[$index]]
                    );

                    if ($request->package_details) {
                        Translation::updateOrInsert(
                            [
                                'translationable_type'  => 'App\Models\Modules\Subscription\SubscriptionPackage',
                                'translationable_id'    => $package->id,
                                'locale'                => $key,
                                'key'                   => 'package_details'
                            ],
                            ['value'                 => $request->package_details[$index]]
                        );
                    }
                }
            }

            
        }
        
        Toastr::success(translate('messages.category_updated_successfully'));
        return back();
    }

    /**
     * Update status
     */

     public function status(Request $request){
        $package = SubscriptionPackage::findOrFail($request->id);
        $package->status = $request->status;
        $package->save();
        Toastr::success(translate('messages.package_updated_successfully'));
        return back();
     }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $package = SubscriptionPackage::findOrFail($id);
        $package->delete();
        Toastr::success(translate('messages.package_deleted_successfully'));
        return back();
    }
}