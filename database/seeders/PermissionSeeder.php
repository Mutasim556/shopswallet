<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // creating permission for users
        Permission::create(['guard_name'=>'admin','name'=>'role-index','group_name'=>'Role Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'role-create','group_name'=>'Role Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'role-update','group_name'=>'Role Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'role-delete','group_name'=>'Role Permissions']);

    }
}
