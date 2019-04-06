@if($responsive ?? false)
  <div class="table-responsive">
@endif

<table class="table {{ $classes ?? '' }}">
  <thead>
    <tr>
      {{-- When a headers variable is present, and it's not an array, we'll assume it's a component slot to be rendered --}}
      @if($headers ?? false)
        @if(is_array($headers))
          @foreach($headers as $header)
            <th scope="col">{{ $header }}</th>
          @endforeach
        @else
          {{ $headers }}
        @endif
      @endif
    </tr>
  </thead>
  <tbody>
    {{-- we'll simply delegate rendering the content to the developer --}}
    {{ $slot }}
  </tbody>
</table>

@if($responsive ?? false)
  </div>
@endif