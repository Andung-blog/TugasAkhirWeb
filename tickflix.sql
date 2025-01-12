-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 12, 2025 at 11:04 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tickflix`
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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
(2, 'Dimas', 'dimas@gmail.com', 'Great Movies', '2025-01-11 22:44:43', '2025-01-11 22:44:43');

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_01_10_123128_create_movies_table', 2),
(5, '2025_01_10_125349_add_role_to_users_table', 3),
(7, '2025_01_10_134828_create_users_table', 4),
(8, '2025_01_11_161911_add_details_to_movies_table', 5),
(9, '2025_01_12_040127_create_people_table', 6),
(10, '2025_01_12_042558_create_people_table', 7),
(11, '2025_01_12_051927_create_messages_table', 8),
(12, '2025_01_12_093401_create_tickets_table', 9),
(13, '2025_01_12_094623_create_tickets_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` decimal(3,1) DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `date`, `image`, `created_at`, `updated_at`, `genre`, `director`, `rating`, `video_url`) VALUES
(1, 'American Primeval', '2025-01-10', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/ff0s9OHGNSZL6cVteIb7LNvTnJD.jpg', '2025-01-10 14:30:23', '2025-01-11 21:58:53', 'Action', 'Screenplay', '7.8', 'https://youtu.be/gMmF9uWqzK8'),
(2, 'Dr. Stone', '2025-01-11', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/xbZQ3fDl0y5mt0ARwfeyrgQ4JTw.jpg', '2025-01-11 14:38:30', '2025-01-11 14:38:30', 'Action, Adventure, Animation', 'Tokyo MX', '8.5', 'https://youtu.be/ZCkPftkghvg?si=47LZmp-9mpjAUhTt'),
(3, 'Solo Leveling', '2025-01-12', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/geCRueV3ElhRTr0xtJuEWJt6dJ1.jpg', '2025-01-11 22:00:17', '2025-01-11 22:00:17', 'Action,Fantasy, Animation', 'BS 11', '9.0', 'https://youtu.be/HkIKAnwLZCw'),
(4, 'Squid Game', '2025-01-12', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/1QdXdRYfktUSONkl1oD5gc6Be0s.jpg', '2025-01-11 22:03:17', '2025-01-11 22:03:17', 'Action, Drama, Mystery', 'Hwang Dong-hyuk', '8.6', 'https://youtu.be/oqxAJKy0ii4'),
(5, 'Wicked', '2025-01-10', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/xDGbZ0JJ3mYaGKy4Nzd9Kph6M9L.jpg', '2025-01-11 22:04:27', '2025-01-11 22:04:27', 'Drama, Romance, Fantasy', 'Jon M. Chu', '7.1', 'https://youtu.be/pqi45Qhq3CI'),
(6, 'Goosebumps', '2025-01-09', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/pMrMPlEJAGAKBUWJzeacIwjRU2C.jpg', '2025-01-11 22:05:33', '2025-01-11 22:05:33', 'Action, Sci-Fi, Comedy', 'Nicholas Stoller', '7.0', 'https://youtu.be/-NsYcYtDBtc'),
(7, 'Flow', '2025-01-07', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/imKSymKBK7o73sajciEmndJoVkR.jpg', '2025-01-11 22:06:52', '2025-01-11 22:06:52', 'Animation, Fantasy, Adventure', 'Gints Zilbalodis', '8.4', 'https://youtu.be/ZgZccxuj2RY'),
(8, 'Silo', '2025-01-02', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/tlliQuCupf8fpTH7RAor3aKMGy.jpg', '2025-01-11 22:48:44', '2025-01-11 22:48:44', 'Sci-Fi, Drama, Fantasy', 'Graham Yost', '6.5', 'https://youtu.be/8ZYhuvIv1pA'),
(9, 'Nosferatu', '2025-01-04', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/5qGIxdEO841C0tdY8vOdLoRVrr0.jpg', '2025-01-11 22:49:47', '2025-01-11 22:49:47', 'Drama, Fantasy, Horror', 'Robert Eggers', '6.8', 'https://youtu.be/nulvWqYUM8k'),
(10, 'Gladiator II', '2025-01-08', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/2cxhvwyEwRlysAmRH4iodkvo0z5.jpg', '2025-01-11 22:51:08', '2025-01-11 22:51:08', 'Action, Adventure, Drama', 'Ridley Scott', '6.7', 'https://youtu.be/TQwSz88ITAE'),
(11, 'Sonic the Hedgehog 3', '2025-01-11', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/d8Ryb8AunYAuycVKDp5HpdWPKgC.jpg', '2025-01-11 22:52:36', '2025-01-11 22:52:36', 'Action, Comedy, Family', 'Jeff Fowler', '8.2', 'https://youtu.be/LH1J1EbqCaI'),
(12, 'Mufasa: The Lion King', '2025-01-06', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/jbOSUAWMGzGL1L4EaUF8K6zYFo7.jpg', '2025-01-11 22:53:46', '2025-01-11 22:53:46', 'Adventure, Animation, Family', 'Barry Jenkins', '7.4', 'https://youtu.be/lMXh6vjiZrI');

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
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `known_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `role`, `known_for`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Jason Statham', 'Actor', 'The Meg', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/whNwkEQYWLFJA8ij0WyOOAD5xhQ.jpg', '2025-01-11 21:27:04', '2025-01-11 21:27:20'),
(2, 'Cecilia Cheung', 'Actor', 'Saolin Soccer', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/xghVxRPUmFCHYxzD0NxMO8NtoKK.jpg', '2025-01-11 23:09:18', '2025-01-11 23:09:18'),
(3, 'Tom Cruise', 'Actor', 'Mission: Impossible', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/eOh4ubpOm2Igdg0QH2ghj0mFtC.jpg', '2025-01-11 23:10:00', '2025-01-11 23:10:00'),
(4, 'Molly Brown', 'Actor', 'Billions', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/qB9WaA6ekkULwwiiNxcXUsdDi9q.jpg', '2025-01-11 23:10:47', '2025-01-11 23:10:47'),
(5, 'Yang Mi', 'Actor', 'L.O.R.D: Legend of Ravaging Dynasties', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/6RezRxlQBsYmlotybR3q7riSrvV.jpg', '2025-01-11 23:11:44', '2025-01-11 23:11:44'),
(6, 'Mel Gibson', 'Actor', 'Signs', 'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/jnqHMaOslt8cef2atSmOpGRvNla.jpg', '2025-01-11 23:12:11', '2025-01-11 23:12:11');

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
('HhQ1pYZ2ECZkn4scdVNwWwXpB4EFQbqD71KnBk94', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2lsc2k1Vzl5R21Xd0hadmxxcGxBVnQ5TDlVbHVNdkozNTZEN3JUVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbW92aWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1736679387);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `movie_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `movie_id`, `user_name`, `seat`, `price`, `created_at`, `updated_at`) VALUES
(6, '1', 'Dimas', '4E', '10.00', '2025-01-12 03:43:53', '2025-01-12 03:43:53');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Admin', 'admin@gmail.com', NULL, '$2y$12$cw1bcGnSrg1quZV9bLCON.uj4k0DVQXxNXGdVIks6EcGVu8H54YLi', NULL, '2025-01-10 07:24:36', '2025-01-10 07:24:36');

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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

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
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
