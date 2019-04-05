<?php

namespace App\Concerns;

use App\Action;
use Illuminate\Database\Eloquent\Model;

trait Executable
{
	/**
	 * Execute this action
	 * 
	 * @param  Model  $actionable 
	 * @param  mixed  ...$attributes 
	 * @return Action
	 */
	public static function execute(Model $actionable, ...$attributes): Action
	{
		return Action::execute(
			new static(...$attributes),
			$actionable
		);
	}
}