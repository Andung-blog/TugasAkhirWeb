<template>
    <div class="container mx-auto px-4 py-8 text-blue-900">
        <h1 class="text-4xl font-bold mb-6">Privacy Policy</h1>
        <p class="mb-4">
            At TickFlix, we value your privacy. This Privacy Policy outlines how
            we collect, use, and protect your information.
        </p>

        <h2 class="text-2xl font-semibold mt-6 mb-4">
            1. Information We Collect
        </h2>
        <p class="mb-4">We collect the following types of information:</p>
        <ul class="list-disc ml-6">
            <li>
                Personal information, such as your name, email address, and
                account details.
            </li>
            <li>
                Usage data, including pages visited, interactions, and device
                information.
            </li>
        </ul>

        <h2 class="text-2xl font-semibold mt-6 mb-4">
            2. How We Use Your Information
        </h2>
        <p class="mb-4">The information we collect is used to:</p>
        <ul class="list-disc ml-6">
            <li>Provide and improve our services.</li>
            <li>Send notifications and updates about your account.</li>
            <li>Analyze usage trends to enhance user experience.</li>
        </ul>

        <h2 class="text-2xl font-semibold mt-6 mb-4">
            3. Sharing Your Information
        </h2>
        <p class="mb-4">
            We do not sell or rent your personal information. However, we may
            share it with:
        </p>
        <ul class="list-disc ml-6">
            <li>
                Trusted third-party service providers to assist in delivering
                our services.
            </li>
            <li>
                Law enforcement if required by law or to protect our legal
                rights.
            </li>
        </ul>

        <h2 class="text-2xl font-semibold mt-6 mb-4">4. Data Security</h2>
        <p class="mb-4">
            We implement appropriate security measures to protect your personal
            information from unauthorized access, disclosure, or destruction.
        </p>

        <h2 class="text-2xl font-semibold mt-6 mb-4">5. Your Rights</h2>
        <p class="mb-4">
            You have the right to access, update, or delete your personal
            information. For any such requests, please contact us at
            support@tickflix.com.
        </p>

        <h2 class="text-2xl font-semibold mt-6 mb-4">
            6. Changes to This Policy
        </h2>
        <p class="mb-4">
            This Privacy Policy may be updated periodically. Continued use of
            our services constitutes acceptance of the changes.
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
    name: "PrivacyPolicy",
};
</script>

<style scoped>
.container {
    max-width: 800px;
}
</style>
