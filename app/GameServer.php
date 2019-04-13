<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\HtmlString;
use Parsedown;

class GameServer extends Model
{
    use SoftDeletes;

    /**
     * Game client version
     *
     * @var array
     */
    public static $supportedVersions = [
        '1.12.1',
        '2.4.3',
        '3.3.5',
        '4.3.4'
    ];

    protected $fillable = [
        'creator_id',
        'realm_id',
        'name',
        'description',
        'address',
        'port',
        'version'
    ];

    /**
     * Creator of the game server entity
     *
     * @return BelongsTo
     */
    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'creator_id');
    }

    public function getRealmlistAttribute()
    {
        if ($this->port && $this->port !== 3724) {
            return "{$this->address}:{$this->port}";
        }

        return $this->address;
    }

    public function getDescriptionAttribute($text)
    {
        $parsedown = new Parsedown;

        return new HtmlString($parsedown->text($text));
    }
}
