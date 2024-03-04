<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('admins')->insert([
            'f_name' => 'Mutasim',
            'l_name' => 'Naib',
            'phone' => '01724698392',
            'email' => 'mutasim@gmail.com',
            'image' => 'def.png',
            'password' => Hash::make(123456),
            'remember_token' =>Str::random(10),
            'created_at'=>now(),
            'updated_at'=>now(),
            'role_id'=>1
        ]);
    }
}
