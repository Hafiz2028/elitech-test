<script setup>
import { Head, Link } from '@inertiajs/vue3';
import { ref, onMounted } from 'vue';
import {
    CubeIcon,
    ClipboardDocumentListIcon,
    CogIcon,
    DocumentChartBarIcon,
    Bars3Icon,
    XMarkIcon
} from '@heroicons/vue/24/outline';

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
});

onMounted(() => {
    // PERBAIKAN: Membuat tag script secara dinamis
    const script = document.createElement('script');
    script.src = 'https://unpkg.com/aos@next/dist/aos.js';
    script.defer = true;
    document.head.appendChild(script);

    // Inisialisasi AOS hanya setelah script selesai dimuat
    script.onload = () => {
        AOS.init({
            duration: 800,
            once: true,
        });
    };
});

const mobileMenuOpen = ref(false);

const features = [
    {
        name: 'Manajemen Data Master',
        description: 'Kelola semua data inti seperti produk dan pengguna dalam satu pusat data yang terstruktur dan mudah diakses.',
        icon: CubeIcon,
    },
    {
        name: 'Perencanaan Produksi (PPIC)',
        description: 'Buat, kelola, dan ajukan rencana produksi dengan alur persetujuan yang jelas kepada manajer.',
        icon: ClipboardDocumentListIcon,
    },
    {
        name: 'Manajemen Order Produksi',
        description: 'Lacak setiap order produksi dari status menunggu, sedang dikerjakan, hingga selesai dengan pencatatan hasil yang akurat.',
        icon: CogIcon,
    },
    {
        name: 'Pelaporan & Analisis',
        description: 'Dapatkan wawasan mendalam dari data produksi melalui laporan periodik yang fleksibel dan mudah diekspor.',
        icon: DocumentChartBarIcon,
    },
];
</script>

<template>

    <Head title="Selamat Datang">
        <!-- Tag <link> untuk CSS tidak masalah, hanya tag <script> yang perlu dipindah -->
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    </Head>
    <div class="bg-white">
        <!-- Header -->
        <header class="absolute inset-x-0 top-0 z-50">
            <nav class="flex items-center justify-between p-6 lg:px-8" aria-label="Global">
                <div class="flex lg:flex-1">
                    <Link href="/" class="-m-1.5 p-1.5">
                    <span class="sr-only">Elitech</span>
                    <img class="h-12 w-auto" src="/logo.png" alt="Elitech Logo" />
                    </Link>
                </div>
                <div class="flex lg:hidden">
                    <button type="button"
                        class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700"
                        @click="mobileMenuOpen = true">
                        <span class="sr-only">Buka menu utama</span>
                        <Bars3Icon class="h-6 w-6" aria-hidden="true" />
                    </button>
                </div>
                <div v-if="canLogin" class="hidden lg:flex lg:flex-1 lg:justify-end lg:gap-x-6">
                    <Link :href="route('login')"
                        class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 transition-colors duration-200">
                    Log in <span aria-hidden="true">&rarr;</span>
                    </Link>
                </div>
            </nav>
            <!-- Mobile menu -->
            <div v-if="mobileMenuOpen" class="lg:hidden" role="dialog" aria-modal="true">
                <div class="fixed inset-0 z-50" />
                <div
                    class="fixed inset-y-0 right-0 z-50 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
                    <div class="flex items-center justify-between">
                        <Link href="/" class="-m-1.5 p-1.5">
                        <span class="sr-only">Elitech</span>
                        <img class="h-10 w-auto" src="/logo.png" alt="" />
                        </Link>
                        <button type="button" class="-m-2.5 rounded-md p-2.5 text-gray-700"
                            @click="mobileMenuOpen = false">
                            <span class="sr-only">Tutup menu</span>
                            <XMarkIcon class="h-6 w-6" aria-hidden="true" />
                        </button>
                    </div>
                    <div class="mt-6 flow-root">
                        <div class="-my-6 divide-y divide-gray-500/10">
                            <div class="py-6">
                                <Link v-if="canLogin" :href="route('login')"
                                    class="-mx-3 block rounded-lg px-3 py-2.5 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">
                                Log in</Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <main>
            <!-- Hero section -->
            <div class="relative isolate pt-14">
                <div class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80"
                    aria-hidden="true">
                    <div class="relative left-[calc(50%-11rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#808af8] to-[#2563eb] opacity-30 sm:left-[calc(50%-30rem)] sm:w-[72.1875rem]"
                        style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)" />
                </div>
                <div class="py-24 sm:py-32 lg:pb-40">
                    <div class="mx-auto max-w-7xl px-6 lg:px-8">
                        <div class="mx-auto max-w-2xl text-center">
                            <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl" data-aos="fade-up">
                                Sistem Manajemen Manufaktur Terintegrasi</h1>
                            <p class="mt-6 text-lg leading-8 text-gray-600" data-aos="fade-up" data-aos-delay="200">
                                Optimalkan alur kerja dari perencanaan hingga produksi akhir dengan platform yang
                                dirancang untuk efisiensi, transparansi, dan kontrol penuh.</p>
                            <div class="mt-10 flex items-center justify-center gap-x-6" data-aos="fade-up"
                                data-aos-delay="400">
                                <Link :href="route('login')"
                                    class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 transition-colors duration-200">
                                Mulai Sekarang</Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Feature section -->
            <div class="bg-gray-50 py-24 sm:py-32">
                <div class="mx-auto max-w-7xl px-6 lg:px-8">
                    <div class="mx-auto max-w-2xl lg:text-center" data-aos="fade-up">
                        <h2 class="text-base font-semibold leading-7 text-indigo-600">Fitur Utama</h2>
                        <p class="mt-2 text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">Semua yang Anda
                            Butuhkan untuk Mengelola Produksi</p>
                        <p class="mt-6 text-lg leading-8 text-gray-600">Dari data master hingga laporan akhir, setiap
                            modul dirancang untuk saling terhubung dan memberikan kemudahan dalam setiap tahap.</p>
                    </div>
                    <div class="mx-auto mt-16 max-w-2xl sm:mt-20 lg:mt-24 lg:max-w-none">
                        <dl class="grid max-w-xl grid-cols-1 gap-x-8 gap-y-16 lg:max-w-none lg:grid-cols-2">
                            <div v-for="(feature, index) in features" :key="feature.name"
                                class="flex flex-col p-6 rounded-lg bg-white shadow-sm hover:shadow-lg hover:-translate-y-1 transition-all duration-300"
                                data-aos="fade-up" :data-aos-delay="100 * (index + 1)">
                                <dt class="flex items-center gap-x-3 text-base font-semibold leading-7 text-gray-900">
                                    <component :is="feature.icon" class="h-5 w-5 flex-none text-indigo-600"
                                        aria-hidden="true" />
                                    {{ feature.name }}
                                </dt>
                                <dd class="mt-4 flex flex-auto flex-col text-base leading-7 text-gray-600">
                                    <p class="flex-auto">{{ feature.description }}</p>
                                </dd>
                            </div>
                        </dl>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="bg-white">
            <div class="mx-auto max-w-7xl overflow-hidden px-6 py-12 lg:px-8">
                <p class="text-center text-xs leading-5 text-gray-500">&copy; {{ new Date().getFullYear() }} Elitech
                    Technovision. Seluruh hak cipta dilindungi.</p>
            </div>
        </footer>
    </div>
</template>
