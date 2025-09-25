<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductionOrder;
use App\Models\ProductionPlan;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $stats = [
            [
                'id' => 1,
                'name' => 'Rencana Menunggu Persetujuan',
                'stat' => ProductionPlan::where('status', 'menunggu_persetujuan')->count(),
                'href' => route('production-plans.index'),
            ],
            [
                'id' => 2,
                'name' => 'Order Produksi Aktif',
                'stat' => ProductionOrder::where('status', 'sedang_dikerjakan')->count(),
                'href' => route('production-orders.index'),
            ],
            [
                'id' => 3,
                'name' => 'Produk Total',
                'stat' => Product::count(),
                'href' => route('products.index'),
            ],
        ];

        return Inertia::render('Dashboard', [
            'stats' => $stats,
        ]);
    }
}
