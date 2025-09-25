<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import { PencilIcon, TrashIcon, ArrowUturnLeftIcon } from '@heroicons/vue/24/outline';
import Modal from '@/Components/Modal.vue';
import Pagination from '@/Components/Pagination.vue';
import DangerButton from '@/Components/DangerButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';

defineProps({
    users: {
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

const deleteUser = () => {
    form.delete(route('users.destroy', form.id), {
        onSuccess: () => closeModal()
    });
};
</script>

<template>

    <Head title="Kelola Pengguna" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Kelola Pengguna</h2>
        </template>

        <div>
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <div class="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-6 gap-4">
                            <h3 class="text-lg font-semibold text-gray-800">Daftar Pengguna Aktif</h3>
                            <div class="flex space-x-2">
                                <Link :href="route('users.trash')">
                                <SecondaryButton>
                                    <TrashIcon class="h-4 w-4 mr-2" />
                                    Tong Sampah
                                </SecondaryButton>
                                </Link>
                                <Link :href="route('users.create')">
                                <PrimaryButton>
                                    Tambah Pengguna
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
                                            Nama</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Email</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Role</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Department</th>
                                        <th scope="col" class="relative px-6 py-3">
                                            <span class="sr-only">Aksi</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr v-for="user in users.data" :key="user.id"
                                        class="hover:bg-gray-50 transition duration-150 ease-in-out">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{
                                            user.name
                                        }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ user.email }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full"
                                                :class="{
                                                    'bg-green-100 text-green-800': user.role.name === 'Manager',
                                                    'bg-blue-100 text-blue-800': user.role.name === 'Staff PPIC',
                                                    'bg-purple-100 text-purple-800': user.role.name === 'Staff Produksi'
                                                }">
                                                {{ user.role.name }}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{
                                            user.department.name }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                            <div class="flex justify-end items-center space-x-3">
                                                <Link :href="route('users.edit', user.id)"
                                                    class="text-indigo-600 hover:text-indigo-900 transition duration-150">
                                                <PencilIcon class="h-5 w-5" />
                                                </Link>
                                                <button @click="openDeleteModal(user.id)"
                                                    class="text-red-600 hover:text-red-900 transition duration-150">
                                                    <TrashIcon class="h-5 w-5" />
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr v-if="users.data.length === 0">
                                        <td colspan="5" class="px-6 py-4 text-center text-sm text-gray-500">
                                            Tidak ada data pengguna yang ditemukan.
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <Pagination :links="users.links" class="mt-6" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Confirmation Modal -->
        <Modal :show="showConfirmDeleteModal" @close="closeModal">
            <div class="p-6">
                <h2 class="text-lg font-medium text-gray-900">
                    Apakah Anda yakin ingin menghapus pengguna ini?
                </h2>
                <p class="mt-1 text-sm text-gray-600">
                    Tindakan ini akan memindahkan pengguna ke tong sampah. Anda dapat memulihkannya nanti.
                </p>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal"> Batal </SecondaryButton>
                    <DangerButton class="ml-3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing"
                        @click="deleteUser">
                        Hapus Pengguna
                    </DangerButton>
                </div>
            </div>
        </Modal>

    </AuthenticatedLayout>
</template>
