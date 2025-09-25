-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2025 at 09:27 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elitech_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-managerppic1@mail.com|127.0.0.1', 'i:1;', 1758783976),
('laravel-cache-managerppic1@mail.com|127.0.0.1:timer', 'i:1758783976;', 1758783976);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'PPIC', '2025-09-25 00:04:52', '2025-09-25 00:04:52'),
(2, 'Produksi', '2025-09-25 00:04:52', '2025-09-25 00:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_departments_table', 1),
(2, '0001_01_01_000000_create_roles_table', 1),
(3, '0001_01_01_000000_create_users_table', 1),
(4, '0001_01_01_000001_create_cache_table', 1),
(5, '0001_01_01_000002_create_jobs_table', 1),
(6, '2025_09_22_105138_create_products_table', 1),
(7, '2025_09_22_105358_create_production_plans_table', 1),
(8, '2025_09_22_105421_create_production_plan_details_table', 1),
(9, '2025_09_22_105446_create_production_orders_table', 1),
(10, '2025_09_22_105506_create_production_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_logs`
--

CREATE TABLE `production_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `production_order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_logs`
--

INSERT INTO `production_logs` (`id`, `production_order_id`, `user_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 38, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(2, 1, 38, 'Produksi selesai. Hasil: 50 OK, 2 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(3, 3, 34, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(4, 3, 34, 'Produksi selesai. Hasil: 133 OK, 1 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(5, 4, 30, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(6, 10, 53, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(7, 10, 53, 'Produksi selesai. Hasil: 163 OK, 4 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(8, 11, 52, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(9, 11, 52, 'Produksi selesai. Hasil: 155 OK, 4 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(10, 12, 10, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(11, 12, 10, 'Produksi selesai. Hasil: 107 OK, 1 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(12, 13, 5, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(13, 13, 5, 'Produksi selesai. Hasil: 192 OK, 1 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(14, 14, 9, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(15, 15, 16, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(16, 16, 38, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(17, 17, 26, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(18, 19, 16, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(19, 21, 13, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(20, 21, 13, 'Produksi selesai. Hasil: 193 OK, 2 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(21, 23, 51, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(22, 23, 51, 'Produksi selesai. Hasil: 14 OK, 0 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(23, 24, 46, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(24, 25, 51, 'Produksi dimulai.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(25, 25, 51, 'Produksi selesai. Hasil: 84 OK, 2 NG.', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(26, 27, 32, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(27, 32, 10, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(28, 33, 16, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(29, 34, 38, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(30, 34, 38, 'Produksi selesai. Hasil: 41 OK, 5 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(31, 35, 46, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(32, 35, 46, 'Produksi selesai. Hasil: 138 OK, 2 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(33, 36, 30, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(34, 36, 30, 'Produksi selesai. Hasil: 83 OK, 3 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(35, 37, 51, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(36, 38, 32, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(37, 38, 32, 'Produksi selesai. Hasil: 39 OK, 3 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(38, 39, 16, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(39, 40, 52, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(40, 41, 13, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(41, 42, 10, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(42, 43, 32, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(43, 44, 7, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(44, 44, 7, 'Produksi selesai. Hasil: 131 OK, 0 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(45, 45, 34, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(46, 45, 34, 'Produksi selesai. Hasil: 155 OK, 3 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(47, 46, 7, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(48, 47, 7, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(49, 47, 7, 'Produksi selesai. Hasil: 80 OK, 5 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(50, 48, 16, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(51, 49, 12, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(52, 50, 51, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(53, 50, 51, 'Produksi selesai. Hasil: 36 OK, 1 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(54, 51, 44, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(55, 51, 44, 'Produksi selesai. Hasil: 62 OK, 3 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(56, 52, 40, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(57, 54, 46, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(58, 55, 7, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(59, 55, 7, 'Produksi selesai. Hasil: 131 OK, 4 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(60, 56, 13, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(61, 56, 13, 'Produksi selesai. Hasil: 16 OK, 4 NG.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(62, 57, 13, 'Produksi dimulai.', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(63, 58, 38, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(64, 58, 38, 'Produksi selesai. Hasil: 99 OK, 4 NG.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(65, 59, 51, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(66, 60, 30, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(67, 62, 52, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(68, 63, 5, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(69, 63, 5, 'Produksi selesai. Hasil: 26 OK, 5 NG.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(70, 64, 26, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(71, 67, 51, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(72, 68, 9, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(73, 69, 7, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(74, 71, 44, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(75, 73, 52, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(76, 73, 52, 'Produksi selesai. Hasil: 139 OK, 2 NG.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(77, 74, 26, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(78, 76, 44, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(79, 76, 44, 'Produksi selesai. Hasil: 129 OK, 0 NG.', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(80, 77, 26, 'Produksi dimulai.', '2025-09-25 00:04:59', '2025-09-25 00:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `production_orders`
--

CREATE TABLE `production_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `production_plan_detail_id` bigint UNSIGNED NOT NULL,
  `status` enum('menunggu','sedang_dikerjakan','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'menunggu',
  `target_quantity` int NOT NULL,
  `actual_quantity` int NOT NULL DEFAULT '0',
  `rejected_quantity` int NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `completion_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_orders`
--

INSERT INTO `production_orders` (`id`, `order_code`, `production_plan_detail_id`, `status`, `target_quantity`, `actual_quantity`, `rejected_quantity`, `start_date`, `completion_date`, `created_at`, `updated_at`) VALUES
(1, 'PO/2025/28884', 1, 'selesai', 52, 50, 2, '2025-09-21 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(2, 'PO/2025/36379', 7, 'menunggu', 155, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(3, 'PO/2025/29240', 8, 'selesai', 134, 133, 1, '2025-09-24 00:04:57', '2025-09-21 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(4, 'PO/2025/60224', 9, 'sedang_dikerjakan', 87, 0, 0, '2025-09-23 00:04:57', NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(5, 'PO/2025/18929', 10, 'menunggu', 10, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(6, 'PO/2025/73187', 11, 'menunggu', 189, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(7, 'PO/2025/51116', 12, 'menunggu', 26, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(8, 'PO/2025/07754', 13, 'menunggu', 64, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(9, 'PO/2025/57429', 14, 'menunggu', 192, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(10, 'PO/2025/84272', 15, 'selesai', 167, 163, 4, '2025-09-24 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(11, 'PO/2025/29350', 27, 'selesai', 159, 155, 4, '2025-09-20 00:04:57', '2025-09-22 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(12, 'PO/2025/80838', 28, 'selesai', 108, 107, 1, '2025-09-22 00:04:57', '2025-09-24 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(13, 'PO/2025/05132', 29, 'selesai', 193, 192, 1, '2025-09-21 00:04:57', '2025-09-23 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(14, 'PO/2025/30087', 30, 'sedang_dikerjakan', 104, 0, 0, '2025-09-24 00:04:57', NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(15, 'PO/2025/23644', 31, 'sedang_dikerjakan', 116, 0, 0, '2025-09-23 00:04:57', NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(16, 'PO/2025/78360', 34, 'sedang_dikerjakan', 18, 0, 0, '2025-09-20 00:04:57', NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(17, 'PO/2025/30932', 35, 'sedang_dikerjakan', 146, 0, 0, '2025-09-22 00:04:57', NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(18, 'PO/2025/10258', 36, 'menunggu', 161, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(19, 'PO/2025/75537', 37, 'sedang_dikerjakan', 180, 0, 0, '2025-09-20 00:04:57', NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(20, 'PO/2025/11300', 38, 'menunggu', 53, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(21, 'PO/2025/46376', 39, 'selesai', 195, 193, 2, '2025-09-23 00:04:57', '2025-09-21 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(22, 'PO/2025/51983', 40, 'menunggu', 29, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(23, 'PO/2025/84492', 41, 'selesai', 14, 14, 0, '2025-09-20 00:04:57', '2025-09-21 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(24, 'PO/2025/97452', 45, 'sedang_dikerjakan', 194, 0, 0, '2025-09-22 00:04:57', NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(25, 'PO/2025/59264', 46, 'selesai', 86, 84, 2, '2025-09-24 00:04:57', '2025-09-21 00:04:57', '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(26, 'PO/2025/88001', 48, 'menunggu', 154, 0, 0, NULL, NULL, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(27, 'PO/2025/85842', 49, 'sedang_dikerjakan', 87, 0, 0, '2025-09-21 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(28, 'PO/2025/36479', 50, 'menunggu', 165, 0, 0, NULL, NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(29, 'PO/2025/03311', 51, 'menunggu', 113, 0, 0, NULL, NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(30, 'PO/2025/02937', 52, 'menunggu', 103, 0, 0, NULL, NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(31, 'PO/2025/48542', 53, 'menunggu', 126, 0, 0, NULL, NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(32, 'PO/2025/46003', 54, 'sedang_dikerjakan', 163, 0, 0, '2025-09-23 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(33, 'PO/2025/52268', 60, 'sedang_dikerjakan', 116, 0, 0, '2025-09-21 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(34, 'PO/2025/36446', 61, 'selesai', 46, 41, 5, '2025-09-20 00:04:58', '2025-09-22 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(35, 'PO/2025/60340', 62, 'selesai', 140, 138, 2, '2025-09-24 00:04:58', '2025-09-22 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(36, 'PO/2025/76086', 63, 'selesai', 86, 83, 3, '2025-09-21 00:04:58', '2025-09-23 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(37, 'PO/2025/50617', 69, 'sedang_dikerjakan', 156, 0, 0, '2025-09-23 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(38, 'PO/2025/30551', 70, 'selesai', 42, 39, 3, '2025-09-20 00:04:58', '2025-09-21 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(39, 'PO/2025/24581', 71, 'sedang_dikerjakan', 63, 0, 0, '2025-09-20 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(40, 'PO/2025/20260', 78, 'sedang_dikerjakan', 37, 0, 0, '2025-09-24 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(41, 'PO/2025/08718', 79, 'sedang_dikerjakan', 57, 0, 0, '2025-09-22 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(42, 'PO/2025/75747', 80, 'sedang_dikerjakan', 52, 0, 0, '2025-09-23 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(43, 'PO/2025/48184', 83, 'sedang_dikerjakan', 82, 0, 0, '2025-09-22 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(44, 'PO/2025/16929', 84, 'selesai', 131, 131, 0, '2025-09-24 00:04:58', '2025-09-24 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(45, 'PO/2025/99653', 85, 'selesai', 158, 155, 3, '2025-09-22 00:04:58', '2025-09-23 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(46, 'PO/2025/04935', 86, 'sedang_dikerjakan', 140, 0, 0, '2025-09-23 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(47, 'PO/2025/66896', 87, 'selesai', 85, 80, 5, '2025-09-24 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(48, 'PO/2025/91805', 88, 'sedang_dikerjakan', 119, 0, 0, '2025-09-20 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(49, 'PO/2025/85293', 98, 'sedang_dikerjakan', 85, 0, 0, '2025-09-23 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(50, 'PO/2025/13845', 99, 'selesai', 37, 36, 1, '2025-09-23 00:04:58', '2025-09-22 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(51, 'PO/2025/11396', 100, 'selesai', 65, 62, 3, '2025-09-22 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(52, 'PO/2025/82448', 103, 'sedang_dikerjakan', 156, 0, 0, '2025-09-20 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(53, 'PO/2025/95822', 104, 'menunggu', 140, 0, 0, NULL, NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(54, 'PO/2025/90390', 105, 'sedang_dikerjakan', 133, 0, 0, '2025-09-22 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(55, 'PO/2025/35412', 106, 'selesai', 135, 131, 4, '2025-09-23 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(56, 'PO/2025/13237', 107, 'selesai', 20, 16, 4, '2025-09-20 00:04:58', '2025-09-22 00:04:58', '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(57, 'PO/2025/66158', 108, 'sedang_dikerjakan', 37, 0, 0, '2025-09-23 00:04:58', NULL, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(58, 'PO/2025/62497', 109, 'selesai', 103, 99, 4, '2025-09-21 00:04:58', '2025-09-22 00:04:59', '2025-09-25 00:04:58', '2025-09-25 00:04:59'),
(59, 'PO/2025/51240', 110, 'sedang_dikerjakan', 101, 0, 0, '2025-09-20 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(60, 'PO/2025/26113', 112, 'sedang_dikerjakan', 181, 0, 0, '2025-09-24 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(61, 'PO/2025/03276', 113, 'menunggu', 140, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(62, 'PO/2025/78568', 125, 'sedang_dikerjakan', 125, 0, 0, '2025-09-21 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(63, 'PO/2025/70945', 131, 'selesai', 31, 26, 5, '2025-09-22 00:04:59', '2025-09-25 00:04:59', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(64, 'PO/2025/61919', 141, 'sedang_dikerjakan', 123, 0, 0, '2025-09-20 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(65, 'PO/2025/87430', 146, 'menunggu', 72, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(66, 'PO/2025/95621', 147, 'menunggu', 20, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(67, 'PO/2025/71894', 148, 'sedang_dikerjakan', 199, 0, 0, '2025-09-24 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(68, 'PO/2025/74542', 151, 'sedang_dikerjakan', 64, 0, 0, '2025-09-22 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(69, 'PO/2025/81363', 152, 'sedang_dikerjakan', 95, 0, 0, '2025-09-21 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(70, 'PO/2025/90318', 170, 'menunggu', 132, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(71, 'PO/2025/56401', 171, 'sedang_dikerjakan', 141, 0, 0, '2025-09-21 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(72, 'PO/2025/68024', 174, 'menunggu', 130, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(73, 'PO/2025/03180', 175, 'selesai', 141, 139, 2, '2025-09-22 00:04:59', '2025-09-22 00:04:59', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(74, 'PO/2025/67446', 176, 'sedang_dikerjakan', 17, 0, 0, '2025-09-21 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(75, 'PO/2025/30818', 177, 'menunggu', 136, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(76, 'PO/2025/59584', 181, 'selesai', 129, 129, 0, '2025-09-20 00:04:59', '2025-09-22 00:04:59', '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(77, 'PO/2025/92758', 190, 'sedang_dikerjakan', 114, 0, 0, '2025-09-24 00:04:59', NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(78, 'PO/2025/74183', 191, 'menunggu', 151, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(79, 'PO/2025/43626', 192, 'menunggu', 173, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(80, 'PO/2025/05315', 193, 'menunggu', 182, 0, 0, NULL, NULL, '2025-09-25 00:04:59', '2025-09-25 00:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `production_plans`
--

CREATE TABLE `production_plans` (
  `id` bigint UNSIGNED NOT NULL,
  `plan_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('dibuat','menunggu_persetujuan','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dibuat',
  `deadline` date DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint UNSIGNED NOT NULL,
  `approved_by` bigint UNSIGNED DEFAULT NULL,
  `approval_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_plans`
--

INSERT INTO `production_plans` (`id`, `plan_code`, `status`, `deadline`, `notes`, `created_by`, `approved_by`, `approval_date`, `created_at`, `updated_at`) VALUES
(1, 'PP/2025/66023', 'disetujui', '2025-10-06', 'Aut adipisci eos velit saepe.', 3, 15, '2025-09-24 00:04:56', '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(2, 'PP/2025/38281', 'menunggu_persetujuan', NULL, 'Aut eaque inventore ratione ipsa aperiam rem voluptatem voluptas.', 28, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(3, 'PP/2025/29009', 'menunggu_persetujuan', NULL, 'Repudiandae totam quae suscipit ut.', 50, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(4, 'PP/2025/87073', 'menunggu_persetujuan', NULL, 'Rerum modi quas ea aut.', 17, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(5, 'PP/2025/27817', 'disetujui', '2025-10-06', 'Labore esse perspiciatis dicta ut recusandae.', 45, 54, '2025-09-19 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(6, 'PP/2025/63642', 'disetujui', '2025-10-06', 'Id minus iste natus officiis nobis qui.', 50, 14, '2025-09-24 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(7, 'PP/2025/45805', 'disetujui', '2025-10-06', 'Et pariatur hic cumque sed.', 37, 31, '2025-09-20 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(8, 'PP/2025/82299', 'menunggu_persetujuan', NULL, 'Aspernatur suscipit consequuntur tempore minima ex at.', 23, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(9, 'PP/2025/86642', 'menunggu_persetujuan', NULL, 'A delectus qui rerum praesentium praesentium.', 28, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(10, 'PP/2025/11842', 'menunggu_persetujuan', NULL, 'Et perspiciatis quia provident saepe et consequatur.', 39, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(11, 'PP/2025/11461', 'menunggu_persetujuan', NULL, 'Iusto voluptatibus et delectus corporis occaecati et et.', 11, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(12, 'PP/2025/96325', 'ditolak', NULL, 'Voluptas asperiores modi ut quod rem.', 29, 37, '2025-09-23 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(13, 'PP/2025/32649', 'ditolak', NULL, 'Quod voluptas molestiae culpa enim et sequi consequatur.', 28, 31, '2025-09-17 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(14, 'PP/2025/70640', 'disetujui', '2025-10-06', 'Quibusdam dicta quaerat voluptas sit dolorem et id laudantium.', 23, 41, '2025-09-22 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(15, 'PP/2025/30820', 'disetujui', '2025-10-06', 'Maxime sed quisquam id quisquam inventore in.', 29, 14, '2025-09-15 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(16, 'PP/2025/43913', 'ditolak', NULL, 'Amet sit voluptatem provident odit.', 1, 35, '2025-09-20 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(17, 'PP/2025/04807', 'disetujui', '2025-10-06', 'Mollitia non nisi laboriosam nobis.', 23, 24, '2025-09-15 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(18, 'PP/2025/36046', 'disetujui', '2025-10-06', 'Harum quaerat minus id nihil ducimus sit eius consequatur.', 1, 33, '2025-09-22 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(19, 'PP/2025/20868', 'disetujui', '2025-10-06', 'Repellendus aut consequuntur nam voluptatem alias ab.', 31, 42, '2025-09-19 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(20, 'PP/2025/76655', 'disetujui', '2025-10-06', 'Similique praesentium voluptatum unde est.', 28, 14, '2025-09-23 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(21, 'PP/2025/49564', 'menunggu_persetujuan', NULL, 'Magnam animi id error tenetur ut saepe nisi.', 41, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(22, 'PP/2025/07240', 'ditolak', NULL, 'Molestiae aut numquam molestiae ipsum deserunt deserunt nesciunt.', 37, 2, '2025-09-24 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(23, 'PP/2025/25575', 'disetujui', '2025-10-06', 'Iste nobis est consequatur illum similique.', 17, 1, '2025-09-20 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(24, 'PP/2025/07660', 'menunggu_persetujuan', NULL, 'Minima molestiae illo quia.', 6, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(25, 'PP/2025/23382', 'disetujui', '2025-10-06', 'Quod accusamus aut hic quis tempora.', 6, 43, '2025-09-21 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(26, 'PP/2025/58262', 'disetujui', '2025-10-06', 'Sint aperiam fuga ad odit nulla.', 47, 37, '2025-09-16 00:04:57', '2025-09-25 00:04:56', '2025-09-25 00:04:57'),
(27, 'PP/2025/97525', 'disetujui', '2025-10-06', 'Nihil eligendi nihil quod dignissimos perspiciatis libero assumenda nemo.', 35, 2, '2025-09-23 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(28, 'PP/2025/13442', 'ditolak', NULL, 'Eligendi mollitia facere est.', 37, 31, '2025-09-21 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(29, 'PP/2025/40392', 'ditolak', NULL, 'Est dolore tempore quae molestiae exercitationem.', 31, 43, '2025-09-16 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(30, 'PP/2025/96078', 'disetujui', '2025-10-06', 'Ex facere molestiae qui vero dicta.', 36, 35, '2025-09-15 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(31, 'PP/2025/24405', 'disetujui', '2025-10-06', 'Eos omnis at velit et ex consequatur.', 48, 31, '2025-09-16 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(32, 'PP/2025/20509', 'ditolak', NULL, 'Enim deleniti quia aut vero ut.', 50, 54, '2025-09-24 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(33, 'PP/2025/33239', 'ditolak', NULL, 'Consequatur consequuntur eveniet quas dignissimos.', 3, 2, '2025-09-21 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(34, 'PP/2025/51966', 'menunggu_persetujuan', NULL, 'Voluptate alias aliquid minima enim velit nihil.', 8, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(35, 'PP/2025/22477', 'disetujui', '2025-10-06', 'Expedita molestiae laboriosam veniam qui adipisci necessitatibus est.', 31, 14, '2025-09-20 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(36, 'PP/2025/61226', 'ditolak', NULL, 'Iusto autem pariatur placeat maiores distinctio.', 1, 14, '2025-09-21 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(37, 'PP/2025/03416', 'menunggu_persetujuan', NULL, 'Quidem cumque corrupti autem id quam id eius.', 50, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(38, 'PP/2025/75194', 'ditolak', NULL, 'Doloremque necessitatibus sunt aut sed quo illo.', 19, 54, '2025-09-15 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(39, 'PP/2025/53099', 'disetujui', '2025-10-06', 'Ut error eligendi non eveniet.', 23, 43, '2025-09-15 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(40, 'PP/2025/31194', 'menunggu_persetujuan', NULL, 'Tenetur dolorem rerum voluptatum ut modi.', 28, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(41, 'PP/2025/61790', 'ditolak', NULL, 'Quaerat odio id et sint sunt.', 19, 15, '2025-09-19 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(42, 'PP/2025/58099', 'disetujui', '2025-10-06', 'Sint saepe in sed quas.', 22, 43, '2025-09-21 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(43, 'PP/2025/87340', 'disetujui', '2025-10-06', 'Dicta in recusandae omnis voluptas consequatur voluptates ut.', 42, 31, '2025-09-23 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(44, 'PP/2025/56039', 'menunggu_persetujuan', NULL, 'Unde omnis quo rerum voluptates eligendi aperiam.', 18, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(45, 'PP/2025/31513', 'menunggu_persetujuan', NULL, 'Unde adipisci ullam dolore sit atque aut porro.', 3, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(46, 'PP/2025/16694', 'ditolak', NULL, 'Possimus fugit odit eos mollitia neque.', 20, 54, '2025-09-20 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(47, 'PP/2025/83851', 'menunggu_persetujuan', NULL, 'Assumenda doloribus voluptas molestias.', 45, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(48, 'PP/2025/52915', 'menunggu_persetujuan', NULL, 'Aliquid nihil fuga eos veritatis.', 23, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(49, 'PP/2025/62975', 'ditolak', NULL, 'Deserunt est voluptatem dolor eos nisi sit.', 42, 42, '2025-09-23 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(50, 'PP/2025/88816', 'disetujui', '2025-10-06', 'Consequuntur quaerat voluptas omnis in incidunt officia ex.', 39, 35, '2025-09-23 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(51, 'PP/2025/09276', 'ditolak', NULL, 'Exercitationem dolore nobis cumque earum.', 42, 21, '2025-09-21 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(52, 'PP/2025/54101', 'menunggu_persetujuan', NULL, 'Itaque rerum alias id odio consequatur.', 47, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(53, 'PP/2025/19252', 'disetujui', '2025-10-06', 'Et ut ipsa repellendus dolorem aut ab quis.', 19, 31, '2025-09-17 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(54, 'PP/2025/12822', 'disetujui', '2025-10-06', 'Deleniti voluptatem qui dolorem dolore.', 23, 21, '2025-09-24 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(55, 'PP/2025/09858', 'disetujui', '2025-10-06', 'Itaque veritatis alias dolore reprehenderit porro asperiores voluptas.', 14, 42, '2025-09-17 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(56, 'PP/2025/41027', 'disetujui', '2025-10-06', 'Minus officiis impedit qui pariatur.', 39, 42, '2025-09-19 00:04:58', '2025-09-25 00:04:56', '2025-09-25 00:04:58'),
(57, 'PP/2025/87366', 'menunggu_persetujuan', NULL, 'Blanditiis occaecati perspiciatis distinctio aliquam autem.', 49, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(58, 'PP/2025/82950', 'disetujui', '2025-10-06', 'Facilis excepturi commodi voluptatem quia.', 41, 54, '2025-09-16 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(59, 'PP/2025/50382', 'menunggu_persetujuan', NULL, 'Aut eius sequi architecto.', 20, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(60, 'PP/2025/01587', 'ditolak', NULL, 'Quia odit quo aspernatur ad hic repudiandae.', 28, 54, '2025-09-18 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(61, 'PP/2025/61985', 'menunggu_persetujuan', NULL, 'Cupiditate consectetur eius qui voluptates dolore amet quasi.', 22, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(62, 'PP/2025/15776', 'menunggu_persetujuan', NULL, 'Natus voluptate minus modi ut magni velit illo.', 29, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(63, 'PP/2025/22359', 'ditolak', NULL, 'Excepturi fuga alias excepturi rerum facere debitis id.', 36, 49, '2025-09-15 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(64, 'PP/2025/32325', 'menunggu_persetujuan', NULL, 'Provident dolorum tempore labore laborum eius reprehenderit.', 3, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(65, 'PP/2025/25165', 'disetujui', '2025-10-06', 'Non excepturi qui facere.', 39, 27, '2025-09-21 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(66, 'PP/2025/54482', 'ditolak', NULL, 'Magnam similique aliquam magni ratione ea in.', 8, 14, '2025-09-17 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(67, 'PP/2025/00525', 'ditolak', NULL, 'Maxime necessitatibus qui perspiciatis eligendi fugiat saepe sint.', 1, 54, '2025-09-18 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(68, 'PP/2025/46632', 'disetujui', '2025-10-06', 'Repellat ratione libero consequatur pariatur eum laudantium non est.', 20, 35, '2025-09-16 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(69, 'PP/2025/65579', 'menunggu_persetujuan', NULL, 'Sit placeat perferendis aut et ipsam dolorem est.', 23, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(70, 'PP/2025/22924', 'menunggu_persetujuan', NULL, 'Labore non dignissimos voluptatem aut.', 31, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(71, 'PP/2025/41735', 'ditolak', NULL, 'Alias voluptatem perferendis eligendi possimus dolor aliquid dicta.', 6, 15, '2025-09-17 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(72, 'PP/2025/38758', 'menunggu_persetujuan', NULL, 'Expedita deleniti explicabo aut quaerat repellendus voluptatem quaerat.', 29, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(73, 'PP/2025/70009', 'disetujui', '2025-10-06', 'Placeat tempore sapiente sunt sit.', 31, 35, '2025-09-16 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(74, 'PP/2025/99923', 'menunggu_persetujuan', NULL, 'Et ipsam quia sit libero cumque.', 18, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(75, 'PP/2025/36200', 'menunggu_persetujuan', NULL, 'Ducimus saepe ipsum quis vero.', 22, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(76, 'PP/2025/93124', 'disetujui', '2025-10-06', 'Amet esse itaque impedit inventore.', 6, 2, '2025-09-17 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(77, 'PP/2025/64951', 'disetujui', '2025-10-06', 'Qui veniam modi tenetur eligendi.', 28, 14, '2025-09-24 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(78, 'PP/2025/17288', 'menunggu_persetujuan', NULL, 'Fuga odit minima laudantium qui qui ut.', 28, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(79, 'PP/2025/69575', 'menunggu_persetujuan', NULL, 'Voluptas molestiae dolorem placeat doloremque.', 45, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(80, 'PP/2025/40395', 'disetujui', '2025-10-06', 'Enim incidunt magnam voluptatibus blanditiis doloribus unde.', 22, 1, '2025-09-15 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(81, 'PP/2025/02618', 'menunggu_persetujuan', NULL, 'Cumque soluta est et minima.', 50, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(82, 'PP/2025/83735', 'menunggu_persetujuan', NULL, 'Veritatis voluptate explicabo non.', 11, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(83, 'PP/2025/97011', 'ditolak', NULL, 'Ex et ut mollitia et sunt qui culpa similique.', 28, 20, '2025-09-23 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(84, 'PP/2025/82148', 'menunggu_persetujuan', NULL, 'Quia fugiat ratione optio qui amet voluptatem.', 27, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(85, 'PP/2025/72915', 'ditolak', NULL, 'Voluptas recusandae molestias impedit voluptatem neque ut sunt.', 36, 43, '2025-09-23 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(86, 'PP/2025/20231', 'ditolak', NULL, 'Ad exercitationem id eos consequatur dolorem officia dolores.', 42, 14, '2025-09-20 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(87, 'PP/2025/64184', 'ditolak', NULL, 'Vel ab repellendus ipsam quasi voluptatum id.', 47, 27, '2025-09-20 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(88, 'PP/2025/80499', 'disetujui', '2025-10-06', 'Qui aspernatur sint perferendis nihil dolorem cum eum et.', 28, 21, '2025-09-15 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(89, 'PP/2025/64724', 'ditolak', NULL, 'Distinctio vel provident maiores illo corrupti nemo quaerat excepturi.', 15, 14, '2025-09-19 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(90, 'PP/2025/90761', 'disetujui', '2025-10-06', 'Quis voluptatem optio eaque similique.', 39, 20, '2025-09-22 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(91, 'PP/2025/30834', 'disetujui', '2025-10-06', 'Rerum et eaque illo dolor id et provident.', 22, 54, '2025-09-18 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(92, 'PP/2025/66594', 'ditolak', NULL, 'Asperiores accusamus mollitia sit architecto.', 6, 35, '2025-09-16 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(93, 'PP/2025/21025', 'disetujui', '2025-10-06', 'Vel hic cumque tenetur ut error.', 27, 35, '2025-09-18 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(94, 'PP/2025/16933', 'menunggu_persetujuan', NULL, 'Minus est repellendus iste et a.', 39, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(95, 'PP/2025/62897', 'menunggu_persetujuan', NULL, 'Ducimus voluptate similique totam molestiae ea commodi.', 17, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(96, 'PP/2025/29879', 'menunggu_persetujuan', NULL, 'Iure sint nesciunt deleniti quia vero error nobis.', 19, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(97, 'PP/2025/23134', 'menunggu_persetujuan', NULL, 'Odit saepe inventore voluptatem accusamus autem ullam expedita.', 20, NULL, NULL, '2025-09-25 00:04:56', '2025-09-25 00:04:56'),
(98, 'PP/2025/74211', 'disetujui', '2025-10-06', 'Dignissimos quas dolorem labore assumenda quam quidem totam.', 36, 35, '2025-09-19 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(99, 'PP/2025/13289', 'disetujui', '2025-10-06', 'Est et qui enim.', 37, 24, '2025-09-21 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59'),
(100, 'PP/2025/04409', 'ditolak', NULL, 'Est ut dolores id blanditiis incidunt et consequatur quisquam.', 23, 37, '2025-09-21 00:04:59', '2025-09-25 00:04:56', '2025-09-25 00:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `production_plan_details`
--

CREATE TABLE `production_plan_details` (
  `id` bigint UNSIGNED NOT NULL,
  `production_plan_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_plan_details`
--

INSERT INTO `production_plan_details` (`id`, `production_plan_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 89, 171, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(2, 2, 1, 146, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(3, 2, 11, 152, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(4, 2, 101, 68, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(5, 3, 30, 143, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(6, 4, 17, 35, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(7, 5, 95, 126, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(8, 5, 16, 21, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(9, 5, 21, 196, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(10, 6, 80, 25, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(11, 6, 24, 194, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(12, 6, 10, 126, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(13, 7, 55, 59, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(14, 7, 102, 190, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(15, 7, 31, 153, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(16, 8, 11, 90, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(17, 8, 3, 94, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(18, 8, 70, 35, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(19, 9, 61, 155, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(20, 9, 9, 11, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(21, 10, 48, 177, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(22, 10, 48, 33, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(23, 11, 57, 198, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(24, 11, 4, 24, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(25, 12, 25, 100, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(26, 13, 4, 114, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(27, 14, 67, 151, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(28, 14, 65, 141, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(29, 14, 2, 25, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(30, 15, 105, 153, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(31, 15, 55, 70, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(32, 16, 5, 10, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(33, 16, 5, 11, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(34, 17, 52, 185, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(35, 18, 81, 169, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(36, 18, 65, 14, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(37, 19, 67, 53, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(38, 19, 3, 101, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(39, 20, 53, 177, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(40, 20, 1, 125, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(41, 20, 31, 127, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(42, 21, 37, 123, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(43, 21, 99, 180, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(44, 22, 89, 43, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(45, 23, 58, 84, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(46, 23, 25, 120, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(47, 24, 59, 109, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(48, 25, 16, 97, '2025-09-25 00:04:57', '2025-09-25 00:04:57'),
(49, 26, 32, 162, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(50, 26, 44, 67, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(51, 26, 3, 102, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(52, 27, 30, 183, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(53, 27, 31, 120, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(54, 27, 4, 63, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(55, 28, 1, 42, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(56, 28, 78, 77, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(57, 28, 10, 79, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(58, 29, 72, 14, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(59, 29, 1, 42, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(60, 30, 61, 194, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(61, 31, 44, 43, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(62, 31, 83, 149, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(63, 31, 100, 91, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(64, 32, 96, 112, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(65, 32, 64, 157, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(66, 33, 12, 52, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(67, 33, 54, 115, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(68, 34, 14, 135, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(69, 35, 29, 100, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(70, 35, 10, 180, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(71, 35, 17, 189, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(72, 36, 81, 124, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(73, 37, 104, 191, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(74, 37, 5, 52, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(75, 38, 100, 83, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(76, 38, 73, 102, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(77, 38, 4, 167, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(78, 39, 61, 169, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(79, 39, 104, 101, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(80, 39, 8, 68, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(81, 40, 97, 62, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(82, 41, 85, 188, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(83, 42, 87, 161, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(84, 42, 52, 162, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(85, 42, 78, 79, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(86, 43, 90, 28, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(87, 43, 63, 184, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(88, 43, 27, 187, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(89, 44, 79, 25, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(90, 45, 47, 200, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(91, 45, 17, 192, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(92, 45, 40, 150, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(93, 46, 50, 121, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(94, 47, 92, 150, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(95, 48, 102, 59, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(96, 48, 27, 67, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(97, 49, 23, 61, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(98, 50, 24, 137, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(99, 50, 100, 196, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(100, 50, 68, 129, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(101, 51, 86, 22, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(102, 52, 26, 194, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(103, 53, 99, 189, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(104, 53, 96, 136, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(105, 53, 49, 78, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(106, 54, 19, 49, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(107, 55, 1, 170, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(108, 55, 68, 144, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(109, 56, 64, 178, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(110, 56, 65, 56, '2025-09-25 00:04:58', '2025-09-25 00:04:58'),
(111, 57, 32, 81, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(112, 58, 78, 117, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(113, 58, 46, 144, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(114, 59, 15, 128, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(115, 59, 101, 76, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(116, 59, 96, 132, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(117, 60, 15, 24, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(118, 61, 84, 138, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(119, 62, 26, 79, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(120, 62, 72, 22, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(121, 63, 46, 145, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(122, 63, 55, 26, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(123, 64, 62, 127, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(124, 64, 36, 191, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(125, 65, 10, 70, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(126, 66, 95, 123, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(127, 66, 48, 54, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(128, 66, 44, 52, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(129, 67, 17, 29, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(130, 67, 53, 44, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(131, 68, 11, 197, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(132, 69, 44, 88, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(133, 69, 67, 43, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(134, 70, 31, 83, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(135, 70, 99, 125, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(136, 70, 49, 88, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(137, 71, 13, 50, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(138, 71, 39, 130, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(139, 72, 41, 61, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(140, 72, 78, 183, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(141, 73, 103, 115, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(142, 74, 96, 10, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(143, 74, 49, 197, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(144, 74, 42, 170, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(145, 75, 60, 180, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(146, 76, 24, 190, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(147, 77, 54, 181, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(148, 77, 36, 28, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(149, 78, 95, 114, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(150, 79, 36, 135, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(151, 80, 95, 47, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(152, 80, 33, 200, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(153, 81, 86, 34, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(154, 81, 39, 55, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(155, 81, 74, 95, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(156, 82, 88, 27, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(157, 82, 5, 23, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(158, 82, 70, 13, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(159, 83, 23, 79, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(160, 83, 51, 13, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(161, 84, 73, 170, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(162, 84, 15, 109, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(163, 85, 38, 35, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(164, 85, 93, 152, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(165, 86, 96, 151, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(166, 86, 1, 46, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(167, 87, 97, 101, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(168, 87, 47, 185, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(169, 87, 23, 138, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(170, 88, 92, 55, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(171, 88, 26, 44, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(172, 89, 45, 111, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(173, 89, 20, 81, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(174, 90, 56, 148, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(175, 90, 63, 107, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(176, 90, 99, 184, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(177, 91, 58, 138, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(178, 92, 18, 44, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(179, 92, 12, 31, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(180, 92, 98, 142, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(181, 93, 62, 78, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(182, 94, 89, 108, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(183, 94, 27, 39, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(184, 95, 61, 112, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(185, 95, 20, 47, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(186, 96, 81, 118, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(187, 97, 98, 54, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(188, 97, 93, 185, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(189, 97, 70, 157, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(190, 98, 9, 122, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(191, 99, 8, 15, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(192, 99, 34, 151, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(193, 99, 82, 51, '2025-09-25 00:04:59', '2025-09-25 00:04:59'),
(194, 100, 51, 33, '2025-09-25 00:04:59', '2025-09-25 00:04:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ELT-001', 'Velg Mobil Ring 15', 'Velg alloy untuk mobil sedan.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(2, 'ELT-002', 'Blok Mesin Diesel', 'Blok mesin untuk kendaraan diesel 2500cc.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(3, 'ELT-003', 'Gearbox Manual 5-Speed', 'Gearbox transmisi manual 5 percepatan.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(4, 'ELT-004', 'Busi Iridium', 'Busi performa tinggi untuk efisiensi bahan bakar.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(5, 'ELT-005', 'Filter Oli', 'Filter oli standar untuk berbagai jenis mobil.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(6, 'ELT-320', 'numquam dolorum aut', 'Vel omnis sit id.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(7, 'ELT-065', 'animi quo ducimus', 'Occaecati iure officia beatae occaecati et facere ex necessitatibus.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(8, 'ELT-748', 'modi officia accusamus', 'Cupiditate velit aliquam maiores accusantium.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(9, 'ELT-139', 'consequatur molestiae et', 'Hic vitae porro est dolor esse.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(10, 'ELT-303', 'repellat voluptatem omnis', 'Et ea non odio et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(11, 'ELT-691', 'consequuntur quaerat voluptas', 'Exercitationem aut aut dolores sapiente.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(12, 'ELT-506', 'unde odio id', 'Possimus commodi qui animi.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(13, 'ELT-646', 'qui nihil dolore', 'Occaecati occaecati magni eos quis laboriosam.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(14, 'ELT-146', 'recusandae vitae earum', 'Qui ad amet omnis nulla.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(15, 'ELT-170', 'nulla facilis cumque', 'Harum nihil cum quaerat neque quis.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(16, 'ELT-645', 'est facilis quisquam', 'Perspiciatis dolorem voluptatem itaque quis.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(17, 'ELT-619', 'et repudiandae qui', 'Nihil consequatur harum dicta.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(18, 'ELT-987', 'ea rerum in', 'Ut earum et atque omnis.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(19, 'ELT-940', 'nulla commodi ipsum', 'Beatae ratione dolor quasi sunt et non magni.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(20, 'ELT-081', 'officia in eos', 'Perspiciatis ipsam nihil sit eum dolores qui eius.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(21, 'ELT-740', 'dolorem in quidem', 'Incidunt voluptas velit blanditiis omnis amet.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(22, 'ELT-491', 'quia corrupti eum', 'Corporis eos harum odio ex quas.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(23, 'ELT-540', 'sequi placeat repellat', 'Quaerat voluptatem quibusdam aut deserunt voluptate.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(24, 'ELT-592', 'ullam nihil fugit', 'Ut sit vel et sunt laborum et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(25, 'ELT-216', 'voluptas eaque aut', 'Rem animi velit vitae tempore tempora.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(26, 'ELT-928', 'ut eveniet illo', 'Ea odio laborum recusandae qui voluptas eum.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(27, 'ELT-530', 'odit quam facere', 'Similique architecto ullam id accusantium magni officiis.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(28, 'ELT-555', 'quo rerum blanditiis', 'Soluta modi laborum ut.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(29, 'ELT-726', 'est voluptate velit', 'Nulla id quod rerum eveniet.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(30, 'ELT-832', 'id nam nostrum', 'Qui atque illo ipsam.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(31, 'ELT-873', 'quaerat inventore ut', 'Illo sapiente facere voluptatem consequatur totam.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(32, 'ELT-140', 'sed impedit cum', 'Et et voluptates et doloremque.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(33, 'ELT-236', 'ducimus deleniti debitis', 'Accusantium quod et consequuntur sed labore expedita distinctio.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(34, 'ELT-648', 'nemo repellat corrupti', 'Consequatur nobis omnis voluptatem optio maiores non mollitia.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(35, 'ELT-676', 'est cupiditate nisi', 'Impedit ab porro laboriosam quod facilis sint.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(36, 'ELT-453', 'voluptates fugit aut', 'Accusantium alias aut occaecati nihil.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(37, 'ELT-588', 'consequatur odit recusandae', 'Debitis quia nihil et ipsum assumenda iure quaerat sed.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(38, 'ELT-743', 'praesentium eos ipsa', 'Dolores dolorum tempora id.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(39, 'ELT-208', 'a dolore aut', 'Doloremque expedita et aut nam fugit perspiciatis aut.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(40, 'ELT-164', 'officia vero quia', 'Similique et earum porro est saepe consequatur enim.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(41, 'ELT-927', 'sequi et dolores', 'Autem doloremque eius incidunt necessitatibus delectus quo aut.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(42, 'ELT-794', 'soluta voluptates atque', 'Autem est rerum perferendis beatae ab et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(43, 'ELT-858', 'et aspernatur iusto', 'Voluptas dicta laboriosam eum nihil.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(44, 'ELT-761', 'ad temporibus error', 'Est aut sint exercitationem neque libero commodi eveniet.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(45, 'ELT-344', 'dolores unde soluta', 'Non corrupti id odit nobis tempora ea laborum.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(46, 'ELT-435', 'incidunt nam alias', 'Ut ab minima quo veritatis consectetur.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(47, 'ELT-190', 'voluptate atque voluptas', 'Molestiae facere voluptatem veritatis neque omnis nostrum modi.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(48, 'ELT-779', 'expedita nemo et', 'Vel et quod dignissimos maiores ex.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(49, 'ELT-335', 'placeat illum dolorem', 'Illo ab architecto consequatur quia maiores.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(50, 'ELT-838', 'qui sunt non', 'Expedita facilis quasi iste qui repellat cumque dolor.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(51, 'ELT-425', 'dolorem provident recusandae', 'Sed nesciunt ullam aut fugiat aperiam omnis rerum.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(52, 'ELT-351', 'impedit est voluptatum', 'Placeat impedit corrupti optio quis voluptatibus nobis.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(53, 'ELT-392', 'et consequuntur dolorem', 'Nesciunt et iusto iste voluptatem delectus consectetur sed aliquam.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(54, 'ELT-908', 'dolores qui iusto', 'Libero dolorum sunt et iste.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(55, 'ELT-579', 'est est eaque', 'Ipsam soluta voluptatem dicta dolorem minus.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(56, 'ELT-711', 'nulla aspernatur sed', 'Iusto praesentium quam aut et cumque consequatur consectetur aliquam.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(57, 'ELT-173', 'sint quis rerum', 'Sapiente labore quidem voluptatem aut delectus.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(58, 'ELT-377', 'qui cum itaque', 'Quis maxime quis nemo error exercitationem esse odit.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(59, 'ELT-380', 'quo saepe et', 'Iste voluptatum explicabo a porro quo.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(60, 'ELT-937', 'ducimus nihil expedita', 'Labore distinctio cum aliquid doloremque nihil sed.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(61, 'ELT-577', 'repellendus ea mollitia', 'Et eos error molestias voluptatem fugit.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(62, 'ELT-595', 'molestiae dignissimos odio', 'Totam consequuntur saepe illo.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(63, 'ELT-062', 'aut et totam', 'Saepe aut et qui itaque at.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(64, 'ELT-420', 'est expedita voluptatum', 'Eum numquam ut voluptatem cupiditate.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(65, 'ELT-829', 'eum voluptatem eum', 'Voluptas et in laboriosam ut atque.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(66, 'ELT-591', 'et fugit rerum', 'Error eum iste optio fuga aut.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(67, 'ELT-172', 'accusamus eligendi delectus', 'Qui quidem dolorem harum praesentium.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(68, 'ELT-784', 'placeat neque qui', 'Ullam dolores et recusandae et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(69, 'ELT-528', 'quas eos quas', 'Sit et consequatur qui dicta.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(70, 'ELT-144', 'commodi qui eos', 'Et dolor nihil veniam facilis sit sequi odit.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(71, 'ELT-586', 'aperiam blanditiis sequi', 'Commodi et laborum odit velit quia libero quia.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(72, 'ELT-035', 'inventore eos facere', 'Quaerat et commodi eum aut sed.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(73, 'ELT-703', 'odio natus quos', 'Omnis illo sint mollitia sit doloremque.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(74, 'ELT-248', 'reprehenderit excepturi sunt', 'Sapiente ipsum error inventore reprehenderit blanditiis et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(75, 'ELT-560', 'mollitia aliquam quae', 'Vel totam ratione nihil sit molestiae cum quod.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(76, 'ELT-702', 'tempore sit deserunt', 'Consequuntur similique molestias neque recusandae non.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(77, 'ELT-235', 'rerum repellat quod', 'Consequuntur et molestiae unde et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(78, 'ELT-674', 'sed fugit aliquid', 'Unde tenetur omnis quidem velit ullam quis asperiores.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(79, 'ELT-485', 'laborum iusto voluptatem', 'Ab quam porro ea id non aut.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(80, 'ELT-533', 'nihil laborum consequatur', 'Adipisci et eius qui illum.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(81, 'ELT-735', 'vel quia beatae', 'Odit neque eum consequatur voluptatem.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(82, 'ELT-892', 'quidem molestiae nihil', 'Sed non debitis ut porro ea velit qui.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(83, 'ELT-315', 'incidunt ut asperiores', 'Fugit aliquam odio qui ea aut est.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(84, 'ELT-562', 'neque sed inventore', 'Et animi reiciendis sint et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(85, 'ELT-782', 'voluptates fugiat a', 'Rem inventore eveniet inventore autem ratione voluptas et.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(86, 'ELT-020', 'quia nisi et', 'Incidunt eos reiciendis quos repudiandae.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(87, 'ELT-612', 'corrupti eaque voluptatum', 'Similique eos harum harum magnam vitae.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(88, 'ELT-268', 'rerum tempora ea', 'Voluptate officiis dolor inventore quam ab.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(89, 'ELT-789', 'dicta eum perspiciatis', 'Assumenda molestiae sequi reprehenderit vitae est alias.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(90, 'ELT-110', 'velit optio odit', 'Cumque distinctio soluta aut minima est quae excepturi non.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(91, 'ELT-250', 'molestias est et', 'Vero ut nihil officiis ut.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(92, 'ELT-638', 'accusantium id et', 'Nulla nobis ipsam ut quos repellendus nostrum.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(93, 'ELT-565', 'id qui impedit', 'Non sed quia suscipit.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(94, 'ELT-332', 'veniam omnis aut', 'Omnis provident voluptatem sint aut totam ducimus ut.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(95, 'ELT-113', 'doloremque veritatis ratione', 'Ea aperiam architecto sed a molestiae molestias vel.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(96, 'ELT-804', 'et eligendi nisi', 'Inventore velit est doloremque est quaerat qui.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(97, 'ELT-224', 'minus quidem eum', 'Voluptatem id et hic.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(98, 'ELT-752', 'quia id libero', 'Ut quae dolores magni non veritatis.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(99, 'ELT-058', 'et sit architecto', 'Voluptates cumque temporibus quia dolorum.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(100, 'ELT-504', 'asperiores a ab', 'Modi ut sed quod.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(101, 'ELT-007', 'ut ratione beatae', 'Sint vel et laborum quo omnis.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(102, 'ELT-181', 'ad sed impedit', 'Eum autem ut vero numquam quam aut ea.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(103, 'ELT-762', 'ea esse est', 'Ipsum recusandae consequatur placeat.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(104, 'ELT-022', 'quia blanditiis odit', 'Explicabo eaque recusandae tempora voluptatem tenetur omnis sed.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(105, 'ELT-792', 'cum molestiae molestiae', 'Ut dolorem dicta aliquid porro neque.', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '2025-09-25 00:04:52', '2025-09-25 00:04:52'),
(2, 'Staff PPIC', '2025-09-25 00:04:52', '2025-09-25 00:04:52'),
(3, 'Staff Produksi', '2025-09-25 00:04:52', '2025-09-25 00:04:52');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('92rpqwBeWyDHkm8l1cH4w636UIAePMQpKKFGTkEK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienlqcXRKemp4bEtxNnB0Rnp0RmZNQ05vdm83T1ZRZzVNY2E3TnJuVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1758786952);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `department_id` bigint UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `department_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Manager PPIC', 'managerppic@mail.com', NULL, '$2y$12$idzhEDCiP7DZYUVQ7J2roevns8ve2WeZtevpnQuZZqjhk2vCvSxam', 1, 1, NULL, '2025-09-25 00:04:53', '2025-09-25 00:04:53', NULL),
(2, 'Manager Produksi', 'managerproduksi@mail.com', NULL, '$2y$12$idzhEDCiP7DZYUVQ7J2roevns8ve2WeZtevpnQuZZqjhk2vCvSxam', 1, 2, NULL, '2025-09-25 00:04:53', '2025-09-25 00:04:53', NULL),
(3, 'Staff PPIC', 'staffppic@mail.com', NULL, '$2y$12$idzhEDCiP7DZYUVQ7J2roevns8ve2WeZtevpnQuZZqjhk2vCvSxam', 2, 1, NULL, '2025-09-25 00:04:53', '2025-09-25 00:04:53', NULL),
(4, 'Staff Produksi', 'staffproduksi@mail.com', NULL, '$2y$12$idzhEDCiP7DZYUVQ7J2roevns8ve2WeZtevpnQuZZqjhk2vCvSxam', 3, 2, NULL, '2025-09-25 00:04:53', '2025-09-25 00:04:53', NULL),
(5, 'Chad Bartoletti', 'magnus.boyer@example.com', '2025-09-25 00:04:55', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'ZABfZrZ7y6', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(6, 'Corine Upton', 'ahmad.murazik@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'Q29y9OhEV2', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(7, 'Pansy Ledner', 'uryan@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, '1TfCZAX8fB', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(8, 'Karlee Shanahan', 'jovany.koss@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'eiQmEIlpym', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(9, 'Neha Keebler I', 'eldridge.bergstrom@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'yIr6JWGNDB', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(10, 'Blake Kirlin', 'keagan.considine@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'xDIMnfa10s', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(11, 'Eugene Morissette', 'njaskolski@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'Vi4NocQpjP', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(12, 'Eddie Sipes', 'bins.jayne@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, '6hzWnSaciQ', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(13, 'Dandre Turcotte', 'giovanni34@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'MI3UuhhdBu', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(14, 'Moshe Bergnaum', 'xmuller@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'QYXyJnNexH', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(15, 'Christopher Kirlin', 'pollich.wanda@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'OwPlMzSMVZ', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(16, 'Ardella Bradtke', 'jaylen.becker@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'mfb9oZpesU', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(17, 'Gideon Padberg', 'travis.swift@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'j6oBbUPDqB', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(18, 'Alva Labadie', 'maria.beer@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'gJlDq0rDHW', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(19, 'Skylar Bailey', 'caitlyn.rogahn@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'hM6kEYspK2', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(20, 'Mrs. Lilly Koepp DDS', 'cstroman@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, '9N4CwEh2T3', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(21, 'Franco Russel', 'raquel20@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 2, 'xySNpyHMkj', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(22, 'Sister Barton', 'waters.edgar@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, '1MBvDFZTYT', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(23, 'Jailyn Davis IV', 'dannie11@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'iRxtywk5Gn', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(24, 'Darrion D\'Amore', 'bgleichner@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 2, '5R7rYVPH4k', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(25, 'Prof. Pierce Walter PhD', 'deon60@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'ceiaO8bJLO', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(26, 'Brendon Senger', 'carter.randall@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'WvNIKZER4Q', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(27, 'Marilyne Kovacek', 'nicola69@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'PI1XZPlbj7', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(28, 'Salvador Nader', 'chauncey.blanda@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'l72z8i38G1', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(29, 'Prof. Adah Hartmann', 'karolann35@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'aCK7zKTssH', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(30, 'Newell Lockman', 'heaven09@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, '1woPjaJChi', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(31, 'Myrl Hermiston I', 'klesch@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'Eh9qGlPzHs', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(32, 'Hilbert Rohan', 'raul.johns@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'EeYbdUXRir', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(33, 'Ena Tromp', 'pollich.carlotta@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 2, 'uzCJez8Nb2', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(34, 'Weston Considine', 'hoppe.gwendolyn@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, '95qImdRhRU', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(35, 'Andreane Marks', 'jbatz@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'MxhQ3YG83v', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(36, 'Keira Kreiger', 'edmond10@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'z5h79WXjkL', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(37, 'Stanford Effertz', 'dayne22@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'ka4Kg7iYao', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(38, 'Jedidiah Conn', 'lacey.ankunding@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'toErmjFvjc', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(39, 'Dr. Reid Smith IV', 'khuel@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'ErMLbd8Bzo', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(40, 'Virgie Fadel', 'leuschke.gladys@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'XcLx7xcAlA', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(41, 'Prof. Mazie Aufderhar IV', 'boehm.jewell@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'QfmonhSvfM', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(42, 'Janie Senger', 'harber.derick@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'DNanoRhGeg', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(43, 'Lazaro Bechtelar', 'wgreenfelder@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 2, 'Pq8QJP99nj', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(44, 'Cristal Kuvalis', 'aron57@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'E4gjrVvVrP', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(45, 'Bartholome Zulauf III', 'crunte@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'D1p1f7nUIS', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(46, 'Mark Stehr', 'cheyenne.waelchi@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'Lc7FzY08Pi', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(47, 'Ms. Vickie Walsh', 'chelsea04@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'TQVMp0Xjn4', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(48, 'Carmelo Kshlerin', 'okey.aufderhar@example.com', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'XpytQ5dFUA', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(49, 'Prof. Terrill Lindgren DDS', 'jfeeney@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 1, 'Mm5X620pvU', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(50, 'Maya Wiegand', 'oran01@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 2, 1, 'F0745LiB3r', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(51, 'Doyle Wintheiser', 'lmorissette@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'dA6GOuJ0yJ', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(52, 'Dr. Madison Schaefer Jr.', 'jchristiansen@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, '7p09J4gnUH', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(53, 'Mitchel Gerlach', 'mstracke@example.org', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 3, 2, 'EXDQClN4Gp', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL),
(54, 'Whitney Harris III', 'oleta.buckridge@example.net', '2025-09-25 00:04:56', '$2y$12$3xgZIgXKy//Ackp6o7.nbeO9hiR4PlVLhk7Fa2L5eIXqxB5k3ClWy', 1, 2, 'DWT1ISZkuh', '2025-09-25 00:04:56', '2025-09-25 00:04:56', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `production_logs`
--
ALTER TABLE `production_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_logs_production_order_id_foreign` (`production_order_id`),
  ADD KEY `production_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `production_orders`
--
ALTER TABLE `production_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `production_orders_order_code_unique` (`order_code`),
  ADD UNIQUE KEY `production_orders_production_plan_detail_id_unique` (`production_plan_detail_id`);

--
-- Indexes for table `production_plans`
--
ALTER TABLE `production_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `production_plans_plan_code_unique` (`plan_code`),
  ADD KEY `production_plans_created_by_foreign` (`created_by`),
  ADD KEY `production_plans_approved_by_foreign` (`approved_by`);

--
-- Indexes for table `production_plan_details`
--
ALTER TABLE `production_plan_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_plan_details_production_plan_id_foreign` (`production_plan_id`),
  ADD KEY `production_plan_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`),
  ADD KEY `users_department_id_foreign` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `production_logs`
--
ALTER TABLE `production_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `production_orders`
--
ALTER TABLE `production_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `production_plans`
--
ALTER TABLE `production_plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `production_plan_details`
--
ALTER TABLE `production_plan_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `production_logs`
--
ALTER TABLE `production_logs`
  ADD CONSTRAINT `production_logs_production_order_id_foreign` FOREIGN KEY (`production_order_id`) REFERENCES `production_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `production_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `production_orders`
--
ALTER TABLE `production_orders`
  ADD CONSTRAINT `production_orders_production_plan_detail_id_foreign` FOREIGN KEY (`production_plan_detail_id`) REFERENCES `production_plan_details` (`id`);

--
-- Constraints for table `production_plans`
--
ALTER TABLE `production_plans`
  ADD CONSTRAINT `production_plans_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `production_plans_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `production_plan_details`
--
ALTER TABLE `production_plan_details`
  ADD CONSTRAINT `production_plan_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `production_plan_details_production_plan_id_foreign` FOREIGN KEY (`production_plan_id`) REFERENCES `production_plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
