<?php


namespace App\GraphQL\Mutations;

use App\Models\Category;

class CreateCategoryMutation
{
    public function createCategory($_, array $args)
    {
        // Validate and create the subcategory
        $Category = Category::create([
            'name' => $args['name']
        ]);

        return [
            'Category' => $Category,
            'message' => 'Category created successfully',
        ];
    }   
}

