<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import { EyeIcon, CheckCircleIcon, XCircleIcon } from '@heroicons/vue/24/outline';
import Modal from '@/Components/Modal.vue';
import Pagination from '@/Components/Pagination.vue';
import DangerButton from '@/Components/DangerButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';

defineProps({
    plans: Object,
    isManager: Boolean,
});

const form = useForm({});
const showDetailModal = ref(false);
const showApproveModal = ref(false);
const showRejectModal = ref(false);
const selectedPlan = ref(null);

const openDetailModal = (plan) => {
    selectedPlan.value = plan;
    showDetailModal.value = true;
};

const openApproveModal = (plan) => {
    selectedPlan.value = plan;
    showApproveModal.value = true;
};

const openRejectModal = (plan) => {
    selectedPlan.value = plan;
    showRejectModal.value = true;
};

const closeModal = () => {
    showDetailModal.value = false;
    showApproveModal.value = false;
    showRejectModal.value = false;
    selectedPlan.value = null;
};

const approvePlan = () => {
    form.patch(route('production-plans.approve', selectedPlan.value.id), {
        onSuccess: () => closeModal(),
    });
};

const rejectPlan = () => {
    form.patch(route('production-plans.reject', selectedPlan.value.id), {
        onSuccess: () => closeModal(),
    });
};

const formatDate = (dateString) => {
    const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
    return new Date(dateString).toLocaleDateString('id-ID', options);
};

const getStatusClass = (status) => {
    switch (status) {
        case 'disetujui':
            return 'bg-green-100 text-green-800';
        case 'ditolak':
            return 'bg-red-100 text-red-800';
        case 'menunggu_persetujuan':
            return 'bg-yellow-100 text-yellow-800';
        default:
            return 'bg-gray-100 text-gray-800';
    }
};
</script>

<template>

    <Head title="Rencana Produksi" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Rencana Produksi</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <div class="flex justify-between items-center mb-6">
                            <h3 class="text-lg font-semibold text-gray-800">Daftar Rencana Produksi</h3>
                            <Link :href="route('production-plans.create')">
                            <PrimaryButton>Buat Rencana Baru</PrimaryButton>
                            </Link>
                        </div>

                        <div class="border border-gray-200 rounded-lg overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Kode
                                            Rencana
                                        </th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Tgl
                                            Dibuat
                                        </th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                            Dibuat Oleh
                                        </th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                            Status</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Aksi
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr v-for="plan in plans.data" :key="plan.id" class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-mono text-gray-600">{{
                                            plan.plan_code }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{
                                            formatDate(plan.created_at) }}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{
                                            plan.creator.name }}
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full"
                                                :class="getStatusClass(plan.status)">
                                                {{ plan.status.replace('_', ' ') }}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <div class="flex items-center space-x-3">
                                                <button @click="openDetailModal(plan)"
                                                    class="text-gray-600 hover:text-indigo-900">
                                                    <EyeIcon class="h-5 w-5" />
                                                </button>
                                                <template v-if="isManager && plan.status === 'menunggu_persetujuan'">
                                                    <button @click="openApproveModal(plan)"
                                                        class="text-green-600 hover:text-green-900">
                                                        <CheckCircleIcon class="h-5 w-5" />
                                                    </button>
                                                    <button @click="openRejectModal(plan)"
                                                        class="text-red-600 hover:text-red-900">
                                                        <XCircleIcon class="h-5 w-5" />
                                                    </button>
                                                </template>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr v-if="plans.data.length === 0">
                                        <td colspan="5" class="px-6 py-4 text-center text-sm text-gray-500">
                                            Belum ada rencana produksi yang dibuat.
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <Pagination :links="plans.links" class="mt-6" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Detail Modal -->
        <Modal :show="showDetailModal" @close="closeModal">
            <div class="p-6" v-if="selectedPlan">
                <h2 class="text-lg font-medium text-gray-900">Detail Rencana: {{ selectedPlan.plan_code }}</h2>
                <p class="mt-1 text-sm text-gray-600">Catatan: {{ selectedPlan.notes || '-' }}</p>
                <div class="mt-4 border-t pt-4">
                    <h3 class="text-md font-semibold">Daftar Produk:</h3>
                    <ul class="mt-2 space-y-2">
                        <li v-for="detail in selectedPlan.details" :key="detail.id"
                            class="text-sm p-2 bg-gray-50 rounded-md">
                            <span class="font-bold">{{ detail.product.name }}</span> ({{ detail.product.sku }}) - <span
                                class="text-indigo-600 font-semibold">{{ detail.quantity }} pcs</span>
                        </li>
                    </ul>
                </div>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal">Tutup</SecondaryButton>
                </div>
            </div>
        </Modal>

        <!-- Approve Modal -->
        <Modal :show="showApproveModal" @close="closeModal">
            <div class="p-6" v-if="selectedPlan">
                <h2 class="text-lg font-medium text-gray-900">Setujui Rencana Produksi?</h2>
                <p class="mt-1 text-sm text-gray-600">Anda akan menyetujui rencana <span class="font-bold">{{
                        selectedPlan.plan_code }}</span>. Tindakan ini akan membuat Order Produksi baru. Lanjutkan?</p>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal">Batal</SecondaryButton>
                    <PrimaryButton class="ml-3 bg-green-600 hover:bg-green-700 focus:ring-green-500"
                        @click="approvePlan">Ya,
                        Setujui</PrimaryButton>
                </div>
            </div>
        </Modal>

        <!-- Reject Modal -->
        <Modal :show="showRejectModal" @close="closeModal">
            <div class="p-6" v-if="selectedPlan">
                <h2 class="text-lg font-medium text-gray-900">Tolak Rencana Produksi?</h2>
                <p class="mt-1 text-sm text-gray-600">Anda akan menolak rencana <span class="font-bold">{{
                        selectedPlan.plan_code }}</span>. Pastikan Anda sudah berkoordinasi dengan tim PPIC. Lanjutkan?
                </p>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal">Batal</SecondaryButton>
                    <DangerButton class="ml-3" @click="rejectPlan">Ya, Tolak</DangerButton>
                </div>
            </div>
        </Modal>

    </AuthenticatedLayout>
</template>
