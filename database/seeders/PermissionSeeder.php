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
        // Permission::create(['guard_name'=>'admin','name'=>'role-index','group_name'=>'Role Permissions']);
        // Permission::create(['guard_name'=>'admin','name'=>'role-create','group_name'=>'Role Permissions']);
        // Permission::create(['guard_name'=>'admin','name'=>'role-update','group_name'=>'Role Permissions']);
        // Permission::create(['guard_name'=>'admin','name'=>'role-delete','group_name'=>'Role Permissions']);

        // creating permission for porduct grocery
        // Permission::create(['guard_name'=>'admin','name'=>'grocery-product-index','group_name'=>'Grocery Product Permissions']);
        // Permission::create(['guard_name'=>'admin','name'=>'grocery-product-create','group_name'=>'Grocery Product Permissions']);
        // Permission::create(['guard_name'=>'admin','name'=>'grocery-product-update','group_name'=>'Grocery Product Permissions']);
        // Permission::create(['guard_name'=>'admin','name'=>'grocery-product-delete','group_name'=>'Grocery Product Permissions']);

        Permission::create(['guard_name'=>'admin','name'=>'country-origin-index','group_name'=>'Grocery Country-Origin Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'country-origin-create','group_name'=>'Grocery Country-Origin Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'country-origin-update','group_name'=>'Grocery Country-Origin Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'country-origin-delete','group_name'=>'Grocery Country-Origin Permissions']);

        //grocery categories
        Permission::create(['guard_name'=>'admin','name'=>'country-origin-index','group_name'=>'Grocery Country-Origin Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'country-origin-create','group_name'=>'Grocery Country-Origin Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'country-origin-update','group_name'=>'Grocery Country-Origin Permissions']);
        Permission::create(['guard_name'=>'admin','name'=>'country-origin-delete','group_name'=>'Grocery Country-Origin Permissions']);

    }
}
