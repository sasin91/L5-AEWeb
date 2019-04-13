<?php

namespace Tests\__Fixtures__\Actions;

use App\Contracts\Action as ActionContract;
use IteratorAggregate;

class FakeAction implements ActionContract
{
    public function __construct(array $attributes)
    {
        foreach ($attributes as $key => $value) {
            $this->$key = $value;
        }
    }

    /**
     * Get the array of attributes for the action
     *
     * @return array
     */
    public function attributes(): array
    {
        return get_object_vars($this);
    }

    /**
     * Execute the command
     *
     * @return void
     */
    public function run()
    {
        //
    }
}
