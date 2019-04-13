<?php

namespace App\Actions;

use App\Concerns\Executable;
use App\Contracts\Action as ActionContract;
use App\GameServer;
use Illuminate\Support\Facades\Auth;

class CreateGameServer implements ActionContract
{
    use Executable;

    public $creator_id;
    public $realm_id;
    public $name;
    public $description;
    public $address;
    public $port;
    public $version;

    /**
     * Create a new CreateGameServer Action.

     * @param  array $attributes
     * @return void
     */
    public function __construct(array $attributes)
    {
        if (! array_key_exists('creator_id', $attributes)) {
            $this->creator_id = Auth::id();
        }

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
     * @return mixed
     */
    public function run()
    {
        return GameServer::query()->create([
            'creator_id' => $this->creator_id,
            'realm_id' => $this->realm_id,
            'name' => $this->name,
            'description' => $this->description,
            'address' => $this->address,
            'port' => $this->port,
            'version' => $this->version
        ]);
    }
}
