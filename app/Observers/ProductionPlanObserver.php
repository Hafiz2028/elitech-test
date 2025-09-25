<?php

namespace App\Observers;

use App\Models\ProductionPlan;
use App\Models\ProductionOrder;

class ProductionPlanObserver
{
    /**
     * Handle the ProductionPlan "created" event.
     */
    public function created(ProductionPlan $productionPlan): void
    {
        //
    }

    /**
     * Handle the ProductionPlan "updated" event.
     */
    public function updated(ProductionPlan $productionPlan): void
    {
        // Cek apakah statusnya BARU SAJA diubah menjadi 'disetujui'
        if ($productionPlan->isDirty('status') && $productionPlan->status === 'disetujui') {
            // Loop melalui setiap detail rencana (setiap produk yang akan dibuat)
            foreach ($productionPlan->details as $detail) {
                // Buat Production Order baru untuk setiap detail
                ProductionOrder::create([
                    'order_code' => 'PO/'.now()->year.'/'.str_pad($detail->id, 5, '0', STR_PAD_LEFT),
                    'production_plan_detail_id' => $detail->id,
                    'status' => 'menunggu', // Status awal untuk produksi
                    'target_quantity' => $detail->quantity,
                ]);
            }
        }
    }

    /**
     * Handle the ProductionPlan "deleted" event.
     */
    public function deleted(ProductionPlan $productionPlan): void
    {
        //
    }

    /**
     * Handle the ProductionPlan "restored" event.
     */
    public function restored(ProductionPlan $productionPlan): void
    {
        //
    }

    /**
     * Handle the ProductionPlan "force deleted" event.
     */
    public function forceDeleted(ProductionPlan $productionPlan): void
    {
        //
    }
}
