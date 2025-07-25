<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

// Migration for creating the characters table
return new class extends Migration
{
    /**
     * Run the migrations.
     */
 public function up(): void
{
    Schema::create('characters', function (Blueprint $table) {
    $table->id();
    $table->string('name');
    $table->string('tagline')->nullable();
    $table->string('country')->nullable();
    $table->string('fighting_style')->nullable(); // ← FIXED THIS
    $table->text('description');
    $table->integer('rarity')->nullable();
    $table->string('image')->nullable();
    $table->timestamps();
});

}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('characters');
    }
};
