@extends('layouts.app')

@section('content')
	<div class="container">
		<div class="card text-center shadow-lg">
		  <h1 class="card-header">
		    {{ $gameServer->name }}
		  </h1>
		  <div class="card-body">
		    <h5 class="card-title">{{ __('set realmlist :realmlist', ['realmlist' => $gameServer->realmlist]) }}</h5>
		    <p class="card-text">
		    	{!! $gameServer->description !!}
		    </p>
		  </div>
		</div>
	</div>
@endsection