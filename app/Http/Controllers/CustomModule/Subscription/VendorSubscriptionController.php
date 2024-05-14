<?php

namespace App\Http\Controllers\CustomModule\Subscription;

use App\Http\Controllers\Controller;
use App\Models\Modules\Subscription\SubscriptionPackage;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Models\Modules\Subscription\PurchasePackage;
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
                $checkPrevPurchase = PurchasePackage::find($data->package_id);
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

                    $purchase->save();
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
        $purchases = PurchasePackage::with('subscription_package')->paginate(config('default_pagination'));
        return view('vendor-views.custom-module.subscription.list',compact('purchases'));
    }
}
