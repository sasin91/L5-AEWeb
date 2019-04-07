<?php

namespace App\Concerns;

use App\Action;
use Illuminate\Database\Eloquent\Model;

trait Executable
{
    /**
     * Execute this action
     *
     * @param  mixed  ...$attributes
     * @return Action
     */
    public static function execute(...$attributes): Action
    {
        return Action::execute(
            new static(...$attributes)
        );
    }
}
