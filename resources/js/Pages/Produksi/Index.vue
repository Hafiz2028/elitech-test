<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import { PlayIcon, CheckCircleIcon, ClockIcon, UserIcon } from '@heroicons/vue/24/outline';
import Modal from '@/Components/Modal.vue';
import Pagination from '@/Components/Pagination.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import InputError from '@/Components/InputError.vue';

defineProps({
    orders: Object,
});

const form = useForm({
    id: null,
    actual_quantity: 0,
    rejected_quantity: 0,
});

const showStartModal = ref(false);
const showFinishModal = ref(false);
const showHistoryModal = ref(false);
const selectedOrder = ref(null);
const historyLogs = ref([]);
const isLoadingHistory = ref(false);

const openStartModal = (order) => {
    selectedOrder.value = order;
    showStartModal.value = true;
};

const openFinishModal = (order) => {
    selectedOrder.value = order;
    form.actual_quantity = order.target_quantity;
    form.rejected_quantity = 0;
    showFinishModal.value = true;
};

const openHistoryModal = async (order) => {
    selectedOrder.value = order;
    isLoadingHistory.value = true;
    showHistoryModal.value = true;
    try {
        const response = await fetch(route('production-orders.history', order.id));
        if (!response.ok) throw new Error('Gagal mengambil data riwayat');
        historyLogs.value = await response.json();
    } catch (error) {
        console.error("Gagal mengambil riwayat:", error);
        historyLogs.value = [];
    } finally {
        isLoadingHistory.value = false;
    }
};

const closeModal = () => {
    showStartModal.value = false;
    showFinishModal.value = false;
    showHistoryModal.value = false;
    selectedOrder.value = null;
    historyLogs.value = [];
    form.reset();
};

const startOrder = () => {
    form.patch(route('production-orders.start', selectedOrder.value.id), {
        onSuccess: () => closeModal(),
    });
};

const finishOrder = () => {
    form.patch(route('production-orders.finish', selectedOrder.value.id), {
        onSuccess: () => closeModal(),
    });
};

const formatDate = (dateString) => {
    if (!dateString) return '-';
    const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
    return new Date(dateString).toLocaleDateString('id-ID', options);
};

const getStatusClass = (status) => {
    switch (status) {
        case 'selesai':
            return 'bg-green-100 text-green-800';
        case 'sedang_dikerjakan':
            return 'bg-blue-100 text-blue-800';
        case 'menunggu':
            return 'bg-yellow-100 text-yellow-800';
        default:
            return 'bg-gray-100 text-gray-800';
    }
};
</script>

<template>

    <Head title="Order Produksi" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Order Produksi</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <h3 class="text-lg font-semibold text-gray-800 mb-6">Daftar Order Produksi</h3>

                        <div class="border border-gray-200 rounded-lg overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                            Order</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                            Produk</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                            Target</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                            Status</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Aksi
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <tr v-for="order in orders.data" :key="order.id" class="hover:bg-gray-50">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm font-mono text-gray-900">{{ order.order_code }}</div>
                                            <div class="text-xs text-gray-500">Plan: {{
                                                order.production_plan_detail.production_plan.plan_code }}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm font-medium text-gray-900">{{
                                                order.production_plan_detail.product.name }}</div>
                                            <div class="text-xs text-gray-500">{{
                                                order.production_plan_detail.product.sku }}
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-indigo-600 font-semibold">{{
                                            order.target_quantity }} pcs</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                                            <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full"
                                                :class="getStatusClass(order.status)">
                                                {{ order.status.replace('_', ' ') }}
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <div class="flex items-center space-x-4">
                                                <button @click="openHistoryModal(order)"
                                                    class="text-gray-500 hover:text-indigo-600" title="Lihat Riwayat">
                                                    <ClockIcon class="h-5 w-5" />
                                                </button>
                                                <button v-if="order.status === 'menunggu'"
                                                    @click="openStartModal(order)"
                                                    class="text-blue-600 hover:text-blue-900 flex items-center">
                                                    <PlayIcon class="h-5 w-5 mr-1" /> Mulai
                                                </button>
                                                <button v-if="order.status === 'sedang_dikerjakan'"
                                                    @click="openFinishModal(order)"
                                                    class="text-green-600 hover:text-green-900 flex items-center">
                                                    <CheckCircleIcon class="h-5 w-5 mr-1" /> Selesaikan
                                                </button>
                                                <span v-if="order.status === 'selesai'"
                                                    class="text-gray-400 italic text-xs">Selesai</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr v-if="orders.data.length === 0">
                                        <td colspan="5" class="px-6 py-4 text-center text-sm text-gray-500">
                                            Tidak ada order produksi yang tersedia.
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <Pagination :links="orders.links" class="mt-6" />
                    </div>
                </div>
            </div>
        </div>

        <!-- History Modal -->
        <Modal :show="showHistoryModal" @close="closeModal">
            <div class="p-6" v-if="selectedOrder">
                <h2 class="text-lg font-medium text-gray-900">Riwayat Order: {{ selectedOrder.order_code }}</h2>
                <div v-if="isLoadingHistory" class="text-center py-10">Memuat riwayat...</div>
                <div v-else-if="historyLogs.length === 0" class="text-center py-10 text-gray-500">Belum ada riwayat
                    untuk order
                    ini.</div>
                <div v-else class="mt-6 flow-root">
                    <ul role="list" class="-mb-8">
                        <li v-for="(log, logIdx) in historyLogs" :key="log.id">
                            <div class="relative pb-8">
                                <span v-if="logIdx !== historyLogs.length - 1"
                                    class="absolute left-4 top-4 -ml-px h-full w-0.5 bg-gray-200" aria-hidden="true" />
                                <div class="relative flex items-start space-x-3">
                                    <div class="relative">
                                        <div
                                            class="h-8 w-8 rounded-full bg-gray-100 flex items-center justify-center ring-8 ring-white">
                                            <UserIcon class="h-5 w-5 text-gray-500" aria-hidden="true" />
                                        </div>
                                    </div>
                                    <div class="min-w-0 flex-1 py-1.5">
                                        <div class="text-sm text-gray-500">
                                            {{ log.description }} oleh <span class="font-medium text-gray-900">{{
                                                log.user.name
                                            }}</span>
                                        </div>
                                        <div class="mt-1 text-xs text-gray-400">
                                            <time :datetime="log.created_at">{{ formatDate(log.created_at) }}</time>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal">Tutup</SecondaryButton>
                </div>
            </div>
        </Modal>

        <!-- Start Confirmation Modal -->
        <Modal :show="showStartModal" @close="closeModal">
            <div class="p-6" v-if="selectedOrder">
                <h2 class="text-lg font-medium text-gray-900">Mulai Produksi?</h2>
                <p class="mt-1 text-sm text-gray-600">Anda akan memulai proses produksi untuk order <span
                        class="font-bold">{{
                            selectedOrder.order_code }}</span>. Lanjutkan?</p>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal">Batal</SecondaryButton>
                    <PrimaryButton class="ml-3 bg-blue-600 hover:bg-blue-700 focus:ring-blue-500" @click="startOrder">
                        Ya, Mulai
                        Produksi</PrimaryButton>
                </div>
            </div>
        </Modal>

        <!-- Finish Production Modal -->
        <Modal :show="showFinishModal" @close="closeModal">
            <div class="p-6" v-if="selectedOrder">
                <h2 class="text-lg font-medium text-gray-900">Selesaikan Produksi</h2>
                <p class="mt-1 text-sm text-gray-600">Masukkan jumlah hasil produksi aktual untuk order <span
                        class="font-bold">{{ selectedOrder.order_code }}</span>.</p>
                <div class="mt-6 space-y-4">
                    <div>
                        <InputLabel for="actual_quantity" value="Jumlah Produksi OK" />
                        <TextInput id="actual_quantity" type="number" class="mt-1 block w-full"
                            v-model="form.actual_quantity" required />
                        <InputError class="mt-2" :message="form.errors.actual_quantity" />
                    </div>
                    <div>
                        <InputLabel for="rejected_quantity" value="Jumlah Produksi NG (Ditolak)" />
                        <TextInput id="rejected_quantity" type="number" class="mt-1 block w-full"
                            v-model="form.rejected_quantity" required />
                        <InputError class="mt-2" :message="form.errors.rejected_quantity" />
                    </div>
                </div>
                <div class="mt-6 flex justify-end">
                    <SecondaryButton @click="closeModal">Batal</SecondaryButton>
                    <PrimaryButton class="ml-3 bg-green-600 hover:bg-green-700 focus:ring-green-500"
                        @click="finishOrder">Simpan
                        Hasil</PrimaryButton>
                </div>
            </div>
        </Modal>

    </AuthenticatedLayout>
</template>
