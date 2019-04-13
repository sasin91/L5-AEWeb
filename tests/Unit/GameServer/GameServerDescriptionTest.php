<?php

namespace Tests\Unit\GameServer;

use App\GameServer;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class GameServerDescriptionTest extends TestCase
{
    public function testItParsesTheMarkdownInTheDescription()
    {
        $gameServer = new GameServer([
            'description' => '#hello world'
        ]);

        $this->assertEquals('<h1>hello world</h1>', (string)$gameServer->description);
    }
}
