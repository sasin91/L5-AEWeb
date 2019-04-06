@extends('layouts.app')

@push('fonts')
    <link 
        rel="stylesheet" 
        href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
        integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
        crossorigin="anonymous"
    >
@endpush

@section('content')
    <div class="container-fluid mt-5">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-lg-2 col-md-12 col-xs-12">
                        <div class="nav flex-column nav-pills text-center text-uppercase font-weight-bold shadow-lg" id="v-pills-tab" aria-orientation="vertical">
                            @tabLink(['to' => 'home'])
                                <i class="fas fa-home"></i>
                                {{ __('Home') }}
                            @endtabLink

                            @tabLink(['to' => 'home/settings'])
                                <i class="fas fa-cogs"></i>
                                {{ __('Settings') }}
                            @endtabLink

                            @tabLink(['to' => 'home/actions'])
                                <i class="fas fa-bolt"></i>
                                {{ __('Actions') }}
                            @endtabLink
                        </div>
                    </div>

                    <div class="col-lg-10 col-md-12 col-xs-12">
                        <div class="tab-content">
                            @if(Request::is('home'))
                                @tabPanel(['name' => 'home'])
                                    @include('home.overview')
                                @endtabPanel
                            @endif

                            @if(Request::is('home/settings'))
                                @tabPanel(['name' => 'home/settings'])
                                    @include('home.settings')
                                @endtabPanel
                            @endif

                            @if(Request::is('home/actions'))
                                @tabPanel(['name' => 'home/actions'])
                                    @include('home.actions')
                                @endtabPanel
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
