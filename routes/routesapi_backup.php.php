<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CharacterController;
use App\Http\Controllers\AuthController;

// AUTH ROUTES
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->post('logout', [AuthController::class, 'logout']);


// CHARACTER ROUTES (these are public now, but you might want to protect them later)
Route::get('characters', [CharacterController::class, 'index']);
Route::get('characters/{id}', [CharacterController::class, 'show']);
Route::post('characters', [CharacterController::class, 'store']);
Route::put('characters/{id}', [CharacterController::class, 'update']);
Route::delete('characters/{id}', [CharacterController::class, 'destroy']);
