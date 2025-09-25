<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

const props = defineProps({
    product: Object
});

const form = useForm({
    sku: props.product.sku,
    name: props.product.name,
    description: props.product.description,
});

const submit = () => {
    form.patch(route('products.update', props.product.id), {
        onSuccess: () => {
        }
    });
};
</script>

<template>

    <Head title="Edit Produk" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Edit Produk</h2>
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
                                    Perbarui
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
