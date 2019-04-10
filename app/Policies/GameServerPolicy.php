<?php

namespace App\Policies;

use App\User;
use App\GameServer;
use Illuminate\Auth\Access\HandlesAuthorization;

class GameServerPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the game server.
     *
     * @param  \App\User  $user
     * @param  \App\GameServer  $gameServer
     * @return mixed
     */
    public function view(User $user, GameServer $gameServer)
    {
        return true;
    }

    /**
     * Determine whether the user can create game servers.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return $user->hasPermissionTo('create game servers');
    }

    /**
     * Determine whether the user can update the game server.
     *
     * @param  \App\User  $user
     * @param  \App\GameServer  $gameServer
     * @return mixed
     */
    public function update(User $user, GameServer $gameServer)
    {
        return $user->hasPermissionTo('edit game servers');
            // && $gameServer->creator->is($user);
    }

    /**
     * Determine whether the user can delete the game server.
     *
     * @param  \App\User  $user
     * @param  \App\GameServer  $gameServer
     * @return mixed
     */
    public function delete(User $user, GameServer $gameServer)
    {
        return $user->hasPermissionTo('delete game servers');
            // && $gameServer->creator->is($user);
    }

    /**
     * Determine whether the user can restore the game server.
     *
     * @param  \App\User  $user
     * @param  \App\GameServer  $gameServer
     * @return mixed
     */
    public function restore(User $user, GameServer $gameServer)
    {
        return $user->hasPermissionTo('restore deleted game servers');
    }

    /**
     * Determine whether the user can permanently delete the game server.
     *
     * @param  \App\User  $user
     * @param  \App\GameServer  $gameServer
     * @return mixed
     */
    public function forceDelete(User $user, GameServer $gameServer)
    {
        return $user->hasPermissionTo('force delete game servers');
    }
}
