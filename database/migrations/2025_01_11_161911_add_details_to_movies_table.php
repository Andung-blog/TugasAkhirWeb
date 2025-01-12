<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddDetailsToMoviesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('movies', function (Blueprint $table) {
            $table->string('genre')->nullable(); // Added genre
            $table->string('director')->nullable(); // Added director
            $table->decimal('rating', 3, 1)->nullable(); // Added rating (e.g., 8.5)
            $table->string('video_url')->nullable(); // Added video_url (e.g., YouTube link)
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('movies', function (Blueprint $table) {
            $table->dropColumn(['genre', 'director', 'rating', 'video_url']);
        });
    }
}
