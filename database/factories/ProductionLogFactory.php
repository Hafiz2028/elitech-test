<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductionLog>
 */
class ProductionLogFactory extends Factory
{
    public function definition(): array
    {
        return [
            'description' => fake()->sentence(),
        ];
    }
}
