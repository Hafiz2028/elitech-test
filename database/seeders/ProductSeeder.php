<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Hapus data lama untuk menghindari duplikasi SKU
        Product::query()->delete();

        Product::create(['sku' => 'ELT-001', 'name' => 'Velg Mobil Ring 15', 'description' => 'Velg alloy untuk mobil sedan.']);
        Product::create(['sku' => 'ELT-002', 'name' => 'Blok Mesin Diesel', 'description' => 'Blok mesin untuk kendaraan diesel 2500cc.']);
        Product::create(['sku' => 'ELT-003', 'name' => 'Gearbox Manual 5-Speed', 'description' => 'Gearbox transmisi manual 5 percepatan.']);
        Product::create(['sku' => 'ELT-004', 'name' => 'Busi Iridium', 'description' => 'Busi performa tinggi untuk efisiensi bahan bakar.']);
        Product::create(['sku' => 'ELT-005', 'name' => 'Filter Oli', 'description' => 'Filter oli standar untuk berbagai jenis mobil.']);

        // Buat 100 produk tambahan menggunakan factory
        Product::factory()->count(100)->create();
    }
}
