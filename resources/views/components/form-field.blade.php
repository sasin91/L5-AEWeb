<div class="form-group">
	@if($label ?? false)
		{{ $label }}
	@else
		<label for="{{ $id ?? $attribute }}">{{ __(Str::humanize($attribute)) }}</label>
	@endif
	
	@if(filled($slot->toHtml()))
		{{ $slot }}
	@else
		<input 
			placeholder="{{ $placeholder ?? null }}"
			required="{{ $required ?? false }}" 
			type="{{ $type ?? 'text' }}" 
			name="{{ Str::snake($attribute) }}" 
			class="form-control {{ $errors->has($attribute) ? 'is-invalid' : '' }}"
			id="{{ $id ?? $attribute }}" 
			aria-describedby="{{ $attribute }}Help"
			value="{{ $value ?? null }}" 
		/>
	@endif
	
	@if($help ?? false)
		<small id="{{ $attribute }}Help" class="form-text text-muted">
			{{ $help }}
		</small>
	@endif

    @if ($errors->has($attribute))
        <span class="invalid-feedback" role="alert">
            <strong>{{ $errors->first($attribute) }}</strong>
        </span>
    @endif
</div>