<?php

use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\Service\TimeSlotController;
use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'service', 'as' => 'service.', 'middleware' => ['module:service']], function () {
    Route::resource('/city',CityController::class);
    Route::get('city/status/{id}/{status}',[CityController::class,'status'])->name('city.status');

    //time and slot
    Route::resource('/time-and-slot',TimeSlotController::class);
    Route::controller(TimeSlotController::class)->prefix('time-and-slot')->name('time-and-slot.')->group(function(){
        Route::get('status/change/{id}/{status}','status')->name('changeStatus');
    });
});