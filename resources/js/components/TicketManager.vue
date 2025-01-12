<template>
    <div class="ticket-section p-6">
        <h2 class="text-2xl font-bold mb-4">Manage Tickets</h2>

        <!-- Create New Ticket -->
        <div class="mb-6">
            <h3 class="text-xl font-semibold mb-2">Create Ticket</h3>
            <form @submit.prevent="createTicket">
                <input
                    v-model="newTicket.movieId"
                    type="text"
                    placeholder="Movie ID"
                    class="border p-2 w-full mb-4"
                    required
                />
                <input
                    v-model="newTicket.userName"
                    type="text"
                    placeholder="Your Name"
                    class="border p-2 w-full mb-4"
                    required
                />
                <input
                    v-model="newTicket.seat"
                    type="text"
                    placeholder="Seat Number"
                    class="border p-2 w-full mb-4"
                    required
                />
                <input
                    v-model="newTicket.price"
                    type="number"
                    placeholder="Ticket Price"
                    class="border p-2 w-full mb-4"
                    required
                />
                <button
                    type="submit"
                    class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600"
                >
                    Create Ticket
                </button>
            </form>
        </div>

        <!-- Ticket List -->
        <div v-if="tickets.length > 0">
            <h3 class="text-xl font-semibold mb-4">Tickets</h3>
            <div
                class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6"
            >
                <div
                    v-for="ticket in tickets"
                    :key="ticket.id"
                    class="card bg-white rounded-lg shadow-lg overflow-hidden hover:scale-105 transform transition duration-300 ease-in-out cursor-pointer"
                >
                    <div class="p-4">
                        <h4 class="text-lg font-semibold">
                            {{ ticket.userName }}
                        </h4>
                        <p class="text-sm text-gray-500">
                            Movie: {{ ticket.movie.title }}
                        </p>
                        <p class="text-sm text-gray-500">
                            Seat: {{ ticket.seat }}
                        </p>
                        <p class="text-sm text-gray-500">
                            Price: ${{ ticket.price }}
                        </p>
                    </div>
                    <div class="flex justify-between p-4">
                        <button
                            @click="deleteTicket(ticket.id)"
                            class="bg-red-500 text-white py-1 px-3 rounded-lg hover:bg-red-600"
                        >
                            Delete
                        </button>
                        <button
                            @click="editTicket(ticket)"
                            class="bg-yellow-500 text-white py-1 px-3 rounded-lg hover:bg-yellow-600 ml-2"
                        >
                            Edit
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for Editing Ticket -->
        <div v-if="showEditModal" class="modal-overlay" @click="closeEditModal">
            <div class="modal-container" @click.stop>
                <h3 class="text-xl font-semibold mb-4">Edit Ticket</h3>
                <form @submit.prevent="updateTicket">
                    <input
                        v-model="selectedTicket.movieId"
                        type="text"
                        placeholder="Movie ID"
                        class="border p-2 w-full mb-4"
                        required
                    />
                    <input
                        v-model="selectedTicket.userName"
                        type="text"
                        placeholder="Your Name"
                        class="border p-2 w-full mb-4"
                        required
                    />
                    <input
                        v-model="selectedTicket.seat"
                        type="text"
                        placeholder="Seat Number"
                        class="border p-2 w-full mb-4"
                        required
                    />
                    <input
                        v-model="selectedTicket.price"
                        type="number"
                        placeholder="Ticket Price"
                        class="border p-2 w-full mb-4"
                        required
                    />
                    <button
                        type="submit"
                        class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600"
                    >
                        Update Ticket
                    </button>
                    <button
                        type="button"
                        @click="closeEditModal"
                        class="bg-gray-500 text-white py-2 px-4 rounded-lg hover:bg-gray-600 mt-4"
                    >
                        Close
                    </button>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "TicketManager",
    data() {
        return {
            newTicket: {
                movieId: "",
                userName: "",
                seat: "",
                price: "",
            },
            tickets: [],
            showEditModal: false,
            selectedTicket: {},
        };
    },
    created() {
        this.fetchTickets(); // Fetch the tickets when the component is created
    },
    methods: {
        // Fetch tickets from the backend
        async fetchTickets() {
            try {
                const response = await axios.get("/api/tickets");
                this.tickets = response.data;
            } catch (error) {
                console.error("Error fetching tickets:", error);
            }
        },

        // Create a new ticket
        async createTicket() {
            try {
                const response = await axios.post(
                    "/api/tickets",
                    this.newTicket
                );

                // Add the newly created ticket to the tickets list immediately
                this.tickets.push(response.data);

                // Clear the form after successful creation
                this.newTicket = {
                    movieId: "",
                    userName: "",
                    seat: "",
                    price: "",
                };
            } catch (error) {
                console.error("Error creating ticket:", error);
            }
        },

        // Delete a ticket
        async deleteTicket(ticketId) {
            try {
                await axios.delete(`/api/tickets/${ticketId}`);
                this.tickets = this.tickets.filter(
                    (ticket) => ticket.id !== ticketId
                );
            } catch (error) {
                console.error("Error deleting ticket:", error);
            }
        },

        // Prepare to edit a ticket
        editTicket(ticket) {
            this.selectedTicket = { ...ticket };
            this.showEditModal = true;
        },

        // Update the ticket
        async updateTicket() {
            try {
                const response = await axios.put(
                    `/api/tickets/${this.selectedTicket.id}`,
                    this.selectedTicket
                );

                const index = this.tickets.findIndex(
                    (ticket) => ticket.id === this.selectedTicket.id
                );
                if (index !== -1) {
                    this.tickets.splice(index, 1, response.data);
                }

                // Close the modal after updating
                this.closeEditModal();
            } catch (error) {
                console.error("Error updating ticket:", error);
            }
        },

        // Close the edit modal
        closeEditModal() {
            this.showEditModal = false;
            this.selectedTicket = {}; // Reset selected ticket data
        },
    },
};
</script>

<style scoped>
/* Styling omitted for brevity, same as you provided earlier */
</style>
