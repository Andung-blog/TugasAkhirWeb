<template>
    <div class="container mx-auto py-8 px-4">
        <h1 class="text-4xl font-bold text-center mb-8 text-gray-800">
            Contact List
        </h1>
        <div class="overflow-x-auto bg-white shadow-lg rounded-lg">
            <table class="min-w-full bg-white table-auto">
                <thead class="bg-blue-600 text-white">
                    <tr>
                        <th class="py-3 px-4 text-left">Name</th>
                        <th class="py-3 px-4 text-left">Email</th>
                        <th class="py-3 px-4 text-left">Message</th>
                        <th class="py-3 px-4 text-left">Date</th>
                        <th class="py-3 px-4 text-center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr
                        v-for="message in messages"
                        :key="message.id"
                        class="border-b hover:bg-gray-100 transition duration-200"
                    >
                        <td class="py-4 px-6">{{ message.name }}</td>
                        <td class="py-4 px-6">{{ message.email }}</td>
                        <td class="py-4 px-6">{{ message.message }}</td>
                        <td class="py-4 px-6">{{ message.created_at }}</td>
                        <td class="py-4 px-6 text-center">
                            <button
                                @click="deleteMessage(message.id)"
                                class="bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700 transition duration-300"
                            >
                                Delete
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "ContactList",
    data() {
        return {
            messages: [],
        };
    },
    mounted() {
        // Fetch contact messages from the backend
        axios
            .get("api/messages")
            .then((response) => {
                this.messages = response.data;
            })
            .catch((error) => {
                console.error(
                    "There was an error fetching the contact messages:",
                    error
                );
            });
    },
    methods: {
        // Method to delete a message
        deleteMessage(id) {
            // Send a DELETE request to the backend to remove the message
            axios
                .delete(`api/messages/${id}`)
                .then(() => {
                    // Remove the deleted message from the local array
                    this.messages = this.messages.filter(
                        (message) => message.id !== id
                    );
                    alert("Message deleted successfully");
                })
                .catch((error) => {
                    console.error(
                        "There was an error deleting the message:",
                        error
                    );
                    alert("Failed to delete the message");
                });
        },
    },
};
</script>

<style scoped>
/* Styling for the contact list table */
table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
}

th,
td {
    padding: 12px 16px;
    text-align: left;
    font-size: 1rem;
}

th {
    background-color: #1e3a8a; /* Blue background for the header */
    color: white;
    font-weight: bold;
    text-transform: uppercase;
}

tr:nth-child(even) {
    background-color: #f9fafb; /* Light gray for even rows */
}

tr:hover {
    background-color: #f1f5f9; /* Hover effect for rows */
}

button {
    cursor: pointer;
    background-color: #f87171; /* Red background for the button */
    color: white;
    padding: 8px 16px;
    border-radius: 6px;
    border: none;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

button:hover {
    background-color: #dc2626; /* Darker red on hover */
    transform: scale(1.05);
}

/* Ensure table is responsive on small screens */
@media (max-width: 768px) {
    table {
        border: none;
        width: 100%;
        overflow-x: auto;
    }

    th,
    td {
        padding: 8px;
        font-size: 0.9rem;
    }

    th {
        font-size: 1rem;
    }
}
</style>
