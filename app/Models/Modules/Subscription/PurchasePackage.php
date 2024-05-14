<?php

namespace App\Models\Modules\Subscription;

use App\Models\Admin;
use App\Models\Vendor;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchasePackage extends Model
{
    use HasFactory;

    public function vendor(){
        return $this->belongsTo(Vendor::class,'vendor_id','id');
    }

    public function admin(){
        return $this->belongsTo(Admin::class,'admin_id','id');
    }

    public function subscription_package(){
        return $this->belongsTo(SubscriptionPackage::class,'subscription_package_id','id');
    }
}
