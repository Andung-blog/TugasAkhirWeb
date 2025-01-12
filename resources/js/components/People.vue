<template>
    <div class="trending-section p-6">
        <h2 class="text-2xl font-bold mb-4">Trending People</h2>
        <div class="flex space-x-4 mb-6"></div>
        <div
            class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-6"
        >
            <div
                v-for="person in people"
                :key="person.id"
                class="card bg-white rounded-lg shadow-lg overflow-hidden hover:scale-105 transform transition duration-300 ease-in-out cursor-pointer"
                @click="openPersonDetail(person)"
            >
                <img
                    :src="person.image"
                    alt="Person"
                    class="w-full h-64 object-cover"
                />
                <div class="p-4">
                    <h3 class="text-lg font-semibold">{{ person.name }}</h3>
                    <p class="text-sm text-gray-500">{{ person.role }}</p>
                </div>
            </div>
        </div>

        <!-- Modal for Person Detail -->
        <person-detail
            v-if="showModal"
            :person="selectedPerson"
            @close="closeModal"
        />
    </div>
</template>

<script>
import axios from "axios";
import PersonDetail from "./PeopleDetail.vue";

export default {
    name: "TrendingPeople",
    components: {
        PersonDetail,
    },
    data() {
        return {
            people: [], // Array for storing people data
            showModal: false, // State to control modal visibility
            selectedPerson: {}, // Store selected person details
        };
    },
    created() {
        this.fetchPeople(); // Fetch people data when component is created
    },
    methods: {
        async fetchPeople() {
            try {
                const response = await axios.get("/api/people"); // Fetch people from API
                this.people = response.data; // Store people in the component's state
            } catch (error) {
                console.error("Error fetching people:", error);
            }
        },
        // Open the person details in a modal
        openPersonDetail(person) {
            this.selectedPerson = person;
            this.showModal = true;
        },
        // Close the modal
        closeModal() {
            this.showModal = false;
            this.selectedPerson = {}; // Reset selected person details
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
