<template>
    <div class="container mx-auto py-8">
        <h1 class="text-3xl font-bold mb-6 text-center text-gray-800">
            Ticket List
        </h1>

        <div
            v-if="tickets.length"
            class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6"
        >
            <div
                v-for="ticket in tickets"
                :key="ticket.id"
                class="bg-white rounded-lg shadow-lg overflow-hidden transform transition duration-300 hover:scale-105 cursor-pointer"
            >
                <!-- Custom Image with Gradient Background -->
                <div
                    class="w-full h-48 bg-gradient-to-r from-blue-500 to-purple-600 text-white flex items-center justify-center"
                >
                    <h2 class="text-4xl font-semibold text-center">
                        {{ ticket.movie.title }}
                    </h2>
                </div>

                <!-- Ticket Info Section -->
                <div class="p-6">
                    <div class="mb-2">
                        <h3 class="text-lg font-semibold text-gray-900">
                            Booked by: {{ ticket.user_name }}
                        </h3>
                    </div>
                    <p class="text-sm text-gray-600">Seat: {{ ticket.seat }}</p>
                    <p class="text-sm text-gray-600">
                        Price: ${{ ticket.price }}
                    </p>
                </div>

                <!-- Action Buttons -->
                <div class="flex justify-between p-4 bg-gray-100">
                    <button
                        @click="deleteTicket(ticket.id)"
                        class="bg-red-500 text-white py-1 px-3 rounded-lg hover:bg-red-600"
                    >
                        Delete
                    </button>
                </div>
            </div>
        </div>

        <!-- No Tickets Available Message -->
        <p v-else class="text-center text-gray-500 mt-6">
            No tickets available.
        </p>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "TicketList",
    data() {
        return {
            tickets: [],
        };
    },
    async created() {
        try {
            const response = await axios.get("/api/tickets");
            this.tickets = response.data;
        } catch (error) {
            console.error("Error fetching tickets:", error);
        }
    },
    methods: {
        async deleteTicket(ticketId) {
            try {
                await axios.delete(`/api/tickets/${ticketId}`);
                // Remove the deleted ticket from the list
                this.tickets = this.tickets.filter(
                    (ticket) => ticket.id !== ticketId
                );
            } catch (error) {
                console.error("Error deleting ticket:", error);
            }
        },
    },
};
</script>

<style scoped>
/* Updated Styling for the card */
.container {
    padding: 2rem;
}

.bg-gradient-to-r {
    background-image: linear-gradient(to top, #032541, #032541);
}

.bg-gray-100 {
    background-color: #f7fafc;
}

.bg-yellow-500 {
    background-color: #ecc94b;
}

.bg-red-500 {
    background-color: #f56565;
}

.text-gray-800 {
    color: #2d3748;
}

.text-gray-600 {
    color: #4a5568;
}

.text-gray-500 {
    color: #6b7280;
}

h1,
h3 {
    font-family: "Arial", sans-serif;
}

h3 {
    color: #2d3748;
}

button {
    transition: background-color 0.3s ease;
}
</style>
