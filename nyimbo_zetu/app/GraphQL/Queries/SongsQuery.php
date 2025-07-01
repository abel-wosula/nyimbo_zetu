<?php

namespace App\GraphQL\Queries;

use App\Models\Song;

class SongsQuery
{
    public function __invoke($root, array $args)
    {
        $query = Song::query();

        if (!empty($args['search'])) {
            $query->where(function ($q) use ($args) {
                $q->where('title', 'like', '%' . $args['search'] . '%')
                    ->orWhere('composer', 'like', '%' . $args['search'] . '%')
                    ->orWhere('artists', 'like', '%' . $args['search'] . '%')
                    ->orWhere('lyrics', 'like', '%' . $args['search'] . '%');
            });
        }

        if (!empty($args['user_id'])) {
            $query->where('user_id', $args['user_id']);
        }

        return $query;
    }
}
