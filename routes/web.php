<?php

use Inertia\Inertia;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Application;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\Master\UserController;
use App\Http\Controllers\Master\ProductController;
use App\Http\Controllers\PPIC\ProductionPlanController;
use App\Http\Controllers\Report\ProductionReportController;
use App\Http\Controllers\Produksi\ProductionOrderController;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', [DashboardController::class, 'index'])
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::middleware('auth')->group(function () {
    // Rute untuk Profile
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // --- MASTER DATA ---
    Route::resource('products', ProductController::class)->except(['show']);
    // Rute tambahan untuk fitur soft delete produk
    Route::get('products/trash', [ProductController::class, 'trash'])->name('products.trash');
    Route::patch('products/{product}/restore', [ProductController::class, 'restore'])->name('products.restore');
    Route::delete('products/{product}/force-delete', [ProductController::class, 'forceDelete'])->name('products.forceDelete');

    Route::resource('users', UserController::class)->except(['show']);
    // Rute tambahan untuk fitur soft delete produk
    Route::get('users/trash', [UserController::class, 'trash'])->name('users.trash');
    Route::patch('users/{user}/restore', [UserController::class, 'restore'])->name('users.restore');
    Route::delete('users/{user}/force-delete', [UserController::class, 'forceDelete'])->name('users.forceDelete');

    // --- MODUL PPIC ---
    Route::resource('production-plans', ProductionPlanController::class)->except(['show']);
    // Tambahan rute untuk approval
    Route::patch('production-plans/{production_plan}/approve', [ProductionPlanController::class, 'approve'])->name('production-plans.approve');
    Route::patch('production-plans/{production_plan}/reject', [ProductionPlanController::class, 'reject'])->name('production-plans.reject');

    // --- MODUL PRODUKSI ---
    Route::get('production-orders', [ProductionOrderController::class, 'index'])->name('production-orders.index');
    // Tambahan rute untuk update status
    Route::patch('production-orders/{production_order}/start', [ProductionOrderController::class, 'start'])->name('production-orders.start');
    Route::patch('production-orders/{production_order}/finish', [ProductionOrderController::class, 'finish'])->name('production-orders.finish');
    Route::get('production-orders/{production_order}/history', [ProductionOrderController::class, 'history'])->name('production-orders.history');

    // --- MODUL LAPORAN ---
    Route::get('/reports/production', [ProductionReportController::class, 'index'])->name('reports.production.index');
    Route::get('/reports/production/export', [ProductionReportController::class, 'export'])->name('reports.production.export');
    Route::get('/reports/production/{production_order}/export', [App\Http\Controllers\Report\ProductionReportController::class, 'exportSingle'])->name('reports.production.exportSingle');
    Route::get('/reports/production/search-orders', [App\Http\Controllers\Report\ProductionReportController::class, 'searchOrders'])->name('reports.production.searchOrders');

    Route::get('/reports/ppic', [App\Http\Controllers\Report\PpicReportController::class, 'index'])->name('reports.ppic.index');
    Route::get('/reports/ppic/export', [App\Http\Controllers\Report\PpicReportController::class, 'export'])->name('reports.ppic.export');
    Route::get('/reports/ppic/search-plans', [App\Http\Controllers\Report\PpicReportController::class, 'searchPlans'])->name('reports.ppic.searchPlans');
});

require __DIR__.'/auth.php';
