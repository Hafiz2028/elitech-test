<script setup>
import { Link } from '@inertiajs/vue3';

defineProps({
    href: {
        type: String,
        required: true,
    }
});
</script>

<template>
    <Link :href="href"
        class="flex items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-white p-6 text-center transition duration-300 ease-in-out hover:scale-[1.03] hover:border-indigo-400 hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
    <span class="flex flex-col items-center">
        <!-- Slot ini memungkinkan kita memasukkan ikon dan teks dari luar -->
        <slot />
    </span>
    </Link>
</template>
