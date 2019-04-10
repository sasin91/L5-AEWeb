<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGameServersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('game_servers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('realm_id')->unsigned()->index(); // Cannot foreign because realm is in logon db.
            $table->bigInteger('creator_id')->unsigned()->index();
            $table->foreign('creator_id')->references('id')->on('users');
            $table->string('name')->unique();
            $table->string('address')->default('127.0.0.1');
            $table->integer('port')->default(3724);
            $table->string('version')->comment('game version');
            $table->string('description')->nullable();
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('game_servers');
    }
}
