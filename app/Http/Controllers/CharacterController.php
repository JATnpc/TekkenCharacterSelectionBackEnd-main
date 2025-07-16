<?php

namespace App\Http\Controllers;

use App\Models\Character;
use Illuminate\Http\Request;

class CharacterController extends Controller
{
    // Get all characters
    public function index()
    {
        return response()->json(Character::all(), 200);
    }

    // Get single character by ID
    public function show($id)
    {
        $character = Character::find($id);

        if (!$character) {
            return response()->json(['message' => 'Character not found'], 404);
        }

        return response()->json($character, 200);
    }

    // Create new character
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string',
            'tagline' => 'nullable|string',
            'country' => 'nullable|string',
            'fighting_style' => 'nullable|string',
            'description' => 'required|string',
            'rarity' => 'required|integer',
            'image' => 'nullable|string',
        ]);

        $character = Character::create($validatedData);

        return response()->json($character, 201);
    }

    // Update existing character
    public function update(Request $request, $id)
    {
        $character = Character::find($id);

        if (!$character) {
            return response()->json(['message' => 'Character not found'], 404);
        }

        $validatedData = $request->validate([
            'name' => 'required|string',
            'tagline' => 'nullable|string',
            'country' => 'nullable|string',
            'fighting_style' => 'nullable|string',
            'description' => 'required|string',
            'rarity' => 'required|integer',
            'image' => 'nullable|string',
        ]);

        $character->update($validatedData);

        return response()->json($character, 200);
    }

    // Delete character
    public function destroy($id)
    {
        $character = Character::find($id);

        if (!$character) {
            return response()->json(['message' => 'Character not found'], 404);
        }

        $character->delete();

        return response()->json(['message' => 'Character deleted successfully'], 200);
    }
}
