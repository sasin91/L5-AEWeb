<div class="col-12">
    <div class="card shadow-lg">
        <h5 class="card-header text-center">
            {{ __('Hello, :userName', ['userName' => $user->name]) }}
        </h5>
        <div class="card-body">
            <div class="card-text">
                <h2>{{ __('Your role(s) are :roles', ['roles' => $user->getRoleNames()->implode(', ')]) }}</h2>
                <h2>{{ __('You have :count game accounts', ['count' => $user->actions()->where('actionable_type', App\Account::class)->count()]) }}</h2>  
            </div>
        </div>
    </div>
</div>