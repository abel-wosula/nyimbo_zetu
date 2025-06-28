<?php

namespace App\GraphQL\Mutations;

use App\Models\User;
use GraphQL\Type\Definition\ResolveInfo;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class CreateUserMutation
{
    public function createUser($root, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        $imagePath = null;

        if (isset($args['image'])) {
            $imagePath = $args['image']->store('uploads/profile_images', 'public');
        }

        $user = User::create([
            'email' => $args['email'],
            'first_name' => $args['first_name'],
            'last_name' => $args['last_name'],
            'phone_number' => $args['phone_number'],
            'address' => $args['address'],
            'password' => Hash::make($args['password']),
            'image' => $imagePath ? '/storage/' . $imagePath : null,
        ]);

        return [
            'user' => $user,
            'message' => 'User created successfully',
        ];
    }
}
