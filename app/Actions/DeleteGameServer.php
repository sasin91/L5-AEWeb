<?php

namespace App\Actions;

use App\Concerns\Executable;
use App\Contracts\Action as ActionContract;
use App\GameServer;

class DeleteGameServer implements ActionContract
{
    use Executable;

    private $gameServer;

    /**
     * Create a new DeleteGameServer Action.

     * @param GameServer $gameServer
     * @return void
     */
    public function __construct(GameServer $gameServer)
    {
        $this->gameServer = $gameServer;
    }

    /**
     * Get the array of attributes for the action
     *
     * @return array
     */
    public function attributes(): array
    {
        return [
            'id' => $this->gameServer->getKey()
        ];
    }

    /**
     * Execute the command
     *
     * @return mixed
     */
    public function run()
    {
        $this->gameServer->delete();

        return $this->gameServer;
    }
}
