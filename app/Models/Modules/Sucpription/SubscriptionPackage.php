<?php

namespace App\Models\Modules\Sucpription;

use App\Models\Module;
use App\Models\Translation;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubscriptionPackage extends Model
{
    use HasFactory; 
    

    public function translations()
    {
        return $this->morphMany(Translation::class, 'translationable');
    }

    public function module()
    {
        return $this->belongsTo(Module::class);
    }
}
