<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChatMessageStatus extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chat_message_status', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id');
            $table->foreignId('chat_room_id')->default(0)->constrained('chat_rooms')->onDelete('cascade');
            $table->integer('chat_message_id');
            $table->tinyInteger('is_read')->default(0);
            $table->timestamps();
            $table->softDeletes();

            $table->index(["user_id", "chat_room_id", "chat_message_id", "is_read"]);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat_message_status');
    }
}
