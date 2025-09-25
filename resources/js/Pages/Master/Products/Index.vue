<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import { PencilIcon, TrashIcon } from '@heroicons/vue/24/outline';
import Modal from '@/Components/Modal.vue';
import Pagination from '@/Components/Pagination.vue';
import DangerButton from '@/Components/DangerButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';

defineProps({
    products: {
        type: Object,
        required: true
    }
});

const showConfirmDeleteModal = ref(false);
const form = useForm({
    id: null
});

const openDeleteModal = (id) => {
    form.id = id;
    showConfirmDeleteModal.value = true;
};

const closeModal = () => {
    showConfirmDeleteModal.value = false;
};

const deleteProduct = () => {
    form.delete(route('products.destroy', form.id), {
        onSuccess: () => closeModal()
    });
};
</script>

<template>

    <Head title="Master Produk" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Master Produk</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6 gap-4">
                            <h3 class="text-lg font-semibold text-gray-800">Daftar Produk</h3>
                            <div class="flex space-x-2">
                                <Link :href="route('products.trash')">
                                <SecondaryButton>
                                    <TrashIcon class="h-4 w-4 mr-2" />
                                    Tong Sampah
                                </SecondaryButton>
                                </Link>
                                <Link :href="route('products.create')">
                                <PrimaryButton>
                                    Tambah Produk
                                </PrimaryButton>
                                </Link>
                            </div>
                        </div>

                        <div class="border border-gray-200 rounded-lg overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            SKU</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Nama Produk</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Deskripsi</th>
                                        <th scope="col" class="relative px-6 py-3">
                                            <span class="sr-only">Aksi</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr v-for="product in products.data" :key="product.id"
                                        class="hover:bg-gray-50 transition duration-150 ease-in-out">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-mono text-gray-500">{{
                                            product.sku
                                            }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{
                                            product.name }}</td>
                                        <td class="px-6 py-4 whitespace-normal text-sm text-gray-500 max-w-sm truncate">
                                            {{
                                            product.description }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                            <div class="flex justify-end items-center space-x-3">
                                                <Link :href="route('products.edit', product.id)"
                                                    class="text-indigo-600 hover:text-indigo-900 transition duration-150">
                                                <PencilIcon class="h-5 w-5" />
                                                </Link>
                                                <button @click="openDeleteModal(product.id)"
                                                    class="text-red-600 hover:text-red-900 transition duration-150">
                                                    <TrashIcon class="h-5 w-5" />
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr v-if="products.data.length === 0">
                                        <td colspan="4" class="px-6 py-4 text-center text-sm text-gray-500">
                                            Tidak ada data produk yang ditemukan.
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <Pagination :links="products.links" class="mt-6" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Confirmation Modal -->
        <Modal :show="showConfirmDeleteModal" @close="closeModal">
            <div class="p-6">
                <h2 class="text-lg font-medium text-gray-900">
                    Apakah Anda yakin ingin menghapus produk ini?
                </h2>
                <p class="mt-1 text-sm text-gray-600">
                    Produk akan dipindahkan ke tong sampah dan tidak akan bisa dipilih saat membuat rencana produksi.
                </p>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal"> Batal </SecondaryButton>
                    <DangerButton class="ml-3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing"
                        @click="deleteProduct">
                        Hapus Produk
                    </DangerButton>
                </div>
            </div>
        </Modal>

    </AuthenticatedLayout>
</template>
