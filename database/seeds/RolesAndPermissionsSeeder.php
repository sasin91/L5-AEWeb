<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\PermissionRegistrar;

class RolesAndPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @param PermissionRegistrar $permissionRegistrar
     * @return void
     */
    public function run(PermissionRegistrar $permissionRegistrar)
    {
        $permissionRegistrar->forgetCachedPermissions();

        $permissionModel = $permissionRegistrar->getPermissionClass();
        $roleModel = $permissionRegistrar->getRoleClass();

        $this->createPlayer($roleModel, $permissionModel);

        $this->createForumModerator($roleModel, $permissionModel);

        $this->createAdmin($roleModel, $permissionModel);

        $this->createSuperAdmin($roleModel, $permissionModel);
    }

    public function createPlayer($roleModel, $permissionModel)
    {
        $player = $roleModel::create(['name' => 'Player']);
        $player->givePermissionTo([
            $permissionModel::create(['name' => 'list forum categories']),
            $permissionModel::create(['name' => 'list forum topics']),
            $permissionModel::create(['name' => 'create forum topics'])
        ]);
    }

    public function createAdmin($roleModel, $permissionModel)
    {
        $admin = $roleModel::create(['name' => 'Admin']);
        $admin->givePermissionTo([
            $permissionModel::create(['name' => 'restore actions']),
            $permissionModel::create(['name' => 'delete actions']),
            $permissionModel::create(['name' => 'list actions']),
            $permissionModel::create(['name' => 'view actions']),
            $permissionModel::create(['name' => 'create game servers']),
            $permissionModel::create(['name' => 'edit game servers']),
            $permissionModel::create(['name' => 'delete game servers']),
            $permissionModel::create(['name' => 'restore deleted game servers']),
            $permissionModel::create(['name' => 'force delete game servers'])
        ]);
    }

    public function createSuperAdmin($roleModel, $permissionModel)
    {
        $superAdmin = $roleModel::create(['name' => 'Super Admin']);
        // Super admin bypasses authorization, so no need to assign permissions.
        // @see App\Providers\AuthServiceProvider@boot
    }

    public function createForumModerator($roleModel, $permissionModel)
    {
        $forumModerator = $roleModel::create(['name' => 'Forum moderator']);
        $forumModerator->givePermissionTo([
            $permissionModel::create(['name' => 'create forum categories']),
            $permissionModel::create(['name' => 'edit forum categories']),
            $permissionModel::create(['name' => 'delete forum categories']),

            $permissionModel::create(['name' => 'edit forum topics']),
            $permissionModel::create(['name' => 'lock forum topics']),
            $permissionModel::create(['name' => 'delete forum topics'])
        ]);
    }
}
