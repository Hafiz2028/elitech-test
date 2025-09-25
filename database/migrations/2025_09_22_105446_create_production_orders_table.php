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
        Schema::create('production_orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_code')->unique();
            $table->foreignId('production_plan_detail_id')->unique()->constrained('production_plan_details');
            $table->enum('status', ['menunggu', 'sedang_dikerjakan', 'selesai'])->default('menunggu');
            $table->integer('target_quantity');
            $table->integer('actual_quantity')->default(0);
            $table->integer('rejected_quantity')->default(0);
            $table->timestamp('start_date')->nullable();
            $table->timestamp('completion_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('production_orders');
    }
};
