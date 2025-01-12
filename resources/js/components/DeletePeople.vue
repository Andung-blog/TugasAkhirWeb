<template>
    <div
        class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50"
    >
        <div class="bg-white p-6 rounded-lg w-1/3">
            <h3 class="text-2xl font-semibold mb-4">Delete Person</h3>
            <p>Are you sure you want to delete {{ person.name }}?</p>
            <div class="mt-4">
                <button
                    @click="deletePerson"
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
        person: Object,
    },
    methods: {
        deletePerson() {
            axios
                .delete(`/api/people/${this.person.id}`)
                .then(() => {
                    this.$emit("personDeleted");
                    this.$emit("close");
                })
                .catch((error) => {
                    console.error("Error deleting person:", error);
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
