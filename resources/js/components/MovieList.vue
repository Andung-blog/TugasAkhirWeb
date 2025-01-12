<template>
    <div class="container mx-auto px-6 py-8">
        <h2 class="text-3xl font-bold text-center mb-6">Movie List</h2>

        <!-- Add Movie Form Component -->
        <create-movie @movieAdded="fetchMovies" />

        <!-- Movie List -->
        <div v-if="movies.length > 0">
            <h3 class="text-xl font-semibold mb-4">Movies</h3>
            <ul>
                <li
                    v-for="(movie, index) in movies"
                    :key="movie.id"
                    class="flex justify-between items-center mb-4 p-4 border-b-2"
                >
                    <div class="flex items-center space-x-4">
                        <img
                            v-if="movie.image"
                            :src="movie.image"
                            alt="Movie Image"
                            class="w-16 h-24 object-cover rounded-lg"
                        />
                        <div>
                            <h4 class="text-lg font-bold">{{ movie.title }}</h4>
                            <p>{{ movie.date }}</p>
                            <p><strong>Genre:</strong> {{ movie.genre }}</p>
                            <p>
                                <strong>Director:</strong> {{ movie.director }}
                            </p>
                            <p><strong>Rating:</strong> {{ movie.rating }}</p>
                        </div>
                    </div>

                    <!-- Update and Delete buttons -->
                    <div class="space-x-4">
                        <button
                            @click="openEditModal(movie)"
                            class="bg-yellow-500 px-4 py-2 rounded-lg hover:bg-yellow-300"
                        >
                            Edit
                        </button>
                        <button
                            @click="openDeleteModal(movie)"
                            class="bg-red-500 px-4 py-2 rounded-lg hover:bg-red-300"
                        >
                            Delete
                        </button>
                    </div>
                </li>
            </ul>
        </div>

        <div v-else>
            <p class="text-center text-gray-500">
                No movies available. Add a movie!
            </p>
        </div>

        <!-- Edit Movie Modal -->
        <edit-movie
            v-if="showEditModal"
            :movie="selectedMovie"
            @movieUpdated="fetchMovies"
            @close="closeEditModal"
        />

        <!-- Delete Movie Modal -->
        <delete-movie
            v-if="showDeleteModal"
            :movie="selectedMovie"
            @movieDeleted="fetchMovies"
            @close="closeDeleteModal"
        />
    </div>
</template>

<script>
import axios from "axios";
import CreateMovie from "./CreateMovie.vue";
import EditMovie from "./UpdateMovie.vue";
import DeleteMovie from "./DeleteMovie.vue";

export default {
    components: {
        CreateMovie,
        EditMovie,
        DeleteMovie,
    },
    data() {
        return {
            movies: [],
            showEditModal: false,
            showDeleteModal: false,
            selectedMovie: null,
        };
    },
    created() {
        this.fetchMovies();
    },
    methods: {
        fetchMovies() {
            axios
                .get("/api/movies")
                .then((response) => {
                    this.movies = response.data;
                })
                .catch((error) => {
                    console.error("Error fetching movies:", error);
                });
        },
        openEditModal(movie) {
            this.selectedMovie = movie;
            this.showEditModal = true;
        },
        closeEditModal() {
            this.showEditModal = false;
            this.selectedMovie = null;
        },
        openDeleteModal(movie) {
            this.selectedMovie = movie;
            this.showDeleteModal = true;
        },
        closeDeleteModal() {
            this.showDeleteModal = false;
            this.selectedMovie = null;
        },
    },
};
</script>

<style scoped>
button {
    cursor: pointer;
}

.container {
    padding-left: 2rem;
    padding-right: 2rem;
}

li {
    border-bottom: 1px solid #e5e7eb;
}

button:hover {
    opacity: 0.8;
}
</style>
