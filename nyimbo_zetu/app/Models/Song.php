<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model as BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\User;
use App\Models\SubCategory;
use Illuminate\Database\Eloquent\Relations\HasMany;



class  Song extends BaseModel
{
    use HasFactory;

    protected $table = 'songs';

    protected $fillable = [
        'artists',
        'title',
        'lyrics',
        'composer',
        'midi',
        'pdf',
        'ytlink',
        'subcategory_id',
        'user_id'
        
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function subCategory(): BelongsTo
    {
        return $this->belongsTo(SubCategory::class);
    }
}