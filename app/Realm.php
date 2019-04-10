<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Realm extends Model
{
    protected $connection = 'ascemu_logon';

    protected $fillable = [
        'id',
        'password',
        'status',
        'status_change_time'
    ];

    protected $casts = [
        'status_change_time' => 'datetime'
    ];

    public $incrementing = false;

    public $timestamps = false;

    public function getStatusAttribute($value)
    {
        return (int)$value === 1
            ? __('Online')
            : __('Offline');
    }
}
