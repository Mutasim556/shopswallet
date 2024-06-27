<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class EmployeeManagementController extends Controller
{
    public function employeeList(Request $data) : View {
        $key = explode(' ', $data['search']);
        $employee=Admin::zone()->where('role_id', '!=','1')
        ->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%");
                $q->orWhere('l_name', 'like', "%{$value}%");
                $q->orWhere('phone', 'like', "%{$value}%");
                $q->orWhere('email', 'like', "%{$value}%");
            }
        })->latest()->paginate(config('default_pagination'));

        return view('admin-views.employee-management.employee_list',compact('employee'));
    }

   
}
