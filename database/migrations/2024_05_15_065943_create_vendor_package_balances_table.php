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
        Schema::create('vendor_package_balances', function (Blueprint $table) {
            $table->id();
            $table->foreignId('vendor_id')->references('id')->on('vendors');
            $table->foreignId('subscription_package_id')->references('id')->on('subscription_packages');
            $table->foreignId('purchase_package_id')->references('id')->on('purchase_packages');
            $table->integer('previous_remaining_order')->default(0);
            $table->integer('current_pack_order_limit')->default(0);
            $table->integer('total_order_limit')->default(0);
            $table->integer('total_vendor_order_count')->default(0);
            $table->boolean('balance_status')->default(-1)->comment('-1=pending_request 0=Usable 1=after_purchase_usable 2=all used');
            $table->dateTime('last_purchase_date');
            $table->dateTime('last_expiry_date');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('vendor_package_balances');
    }
};
