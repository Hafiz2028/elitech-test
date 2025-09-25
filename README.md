<div align="center">
<img src="public/logo.png" alt="Elitech Logo" width="200"/>
<h1>Elitech - Sistem Manajemen Manufaktur</h1>
<p>
Aplikasi web untuk manajemen manufaktur yang dibangun dengan Laravel & Vue.js.
</p>
</div>

Aplikasi ini adalah implementasi lengkap dari technical test untuk posisi Full-Stack Developer Intern di PT. Sinko Prima Alloy. Sistem ini mencakup seluruh alur kerja dari manajemen data master, perencanaan produksi (PPIC), hingga pelacakan dan pelaporan order produksi.

✨ Fitur Utama
Manajemen Data Master: CRUD lengkap untuk data Pengguna dan Produk, termasuk fitur soft delete.

Sistem Hak Akses: Otorisasi berbasis Peran (Role) dan Departemen (Department) untuk membatasi akses menu dan fitur secara dinamis.

Modul PPIC (Rencana Produksi):

Membuat rencana produksi dengan detail produk dan kuantitas.

Alur persetujuan oleh Manajer Produksi.

Perhitungan deadline otomatis (7 hari kerja) setelah persetujuan.

Modul Produksi (Order Produksi):

Pembuatan order produksi secara otomatis setelah rencana disetujui.

Pelacakan status order: Menunggu -> Sedang Dikerjakan -> Selesai.

Input hasil produksi aktual (OK) dan produk ditolak (NG).

Pencatatan riwayat (log) untuk setiap perubahan status.

Modul Pelaporan:

Laporan Produksi dengan filter per periode (Tahun, Bulan, Minggu) dan per Kode Order.

Laporan PPIC dengan filter per periode dan per Kode Rencana.

Fungsi ekspor ke CSV untuk semua laporan.

Antarmuka Modern:

Dibangun dengan Vue 3 (Composition API) dan Tailwind CSS.

Halaman landing page dan autentikasi yang responsif dan interaktif.

Dasbor utama dengan statistik real-time.

🚀 Tumpukan Teknologi (Tech Stack)
Kategori

Teknologi

Backend

Laravel 11

Frontend

Vue.js 3 (Composition API)

Framework

Inertia.js

Styling

Tailwind CSS

Database

MySQL

Server

Laragon (atau XAMPP, MAMP, dll.)

📋 Prasyarat
PHP 8.2 atau lebih tinggi

Composer 2.x

Node.js 18.x atau lebih tinggi & NPM

Database Server (misalnya MySQL, MariaDB)

⚙️ Petunjuk Pemasangan (Installation)
Clone repositori ini:

git clone [URL_GITHUB_ANDA] elitech-test

Masuk ke direktori proyek:

cd elitech-test

Install dependensi PHP (Composer):

composer install

Install dependensi JavaScript (NPM):

npm install

Salin file environment:

cp .env.example .env

Generate kunci aplikasi Laravel:

php artisan key:generate

Konfigurasi Database:
Buka file .env dan sesuaikan pengaturan database Anda. Pastikan nama database sudah dibuat di server MySQL Anda.

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=elitech_test
DB_USERNAME=root
DB_PASSWORD=

Jalankan migrasi dan seeder:
Perintah ini akan membuat semua tabel dan mengisinya dengan 100+ data dummy yang realistis untuk semua modul.

php artisan migrate:fresh --seed

Jalankan Vite development server:

npm run dev

Jalankan server PHP Laravel (di terminal terpisah):

php artisan serve

✅ Aplikasi sekarang dapat diakses di http://127.0.0.1:8000.

👤 Akun Demo
Anda dapat login menggunakan akun-akun berikut untuk menguji hak akses yang berbeda.
Password untuk semua akun adalah: admin

Peran

Email

Manager Produksi

managerproduksi@mail.com

Manager PPIC

managerppic@mail.com

Staff Produksi

staffproduksi@mail.com

Staff PPIC

staffppic@mail.com

Dibuat oleh [Nama Lengkap Anda]
