<?php

namespace App\Providers;

use App\Models\ProductionPlan;
use Illuminate\Support\ServiceProvider;
use App\Observers\ProductionPlanObserver;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        ProductionPlan::observe(ProductionPlanObserver::class); // <-- Tambahkan baris ini
    }
}
