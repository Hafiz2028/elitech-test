<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, router } from '@inertiajs/vue3';
import { ref, watch, computed } from 'vue';
import Pagination from '@/Components/Pagination.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { debounce } from 'lodash';

const props = defineProps({
    orders: Object,
    filters: Object,
    availableYears: Array,
});

const activeTab = ref(props.filters.order_code ? 'order' : 'period'); // Set tab aktif berdasarkan filter yang ada
const form = ref({
    year: props.filters.year || '',
    month: props.filters.month || '',
    week: props.filters.week || '',
    order_code: props.filters.order_code || '',
});
const searchResults = ref([]);
const isSearching = ref(false);

const months = [
    { value: 1, name: 'Januari' }, { value: 2, name: 'Februari' },
    { value: 3, name: 'Maret' }, { value: 4, name: 'April' },
    { value: 5, name: 'Mei' }, { value: 6, name: 'Juni' },
    { value: 7, name: 'Juli' }, { value: 8, name: 'Agustus' },
    { value: 9, name: 'September' }, { value: 10, name: 'Oktober' },
    { value: 11, name: 'November' }, { value: 12, name: 'Desember' }
];

const weeks = [
    { value: 1, name: 'Minggu 1' }, { value: 2, name: 'Minggu 2' },
    { value: 3, name: 'Minggu 3' }, { value: 4, name: 'Minggu 4' },
    { value: 5, name: 'Minggu 5' }
];

// Computed properties for current date indicators
const currentYear = new Date().getFullYear();
const currentMonth = new Date().getMonth() + 1;
const currentWeek = computed(() => {
    const today = new Date();
    // Cek hanya jika tahun dan bulan yang dipilih adalah tahun dan bulan saat ini
    if (parseInt(form.value.year) === today.getFullYear() && parseInt(form.value.month) === (today.getMonth() + 1)) {
        return Math.ceil(today.getDate() / 7);
    }
    return 0; // Kembalikan 0 jika bukan bulan/tahun saat ini
});


const submitFilter = () => {
    const dataToSend = activeTab.value === 'period'
        ? { year: form.value.year, month: form.value.month, week: form.value.week }
        : { order_code: form.value.order_code };

    router.get(route('reports.production.index'), dataToSend, {
        preserveState: true,
        preserveScroll: true,
        replace: true,
    });
};

const resetFilters = () => {
    form.value.year = '';
    form.value.month = '';
    form.value.week = '';
    form.value.order_code = '';
    submitFilter();
};

const search = debounce(async (term) => {
    if (term.length < 2) {
        searchResults.value = [];
        return;
    }
    isSearching.value = true;
    try {
        const response = await fetch(route('reports.production.searchOrders', { term }));
        searchResults.value = await response.json();
    } catch (error) {
        console.error('Gagal mencari order:', error);
    } finally {
        isSearching.value = false;
    }
}, 300);

watch(() => form.value.order_code, (newValue) => {
    if (activeTab.value === 'order') {
        search(newValue);
    }
});

const selectOrder = (order) => {
    form.value.order_code = order.order_code;
    searchResults.value = [];
    submitFilter();
};

const exportCsv = () => {
    const dataToExport = activeTab.value === 'period'
        ? { year: form.value.year, month: form.value.month, week: form.value.week }
        : { order_code: form.value.order_code };
    const params = new URLSearchParams(dataToExport).toString();
    window.location.href = route('reports.production.export') + '?' + params;
};

const formatDate = (dateString) => {
    if (!dateString) return '-';
    const options = { year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' };
    return new Date(dateString).toLocaleDateString('id-ID', options);
};

</script>

<template>

    <Head title="Laporan Produksi" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Laporan Produksi</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <h3 class="text-lg font-semibold text-gray-800">Filter Laporan</h3>

                        <!-- Filter Tabs -->
                        <div class="border-b border-gray-200 mt-4">
                            <nav class="-mb-px flex space-x-8" aria-label="Tabs">
                                <button @click="activeTab = 'period'"
                                    :class="[activeTab === 'period' ? 'border-indigo-500 text-indigo-600' : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300', 'whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm']">
                                    Filter per Periode
                                </button>
                                <button @click="activeTab = 'order'"
                                    :class="[activeTab === 'order' ? 'border-indigo-500 text-indigo-600' : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300', 'whitespace-nowrap py-4 px-1 border-b-2 font-medium text-sm']">
                                    Filter per Order
                                </button>
                            </nav>
                        </div>

                        <!-- ========================================================= -->
                        <!-- BAGIAN INI YANG HILANG DARI KODE ANDA SEBELUMNYA -->
                        <!-- Filter Content -->
                        <div class="mt-6">
                            <!-- Period Filter -->
                            <form v-if="activeTab === 'period'" @submit.prevent="submitFilter" class="space-y-4">
                                <div class="grid grid-cols-1 md:grid-cols-4 gap-4 items-end">
                                    <div>
                                        <label for="year" class="block text-sm font-medium text-gray-700">Tahun</label>
                                        <select id="year" v-model="form.year" @change="form.month = ''; form.week = ''"
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
                                            <option value="">Semua Tahun</option>
                                            <option v-for="year in availableYears" :key="year" :value="year"
                                                class="flex items-center justify-between">
                                                {{ year }} <span v-if="year === currentYear"
                                                    title="Tahun sekarang">(Sekarang)</span>
                                            </option>
                                        </select>
                                    </div>
                                    <div>
                                        <label for="month" class="block text-sm font-medium text-gray-700">Bulan</label>
                                        <select id="month" v-model="form.month" :disabled="!form.year"
                                            @change="form.week = ''"
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm disabled:bg-gray-100">
                                            <option value="">Semua Bulan</option>
                                            <option v-for="month in months" :key="month.value" :value="month.value">
                                                {{ month.name }} <span
                                                    v-if="month.value === currentMonth && form.year == currentYear">(Sekarang)</span>
                                            </option>
                                        </select>
                                    </div>
                                    <div>
                                        <label for="week" class="block text-sm font-medium text-gray-700">Minggu</label>
                                        <select id="week" v-model="form.week" :disabled="!form.month"
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm disabled:bg-gray-100">
                                            <option value="">Semua Minggu</option>
                                            <option v-for="week in weeks" :key="week.value" :value="week.value">
                                                {{ week.name }} <span
                                                    v-if="week.value === currentWeek">(Sekarang)</span>
                                            </option>
                                        </select>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <PrimaryButton type="submit">Tampilkan</PrimaryButton>
                                        <SecondaryButton type="button" @click="resetFilters">Reset</SecondaryButton>
                                    </div>
                                </div>
                            </form>

                            <!-- Order Filter -->
                            <form v-if="activeTab === 'order'" @submit.prevent="submitFilter" class="relative max-w-sm">
                                <label for="order_code" class="block text-sm font-medium text-gray-700">Cari Kode
                                    Order</label>
                                <TextInput id="order_code" type="text" v-model="form.order_code"
                                    class="mt-1 block w-full" placeholder="Ketik kode order..." autocomplete="off" />
                                <div v-if="isSearching"
                                    class="absolute z-10 w-full mt-1 px-4 py-2 bg-white border border-gray-300 rounded-md shadow-lg text-sm text-gray-500">
                                    Mencari...
                                </div>
                                <div v-else-if="searchResults.length > 0"
                                    class="absolute z-10 w-full mt-1 bg-white border border-gray-300 rounded-md shadow-lg">
                                    <ul>
                                        <li v-for="result in searchResults" :key="result.id"
                                            @click="selectOrder(result)"
                                            class="px-4 py-2 hover:bg-gray-100 cursor-pointer text-sm">
                                            {{ result.order_code }}
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                        <!-- ========================================================= -->


                        <!-- Results Table -->
                        <div class="mt-8">
                            <div class="flex justify-between items-center mb-4">
                                <h4 class="text-md font-semibold text-gray-800">Hasil Laporan</h4>
                                <SecondaryButton @click="exportCsv" :disabled="orders.data.length === 0">Ekspor ke CSV
                                </SecondaryButton>
                            </div>
                            <div class="border border-gray-200 rounded-lg overflow-x-auto">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead class="bg-gray-50">
                                        <tr>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                                Tgl
                                                Selesai</th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                                Order
                                            </th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                                Produk
                                            </th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                                Target
                                            </th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                                Hasil OK
                                            </th>
                                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">
                                                Hasil NG
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                        <tr v-for="order in orders.data" :key="order.id" class="hover:bg-gray-50">
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{
                                                formatDate(order.completion_date) }}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-mono text-gray-600">{{
                                                order.order_code }}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{
                                                order.production_plan_detail.product.name }}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{
                                                order.target_quantity }}</td>
                                            <td
                                                class="px-6 py-4 whitespace-nowrap text-sm font-semibold text-green-600">
                                                {{
                                                order.actual_quantity }}</td>
                                            <td class="px-6 py-4 whitespace-nowrap text-sm font-semibold text-red-600">
                                                {{
                                                order.rejected_quantity }}</td>
                                        </tr>
                                        <tr v-if="orders.data.length === 0">
                                            <td colspan="6" class="px-6 py-4 text-center text-sm text-gray-500">
                                                Tidak ada data yang cocok dengan filter yang dipilih.
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
        </div>
    </AuthenticatedLayout>
</template>
