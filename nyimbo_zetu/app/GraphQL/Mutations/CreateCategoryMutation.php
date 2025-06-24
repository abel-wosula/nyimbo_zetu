<?php


namespace App\GraphQL\Mutations;
use Illuminate\Support\Facades\Validator;

use App\Models\Category;

class CreateCategoryMutation
{
    public function createCategory($_, array $args)
    {
        // Validate the input
        Validator::make($args, [
            'name' => 'required|string|max:255',
        ])->validate();
        // Validate and create the subcategory
        $category = Category::create([
            'name' => $args['name']
        ]);

        return [
            'category' => $category,
            'message' => 'Category created successfully',
        ];
    }   
}

