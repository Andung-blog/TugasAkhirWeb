<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->id(); // Auto-incrementing ID
            $table->string('movie_id'); // Movie ID (Foreign key can be added later if necessary)
            $table->string('user_name'); // User name
            $table->string('seat'); // Seat number
            $table->decimal('price', 8, 2); // Price of the ticket
            $table->timestamps(); // Created at and updated at timestamps
        });
    }

    public function down()
    {
        Schema::dropIfExists('tickets');
    }
}
