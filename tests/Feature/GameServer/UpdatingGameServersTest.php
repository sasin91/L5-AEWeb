<?php

namespace Tests\Feature\GameServer;

use App\GameServer;
use App\Realm;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Spatie\Permission\Models\Permission;
use Tests\TestCase;

class UpdatingGameServersTest extends TestCase
{
    use RefreshDatabase, WithFaker;

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
            Permission::create(['name' => 'edit game servers'])
        );
    }

    public function testUserWithoutPermissionCannotUpdate()
    {
        $this
            ->actingAs(factory(User::class)->create())
            ->patch($this->url)
            ->assertStatus(403);
    }

    public function testGuestCannotUpdate()
    {
        $this
            ->assertGuest()
            ->patch($this->url)
            ->assertRedirect('/login');
    }

    public function testItUpdatesWhenTheUserHasPermission()
    {
        $newRealm = factory(Realm::class)->create();

        $this
            ->actingAs($this->userWithPermission)
            ->patch($this->url, [
                'realm_id' => $newRealm->id,
                'name' => 'Super duper fly',
                'description' => 'Another AscEmu server (tm)',
                'address' => '172.16.0.14',
                'port' => 6652,
                'version' => $newVersion = $this->faker()->randomElement($this->gameServer::$supportedVersions)
            ]);

        $this->assertDatabaseHas('game_servers', [
            'realm_id' => $newRealm->id,
            'name' => 'Super duper fly',
            'description' => 'Another AscEmu server (tm)',
            'address' => '172.16.0.14',
            'port' => 6652,
            'version' => $newVersion
        ]);
    }

    public function testValidationFailsIfRealmIdDoesntExist()
    {
        $this
            ->actingAs($this->userWithPermission)
            ->patchJson($this->url, ['realm_id' => 9999])
            ->assertJsonValidationErrors('realm_id')
            ->assertSee(trans('validation.exists', ['attribute' => 'realm id']));
    }

    public function testValidationFailsIfNameAlreadyExists()
    {
        $existingGameServer = factory(GameServer::class)->create();

        $this
            ->actingAs($this->userWithPermission)
            ->patchJson($this->url, ['name' => $existingGameServer->name])
            ->assertJsonValidationErrors('name')
            ->assertSee(trans('validation.unique', ['attribute' => 'name']));
    }

    public function testValidationFailsIfNameIsLongerThan255Characters()
    {
        $this
            ->actingAs($this->userWithPermission)
            ->patchJson($this->url, ['name' => str_repeat('A', 256)])
            ->assertJsonValidationErrors('name')
            ->assertSee(trans('validation.max.string', ['attribute' => 'name', 'max' => 255]));
    }

    public function testValidationFailsIfANumericAddressIsGivenAndItsNotAValidIPAddress()
    {
        $this
            ->actingAs($this->userWithPermission)
            ->patchJson($this->url, ['address' => '12435'])
            ->assertJsonValidationErrors('address')
            ->assertSee(trans('validation.ip', ['attribute' => 'address']));
    }

    public function testValidationFailsIfPortIsNotANumber()
    {
        $this
            ->actingAs($this->userWithPermission)
            ->patchJson($this->url, ['port' => 'abc'])
            ->assertJsonValidationErrors('port')
            ->assertSee(trans('validation.numeric', ['attribute' => 'port']));
    }

    public function testValidationFailsIfPortIsLongerThan6Digits()
    {
        $this
            ->actingAs($this->userWithPermission)
            ->patchJson($this->url, ['port' => '1243567'])
            ->assertJsonValidationErrors('port')
            ->assertSee(trans('validation.digits_between', ['attribute' => 'port', 'min' => 1, 'max' => 6]));
    }

    public function testTheVersionMustBeSupported()
    {
        $this
            ->actingAs($this->userWithPermission)
            ->patchJson($this->url, ['version' => '9.9.9'])
            ->assertJsonValidationErrors('version')
            ->assertSee(trans('validation.in', ['attribute' => 'version']));
    }
}
