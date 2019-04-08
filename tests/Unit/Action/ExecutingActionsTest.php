<?php

namespace Tests\Unit\Action;

use App\Action;
use App\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Tests\__Fixtures__\Actions\FakeAction;

class ExecutingActionsTest extends TestCase
{
    use RefreshDatabase;

    public function testItStoresTheActionInTheActionsTable()
    {
        $this->be($actionable = factory(User::class)->create());

        $action = new FakeAction($attributes = [
            'bar' => 'baz',
            'foo' => 'bar'
        ]);
        
        $actionModel = Action::execute($action, $actionable);

        $this->assertDatabaseHas('actions', [
            'id' => $actionModel->id,
            'creator_id' => $actionable->id,
            'actionable_type' => null,
            'actionable_id' => null,
            // 'actionable_attributes' => '{"bar": "baz", "foo": "bar"}'
        ]);

        $this->assertEquals($attributes, $actionModel->actionable_attributes);
    }
}
