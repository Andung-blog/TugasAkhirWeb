<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use Illuminate\Http\Request;

class TicketController extends Controller
{
    // Fetch all tickets
    public function index()
    {
        // Eager load the 'movie' relationship (if applicable)
        $tickets = Ticket::with('movie')->get();
        return response()->json($tickets);
    }

    // Store a new ticket
    public function store(Request $request)
    {
        $ticket = Ticket::create([
            'movie_id' => $request->movieId,
            'user_name' => $request->userName,
            'seat' => $request->seat,
            'price' => $request->price,
        ]);

        // Return the created ticket
        return response()->json($ticket, 201);
    }

    // Update an existing ticket
    public function update(Request $request, $id)
    {
        $ticket = Ticket::findOrFail($id);
        $ticket->update([
            'movie_id' => $request->movieId,
            'user_name' => $request->userName,
            'seat' => $request->seat,
            'price' => $request->price,
        ]);

        return response()->json($ticket);
    }

    // Delete a ticket by ID
    public function destroy($id)
    {
        $ticket = Ticket::findOrFail($id);
        $ticket->delete();

        return response()->json(['message' => 'Ticket deleted successfully']);
    }
}
