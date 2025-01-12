<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    /**
     * Store a newly created movie in the database.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|string',
            'date' => 'required|date',
            'genre' => 'required|string',
            'director' => 'required|string',
            'rating' => 'required|numeric|min:0|max:10',
            'image' => 'nullable|url', // Validate image as URL
            'video_url' => 'nullable|url', // Validate video URL
        ]);

        // Create and return the movie record
        $movie = Movie::create($validated);
        return response()->json($movie, 201);
    }

    /**
     * Update the specified movie in the database.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $movie = Movie::find($id);
        if (!$movie) {
            return response()->json(['message' => 'Movie not found'], 404); // Return error if movie not found
        }

        // Validate incoming data
        $validated = $request->validate([
            'title' => 'nullable|string',
            'date' => 'nullable|date',
            'genre' => 'nullable|string',
            'director' => 'nullable|string',
            'rating' => 'nullable|numeric|min:0|max:10',
            'image' => 'nullable|url', // Validate image as URL
            'video_url' => 'nullable|url', // Validate video URL
        ]);

        $movie->update($validated); // Update movie record
        return response()->json($movie);
    }

    /**
     * Display a listing of movies for the client side.
     */
    public function index()
    {
        return response()->json(Movie::all());
    }

    /**
     * Remove the specified movie from the database.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $movie = Movie::find($id);
        if (!$movie) {
            return response()->json(['message' => 'Movie not found'], 404);
        }
        $movie->delete();
        return response()->json(['message' => 'Movie deleted']);
    }
}
