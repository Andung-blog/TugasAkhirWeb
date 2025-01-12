<template>
    <div
        class="fixed inset-0 bg-gray-500 bg-opacity-50 flex justify-center items-center z-50"
    >
        <div class="bg-white p-6 rounded-lg w-1/3">
            <h3 class="text-2xl font-semibold mb-4">Delete Movie</h3>
            <p>Are you sure you want to delete this movie?</p>
            <div class="mt-4">
                <button
                    @click="deleteMovie"
                    class="bg-red-500 px-6 py-2 rounded-lg hover:bg-red-600 w-full mb-2"
                >
                    Delete
                </button>
                <button
                    @click="closeModal"
                    class="text-gray-500 hover:text-gray-800 w-full"
                >
                    Cancel
                </button>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    props: {
        movie: Object,
    },
    methods: {
        deleteMovie() {
            axios
                .delete(`/api/movies/${this.movie.id}`)
                .then(() => {
                    this.$emit("movieDeleted");
                    this.$emit("close");
                })
                .catch((error) => {
                    console.error("Error deleting movie:", error);
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
