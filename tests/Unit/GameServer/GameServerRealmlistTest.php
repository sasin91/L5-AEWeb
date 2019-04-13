<?php

namespace Tests\Unit\GameServer;

use App\GameServer;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class GameServerRealmlistTest extends TestCase
{
    public function testTheRealmlistConsistsOfAddressAndPort()
    {
        $gameServer = new GameServer([
            'address' => '127.0.0.1',
            'port' => 3724
        ]);

        $this->assertEquals('127.0.0.1', $gameServer->realmlist);
    }

    public function itIncludesThePortInRealmlistWhenItsNotDefault()
    {
        $gameServer = new GameServer([
            'address' => '127.0.0.1',
            'port' => 6029
        ]);

        $this->assertEquals('127.0.0.1:6029', $gameServer->realmlist);
    }
}
