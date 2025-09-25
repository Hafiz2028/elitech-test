<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    public function definition(): array
    {
        return [
            'sku' => 'ELT-' . fake()->unique()->numerify('###'),
            'name' => fake()->words(3, true),
            'description' => fake()->sentence(),
        ];
    }
}
