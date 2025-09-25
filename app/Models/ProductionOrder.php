<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductionOrder extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function productionPlanDetail()
    {
        return $this->belongsTo(ProductionPlanDetail::class);
    }

    public function logs()
    {
        return $this->hasMany(ProductionLog::class);
    }
}
