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
            $table->boolean('package_type');
            $table->text('purchase_type');
            $table->float('discount');
            $table->text('discount_type');
            $table->integer('validity');
            $table->integer('purchase_limit');
            $table->string('purchase_limit_time');
            $table->boolean('purchase_with_point');
            $table->boolean('gift_it');
            $table->integer('maximum_order_limit');
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
