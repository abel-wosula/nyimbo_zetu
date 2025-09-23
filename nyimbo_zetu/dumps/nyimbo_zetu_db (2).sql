-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2025 at 07:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nyimbo_zetu_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'nobis', '2025-06-25 11:18:52', '2025-06-25 11:18:52'),
(2, 'ea', '2025-06-25 11:18:52', '2025-06-25 11:18:52'),
(3, 'qui', '2025-06-25 11:18:52', '2025-06-25 11:18:52');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_09_102304_update_users_table_add_new_columns', 1),
(6, '2025_06_23_105431_create_subcategory_table', 1),
(7, '2025_06_23_105516_create_category_table', 1),
(8, '2025_06_23_105537_create_songs_table', 1),
(9, '2025_06_27_095402_add_image_to_users_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 23, 'auth_token', '186837c1ab2df3b144e56ff4e4a48cf4c96b265e63c3a78fbfbffef2520c8fb9', '[\"*\"]', NULL, NULL, '2025-06-26 08:58:02', '2025-06-26 08:58:02'),
(2, 'App\\Models\\User', 23, 'auth_token', 'c07cf055fd6f5f5cf4701b99690b732b43d8e87a04dcccbfff72c4f0958da486', '[\"*\"]', NULL, NULL, '2025-06-26 09:00:47', '2025-06-26 09:00:47'),
(3, 'App\\Models\\User', 23, 'auth_token', 'fd9783661ff165614ae966e765155ce555f99ba88ad326c142830479ec36acb9', '[\"*\"]', NULL, NULL, '2025-06-26 09:01:56', '2025-06-26 09:01:56'),
(4, 'App\\Models\\User', 23, 'auth_token', '1fd3404fba28fe3724344cfa9446fa15f0382bed9dcfee80a9fd618bc04e9802', '[\"*\"]', NULL, NULL, '2025-06-26 09:03:01', '2025-06-26 09:03:01'),
(5, 'App\\Models\\User', 23, 'auth_token', '43f0b5a146b85ffee2969c141d3f0c321b58527b97e9a67f4fcba4401774f3a7', '[\"*\"]', NULL, NULL, '2025-06-26 09:35:15', '2025-06-26 09:35:15'),
(6, 'App\\Models\\User', 23, 'auth_token', '6c2996332b2a234b169530e7f90deced716f6dedfee89bbe1101e9f5c2e69e7a', '[\"*\"]', NULL, NULL, '2025-06-26 10:00:58', '2025-06-26 10:00:58'),
(7, 'App\\Models\\User', 23, 'auth_token', 'd38d9cdf2c93300da3dba4e623f565c38aafb114c8845bc73f414d2fdc67f29c', '[\"*\"]', NULL, NULL, '2025-06-26 10:20:18', '2025-06-26 10:20:18'),
(8, 'App\\Models\\User', 23, 'auth_token', 'e485a1a4b5d81a1bf2bc0f611b950cdc7323d833b68c5b2594701f487e422e0b', '[\"*\"]', NULL, NULL, '2025-06-27 04:26:05', '2025-06-27 04:26:05'),
(9, 'App\\Models\\User', 23, 'auth_token', '60e6d162b9a2ff52284ab9cebe58b69a3e51e043a44012678fb3cc99b0c041b2', '[\"*\"]', NULL, NULL, '2025-06-27 04:35:50', '2025-06-27 04:35:50'),
(10, 'App\\Models\\User', 23, 'auth_token', 'd4c197140c1e77322f2726c6d56f10b273882d592c0edf08fb28fe7b0d118c47', '[\"*\"]', NULL, NULL, '2025-06-27 04:38:50', '2025-06-27 04:38:50'),
(11, 'App\\Models\\User', 23, 'auth_token', '898c7a2464c98eaf26a929113083ab944691fe8ac38dc429dd00d5510490ba33', '[\"*\"]', NULL, NULL, '2025-06-27 04:50:10', '2025-06-27 04:50:10'),
(12, 'App\\Models\\User', 23, 'auth_token', '9c60c2776abf2beb815ac794b6891e40ffff11cfaaa60e7c66fc7030711b1793', '[\"*\"]', NULL, NULL, '2025-06-27 05:00:44', '2025-06-27 05:00:44'),
(13, 'App\\Models\\User', 23, 'auth_token', 'afd104e7c0aaf73a3e549c64f1534bf9e000dc4ba93b46f66f94d6b2029fada8', '[\"*\"]', NULL, NULL, '2025-06-27 05:05:01', '2025-06-27 05:05:01'),
(14, 'App\\Models\\User', 24, 'auth_token', '68cdcf15a1a83984ac8f267503bba2ef622472b41313dac517dd584edec21480', '[\"*\"]', NULL, NULL, '2025-06-27 05:12:30', '2025-06-27 05:12:30'),
(15, 'App\\Models\\User', 23, 'auth_token', '89c92d1cca9d2da9e08091d691cee77408266fa6b2a5a0e39de3defb51599193', '[\"*\"]', NULL, NULL, '2025-06-27 06:32:52', '2025-06-27 06:32:52'),
(16, 'App\\Models\\User', 35, 'auth_token', '550d8d8c29d12c78f58bf4a68eeae6a5c30f5f9f0a7f95f0ae2207955e5a3ba5', '[\"*\"]', NULL, NULL, '2025-06-27 07:48:29', '2025-06-27 07:48:29'),
(17, 'App\\Models\\User', 35, 'auth_token', 'c59dcbc21e367f6b76c1867e593933325acf5ed0d5b8c1b0dc4cabe9d89c0f55', '[\"*\"]', NULL, NULL, '2025-06-27 10:56:36', '2025-06-27 10:56:36'),
(18, 'App\\Models\\User', 35, 'auth_token', '776e4073c6dce5833f74307e15341fa3ab9a4bdf197cf246baa16e16b7e07ce8', '[\"*\"]', NULL, NULL, '2025-06-28 05:52:24', '2025-06-28 05:52:24'),
(19, 'App\\Models\\User', 35, 'auth_token', '11280e6c4ddfef8eb141e9f5cf1115ff994ead3a46a580c9fb0bdbeb3ec1258c', '[\"*\"]', NULL, NULL, '2025-06-29 09:17:20', '2025-06-29 09:17:20'),
(20, 'App\\Models\\User', 35, 'auth_token', '6bea99bbf3ff562647b93dba89d678541a5e644767527478bc70a188038ad97b', '[\"*\"]', NULL, NULL, '2025-06-29 09:27:05', '2025-06-29 09:27:05'),
(21, 'App\\Models\\User', 35, 'auth_token', '63245eafaef44437b300ef46c4fc875cac4eda9174e6f6a6fb1fe6de540c269e', '[\"*\"]', NULL, NULL, '2025-06-29 09:31:50', '2025-06-29 09:31:50'),
(22, 'App\\Models\\User', 35, 'auth_token', '71ccb1d04210594c4007bcbf60c041efe90045d5e9f8fbe78ad19473f7bb62f5', '[\"*\"]', NULL, NULL, '2025-06-29 09:43:19', '2025-06-29 09:43:19'),
(23, 'App\\Models\\User', 35, 'auth_token', 'aff4ceaf21236a6766d536f75641b90b516d8cbf11e4480ae0c1018cccf72dca', '[\"*\"]', NULL, NULL, '2025-06-29 09:48:33', '2025-06-29 09:48:33'),
(24, 'App\\Models\\User', 35, 'auth_token', 'a6073ed3e7b34ff0dcc4d314b0634627307ed05af4f15da2be7d0a98429e898f', '[\"*\"]', NULL, NULL, '2025-06-29 12:59:48', '2025-06-29 12:59:48'),
(25, 'App\\Models\\User', 35, 'auth_token', '0d81e1aaf34c361c5898ca689b1c32ff0afcffbf095d9625d46a0cf160929151', '[\"*\"]', NULL, NULL, '2025-06-29 16:05:52', '2025-06-29 16:05:52'),
(26, 'App\\Models\\User', 35, 'auth_token', '88d696fce17dfaf7552e1a2d1ad4afce7ce52c7b3727cce524ba1ee59889c2d3', '[\"*\"]', NULL, NULL, '2025-06-29 16:14:13', '2025-06-29 16:14:13'),
(27, 'App\\Models\\User', 35, 'auth_token', '757eac3f2403d998153ac698afed84f49fb97b4856d2c7a0c91a9c520594bf93', '[\"*\"]', NULL, NULL, '2025-06-29 16:29:20', '2025-06-29 16:29:20'),
(28, 'App\\Models\\User', 35, 'auth_token', '2cfa80aeda22e3a09906b4fc947f7c8641a3473b35f9372a63bd7f29f1af20f3', '[\"*\"]', NULL, NULL, '2025-06-30 04:35:50', '2025-06-30 04:35:50'),
(29, 'App\\Models\\User', 35, 'auth_token', '291bdef0fefaaba051f6c56f5327dfd89bfec367ce2758f417d80bb692bc37a4', '[\"*\"]', NULL, NULL, '2025-06-30 04:36:10', '2025-06-30 04:36:10'),
(30, 'App\\Models\\User', 35, 'auth_token', 'aa1bf36a98134bcbe96510b956c6242af80d8b35efb8f6cdacc234a9d9e4d068', '[\"*\"]', NULL, NULL, '2025-06-30 04:43:01', '2025-06-30 04:43:01'),
(31, 'App\\Models\\User', 35, 'auth_token', 'b9fb52734d45b64ee0ade78d85d484201347a6a51ae0adbeb9d9d82dca51599d', '[\"*\"]', NULL, NULL, '2025-06-30 04:45:03', '2025-06-30 04:45:03'),
(32, 'App\\Models\\User', 35, 'auth_token', 'e1267c705b0c6b404e5e581d84e557893b98a9c6b9688fe229a2e272948b911f', '[\"*\"]', NULL, NULL, '2025-06-30 04:47:56', '2025-06-30 04:47:56'),
(33, 'App\\Models\\User', 35, 'auth_token', '499575276e6db57b7624b63b37067700787517016a13a583fe4a0543052365ef', '[\"*\"]', NULL, NULL, '2025-06-30 04:49:01', '2025-06-30 04:49:01'),
(34, 'App\\Models\\User', 35, 'auth_token', '7531b7330d3d80ac6e1008fdf45ceda50712d87552137408c17a8ef99dcad450', '[\"*\"]', NULL, NULL, '2025-06-30 06:06:20', '2025-06-30 06:06:20'),
(35, 'App\\Models\\User', 35, 'auth_token', '1f60bb5926e1a589b6de0a6a00b3eb7bab3580fa9e8dd838048bb227ca497244', '[\"*\"]', NULL, NULL, '2025-07-01 11:25:12', '2025-07-01 11:25:12'),
(36, 'App\\Models\\User', 35, 'auth_token', 'a929e9651594b4e8aa3e58a5836ca7575d97de73701b4651216a7bef7eac321a', '[\"*\"]', NULL, NULL, '2025-07-01 11:36:53', '2025-07-01 11:36:53'),
(37, 'App\\Models\\User', 35, 'auth_token', 'cd5b2bfcebdb2498404f05b11917d5e8f6979eb98bb82fbd21eca48f08aa989f', '[\"*\"]', NULL, NULL, '2025-07-02 04:52:15', '2025-07-02 04:52:15'),
(38, 'App\\Models\\User', 35, 'auth_token', 'd853599c82befb243d252215535746e1d0e03ea01fefb1a553bd13be17334ce0', '[\"*\"]', NULL, NULL, '2025-07-02 05:24:46', '2025-07-02 05:24:46'),
(39, 'App\\Models\\User', 35, 'auth_token', 'c2e6a46e68fbe8e50dcd54aabf2cc85cf29b47f05c391cc1438db0c7014a330c', '[\"*\"]', NULL, NULL, '2025-07-02 06:38:40', '2025-07-02 06:38:40'),
(40, 'App\\Models\\User', 35, 'auth_token', 'cf576200ba7fe5d79927c9bfee9cd5a79f572d835b7e912e845c74c18d11835b', '[\"*\"]', NULL, NULL, '2025-07-02 06:46:36', '2025-07-02 06:46:36'),
(41, 'App\\Models\\User', 35, 'auth_token', '51aeeae28d8149625c32e8cf4e70f322800236821c641fa78248a32ff4cd3821', '[\"*\"]', NULL, NULL, '2025-07-08 07:47:01', '2025-07-08 07:47:01'),
(42, 'App\\Models\\User', 35, 'auth_token', '2732847f37da0a12f130da080e474201377cf754ff032edc9ce25d38f67cbc3f', '[\"*\"]', NULL, NULL, '2025-08-12 11:03:11', '2025-08-12 11:03:11');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `artists` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `lyrics` text NOT NULL,
  `composer` varchar(255) DEFAULT NULL,
  `midi` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) NOT NULL,
  `ytlink` varchar(255) DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `artists`, `title`, `lyrics`, `composer`, `midi`, `pdf`, `ytlink`, `subcategory_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Idell Quitzon II', 'Accusantium molestias aut tenetur.', 'Ut quasi maiores laboriosam esse. Placeat et delectus veritatis aut corporis.', 'Kaylie Lind', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.wyman.biz/voluptate-et-non-omnis-a-qui', 4, 7, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(2, 'Antonia Bartell', 'Mollitia nulla accusantium officiis a.', 'Expedita sunt in et aut ex autem nihil. Molestiae ullam expedita laborum consequuntur enim consequatur. Et aut dicta ratione voluptatibus. Est qui doloribus est qui.', 'Carolanne Leuschke II', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.hane.org/libero-soluta-maxime-vel-et', 4, 5, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(3, 'Scarlett Koch', 'Atque sint provident.', 'Accusantium numquam et reprehenderit provident accusamus ut harum. Enim vel est neque voluptatem itaque. Neque neque repellendus autem blanditiis.', 'Brook Jerde DVM', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'https://www.mills.net/id-nihil-et-praesentium-laudantium-delectus', 5, 10, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(4, 'Reginald Rippin', 'Quidem dolores.', 'Quasi incidunt nostrum autem in praesentium et. Consequatur perferendis perferendis odit ad est suscipit. Aperiam qui alias quia repellendus. Et voluptas dolor velit vitae saepe eum.', 'Mr. Wilton Grimes DVM', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'https://www.stanton.org/quisquam-dolorum-aut-illum-ab-ipsa-ut-maxime', 2, 14, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(5, 'Lucious Hermann', 'Quae repudiandae quia et.', 'Temporibus molestiae qui aut quisquam. Corrupti qui repellat harum eum architecto neque. Vero non voluptas et dolorum soluta.', 'Michale Beer', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'https://www.sawayn.com/debitis-suscipit-incidunt-ut-et-quia-libero', 1, 11, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(6, 'Mr. Jamel Boehm MD', 'Numquam id quia.', 'Inventore quia ipsam iste fuga blanditiis est. Ratione quod et eos suscipit suscipit voluptatem. Alias ut mollitia sed inventore nesciunt. Explicabo porro corrupti ipsa qui eaque voluptatem perspiciatis.', 'Sherwood Walker', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.cassin.net/', 3, 15, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(7, 'Flo Reynolds III', 'Odit et qui.', 'Est eum harum tempora ut. Est beatae ut accusantium omnis sapiente consequatur. Aut ipsum sed quia.', 'Mr. Terrance Wuckert DVM', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.hessel.com/quam-quam-dolorem-non-ipsum-ex-corrupti-quia.html', 3, 15, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(8, 'Jerald Thompson', 'Itaque voluptas qui.', 'Quo iure enim blanditiis quod blanditiis. Natus commodi illo et voluptates consequatur voluptas. Impedit non autem illum voluptatum possimus. A asperiores nostrum voluptas. Voluptatem qui ullam et inventore deleniti totam.', 'Dr. Isidro Braun V', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://beier.biz/repellendus-laudantium-doloribus-amet-consequuntur-est-in-error', 1, 7, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(9, 'Dr. Matt Hudson', 'Id ut et.', 'Et aliquam repellat voluptates nostrum vel esse. Dolores beatae dolorum praesentium ut. Eum sed rerum tempore doloribus.', 'Mr. Jordon Vandervort III', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.gorczany.org/', 5, 2, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(10, 'Ms. Hallie Pfannerstill', 'Qui quod.', 'Saepe laborum vel et sunt ipsum. Voluptas est dolorem quasi sit ut. Sit officia nihil est voluptatem voluptatem omnis. Rem nihil dolor voluptatum necessitatibus.', 'Chester Swift III', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.schamberger.com/', 5, 6, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(11, 'Rebekah Rath', 'Aut eum quisquam nihil.', 'Quos eius in quas iure ratione. Et officiis excepturi tempore error et labore odit ut. Debitis et iure vel ipsa aut ab nesciunt. Architecto non mollitia numquam incidunt beatae molestiae nulla.', 'Brook Konopelski', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://crist.biz/', 5, 1, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(12, 'Mr. Kendall Corkery', 'Ex eum iure molestiae.', 'Qui doloribus hic corporis asperiores quos. Qui ut qui id dolorum. Tenetur dolor ex sit debitis suscipit officiis.', 'Tomasa Ryan DVM', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.lemke.com/sequi-dicta-earum-sint-ut-numquam-beatae-aut-vitae', 1, 11, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(13, 'Elza Hudson', 'Exercitationem quae sit.', 'Recusandae et eligendi maiores. At enim aspernatur voluptatem. Excepturi ratione et voluptas sint dolorem illum. Praesentium ut exercitationem sunt aut et harum.', 'Kenton Bins', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.vonrueden.com/', 2, 13, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(14, 'Mrs. Audrey Koss', 'Nulla consequatur reiciendis voluptates.', 'Voluptas hic exercitationem itaque. A non harum assumenda quia quod ut. Quo inventore reiciendis repellat quam vel quis. Perferendis ex ullam est ex est quisquam.', 'Tristin Runte DDS', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://www.moore.com/in-sit-in-quia-quibusdam-nemo-quisquam-repudiandae', 5, 3, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(15, 'Prof. Eduardo Ziemann Jr.', 'Aut distinctio.', 'Quia tempora molestiae dolor culpa. Voluptates aut ipsum adipisci sapiente impedit ducimus. Necessitatibus et consectetur cumque itaque voluptatibus quibusdam.', 'Rigoberto Shanahan', 'uploads/midis/dummy.mid', 'uploads/pdfs/dummy.pdf', 'http://roob.biz/enim-ipsa-id-accusamus-facilis.html', 2, 4, '2025-06-25 11:21:18', '2025-06-25 11:21:18'),
(16, 'Ann Muema', 'Test Song 2', 'Some lyrics here and there', 'Johny Dove', '/storage/uploads/midi/mahujaji-wa-matumaini-1751032251.mp3', '/storage/uploads/pdf/hawa-ndio-wale-ambao-walipoishi-na-mtemele-1751032251.pdf', 'https://youtube.com/example', 1, 35, '2025-06-27 10:50:52', '2025-06-27 10:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Josiane Fritsch', 2, '2025-06-25 11:19:01', '2025-06-25 11:19:01'),
(2, 'Ryley Dickens II', 3, '2025-06-25 11:19:01', '2025-06-25 11:19:01'),
(3, 'Zachery Ondricka III', 2, '2025-06-25 11:19:01', '2025-06-25 11:19:01'),
(4, 'Adrien Kerluke Jr.', 3, '2025-06-25 11:19:01', '2025-06-25 11:19:01'),
(5, 'Mr. Evert Reilly MD', 3, '2025-06-25 11:19:01', '2025-06-25 11:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `image`, `first_name`, `last_name`, `phone_number`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'pfannerstill.carley@example.com', NULL, 'Miss Dahlia Jones', 'Paucek', '1-272-984-1980', '518 Harrison Streets Suite 957\nMurazikport, NH 28924-1493', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZAEWXAho6v', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(2, 'christ58@example.org', NULL, 'Mr. Roosevelt Lebsack IV', 'Leuschke', '+18627571736', '77275 Dax View\nHirthehaven, IL 93385', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qkujmeCcyY', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(3, 'joannie.mcdermott@example.org', NULL, 'Luella Schiller', 'O\'Connell', '+14145661442', '1645 Wuckert Crescent Suite 395\nWest Bettie, GA 70866-2496', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3W6RaGHDBb', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(4, 'jolie.jacobs@example.org', NULL, 'Michele Feeney', 'Macejkovic', '1-682-996-7647', '33761 Hanna Forges Suite 271\nNew Miracle, RI 11198', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ym61iJ33XH', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(5, 'zemlak.mariah@example.com', NULL, 'Mr. Jeffrey Cole', 'Mohr', '1-956-984-9536', '771 Jacobi Highway Suite 177\nPort Elisabeth, ND 64682', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sqw5NbPPrr', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(6, 'rnader@example.com', NULL, 'Dr. Katrine Hudson Jr.', 'Kuhn', '385-440-5637', '3655 Amira Street Apt. 279\nReganville, IN 17690', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'DmzVsKaMme', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(7, 'sydnie69@example.com', NULL, 'Cydney Kreiger', 'Lemke', '(985) 299-5861', '46157 Will Fork\nEast Bessie, SC 27996', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'SdM59TBJAm', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(8, 'cmohr@example.com', NULL, 'Daniella Herzog', 'Buckridge', '+15319284608', '42233 Royal Park Suite 902\nPort Percy, AK 64177', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'V1KKnzMOOR', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(9, 'everette.ondricka@example.com', NULL, 'Dr. Misty Cassin II', 'Gerhold', '+1 (970) 606-1407', '35558 Theresa Ranch Apt. 866\nEast Arnoldoton, AZ 10817', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3sSCbWGX1F', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(10, 'rosenbaum.rosario@example.org', NULL, 'Ms. Lenore Boyle DDS', 'Beatty', '360.400.3368', '581 Kari Well Suite 507\nGutmannmouth, VT 24830-6030', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'muUl8khNrT', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(11, 'emie15@example.com', NULL, 'Palma Ebert', 'Lind', '+1-915-404-4898', '27369 Myrtie Crest Apt. 038\nJohnstonland, SC 34264-2110', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8A18ayx3m6', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(12, 'cschmidt@example.org', NULL, 'Dr. Amir Schroeder', 'Hammes', '239-963-9356', '899 Lou Mountain\nZemlakbury, IA 71943-5126', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Hu3svgIKlq', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(13, 'danika.dubuque@example.net', NULL, 'Hannah Wilderman', 'Kiehn', '+15394412805', '64393 Marcella Pines\nNorth Roberto, FL 83719', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'anh0PYUY1G', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(14, 'autumn.luettgen@example.net', NULL, 'Kaya Ondricka', 'Kris', '970.585.1773', '36615 Valentina Gateway\nPort Kendrick, MD 27994-5734', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '432kGtQFrH', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(15, 'rasheed.carroll@example.net', NULL, 'Jamaal Mante', 'Hills', '+16693511844', '21676 Williamson Route\nSchulistfurt, DE 18904-8692', '2025-06-25 11:21:08', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'sJFtrVkncm', '2025-06-25 11:21:08', '2025-06-25 11:21:08'),
(16, 'john.doe@example.com', NULL, 'John', 'Doe', '0700123456', 'Nairobi, Kenya', NULL, '$2y$10$OaeORNR3.LsWiMWsMRHJVO4WfE1kjnGWwfKHm6XQi6x9PKN4bxr32', NULL, '2025-06-26 08:10:38', '2025-06-26 08:10:38'),
(25, 'brandon.kihn@example.net', NULL, 'Merle Cummerata', 'Marks', '+15415579718', '9996 Cara Plaza\nLake Chetstad, AR 32864', '2025-06-27 07:08:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EE2CX2d8Mf', '2025-06-27 07:08:51', '2025-06-27 07:08:51'),
(35, 'wafulaabel610@gmail.com', NULL, 'ABEL', 'Wosula', '0799442231', 'Nairobi', NULL, '$2y$10$0tVnRmszYG9BS21JJQdQXu2VuOUgB2Ok4iaJqo.wEHCfNhDh2e48m', NULL, '2025-06-27 07:47:21', '2025-06-27 07:47:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `songs_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `songs_user_id_foreign` (`user_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategory_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `songs_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `songs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
