  <div 
  	class="tab-pane fade {{ Request::is($link ?? $name) ? 'show active' : '' }}" 
  	id="{{ str_replace('/', '-', $name) }}" 
  	role="tabpanel" 
  	aria-labelledby="{{ str_replace('/', '-', $name) }}-tab"
  >
  	{{ $slot }}
  </div>