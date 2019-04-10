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
        Blade::component('components.form', 'form');
        Blade::component('components.form-field', 'formField');
        Blade::component('components.table', 'table');
        Blade::component('components.alert', 'alert');
        Blade::component('components.tab-link', 'tabLink');
        Blade::component('components.tab-panel', 'tabPanel');
    }
}
