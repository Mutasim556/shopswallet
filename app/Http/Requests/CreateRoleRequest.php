<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;

class CreateRoleRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {

        return [
            'role_name'=>'required|unique:roles,name',
        ];
    }

    public function messages()
    {
        return[
            'role_name.required'=>translate('Role name is required'),
            'role_name.unique'=>translate('Role name must be unique'),
        ];
    }

    public function insert(){
        $role = Role::create(['guard_name' => 'admin', 'name' => $this->role_name]);
        $role->syncPermissions($this->permissions);
        return ([
            'role'=>$role,
            'permissions' => DB::table('role_has_permissions')->join('permissions','role_has_permissions.permission_id','permissions.id')->where('role_id',$role->id)->select('permissions.name')->get(),
            'title'=>__('admin_local.Congratulations !'),
            'text'=>__('admin_local.User created successfully'),
            'confirmButtonText'=>__('admin_local.Ok'),
            'hasAnyPermission' => hasPermission(['user-update','user-delete']),
            'hasEditPermission' => hasPermission(['user-update']),
            'hasDeletePermission' => hasPermission(['user-delete']),
        ]);
    }
}
