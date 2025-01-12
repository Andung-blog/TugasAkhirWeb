<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $fillable = ['movie_id', 'user_name', 'seat', 'price'];

    // Define the relationship to the movie (assuming movie_id exists in the tickets table)
    public function movie()
    {
        return $this->belongsTo(Movie::class);
    }
}
