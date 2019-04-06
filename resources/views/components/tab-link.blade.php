<li class="nav-item">
  <a 
    class="nav-link {{ Request::is($to) ? 'active' : '' }}" 
    {{-- href="#{{ str_replace('/', '-', $to) }}" --}}
    href="{{ url($to) }}"
    id="{{ str_replace('/', '-', $to) }}-tab"
    role="tab"
    {{-- data-toggle="tab" --}}
    aria-controls="{{ str_replace('/', '-', $to) }}"
    aria-selected="{{ Request::is($to) ? true : false }}"
  >
    {{ $slot }}
  </a>
</li>