<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;

class CreateUserMutationTest extends TestCase
{
    use RefreshDatabase;

    public function test_create_user_mutation_works()
    {
        $mutation = '
            mutation {
                createUser(
                    name: "John Doe",
                    email: "johndoe@example.com",
                    password: "secret123"
                ) {
                    id
                    name
                    email
                }
            }
        ';

        $response = $this->postJson('/graphql', [
            'query' => $mutation,
        ]);

        $response->assertStatus(200);

        $response->assertJson([
            'data' => [
                'createUser' => [
                    'name' => 'John Doe',
                    'email' => 'johndoe@example.com',
                ]
            ]
        ]);

        $this->assertDatabaseHas('users', [
            'email' => 'johndoe@example.com',
        ]);
    }
}
