<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, usePage } from '@inertiajs/vue3';
import { PlusIcon } from '@heroicons/vue/20/solid';
import StatCard from '@/Components/StatCard.vue';
import ActionCard from '@/Components/ActionCard.vue';
import { computed } from 'vue';

// Mengambil data props dari controller
const props = defineProps({
    stats: Array
});

const page = usePage();
const userRole = computed(() => page.props.auth.user?.role?.name);

</script>

<template>

    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <!-- Judul Halaman -->
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Dashboard</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="space-y-12">
                    <!-- Bagian Kartu Statistik -->
                    <div>
                        <h3 class="text-base font-semibold leading-6 text-gray-900">Ringkasan Saat Ini</h3>
                        <dl class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
                            <StatCard v-for="item in stats" :key="item.id" :name="item.name"
                                :stat="item.stat.toString()" :href="item.href" />
                        </dl>
                    </div>

                    <!-- Bagian Aksi Cepat -->
                    <div>
                        <h3 class="text-base font-semibold leading-6 text-gray-900">Aksi Cepat</h3>
                        <div class="mt-5 grid grid-cols-1 gap-5 sm:grid-cols-2 lg:grid-cols-3">
                            <!-- Tombol Buat Rencana Produksi -->
                            <ActionCard :href="route('production-plans.create')">
                                <PlusIcon class="h-8 w-8 text-gray-400 mb-2" />
                                <span class="text-sm font-semibold text-gray-900">Buat Rencana Produksi Baru</span>
                            </ActionCard>

                            <!-- Tombol Tambah Produk Baru (Hanya untuk Manager) -->
                            <ActionCard v-if="userRole === 'Manager'" :href="route('products.create')">
                                <PlusIcon class="h-8 w-8 text-gray-400 mb-2" />
                                <span class="text-sm font-semibold text-gray-900">Tambah Produk Baru</span>
                            </ActionCard>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
