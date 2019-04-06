<?php

use Illuminate\Support\Str;

if (!function_exists('str_humanize')) {
    function str_humanize($value)
    {
        // see \App\Providers\AppServiceProvider@boot
        return Str::humanize($value);
    }
}
