<?php

namespace Tests\Feature\GameServer;

use App\GameServer;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ListingGameServersTest extends TestCase
{
    use RefreshDatabase;

    protected $connectionsToTransact = [
        'ascemu_logon',
        'mysql'
    ];

    public function testItListsTheLatestServers()
    {
        $gameServers = factory(GameServer::class, 3)->create();

        $response = $this
            ->get('/game-servers')
            ->assertSuccessful()
            ->assertViewIs('gameServers.index');

        $data = $response->viewData('gameServers')->getCollection();

        foreach ($gameServers as $index => $gameServer) {
            $this->assertTrue(
                $gameServer->is($data[$index])
            );
        }
    }
}
