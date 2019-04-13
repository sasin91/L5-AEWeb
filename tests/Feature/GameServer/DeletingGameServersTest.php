<?php

namespace Tests\Feature\GameServer;

use App\GameServer;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Spatie\Permission\Models\Permission;
use Tests\TestCase;

class DeletingGameServersTest extends TestCase
{
    use RefreshDatabase;

    protected $connectionsToTransact = [
        'ascemu_logon',
        'mysql'
    ];

    protected $userWithPermission;
    protected $gameServer;
    protected $url;

    protected function setUp(): void
    {
        parent::setUp();

        $this->gameServer = factory(GameServer::class)->create();
        // $this->url = route('game-servers.update', $this->gameServer);
        $this->url = "/game-servers/{$this->gameServer->id}";

        $this->userWithPermission = factory(User::class)->create();
        $this->userWithPermission->givePermissionTo(
            Permission::create(['name' => 'delete game servers'])
        );
    }

    public function testUserWithoutPermissionCannotDeleteAGameServer()
    {
        $this
            ->actingAs(factory(User::class)->create())
            ->delete($this->url)
            ->assertStatus(403);
    }

    public function testGuestCannotDeleteAGameServer()
    {
        $this
            ->assertGuest()
            ->delete($this->url)
            ->assertRedirect('/login');
    }

    public function testItSoftDeletesTheGameServer()
    {
        $this
            ->actingAs($this->userWithPermission)
            ->delete($this->url)
            ->assertRedirect(route('game-servers.index'));

        $this->assertSoftDeleted('game_servers', ['id' => $this->gameServer->id]);
    }
}
