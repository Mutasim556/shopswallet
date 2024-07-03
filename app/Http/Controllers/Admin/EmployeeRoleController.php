<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateRoleRequest;
use Brian2694\Toastr\Facades\Toastr;
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

    public function employeeRoleAdd(CreateRoleRequest $data){
        $create = $data->insert();
        Toastr::success(translate('messages.role_added_successfully'));
        return response($create,200);
    }

    public function employeeRoleEdit(String $id){
        $role = Role::findOrFail($id);
        $permissions = Permission::all()->groupBy('group_name');
        $rolePermissions = $role->permissions;
        $rolePermissions = $rolePermissions->pluck('name')->toArray();
        // dd($rolePermissions);
        return response([
            'role'=>$role,
            'permissions'=>$permissions,
            'rolePermissions'=>$rolePermissions,
        ],200);
    }

    public function employeeRoleUpdate(Request $data){
        $data->validate([
            'role_name' => 'required|max:55|unique:roles,name,'.$data->role_id,
        ]);

        $role = Role::findOrFail($data->role_id);
        $role->update(['guard_name' => 'admin', 'name' => $data->role_name]);
        $role->syncPermissions($data->permissions);
        $rolePermissions = $role->permissions;
        $rolePermissions = $rolePermissions->pluck('name')->toArray();
        return response([
            'role' => $role,
            'rolePermissions' => $rolePermissions,
            'title'=>translate('Congratulations !'),
            'text'=>translate('Role-permission updated successfully'),
            'confirmButtonText'=>translate('Ok'),
        ]);
    }

    public function employeeRoleDelete(String $id){
        $role = Role::findOrFail($id);
        if($role->name==='Master admin'){
            Toastr::error(translate('messages.cand delete role'));
            return back();
        }
        $role->delete();
        Toastr::success(translate('messages.role_deleted_successfully'));
        return back();
    }
}
