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
        'lastlogin' => 'datetime',
        'flags' => 'integer',
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

    public function getBannedAttribute($value)
    {
        return $this->castToDateTimeIfGreaterThanZero(
            (int)$value
        );
    }

    public function getMutedAttribute($value)
    {
        return $this->castToDateTimeIfGreaterThanZero(
            (int)$value
        );
    }

    /**
     * Cast given unix timestamp to a DateTime instance, if greater than zero.
     *
     * @param  int    $unixTimestamp
     * @return int
     */
    protected function castToDateTimeIfGreaterThanZero(int $unixTimestamp)
    {
        if ($unixTimestamp > 0) {
            return $this->asDateTime($unixTimestamp);
        }

        return $unixTimestamp;
    }
}
