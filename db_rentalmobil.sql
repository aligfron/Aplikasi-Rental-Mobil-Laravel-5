-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for db_rentalmobil
CREATE DATABASE IF NOT EXISTS `db_rentalmobil` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db_rentalmobil`;


-- Dumping structure for table db_rentalmobil.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `car_id` int(11) unsigned NOT NULL,
  `booking_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_date` date NOT NULL,
  `duration` int(11) NOT NULL,
  `return_date_supposed` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `fine` int(20) DEFAULT NULL,
  `total_price` int(25) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_code` (`booking_code`),
  KEY `bookings_client_id_foreign` (`client_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `bookings_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`),
  CONSTRAINT `bookings_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.bookings: ~0 rows (approximately)
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`id`, `client_id`, `car_id`, `booking_code`, `order_date`, `duration`, `return_date_supposed`, `return_date`, `fine`, `total_price`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'M-124687357', '2019-06-21', 2, '2019-06-23', '2019-06-24', 600000, 1100000, '2019-06-23 17:42:49', '2019-06-23 17:43:38'),
	(2, 2, 1, 'M-554024530', '2024-04-15', 2, '2024-04-17', '2024-04-15', NULL, -4000000, '2024-04-14 22:32:53', '2024-04-14 22:33:16');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;


-- Dumping structure for table db_rentalmobil.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.brands: ~5 rows (approximately)
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`id`, `brand_name`, `created_at`, `updated_at`) VALUES
	(1, 'Lamborghini', '2019-06-23 16:39:31', '2019-06-23 16:39:31'),
	(2, 'Mitsubishi', '2019-06-23 16:39:46', '2019-06-23 16:39:46'),
	(3, 'Toyota', '2019-06-23 16:39:54', '2019-06-23 16:39:54'),
	(4, 'Honda', '2019-06-23 16:40:11', '2019-06-23 16:40:11'),
	(5, 'Ferarri', '2019-06-23 16:40:48', '2019-06-23 16:40:48');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;


-- Dumping structure for table db_rentalmobil.cars
CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(10) unsigned NOT NULL,
  `car_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `plat_number` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `type` enum('manual','matic') COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cars_brand_id_foreign` (`brand_id`),
  CONSTRAINT `cars_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.cars: ~3 rows (approximately)
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` (`id`, `brand_id`, `car_name`, `plat_number`, `price`, `type`, `photo`, `available`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Galardo', 'D 1000 AD', 500000, 'manual', '2.png', 1, '2019-06-23 16:41:24', '2024-04-14 22:33:16'),
	(2, 3, 'Avanza', 'D 1002 AS', 200000, 'matic', '1.png', 1, '2019-06-23 16:42:11', '2019-06-23 16:42:12'),
	(3, 2, 'Kol buntung', 'D 1000 AU', 120000, 'manual', '7.png', 1, '2019-06-23 16:42:46', '2019-06-23 16:42:47');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;


-- Dumping structure for table db_rentalmobil.clients
CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nik` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('pria','wanita') COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.clients: ~3 rows (approximately)
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` (`id`, `nik`, `name`, `gender`, `date_of_birth`, `phone`, `address`, `slug`, `created_at`, `updated_at`) VALUES
	(1, '211111', 'Rizal Setia Purnama', 'pria', '2018-12-30', '089124991', 'kp', 'rizal-setia-purnama', '2019-06-23 17:26:56', '2019-06-23 17:26:56'),
	(2, '211111', 'Rizal Setia Purnama', 'pria', '2018-12-30', '089124991', 'kp', 'rizal-setia-purnama', '2019-06-23 17:26:56', '2019-06-23 17:26:56'),
	(3, '211234', 'angga', 'pria', '2018-12-30', '08124991', 'kp', 'angga', '2019-06-23 17:26:56', '2019-06-23 17:26:56');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;


-- Dumping structure for table db_rentalmobil.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.migrations: ~0 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table db_rentalmobil.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Dumping structure for table db_rentalmobil.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_code` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` int(11) NOT NULL,
  `type` enum('dp','repayment') COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_transaction_id_foreign` (`booking_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.payments: ~2 rows (approximately)
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `booking_code`, `client_id`, `type`, `amount`, `created_at`, `updated_at`) VALUES
	(1, 'M-124687357', 1, 'dp', 500000, '2019-06-23 17:42:49', '2019-06-23 17:42:49'),
	(2, 'M-124687357', 1, 'repayment', 1100000, '2019-06-23 17:43:38', '2019-06-23 17:43:38'),
	(3, 'M-554024530', 2, 'repayment', 5000000, '2024-04-14 22:32:53', '2024-04-14 22:32:53');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;


-- Dumping structure for table db_rentalmobil.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_rentalmobil.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Ass Drop', 'ass@example.com', NULL, '$2y$10$NpUBP4cKzLFlemRGO9KJzO9MpRrut3RAi7T/XNdK8DI4pjpCrEQNO', NULL, '2019-06-23 16:29:20', '2019-06-23 16:29:20'),
	(2, 'ALI GUFRON', 'ali.gfron@gmail.com', NULL, '$2y$10$iWKmbOfE6cU20Yf2Sb7tqOYdD5eigb2JBT/dlvTknzOa85Q4/nBpK', NULL, '2024-04-14 22:00:14', '2024-04-14 22:00:14'),
	(3, 'iskandar', 'pentalogy.wasser@gmail.com', NULL, '$2y$10$mDPYB70I3C6EkqLSVj9MvO7hzOk9RnL6lZyBTNISk9COYBf9Y54ai', NULL, '2024-04-15 00:28:49', '2024-04-15 00:28:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
