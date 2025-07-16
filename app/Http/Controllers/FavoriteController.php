<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FavoriteController extends Controller
{
    // List all favorites of the logged-in user
    public function index(Request $request)
    {
        $favorites = $request->user()->favorites()->get();
        return response()->json($favorites);
    }

    // Toggle favorite/unfavorite a character
    public function toggle(Request $request, $characterId)
    {
        $user = $request->user();

        if ($user->favorites()->where('character_id', $characterId)->exists()) {
            $user->favorites()->detach($characterId);
            return response()->json(['message' => 'Unfavorited']);
        } else {
            $user->favorites()->attach($characterId);
            return response()->json(['message' => 'Favorited']);
        }
    }
}
