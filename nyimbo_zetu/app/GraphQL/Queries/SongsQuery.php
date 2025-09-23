<?php

namespace App\GraphQL\Queries;

use App\Models\Song;
use Illuminate\Support\Facades\Log;

class SongsQuery
{

    public function __invoke($root, array $args)
    {
        $query = Song::query();

        $search = $args['songsSearch']['search'] ?? null;
        $userId = $args['songsSearch']['user_id'] ?? null;

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', '%' . $search . '%')
                    ->orWhere('composer', 'like', '%' . $search . '%')
                    ->orWhere('artists', 'like', '%' . $search . '%')
                    ->orWhere('lyrics', 'like', '%' . $search . '%');
            });
        }

        if ($userId) {
            $query->where('user_id', $userId);
        }

        Log::info('SongsQuery Filters:', ['search' => $search, 'user_id' => $userId]);

        return $query;
    }
}
