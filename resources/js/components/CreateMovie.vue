<template>
    <div>
        <h3 class="text-xl font-semibold mb-3">Add a New Movie</h3>
        <form @submit.prevent="addMovie">
            <input
                v-model="newMovie.title"
                type="text"
                placeholder="Movie Title"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newMovie.date"
                type="date"
                placeholder="Release Date"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newMovie.image"
                type="text"
                placeholder="Image URL"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newMovie.genre"
                type="text"
                placeholder="Genre"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newMovie.director"
                type="text"
                placeholder="Director"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newMovie.rating"
                type="number"
                step="0.1"
                min="0"
                max="10"
                placeholder="Rating (0-10)"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newMovie.video_url"
                type="text"
                placeholder="Video URL"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <button
                type="submit"
                class="bg-blue-900 px-6 py-2 rounded-lg hover:bg-blue-600"
            >
                Add Movie
            </button>
        </form>
    </div>
</template>

<script>
import axios from "axios";

export default {
    data() {
        return {
            newMovie: {
                title: "",
                date: "",
                image: "",
                genre: "",
                director: "",
                rating: "",
                video_url: "",
            },
        };
    },
    methods: {
        addMovie() {
            axios
                .post("/api/movies", this.newMovie)
                .then((response) => {
                    this.$emit("movieAdded", response.data); // Emit event to parent to refresh movie list
                    this.newMovie = {
                        title: "",
                        date: "",
                        image: "",
                        genre: "",
                        director: "",
                        rating: "",
                        video_url: "",
                    };
                })
                .catch((error) => {
                    console.error("Error adding movie:", error);
                });
        },
    },
};
</script>
