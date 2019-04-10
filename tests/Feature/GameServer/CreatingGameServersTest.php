<?php

namespace Tests\Feature\GameServer;

use App\Realm;
use App\User;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Arr;
use Spatie\Permission\Models\Permission;
use Tests\TestCase;

class CreatingGameServersTest extends TestCase
{
    use RefreshDatabase;

    protected $connectionsToTransact = [
        'ascemu_logon',
        'mysql'
    ];

    protected function setUp(): void
    {
        parent::setUp();

        $this->createGameServers = Permission::create(['name' => 'create game servers']);
    }

    public function testGuestCannotSeeTheCreateForm()
    {
        $this
            ->get('/game-servers/create')
            ->assertRedirect('/login');
    }

    public function testCannotSeeTheCreateFormWithoutPermission()
    {
        $this
            ->actingAs(factory(User::class)->create())
            ->get('/game-servers/create')
            ->assertStatus(403);
    }

    public function testAnyUserWithThePermissionGrantedCanSeeTheCreateForm()
    {
        $user = factory(User::class)->create();
        $user->givePermissionTo(
            $this->createGameServers
        );

        $this
            ->actingAs($user)
            ->get('/game-servers/create')
            ->assertSuccessful()
            ->assertViewIs('gameServers.create');
    }
}
