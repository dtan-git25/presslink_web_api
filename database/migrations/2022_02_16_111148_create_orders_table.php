<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('slug');
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('provider_id')->constrained('users')->onDelete('cascade');
            $table->string('chat_room_identifier')->nullable();
            $table->string('transition_id')->nullable();
            $table->string('card_id')->nullable();
            $table->dateTime('date_time')->nullable();
            $table->text('additional_note')->nullable();
            $table->string('address',100)->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->string('start_job')->nullable();
            $table->string('end_job')->nullable();
            $table->decimal('grand_total',8,2)->default(0);
            $table->decimal('include_vat',8,2)->default(0);
            $table->tinyInteger('status')->default(0)->comment('0 => pending, 1=>accepted, 2=>rejected, 3=>completed');
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
        Schema::dropIfExists('orders');
    }
}
