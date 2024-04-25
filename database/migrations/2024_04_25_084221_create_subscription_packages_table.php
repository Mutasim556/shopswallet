<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('subscription_packages', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->foreignId('module_id')->references('id')->on('modules');
            $table->float('price');
            $table->text('currency');
            $table->text('details');
            $table->boolean('status')->default(1)->comment('1=active 0=inactive');
            $table->boolean('delete')->default(0)->comment('1=deleted 0=not deleted');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subscription_packages');
    }
};
