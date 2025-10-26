<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserCashOut extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_cash_out', function (Blueprint $table) {
            $table->id();
            $table->string('slug');
            $table->bigInteger('user_id')->unsigned()->index();
            $table->bigInteger('admin_id')->unsigned()->index()->default(0);
            $table->decimal('amount',8,2)->default(0);
            $table->text('message')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0 => pending, 1=>accepted, 2=>rejected');
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
        Schema::dropIfExists('user_cash_out');
    }
}
