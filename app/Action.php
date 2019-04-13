<?php

namespace App;

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
        'executed_at',
        'class_name'
    ];

    protected $casts = [
        'actionable_attributes' => 'array',
        'executed_at' => 'datetime'
    ];

    /**
     * Execute the given action
     *
     * @param  ActionContract   $action
     * @param  Model            $actionable
     * @return mixed
     */
    public static function execute(ActionContract $action)
    {
        return tap(new static, function (Action $model) use ($action) {
            $model->creator()->associate(Auth::user());
            $model->actionable_attributes = $action->attributes();
            $model->class_name = get_class($action);
            $model->saveOrFail();
            
            if ($actionable = $action->run()) {
                $model->actionable()->associate($actionable);
                $model->saveOrFail();
            }

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
     * Link to this model
     *
     * @return string
     */
    public function getLinkAttribute(): string
    {
        return url('actions', $this);
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
