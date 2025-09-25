<?php

namespace App\Providers;

use App\Models\ProductionPlan; // <-- Import model
use App\Policies\ProductionPlanPolicy; // <-- Import policy
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The model to policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        ProductionPlan::class => ProductionPlanPolicy::class, // <-- Tambahkan baris ini
    ];

    /**
     * Register any authentication / authorization services.
     */
    public function boot(): void
    {
        //
    }
}
