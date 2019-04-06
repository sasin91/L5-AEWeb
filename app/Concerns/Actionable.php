<?php

namespace App\Concerns;

use App\Action;
use Illuminate\Database\Eloquent\Relations\MorphMany;

trait Actionable
{
   
    /**
     * The actions that has been stored for this model
     *
     * @return MorphMany
     */
    public function actions(): MorphMany
    {
        return $this->morphMany(Action::class, 'actionable');
    }
}
