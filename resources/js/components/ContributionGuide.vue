<template>
    <div class="container mx-auto py-12 px-6">
        <h1 class="text-4xl font-bold text-center text-blue-900 mb-8">
            Contribution Guide
        </h1>
        <div class="bg-white shadow-md rounded-lg p-6">
            <p class="text-lg mb-6">
                Thank you for your interest in contributing to TickFlix! Here's
                how you can get involved:
            </p>

            <ul class="list-disc pl-6 space-y-4 text-gray-700">
                <li>
                    <strong>Report Issues:</strong> Found a bug or have
                    suggestions? Report them on our
                    <a
                        href="https://github.com/tickflix/issues"
                        target="_blank"
                        class="text-blue-600 hover:underline"
                        >GitHub Issues page</a
                    >.
                </li>
                <li>
                    <strong>Submit Pull Requests:</strong> If you’ve fixed a bug
                    or added a feature, create a pull request with clear
                    documentation.
                </li>
                <li>
                    <strong>Write Documentation:</strong> Help improve our
                    guides and documentation for new developers.
                </li>
                <li>
                    <strong>Participate in Discussions:</strong> Join our
                    community forums to discuss new features, bugs, or ideas.
                </li>
                <li>
                    <strong>Spread the Word:</strong> Share TickFlix with your
                    friends and on social media.
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
export default {
    name: "ContributionGuide",
};
</script>

<style scoped>
h1 {
    color: #032541;
}

a:hover {
    text-decoration: underline;
}

ul {
    margin-top: 1rem;
}
</style>
