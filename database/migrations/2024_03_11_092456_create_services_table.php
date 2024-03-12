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
        Schema::create('services', function (Blueprint $table) {
            $table->id();
            $table->foreignId('item_id')->references('id')->on('items');
            $table->foreignId('module_id')->references('id')->on('modules');
            $table->foreignId('vendor_id')->references('id')->on('vendors');
            $table->foreignId('category_id')->nullable()->references('id')->on('categories');
            $table->string('category_ids');
            $table->text('service_details');
            $table->foreignId('unit_id')->nullable()->references('id')->on('units');
            $table->decimal('price')->nullable();
            $table->decimal('discount')->nullable();
            $table->string('discount_type')->nullable();
            $table->string('available_for');
            $table->string('timeslot_list');
            $table->foreignId('old_staff')->nullable()->references('id')->on('vendor_employees');
            $table->string('new_staff')->nullable();
            $table->boolean('status')->comment('0=pending 1=accepted');
            $table->boolean('is_approved')->comment('0=pending 1=approved');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('services');
    }
};
