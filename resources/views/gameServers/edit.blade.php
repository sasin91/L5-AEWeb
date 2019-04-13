@extends('layouts.app')

@section('content')
	<div class="container">
		<div class="card text-center shadow-lg">
		  <h1 class="card-header">
		    {{ __('Editing game server :name', ['name' => $gameServer->name]) }}
		  </h1>
		  <div class="card-body">
		  	@form(['action' => route('game-servers.update', $gameServer), 'method' => 'PATCH'])
				@formField(['attribute' => 'realm_id', 'type' => 'number', 'required' => true, 'value' => $gameServer->realm_id])
					@slot('help')
						{{ __('The ID of the realm in accounts table.') }}
					@endslot
				@endformField

				@formField(['attribute' => 'address', 'value' => $gameServer->address, 'required' => true])
					@slot('help')
						{{ __('Typically the public IP address to the login server.') }}
					@endslot
				@endformField

				@formField(['attribute' => 'port', 'type' => 'number', 'value' => $gameServer->port, 'required' => true])
					@slot('port')
						{{ __('Port to the login server') }}
					@endslot
				@endformField

				@formField(['attribute' => 'version', 'value' => $gameServer->version])
					@slot('label')
						{{ __('Supported game version') }}
					@endslot

					<select class="form-control" name="version" id="version">
						@foreach($gameServer::$supportedVersions as $version)
							<option value="{{ $version }}">{{ __($version) }}</option>
						@endforeach
					</select>
				@endformField

				@formField(['attribute' => 'name', 'required' => true, 'value' => $gameServer->name])
					@slot('help')
						{{ __('This will only be visible when browsing the site.') }}
					@endslot
				@endformField

				@formField(['attribute' => 'description', 'value' => $gameServer->description])
					<trix-editor 
						class="form-control" 
						id="description" 
						name="description" 
						value="{{ $gameServer->getAttributes()['description'] }}"
					/>
				@endformField

				<button type="submit" class="btn btn-primary btn-block">{{ __('Update') }}</button>
		  	@endform
		  </div>
		</div>
	</div>
@endsection