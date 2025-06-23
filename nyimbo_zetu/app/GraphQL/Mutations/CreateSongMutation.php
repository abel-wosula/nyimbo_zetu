<?php


namespace App\GraphQL\Mutations;

use App\Models\Song;

class CreateSongMutation
{
    public function createSong($_, array $args)
    {
        // Validate and create the song
        $song = Song::create([
            'title' => $args['title'],
            'composer' => $args['composer'],
            'lyrics' => $args['lyrics'],
            'midi' => $args['midi'] ?? null,
            'pdf' => $args['pdf'] ?? null,
            'ytlink' => $args['ytlink'] ?? null,
            'user_id' => $args['user_id'], // Assuming user_id is passed in args
            'subcategory_id' => $args['subcategory_id'], // Assuming subcategory_id is passed in args
            

        ]);

        return [
            'song' => $song,
            'message' => 'Song created successfully',
        ];
    }   
}

