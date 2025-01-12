<template>
    <div class="guidelines-container py-12 px-6 md:px-20">
        <div class="container mx-auto">
            <h1 class="text-4xl font-bold text-center mb-8">
                Community Guidelines
            </h1>
            <p class="text-lg text-justify mb-6">
                Welcome to TickFlix! To maintain a safe and friendly community,
                we encourage all users to follow these guidelines. These rules
                are in place to ensure that TickFlix remains an enjoyable
                platform for everyone.
            </p>

            <div class="guideline-list space-y-8">
                <div>
                    <h2 class="text-2xl font-semibold mb-2">
                        1. Be Respectful
                    </h2>
                    <p class="text-lg">
                        Treat others with respect and kindness. Avoid offensive
                        language, hate speech, or any form of harassment.
                    </p>
                </div>

                <div>
                    <h2 class="text-2xl font-semibold mb-2">2. No Spamming</h2>
                    <p class="text-lg">
                        Avoid posting repetitive or irrelevant content. Keep
                        discussions meaningful and on-topic.
                    </p>
                </div>

                <div>
                    <h2 class="text-2xl font-semibold mb-2">
                        3. Respect Copyright
                    </h2>
                    <p class="text-lg">
                        Do not share pirated content or any material that
                        infringes on copyrights.
                    </p>
                </div>

                <div>
                    <h2 class="text-2xl font-semibold mb-2">
                        4. Stay On-Topic
                    </h2>
                    <p class="text-lg">
                        Keep your discussions and contributions relevant to the
                        movies, TV shows, or topics related to the TickFlix
                        platform.
                    </p>
                </div>

                <div>
                    <h2 class="text-2xl font-semibold mb-2">
                        5. Protect Your Privacy
                    </h2>
                    <p class="text-lg">
                        Avoid sharing personal information such as your phone
                        number, home address, or financial details.
                    </p>
                </div>

                <div>
                    <h2 class="text-2xl font-semibold mb-2">
                        6. Report Issues
                    </h2>
                    <p class="text-lg">
                        If you notice any inappropriate behavior or content,
                        report it to our support team for review.
                    </p>
                </div>
            </div>

            <div class="mt-12 text-center">
                <router-link
                    to="/contact-us"
                    class="bg-blue-600 text-white py-3 px-6 rounded-full hover:bg-blue-700 transition"
                >
                    Contact Support
                </router-link>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "Guidelines",
};
</script>

<style scoped>
.guidelines-container {
    background-color: #f9f9f9;
    color: #032541;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}
</style>
