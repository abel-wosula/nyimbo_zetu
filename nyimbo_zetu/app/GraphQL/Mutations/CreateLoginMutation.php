<?php


namespace App\GraphQL\Mutations;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use GraphQL\Type\Definition\ResolveInfo;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;


class CreateLoginMutation
{
    public function userLogin($root, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {


         $credentials = [
        'email' => $args['email'],
        'password' => $args['password'],
    ];

      if(!Auth::attempt($credentials)){
            return [
                'message' => 'Invalid credentials',
                'token'=>"",
                'user' => null
            ];
        }

        $user = Auth::user();
        $token = $user->createToken('auth_token')->plainTextToken;

        return [
            'token'=>$token ?: "",
            'user' => $user,
            'message' => 'Login successful',
        ];
    }
}