<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductionPlanDetail extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function productionPlan()
    {
        return $this->belongsTo(ProductionPlan::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }

    public function productionOrder()
    {
        return $this->hasOne(ProductionOrder::class);
    }
}
