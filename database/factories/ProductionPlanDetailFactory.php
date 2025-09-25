<?php

namespace Database\Factories;

use App\Models\Product;
use App\Models\ProductionOrder;
use App\Models\ProductionPlanDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductionPlanDetail>
 */
class ProductionPlanDetailFactory extends Factory
{
    protected $model = ProductionPlanDetail::class;

    public function definition(): array
    {
        return [
            'product_id' => Product::inRandomOrder()->first()->id,
            'quantity' => fake()->numberBetween(10, 200),
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function (ProductionPlanDetail $detail) {
            // Jika plan-nya disetujui, buat order
            if ($detail->productionPlan->status === 'disetujui') {
                ProductionOrder::factory()->for($detail)->create();
            }
        });
    }
}
