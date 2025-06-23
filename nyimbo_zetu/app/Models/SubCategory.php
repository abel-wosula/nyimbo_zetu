<?php 



namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model as BaseModel;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\Models\Song;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\Category;



class SubCategory extends BaseModel
{
    use HasFactory;

    protected $table = 'subcategory';

    protected $fillable = [
        'name',
        'category_id'
    ];
    public function songs(): HasMany
    {
        return $this->hasMany(Song::class);
    }
    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class);
    }
}