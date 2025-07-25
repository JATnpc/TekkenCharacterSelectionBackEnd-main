<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    // Return all favorite characters for the logged-in user
    public function index(Request $request)
    {
        $favorites = $request->user()->favorites()->get();
        return response()->json($favorites);
    }

    // Toggle favorite status for a character (add or remove from favorites)
    public function toggle(Request $request, $characterId)
    {
        $user = $request->user();
        
        if ($user->favorites()->where('character_id', $characterId)->exists()) {
            // If already favorited, remove from favorites
            $user->favorites()->detach($characterId);
            return response()->json(['message' => 'Unfavorited']);
        } else {
            // Otherwise, add to favorites
            $user->favorites()->attach($characterId);
            return response()->json(['message' => 'Favorited']);
        }
    }
}
