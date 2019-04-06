<div class="col-12">
    <div class="card shadow-lg">
        <h5 class="card-header text-center">
            {{ __('Your latest actions') }}
        </h5>
        <div class="card-body">
			@include('partials.actions-table', ['actions' => $actions])
			{!! $actions->links() !!}
        </div>
    </div>
</div>