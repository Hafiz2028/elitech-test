<?php

namespace App\Http\Controllers\PPIC;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductionPlan;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class ProductionPlanController extends Controller
{
    use AuthorizesRequests;

    public function index()
    {
        $plans = ProductionPlan::with('creator:id,name', 'approver:id,name', 'details.product:id,name,sku')
            ->latest()
            ->paginate(10);

        return Inertia::render('PPIC/Index', [
            'plans' => $plans,
            'isManager' => Auth::user()->role->name === 'Manager',
        ]);
    }

    public function create()
    {
        return Inertia::render('PPIC/Create', [
            'products' => Product::select('id', 'name', 'sku')->get(),
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'plan_code' => 'required|string|unique:production_plans,plan_code',
            'notes' => 'nullable|string',
            'details' => 'required|array|min:1',
            'details.*.product_id' => 'required|exists:products,id',
            'details.*.quantity' => 'required|integer|min:1',
        ]);

        DB::transaction(function () use ($validated, $request) {
            $plan = ProductionPlan::create([
                'plan_code' => $validated['plan_code'],
                'notes' => $validated['notes'],
                'created_by' => Auth::id(),
                'status' => 'menunggu_persetujuan',
            ]);

            $plan->details()->createMany($request->details);
        });

        return Redirect::route('production-plans.index')->with('success', 'Rencana produksi berhasil dibuat.');
    }

    public function approve(ProductionPlan $production_plan)
    {
        $this->authorize('approve', $production_plan);

        $production_plan->update([
            'status' => 'disetujui',
            'approved_by' => Auth::id(),
            'approval_date' => now(),
            'deadline' => now()->addWeekdays(7),
        ]);

        return redirect()->back()->with('success', 'Rencana produksi disetujui.');
    }

    public function reject(ProductionPlan $production_plan)
    {
        // Otorisasi: Hanya manager yang boleh reject
        $this->authorize('reject', $production_plan);
        $production_plan->update([
            'status' => 'ditolak',
            'approved_by' => Auth::id(),
            'approval_date' => now(),
        ]);

        return redirect()->back()->with('success', 'Rencana produksi ditolak.');
    }
}
