<?php

namespace App\Http\Controllers\Admin;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rules\Password;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class EmployeeManagementController extends Controller
{
    public function employeeList(Request $data) : View {
        $key = explode(' ', $data['search']);
        $employees=Admin::zone()
        ->where(function ($q) use ($key) {
            foreach ($key as $value) {
                $q->orWhere('f_name', 'like', "%{$value}%");
                $q->orWhere('l_name', 'like', "%{$value}%");
                $q->orWhere('phone', 'like', "%{$value}%");
                $q->orWhere('email', 'like', "%{$value}%");
            }
        })->latest()->paginate(config('default_pagination'));

        $roles = Role::all();
        return view('admin-views.employee-management.employee_list',compact('employees','roles'));
    }


    public function employeeStore(Request $request){
        $request->validate([
            'f_name' => 'required',
            'l_name' => 'nullable|max:100',
            'role_id' => 'required',
            'image' => 'required',
            'email' => 'required|unique:admins',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:20|unique:admins',
            'password' => ['required', Password::min(8)->mixedCase()->letters()->numbers()->symbols()->uncompromised()],

        ]);

        // if ($request->role_id == 1) {
        //     Toastr::warning(translate('messages.access_denied'));
        //     return back();
        // }
        $admin = new Admin();
        $admin->f_name = $request->f_name;
        $admin->l_name = $request->l_name;
        $admin->phone = $request->phone;
        $admin->zone_id = $request->zone_id;
        $admin->email = $request->email;
        $admin->password = bcrypt($request->password);
        $admin->image = Helpers::upload('admin/', 'png', $request->file('image'));
        $admin->created_at = now();
        $admin->updated_at = now();
        $admin->role_id=1;
        $admin->save();
        $admin->assignRole($request->role_id);

        Toastr::success(translate('messages.employee_added_successfully'));
        return redirect()->route('admin.business-settings.employee.employeeList');
    }


    public function edit(String $id){
        $user = Admin::findOrFail($id);
        $role = $user->getRoleNames()->first();

        return response([
            'user'=>$user,
            'role'=>$role,
        ]);
    }


    public function update(Request $data){
        $data->validate([
            'f_name' => 'required',
            'l_name' => 'nullable|max:100',
            'role_id' => 'required',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:20|unique:admins,phone,'.$data->user_id,
        ]);
        
        $update = Admin::where('id',$data->user_id)->update([
            'f_name' => $data->f_name,
            'l_name' => $data->l_name,
            'phone' => $data->phone,
            'zone_id' => $data->zone_id,
            'updated_at' => now(),
        ]);
        $user = Admin::findOrFail($data->user_id);
        $user->syncRoles($data->role_id);

        
        if($update){
            $role = $user->getRoleNames()->first();
            return back();
        }else{
            return back();
        }
    }

    public function destroy(String $id){
        Admin::where('id',$id)->delete();
        Toastr::success(translate('messages.employee_deleted_successfully'));
        return redirect()->route('admin.business-settings.employee.employeeList');
    }


    public function employeePermission(String $id){
        $user = Admin::findOrFail($id);
        $permissions = Permission::all()->groupBy('group_name');
        $userPermissions = $user->permissions;
        $userPermissions = $user->permissions->pluck('name')->toArray();;
        return response([
            'user'=>$user,
            'permissions'=>$permissions,
            'userPermissions'=>$userPermissions,
        ]);
    }

    public function giveUserPermission(Request $data){
        
        $user = Admin::findOrFail($data->user_id);
        $user->syncPermissions($data->permissions);

        Toastr::success(translate('messages.permission_sync_successfully'));
        return redirect()->back();
        
    }

   
}
