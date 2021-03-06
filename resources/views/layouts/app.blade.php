<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ mix('js/app.js') }}" defer></script>
    @stack('scripts')

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet" type="text/css">
    @stack('fonts')

    <!-- Styles -->
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
    @stack('styles')
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light navbar-laravel">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            @link(['to' => 'game-servers'])
                                {{ __('Servers') }} 
                            @endlink   
                        </li>

                        @can('list actions')
                            <li class="nav-item">
                                @link(['to' => 'actions'])
                                    {{ __('Actions') }}
                                @endlink
                            </li>
                        @endcan
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                @link(['to' => 'login'])
                                    {{ __('Login') }}
                                @endlink
                            </li>

                            <li class="nav-item">
                                @link(['to' => 'register'])
                                    {{ __('Register') }}
                                @endlink
                            </li>
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    @can('create game servers')
                                        @link(['class' => 'dropdown-item', 'to' => 'game-servers/create'])
                                            {{ __('Create game server') }}
                                        @endlink
                                    @endcan

                                    @link(['to' => 'home', 'class' => 'dropdown-item'])
                                        {{ __('Home') }}
                                    @endlink

                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            {{-- Laracasts/flash --}}
            @include('flash::message')

            @if(session('status'))
                @alert(['state' => 'info'])
                    {{ session('status') }}
                @endalert
            @endif
            
            @yield('content')
        </main>
    </div>

    <footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.slim.min.js" integrity="sha256-ZaXnYkHGqIhqTbJ6MB4l9Frs/r7U4jlx7ir8PJYBqbI=" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
            $(function () {
              $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </footer>
</body>
</html>
