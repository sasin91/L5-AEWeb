<?php

namespace App\Actions;

use App\Account;
use App\Concerns\Executable;
use App\Contracts\Action as ActionContract;
use App\Enums\AccountFlag;

class CreateAccount implements ActionContract
{
    use Executable;

    public $name;
    public $password;
    public $banned;
    public $email;
    public $flags;
    public $banreason;

    /**
     * Create a new Account

     * @param  array $attributes
     * @return void
     */
    public function __construct(array $attributes)
    {
        foreach ($attributes as $key => $value) {
            $this->$key = $value;
        }
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
        return Account::query()->create([
            'acc_name' => $this->name,
            'encrypted_password' => $this->password,
            'banned' => $this->banned,
            'email' => $this->email,
            'flags' => is_numeric($this->flags) ? $this->flags : AccountFlag::forExpansion($this->flags),
            'banreason' => $this->banreason
        ]);
    }
}
