<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\ProductionLog;
use App\Models\ProductionOrder;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductionOrder>
 */
class ProductionOrderFactory extends Factory
{
    protected $model = ProductionOrder::class;

    public function definition(): array
    {
        return [
            'order_code' => 'PO/'.now()->year.'/'.fake()->unique()->numerify('#####'),
            'status' => fake()->randomElement(['menunggu', 'sedang_dikerjakan', 'selesai']),
            'target_quantity' => fake()->numberBetween(10, 200),
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function (ProductionOrder $order) {
            $staffProduksi = User::whereHas('role', fn ($q) => $q->where('name', 'Staff Produksi'))->inRandomOrder()->first();

            if ($order->status === 'sedang_dikerjakan' || $order->status === 'selesai') {
                $order->update(['start_date' => now()->subDays(rand(1, 5))]);
                ProductionLog::factory()->create([
                    'production_order_id' => $order->id,
                    'user_id' => $staffProduksi->id,
                    'description' => 'Produksi dimulai.',
                ]);
            }

            if ($order->status === 'selesai') {
                $rejected = fake()->numberBetween(0, 5);
                $order->update([
                    'completion_date' => now()->subDays(rand(0, 4)),
                    'actual_quantity' => $order->target_quantity - $rejected,
                    'rejected_quantity' => $rejected,
                ]);
                ProductionLog::factory()->create([
                    'production_order_id' => $order->id,
                    'user_id' => $staffProduksi->id,
                    'description' => 'Produksi selesai. Hasil: '.$order->actual_quantity.' OK, '.$rejected.' NG.',
                ]);
            }
        });
    }
}
