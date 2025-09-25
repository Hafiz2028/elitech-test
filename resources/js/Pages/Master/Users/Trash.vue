<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import { ArrowUturnLeftIcon, TrashIcon } from '@heroicons/vue/24/outline';
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
const showConfirmRestoreModal = ref(false);

const form = useForm({
    id: null
});

const openDeleteModal = (id) => {
    form.id = id;
    showConfirmDeleteModal.value = true;
};
const closeDeleteModal = () => {
    showConfirmDeleteModal.value = false;
};
const deleteUserPermanently = () => {
    form.delete(route('users.forceDelete', form.id), {
        onSuccess: () => closeDeleteModal()
    });
};

const openRestoreModal = (id) => {
    form.id = id;
    showConfirmRestoreModal.value = true;
};
const closeRestoreModal = () => {
    showConfirmRestoreModal.value = false;
};
const restoreUser = () => {
    form.patch(route('users.restore', form.id), {
        onSuccess: () => closeRestoreModal()
    });
};

</script>

<template>

    <Head title="Tong Sampah Pengguna" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Tong Sampah Pengguna</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <div class="flex justify-between items-center mb-6">
                            <h3 class="text-lg font-semibold text-gray-800">Daftar Pengguna yang Dihapus</h3>
                            <Link :href="route('users.index')">
                            <SecondaryButton>
                                <ArrowUturnLeftIcon class="h-4 w-4 mr-2" />
                                Kembali ke Daftar Pengguna
                            </SecondaryButton>
                            </Link>
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
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ user.role.name
                                        }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                            <div class="flex justify-end items-center space-x-3">
                                                <button @click="openRestoreModal(user.id)"
                                                    class="text-green-600 hover:text-green-900 transition duration-150">
                                                    <ArrowUturnLeftIcon class="h-5 w-5" />
                                                </button>
                                                <button @click="openDeleteModal(user.id)"
                                                    class="text-red-600 hover:text-red-900 transition duration-150">
                                                    <TrashIcon class="h-5 w-5" />
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr v-if="users.data.length === 0">
                                        <td colspan="4" class="px-6 py-4 text-center text-sm text-gray-500">
                                            Tidak ada data di tong sampah.
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
        <Modal :show="showConfirmRestoreModal" @close="closeRestoreModal">
            <div class="p-6">
                <h2 class="text-lg font-medium text-gray-900">
                    Pulihkan Pengguna?
                </h2>
                <p class="mt-1 text-sm text-gray-600">
                    Apakah Anda yakin ingin memulihkan pengguna ini? Pengguna akan dapat login kembali ke sistem.
                </p>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeRestoreModal"> Batal </SecondaryButton>
                    <PrimaryButton class="ml-3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing"
                        @click="restoreUser">
                        Ya, Pulihkan
                    </PrimaryButton>
                </div>
            </div>
        </Modal>
        <Modal :show="showConfirmDeleteModal" @close="closeDeleteModal">
            <div class="p-6">
                <h2 class="text-lg font-medium text-gray-900">
                    Hapus Pengguna Permanen?
                </h2>
                <p class="mt-1 text-sm text-gray-600">
                    Tindakan ini tidak dapat diurungkan. Semua data yang terkait dengan pengguna ini akan hilang
                    selamanya.
                </p>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeDeleteModal"> Batal </SecondaryButton>
                    <DangerButton class="ml-3" :class="{ 'opacity-25': form.processing }" :disabled="form.processing"
                        @click="deleteUserPermanently">
                        Hapus Permanen
                    </DangerButton>
                </div>
            </div>
        </Modal>

    </AuthenticatedLayout>
</template>
