<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProviderTransactions extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('provider_transactions', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('provider_id')->unsigned()->index();
            $table->string('identifier');
            $table->string('title');
            $table->bigInteger('reference_id')->unsigned()->index()->default(0);
            $table->string('reference_module');
            $table->date('date')->nullable();
            $table->decimal('amount',8,2)->default(0);
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
        Schema::dropIfExists('provider_transactions');
    }
}
