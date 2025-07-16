<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User; // Import User model

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

    // Add favoredBy relationship
    public function favoredBy()
    {
        return $this->belongsToMany(User::class, 'favorites');
    }
}
