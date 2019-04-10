<a class="{{ $class ?? 'nav-link' }} {{ Request::is($to) ? 'active' : '' }}" href="{{ $href ?? url($to) }}">
	{{ $slot }}
</a>