<?php

namespace App\Http\Controllers;

use App\Action;
use App\Actions\CreateGameServer;
use App\Actions\DeleteGameServer;
use App\Actions\UpdateGameServer;
use App\GameServer;
use App\Http\Requests\StoreGameServerRequest;
use App\Http\Requests\UpdateGameServerRequest;
use Illuminate\Http\Request;

class GameServerController extends Controller
{

    /**
     * Creat a new GameServerController instance
     */
    public function __construct()
    {
        $this->authorizeResource(GameServer::class);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('gameServers.index')
            ->with(
                'gameServers',
                GameServer::query()
                    ->latest()
                    ->paginate()
            );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('gameServers.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  StoreGameServerRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreGameServerRequest $request)
    {
        $action = CreateGameServer::execute($request->validated());

        flash()->success(__('Game server created.'));

        return redirect()->route('game-servers.show', $action->actionable);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\GameServer  $gameServer
     * @return \Illuminate\Http\Response
     */
    public function show(GameServer $gameServer)
    {
        return view('gameServers.show')->with('gameServer', $gameServer);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\GameServer  $gameServer
     * @return \Illuminate\Http\Response
     */
    public function edit(GameServer $gameServer)
    {
        return view('gameServers.edit')->with('gameServer', $gameServer);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\GameServer  $gameServer
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateGameServerRequest $request, GameServer $gameServer)
    {
        Action::execute(
            new UpdateGameServer($gameServer, $request->validated())
        );

        $gameServer->update($request->validated());

        flash()->success(__('Game server updated.'));

        return redirect()->route('game-servers.show', $gameServer);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\GameServer  $gameServer
     * @return \Illuminate\Http\Response
     */
    public function destroy(GameServer $gameServer)
    {
        DeleteGameServer::execute($gameServer);

        flash()->success(__('Game server deleted.'));

        return redirect()->route('game-servers.index');
    }
}
