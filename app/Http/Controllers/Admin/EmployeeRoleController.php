<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class EmployeeRoleController extends Controller
{
    public function employeeRoleList() : View {
        $roles = Role::latest()->paginate(config('default_pagination'));
        $permissions = Permission::all()->groupBy('group_name');
        return view('admin-views.employee-management.employee_role_list',compact('roles','permissions'));
    }
}
