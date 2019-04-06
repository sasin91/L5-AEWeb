<?php

namespace Tests\Feature\Action;

use App\Action;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ShowingActionTest extends TestCase
{
    use RefreshDatabase;

    public function testTheCreatorCanViewAnAction()
    {
        $this->be($user = factory(User::class)->create());

        $action = factory(Action::class)->create(['creator_id' => $user->id]);

        $this
            ->get($action->link)
            ->assertSuccessful()
            ->assertViewIs('actions.show')
            ->assertViewHas('action', $action);
    }

    public function testUserWithPermissionToViewActionsCanSeeIt()
    {
        $this->be($user = factory(User::class)->create());

        $permissionModel = config('permission.models.permission', \Spatie\Permission\Models\Permission::class);
        $user->givePermissionTo(
            $permissionModel::firstOrCreate(['name' => 'view actions'])
        );

        $action = factory(Action::class)->create(['creator_id' => $user->id]);

        $this
            ->get($action->link)
            ->assertSuccessful()
            ->assertViewIs('actions.show')
            ->assertViewHas('action', $action);
    }

    public function testSuperAdminCanViewAnAction()
    {
        $this->be($user = factory(User::class)->state('super admin')->create());

        $action = factory(Action::class)->create(['creator_id' => $user->id]);

        $this
            ->get($action->link)
            ->assertSuccessful()
            ->assertViewIs('actions.show')
            ->assertViewHas('action', $action);
    }

    public function testCannotSeeAnActionWithoutPermission()
    {
        $permissionModel = config('permission.models.permission', \Spatie\Permission\Models\Permission::class);
        $permissionModel::firstOrCreate(['name' => 'view actions']);

        $action = factory(Action::class)->create();

        $this
            ->actingAs(factory(User::class)->create())
            ->get($action->link)
            ->assertStatus(403);
    }
}
