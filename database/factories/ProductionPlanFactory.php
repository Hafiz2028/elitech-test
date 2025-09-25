<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\ProductionPlan;
use App\Models\ProductionPlanDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ProductionPlan>
 */
class ProductionPlanFactory extends Factory
{
    protected $model = ProductionPlan::class;

    public function definition(): array
    {
        return [
            'plan_code' => 'PP/'.now()->year.'/'.fake()->unique()->numerify('#####'),
            'status' => fake()->randomElement(['menunggu_persetujuan', 'disetujui', 'ditolak']),
            'notes' => fake()->sentence(),
            'created_by' => User::factory(), // default, akan di-override oleh seeder
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function (ProductionPlan $plan) {
            $manager = User::whereHas('role', fn ($q) => $q->where('name', 'Manager'))->inRandomOrder()->first();

            if ($plan->status === 'disetujui' || $plan->status === 'ditolak') {
                $plan->update([
                    'approved_by' => $manager->id,
                    'approval_date' => now()->subDays(rand(1, 10)),
                ]);
            }
            if ($plan->status === 'disetujui') {
                $plan->update([
                    'deadline' => now()->addWeekdays(7),
                ]);
            }

            // Buat 1 sampai 3 detail untuk setiap plan
            ProductionPlanDetail::factory()
                ->count(rand(1, 3))
                ->for($plan)
                ->create();
        });
    }
}
