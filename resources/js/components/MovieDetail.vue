<template>
    <div
        class="fixed inset-0 flex items-center justify-center bg-gray-800 bg-opacity-50"
    >
        <div class="bg-white p-6 rounded-lg w-96 relative">
            <button
                @click="close"
                class="absolute top-2 right-2 text-gray-700 text-xl"
            >
                &times;
            </button>

            <!-- Movie Poster -->
            <div class="mb-4">
                <img
                    :src="movie.image"
                    alt="Movie Poster"
                    class="w-full rounded-lg object-cover aspect-video"
                />
            </div>

            <!-- Video Trailer Button -->
            <div v-if="movie.video_url" class="mb-4 text-center">
                <button
                    @click="showTrailer"
                    class="bg-blue-500 text-white py-1 px-3 rounded-lg hover:bg-blue-600"
                >
                    Watch Trailer
                </button>
            </div>

            <!-- Movie Information -->
            <h3 class="text-2xl font-semibold mb-2">{{ movie.title }}</h3>
            <p class="text-gray-700">{{ movie.date }}</p>
            <p class="text-gray-600 mt-2">
                Genre: <span class="font-medium">{{ movie.genre }}</span>
            </p>
            <p class="text-gray-600 mt-2">
                Director: <span class="font-medium">{{ movie.director }}</span>
            </p>
            <p class="text-gray-600 mt-2">
                Rating: <span class="font-medium">{{ movie.rating }}</span>
            </p>
            <p class="text-gray-500 mt-4">{{ movie.description }}</p>

            <!-- Book Ticket Button -->
            <div class="mt-6 text-center">
                <router-link
                    :to="`/book-ticket/${movie.id}`"
                    class="bg-green-500 text-white py-2 px-4 rounded-lg hover:bg-green-600"
                >
                    Book Ticket
                </router-link>
            </div>

            <!-- Close Button -->
            <div class="mt-6 text-center">
                <button
                    @click="close"
                    class="bg-red-500 text-white py-2 px-4 rounded-lg hover:bg-red-600"
                >
                    Close
                </button>
            </div>
        </div>

        <!-- Video Trailer Modal -->
        <div
            v-if="isTrailerVisible"
            class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-75"
        >
            <div class="bg-white p-4 rounded-lg w-11/12 max-w-3xl relative">
                <button
                    @click="closeTrailer"
                    class="absolute top-2 right-2 text-gray-700 text-xl"
                >
                    &times;
                </button>
                <iframe
                    :src="trailerUrl"
                    frameborder="0"
                    allow="autoplay; encrypted-media"
                    allowfullscreen
                    class="w-full h-64 rounded-lg"
                ></iframe>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "MovieDetail",
    props: {
        movie: {
            type: Object,
            required: true,
        },
    },
    data() {
        return {
            isTrailerVisible: false, // Mengatur visibilitas modal trailer
            trailerUrl: "", // URL embed video YouTube
        };
    },
    methods: {
        close() {
            this.$emit("close"); // Emit event ke parent untuk menutup modal utama
        },
        showTrailer() {
            this.trailerUrl = this.getEmbedUrl(this.movie.video_url);
            this.isTrailerVisible = true;
        },
        closeTrailer() {
            this.isTrailerVisible = false;
        },
        getEmbedUrl(url) {
            let videoId;

            // Cek apakah URL menggunakan format pendek atau panjang
            if (url.includes("youtu.be")) {
                // Format pendek, ambil ID setelah '/'
                videoId = url.split("youtu.be/")[1];
            } else if (url.includes("youtube.com")) {
                // Format panjang, ambil ID setelah 'v='
                videoId = url.split("v=")[1].split("&")[0];
            }

            // Kembalikan URL embed YouTube
            return `https://www.youtube.com/embed/${videoId}?autoplay=1`;
        },
    },
};
</script>
