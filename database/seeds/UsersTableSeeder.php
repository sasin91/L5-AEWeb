<?php

use App\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Role::query()->each(function ($role) {
        	$user = factory(User::class)->create([
        		'name' => $role->name,
        		'email' => "{$role->name}@example.com"
        	]);

        	$user->assignRole($role);
        });
    }
}
