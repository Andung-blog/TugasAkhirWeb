<template>
    <div class="container mx-auto px-6 py-8">
        <h2 class="text-3xl font-bold text-center mb-6">People List</h2>

        <!-- Add People Form Component -->
        <create-people @personAdded="fetchPeople" />

        <!-- People List -->
        <div v-if="people.length > 0">
            <h3 class="text-xl font-semibold mb-4">Actors/Actresses</h3>
            <ul>
                <li
                    v-for="(person, index) in people"
                    :key="person.id"
                    class="flex justify-between items-center mb-4 p-4 border-b-2"
                >
                    <div class="flex items-center space-x-4">
                        <img
                            v-if="person.image"
                            :src="person.image"
                            alt="Profile Image"
                            class="w-16 h-16 object-cover rounded-full"
                        />
                        <div>
                            <h4 class="text-lg font-bold">{{ person.name }}</h4>
                            <p><strong>Role:</strong> {{ person.role }}</p>
                            <p>
                                <strong>Known For:</strong>
                                {{ person.known_for }}
                            </p>
                        </div>
                    </div>

                    <!-- Update and Delete buttons -->
                    <div class="space-x-4">
                        <button
                            @click="openEditModal(person)"
                            class="bg-yellow-500 px-4 py-2 rounded-lg hover:bg-yellow-300"
                        >
                            Edit
                        </button>
                        <button
                            @click="openDeleteModal(person)"
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
                No people available. Add a person!
            </p>
        </div>

        <!-- Edit People Modal -->
        <edit-people
            v-if="showEditModal"
            :person="selectedPerson"
            @personUpdated="fetchPeople"
            @close="closeEditModal"
        />

        <!-- Delete People Modal -->
        <delete-people
            v-if="showDeleteModal"
            :person="selectedPerson"
            @personDeleted="fetchPeople"
            @close="closeDeleteModal"
        />
    </div>
</template>

<script>
import axios from "axios";
import CreatePeople from "./CreatePeople.vue";
import EditPeople from "./UpdatePeople.vue";
import DeletePeople from "./DeletePeople.vue";

export default {
    components: {
        CreatePeople,
        EditPeople,
        DeletePeople,
    },
    data() {
        return {
            people: [],
            showEditModal: false,
            showDeleteModal: false,
            selectedPerson: null,
        };
    },
    created() {
        this.fetchPeople();
    },
    methods: {
        fetchPeople() {
            axios
                .get("/api/people")
                .then((response) => {
                    this.people = response.data;
                })
                .catch((error) => {
                    console.error("Error fetching people:", error);
                });
        },
        openEditModal(person) {
            this.selectedPerson = person;
            this.showEditModal = true;
        },
        closeEditModal() {
            this.showEditModal = false;
            this.selectedPerson = null;
        },
        openDeleteModal(person) {
            this.selectedPerson = person;
            this.showDeleteModal = true;
        },
        closeDeleteModal() {
            this.showDeleteModal = false;
            this.selectedPerson = null;
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
