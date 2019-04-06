<?php

namespace Tests\Feature\Action;

use App\Action;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ListingActionsTest extends TestCase
{
    use RefreshDatabase;

    public function testItListsTheLatestActions()
    {
        $actions = factory(Action::class, 3)->create();

        $response = $this
            ->actingAs(factory(User::class)->state('super admin')->create())
            ->get('actions')
            ->assertSuccessful()
            ->assertViewIs('actions.index')
            ->assertViewHas('actions');

        tap($response->viewData('actions'), function ($paginator) use ($actions) {
            foreach ($paginator->getCollection() as $model) {
                $this->assertTrue($actions->contains($model), "Action[{$model->id}] not found in view data.");
            }
        });
    }

    public function testCannotListActionsWithoutPermission()
    {
        $permissionModel = config('permission.models.permission', \Spatie\Permission\Models\Permission::class);
        $permissionModel::create(['name' => 'list actions']);

        $this
            ->actingAs(factory(User::class)->create())
            ->get('actions')
            ->assertStatus(403);
    }
}
