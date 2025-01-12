<template>
    <div>
        <h3 class="text-xl font-semibold mb-3">Add a New Person</h3>
        <form @submit.prevent="addPerson">
            <input
                v-model="newPerson.name"
                type="text"
                placeholder="Name"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newPerson.role"
                type="text"
                placeholder="Role (e.g., Actor/Actress)"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newPerson.known_for"
                type="text"
                placeholder="Known For"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <input
                v-model="newPerson.image"
                type="url"
                placeholder="Image URL"
                class="px-4 py-2 rounded-lg w-full sm:w-1/2 mb-4"
            />
            <button
                type="submit"
                class="bg-blue-900 px-6 py-2 rounded-lg hover:bg-blue-600"
            >
                Add Person
            </button>
        </form>
    </div>
</template>

<script>
import axios from "axios";

export default {
    data() {
        return {
            newPerson: {
                name: "",
                role: "",
                known_for: "",
                image: "",
            },
        };
    },
    methods: {
        addPerson() {
            axios
                .post("/api/people", this.newPerson)
                .then((response) => {
                    this.$emit("personAdded", response.data); // Emit event to parent to refresh people list
                    this.newPerson = {
                        name: "",
                        role: "",
                        known_for: "",
                        image: "",
                    };
                })
                .catch((error) => {
                    console.error("Error adding person:", error);
                });
        },
    },
};
</script>
