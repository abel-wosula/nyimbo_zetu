<?php

namespace App\GraphQL\Queries;

use App\Models\Song;

class SongsQuery
{
    public function fetchSongs($_, $args)
    {
        $songs = Song::query()->orderBy('id', 'ASC');

        $search = $args['search'] ?? '';

        if ($search !== '') {
            $songs->where(function ($query) use ($search) {
                $query->where('title', 'LIKE', "%{$search}%")
                    ->orWhere('artists', 'LIKE', "%{$search}%")
                    ->orWhere('composer', 'LIKE', "%{$search}%")
                    ->orWhere('lyrics', 'LIKE', "%{$search}%");
            });
        }

        return $songs; //DO NOT paginate here
    }
}
