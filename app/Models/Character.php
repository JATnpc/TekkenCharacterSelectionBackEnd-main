<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Character extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'tagline',
        'country',
        'fighting_style',
        'description',
        'rarity',
        'image',
    ];

    // Many-to-many relationship: character can be favored by many users
    public function favoredBy()
    {
        return $this->belongsToMany(User::class, 'favorites');
    }
}
