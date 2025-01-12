<template>
    <div class="container mx-auto px-4 py-8 text-blue-900">
        <h1 class="text-4xl font-bold mb-6">API Terms of Use</h1>
        <p class="mb-4">
            These API Terms of Use outline the rules and restrictions for using
            the TickFlix API.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">1. API Access</h2>
        <p class="mb-4">
            Access to the TickFlix API is provided for developers to integrate
            TickFlix services into their applications. You must register for an
            API key to access the API.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">2. Acceptable Use</h2>
        <p class="mb-4">You agree not to use the API to:</p>
        <ul class="list-disc ml-6">
            <li>Distribute malicious content or spam.</li>
            <li>Violate any laws or regulations.</li>
            <li>Exceed rate limits or abuse the service.</li>
        </ul>
        <h2 class="text-2xl font-semibold mt-6 mb-4">3. Rate Limits</h2>
        <p class="mb-4">
            TickFlix API usage is subject to rate limits. If you exceed these
            limits, your access may be restricted or terminated.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">4. Ownership</h2>
        <p class="mb-4">
            All data accessed through the API is owned by TickFlix. You are
            prohibited from using this data for unauthorized purposes.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">
            5. Termination of Access
        </h2>
        <p class="mb-4">
            TickFlix reserves the right to revoke your API access at any time
            for violations of these terms.
        </p>
        <h2 class="text-2xl font-semibold mt-6 mb-4">6. Changes to Terms</h2>
        <p class="mb-4">
            These API Terms of Use may be updated from time to time. Continued
            use of the API signifies acceptance of the changes.
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
    name: "ApiTermsOfUse",
};
</script>

<style scoped>
.container {
    max-width: 800px;
}
</style>
