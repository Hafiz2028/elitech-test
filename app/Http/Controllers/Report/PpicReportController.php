<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;
use App\Models\ProductionPlan;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PpicReportController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'year' => 'nullable|integer',
            'month' => 'nullable|integer|between:1,12',
            'week' => 'nullable|integer|between:1,5',
            'plan_code' => 'nullable|string|max:255',
        ]);

        $query = ProductionPlan::query()
            ->with([
                'creator:id,name',
                'approver:id,name',
                'details', // Untuk menghitung total item
                'details.productionOrder:id,production_plan_detail_id,status', // Untuk menghitung progres
            ]);

        if ($request->filled('plan_code')) {
            $query->where('plan_code', 'like', '%'.$request->plan_code.'%');
        } else {
            if ($request->filled('year')) {
                $query->whereYear('created_at', $request->year);
            }
            if ($request->filled('month')) {
                $query->whereMonth('created_at', $request->month);
            }
            if ($request->filled('week') && $request->filled('year') && $request->filled('month')) {
                $startDate = Carbon::create($request->year, $request->month, 1)->startOfWeek(Carbon::MONDAY)->addWeeks($request->week - 1);
                $endDate = $startDate->copy()->endOfWeek(Carbon::SUNDAY);
                $query->whereBetween('created_at', [$startDate, $endDate]);
            }
        }

        $plans = $query->latest()->paginate(15)->withQueryString();

        $availableYears = ProductionPlan::selectRaw('DISTINCT YEAR(created_at) as year')
            ->orderBy('year', 'desc')
            ->pluck('year');

        return Inertia::render('Report/Ppic/Index', [
            'plans' => $plans,
            'filters' => $request->only(['year', 'month', 'week', 'plan_code']),
            'availableYears' => $availableYears,
        ]);
    }

    public function searchPlans(Request $request)
    {
        $term = $request->input('term', '');
        if (empty($term)) {
            return response()->json([]);
        }

        $plans = ProductionPlan::where('plan_code', 'like', "%{$term}%")
            ->select('id', 'plan_code')
            ->limit(10)
            ->get();

        return response()->json($plans);
    }

    public function export(Request $request)
    {
        $request->validate([
            'year' => 'nullable|integer',
            'month' => 'nullable|integer|between:1,12',
            'week' => 'nullable|integer|between:1,5',
            'plan_code' => 'nullable|string|max:255',
        ]);

        $query = ProductionPlan::query()
            ->with([
                'creator:id,name',
                'approver:id,name',
                'details',
                'details.productionOrder:id,production_plan_detail_id,status',
            ]);

        if ($request->filled('plan_code')) {
            $query->where('plan_code', 'like', '%'.$request->plan_code.'%');
        } else {
            if ($request->filled('year')) {
                $query->whereYear('created_at', $request->year);
            }
            if ($request->filled('month')) {
                $query->whereMonth('created_at', $request->month);
            }
            if ($request->filled('week') && $request->filled('year') && $request->filled('month')) {
                $startDate = Carbon::create($request->year, $request->month, 1)->startOfWeek(Carbon::MONDAY)->addWeeks($request->week - 1);
                $endDate = $startDate->copy()->endOfWeek(Carbon::SUNDAY);
                $query->whereBetween('created_at', [$startDate, $endDate]);
            }
        }

        $plans = $query->latest()->get();
        $fileName = 'laporan-rencana-produksi-'.now()->format('Y-m-d').'.csv';

        $headers = [
            'Content-type' => 'text/csv',
            'Content-Disposition' => "attachment; filename=$fileName",
            'Pragma' => 'no-cache',
            'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
            'Expires' => '0',
        ];

        $columns = ['Kode Rencana', 'Tanggal Dibuat', 'Dibuat Oleh', 'Status', 'Disetujui Oleh', 'Tanggal Disetujui', 'Progres Produksi'];

        $callback = function () use ($plans, $columns) {
            $file = fopen('php://output', 'w');
            fputcsv($file, $columns);

            foreach ($plans as $plan) {
                $totalDetails = $plan->details->count();
                $completedOrders = 0;
                if ($plan->status === 'disetujui') {
                    $completedOrders = $plan->details->where('productionOrder.status', 'selesai')->count();
                }
                $progress = $totalDetails > 0 ? "{$completedOrders} / {$totalDetails} Selesai" : 'N/A';

                $row['Kode Rencana'] = $plan->plan_code;
                $row['Tanggal Dibuat'] = Carbon::parse($plan->created_at)->format('Y-m-d H:i');
                $row['Dibuat Oleh'] = $plan->creator->name;
                $row['Status'] = $plan->status;
                $row['Disetujui Oleh'] = $plan->approver->name ?? '-';
                $row['Tanggal Disetujui'] = $plan->approval_date ? Carbon::parse($plan->approval_date)->format('Y-m-d H:i') : '-';
                $row['Progres Produksi'] = $progress;

                fputcsv($file, array_values($row));
            }

            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }
}
