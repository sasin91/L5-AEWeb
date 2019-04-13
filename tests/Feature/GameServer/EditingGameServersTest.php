<?php

namespace Tests\Feature\GameServer;

use App\GameServer;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Spatie\Permission\Models\Permission;
use Tests\TestCase;

class EditingGameServersTest extends TestCase
{
    use RefreshDatabase;

    protected $connectionsToTransact = [
        'ascemu_logon',
        'mysql'
    ];

    protected $editGameServer;
    protected $gameServer;

    protected function setUp(): void
    {
        parent::setUp();

        $this->editGameServer = Permission::create(['name' => 'edit game servers']);
        $this->gameServer = factory(GameServer::class)->create();
    }

    public function testGuestCannotSeeTheEditForm()
    {
        $this
            ->get("/game-servers/{$this->gameServer->id}/edit")
            ->assertRedirect('/login');
    }

    public function testCannotSeeTheCreateFormWithoutPermission()
    {
        $this
            ->actingAs(factory(User::class)->create())
            ->get("/game-servers/{$this->gameServer->id}/edit")
            ->assertStatus(403);
    }

    public function testAnyUserWithThePermissionGrantedCanSeeTheCreateForm()
    {
        $user = factory(User::class)->create();
        $user->givePermissionTo(
            $this->editGameServer
        );

        $this
            ->actingAs($user)
            ->get("/game-servers/{$this->gameServer->id}/edit")
            ->assertSuccessful()
            ->assertViewIs('gameServers.edit');
    }
}
