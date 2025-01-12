<template>
    <div class="app-container flex flex-col min-h-screen">
        <!-- Navbar -->
        <nav
            class="text-white p-4 shadow-md sticky top-0 z-50"
            style="background-color: #032541"
        >
            <div class="container mx-auto flex justify-between items-center">
                <!-- Logo -->
                <div class="text-2xl font-extrabold">
                    <router-link to="/"> TickFlix </router-link>
                </div>

                <!-- Navigation Links -->
                <div class="space-x-6 text-lg flex items-center relative">
                    <router-link
                        to="/"
                        class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                        active-class="border-b-2 border-blue-300"
                        >Movies</router-link
                    >
                    <router-link
                        to="/people"
                        class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                        active-class="border-b-2 border-blue-300"
                        >People</router-link
                    >
                    <router-link
                        to="/contact-us"
                        class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                        active-class="border-b-2 border-blue-300"
                        >Contact</router-link
                    >

                    <!-- Dropdown Menu for Movies List -->
                    <div class="relative">
                        <button
                            @click="toggleDropdown"
                            class="hover:text-blue-300 transition duration-300 transform hover:scale-105 focus:outline-none"
                        >
                            Movies List
                        </button>
                        <div
                            v-if="isDropdownOpen"
                            class="absolute left-0 mt-2 bg-white text-blue-900 rounded-lg shadow-lg"
                            style="min-width: 12rem"
                        >
                            <router-link
                                to="/movies-list"
                                class="block px-4 py-2 hover:bg-blue-100 transition"
                                @click="closeDropdown"
                            >
                                Movies List
                            </router-link>
                            <router-link
                                to="/people-list"
                                class="block px-4 py-2 hover:bg-blue-100 transition"
                                @click="closeDropdown"
                            >
                                People List
                            </router-link>
                            <router-link
                                to="/contact-list"
                                class="block px-4 py-2 hover:bg-blue-100 transition"
                                @click="closeDropdown"
                            >
                                Contact List
                            </router-link>
                            <!-- Add new Ticket List link -->
                            <router-link
                                to="/ticket-list"
                                class="block px-4 py-2 hover:bg-blue-100 transition"
                                @click="closeDropdown"
                            >
                                Ticket List
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="flex-grow">
            <!-- Header (only shown on Movies page) -->
            <header
                v-if="$route.path === '/'"
                class="bg-cover bg-center text-white py-24 px-8"
                style="
                    background-image: url('https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/74/2024/11/20/maxresdefault-755329297.jpg');
                    background-repeat: no-repeat; /* Mencegah gambar terulang */
                    background-position: center; /* Memusatkan gambar */
                    height: auto; /* Tinggi menyesuaikan konten gambar */
                    min-height: 400px; /* Memberikan batas minimum tinggi */
                "
            >
                <div class="container mx-auto text-left">
                    <h1 class="text-6xl font-bold">Welcome.</h1>
                    <p class="text-lg mt-8">
                        Millions of movies, TV shows, and people to discover.
                        Explore now.
                    </p>
                </div>
            </header>

            <!-- Routed Content (dynamic page content) -->
            <router-view></router-view>
        </main>

        <!-- Footer -->
        <footer
            class="bg-dark text-white py-8"
            style="background-color: #032541"
        >
            <div class="container mx-auto text-center">
                <div class="flex flex-col md:flex-row justify-center gap-10">
                    <!-- The Basics -->
                    <div>
                        <h3 class="font-bold text-lg mb-2">THE BASICS</h3>
                        <ul>
                            <li>
                                <router-link
                                    to="/about"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                    >About TickFlix</router-link
                                >
                            </li>
                            <li>
                                <router-link
                                    to="/contact-us"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                    >Contact Us</router-link
                                >
                            </li>

                            <li>
                                <router-link
                                    to="/support-forums"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                    >Support Forums</router-link
                                >
                            </li>
                        </ul>
                    </div>

                    <!-- Get Involved -->
                    <div>
                        <h3 class="font-bold text-lg mb-2">GET INVOLVED</h3>
                        <ul>
                            <li>
                                <router-link
                                    to="/contribution-guide"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                    @click="closeDropdown"
                                >
                                    Contribution Guide
                                </router-link>
                            </li>
                        </ul>
                    </div>

                    <!-- Community -->
                    <div>
                        <h3 class="font-bold text-lg mb-2">COMMUNITY</h3>
                        <ul>
                            <li>
                                <router-link
                                    to="/guidelines"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                >
                                    Guidelines
                                </router-link>
                            </li>
                        </ul>
                    </div>

                    <!-- Legal -->
                    <div>
                        <h3 class="font-bold text-lg mb-2">LEGAL</h3>
                        <ul>
                            <li>
                                <router-link
                                    to="/terms-of-use"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                >
                                    Terms of Use
                                </router-link>
                            </li>
                            <li>
                                <router-link
                                    to="/api-terms-of-use"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                >
                                    API Terms of Use
                                </router-link>
                            </li>
                            <li>
                                <router-link
                                    to="/privacy-policy"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                >
                                    Privacy Policy
                                </router-link>
                            </li>
                            <li>
                                <router-link
                                    to="/dmca-policy"
                                    class="hover:text-blue-300 transition duration-300 transform hover:scale-105"
                                    active-class="border-b-2 border-blue-300"
                                >
                                    DMCA Policy
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="mt-8">
                    <button
                        class="bg-blue-600 text-white py-2 px-6 rounded-full hover:bg-blue-700 transition"
                    >
                        TICKFLIX
                    </button>
                </div>
            </div>
        </footer>
    </div>
</template>

<script>
export default {
    name: "App",
    data() {
        return {
            isDropdownOpen: false, // State for managing dropdown visibility
        };
    },
    methods: {
        // Toggle dropdown visibility
        toggleDropdown() {
            this.isDropdownOpen = !this.isDropdownOpen;
        },
        // Close dropdown when a link is clicked
        closeDropdown() {
            this.isDropdownOpen = false;
        },
    },
};
</script>

<style scoped>
/* Styling for header */
header {
    background: #1e293b;
    background-size: cover;
    background-position: center;
}

/* Hover effect for buttons */
button:hover {
    cursor: pointer;
}

/* Ensure footer sticks to bottom */
.app-container {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Full viewport height */
}

main {
    flex-grow: 1; /* Main content takes up remaining space */
}

/* Styling for footer */
footer {
    text-align: center;
}

footer h3 {
    font-size: 1.25rem;
    margin-bottom: 0.5rem;
}

footer ul {
    list-style: none;
    padding: 0;
}

footer ul li {
    margin-bottom: 0.5rem;
}

footer button {
    font-weight: bold;
}

/* Responsive design */
@media (min-width: 768px) {
    footer .container {
        display: flex;
        justify-content: space-between;
        text-align: left;
    }
}
</style>
