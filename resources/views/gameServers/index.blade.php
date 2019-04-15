@extends('layouts.app')

@push('styles')
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous" />
@endpush

@php
	$gameServerActions = [
		'view game server' => [
			'gate' => 'view',
			'icon' => 'fa fa-eye',
			'type' => 'link',
			'route' => 'game-servers.show'
		],
		
		'edit game servers' => [
			'gate' => 'edit',
			'icon' => 'fa fa-edit',
			'type' => 'link',
			'route' => "game-servers.edit"
		],

		'delete game servers' => [
			'gate' => 'delete',
			'icon' => 'fa fa-trash',
			'type' => 'button',
			'action' => 'destroy'
		],

		'restore deleted game servers' => [
			'gate' => 'restore',
			'icon' => 'fa fa-recycle',
			'type' => 'button',
			'action' => 'restore'
		], 

		'force delete game servers' => [
			'gate' => 'forceDelete',
			'icon' => 'fa fa-eraser',
			'type' => 'button',
			'action' => 'forceDestroy'
		]
	];
@endphp

@section('content')
	<game-servers-table>
		<div class="container-fluid" slot-scope="{ destroy, restore, forceDestroy }">
		    <div class="card shadow-lg">
		        <h5 class="card-header text-center">
		            {{ __('Game servers') }}
		        </h5>
		        <div class="card-body">
					@table(['headers' => [__('Name'), __('Game Version'), __('Realmlist'), __('Description'), __('Actions')]])
						@foreach($gameServers as $gameServer)
							<tr>
								<td>
									{{ $gameServer->name }}
								</td>
								<td>
									{{ $gameServer->version }}	
								</td>
								<td>
									{{ $gameServer->realmlist }}
								</td>
								<td>
									{{ $gameServer->description }}
								</td>
								<td>
									@foreach($gameServerActions as $name => $options)
										@can($options['gate'], $gameServer)
											@if($options['type'] === 'link')
												<a  class="btn btn-flush" href="{{ route($options['route'], $gameServer) }}" data-toggle="tooltip" data-placement="top" title="{{ $name }}">
													<i class="{{ $options['icon'] }}"></i>
													{{-- {{ __($name) }} --}}
												</a>
											@else
												<button class="btn btn-flush" @click="{{ $options['action'] }}({{ $gameServer->id }})" data-toggle="tooltip" data-placement="top" title="{{ $name }}">
													<i class="{{ $options['icon'] }}"></i>
													{{-- {{ __($name) }} --}}
												</button>
											@endif
										@endcan
									@endforeach
								</td>
							</tr>
						@endforeach
					@endtable
				</div>
			</div>
		</div>
	</game-servers-table>
@endsection