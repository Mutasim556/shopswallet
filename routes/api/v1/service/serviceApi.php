<?php

use App\Http\Controllers\Api\V1\Service\ServiceCategoryController;
use Illuminate\Support\Facades\Route;

Route::get('servicePP',[ServiceCategoryController::class,'index']);