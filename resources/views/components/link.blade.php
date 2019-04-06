<li class="nav-item">
    <a class="nav-link {{ Request::is($to) ? 'active' : '' }}" href="{{ $href ?? url($to) }}">
    	{{ $slot }}
	</a>
</li>