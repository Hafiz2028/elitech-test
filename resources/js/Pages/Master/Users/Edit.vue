<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';

const props = defineProps({
    user: Object,
    roles: Array,
    departments: Array
});

const form = useForm({
    _method: 'PUT',
    name: props.user.name,
    email: props.user.email,
    role_id: props.user.role_id,
    department_id: props.user.department_id,
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('users.update', props.user.id));
};
</script>

<template>

    <Head title="Edit Pengguna" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Edit Pengguna: {{ user.name }}</h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 text-gray-900">
                        <form @submit.prevent="submit">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <InputLabel for="name" value="Nama" />
                                    <TextInput id="name" type="text" class="mt-1 block w-full" v-model="form.name"
                                        required autofocus autocomplete="name" />
                                    <InputError class="mt-2" :message="form.errors.name" />
                                </div>

                                <div>
                                    <InputLabel for="email" value="Email" />
                                    <TextInput id="email" type="email" class="mt-1 block w-full" v-model="form.email"
                                        required autocomplete="username" />
                                    <InputError class="mt-2" :message="form.errors.email" />
                                </div>

                                <div>
                                    <InputLabel for="role_id" value="Role" />
                                    <select v-model="form.role_id" id="role_id"
                                        class="mt-1 block w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm">
                                        <option v-for="role in roles" :key="role.id" :value="role.id">{{ role.name }}
                                        </option>
                                    </select>
                                    <InputError class="mt-2" :message="form.errors.role_id" />
                                </div>

                                <div>
                                    <InputLabel for="department_id" value="Department" />
                                    <select v-model="form.department_id" id="department_id"
                                        class="mt-1 block w-full border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm">
                                        <option v-for="department in departments" :key="department.id"
                                            :value="department.id">{{
                                            department.name }}</option>
                                    </select>
                                    <InputError class="mt-2" :message="form.errors.department_id" />
                                </div>

                                <div>
                                    <InputLabel for="password" value="Password Baru (Opsional)" />
                                    <TextInput id="password" type="password" class="mt-1 block w-full"
                                        v-model="form.password" autocomplete="new-password" />
                                    <InputError class="mt-2" :message="form.errors.password" />
                                </div>

                                <div>
                                    <InputLabel for="password_confirmation" value="Konfirmasi Password Baru" />
                                    <TextInput id="password_confirmation" type="password" class="mt-1 block w-full"
                                        v-model="form.password_confirmation" autocomplete="new-password" />
                                    <InputError class="mt-2" :message="form.errors.password_confirmation" />
                                </div>
                            </div>

                            <div class="flex items-center justify-end mt-6">
                                <Link :href="route('users.index')"
                                    class="text-sm text-gray-600 hover:text-gray-900 mr-4">Batal
                                </Link>
                                <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                    Update
                                </PrimaryButton>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
