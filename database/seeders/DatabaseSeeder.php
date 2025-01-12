<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        // Check if the admin user already exists
        if (User::where('email', 'admin@gmail.com')->doesntExist()) {
            User::create([
                'name' => 'Admin',
                'email' => 'admin@gmail.com',
                'password' => Hash::make('12345678'),  // Consider using an environment variable for password
                'role' => 'admin', // Set the role as admin
            ]);
        }
    }
}
