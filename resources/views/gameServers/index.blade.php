@extends('layouts.app')

@section('content')
	<div class="container-fluid">
	    <div class="card shadow-lg">
	        <h5 class="card-header text-center">
	            {{ __('Game servers') }}
	        </h5>
	        <div class="card-body">
				@table(['headers' => [__('Name'), __('Game Version'), __('Realmlist'), __('Description')]])
					@foreach($gameServers as $gameServer)
						<tr>
							<td>
								{{ $gameServer->name }}
							</td>
							<td>
								{{ $gameServer->version }}	
							</td>
							<td>
								@if($gameServer->port !== 3724)
									{{ $gameServer->address }}:{{ $gameServer->port }}
								@else
									{{ $gameServer->address }}
								@endif
							</td>
							<td>
								{{ $gameServer->description }}
							</td>
						</tr>
					@endforeach
				@endtable
			</div>
		</div>
	</div>
@endsection