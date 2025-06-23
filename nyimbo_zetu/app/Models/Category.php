<?php 

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model as BaseModel;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\Song;
use Illuminate\Database\Eloquent\Relations\BelongsTo;




class Category extends BaseModel
{
    use HasFactory;

    protected $table = 'category';

    protected $fillable = [
        'name'
    ];

    public function songs(): HasMany
    {
        return $this->hasMany(Song::class);
    }

    public function parentCategory(): BelongsTo
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }
}