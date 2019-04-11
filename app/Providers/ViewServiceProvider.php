<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $this->addBladeComponents();
    }

    private function addBladeComponents()
    {
        Blade::component('components.link', 'link');
        Blade::component('components.form', 'form');
        Blade::component('components.form-field', 'formField');
        Blade::component('components.table', 'table');
        Blade::component('components.alert', 'alert');
        Blade::component('components.tab-link', 'tabLink');
        Blade::component('components.tab-panel', 'tabPanel');
    }
}
