<?php

namespace App;

use App\ActionAttributes;
use App\Contracts\Action as ActionContract;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphTo;
use Illuminate\Support\Facades\Auth;

class Action extends Model
{
    protected $fillable = [
    	'creator_id',
    	'actionable_type',
    	'actionable_id',
    	'actionable_attributes',
        'executed_at'
    ];

    protected $casts = [
    	'actionable_attributes' => 'array',
        'executed_at' => 'timestamp'
    ];

    /**
     * Execute the given action
     * 
     * @param  ActionContract   $action 
     * @param  Model            $actionable
     * @return mixed
     */
    public static function execute(ActionContract $action, Model $actionable)
    {
        return tap(new static, function (Action $model) use ($action, $actionable) {
            $model->creator()->associate(Auth::user());
            $model->actionable()->associate($actionable);
            $model->actionable_attributes = get_object_vars($action);
            $model->saveOrFail();
            
            $action->run();

            $model->markAsExecuted();
        });
    }

    /**
     * Creator of the action
     * 
     * @return BelongsTo
     */
    public function creator(): BelongsTo
    {
    	return $this->belongsTo(User::class, 'creator_id');
    }

    /**
     * The actionable model
     * 
     * @return MorphTo 
     */
    public function actionable(): MorphTo
    {
    	return $this->morphTo();
    }

    /**
     * Mark the action as executed
     * 
     * @param  \DateTimeInterface|null $timestamp 
     * @return $this            
     */
    public function markAsExecuted($timestamp = null)
    {
        return tap($this)->update([
            'executed_at' => $timestamp ? $this->asDateTime($timestamp) : $this->freshTimestamp()
        ]);
    }
}
