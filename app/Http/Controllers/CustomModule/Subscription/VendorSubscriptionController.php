<?php

namespace App\Http\Controllers\CustomModule\Subscription;

use App\Http\Controllers\Controller;
use App\Models\Modules\Subscription\SubscriptionPackage;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;

class VendorSubscriptionController extends Controller
{
    public function index(){
        $packages =SubscriptionPackage::withoutGlobalScope('translate')->where([['status',1],['module_id',Helpers::get_store_data()->module_id]])->get();
        return view('vendor-views.custom-module.subscription.index',compact('packages'));
    }
}
