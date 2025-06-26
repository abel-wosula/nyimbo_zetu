<?php

namespace Database\Factories;

use App\Models\Song;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class SongFactory extends Factory
{
    protected $model = Song::class;

    public function definition(): array
    {
        return [
            'title' => $this->faker->sentence(3),
            'artists' => $this->faker->name,
            'composer' => $this->faker->name,
            'lyrics' => $this->faker->paragraph,
            'midi' => 'uploads/midis/dummy.mid', // or use Storage::fake
            'pdf' => 'uploads/pdfs/dummy.pdf',
            'ytlink' => $this->faker->url,
            'subcategory_id' => \App\Models\SubCategory::inRandomOrder()->value('id'),
            'user_id' => \App\Models\User::inRandomOrder()->value('id'),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
