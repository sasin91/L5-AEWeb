<?php

use App\GameServer;
use App\Realm;
use App\User;
use Faker\Generator as Faker;

$factory->define(GameServer::class, function (Faker $faker) {
    return [
        'creator_id' => factory(User::class),
        'realm_id' => factory(Realm::class),
        'name' => $faker->bs,
        'description' => $faker->paragraph,
        'address' => '127.0.0.1',
        'port' => 3724,
        'version' => $faker->randomElement(GameServer::$supportedVersions),
    ];
});
