<template>
    <div
        class="fixed inset-0 bg-gray-500 bg-opacity-50 flex justify-center items-center z-50"
    >
        <div class="bg-white p-6 rounded-lg w-1/3">
            <h3 class="text-2xl font-semibold mb-4">Edit Movie</h3>
            <form @submit.prevent="updateMovie">
                <input
                    v-model="movieData.title"
                    type="text"
                    placeholder="Movie Title"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="movieData.date"
                    type="date"
                    placeholder="Release Date"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="movieData.image"
                    type="text"
                    placeholder="Image URL"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="movieData.genre"
                    type="text"
                    placeholder="Genre"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="movieData.director"
                    type="text"
                    placeholder="Director"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="movieData.rating"
                    type="number"
                    step="0.1"
                    min="0"
                    max="10"
                    placeholder="Rating (0-10)"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="movieData.video_url"
                    type="text"
                    placeholder="Video URL"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <button
                    type="submit"
                    class="bg-blue-900 px-6 py-2 rounded-lg hover:bg-blue-600 w-full"
                >
                    Update Movie
                </button>
            </form>
            <button
                @click="closeModal"
                class="text-gray-500 hover:text-gray-800 mt-4 w-full"
            >
                Cancel
            </button>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    props: {
        movie: Object,
    },
    data() {
        return {
            movieData: { ...this.movie },
        };
    },
    methods: {
        updateMovie() {
            axios
                .put(`/api/movies/${this.movie.id}`, this.movieData)
                .then(() => {
                    this.$emit("movieUpdated");
                    this.$emit("close");
                })
                .catch((error) => {
                    console.error("Error updating movie:", error);
                });
        },
        closeModal() {
            this.$emit("close");
        },
    },
};
</script>

<style scoped>
button {
    cursor: pointer;
}
</style>
