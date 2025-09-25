<script setup>
import { Link, usePage } from '@inertiajs/vue3';
import { computed, ref } from 'vue';
import {
    HomeIcon,
    ClipboardDocumentListIcon,
    CogIcon,
    CircleStackIcon,
    ChevronDownIcon,
    UserGroupIcon,
    DocumentChartBarIcon,
} from '@heroicons/vue/24/outline';

const page = usePage();

const userRole = computed(() => page.props.auth.user?.role?.name);
const userDepartment = computed(() => page.props.auth.user?.department?.name);
const isActive = (url) => page.url.startsWith(url);
const isParentActive = (children) => children.some(child => isActive(child.currentUrl));
const openMenus = ref({});
const toggleMenu = (name) => {
    openMenus.value[name] = !openMenus.value[name];
};
const allNavigation = [
    {
        name: 'Dashboard',
        href: route('dashboard'),
        icon: HomeIcon,
        currentUrl: '/dashboard',
        allowed: () => true
    },
    {
        name: 'Master Data',
        icon: CircleStackIcon,
        allowed: () => userRole.value === 'Manager' || userDepartment.value === 'PPIC' || userDepartment.value === 'Produksi', // Parent bisa dilihat jika salah satu child bisa dilihat
        children: [
            {
                name: 'Kelola Pengguna',
                href: route('users.index'),
                currentUrl: '/users',
                allowed: () => userRole.value === 'Manager'
            },
            {
                name: 'Produk',
                href: route('products.index'),
                currentUrl: '/products',
                allowed: () => true
            }
        ]
    },
    {
        name: 'Rencana Produksi',
        href: route('production-plans.index'),
        icon: ClipboardDocumentListIcon,
        currentUrl: '/production-plans',
        allowed: () => userDepartment.value === 'PPIC' || (userRole.value === 'Manager' && userDepartment.value === 'Produksi')
    },
    {
        name: 'Order Produksi',
        href: route('production-orders.index'),
        icon: CogIcon,
        currentUrl: '/production-orders',
        allowed: () => userDepartment.value === 'Produksi'
    },
    {
        name: 'Laporan',
        icon: DocumentChartBarIcon,
        allowed: () => userRole.value === 'Manager',
        children: [
            {
                name: 'Laporan PPIC',
                href: route('reports.ppic.index'),
                currentUrl: '/reports/ppic',
                allowed: () => true
            }, {
                name: 'Laporan Produksi',
                href: route('reports.production.index'),
                currentUrl: '/reports/production',
                allowed: () => true
            }
        ]
    }
];

// Logika untuk menyaring menu dan sub-menu berdasarkan hak akses
const navigation = computed(() => {
    return allNavigation
        .map(item => {
            if (!item.children) {
                return item;
            }
            const visibleChildren = item.children.filter(child => child.allowed());
            return visibleChildren.length > 0 ? { ...item, children: visibleChildren } : null;
        })
        .filter(item => item && item.allowed());
});

navigation.value.forEach(item => {
    if (item.children && isParentActive(item.children)) {
        openMenus.value[item.name] = true;
    }
});

</script>

<template>
    <div class="flex grow flex-col gap-y-5 overflow-y-auto border-r border-gray-200 bg-white px-6 pb-4">
        <Link :href="route('dashboard')" class="flex h-16 shrink-0 items-center">
        <img class="h-10 w-auto" src="/logo.png" alt="Elitech Logo" />
        </Link>
        <nav class="flex flex-1 flex-col">
            <ul role="list" class="flex flex-1 flex-col gap-y-7">
                <li>
                    <ul role="list" class="-mx-2 space-y-1">
                        <template v-for="item in navigation" :key="item.name">
                            <!-- Render item tanpa sub-menu -->
                            <li v-if="!item.children">
                                <Link :href="item.href" :class="[
                                    isActive(item.currentUrl) ? 'bg-indigo-50 text-indigo-600' : 'text-gray-700 hover:bg-indigo-50 hover:text-indigo-600',
                                    'group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold transition duration-300 ease-in-out'
                                ]">
                                <component :is="item.icon"
                                    :class="['h-6 w-6 shrink-0', isActive(item.currentUrl) ? 'text-indigo-600' : 'text-gray-400 group-hover:text-indigo-600']"
                                    aria-hidden="true" />
                                {{ item.name }}
                                </Link>
                            </li>
                            <li v-else>
                                <button @click="toggleMenu(item.name)"
                                    :class="[isParentActive(item.children) ? 'bg-indigo-50 text-indigo-600' : 'text-gray-700 hover:bg-indigo-50 hover:text-indigo-600', 'group flex items-center w-full text-left gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold transition duration-300 ease-in-out']">
                                    <component :is="item.icon"
                                        :class="['h-6 w-6 shrink-0', isParentActive(item.children) ? 'text-indigo-600' : 'text-gray-400 group-hover:text-indigo-600']"
                                        aria-hidden="true" />
                                    {{ item.name }}
                                    <ChevronDownIcon
                                        :class="[openMenus[item.name] ? 'rotate-180 text-gray-500' : 'text-gray-400', 'ml-auto h-5 w-5 shrink-0 transition-transform ease-in-out duration-200']"
                                        aria-hidden="true" />
                                </button>
                                <ul v-show="openMenus[item.name]" class="mt-1 px-2 space-y-1">
                                    <li v-for="subItem in item.children" :key="subItem.name">
                                        <Link :href="subItem.href"
                                            :class="[isActive(subItem.currentUrl) ? 'bg-gray-100 text-indigo-600' : 'text-gray-500 hover:bg-gray-100 hover:text-indigo-600', 'block rounded-md py-2 pr-2 pl-9 text-sm leading-6 transition duration-300 ease-in-out']">
                                        {{ subItem.name }}
                                        </Link>
                                    </li>
                                </ul>
                            </li>
                        </template>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</template>
