<?php

namespace App\Contracts;

interface Action
{
    /**
     * Execute the command
     *
     * @return void
     */
    public function run();

    /**
     * Get the array of attributes for the action
     *
     * @return array
     */
    public function attributes(): array;
}
