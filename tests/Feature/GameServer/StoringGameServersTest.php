<?php

namespace Tests\Feature\GameServer;

use App\GameServer;
use App\Realm;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Spatie\Permission\Models\Permission;
use Tests\TestCase;

class StoringGameServersTest extends TestCase
{
    use RefreshDatabase;

    protected $authenticatedUser;

    protected $connectionsToTransact = [
        'ascemu_logon',
        'mysql'
    ];

    protected function setUp(): void
    {
        parent::setUp();

        $this->authenticatedUser = factory(User::class)->create();
        $this->authenticatedUser->givePermissionTo(
            Permission::create(['name' => 'create game servers'])
        );

        $this->be($this->authenticatedUser);
    }

    private function validParamsForCreate(array $overrides = [])
    {
        if (! array_key_exists('realm_id', $overrides)) {
            $overrides['realm_id'] = factory(Realm::class)->create()->id;
        }

        return array_merge([
            'name' => "Johny's phat server",
            'description' => 'Another AscEmu server (tm)',
            'address' => '127.0.0.1',
            'port' => '3724',
            'version' => '1.12.1'
        ], $overrides);
    }

    public function testItStoresTheNewGameServer()
    {
        $this
            ->post('/game-servers', $parameters = $this->validParamsForCreate())
            ->assertRedirect();

        $parameters['creator_id'] = $this->authenticatedUser->id;
        $this->assertDatabaseHas('game_servers', $parameters);
    }

    public function testValidationFailsIfRealmIdDoesntExist()
    {
        $this
            ->postJson('game-servers', $this->validParamsForCreate(['realm_id' => 9999]))
            ->assertJsonValidationErrors('realm_id')
            ->assertSee(trans('validation.exists', ['attribute' => 'realm id']));
    }

    public function testValidationFailsIfNameAlreadyExists()
    {
        $existingGameServer = factory(GameServer::class)->create();

        $this
            ->postJson('game-servers', $this->validParamsForCreate(['name' => $existingGameServer->name]))
            ->assertJsonValidationErrors('name')
            ->assertSee(trans('validation.unique', ['attribute' => 'name']));
    }

    public function testValidationFailsIfNameIsLongerThan255Characters()
    {
        $this
            ->postJson('game-servers', $this->validParamsForCreate(['name' => str_repeat('A', 256)]))
            ->assertJsonValidationErrors('name')
            ->assertSee(trans('validation.max.string', ['attribute' => 'name', 'max' => 255]));
    }

    public function testValidationFailsIfANumericAddressIsGivenAndItsNotAValidIPAddress()
    {
        $this
            ->postJson('game-servers', $this->validParamsForCreate(['address' => '12435']))
            ->assertJsonValidationErrors('address')
            ->assertSee(trans('validation.ip', ['attribute' => 'address']));
    }

    public function testValidationFailsIfPortIsNotANumber()
    {
        $this
            ->postJson('game-servers', $this->validParamsForCreate(['port' => 'abc']))
            ->assertJsonValidationErrors('port')
            ->assertSee(trans('validation.numeric', ['attribute' => 'port']));
    }

    public function testValidationFailsIfPortIsLongerThan6Digits()
    {
        $this
            ->postJson('game-servers', $this->validParamsForCreate(['port' => '1243567']))
            ->assertJsonValidationErrors('port')
            ->assertSee(trans('validation.digits_between', ['attribute' => 'port', 'min' => 1, 'max' => 6]));
    }

    public function testTheVersionMustBeSupported()
    {
        $this
            ->postJson('game-servers', $this->validParamsForCreate(['version' => '9.9.9']))
            ->assertJsonValidationErrors('version')
            ->assertSee(trans('validation.in', ['attribute' => 'version']));
    }
}
