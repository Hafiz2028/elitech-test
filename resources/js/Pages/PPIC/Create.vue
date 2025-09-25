<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import { PlusIcon, TrashIcon } from '@heroicons/vue/24/outline';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import SecondaryButton from '@/Components/SecondaryButton.vue';

defineProps({
    products: Array,
});

const form = useForm({
    plan_code: '',
    notes: '',
    details: [
        { product_id: '', quantity: 1 } // Baris pertama
    ],
});

const addProductRow = () => {
    form.details.push({ product_id: '', quantity: 1 });
};

const removeProductRow = (index) => {
    form.details.splice(index, 1);
};

const submit = () => {
    form.post(route('production-plans.store'), {
        onSuccess: () => form.reset(),
    });
};
</script>

<template>

    <Head title="Buat Rencana Produksi" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Buat Rencana Produksi Baru</h2>
        </template>

        <div class="py-12">
            <div class="max-w-4xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 md:p-8 text-gray-900">
                        <form @submit.prevent="submit" class="space-y-6">
                            <!-- Informasi Umum -->
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <InputLabel for="plan_code" value="Kode Rencana" />
                                    <TextInput id="plan_code" type="text" class="mt-1 block w-full"
                                        v-model="form.plan_code" required autofocus />
                                    <InputError class="mt-2" :message="form.errors.plan_code" />
                                </div>
                                <div>
                                    <InputLabel for="notes" value="Catatan (Opsional)" />
                                    <TextInput id="notes" type="text" class="mt-1 block w-full" v-model="form.notes" />
                                    <InputError class="mt-2" :message="form.errors.notes" />
                                </div>
                            </div>

                            <!-- Detail Produk Dinamis -->
                            <div class="space-y-4 pt-4 border-t">
                                <h3 class="text-lg font-medium leading-6 text-gray-900">Detail Produk</h3>
                                <div v-for="(detail, index) in form.details" :key="index"
                                    class="flex items-end gap-4 p-4 bg-gray-50 rounded-lg">
                                    <div class="flex-grow">
                                        <InputLabel :for="'product_id_' + index" value="Produk" />
                                        <select :id="'product_id_' + index" v-model="detail.product_id"
                                            class="mt-1 block w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                                            required>
                                            <option value="" disabled>Pilih Produk</option>
                                            <option v-for="product in products" :key="product.id" :value="product.id">
                                                {{ product.name }} ({{ product.sku }})
                                            </option>
                                        </select>
                                        <InputError class="mt-2"
                                            :message="form.errors[`details.${index}.product_id`]" />
                                    </div>
                                    <div class="w-1/4">
                                        <InputLabel :for="'quantity_' + index" value="Jumlah" />
                                        <TextInput :id="'quantity_' + index" type="number" min="1"
                                            class="mt-1 block w-full" v-model="detail.quantity" required />
                                        <InputError class="mt-2" :message="form.errors[`details.${index}.quantity`]" />
                                    </div>
                                    <div class="flex-shrink-0">
                                        <DangerButton type="button" @click="removeProductRow(index)"
                                            v-if="form.details.length > 1">
                                            <TrashIcon class="h-4 w-4" />
                                        </DangerButton>
                                    </div>
                                </div>
                                <SecondaryButton type="button" @click="addProductRow" class="mt-2">
                                    <PlusIcon class="h-4 w-4 mr-2" />
                                    Tambah Produk
                                </SecondaryButton>
                                <InputError class="mt-2" :message="form.errors.details" />
                            </div>

                            <!-- Tombol Aksi -->
                            <div class="flex items-center justify-end pt-6 border-t">
                                <Link :href="route('production-plans.index')"
                                    class="text-sm text-gray-600 hover:text-gray-900 mr-4">
                                Batal
                                </Link>
                                <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                    Simpan Rencana
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
