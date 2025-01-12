<template>
    <div
        class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center"
    >
        <div class="bg-white p-6 rounded-lg w-1/3">
            <h3 class="text-2xl font-semibold mb-4">{{ person.name }}</h3>
            <img
                :src="person.image"
                alt="Person Image"
                class="w-full h-64 object-cover mb-4"
            />
            <p><strong>Role:</strong> {{ person.role }}</p>
            <p><strong>Known For:</strong> {{ person.known_for }}</p>
            <button
                @click="$emit('close')"
                class="mt-4 bg-gray-500 text-white px-4 py-2 rounded-lg hover:bg-gray-600"
            >
                Close
            </button>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        person: Object,
    },
};
</script>
