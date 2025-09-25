<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductionLog extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function productionOrder()
    {
        return $this->belongsTo(ProductionOrder::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
