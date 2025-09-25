<?php

namespace Database\Seeders;

use App\Models\ProductionPlan;
use App\Models\User;
use Illuminate\Database\Seeder;

class ProductionPlanSeeder extends Seeder
{
    public function run(): void
    {
        $ppicUsers = User::whereHas('department', fn ($q) => $q->where('name', 'PPIC'))->get();

        ProductionPlan::factory()
            ->count(100)
            ->state(function (array $attributes) use ($ppicUsers) {
                return ['created_by' => $ppicUsers->random()->id];
            })
            ->create();
    }
}
