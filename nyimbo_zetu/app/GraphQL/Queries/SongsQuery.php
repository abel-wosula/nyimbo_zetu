<?php

namespace App\GraphQL\Queries;

use App\Models\Song;

class SongsQuery
{
    public function fetchSongs($_, $args)
    {
        $songs = Song::query()
            ->orderBy('title', 'DESC');
        $search = $args['search'];

        if (isset($search) && $search !== '') {
            $songs->where('title', 'LIKE', "%{$search}%")
                ->orWhere('artists', 'LIKE', "%{$search}%")
                ->orWhere('composer', 'LIKE', "%$search%")
                ->orWhere('lyrics', 'LIKE', "%$search%");
        }

        return $songs;
    }
}
