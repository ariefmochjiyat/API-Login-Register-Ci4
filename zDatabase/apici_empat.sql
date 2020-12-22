-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Des 2020 pada 04.22
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apici_empat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `client`
--

CREATE TABLE `client` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `retainer_fee` int(100) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `client`
--

INSERT INTO `client` (`id`, `username`, `email`, `retainer_fee`, `updated_at`, `created_at`) VALUES
(1, 'Dr. Sonny Auer', 'kuhlman.elisabeth@hotmail.com', 25403085, NULL, '2020-12-20 17:27:55'),
(2, 'Prof. Nels Ankunding Jr.', 'jlindgren@hotmail.com', 27795284, NULL, '2020-12-20 17:27:55'),
(3, 'Dr. Elliot Oberbrunner', 'maybell48@yahoo.com', 3523016, NULL, '2020-12-20 17:27:55'),
(4, 'Prof. Geovanni Mraz', 'karina01@casper.org', 42056906, NULL, '2020-12-20 17:27:55'),
(5, 'Bernie Heller', 'nasir31@larson.com', 91938685, NULL, '2020-12-20 17:27:55'),
(6, 'Celestine Sauer', 'clementine.ratke@eichmann.biz', 44623224, NULL, '2020-12-20 17:27:55'),
(7, 'Rashad Lesch III', 'iokeefe@fadel.biz', 79435407, NULL, '2020-12-20 17:27:56'),
(8, 'Andreane Wiegand', 'elsie.rice@yahoo.com', 71959642, NULL, '2020-12-20 17:27:56'),
(9, 'Dr. Carolina Koelpin', 'hbogisich@schuster.com', 94194570, NULL, '2020-12-20 17:27:56'),
(10, 'Christophe Schoen', 'rachelle91@hotmail.com', 46705126, NULL, '2020-12-20 17:27:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2020-12-20-091440', 'App\\Database\\Migrations\\Pengguna', 'default', 'App', 1608456039, 1),
(2, '2020-12-20-102407', 'App\\Database\\Migrations\\Client', 'default', 'App', 1608459951, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `username`, `email`, `password`, `updated_at`, `created_at`) VALUES
(1, 'Abdul Rojak', 'abdulrojak@gmail.com', '$2y$10$ppEGD97Npvt9W2bWIQL7cuZqylP1xvTe2iM3GsTZbDmeI8rmslfeu', NULL, '2020-12-20 19:30:05'),
(2, 'Nela Karisma', 'nelakarisma@gmail.com', '$2y$10$Nf6nR4Z.pA3T5KcsO1jKdOgy8x7Au9x3UHTjdsTnqJ/76CbEj6cn.', NULL, '2020-12-22 10:20:06');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `retainer_fee` (`retainer_fee`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password` (`password`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `client`
--
ALTER TABLE `client`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
