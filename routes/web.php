<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::middleware('auth')->group(function () {
    Route::get('home', 'HomeController@index');
    Route::get('home/settings', 'HomeSettingsController@index');
    Route::get('home/actions', 'HomeActionsController@index');

    Route::resource('actions', 'ActionController')->except('create', 'store', 'edit', 'update');
    Route::resource('game-servers', 'GameServerController')->except('index');
});

Route::get('game-servers', 'GameServerController@index')->name('game-servers.index');