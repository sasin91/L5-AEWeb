@extends('layouts.app')

@push('scripts')
	<script src="https://cdnjs.cloudflare.com/ajax/libs/trix/1.1.0/trix.js" integrity="sha256-VfFxhYHySb75afm48aD92+2I35RelrkNz27uctZHtM8=" crossorigin="anonymous"></script>
@endpush

@push('styles')
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/trix/1.1.0/trix.css" integrity="sha256-E+PhQdEtOrDN9z7kFPwh8qYtsJuIPM8dfB3yua3nRYQ=" crossorigin="anonymous" />
@endpush

@section('content')
	<div class="container">
	    <div class="card shadow-lg">
	        <h5 class="card-header text-center">
	            {{ __('Create new game server') }}
	        </h5>
	        <div class="card-body">
				@form(['action' => route('game-servers.store')])
					@formField(['attribute' => 'realmId', 'type' => 'number', 'required' => true])
						@slot('help')
							{{ __('The ID of the realm in accounts table.') }}
						@endslot
					@endformField

					@formField(['attribute' => 'address', 'value' => '127.0.0.1', 'required' => true])
						@slot('help')
							{{ __('Typically the public IP address to the login server.') }}
						@endslot
					@endformField

					@formField(['attribute' => 'port', 'type' => 'number', 'value' => '3724', 'required' => true])
						@slot('port')
							{{ __('Port to the login server') }}
						@endslot
					@endformField

					@formField(['attribute' => 'version'])
						@slot('label')
							{{ __('Supported game version') }}
						@endslot

						<select class="form-control" name="version" id="version">
							@foreach(App\GameServer::$supportedVersions as $version)
								<option value="{{ $version }}">{{ __($version) }}</option>
							@endforeach
						</select>
					@endformField

					@formField(['attribute' => 'name', 'required' => true, 'placeholder' => __('Something brief, that expresses the server.')])
						@slot('help')
							{{ __('This will only be visible when browsing the site.') }}
						@endslot
					@endformField

					@formField(['attribute' => 'description'])
						<trix-editor class="form-control" id="description" name="description" />
					@endformField

					<button type="submit" class="btn btn-primary btn-block">{{ __('Create') }}</button>
				@endform
	        </div>
	    </div>
	</div>
@endsection