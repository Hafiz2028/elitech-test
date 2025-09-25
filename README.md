<div align="center">
<img src="/public/logo.png" alt="Elitech Logo" width="200"/>
<h1>Elitech - Sistem Manajemen Manufaktur</h1>
<p>
Aplikasi web untuk manajemen manufaktur yang dibangun dengan Laravel & Vue.js.
</p>
</div>

Aplikasi ini adalah implementasi lengkap dari technical test untuk posisi Full-Stack Developer Intern di PT. Sinko Prima Alloy. Sistem ini mencakup seluruh alur kerja dari manajemen data master, perencanaan produksi (PPIC), hingga pelacakan dan pelaporan order produksi.

<h2>✨ Fitur Utama</h2>

<ul>
<li><bold>Manajemen Data Master:</bold> CRUD lengkap untuk data Pengguna dan Produk, termasuk fitur soft delete.</li>
<li><bold>Sistem Hak Akses:</bold> Otorisasi berbasis Peran (Role) dan Departemen (Department) untuk membatasi akses menu dan fitur secara dinamis.</li>
<li><bold>Modul PPIC (Rencana Produksi):</bold>
<ul>
<li>Membuat rencana produksi dengan detail produk dan kuantitas.</li>
<li>Alur persetujuan oleh Manajer Produksi.</li>
<li>Perhitungan deadline otomatis (7 hari kerja) setelah persetujuan.</li>
</ul>
</li>
<li><bold>Modul Produksi (Order Produksi):</bold>
<ul>
<li>Pembuatan order produksi secara otomatis setelah rencana disetujui.</li>
<li>Pelacakan status order: <italic>Menunggu</italic> -> <italic>Sedang Dikerjakan</italic> -> <italic>Selesai</italic>.</li>
<li>Input hasil produksi aktual (OK) dan produk ditolak (NG).</li>
<li>Pencatatan riwayat (log) untuk setiap perubahan status.</li>
</ul>
</li>
<li><bold>Modul Pelaporan:</bold>
<ul>
<li>Laporan Produksi dengan filter per periode (Tahun, Bulan, Minggu) dan per Kode Order.</li>
<li>Laporan PPIC dengan filter per periode dan per Kode Rencana.</li>
<li>Fungsi ekspor ke CSV untuk semua laporan.</li>
</ul>
</li>
<li><bold>Antarmuka Modern:</bold>
<ul>
<li>Dibangun dengan Vue 3 (Composition API) dan Tailwind CSS.</li>
<li>Halaman landing page dan autentikasi yang responsif dan interaktif.</li>
<li>Dasbor utama dengan statistik real-time.</li>
</ul>
</li>
</ul>

<h2>🚀 Tumpukan Teknologi (Tech Stack)</h2>

<table>
<thead>
<tr>
<th>Kategori</th>
<th>Teknologi</th>
</tr>
</thead>
<nbody>
<tr>
<td><bold>Backend</bold></td>
<td>Laravel 11</td>
</tr>
<tr>
<td><bold>Frontend</bold></td>
<td>Vue.js 3 (Composition API)</td>
</tr>
<tr>
<td><bold>Framework</bold></td>
<td>Inertia.js</td>
</tr>
<tr>
<td><bold>Styling</bold></td>
<td>Tailwind CSS</td>
</tr>
<tr>
<td><bold>Database</bold></td>
<td>MySQL</td>
</tr>
<tr>
<td><bold>Server</bold></td>
<td>Laragon (atau XAMPP, MAMP, dll.)</td>
</tr>
</nbody>
</table>

<h2>📋 Prasyarat</h2>

<ul>
<li>PHP 8.2 atau lebih tinggi</li>
<li>Composer 2.x</li>
<li>Node.js 18.x atau lebih tinggi & NPM</li>
<li>Database Server (misalnya MySQL, MariaDB)</li>
</ul>

<h2>⚙️ Petunjuk Pemasangan (Installation)</h2>

<on>
<li><bold>Clone repositori ili:</bold>
    
```bash
git clone [URL_GITHUB_ANDA] elitech-test
```

</li>
<li><bold>Masuk ke direktori proyek:</bold>
    
```bash
cd elitech-test
```

</li>
<li><bold>Install dependensi PHP (Composer):</bold>
    
```bash
composer install
```

</li>
<li><bold>Install dependensi JavaScript (NPM):</bold>
    
```bash
npm install
```

</li>
<li><bold>Salin file environment:</bold>
    
```bash
cp .env.example .env
```

</li>
<li><bold>Generate kunci aplikasi Laravel:</bold>
    
```bash
php artisan key:generate
```

</li>
<li><bold>Konfigurasi Database:</bold>
<nreak>Buka file <code>.env</code> dan sesuaikan pengaturan database Anda. Pastikan nama database sudah dibuat di server MySQL Anda.
    
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=elitech_test
DB_USERNAME=root
DB_PASSWORD=
```

</li>
<li><bold>Jalankan migrasi dan seeder:</bold>
<nreak>Perintah ini akan membuat semua tabel dan mengisinya dengan 100+ data dummy yang realistis untuk semua modul.
    
```bash
php artisan migrate:fresh --seed
```

</li>
<li><bold>Jalankan Vite development server:</bold>
    
```bash
npm run dev
```

</li>
<li><bold>Jalankan server PHP Laravel (di terminal terpisah):</bold>
    
```bash
php artisan serve
```

</li>
</on>

✅ Aplikasi sekarang dapat diakses di <bold>http://127.0.0.1:8000</bold>.

<h2>👤 Akun Demo</h2>

Anda dapat login menggunakan akun-akun berikut untuk menguji hak akses yang berbeda.
<nreak><bold>Password</bold> untuk semua akun adalah: <code>admin</code>

<table>
<nhead>
<tr>
<th>Peran</th>
<th>Email</th>
</tr>
</nhead>
<nbody>
<tr>
<td><bold>Manager Produksi</bold></td>
<td><code>managerproduksi@mail.com</code></td>
</tr>
<tr>
<td><bold>Manager PPIC</bold></td>
<td><code>managerppic@mail.com</code></td>
</tr>
<tr>
<td><bold>Staff Produksi</bold></td>
<td><code>staffproduksi@mail.com</code></td>
</tr>
<tr>
<td><bold>Staff PPIC</bold></td>
<td><code>staffppic@mail.com</code></td>
</tr>
</nbody>
</table>

Dibuat oleh <bold>Muhammad Hafiz Aulia Rahmadoni</bold>
