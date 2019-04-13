<?php

namespace App\Actions;

use App\Concerns\Executable;
use App\Contracts\Action as ActionContract;
use App\GameServer;

class UpdateGameServer implements ActionContract
{
    use Executable;

    private $gameServer;
    public $attributes;

    /**
     * Create a new UpdateGameServer Action.
     *
     * @param  GameServer $gameServer
     * @param  array $attributes
     * @return void
     */
    public function __construct(GameServer $gameServer, array $attributes)
    {
        $this->gameServer = $gameServer;
        $this->attributes = $attributes;
    }

    /**
     * Get the array of attributes for the action
     *
     * @return array
     */
    public function attributes(): array
    {
        return $this->attributes;
    }

    /**
     * Execute the command
     *
     * @return mixed
     */
    public function run()
    {
        $this->gameServer->update($this->attributes);

        return $this->gameServer;
    }
}
