<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;

class MessageController extends Controller
{
    // Fetch all messages (Read)
    public function index()
    {
        $messages = Message::all();
        return response()->json($messages);
    }

    // Store a new message (Create)
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'message' => 'required|string',
        ]);

        $message = Message::create([
            'name' => $request->name,
            'email' => $request->email,
            'message' => $request->message,
        ]);

        return response()->json($message, 201);
    }

    // Update an existing message (Update)
    public function update(Request $request, $id)
    {
        $message = Message::findOrFail($id);

        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'message' => 'required|string',
        ]);

        $message->update([
            'name' => $request->name,
            'email' => $request->email,
            'message' => $request->message,
        ]);

        return response()->json($message);
    }

    // Delete a message (Delete)
    public function destroy($id)
    {
        $message = Message::findOrFail($id);
        $message->delete();

        return response()->json(null, 204);
    }
}
