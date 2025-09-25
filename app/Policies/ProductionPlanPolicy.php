<?php

namespace App\Policies;

use App\Models\ProductionPlan;
use App\Models\User;

class ProductionPlanPolicy
{
    /**
     * Determine whether the user can approve the model.
     */
    public function approve(User $user, ProductionPlan $productionPlan): bool
    {
        return $user->role->name === 'Manager';
    }

    /**
     * Determine whether the user can reject the model.
     */
    public function reject(User $user, ProductionPlan $productionPlan): bool
    {
        return $user->role->name === 'Manager';
    }
}
