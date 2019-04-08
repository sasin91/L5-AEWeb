<?php

use App\Enums\AccountFlag;
use App\Hashing\Sha1Hasher;
use Faker\Generator as Faker;

$factory->define(App\Account::class, function (Faker $faker) {
    return [
        'acc_name' => $firstName = $faker->firstName,
        'encrypted_password' => (new Sha1Hasher)->make('password', ['name' => $firstName]),
        'banned' => 0,
        'lastlogin' => null,
        'lastip' => '127.0.0.1',
        'email' => $faker->safeEmail,
        'flags' => AccountFlag::DEFAULT,
        'forceLanguage' => 'enUS',
        'muted' => 0,
        'banreason' => null,
        'joindate' => now()
    ];
});
