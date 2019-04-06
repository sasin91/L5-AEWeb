<?php

use App\Account;
use App\Action;
use App\User;
use Faker\Generator as Faker;

$factory->define(Action::class, function (Faker $faker) {
    return [
        'creator_id' => factory(User::class),
        'actionable_type' => User::class,
        'actionable_id' => factory(User::class),
        'actionable_attributes' => [],
        'executed_at' => now(),
        'class_name' => 'Fake Action'
    ];
});
