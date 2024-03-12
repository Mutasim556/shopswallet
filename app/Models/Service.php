<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    protected $table = 'services';


    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function translations()
    {
        return $this->morphMany(Translation::class, 'translationable');
    }

    public function item()
    {
        return $this->belongsTo(Item::class, 'item_id');
    }
    
}
