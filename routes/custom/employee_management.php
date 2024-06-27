<?php

use App\Http\Controllers\Admin\EmployeeManagementController;
use App\Http\Controllers\Admin\EmployeeRoleController;
use Illuminate\Support\Facades\Route;



Route::prefix('employee')->name('employee.')->group(function(){
    Route::controller(EmployeeManagementController::class)->group(function(){
        Route::get('/employee-list','employeeList')->name('employeeList');
    });

    Route::controller(EmployeeRoleController::class)->group(function(){
        Route::get('/employee-role-list','employeeRoleList')->name('employeeRoleList');
        Route::post('/employee-role-add','employeeRoleAdd')->name('employeeRoleAdd');
    });
});