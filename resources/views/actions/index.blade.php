@extends('layouts.app')

@section('content')
	<div class="container-fluid">
	    <div class="card shadow-lg">
	        <h5 class="card-header text-center">
	            {{ __('Game servers') }}
	        </h5>
	        <div class="card-body">
	        	@include('partials.actions-table', ['actions' => $actions])

				{!! $actions->links() !!}
			</div>
		</div>
	</div>
@endsection