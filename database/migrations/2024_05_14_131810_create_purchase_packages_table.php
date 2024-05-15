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
        Schema::create('purchase_packages', function (Blueprint $table) {
            $table->id();
            $table->foreignId('vendor_id')->references('id')->on('vendors');
            $table->foreignId('subscription_package_id')->references('id')->on('subscription_packages');
            $table->dateTime('purchase_date');
            $table->dateTime('expiry_date');
            $table->string('payment_option',50);
            $table->float('paid_amount')->default(0);
            $table->boolean('package_status')->default(0);
            $table->boolean('limit_status')->default(0);
            $table->integer('maximum_order_limit')->default(0);
            $table->foreignId('admin_id')->nullable()->references('id')->on('admins');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchase_packages');
    }
};
