<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chat_rooms', function (Blueprint $table) {
            $table->id();
            $table->foreignId('created_by')->constrained('users')->onDelete('cascade');
            $table->string('slug', 100)->unique();
            $table->string('identifier', 255)->default("comments")->index();
            $table->string('reference_module')->default('');
            $table->integer('reference_id')->default(0);
            $table->string('title', 255)->nullable();
            $table->text('image_url')->nullable();
            $table->text('description')->nullable();
            $table->string('type', 33)->default("single")->index();
            $table->integer('member_limit')->default(0);
            $table->tinyInteger('is_anonymous')->default(0);
            $table->tinyInteger('status')->default(1)->index();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat_rooms');
    }
};
