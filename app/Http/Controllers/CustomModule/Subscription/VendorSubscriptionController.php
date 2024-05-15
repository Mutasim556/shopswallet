<?php

namespace App\Http\Controllers\CustomModule\Subscription;

use App\Http\Controllers\Controller;
use App\Models\Modules\Subscription\SubscriptionPackage;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Models\Modules\Subscription\PurchasePackage;
use App\Models\Modules\Subscription\VendorPackageBalance;
use Brian2694\Toastr\Facades\Toastr;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class VendorSubscriptionController extends Controller
{
    public function index(){
        $packages =SubscriptionPackage::withoutGlobalScope('translate')->where([['status',1],['module_id',Helpers::get_store_data()->module_id]])->get();

        
        return view('vendor-views.custom-module.subscription.index',compact('packages'));
    }

    public function freetrail(Request $data){
        if($data->package_id){
            $check = SubscriptionPackage::find($data->package_id);
            if($check && $check->purchase_type=='Free'){
                $checkPrevPurchase = PurchasePackage::where([['subscription_package_id',$data->package_id],['vendor_id',Auth::guard('vendor')->user()->id]])->latest('id')->first();
                if($checkPrevPurchase){
                    Toastr::error(translate('messages.already_purchased'));
                    return to_route('subscription.vendor.packages.index');
                }else{
                    $purchase = new PurchasePackage();
                    $purchase->vendor_id = Auth::guard('vendor')->user()->id;
                    $purchase->subscription_package_id = $data->package_id;
                    $purchase->purchase_date = Carbon::now();
                    $purchase->expiry_date = Carbon::now()->addDays($check->validity);
                    $purchase->payment_option = 'manual';
                    $purchase->paid_amount = 0;
                    $purchase->package_status = 1;
                    $purchase->limit_status = 0;
                    $purchase->maximum_order_limit = $check->maximum_order_limit;
                    $purchase->save();

                    $check_balance = VendorPackageBalance::where('vendor_id',Auth::guard('vendor')->user()->id)->latest('id')->first();
                    if($check_balance){
                        $insert_balance = new VendorPackageBalance();
                        $insert_balance->vendor_id = Auth::guard('vendor')->user()->id;
                        $insert_balance->subscription_package_id = $data->package_id;
                        $insert_balance->purchase_package_id = $purchase->id;
                        $insert_balance->previous_remaining_order = ($check_balance->balance_status=='1'||$check_balance->balance_status=='0')?$check_balance->total_order_limit-$check_balance->total_vendor_order_count:0;

                        $insert_balance->current_pack_order_limit = $check->maximum_order_limit;
                        $insert_balance->total_order_limit = (($check_balance->balance_status=='1'||$check_balance->balance_status=='0')?$check_balance->total_order_limit-$check_balance->total_vendor_order_count:0)+$check->maximum_order_limit;

                        $insert_balance->balance_status = 0;
                        $insert_balance->last_purchase_date = Carbon::now();
                        $insert_balance->last_expiry_date = Carbon::now()->addDays($check->validity);
                        $insert_balance->save();
                    }else{
                        $insert_balance = new VendorPackageBalance();
                        $insert_balance->vendor_id = Auth::guard('vendor')->user()->id;
                        $insert_balance->subscription_package_id = $data->package_id;
                        $insert_balance->purchase_package_id = $purchase->id;
                        $insert_balance->previous_remaining_order =0;
                        $insert_balance->current_pack_order_limit = $check->maximum_order_limit;
                        $insert_balance->total_order_limit = $check->maximum_order_limit;
                        $insert_balance->balance_status = 0;
                        $insert_balance->last_purchase_date = Carbon::now();
                        $insert_balance->last_expiry_date = Carbon::now()->addDays($check->validity);

                        $insert_balance->save();
                    }
                    Toastr::success(translate('messages.package_activated_successfully'));
                    return to_route('subscription.vendor.packages.index');
                }
            }else{
                Toastr::error(translate('messages.Invalid_package'));
                return to_route('subscription.vendor.packages.index');
            }
        }else{
            return back();
        }
    }

    public function list(){
        $purchases = PurchasePackage::with('subscription_package')->where('vendor_id',Auth::guard('vendor')->user()->id)->orderBy('id','DESC')->orderBy('package_status','ASC')->paginate(config('default_pagination'));
        $vendor_balance = VendorPackageBalance::where('vendor_id',Auth::guard('vendor')->user()->id)->latest('id')->select('total_order_limit','total_vendor_order_count','last_expiry_date')->first();
        return view('vendor-views.custom-module.subscription.list',compact('purchases','vendor_balance'));
    }


    public function purchasepackage(Request $data){
        if($data->payment_option=='manual'){
            $package_details = SubscriptionPackage::where([['status',1],['id',$data->package_id]])->first();
            if($package_details){
                $purchase_details = PurchasePackage::where([['vendor_id',Auth::guard('vendor')->user()->id],['subscription_package_id',$package_details->id]])->count();
                if($purchase_details>$package_details->purchase_limit){
                    Toastr::error(translate('messages.you_have_reached_your_purchased_limit'));
                    return response()->json([
                        'err'=>'err'
                    ],403);
                }else{
                    $purchase_detail = PurchasePackage::where([['vendor_id',Auth::guard('vendor')->user()->id],['subscription_package_id',$package_details->id],['package_status',0]])->latest()->first();
                    if($purchase_detail){
                        Toastr::error(translate('messages.you_have_already_a_pending_request'));
                        return response()->json([
                            'err'=>'err'
                        ],403);
                    }else{
                        $purchase = new PurchasePackage();
                        $purchase->vendor_id = Auth::guard('vendor')->user()->id;
                        $purchase->subscription_package_id = $data->package_id;
                        $purchase->purchase_date = Carbon::now();
                        $purchase->expiry_date = Carbon::now()->addDays($package_details->validity);
                        $purchase->payment_option = 'manual';
                        $purchase->paid_amount = 0;
                        $purchase->package_status = 0;
                        $purchase->limit_status = 0;
                        $purchase->maximum_order_limit = $package_details->maximum_order_limit;
                        $purchase->save();
                        Toastr::success(translate('messages.Your_request_was_sent_Please_wait_untill_we_contact_with_you'));
                        return response()->json('ok');
                    }
                }
                    

            }else{
                Toastr::error(translate('messages.Invalid_package'));
                return response()->json([
                    'err'=>'err'
                ],403);
            }
            
        }
    }
}
