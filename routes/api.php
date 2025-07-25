<?php

// Defines API routes for the application

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CharacterController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FavoriteController;

// AUTH ROUTES
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);

// CHARACTER ROUTES (public for now)
Route::get('characters', [CharacterController::class, 'index']);
Route::get('characters/{id}', [CharacterController::class, 'show']);
Route::post('characters', [CharacterController::class, 'store']);
Route::put('characters/{id}', [CharacterController::class, 'update']);
Route::delete('characters/{id}', [CharacterController::class, 'destroy']);

// FAVORITES ROUTES (protected by auth:sanctum)
Route::middleware('auth:sanctum')->group(function () {
    Route::get('favorites', [FavoriteController::class, 'index']);
    Route::post('favorites/toggle/{characterId}', [FavoriteController::class, 'toggle']);
});
