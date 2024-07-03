<?php

use App\Http\Controllers\Admin\EmployeeManagementController;
use App\Http\Controllers\Admin\EmployeeRoleController;
use Illuminate\Support\Facades\Route;



Route::prefix('employee')->name('employee.')->group(function(){
    Route::controller(EmployeeManagementController::class)->group(function(){
        Route::get('/employee-list','employeeList')->name('employeeList');
        Route::post('/employee-add','employeeStore')->name('employeeStore');
    });

    Route::controller(EmployeeRoleController::class)->group(function(){
        Route::get('/employee-role-list','employeeRoleList')->name('employeeRoleList');
        Route::post('/employee-role-add','employeeRoleAdd')->name('employeeRoleAdd');
        Route::get('/employee-role-edit/{id?}','employeeRoleEdit')->name('employeeRoleEdit');
        Route::post('/employee-role-edit','employeeRoleUpdate')->name('employeeRoleUpdate');
        Route::delete('/employee-role-edit/{id}','employeeRoleDelete')->name('employeeRoleDelete');
    });
});