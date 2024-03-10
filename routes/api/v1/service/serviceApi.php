<?php

use App\Http\Controllers\Api\V1\Service\ServiceCategoryController;
use App\Http\Controllers\Api\V1\Service\VendorAuthController;
use Illuminate\Support\Facades\Route;

Route::get('servicePP',[ServiceCategoryController::class,'index']);

/** vendor auth  */
Route::controller(VendorAuthController::class)->prefix('service/vendor')->name('service.vendor.')->group(function(){
    Route::get('/get-zone-and-lang','getZoneAndLang'); 
    Route::post('/store','store'); 
});
