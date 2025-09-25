<script setup>
import { Link } from '@inertiajs/vue3';
import { ChevronLeftIcon, ChevronRightIcon } from '@heroicons/vue/24/solid';

defineProps({
    links: {
        type: Array,
        required: true
    }
});
</script>

<template>
    <div v-if="links.length > 3">
        <div class="flex items-center justify-center md:justify-start">
            <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                <template v-for="(link, index) in links" :key="index">
                    <Link v-if="index === 0" :href="link.url ?? '#'" :disabled="!link.url"
                        class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 transition-colors duration-200"
                        :class="{ 'cursor-not-allowed text-gray-300': !link.url }">
                    <span class="sr-only">Previous</span>
                    <ChevronLeftIcon class="h-5 w-5" aria-hidden="true" />
                    </Link>
                    <Link v-else-if="index === links.length - 1" :href="link.url ?? '#'" :disabled="!link.url"
                        class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 transition-colors duration-200"
                        :class="{ 'cursor-not-allowed text-gray-300': !link.url }">
                    <span class="sr-only">Next</span>
                    <ChevronRightIcon class="h-5 w-5" aria-hidden="true" />
                    </Link>
                    <Link v-else :href="link.url" v-html="link.label"
                        class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 transition-colors duration-200"
                        :class="{ 'z-10 bg-indigo-50 border-indigo-500 text-indigo-600': link.active }" />
                </template>
            </nav>
        </div>
    </div>
</template>
