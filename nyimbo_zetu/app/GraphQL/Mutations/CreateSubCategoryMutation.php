<?php


namespace App\GraphQL\Mutations;

use App\Models\SubCategory;

class CreateSubCategoryMutation
{
    public function createSubCategory($_, array $args)
    {
        // Validate and create the subcategory
        $subcategory = SubCategory::create([
            'name' => $args['name'],
            'category_id' => $args['category_id']
            
        ]);

        return [
            'subcategory' => $subcategory,
            'message' => 'Subcategory created successfully',
        ];
    }   
}

