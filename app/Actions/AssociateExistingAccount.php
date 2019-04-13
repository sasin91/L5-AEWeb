<?php

namespace App\Actions;

use App\Account;
use App\Concerns\Executable;
use App\Contracts\Action as ActionContract;

class AssociateExistingAccount implements ActionContract
{
    use Executable;

    public $accountName;
    public $userId;

    /**
     * Create a new AssociateExistingAccount Action.
     *
     * @param string $accountNam
     * @param string $userId
     */
    public function __construct(string $accountName, $userId)
    {
        $this->accountName = $accountName;
        $this->userId = data_get($userId, 'id', $userId);
    }

    /**
     * Get the array of attributes for the action
     *
     * @return array
     */
    public function attributes(): array
    {
        return get_object_vars($this);
    }

    /**
     * Execute the command
     *
     * @return mixed
     */
    public function run()
    {
        // For now, we'll just return the account,
        // so it gets recorded as the actionable model.
        //
        // But in the future, if like a game_accounts pivot or something becomes relevant,
        // it could be a fitting place to stuff that logic in here.
        //
        return Account::query()
            ->where('acc_name', $this->accountName)
            ->first();
    }
}
