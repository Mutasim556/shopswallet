<?php

namespace App\Models\service;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TimeSlot extends Model
{
    use HasFactory;
    protected $table = 'time_slots';


    public function category(){
       return $this->belongsTo(Category::class,'category_id','id');
    }
}
