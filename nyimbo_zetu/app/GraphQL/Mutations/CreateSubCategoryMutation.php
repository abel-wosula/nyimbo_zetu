<?php


namespace App\GraphQL\Mutations;

use App\Models\SubCategory;

class CreateSubCategoryMutation
{
    public function createSubCategory($_, array $args)
    {
        // Validate and create the subcategory
        $subCategory = SubCategory::create([
            'name' => $args['name'],
            'category_id' => $args['category_id']
            
        ]);

        return [
            'subCategory' => $subCategory,
            'message' => 'Subcategory created successfully',
        ];
    }   
}

