@table(['headers' => [__('Creator'), __('Model'), __('Attributes'), __('Created'), __('Executed')]])
	@foreach($actions as $action)
		<tr>
			<td>
				@link(['to' => $action->creator->link])
					{{ $action->creator->name }}
				@endlink
			</td>
			<td>
				@link(['to' => $action->actionable->link])
					{{ $action->actionable_type }}[{{ $action->actionable_id }}]
				@endlink	
			</td>
			<td>
				<code>
					{{ $action->getAttributes()['actionable_attributes'] }}
				</code>
			</td>
			<td>
				{{ $action->created_at->format('D, M j, Y H:i') }}
			</td>
			<td>
				{{ $action->executed_at ? $action->executed_at->format('D, M j, Y H:i') : __('Not executed.') }}
			</td>
		</tr>
	@endforeach
@endtable