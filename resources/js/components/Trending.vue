<template>
    <div class="trending-section p-6">
        <h2 class="text-2xl font-bold mb-4">Trending</h2>
        <div class="flex space-x-4 mb-6">
            <button
                class="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600"
            >
                Today
            </button>
            <button
                class="px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300"
            >
                This Week
            </button>
        </div>
        <div
            class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-6"
        >
            <div
                v-for="movie in movies"
                :key="movie.id"
                class="card bg-white rounded-lg shadow-lg overflow-hidden hover:scale-105 transform transition duration-300 ease-in-out cursor-pointer"
                @click="openMovieDetail(movie)"
            >
                <img
                    :src="movie.image"
                    alt="Movie"
                    class="w-full h-64 object-cover"
                />
                <div class="p-4">
                    <h3 class="text-lg font-semibold">{{ movie.title }}</h3>
                    <p class="text-sm text-gray-500">{{ movie.date }}</p>
                </div>
            </div>
        </div>

        <!-- Modal for Movie Detail -->
        <movie-detail
            v-if="showModal"
            :movie="selectedMovie"
            @close="closeModal"
        />
    </div>
</template>

<script>
import axios from "axios";
import MovieDetail from "./MovieDetail.vue";

export default {
    name: "Trending",
    components: {
        MovieDetail,
    },
    data() {
        return {
            movies: [], // Array for storing movies data
            showModal: false, // State to control modal visibility
            selectedMovie: {}, // Store selected movie details
        };
    },
    created() {
        this.fetchMovies(); // Fetch movie data when component is created
    },
    methods: {
        async fetchMovies() {
            try {
                const response = await axios.get("/api/movies"); // Fetch movies from API
                this.movies = response.data; // Store movies in the component's state
            } catch (error) {
                console.error("Error fetching movies:", error);
            }
        },
        // Open the movie details in a modal
        openMovieDetail(movie) {
            this.selectedMovie = movie;
            this.showModal = true;
        },
        // Close the modal
        closeModal() {
            this.showModal = false;
            this.selectedMovie = {}; // Reset selected movie details
        },
    },
};
</script>

<style scoped>
.card:hover {
    transform: scale(1.05);
    transition: transform 0.2s;
}

.card {
    cursor: pointer;
}
</style>
