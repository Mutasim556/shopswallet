<?php

use App\Http\Controllers\Admin\EmployeeManagementController;
use App\Http\Controllers\Admin\EmployeeRoleController;
use Illuminate\Support\Facades\Route;



Route::prefix('employee')->name('employee.')->group(function(){
    Route::controller(EmployeeManagementController::class)->group(function(){
        Route::get('/employee-list','employeeList')->name('employeeList');
        Route::post('/employee-add','employeeStore')->name('employeeStore');
        Route::get('/employee-edit/{id}','edit')->name('employeeEdit');
        Route::post('/employee-update','update')->name('employeeUpdate');
        Route::delete('/employee-delete/{id}','destroy')->name('employeeDestroy');
        Route::get('/get-employee-with-permission/{id}','employeePermission')->name('employeePermission');
        Route::post('/employee-specific-permission','giveUserPermission')->name('giveUserPermission');
    });

    Route::controller(EmployeeRoleController::class)->group(function(){
        Route::get('/employee-role-list','employeeRoleList')->name('employeeRoleList');
        Route::post('/employee-role-add','employeeRoleAdd')->name('employeeRoleAdd');
        Route::get('/employee-role-edit/{id?}','employeeRoleEdit')->name('employeeRoleEdit');
        Route::post('/employee-role-edit','employeeRoleUpdate')->name('employeeRoleUpdate');
        Route::delete('/employee-role-delete/{id}','employeeRoleDelete')->name('employeeRoleDelete');
    });
});