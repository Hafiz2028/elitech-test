<script setup>
import { Link } from '@inertiajs/vue3';

defineProps({
    name: {
        type: String,
        required: true,
    },
    stat: {
        type: String,
        required: true,
    },
    href: {
        type: String,
        default: '#',
    }
});
</script>

<template>
    <div
        class="relative overflow-hidden rounded-lg bg-white px-4 pb-12 pt-5 shadow transition duration-300 ease-in-out hover:scale-[1.03] hover:shadow-lg sm:px-6 sm:pt-6">
        <dt>
            <p class="truncate text-sm font-medium text-gray-500">{{ name }}</p>
        </dt>
        <dd class="flex items-baseline pb-6 sm:pb-7">
            <p class="text-2xl font-semibold text-gray-900">{{ stat }}</p>
            <div class="absolute inset-x-0 bottom-0 bg-gray-50 px-4 py-4 sm:px-6">
                <div class="text-sm">
                    <!-- Link ini bisa Anda arahkan ke halaman detail yang relevan -->
                    <a :href="href" class="font-medium text-indigo-600 hover:text-indigo-500">
                        Lihat semua
                        <span class="sr-only"> {{ name }} stats</span>
                    </a>
                </div>
            </div>
        </dd>
    </div>
</template>
