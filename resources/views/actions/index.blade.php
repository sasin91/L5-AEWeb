@extends('layouts.app')

@section('content')
	@include('partials.actions-table', ['actions' => $actions])

	{!! $actions->links() !!}
@endsection