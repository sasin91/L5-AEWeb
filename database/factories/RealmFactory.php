<?php

use App\Realm;
use Faker\Generator as Faker;

$factory->define(Realm::class, function (Faker $faker) {
    return [
    	'id' => Realm::max('id') +1,
		'password' => 'change_me_logon',
		'status' => $faker->boolean(),
		'status_change_time' => $faker->dateTime
    ];
});
