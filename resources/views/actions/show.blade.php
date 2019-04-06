@extends('layouts.app')

@section('content')
	<div class="card text-center">
		<div class="card-header">
			{{ __(Str::humanize($action->class_name)) }}
		</div>

		<div class="card-body">
			<h5 class="card-title">
				<a href="{{ $action->actionable->link }}">
					{{ __(Str::humanize($action->actionable_type)) }}[{{ $action->actionable_id }}]
				</a>
			</h5>
			<code class="card-text">
				{{ $action->getAttributes()['actionable_attributes'] }}
			</code>
		</div>

		<div class="card-footer text-muted">
			{{ __(':diff by :creator', [
				'diff' => $action->created_at->diffForHumans(),
				'creator' => $action->creator->name
			]) }}
		</div>
	</div>
@endsection