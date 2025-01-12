<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\People;

class PeopleSeeder extends Seeder
{
    public function run()
    {
        People::create([
            'name' => 'Leonardo DiCaprio',
            'role' => 'Actor',
            'known_for' => 'Inception',
            'image' => 'https://example.com/leonardo.jpg',
        ]);

        People::create([
            'name' => 'Scarlett Johansson',
            'role' => 'Actress',
            'known_for' => 'Black Widow',
            'image' => 'https://example.com/scarlett.jpg',
        ]);
    }
}
