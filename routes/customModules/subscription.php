<?php

use App\Http\Controllers\CustomModule\Subscription\SubscriptionCreateController;
use Illuminate\Support\Facades\Route;

Route::name('subscription.')->group(function(){
    // Route::resource('packages',SubscriptionCreateController::class)->except('index');
    Route::controller(SubscriptionCreateController::class)->prefix('packages')->name('packages.')->group(function(){
        Route::get('/index/{id?}','index')->name('index');
        Route::post('/store','store')->name('store');
        Route::put('/update/{id}','update')->name('update');
        Route::delete('/delete/{id}','destroy')->name('delete');
        Route::get('/status/{status}/{id}','status')->name('status');
    });
});
