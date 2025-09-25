<?php

namespace App\Http\Controllers\Produksi;

use App\Http\Controllers\Controller;
use App\Models\ProductionLog;
use App\Models\ProductionOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class ProductionOrderController extends Controller
{
    public function index()
    {
        $orders = ProductionOrder::with('productionPlanDetail.product:id,name,sku', 'productionPlanDetail.productionPlan:id,plan_code')
            ->latest()
            ->paginate(10);

        return Inertia::render('Produksi/Index', [
            'orders' => $orders,
        ]);
    }

    public function start(ProductionOrder $production_order)
    {
        if ($production_order->status !== 'menunggu') {
            return Redirect::back()->with('error', 'Order ini tidak bisa dimulai.');
        }

        $production_order->update([
            'status' => 'sedang_dikerjakan',
            'start_date' => now(),
        ]);

        ProductionLog::create([
            'production_order_id' => $production_order->id,
            'user_id' => Auth::id(),
            'description' => 'Produksi dimulai.',
        ]);

        return Redirect::back()->with('success', 'Order produksi dimulai.');
    }

    public function finish(Request $request, ProductionOrder $production_order)
    {
        if ($production_order->status !== 'sedang_dikerjakan') {
            return Redirect::back()->with('error', 'Order ini belum dimulai.');
        }

        $validated = $request->validate([
            'actual_quantity' => 'required|integer|min:0',
            'rejected_quantity' => 'required|integer|min:0',
        ]);

        $production_order->update([
            'status' => 'selesai',
            'completion_date' => now(),
            'actual_quantity' => $validated['actual_quantity'],
            'rejected_quantity' => $validated['rejected_quantity'],
        ]);

        ProductionLog::create([
            'production_order_id' => $production_order->id,
            'user_id' => Auth::id(),
            'description' => 'Produksi selesai. Hasil: '.$validated['actual_quantity'].' OK, '.$validated['rejected_quantity'].' NG.',
        ]);

        return Redirect::back()->with('success', 'Order produksi telah diselesaikan.');
    }

    public function history(ProductionOrder $production_order)
    {
        $logs = $production_order->logs()->with('user:id,name')->latest()->get();

        return response()->json($logs);
    }
}
