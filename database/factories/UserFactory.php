<?php

use App\User;
use Illuminate\Support\Str;
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(User::class, function (Faker $faker) {
    return [
        'name' => $faker->name,
        'email' => $faker->unique()->safeEmail,
        'email_verified_at' => now(),
        'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
        'remember_token' => Str::random(10),
    ];
});

$factory->state(User::class, 'super admin', []);
$factory->afterCreatingState(User::class, 'super admin', function ($user) {
    $roleModel = config('permission.models.role', \Spatie\Permission\Models\Role::class);

    if (! $roleModel::where('name', 'Super Admin')->exists()) {
        $permissionModel = config('permission.models.permission', \Spatie\Permission\Models\Permission::class);

        resolve(RolesAndPermissionsSeeder::class)->createSuperAdmin($roleModel, $permissionModel);
    }

	$user->assignRole('Super Admin');
});