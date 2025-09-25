<?php

namespace Database\Factories;

use App\Models\Role;
use App\Models\Department;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    protected static ?string $password;

    public function definition(): array
    {
        $role = Role::inRandomOrder()->first();
        $department = $role->name === 'Manager'
            ? Department::inRandomOrder()->first()
            : Department::where('name', $role->name === 'Staff PPIC' ? 'PPIC' : 'Produksi')->first();

        return [
            'name' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' => static::$password ??= Hash::make('password'),
            'remember_token' => Str::random(10),
            'role_id' => $role->id,
            'department_id' => $department->id,
        ];
    }
}
