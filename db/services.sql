-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2024 at 09:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Database: `shopswallet`
-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) NOT NULL,
  `service_details` text NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `discount_type` varchar(255) DEFAULT NULL,
  `available_for` varchar(255) NOT NULL,
  `timeslot_list` varchar(255) NOT NULL,
  `old_staff` bigint(20) UNSIGNED DEFAULT NULL,
  `new_staff` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0=pending 1=accepted',
  `is_approved` tinyint(1) NOT NULL COMMENT '0=pending 1=approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `item_id`, `module_id`, `vendor_id`, `store_id`, `category_id`, `category_ids`, `service_details`, `unit_id`, `price`, `discount`, `discount_type`, `available_for`, `timeslot_list`, `old_staff`, `new_staff`, `status`, `is_approved`, `created_at`, `updated_at`) VALUES
(1, 7, 8, 6, 6, 13, '[{\"id\":\"11\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"13\",\"position\":3}]', '<p>dddd</p>', NULL, 1700.00, 0.00, 'percent', 'daily,monthly', '08:00 am,11:30 pm', NULL, 'EW', 1, 0, '2024-03-13 03:46:33', '2024-03-13 05:51:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_item_id_foreign` (`item_id`),
  ADD KEY `services_module_id_foreign` (`module_id`),
  ADD KEY `services_vendor_id_foreign` (`vendor_id`),
  ADD KEY `services_store_id_foreign` (`store_id`),
  ADD KEY `services_category_id_foreign` (`category_id`),
  ADD KEY `services_unit_id_foreign` (`unit_id`),
  ADD KEY `services_old_staff_foreign` (`old_staff`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `services_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  ADD CONSTRAINT `services_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `services_old_staff_foreign` FOREIGN KEY (`old_staff`) REFERENCES `vendor_employees` (`id`),
  ADD CONSTRAINT `services_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  ADD CONSTRAINT `services_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `services_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
