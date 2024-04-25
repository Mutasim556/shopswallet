<?php

use App\Http\Controllers\CustomModule\Subscription\SubscriptionCreateController;
use Illuminate\Support\Facades\Route;

Route::name('subscription.')->group(function(){
    Route::resource('packages',SubscriptionCreateController::class);
});
