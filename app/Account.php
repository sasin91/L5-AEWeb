<?php

namespace App;

use App\Enums\AccountFlag;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class Account extends Model
{
    protected $connection = 'ascemu_logon';

    protected $fillable = [
        'acc_name',
        'encrypted_password',
        'banned',
        'lastlogin',
        'lastip',
        'email',
        'flags',
        'forceLanguage',
        'muted',
        'banreason',
        'joindate'
    ];

    protected $casts = [
        'banned' => 'datetime',
        'lastlogin' => 'datetime',
        'flags' => 'integer',
        'muted' => 'datetime',
        'joindate' => 'datetime'
    ];

    public $timestamps = false;

    /**
     * Map the account flags to an expansion name
     *
     * @return string
     */
    public function getExpansionAttribute(): string
    {
        return AccountFlag::toExpansionName($this->flags);
    }

    /**
     * Link to this model
     *
     * @return string
     */
    public function getLinkAttribute(): string
    {
        return url('accounts', $this);
    }
}
