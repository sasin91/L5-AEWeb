<?php

namespace Tests\Feature;

use App\Account;
use App\Enums\AccountFlag;
use App\Server;
use App\ServerStrategy;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Tests\ImportsAscEmuDatabases;
use Tests\TestCase;

class RegistrationTest extends TestCase
{
    use RefreshDatabase, ImportsAscEmuDatabases, WithFaker;

    protected $connectionsToTransact = [
        'ascemu_logon',
        'mysql'
    ];

    /**
     * Setup the test environment.
     *
     * @return void
     */
    protected function setUp(): void
    {
        parent::setUp();

        resolve(\RolesAndPermissionsSeeder::class)->createPlayer(
            new Role,
            new Permission
        );
    }

    public function testUserNameCannotContainSpaces()
    {
        $this
            ->postJson('/register', $this->validParams([
                'name' => 'john doe'
            ]))
            ->assertJsonValidationErrors('name');
    }

    public function testNamecannotExceed40CharactersLength()
    {
        $this
            ->postJson('/register', $this->validParams([
                'name' => str_repeat('A', 41)
            ]))
            ->assertJsonValidationErrors('name');
    }

    public function testItRegistersGameAccounts()
    {
        $this->importAscEmuLogonDatabase();

        $this
            ->postJson('/register', $this->validParams([
                'email' => $email = $this->faker()->safeEmail,
                'name' => $name = $this->faker()->firstname
            ]))
            ->assertRedirect('/home');

        $user = User::query()->where([
            'email' => $email,
            'name' => $name
        ])->firstOrFail();

        $account = Account::query()->where([
            'email' => $email,
            'acc_name' => $name,
            'flags' => AccountFlag::DEFAULT
        ])->firstOrFail();

        $this->assertDatabaseHas('actions', [
            'creator_id' => $user->id,
            'actionable_type' => Account::class,
            'actionable_id' => $account->id,
            // 'actionable_attributes' => '{"email": $email, "acc_name": $name}'
        ]);
    }

    public function testItAssignsPlayerRoleToTheUser()
    {
        $this->importAscEmuLogonDatabase();

        $this
            ->postJson('/register', $this->validParams([
                'email' => $email = $this->faker()->safeEmail,
                'name' => $name = $this->faker()->firstname
            ]))
            ->assertRedirect('/home');

        $user = User::query()->where([
            'email' => $email,
            'name' => $name
        ])->firstOrFail();

        $this->assertTrue(
            $user->hasRole('Player'),
            'User was not assigned Player role.'
        );
    }

    public function validParams(array $overrides = [])
    {
        return array_merge([
            'name' => $this->faker()->firstname,
            'email' => $this->faker()->safeEmail,
            'password' => 'superSecretPassword',
            'password_confirmation' => 'superSecretPassword'
        ], $overrides);
    }
}
