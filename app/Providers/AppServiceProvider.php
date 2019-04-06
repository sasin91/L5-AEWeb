<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Str::macro('humanize', function ($value) {
            if (is_object($value)) {
                $value = class_basename(get_class($value));
            }
            return Str::title(Str::snake($value, ' '));
        });
        
        Blade::component('components.link', 'link');
        Blade::component('components.table', 'table');
    }
}
