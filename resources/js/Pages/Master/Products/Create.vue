<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
// 1. Import 'usePage' untuk mengakses props halaman
import { Head, Link, useForm, usePage } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

// 2. Dapatkan akses ke objek 'page'
const page = usePage();

const form = useForm({
    sku: '',
    name: '',
    description: '',
});

const submit = () => {
    form.post(route('products.store'), {
        onSuccess: () => {
            // 3. DEBUGGING: Cetak semua props ke konsol setelah redirect berhasil
            // Ini akan menunjukkan kepada kita apakah 'flash.success' ada.
            console.log('Form submission successful. Current Page Props:', page.props);

            form.reset('sku', 'name', 'description');
        },
    });
};
</script>

<template>

    <Head title="Tambah Produk" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Tambah Produk Baru</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <form @submit.prevent="submit" class="space-y-6">
                            <div>
                                <InputLabel for="sku" value="SKU (Stock Keeping Unit)" />
                                <TextInput id="sku" type="text" class="mt-1 block w-full" v-model="form.sku" required
                                    autofocus />
                                <InputError class="mt-2" :message="form.errors.sku" />
                            </div>

                            <div>
                                <InputLabel for="name" value="Nama Produk" />
                                <TextInput id="name" type="text" class="mt-1 block w-full" v-model="form.name"
                                    required />
                                <InputError class="mt-2" :message="form.errors.name" />
                            </div>

                            <div>
                                <InputLabel for="description" value="Deskripsi" />
                                <textarea id="description" v-model="form.description"
                                    class="mt-1 block w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
                                    rows="4"></textarea>
                                <InputError class="mt-2" :message="form.errors.description" />
                            </div>

                            <div class="flex items-center justify-end">
                                <Link :href="route('products.index')"
                                    class="text-sm text-gray-600 hover:text-gray-900 mr-4">
                                Batal
                                </Link>
                                <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                    Simpan
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
