<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\PeopleController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\TicketController;

// Public Routes
Route::get('/', function () {
    return view('welcome');
});


//movies
Route::get('/api/movies', [MovieController::class, 'index']);
Route::post('/api/movies', [MovieController::class, 'store']);     // Create a new movie
Route::get('/api/movies/{id}', [MovieController::class, 'show']);  // Get a single movie
Route::put('/api/movies/{id}', [MovieController::class, 'update']); // Update a movie
Route::delete('/api/movies/{id}', [MovieController::class, 'destroy']); // Delete a movie


//people
Route::get('/api/people', [PeopleController::class, 'index']);
Route::post('/api/people', [PeopleController::class, 'store']);
Route::get('/api/people/{id}', [PeopleController::class, 'show']); 
Route::put('/api/people/{id}', [PeopleController::class, 'update']);
Route::delete('/api/people/{id}', [PeopleController::class, 'destroy']);

//contact
Route::get('/api/messages', [MessageController::class, 'index']); // Fetch all messages
Route::post('/api/messages', [MessageController::class, 'store']); // Create a new message
Route::put('/api/messages/{id}', [MessageController::class, 'update']); // Update an existing message
Route::delete('/api/messages/{id}', [MessageController::class, 'destroy']); // Delete a message

//ticket
Route::get('/api/tickets', [TicketController::class, 'index']);
Route::post('/api/tickets', [TicketController::class, 'store']);
Route::put('/api/tickets/{id}', [TicketController::class, 'update']);
Route::delete('/api/tickets/{id}', [TicketController::class, 'destroy']);