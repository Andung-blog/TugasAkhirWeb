<template>
    <div class="contact-us-container py-24 px-8">
        <div class="container mx-auto text-center">
            <h1 class="text-4xl font-bold mb-4">Contact Us</h1>
            <p class="text-lg mb-8">
                Have any questions or feedback? We'd love to hear from you!
                Reach out to us using the form below.
            </p>

            <!-- Form with v-model for binding data -->
            <form @submit.prevent="submitForm" class="max-w-xl mx-auto">
                <div class="mb-4">
                    <input
                        v-model="formData.name"
                        type="text"
                        placeholder="Your Name"
                        class="w-full px-4 py-2 border border-gray-300 rounded-md"
                        :class="{ 'border-red-500': errors.name }"
                    />
                    <p v-if="errors.name" class="text-red-500 text-sm">
                        {{ errors.name }}
                    </p>
                </div>
                <div class="mb-4">
                    <input
                        v-model="formData.email"
                        type="email"
                        placeholder="Your Email"
                        class="w-full px-4 py-2 border border-gray-300 rounded-md"
                        :class="{ 'border-red-500': errors.email }"
                    />
                    <p v-if="errors.email" class="text-red-500 text-sm">
                        {{ errors.email }}
                    </p>
                </div>
                <div class="mb-4">
                    <textarea
                        v-model="formData.message"
                        placeholder="Your Message"
                        class="w-full px-4 py-2 border border-gray-300 rounded-md"
                        rows="4"
                        :class="{ 'border-red-500': errors.message }"
                    ></textarea>
                    <p v-if="errors.message" class="text-red-500 text-sm">
                        {{ errors.message }}
                    </p>
                </div>
                <div>
                    <button
                        type="submit"
                        class="bg-blue-600 text-white py-2 px-6 rounded-full hover:bg-blue-700 transition"
                    >
                        Send Message
                    </button>
                </div>
            </form>

            <!-- Success or error message after submission -->
            <div v-if="formStatus" class="mt-4">
                <p
                    :class="{
                        'text-green-500': formStatus.success,
                        'text-red-500': !formStatus.success,
                    }"
                >
                    {{ formStatus.message }}
                </p>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";

export default {
    name: "ContactUs",
    data() {
        return {
            formData: {
                name: "",
                email: "",
                message: "",
            },
            errors: {},
            formStatus: null, // to show success or error messages
        };
    },
    methods: {
        // Validate form before submitting
        validateForm() {
            this.errors = {};

            if (!this.formData.name) {
                this.errors.name = "Name is required.";
            }
            if (!this.formData.email) {
                this.errors.email = "Email is required.";
            } else if (!this.validEmail(this.formData.email)) {
                this.errors.email = "Valid email is required.";
            }
            if (!this.formData.message) {
                this.errors.message = "Message is required.";
            }

            return Object.keys(this.errors).length === 0;
        },

        // Validate email format
        validEmail(email) {
            const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            return regex.test(email);
        },

        // Submit form to the backend
        submitForm() {
            if (this.validateForm()) {
                axios
                    .post("api/messages", this.formData)
                    .then((response) => {
                        this.formStatus = {
                            success: true,
                            message: "Your message has been sent successfully!",
                        };
                        this.resetForm();
                    })
                    .catch((error) => {
                        this.formStatus = {
                            success: false,
                            message:
                                "There was an error submitting your message. Please try again later.",
                        };
                    });
            }
        },

        // Reset form data
        resetForm() {
            this.formData.name = "";
            this.formData.email = "";
            this.formData.message = "";
            this.errors = {};
        },
    },
};
</script>

<style scoped>
.contact-us-container {
    background-color: #f1f5f9;
}

button:hover {
    cursor: pointer;
}
</style>
