<template>
    <div class="container mx-auto px-4 py-8 text-blue-900">
        <h1 class="text-4xl font-bold mb-6">Terms of Use</h1>
        <p class="mb-4">
            Welcome to TickFlix! By using our platform, you agree to the
            following terms and conditions.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">1. Acceptance of Terms</h2>
        <p class="mb-4">
            By accessing or using TickFlix, you acknowledge that you have read,
            understood, and agree to be bound by these terms of use.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">2. User Conduct</h2>
        <p class="mb-4">
            You agree not to use the platform for any unlawful activities or
            activities that could harm TickFlix or its users.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">
            3. Intellectual Property
        </h2>
        <p class="mb-4">
            All content, trademarks, and logos displayed on TickFlix are the
            property of their respective owners. Unauthorized use is prohibited.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">4. Termination</h2>
        <p class="mb-4">
            We reserve the right to terminate your access to TickFlix for
            violations of these terms.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">
            5. Limitation of Liability
        </h2>
        <p class="mb-4">
            TickFlix is not liable for any damages resulting from the use of our
            platform.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">6. Changes to Terms</h2>
        <p class="mb-4">
            We reserve the right to update these terms at any time. Please
            review them periodically.
        </p>
        <router-link
            to="/"
            class="text-blue-600 hover:text-blue-800 font-bold transition mt-8 inline-block"
        >
            Back to Home
        </router-link>
    </div>
</template>

<script>
export default {
    name: "TermsOfUse",
};
</script>

<style scoped>
.container {
    max-width: 800px;
}
</style>
