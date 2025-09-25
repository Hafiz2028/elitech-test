<?php

namespace Database\Seeders;

use App\Models\Department;
use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        // Ambil ID dari Role dan Department
        $managerRole = Role::where('name', 'Manager')->first();
        $ppicRole = Role::where('name', 'Staff PPIC')->first();
        $produksiRole = Role::where('name', 'Staff Produksi')->first();

        $ppicDept = Department::where('name', 'PPIC')->first();
        $produksiDept = Department::where('name', 'Produksi')->first();

        $defaultPassword = Hash::make('admin');

        // 1. Buat user spesifik untuk pengujian
        User::create([
            'name' => 'Manager PPIC',
            'email' => 'managerppic@mail.com',
            'password' => $defaultPassword,
            'role_id' => $managerRole->id,
            'department_id' => $ppicDept->id,
        ]);
        User::create([
            'name' => 'Manager Produksi',
            'email' => 'managerproduksi@mail.com',
            'password' => $defaultPassword,
            'role_id' => $managerRole->id,
            'department_id' => $produksiDept->id,
        ]);
        User::create([
            'name' => 'Staff PPIC',
            'email' => 'staffppic@mail.com',
            'password' => $defaultPassword,
            'role_id' => $ppicRole->id,
            'department_id' => $ppicDept->id,
        ]);
        User::create([
            'name' => 'Staff Produksi',
            'email' => 'staffproduksi@mail.com',
            'password' => $defaultPassword,
            'role_id' => $produksiRole->id,
            'department_id' => $produksiDept->id,
        ]);

        // 2. Buat 50 user acak lainnya
        User::factory()->count(50)->create();
    }
}
