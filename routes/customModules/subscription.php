<?php

use App\Http\Controllers\CustomModule\Subscription\SubscriptionCreateController;
use App\Http\Controllers\CustomModule\Subscription\VendorSubscriptionController;
use Illuminate\Support\Facades\Route;

/** Admin Routes */
Route::prefix('admin')->name('subscription.')->group(function(){
    // Route::resource('packages',SubscriptionCreateController::class)->except('index');
    Route::controller(SubscriptionCreateController::class)->prefix('packages')->name('packages.')->group(function(){
        Route::get('/index/{id?}','index')->name('index');
        Route::post('/store','store')->name('store');
        Route::put('/update/{id}','update')->name('update');
        Route::delete('/delete/{id}','destroy')->name('delete');
        Route::get('/status/{status}/{id}','status')->name('status');
        //purchase request
        Route::get('/purchase-request','purchaserequest')->name('purchaserequest');
        Route::post('/purchase-request','purchaserequestApprove')->name('purchaserequest');
    });
});

/** Vendor Routes */

Route::prefix('vendor')->name('subscription.vendor.')->group(function(){
   Route::controller(VendorSubscriptionController::class)->prefix('packages')->name('packages.')->group(function(){
        Route::get('/','index')->name('index');
        Route::get('/start-free-trail/{package_id?}','freetrail')->name('freetrail');
        Route::get('/purchase-list','list')->name('list');
        Route::post('/purchase-package','purchasepackage')->name('purchasepackage');
   }); 
});
