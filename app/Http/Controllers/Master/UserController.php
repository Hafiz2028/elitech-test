<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use App\Models\Department;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Validation\Rules;
use Inertia\Inertia;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Master/Users/Index', [
            'users' => User::with(['role', 'department'])
                ->where('id', '!=', Auth::id()) // <- Perubahan di sini
                ->latest()
                ->paginate(10),        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // Kirim data roles dan departments untuk form dropdown
        return Inertia::render('Master/Users/Create', [
            'roles' => Role::all(),
            'departments' => Department::all(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|lowercase|email|max:255|unique:'.User::class,
            'role_id' => 'required|exists:roles,id',
            'department_id' => 'required|exists:departments,id',
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        // Hash password sebelum disimpan ke database
        $validated['password'] = Hash::make($validated['password']);

        User::create($validated);

        return Redirect::route('users.index')->with('success', 'Pengguna berhasil ditambahkan.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        return Inertia::render('Master/Users/Edit', [
            'user' => $user->load('role', 'department'), // Load relasi untuk data default
            'roles' => Role::all(),
            'departments' => Department::all(),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|lowercase|email|max:255|unique:users,email,'.$user->id,
            'role_id' => 'required|exists:roles,id',
            'department_id' => 'required|exists:departments,id',
            'password' => ['nullable', 'confirmed', Rules\Password::defaults()],
        ]);

        // Cek jika password diisi, maka hash dan update. Jika tidak, abaikan.
        if ($request->filled('password')) {
            $validated['password'] = Hash::make($validated['password']);
        } else {
            // Hapus key password dari array jika tidak diisi
            unset($validated['password']);
        }

        $user->update($validated);

        return Redirect::route('users.index')->with('success', 'Pengguna berhasil diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        $user->delete();

        return Redirect::route('users.index')->with('success', 'Pengguna berhasil dihapus.');
    }

    /**
     * Display a listing of the trashed resources.
     */
    public function trash()
    {
        return Inertia::render('Master/Users/Trash', [
            'users' => User::with(['role', 'department'])->onlyTrashed()->latest()->paginate(10),
        ]);
    }

    /**
     * Restore the specified resource from trash.
     */
    public function restore($id)
    {
        $user = User::onlyTrashed()->findOrFail($id);
        $user->restore();

        return Redirect::route('users.trash')->with('success', 'Pengguna berhasil dipulihkan.');
    }

    /**
     * Force delete the specified resource from storage.
     */
    public function forceDelete($id)
    {
        $user = User::onlyTrashed()->findOrFail($id);
        $user->forceDelete();

        return Redirect::route('users.trash')->with('success', 'Pengguna berhasil dihapus permanen.');
    }
}
