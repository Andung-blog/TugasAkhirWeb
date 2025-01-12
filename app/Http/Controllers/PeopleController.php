<?php

namespace App\Http\Controllers;

use App\Models\People;
use Illuminate\Http\Request;

class PeopleController extends Controller
{
    /**
     * Store a newly created person in the database.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'role' => 'required|string',
            'known_for' => 'required|string',
            'image' => 'nullable|url',
        ]);

        // Create and return the person record
        $person = People::create($validated);
        return response()->json($person, 201);
    }

    /**
     * Update the specified person in the database.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $person = People::find($id);
        if (!$person) {
            return response()->json(['message' => 'Person not found'], 404);
        }

        // Validate incoming data
        $validated = $request->validate([
            'name' => 'nullable|string',
            'role' => 'nullable|string',
            'known_for' => 'nullable|string',
            'image' => 'nullable|url',
        ]);

        $person->update($validated); // Update person record
        return response()->json($person);
    }

    /**
     * Display a listing of people for the client side.
     */
    public function index()
    {
        return response()->json(People::all());
    }

    /**
     * Remove the specified person from the database.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $person = People::find($id);
        if (!$person) {
            return response()->json(['message' => 'Person not found'], 404);
        }
        $person->delete();
        return response()->json(['message' => 'Person deleted']);
    }
}
