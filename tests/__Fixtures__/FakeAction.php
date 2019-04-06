<?php

namespace Tests\__Fixtures__;

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
     * Execute the command
     *
     * @return void
     */
    public function run()
    {
        //
    }
}
