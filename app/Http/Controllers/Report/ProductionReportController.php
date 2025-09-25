<?php

namespace App\Http\Controllers\Report;

use App\Http\Controllers\Controller;
use App\Models\ProductionOrder;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ProductionReportController extends Controller
{
    public function index(Request $request)
    {
        $request->validate([
            'year' => 'nullable|integer',
            'month' => 'nullable|integer|between:1,12',
            'week' => 'nullable|integer|between:1,5',
            'order_code' => 'nullable|string|max:255',
        ]);

        $query = ProductionOrder::query()
            ->with(['productionPlanDetail.product:id,name,sku'])
            ->where('status', 'selesai');

        if ($request->filled('order_code')) {
            $query->where('order_code', 'like', '%'.$request->order_code.'%');
        } else {
            if ($request->filled('year')) {
                $query->whereYear('completion_date', $request->year);
            }
            if ($request->filled('month')) {
                $query->whereMonth('completion_date', $request->month);
            }
            if ($request->filled('week') && $request->filled('year') && $request->filled('month')) {
                $startDate = Carbon::create($request->year, $request->month, 1)->startOfWeek(Carbon::MONDAY)->addWeeks($request->week - 1);
                $endDate = $startDate->copy()->endOfWeek(Carbon::SUNDAY);
                $query->whereBetween('completion_date', [$startDate, $endDate]);
            }
        }

        $orders = $query->latest('completion_date')->paginate(15)->withQueryString();

        // Ambil data tahun yang tersedia untuk filter dropdown
        $availableYears = ProductionOrder::where('status', 'selesai')
            ->whereNotNull('completion_date')
            ->selectRaw('DISTINCT YEAR(completion_date) as year')
            ->orderBy('year', 'desc')
            ->pluck('year');

        return Inertia::render('Report/Production/Index', [
            'orders' => $orders,
            'filters' => $request->only(['year', 'month', 'week', 'order_code']),
            'availableYears' => $availableYears,
        ]);
    }

    public function searchOrders(Request $request)
    {
        $term = $request->input('term', '');
        if (empty($term)) {
            return response()->json([]);
        }

        $orders = ProductionOrder::where('order_code', 'like', "%{$term}%")
            ->select('id', 'order_code')
            ->limit(10)
            ->get();

        return response()->json($orders);
    }

    public function export(Request $request)
    {

        $request->validate([
            'year' => 'nullable|integer',
            'month' => 'nullable|integer|between:1,12',
            'week' => 'nullable|integer|between:1,5',
            'order_code' => 'nullable|string|max:255',
        ]);

        $query = ProductionOrder::query()
            ->with(['productionPlanDetail.product:id,name,sku'])
            ->where('status', 'selesai');

        if ($request->filled('order_code')) {
            $query->where('order_code', 'like', '%'.$request->order_code.'%');
        } else {
            if ($request->filled('year')) {
                $query->whereYear('completion_date', $request->year);
            }
            if ($request->filled('month')) {
                $query->whereMonth('completion_date', $request->month);
            }
            if ($request->filled('week') && $request->filled('year') && $request->filled('month')) {
                $startDate = Carbon::create($request->year, $request->month, 1)->startOfWeek(Carbon::MONDAY)->addWeeks($request->week - 1);
                $endDate = $startDate->copy()->endOfWeek(Carbon::SUNDAY);
                $query->whereBetween('completion_date', [$startDate, $endDate]);
            }
        }

        $orders = $query->latest('completion_date')->get();

        $fileName = 'laporan-produksi-'.now()->format('Y-m-d').'.csv';

        $headers = [
            'Content-type' => 'text/csv',
            'Content-Disposition' => "attachment; filename=$fileName",
            'Pragma' => 'no-cache',
            'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
            'Expires' => '0',
        ];

        $columns = ['Kode Order', 'SKU', 'Nama Produk', 'Target', 'Hasil OK', 'Hasil NG', 'Status', 'Tanggal Selesai'];

        $callback = function () use ($orders, $columns) {
            $file = fopen('php://output', 'w');
            fputcsv($file, $columns);

            foreach ($orders as $order) {
                $row['Kode Order'] = $order->order_code;
                $row['SKU'] = $order->productionPlanDetail->product->sku;
                $row['Nama Produk'] = $order->productionPlanDetail->product->name;
                $row['Target'] = $order->target_quantity;
                $row['Hasil OK'] = $order->actual_quantity;
                $row['Hasil NG'] = $order->rejected_quantity;
                $row['Status'] = $order->status;
                $row['Tanggal Selesai'] = Carbon::parse($order->completion_date)->format('Y-m-d H:i');

                fputcsv($file, [
                    $row['Kode Order'],
                    $row['SKU'],
                    $row['Nama Produk'],
                    $row['Target'],
                    $row['Hasil OK'],
                    $row['Hasil NG'],
                    $row['Status'],
                    $row['Tanggal Selesai'],
                ]);
            }

            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }

    public function exportSingle(ProductionOrder $production_order)
    {
        $order = $production_order->load('productionPlanDetail.product');

        $fileName = 'laporan-order-'.$order->order_code.'.csv';

        $headers = [
            'Content-type' => 'text/csv',
            'Content-Disposition' => "attachment; filename=$fileName",
            'Pragma' => 'no-cache',
            'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
            'Expires' => '0',
        ];

        $columns = ['Kode Order', 'SKU', 'Nama Produk', 'Target', 'Hasil OK', 'Hasil NG', 'Status', 'Tanggal Selesai'];

        $callback = function () use ($order, $columns) {
            $file = fopen('php://output', 'w');
            fputcsv($file, $columns);

            $row['Kode Order'] = $order->order_code;
            $row['SKU'] = $order->productionPlanDetail->product->sku;
            $row['Nama Produk'] = $order->productionPlanDetail->product->name;
            $row['Target'] = $order->target_quantity;
            $row['Hasil OK'] = $order->actual_quantity;
            $row['Hasil NG'] = $order->rejected_quantity;
            $row['Status'] = $order->status;
            $row['Tanggal Selesai'] = $order->completion_date ? Carbon::parse($order->completion_date)->format('Y-m-d H:i') : 'Belum Selesai';

            fputcsv($file, [
                $row['Kode Order'],
                $row['SKU'],
                $row['Nama Produk'],
                $row['Target'],
                $row['Hasil OK'],
                $row['Hasil NG'],
                $row['Status'],
                $row['Tanggal Selesai'],
            ]);

            fclose($file);
        };

        return response()->stream($callback, 200, $headers);
    }
}
