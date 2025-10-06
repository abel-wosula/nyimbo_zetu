<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'email',
        'first_name',
        'last_name',
        'phone_number',
        'address',
        'password',
        'image', // Added image field
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * Return a display name for Filament and other UI components.
     */
    public function getFilamentName(): string
    {
        return trim("{$this->first_name} {$this->last_name}") ?: $this->email;
    }

    /**
     * Optionally, define a 'name' accessor for compatibility with packages
     * expecting a 'name' attribute on the User model.
     */
    public function getNameAttribute(): string
    {
        return trim("{$this->first_name} {$this->last_name}") ?: $this->email;
    }
}
