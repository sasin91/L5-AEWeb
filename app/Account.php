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

    // The only thing User and Account really have in common is the email.
    // In a case where a server already has accounts,
    // and then a web User is created with a different email,
    // it wouldn't really be easy to link.
    //
    // Maybe a like pivot on web db for user_accounts could be worthwhile?
    
    /**
     * Map the account flags to an expansion name
     *
     * @return string
     */
    public function getExpansionAttribute(): string
    {
        return AccountFlag::toExpansionName($this->flags);
    }
}
