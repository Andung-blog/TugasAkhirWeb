<template>
    <div
        class="fixed inset-0 bg-gray-500 bg-opacity-50 flex justify-center items-center z-50"
    >
        <div class="bg-white p-6 rounded-lg w-1/3">
            <h3 class="text-2xl font-semibold mb-4">Edit Person</h3>
            <form @submit.prevent="updatePerson">
                <input
                    v-model="personData.name"
                    type="text"
                    placeholder="Name"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="personData.role"
                    type="text"
                    placeholder="Role"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="personData.known_for"
                    type="text"
                    placeholder="Known For"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <input
                    v-model="personData.image"
                    type="url"
                    placeholder="Image URL"
                    class="px-4 py-2 rounded-lg w-full mb-4"
                />
                <button
                    type="submit"
                    class="bg-green-500 text-white px-6 py-2 rounded-lg hover:bg-green-600 w-full mb-4"
                >
                    Update Person
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
        person: Object,
    },
    data() {
        return {
            personData: { ...this.person },
        };
    },
    methods: {
        updatePerson() {
            axios
                .put(`/api/people/${this.person.id}`, this.personData)
                .then(() => {
                    this.$emit("personUpdated");
                    this.$emit("close");
                })
                .catch((error) => {
                    console.error("Error updating person:", error);
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
