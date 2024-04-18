-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2024 at 12:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sisternu_shopswallet`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'collected',
  `created_by` varchar(20) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `from_type`, `from_id`, `current_balance`, `amount`, `method`, `ref`, `created_at`, `updated_at`, `type`, `created_by`) VALUES
(1, 'store', 3, 91.00, 91.00, 'cash_collection', '100002', '2024-01-17 12:41:56', '2024-01-17 12:41:56', 'cash_in', 'store'),
(2, 'store', 3, 100.00, 9.00, 'cash_collection', '100005', '2024-01-26 06:27:02', '2024-01-26 06:27:02', 'cash_in', 'store');

-- --------------------------------------------------------

--
-- Table structure for table `addon_settings`
--

CREATE TABLE `addon_settings` (
  `id` char(36) NOT NULL,
  `key_name` varchar(191) DEFAULT NULL,
  `live_values` longtext DEFAULT NULL,
  `test_values` longtext DEFAULT NULL,
  `settings_type` varchar(255) DEFAULT NULL,
  `mode` varchar(20) NOT NULL DEFAULT 'live',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addon_settings`
--

INSERT INTO `addon_settings` (`id`, `key_name`, `live_values`, `test_values`, `settings_type`, `mode`, `is_active`, `created_at`, `updated_at`, `additional_data`) VALUES
('070c6bbd-d777-11ed-96f4-0c7a158e4469', 'twilio', '{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":0,\"sid\":\"\",\"messaging_service_sid\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"twilio\",\"mode\":\"live\",\"status\":0,\"sid\":\"\",\"messaging_service_sid\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-04-10 02:14:44', NULL),
('070c766c-d777-11ed-96f4-0c7a158e4469', '2factor', '{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\"}', '{\"gateway\":\"2factor\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-04-10 03:17:06', NULL),
('0d8a9308-d6a5-11ed-962c-0c7a158e4469', 'mercadopago', '{\"gateway\":\"mercadopago\",\"mode\":\"live\",\"status\":1,\"access_token\":\"\",\"public_key\":\"\"}', '{\"gateway\":\"mercadopago\",\"mode\":\"live\",\"status\":1,\"access_token\":\"\",\"public_key\":\"\"}', 'payment_config', 'live', 0, NULL, '2023-04-12 03:37:50', '{\"gateway_title\":\"Mercadopago\",\"gateway_image\":null}'),
('0d8a9e49-d6a5-11ed-962c-0c7a158e4469', 'liqpay', '{\"gateway\":\"liqpay\",\"mode\":\"live\",\"status\":\"1\",\"private_key\":null,\"public_key\":null}', '{\"gateway\":\"liqpay\",\"mode\":\"live\",\"status\":\"1\",\"private_key\":null,\"public_key\":null}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Liqpay\",\"gateway_image\":null}'),
('101befdf-d44b-11ed-8564-0c7a158e4469', 'paypal', '{\"gateway\":\"paypal\",\"mode\":\"live\",\"status\":\"0\",\"client_id\":null,\"client_secret\":null}', '{\"gateway\":\"paypal\",\"mode\":\"live\",\"status\":\"0\",\"client_id\":null,\"client_secret\":null}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Paypal\",\"gateway_image\":null}'),
('133d9647-cabb-11ed-8fec-0c7a158e4469', 'hyper_pay', '{\"gateway\":\"hyper_pay\",\"mode\":\"live\",\"status\":\"0\",\"entity_id\":\"\",\"access_code\":\"\"}', '{\"gateway\":\"hyper_pay\",\"mode\":\"live\",\"status\":\"0\",\"entity_id\":\"\",\"access_code\":\"\"}', 'payment_config', 'test', 0, NULL, '2023-04-08 22:59:22', NULL),
('1821029f-d776-11ed-96f4-0c7a158e4469', 'msg91', '{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":0,\"template_id\":\"\",\"auth_key\":\"\"}', '{\"gateway\":\"msg91\",\"mode\":\"live\",\"status\":0,\"template_id\":\"\",\"auth_key\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-04-10 02:14:44', NULL),
('18210f2b-d776-11ed-96f4-0c7a158e4469', 'nexmo', '{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"nexmo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_secret\":\"\",\"token\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-04-10 02:14:44', NULL),
('18fbb21f-d6ad-11ed-962c-0c7a158e4469', 'foloosi', '{\"gateway\":\"foloosi\",\"mode\":\"live\",\"status\":\"0\",\"merchant_key\":\"\"}', '{\"gateway\":\"foloosi\",\"mode\":\"test\",\"status\":\"0\",\"merchant_key\":\"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('2767d142-d6a1-11ed-962c-0c7a158e4469', 'paytm', '{\"gateway\":\"paytm\",\"mode\":\"live\",\"status\":\"1\",\"merchant_key\":null,\"merchant_id\":null,\"merchant_website_link\":null}', '{\"gateway\":\"paytm\",\"mode\":\"live\",\"status\":\"1\",\"merchant_key\":null,\"merchant_id\":null,\"merchant_website_link\":null}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Paytm\",\"gateway_image\":null}'),
('3201d2e6-c937-11ed-a424-0c7a158e4469', 'amazon_pay', '{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\": \"\",\"access_code\": \"\",\"merchant_identifier\": \"\"}', '{\"gateway\":\"amazon_pay\",\"mode\":\"test\",\"status\":\"0\",\"pass_phrase\": \"\",\"access_code\": \"\",\"merchant_identifier\": \"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('4593b25c-d6a1-11ed-962c-0c7a158e4469', 'paytabs', '{\"gateway\":\"paytabs\",\"mode\":\"live\",\"status\":\"1\",\"profile_id\":null,\"server_key\":null,\"base_url\":null}', '{\"gateway\":\"paytabs\",\"mode\":\"live\",\"status\":\"1\",\"profile_id\":null,\"server_key\":null,\"base_url\":null}', 'payment_config', 'live', 0, NULL, '2023-04-09 02:23:25', '{\"gateway_title\":\"Paytabs\",\"gateway_image\":null}'),
('4e9b8dfb-e7d1-11ed-a559-0c7a158e4469', 'bkash', '{\"gateway\":\"bkash\",\"mode\":\"live\",\"status\":\"1\",\"app_key\":\"5tunt4masn6pv2hnvte1sb5n3j\",\"app_secret\":\"1vggbqd4hqk9g96o9rrrp2jftvek578v7d2bnerim12a87dbrrka\",\"username\":\"sandboxTestUser\",\"password\":\"hWD@8vtzw0\"}', '{\"gateway\":\"bkash\",\"mode\":\"live\",\"status\":\"1\",\"app_key\":\"5tunt4masn6pv2hnvte1sb5n3j\",\"app_secret\":\"1vggbqd4hqk9g96o9rrrp2jftvek578v7d2bnerim12a87dbrrka\",\"username\":\"sandboxTestUser\",\"password\":\"hWD@8vtzw0\"}', 'payment_config', 'live', 0, NULL, '2023-04-08 23:08:40', '{\"gateway_title\":\"Bkash\",\"gateway_image\":null}'),
('544a24a4-c872-11ed-ac7a-0c7a158e4469', 'fatoorah', '{\"gateway\":\"fatoorah\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\"}', '{\"gateway\":\"fatoorah\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('58c1bc8a-d6ac-11ed-962c-0c7a158e4469', 'ccavenue', '{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"\",\"working_key\":\"\",\"access_code\":\"\"}', '{\"gateway\":\"ccavenue\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"\",\"working_key\":\"\",\"access_code\":\"\"}', 'payment_config', 'test', 0, NULL, '2023-04-12 22:24:16', '{\"gateway_title\":\"\",\"gateway_image\":\"\"}'),
('5e2d2ef9-d6ab-11ed-962c-0c7a158e4469', 'thawani', '{\"gateway\":\"thawani\",\"mode\":\"live\",\"status\":\"0\",\"public_key\":\"\",\"private_key\":\"\"}', '{\"gateway\":\"thawani\",\"mode\":\"live\",\"status\":\"0\",\"public_key\":\"\",\"private_key\":\"\"}', 'payment_config', 'test', 0, NULL, '2023-04-12 23:14:00', '{\"gateway_title\":\"\",\"gateway_image\":\"\"}'),
('60cc83cc-d5b9-11ed-b56f-0c7a158e4469', 'sixcash', '{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"\",\"secret_key\":\"\",\"merchant_number\":\"\", \"base_url\":\"\"}', '{\"gateway\":\"sixcash\",\"mode\":\"test\",\"status\":\"0\",\"public_key\":\"\",\"secret_key\":\"\",\"merchant_number\":\"\", \"base_url\":\"\"}', 'payment_config', 'test', 0, NULL, '2023-04-12 03:18:06', '{\"gateway_title\":\"\",\"gateway_image\":\"\"}'),
('68579846-d8e8-11ed-8249-0c7a158e4469', 'alphanet_sms', '{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"alphanet_sms\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('6857a2e8-d8e8-11ed-8249-0c7a158e4469', 'sms_to', '{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"sms_to\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('74c30c00-d6a6-11ed-962c-0c7a158e4469', 'hubtel', '{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":\"0\",\"account_number\":\"\",\"api_id\":\"\",\"api_key\":\"\"}', '{\"gateway\":\"hubtel\",\"mode\":\"test\",\"status\":\"0\",\"account_number\":\"\",\"api_id\":\"\",\"api_key\":\"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('74e46b0a-d6aa-11ed-962c-0c7a158e4469', 'tap', '{\"gateway\":\"tap\",\"mode\":\"live\",\"status\":\"0\",\"secret_key\":\"\"}', '{\"gateway\":\"tap\",\"mode\":\"test\",\"status\":\"0\",\"secret_key\":\"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('761ca96c-d1eb-11ed-87ca-0c7a158e4469', 'swish', '{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\": \"\"}', '{\"gateway\":\"swish\",\"mode\":\"test\",\"status\":\"0\",\"number\": \"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('7b1c3c5f-d2bd-11ed-b485-0c7a158e4469', 'payfast', '{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"\",\"secured_key\":\"\"}', '{\"gateway\":\"payfast\",\"mode\":\"test\",\"status\":\"0\",\"merchant_id\":\"\",\"secured_key\":\"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('8592417b-d1d1-11ed-a984-0c7a158e4469', 'esewa', '{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\": \"\"}', '{\"gateway\":\"esewa\",\"mode\":\"test\",\"status\":\"0\",\"merchantCode\": \"EPAYTEST\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('9162a1dc-cdf1-11ed-affe-0c7a158e4469', 'viva_wallet', '{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\"}\n', '{\"gateway\":\"viva_wallet\",\"mode\":\"test\",\"status\":\"0\",\"client_id\": \"\",\"client_secret\": \"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('998ccc62-d6a0-11ed-962c-0c7a158e4469', 'stripe', '{\"gateway\":\"stripe\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '{\"gateway\":\"stripe\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"published_key\":null}', 'payment_config', 'live', 0, NULL, '2023-04-12 22:26:31', '{\"gateway_title\":\"Stripe\",\"gateway_image\":null}'),
('a3313755-c95d-11ed-b1db-0c7a158e4469', 'iyzi_pay', '{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\": \"\",\"secret_key\": \"\",\"base_url\": \"\"}', '{\"gateway\":\"iyzi_pay\",\"mode\":\"test\",\"status\":\"0\",\"api_key\": \"\",\"secret_key\": \"\",\"base_url\": \"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('a76c8993-d299-11ed-b485-0c7a158e4469', 'momo', '{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_user\":\"\",\"subscription_key\":\"\"}', '{\"gateway\":\"momo\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":\"\",\"api_user\":\"\",\"subscription_key\":\"\"}', 'payment_config', 'test', 0, NULL, '2023-04-08 22:39:19', NULL),
('a8608119-cc76-11ed-9bca-0c7a158e4469', 'moncash', '{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"\",\"secret_key\": \"\"}\n', '{\"gateway\":\"moncash\",\"mode\":\"test\",\"status\":\"0\",\"client_id\":\"\",\"secret_key\": \"\"}\n', 'payment_config', 'test', 0, NULL, NULL, NULL),
('ad5af1c1-d6a2-11ed-962c-0c7a158e4469', 'razor_pay', '{\"gateway\":\"razor_pay\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"api_secret\":null}', '{\"gateway\":\"razor_pay\",\"mode\":\"live\",\"status\":\"0\",\"api_key\":null,\"api_secret\":null}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Razor pay\",\"gateway_image\":null}'),
('ad5b02a0-d6a2-11ed-962c-0c7a158e4469', 'senang_pay', '{\"gateway\":\"senang_pay\",\"mode\":\"live\",\"status\":\"1\",\"callback_url\":null,\"secret_key\":null,\"merchant_id\":null}', '{\"gateway\":\"senang_pay\",\"mode\":\"live\",\"status\":\"1\",\"callback_url\":null,\"secret_key\":null,\"merchant_id\":null}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Senang pay\",\"gateway_image\":null}'),
('b6c333f6-d8e9-11ed-8249-0c7a158e4469', 'akandit_sms', '{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"akandit_sms\",\"mode\":\"live\",\"status\":0,\"username\":\"\",\"password\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('b6c33c87-d8e9-11ed-8249-0c7a158e4469', 'global_sms', '{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"global_sms\",\"mode\":\"live\",\"status\":0,\"user_name\":\"\",\"password\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('b8992bd4-d6a0-11ed-962c-0c7a158e4469', 'paymob_accept', '{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '{\"gateway\":\"paymob_accept\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Paymob accept\",\"gateway_image\":null}'),
('c41c0dcd-d119-11ed-9f67-0c7a158e4469', 'maxicash', '{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\": \"\",\"merchantPassword\": \"\"}', '{\"gateway\":\"maxicash\",\"mode\":\"test\",\"status\":\"0\",\"merchantId\": \"\",\"merchantPassword\": \"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('c9249d17-cd60-11ed-b879-0c7a158e4469', 'pvit', '{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}', '{\"gateway\":\"pvit\",\"mode\":\"test\",\"status\":\"0\",\"mc_tel_merchant\": \"\",\"access_token\": \"\", \"mc_merchant_code\": \"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('cb0081ce-d775-11ed-96f4-0c7a158e4469', 'releans', '{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"releans\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, '2023-04-10 02:14:44', NULL),
('d4f3f5f1-d6a0-11ed-962c-0c7a158e4469', 'flutterwave', '{\"gateway\":\"flutterwave\",\"mode\":\"live\",\"status\":1,\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}', '{\"gateway\":\"flutterwave\",\"mode\":\"live\",\"status\":1,\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Flutterwave\",\"gateway_image\":null}'),
('d822f1a5-c864-11ed-ac7a-0c7a158e4469', 'paystack', '{\"gateway\":\"paystack\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"public_key\":null,\"secret_key\":null,\"merchant_email\":null}', '{\"gateway\":\"paystack\",\"mode\":\"live\",\"status\":\"0\",\"callback_url\":null,\"public_key\":null,\"secret_key\":null,\"merchant_email\":null}', 'payment_config', 'live', 0, NULL, NULL, '{\"gateway_title\":\"Paystack\",\"gateway_image\":null}'),
('daec8d59-c893-11ed-ac7a-0c7a158e4469', 'xendit', '{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"\"}', '{\"gateway\":\"xendit\",\"mode\":\"test\",\"status\":\"0\",\"api_key\":\"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('dc0f5fc9-d6a5-11ed-962c-0c7a158e4469', 'worldpay', '{\"gateway\":\"worldpay\",\"mode\":\"live\",\"status\":\"0\",\"OrgUnitId\":\"\",\"jwt_issuer\":\"\",\"mac\":\"\",\"merchantCode\":\"\",\"xml_password\":\"\"}', '{\"gateway\":\"worldpay\",\"mode\":\"test\",\"status\":\"0\",\"OrgUnitId\":\"\",\"jwt_issuer\":\"\",\"mac\":\"\",\"merchantCode\":\"\",\"xml_password\":\"\"}', 'payment_config', 'test', 0, NULL, NULL, NULL),
('e0450278-d8eb-11ed-8249-0c7a158e4469', 'signal_wire', '{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"signal_wire\",\"mode\":\"live\",\"status\":0,\"project_id\":\"\",\"token\":\"\",\"space_url\":\"\",\"from\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('e0450b40-d8eb-11ed-8249-0c7a158e4469', 'paradox', '{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\"}', '{\"gateway\":\"paradox\",\"mode\":\"live\",\"status\":0,\"api_key\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('ea346efe-cdda-11ed-affe-0c7a158e4469', 'ssl_commerz', '{\"gateway\":\"ssl_commerz\",\"mode\":\"live\",\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '{\"gateway\":\"ssl_commerz\",\"mode\":\"live\",\"status\":\"0\",\"store_id\":null,\"store_password\":null}', 'payment_config', 'live', 0, NULL, '2023-07-31 13:14:48', '{\"gateway_title\":\"Ssl commerz\",\"gateway_image\":null}'),
('eed88336-d8ec-11ed-8249-0c7a158e4469', 'hubtel', '{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"hubtel\",\"mode\":\"live\",\"status\":0,\"sender_id\":\"\",\"client_id\":\"\",\"client_secret\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('f149c546-d8ea-11ed-8249-0c7a158e4469', 'viatech', '{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"viatech\",\"mode\":\"live\",\"status\":0,\"api_url\":\"\",\"api_key\":\"\",\"sender_id\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL),
('f149cd9c-d8ea-11ed-8249-0c7a158e4469', '019_sms', '{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}', '{\"gateway\":\"019_sms\",\"mode\":\"live\",\"status\":0,\"password\":\"\",\"username\":\"\",\"username_for_token\":\"\",\"sender\":\"\",\"otp_template\":\"\"}', 'sms_config', 'live', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`, `is_logged_in`) VALUES
(1, 'Test', 'Admin', '01500000000', 'admin@adminxx.com', NULL, 'xjd', NULL, '2023-08-16 23:34:18', '2023-08-16 23:34:18', 1, NULL, 1),
(2, 'Aryan', 'Raj', '8700304469', 'aryanzyraj@gmail.com', NULL, '$2y$10$vMPnvaRmF.CQZMi7J9C9YeubKbYGSa81XvrmS7TlKSE4HQPKK0Wly', NULL, '2024-01-10 13:47:04', '2024-01-11 22:33:45', 1, NULL, 1),
(3, 'Mutasim', 'Naib', '01724698392', 'mutasim@gmail.com', 'def.png', '$2y$10$DPR/xab7wOcLbd0nvxv6VuqlEtDwYw1agEgEsv3wlMJLnoK8FWDaS', NULL, '2024-02-22 04:18:49', '2024-02-22 04:19:26', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_features`
--

CREATE TABLE `admin_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_features`
--

INSERT INTO `admin_features` (`id`, `title`, `sub_title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Feature Title', 'Demo Feature  Sub Title', '2023-08-16-64dcaa268d2d0.png', 1, '2023-08-15 23:51:18', '2023-08-15 23:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `admin_promotional_banners`
--

CREATE TABLE `admin_promotional_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_promotional_banners`
--

INSERT INTO `admin_promotional_banners` (`id`, `title`, `sub_title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Title', 'Demo Promotional Subtitle', '2023-08-16-64dca9d76d4f4.png', 1, '2023-08-15 23:49:59', '2023-08-15 23:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `modules` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_special_criterias`
--

CREATE TABLE `admin_special_criterias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_special_criterias`
--

INSERT INTO `admin_special_criterias` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Title', '2023-08-16-64dcaaa5b0d37.png', 1, '2023-08-15 23:53:25', '2023-08-15 23:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `admin_testimonials`
--

CREATE TABLE `admin_testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `reviewer_image` varchar(255) DEFAULT NULL,
  `company_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_testimonials`
--

INSERT INTO `admin_testimonials` (`id`, `name`, `designation`, `review`, `reviewer_image`, `company_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'CTO', 'Very good service.', '2023-08-16-64dcaae2e5bc0.png', '2023-08-16-64dcaae2eae2a.png', 1, '2023-08-15 23:54:26', '2023-08-15 23:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `digital_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `manual_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `total_commission_earning`, `digital_received`, `manual_received`, `created_at`, `updated_at`, `delivery_charge`) VALUES
(1, 1, 4.95, 0.00, 0.00, '2024-01-17 12:41:56', '2024-01-26 06:27:02', 0.000);

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Color', '2024-01-12 10:14:28', '2024-01-12 10:14:28'),
(2, 'Type', '2024-01-12 10:14:40', '2024-01-12 10:14:40'),
(3, 'Size', '2024-01-12 10:14:48', '2024-01-12 10:14:48'),
(4, 'Items', '2024-02-02 04:47:37', '2024-02-02 04:47:37'),
(5, 'Quantity', '2024-02-02 04:48:34', '2024-02-02 04:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `data` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `default_link` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`, `module_id`, `featured`, `default_link`, `created_by`) VALUES
(1, 'Offer Banner', 'default', '2024-01-12-65a166554ecd9.png', 1, '', '2024-01-12 10:18:29', '2024-01-12 10:20:16', 2, 2, 1, NULL, 'admin'),
(2, 'Offer Banner', 'default', '2024-01-12-65a16670dbbc3.png', 1, '', '2024-01-12 10:18:56', '2024-01-12 10:20:16', 2, 2, 1, NULL, 'admin'),
(3, 'Offer Banner', 'default', '2024-01-12-65a1669d599d7.png', 1, '', '2024-01-12 10:19:41', '2024-01-12 10:20:15', 3, 2, 1, NULL, 'admin'),
(4, 'Offer Banner', 'default', '2024-01-12-65a166bb5749b.png', 1, '', '2024-01-12 10:20:11', '2024-01-12 10:20:24', 3, 2, 1, NULL, 'admin'),
(5, 'Test', 'default', '2024-03-03-65e4380ad139a.png', 1, '', '2024-03-03 05:42:50', '2024-03-03 05:42:50', 2, 8, 0, NULL, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active and 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `category_id`, `module_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'Test Brand D', 1, '2024-04-17 04:28:19', '2024-04-17 04:28:19'),
(2, 1, 2, 'TEst ACD', 1, '2024-04-17 05:17:39', '2024-04-17 05:17:39');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'cash_on_delivery', '{\"status\":\"1\"}', '2021-07-01 15:51:17', '2021-07-01 15:51:17'),
(2, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2021-05-11 03:57:02', '2022-03-23 04:22:00'),
(4, 'mail_config', '{\"status\":\"1\",\"name\":\"Shopswallet\",\"host\":\"smtp.shopswallet.com\",\"driver\":\"smtp\",\"port\":\"587\",\"username\":\"support@shopswallet.com\",\"email_id\":\"support@shopswallet.com\",\"encryption\":\"tls\",\"password\":\"Shop@423523\"}', NULL, '2024-01-12 11:24:27'),
(5, 'fcm_project_id', 'shops-wallet', NULL, NULL),
(6, 'push_notification_key', 'AAAAgL4UwoY:APA91bEMTbHBL0m5KxR874BRBTcbIChPP7zXgmcyIhnXP-WIKGddEB5IHFTqZotMXokqPYE6rDWnCWRw_1us_ZNakOzrzhVedBfTPEaPpLWT-7Zmg5cW13eFLTvzBedOl3JLmfs6X85G', NULL, NULL),
(7, 'order_pending_message', '{\"status\":1,\"message\":\"Your order is successfully placed\"}', NULL, NULL),
(8, 'order_confirmation_msg', '{\"status\":1,\"message\":\"Your order is confirmed\"}', NULL, NULL),
(9, 'order_processing_message', '{\"status\":1,\"message\":\"Your order is started for cooking\"}', NULL, NULL),
(10, 'out_for_delivery_message', '{\"status\":1,\"message\":\"Your food is ready for delivery\"}', NULL, NULL),
(11, 'order_delivered_message', '{\"status\":1,\"message\":\"Your order is delivered\"}', NULL, NULL),
(12, 'delivery_boy_assign_message', '{\"status\":1,\"message\":\"Your order has been assigned to a delivery man\"}', NULL, NULL),
(13, 'delivery_boy_start_message', '{\"status\":1,\"message\":\"Your order is picked up by delivery man\"}', NULL, NULL),
(14, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":\"Order delivered successfully\"}', NULL, NULL),
(15, 'terms_and_conditions', '<p>This is a test Teams &amp; Conditions<br />\r\n<br />\r\nThese terms of use (the &quot;Terms of Use&quot;) govern your use of our website www.evaly.com.bd (the &quot;Website&quot;) and our &quot;StackFood&quot; application for mobile and handheld devices (the &quot;App&quot;). The Website and the App are jointly referred to as the &quot;Platform&quot;. Please read these Terms of Use carefully before you use the services. If you do not agree to these Terms of Use, you may not use the services on the Platform, and we request you to uninstall the App. By installing, downloading and/or even merely using the Platform, you shall be contracting with StackFood and you provide your acceptance to the Terms of Use and other StackFood policies (including but not limited to the Cancellation &amp; Refund Policy, Privacy Policy etc.) as posted on the Platform from time to time, which takes effect on the date on which you download, install or use the Services, and create a legally binding arrangement to abide by the same. The Platforms will be used by (i) natural persons who have reached 18 years of age and (ii) corporate legal entities, e.g companies. Where applicable, these Terms shall be subject to country-specific provisions as set out herein.</p>\r\n\r\n<h3>USE OF PLATFORM AND SERVICES</h3>\r\n\r\n<p>All commercial/contractual terms are offered by and agreed to between Buyers and Merchants alone. The commercial/contractual terms include without limitation to price, taxes, shipping costs, payment methods, payment terms, date, period and mode of delivery, warranties related to products and services and after sales services related to products and services. StackFood does not have any kind of control or does not determine or advise or in any way involve itself in the offering or acceptance of such commercial/contractual terms between the Buyers and Merchants. StackFood may, however, offer support services to Merchants in respect to order fulfilment, payment collection, call centre, and other services, pursuant to independent contracts executed by it with the Merchants. eFood is not responsible for any non-performance or breach of any contract entered into between Buyers and Merchants on the Platform. eFood cannot and does not guarantee that the concerned Buyers and/or Merchants shall perform any transaction concluded on the Platform. eFood is not responsible for unsatisfactory services or non-performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.</p>\r\n\r\n<p>StackFood&nbsp;is operating an e-commerce platform and assumes and operates the role of facilitator, and does not at any point of time during any transaction between Buyer and Merchant on the Platform come into or take possession of any of the products or services offered by Merchant. At no time shall StackFood hold any right, title or interest over the products nor shall StackFood have any obligations or liabilities in respect of such contract entered into between Buyer and Merchant. You agree and acknowledge that we shall not be responsible for:</p>\r\n\r\n<ul>\r\n	<li>The goods provided by the shops or restaurants including, but not limited, serving of food orders suiting your requirements and needs;</li>\r\n	<li>The Merchant&quot;s goods not being up to your expectations or leading to any loss, harm or damage to you;</li>\r\n	<li>The availability or unavailability of certain items on the menu;</li>\r\n	<li>The Merchant serving the incorrect orders.</li>\r\n</ul>\r\n\r\n<p>The details of the menu and price list available on the Platform are based on the information provided by the Merchants and we shall not be responsible for any change or cancellation or unavailability. All Menu &amp; Food Images used on our platforms are only representative and shall/might not match with the actual Menu/Food Ordered, StackFood shall not be responsible or Liable for any discrepancies or variations on this aspect.</p>\r\n\r\n<h3>Personal Information that you provide</h3>\r\n\r\n<p>If you want to use our service, you must create an account on our Site. To establish your account, we will ask for personally identifiable information that can be used to contact or identify you, which may include your name, phone number, and e-mail address. We may also collect demographic information about you, such as your zip code, and allow you to submit additional information that will be part of your profile. Other than basic information that we need to establish your account, it will be up to you to decide how much information to share as part of your profile. We encourage you to think carefully about the information that you share and we recommend that you guard your identity and your sensitive information. Of course, you can review and revise your profile at any time.</p>\r\n\r\n<p>You understand that delivery periods quoted to you at the time of confirming the order is an approximate estimate and may vary. We shall not be responsible for any delay in the delivery of your order due to the delay at seller/merchant end for order processing or any other unavoidable circumstances.</p>\r\n\r\n<p>Your order shall be only delivered to the address designated by you at the time of placing the order on the Platform. We reserve the right to cancel the order, in our sole discretion, in the event of any change to the place of delivery and you shall not be entitled to any refund for the same. Delivery in the event of change of the delivery location shall be at our sole discretion and reserve the right to charge with additional delivery fee if required.</p>\r\n\r\n<p>You shall undertake to provide adequate directions, information and authorizations to accept delivery. In the event of any failure to accept delivery, failure to deliver within the estimated time due to your failure to provide appropriate instructions, or authorizations, then such goods shall be deemed to have been delivered to you and all risk and responsibility in relation to such goods shall pass to you and you shall not be entitled to any refund for the same. Our decision in relation to this shall be final and binding. You understand that our liability ends once your order has been delivered to you.</p>\r\n\r\n<p>You might be required to provide your credit or debit card details to the approved payment gateways while making the payment. In this regard, you agree to provide correct and accurate credit/ debit card details to the approved payment gateways for availing the Services. You shall not use the credit/ debit card which is not lawfully owned by you, i.e. in any transaction, you must use your own credit/ debit card. The information provided by you shall not be utilized or shared with any third party unless required in relation to fraud verifications or by law, regulation or court order. You shall be solely responsible for the security and confidentiality of your credit/ debit card details. We expressly disclaim all liabilities that may arise as a consequence of any unauthorized use of your credit/ debit card. You agree that the Services shall be provided by us only during the working hours of the relevant Merchants.</p>\r\n\r\n<h3>ACTIVITIES PROHIBITED ON THE PLATFORM</h3>\r\n\r\n<p>The following is a partial list of the kinds of conduct that are illegal or prohibited on the Websites. StackFood reserves the right to investigate and take appropriate legal action/s against anyone who, in StackFood sole discretion, engages in any of the prohibited activities. Prohibited activities include &mdash; but are not limited to &mdash; the following:</p>\r\n\r\n<ul>\r\n	<li>Using the Websites for any purpose in violation of laws or regulations;</li>\r\n	<li>Posting Content that infringes the intellectual property rights, privacy rights, publicity rights, trade secret rights, or any other rights of any party;</li>\r\n	<li>Posting Content that is unlawful, obscene, defamatory, threatening, harassing, abusive, slanderous, hateful, or embarrassing to any other person or entity as determined by StackFood in its sole discretion or pursuant to local community standards;</li>\r\n	<li>Posting Content that constitutes cyber-bullying, as determined by StackFood in its sole discretion;</li>\r\n	<li>Posting Content that depicts any dangerous, life-threatening, or otherwise risky behavior;</li>\r\n	<li>Posting telephone numbers, street addresses, or last names of any person;</li>\r\n	<li>Posting URLs to external websites or any form of HTML or programming code;</li>\r\n	<li>Posting anything that may be &quot;spam,&quot; as determined by StackFood in its sole discretion;</li>\r\n	<li>Impersonating another person when posting Content;</li>\r\n	<li>Harvesting or otherwise collecting information about others, including email addresses, without their consent;</li>\r\n	<li>Allowing any other person or entity to use your identification for posting or viewing comments;</li>\r\n	<li>Harassing, threatening, stalking, or abusing any person;</li>\r\n	<li>Engaging in any other conduct that restricts or inhibits any other person from using or enjoying the Websites, or which, in the sole discretion of StackFood , exposes eFood or any of its customers, suppliers, or any other parties to any liability or detriment of any type; or</li>\r\n	<li>Encouraging other people to engage in any prohibited activities as described herein.</li>\r\n</ul>\r\n\r\n<p>StackFood&nbsp;reserves the right but is not obligated to do any or all of the following:</p>\r\n\r\n<ul>\r\n	<li>Investigate an allegation that any Content posted on the Websites does not conform to these Terms of Use and determine in its sole discretion to remove or request the removal of the Content;</li>\r\n	<li>Remove Content which is abusive, illegal, or disruptive, or that otherwise fails to conform with these Terms of Use;</li>\r\n	<li>Terminate a user&#39;s access to the Websites upon any breach of these Terms of Use;</li>\r\n	<li>Monitor, edit, or disclose any Content on the Websites; and</li>\r\n	<li>Edit or delete any Content posted on the Websites, regardless of whether such Content violates these standards.</li>\r\n</ul>\r\n\r\n<h3>AMENDMENTS</h3>\r\n\r\n<p>StackFood&nbsp;reserves the right to change or modify these Terms (including our policies which are incorporated into these Terms) at any time by posting changes on the Platform. You are strongly recommended to read these Terms regularly. You will be deemed to have agreed to the amended Terms by your continued use of the Platforms following the date on which the amended Terms are posted.</p>\r\n\r\n<h3>PAYMENT</h3>\r\n\r\n<p>StackFood&nbsp;reserves the right to offer additional payment methods and/or remove existing payment methods at any time in its sole discretion. If you choose to pay using an online payment method, the payment shall be processed by our third party payment service provider(s). With your consent, your credit card / payment information will be stored with our third party payment service provider(s) for future orders. StackFood does not store your credit card or payment information. You must ensure that you have sufficient funds on your credit and debit card to fulfil payment of an Order. Insofar as required, StackFood takes responsibility for payments made on our Platforms including refunds, chargebacks, cancellations and dispute resolution, provided if reasonable and justifiable and in accordance with these Terms.</p>\r\n\r\n<h3>CANCELLATION</h3>\r\n\r\n<p>StackFood&nbsp;can cancel any order anytime due to the foods/products unavailability, out of coverage area and any other unavoidable circumstances.</p>', NULL, '2021-08-22 01:48:01'),
(16, 'business_name', 'ShopsWallet', NULL, NULL),
(17, 'currency', 'QAR', NULL, NULL),
(18, 'logo', '2024-01-11-65a0c49db0405.png', NULL, NULL),
(19, 'phone', '+97430853951', NULL, NULL),
(20, 'email_address', 'info@shopswallet.com', NULL, NULL),
(21, 'address', 'Office 107 at New Building -AL Muntazah Area (AL Muntaza Trade Center) Doha Qatar Building #1, Floor #1 , Office #7', NULL, NULL),
(22, 'footer_text', 'Shopswallet@2021', NULL, NULL),
(23, 'customer_verification', '0', NULL, NULL),
(24, 'map_api_key', 'AIzaSyC1JZsjXO8C6OMzppDtePnV5f0Sbf8y7jc', NULL, NULL),
(25, 'about_us', '<p>Lorem <strong>ipsum </strong>dolor sit amet, <em><strong>consectetur </strong></em>adipiscing elit. <em>Cras </em>dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, <a href=\"http://google.com\">suscipit </a>metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dictum massa et dolor porta, rhoncus faucibus magna elementum. Sed porta mattis mollis. Donec ut est pretium, pretium nibh porttitor, suscipit metus. Sed viverra felis sed elit vehicula sodales. Nullam ante ante, tristique vel tincidunt ac, egestas eget sem. Sed lorem nunc, pellentesque vel ipsum venenatis, pellentesque interdum orci. Suspendisse mauris dui, accumsan at dapibus sed, volutpat quis erat. Nam fringilla nisl eu nunc lobortis, feugiat posuere libero venenatis. Nunc risus lorem, ornare eget congue in, pretium quis enim. Pellentesque elit elit, pharetra eget nunc at, maximus pellentesque diam.</p>\r\n\r\n<p>Praesent fermentum finibus lacus. Nulla tincidunt lectus sed purus facilisis hendrerit. Maecenas volutpat elementum orci, tincidunt euismod ante facilisis ac. Integer dignissim iaculis varius. Mauris iaculis elit vel posuere pellentesque. Praesent a mi sed neque ullamcorper dignissim sed ut nibh. Sed purus dui, sodales in varius in, accumsan at libero. Vestibulum posuere dui et orci tincidunt, ac consequat felis venenatis.</p>\r\n\r\n<p>Morbi sodales, nisl iaculis fringilla imperdiet, metus tortor semper quam, a fringilla nulla dui nec dolor. Phasellus lacinia aliquam ligula sed porttitor. Cras feugiat eros ut arcu commodo dictum. Integer tincidunt nisl id nisl consequat molestie. Integer elit tortor, ultrices sit amet nunc vitae, feugiat tempus mauris. Morbi volutpat consectetur felis sed porttitor. Praesent in urna erat.</p>\r\n\r\n<p>Aenean mollis luctus dolor, eu interdum velit faucibus eu. Suspendisse vitae efficitur erat. In facilisis nisi id arcu scelerisque bibendum. Nunc a placerat enim. Donec pharetra, velit quis facilisis tempus, lectus est imperdiet nisl, in tempus tortor dolor iaculis dolor. Nunc vitae molestie turpis. Nam vitae lobortis massa. Nam pharetra non felis in porta.</p>\r\n\r\n<p>Vivamus pulvinar diam vel felis dignissim tincidunt. Donec hendrerit non est sed volutpat. In egestas ex tortor, at convallis nunc porttitor at. Fusce sed cursus risus. Nam metus sapien, viverra eget felis id, maximus convallis lacus. Donec nec lacus vitae ex hendrerit ultricies non vel risus. Morbi malesuada ipsum iaculis augue convallis vehicula. Proin eget dolor dignissim, volutpat purus ac, ultricies risus. Pellentesque semper, mauris et pharetra accumsan, ante velit faucibus ex, a mattis metus odio vel ligula. Pellentesque elementum suscipit laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer a turpis sed massa blandit iaculis. Sed aliquet, justo vestibulum euismod rhoncus, nisi dui fringilla sapien, non tempor nunc lectus vitae dolor. Suspendisse potenti.</p>', NULL, '2021-07-28 07:09:19'),
(26, 'privacy_policy', '<h2>This is a Demo Privacy Policy</h2>\r\n\r\n<p>This policy explains how StackFood&nbsp;website and related applications (the &ldquo;Site&rdquo;, &ldquo;we&rdquo; or &ldquo;us&rdquo;) collects, uses, shares and protects the personal information that we collect through this site or different channels. StackFood has established the site to link up the users who need foods or grocery items to be shipped or delivered by the riders from the affiliated restaurants or shops to the desired location. This policy also applies to any mobile applications that we develop for use with our services on the Site, and references to this &ldquo;Site&rdquo;, &ldquo;we&rdquo; or &ldquo;us&rdquo; is intended to also include these mobile applications. Please read below to learn more about our information policies. By using this Site, you agree to these policies.</p>\r\n\r\n<h2>How the Information is collected</h2>\r\n\r\n<h3>Information provided by web browser</h3>\r\n\r\n<p>You have to provide us with personal information like your name, contact no, mailing address and email id, our app will also fetch your location information in order to give you the best service. Like many other websites, we may record information that your web browser routinely shares, such as your browser type, browser language, software and hardware attributes, the date and time of your visit, the web page from which you came, your Internet Protocol address and the geographic location associated with that address, the pages on this Site that you visit and the time you spent on those pages. This will generally be anonymous data that we collect on an aggregate basis.</p>\r\n\r\n<h3>Personal Information that you provide</h3>\r\n\r\n<p>If you want to use our service, you must create an account on our Site. To establish your account, we will ask for personally identifiable information that can be used to contact or identify you, which may include your name, phone number, and e-mail address. We may also collect demographic information about you, such as your zip code, and allow you to submit additional information that will be part of your profile. Other than basic information that we need to establish your account, it will be up to you to decide how much information to share as part of your profile. We encourage you to think carefully about the information that you share and we recommend that you guard your identity and your sensitive information. Of course, you can review and revise your profile at any time.</p>\r\n\r\n<h3>Payment Information</h3>\r\n\r\n<p>To make the payment online for availing our services, you have to provide the bank account, mobile financial service (MFS), debit card, credit card information to the StackFood platform.</p>\r\n\r\n<h2>How the Information is collected</h2>\r\n\r\n<h3>Session and Persistent Cookies</h3>\r\n\r\n<p>Cookies are small text files that are placed on your computer by websites that you visit. They are widely used in order to make websites work, or work more efficiently, as well as to provide information to the owners of the site. As is commonly done on websites, we may use cookies and similar technology to keep track of our users and the services they have elected. We use both &ldquo;session&rdquo; and &ldquo;persistent&rdquo; cookies. Session cookies are deleted after you leave our website and when you close your browser. We use data collected with session cookies to enable certain features on our Site, to help us understand how users interact with our Site, and to monitor at an aggregate level Site usage and web traffic routing. We may allow business partners who provide services to our Site to place cookies on your computer that assist us in analyzing usage data. We do not allow these business partners to collect your personal information from our website except as may be necessary for the services that they provide.</p>\r\n\r\n<h3>Web Beacons</h3>\r\n\r\n<p>We may also use web beacons or similar technology to help us track the effectiveness of our communications.</p>\r\n\r\n<h3>Advertising Cookies</h3>\r\n\r\n<p>We may use third parties, such as Google, to serve ads about our website over the internet. These third parties may use cookies to identify ads that may be relevant to your interest (for example, based on your recent visit to our website), to limit the number of times that you see an ad, and to measure the effectiveness of the ads.</p>\r\n\r\n<h3>Google Analytics</h3>\r\n\r\n<p>We may also use Google Analytics or a similar service to gather statistical information about the visitors to this Site and how they use the Site. This, also, is done on an anonymous basis. We will not try to associate anonymous data with your personally identifiable data. If you would like to learn more about Google Analytics, please click here.</p>', NULL, '2021-08-22 01:49:58'),
(27, 'minimum_shipping_charge', '5', NULL, NULL),
(28, 'per_km_shipping_charge', '1', NULL, NULL),
(29, 'digital_payment', '{\"status\":\"1\"}', '2021-07-01 14:27:38', '2024-01-11 23:26:53'),
(30, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2021-07-04 15:41:24', '2022-03-23 04:21:28'),
(31, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', '2021-07-04 15:41:28', '2022-03-23 04:21:38'),
(32, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2021-07-04 15:41:34', '2022-03-23 04:21:49'),
(33, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":null,\"merchantEmail\":null}', '2021-07-04 15:41:42', '2022-03-23 04:22:15'),
(34, 'senang_pay', '{\"status\":\"1\",\"secret_key\":null,\"published_key\":null,\"merchant_id\":null}', '2021-07-04 15:41:48', '2022-03-23 04:22:25'),
(35, 'order_handover_message', '{\"status\":1,\"message\":\"Delivery man is on the way\"}', NULL, NULL),
(36, 'order_cancled_message', '{\"status\":1,\"message\":\"Order is canceled by your request\"}', NULL, NULL),
(37, 'timezone', 'Asia/Kuwait', NULL, NULL),
(38, 'order_delivery_verification', '1', NULL, NULL),
(39, 'currency_symbol_position', 'left', NULL, NULL),
(40, 'schedule_order', '1', NULL, NULL),
(41, 'app_minimum_version', '0', NULL, NULL),
(42, 'tax', NULL, NULL, NULL),
(43, 'admin_commission', '5', NULL, NULL),
(44, 'country', 'QA', NULL, NULL),
(45, 'app_url', 'https://www.google.com', NULL, NULL),
(46, 'default_location', '{\"lat\":\"25.2722868\",\"lng\":\"51.5254431\"}', NULL, NULL),
(47, 'twilio_sms', '{\"status\":\"0\",\"sid\":null,\"messaging_service_id\":null,\"token\":null,\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2022-03-23 15:16:08', '2022-03-23 15:16:08'),
(48, 'nexmo_sms', '{\"status\":\"0\",\"api_key\":null,\"api_secret\":null,\"signature_secret\":\"\",\"private_key\":\"\",\"application_id\":\"\",\"from\":null,\"otp_template\":\"Your otp is #OTP#.\"}', '2022-03-23 15:16:18', '2022-03-23 15:16:18'),
(49, '2factor_sms', '{\"status\":\"0\",\"api_key\":null}', '2022-03-23 15:16:26', '2022-03-23 15:16:26'),
(50, 'msg91_sms', '{\"status\":\"0\",\"template_id\":null,\"authkey\":null}', '2022-03-23 15:16:33', '2022-03-23 15:16:33'),
(51, 'free_delivery_over', '250', NULL, NULL),
(52, 'maintenance_mode', '0', '2021-09-08 15:44:28', '2021-09-08 15:44:28'),
(53, 'app_minimum_version_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(54, 'app_minimum_version_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(55, 'app_url_ios', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(56, 'app_url_android', NULL, '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(57, 'flutterwave', '{\"status\":1,\"public_key\":\"FLWPUBK_TEST-3f6a0b6c3d621c4ecbb9beeff516c92b-X\",\"secret_key\":\"FLWSECK_TEST-ec27426eb062491500a9eb95723b5436-X\",\"hash\":\"FLWSECK_TEST951e36220f66\"}', '2021-09-21 22:54:10', '2021-09-21 22:54:10'),
(58, 'dm_maximum_orders', '2', '2021-09-24 17:46:13', '2021-09-24 17:46:13'),
(59, 'order_confirmation_model', 'store', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(60, 'popular_food', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(61, 'popular_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(62, 'new_restaurant', '1', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', '2021-10-17 00:05:08', '2021-10-17 00:05:08'),
(64, 'map_api_key_server', 'AIzaSyC1JZsjXO8C6OMzppDtePnV5f0Sbf8y7jc', NULL, NULL),
(66, 'most_reviewed_foods', '1', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(67, 'landing_page_text', '{\"header_title_1\":\"Food App\",\"header_title_2\":\"Why stay hungry when you can order from StackFood\",\"header_title_3\":\"Get 10% OFF on your first order\",\"about_title\":\"StackFood is Best Delivery Service Near You\",\"why_choose_us\":\"Why Choose Us?\",\"why_choose_us_title\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit.\",\"testimonial_title\":\"Trusted by Customer & Restaurant Owner\",\"footer_article\":\"Suspendisse ultrices at diam lectus nullam. Nisl, sagittis viverra enim erat tortor ultricies massa turpis. Arcu pulvinar.\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(68, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(69, 'speciality', '[{\"img\":\"clean_&_cheap_icon.png\",\"title\":\"Clean & Cheap Price\"},{\"img\":\"best_dishes_icon.png\",\"title\":\"Best Dishes Near You\"},{\"img\":\"virtual_restaurant_icon.png\",\"title\":\"Your Own Virtual Restaurant\"}]', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(70, 'testimonial', '[{\"img\":\"img-1.png\",\"name\":\"Barry Allen\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A\\r\\n                    aliquam amet animi blanditiis consequatur debitis dicta\\r\\n                    distinctio, enim error eum iste libero modi nam natus\\r\\n                    perferendis possimus quasi sint sit tempora voluptatem. Est,\\r\\n                    exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-2.png\",\"name\":\"Sophia Martino\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-3.png\",\"name\":\"Alan Turing\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"},{\"img\":\"img-4.png\",\"name\":\"Ann Marie\",\"position\":\"Web Designer\",\"detail\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. A aliquam amet animi blanditiis consequatur debitis dicta distinctio, enim error eum iste libero modi nam natus perferendis possimus quasi sint sit tempora voluptatem. Est, exercitationem id ipsa ipsum laboriosam perferendis temporibus!\"}]', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(71, 'landing_page_images', '{\"top_content_image\":\"double_screen_image.png\",\"about_us_image\":\"about_us_image.png\"}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(72, 'paymob_accept', '{\"status\":\"0\",\"api_key\":null,\"iframe_id\":null,\"integration_id\":null,\"hmac\":null}', '2021-11-15 15:55:37', '2021-11-15 15:55:37'),
(73, 'admin_order_notification', '1', NULL, NULL),
(74, 'swish_payment', '{\"status\":\"1\"}', NULL, '2021-12-28 12:02:40'),
(76, 'service_charge', '12', NULL, NULL),
(77, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"},{\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":\"0\"}]', NULL, '2022-01-04 13:09:23'),
(78, 'language', '[\"en\",\"ar\"]', NULL, NULL),
(79, 'timeformat', '12', NULL, NULL),
(80, 'canceled_by_restaurant', '0', NULL, NULL),
(81, 'canceled_by_deliveryman', '0', NULL, NULL),
(82, 'show_dm_earning', '1', NULL, NULL),
(83, 'recaptcha', '{\"status\":\"1\",\"site_key\":null,\"secret_key\":null}', '2024-01-12 04:37:39', '2024-01-12 04:37:39'),
(84, 'toggle_veg_non_veg', '1', NULL, NULL),
(85, 'toggle_dm_registration', '1', NULL, NULL),
(86, 'toggle_restaurant_registration', '1', NULL, NULL),
(87, 'order_refunded_message', '{\"status\":1,\"message\":\"Order is refunded successfully\"}', NULL, NULL),
(88, 'liqpay', '{\"status\":\"1\",\"public_key\":null,\"private_key\":null}', NULL, '2022-02-27 05:15:40'),
(89, 'klarna', '{\"status\":\"1\",\"region\":\"america\",\"username\":\"PN06804_1a368db08f6d\",\"password\":\"6ljrP6BDJNKT6F2y\"}', NULL, '2022-01-26 08:30:51'),
(90, 'fatoorah', '{\"status\":\"1\",\"api_key\":\"rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL\"}', NULL, '2022-02-20 11:05:26'),
(91, 'bkash', '{\"status\":\"1\",\"api_key\":\"5tunt4masn6pv2hnvte1sb5n3j\",\"api_secret\":\"1vggbqd4hqk9g96o9rrrp2jftvek578v7d2bnerim12a87dbrrka\",\"username\":\"sandboxTestUser\",\"password\":\"hWD@8vtzw0\"}', NULL, '2022-02-27 04:37:26'),
(92, 'paytabs', '{\"status\":\"1\",\"profile_id\":null,\"server_key\":null,\"base_url\":null}', NULL, '2022-02-27 06:06:19'),
(93, 'paytm', '{\"status\":\"1\",\"paytm_merchant_key\":null,\"paytm_merchant_mid\":null,\"paytm_merchant_website\":null,\"paytm_refund_url\":null}', NULL, '2022-02-27 06:06:37'),
(94, 'schedule_order_slot_duration', '30', NULL, NULL),
(95, 'digit_after_decimal_point', '0', NULL, NULL),
(96, 'icon', '2024-01-11-65a0c34690840.png', NULL, NULL),
(97, 'toggle_store_registration', '1', NULL, NULL),
(98, 'canceled_by_store', '0', NULL, NULL),
(99, 'parcel_per_km_shipping_charge', '0', NULL, NULL),
(100, 'parcel_minimum_shipping_charge', '0', NULL, NULL),
(101, 'parcel_commission_dm', '0', NULL, NULL),
(102, 'landing_page_links', '{\"app_url_android_status\":\"1\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"1\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"1\",\"web_app_url\":\"https:\\/\\/stackfood.6amtech.com\\/\"}', NULL, NULL),
(103, 'wallet_status', '1', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(104, 'loyalty_point_status', '0', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(105, 'ref_earning_status', '1', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(106, 'wallet_add_refund', '1', '2022-07-05 03:26:19', '2022-07-05 03:26:19'),
(107, 'loyalty_point_exchange_rate', '1', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(108, 'ref_earning_exchange_rate', '5', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(109, 'loyalty_point_item_purchase_point', '5', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(110, 'loyalty_point_minimum_point', '100', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(111, 'refund_active_status', '1', '2022-07-05 03:26:20', '2024-01-15 01:16:36'),
(112, 'dm_tips_status', '1', '2022-07-05 03:26:20', '2022-07-05 03:26:20'),
(113, 'system_language', '[{\"id\":1,\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":true},{\"id\":\"ar2\",\"direction\":\"rtl\",\"code\":\"ar\",\"status\":1,\"default\":false}]', '2023-08-15 23:29:41', '2024-01-11 23:05:42'),
(114, 'site_direction', NULL, NULL, NULL),
(115, 'cookies_text', 'We use cookies to improve user experience, and analyze website traffic. For these reasons, we may share your site usage data with our analytics partners. By continuing to the site, you consent to store on your device all the technologies described in our cookie policy.', NULL, NULL),
(116, 'tax_included', NULL, NULL, NULL),
(117, 'partial_payment_status', NULL, NULL, NULL),
(118, 'partial_payment_method', 'cod', NULL, NULL),
(119, 'order_notification_type', 'firebase', NULL, NULL),
(120, 'free_delivery_over_status', '1', NULL, NULL),
(121, 'additional_charge_status', NULL, NULL, NULL),
(122, 'additional_charge_name', 'Additional Charge', NULL, NULL),
(123, 'additional_charge', NULL, NULL, NULL),
(124, 'prescription_order_status', '1', NULL, NULL),
(125, 'delivery_charge_comission', '0', NULL, NULL),
(126, 'opening_time', NULL, NULL, NULL),
(127, 'closing_time', NULL, NULL, NULL),
(128, 'landing_page', '1', '2023-08-15 23:56:24', '2023-08-15 23:56:24'),
(129, 'landing_integration_type', 'file_upload', '2023-08-15 23:56:24', '2023-08-15 23:56:24'),
(130, 'mobile_app_section_heading', 'Download the App for Enjoy Best Restaurant Test', '2023-08-17 00:26:56', '2023-08-17 00:26:56'),
(131, 'mobile_app_section_text', 'Default Text Mobile App Section', '2023-08-17 00:26:56', '2023-08-17 00:26:56'),
(132, 'feature_section_description', 'Feature section description', '2023-08-17 00:26:56', '2023-08-17 00:26:56'),
(133, 'Feature section description', '{\"app_url_android_status\":\"0\",\"app_url_android\":\"https:\\/\\/play.google.com\",\"app_url_ios_status\":\"0\",\"app_url_ios\":\"https:\\/\\/www.apple.com\\/app-store\",\"web_app_url_status\":\"0\",\"web_app_url\":\"https:\\/\\/6ammart-web.6amtech.com\\/\"}', '2023-08-17 00:26:56', '2023-08-17 00:26:56'),
(134, 'home_delivery_status', '1', '2023-08-17 00:26:56', '2023-08-17 00:26:56'),
(135, 'takeaway_status', '1', '2023-08-17 00:26:56', '2023-08-17 00:26:56'),
(136, 'dm_picture_upload_status', '1', NULL, NULL),
(137, 'offline_payment_status', '1', NULL, '2024-01-11 23:26:05'),
(138, 'apple_login', '[{\"login_medium\":\"apple\",\"client_id\":\"\",\"client_secret\":\"\",\"team_id\":\"\",\"key_id\":\"\",\"service_file\":\"\",\"redirect_url\":\"\",\"status\":\"\"}]', '2024-01-10 13:50:07', '2024-01-10 13:50:07'),
(139, 'guest_checkout_status', '1', NULL, NULL),
(140, 'backgroundChange', '{\"primary_1_hex\":\"#0f6799\",\"primary_1_rgb\":\"15, 103, 153\",\"primary_2_hex\":\"#51a3d2\",\"primary_2_rgb\":\"81, 163, 210\"}', NULL, NULL),
(141, 'forget_password_mail_status_admin', '1', NULL, NULL),
(142, 'fcm_credentials', '{\"apiKey\":\"AIzaSyDnT2o2UnUWo3S_UmHR8UzckwdmKk9kKqE\",\"authDomain\":\"shops-wallet.firebaseapp.com\",\"projectId\":\"shops-wallet\",\"storageBucket\":\"shops-wallet.appspot.com\",\"messagingSenderId\":\"552944845446\",\"appId\":\"1:552944845446:web:971eb395854f1932e14707\",\"measurementId\":\"G-F9TPWXPP23\"}', NULL, NULL),
(143, 'cash_in_hand_overflow_store', '1', NULL, NULL),
(144, 'cash_in_hand_overflow_store_amount', '100', NULL, NULL),
(145, 'min_amount_to_pay_store', '200', NULL, NULL),
(146, 'product_approval', '0', NULL, NULL),
(147, 'product_approval_datas', '{\"Update_product_price\":\"1\",\"Add_new_product\":\"1\",\"Update_product_variation\":\"1\",\"Update_anything_in_product_details\":\"1\"}', NULL, NULL),
(148, 'access_all_products', NULL, NULL, NULL),
(149, 'product_gallery', '1', NULL, NULL),
(150, 'schedule_order_slot_duration_time_format', 'min', NULL, NULL),
(151, 'min_amount_to_pay_dm', '500', NULL, NULL),
(152, 'cash_in_hand_overflow_delivery_man', '1', NULL, NULL),
(153, 'dm_max_cash_in_hand', '100', NULL, NULL),
(154, 'add_fund_status', '1', NULL, NULL),
(155, 'react_setup', '{\"status\":0,\"react_license_code\":\"45370351\",\"react_domain\":\"https:\\/\\/nilsagor.com\",\"react_platform\":\"codecanyon\"}', NULL, NULL),
(156, 'app_activation', '[{\"software_id\":\"45370351\",\"is_active\":1}]', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `title`, `image`, `description`, `status`, `admin_id`, `created_at`, `updated_at`, `start_date`, `end_date`, `start_time`, `end_time`, `module_id`) VALUES
(1, 'Offer Product', '2024-01-15-65a50453672fe.png', 'Buy Now', 1, NULL, '2024-01-15 04:09:23', '2024-01-15 04:09:23', '2024-01-15', '2024-01-27', '07:38:00', '16:38:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `campaign_store`
--

CREATE TABLE `campaign_store` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `campaign_status` varchar(10) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `add_on_ids` text DEFAULT NULL,
  `add_on_qtys` text DEFAULT NULL,
  `item_type` varchar(255) NOT NULL,
  `price` double(24,3) NOT NULL,
  `quantity` int(11) NOT NULL,
  `variation` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `title` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL DEFAULT 'def.png',
  `video` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `title`, `price`, `image`, `video`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`, `module_id`, `slug`, `featured`) VALUES
(1, 'Fruts', NULL, 0, '2024-02-14-65cc8072b4b6e.png', NULL, 0, 0, 1, '2024-02-14 06:27:22', '2024-02-14 06:27:22', 0, 2, 'fruts', 0),
(2, 'Fruts Fruts', NULL, 0, 'def.png', NULL, 1, 1, 1, '2024-02-14 06:28:00', '2024-02-14 06:28:00', 0, 2, 'fruts-fruts', 0),
(3, 'Fruts Fruts Fruts', NULL, 0, 'def.png', NULL, 2, 2, 1, '2024-02-14 06:29:12', '2024-02-14 06:29:12', 0, 2, 'fruts-fruts-fruts', 0),
(4, 'Vegitable', NULL, 0, '2024-02-14-65cc811213832.png', NULL, 0, 0, 1, '2024-02-14 06:30:02', '2024-02-14 06:30:02', 0, 2, 'vegitable', 0),
(5, 'Juce', NULL, 0, '2024-02-14-65cc8131074b5.png', NULL, 0, 0, 1, '2024-02-14 06:30:33', '2024-02-14 06:30:33', 0, 2, 'juce', 0),
(6, 'Chilly', NULL, 0, 'def.png', NULL, 4, 1, 1, '2024-02-14 06:37:34', '2024-02-14 06:37:34', 0, 2, 'chilly', 0),
(11, 'AC', 'Ac Clening D', 0, '2024-02-25-65dabf035d1bd.png', '2024-02-25-65dabf035eed9.mp4', 0, 0, 1, '2024-02-25 01:16:03', '2024-02-27 04:28:13', 0, 8, 'ac', 0),
(12, 'TEst ACD', '', 0, '2024-02-27-65dd70073b7ba.png', '2024-02-27-65dd70075fdf3.mp4', 11, 1, 1, '2024-02-27 02:15:51', '2024-02-27 02:15:51', 0, 8, 'test-acd', 0),
(13, 'TEst Acd Child', '', 0, '2024-02-27-65dd83a9c06e0.png', '2024-02-27-65dd8408038a9.mp4', 12, 2, 1, '2024-02-27 02:38:38', '2024-02-27 03:41:12', 0, 8, 'test-acd-child', 0),
(14, 'TEstAddon D', 'Test Title Addonu', 4000, '2024-02-27-65dd8a1206112.png', '', 11, 3, 1, '2024-02-27 04:06:58', '2024-02-27 04:19:50', 0, 8, 'testaddon-d', 0),
(15, 'TEst', 'Test Title D', 4000, '2024-02-27-65dd8d9bd2758.png', '', 11, 3, 0, '2024-02-27 04:22:03', '2024-02-27 04:39:01', 0, 8, 'test', 0),
(16, 'Add On D', 'Add On Title D', 9000, '2024-02-27-65dd9188afe08.png', '', 11, 3, 1, '2024-02-27 04:34:29', '2024-02-27 04:38:48', 0, 8, 'add-on', 0),
(17, 'TEst ACD', '', 0, '2024-03-06-65e837489174d.png', '', 0, 0, 1, '2024-03-06 06:28:40', '2024-03-06 06:28:40', 0, 9, 'test-acd', 0),
(18, 'ggg', 'ggg', 0, '2024-03-06-65e840aed98b0.png', '', 0, 0, 1, '2024-03-06 07:08:46', '2024-03-06 07:08:46', 0, 8, 'ggg', 0),
(19, 'bbb', 'bbb', 0, '2024-03-06-65e840c21bbaf.png', '', 0, 0, 1, '2024-03-06 07:09:06', '2024-03-06 07:09:06', 0, 9, 'bbb', 0),
(20, 'bbbbsub', '', 0, '2024-03-06-65e843be82de2.png', '', 19, 1, 1, '2024-03-06 07:21:50', '2024-03-06 07:21:50', 0, 9, 'bbbbsub', 0),
(21, 'childbbbb', '', 0, '2024-03-06-65e843db20cbf.png', '', 20, 2, 1, '2024-03-06 07:22:19', '2024-03-06 07:22:19', 0, 9, 'childbbbb', 0);

-- --------------------------------------------------------

--
-- Table structure for table `common_conditions`
--

CREATE TABLE `common_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `seen` tinyint(4) NOT NULL DEFAULT 0,
  `feedback` varchar(255) NOT NULL DEFAULT '0',
  `reply` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `sender_type` varchar(255) NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_type` varchar(255) NOT NULL,
  `last_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `last_message_time` timestamp NULL DEFAULT NULL,
  `unread_message_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `sender_id`, `sender_type`, `receiver_id`, `receiver_type`, `last_message_id`, `last_message_time`, `unread_message_count`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', 0, 'admin', 14, '2024-02-22 04:39:42', 2, '2024-01-14 09:49:50', '2024-02-22 04:39:42'),
(2, 3, 'vendor', 1, 'customer', 13, '2024-02-09 05:11:48', 0, '2024-01-15 12:12:30', '2024-02-09 05:17:16');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` varchar(50) DEFAULT 'admin',
  `customer_id` varchar(255) DEFAULT '["all"]',
  `slug` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', 1.00, NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', 1.00, NULL, NULL),
(3, 'Euro', 'EUR', '€', 1.00, NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', 1.00, NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', 1.00, NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', 1.00, NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', 1.00, NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', 1.00, NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', 1.00, NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', 1.00, NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', 1.00, NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', 1.00, NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', 1.00, NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', 1.00, NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', 1.00, NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', 1.00, NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', 1.00, NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', 1.00, NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', 1.00, NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', 1.00, NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', 1.00, NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', 1.00, NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', 1.00, NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', 1.00, NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', 1.00, NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', 1.00, NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', 1.00, NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', 1.00, NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', 1.00, NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', 1.00, NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', 1.00, NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', 1.00, NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', 1.00, NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', 1.00, NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', 1.00, NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', 1.00, NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', 1.00, NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', 1.00, NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', 1.00, NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', 1.00, NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', 1.00, NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', 1.00, NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', 1.00, NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', 1.00, NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', 1.00, NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', 1.00, NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', 1.00, NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', 1.00, NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', 1.00, NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', 1.00, NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', 1.00, NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', 1.00, NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', 1.00, NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', 1.00, NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', 1.00, NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', 1.00, NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', 1.00, NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', 1.00, NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', 1.00, NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', 1.00, NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', 1.00, NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', 1.00, NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', 1.00, NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', 1.00, NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', 1.00, NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', 1.00, NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', 1.00, NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', 1.00, NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', 1.00, NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', 1.00, NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', 1.00, NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', 1.00, NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', 1.00, NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', 1.00, NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', 1.00, NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', 1.00, NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', 1.00, NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', 1.00, NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', 1.00, NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', 1.00, NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', 1.00, NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', 1.00, NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', 1.00, NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', 1.00, NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', 1.00, NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', 1.00, NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', 1.00, NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', 1.00, NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', 1.00, NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', 1.00, NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', 1.00, NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', 1.00, NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', 1.00, NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', 1.00, NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', 1.00, NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', 1.00, NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', 1.00, NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', 1.00, NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', 1.00, NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', 1.00, NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', 1.00, NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', 1.00, NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', 1.00, NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', 1.00, NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', 1.00, NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', 1.00, NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', 1.00, NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', 1.00, NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', 1.00, NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', 1.00, NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', 1.00, NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', 1.00, NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', 1.00, NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', 1.00, NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', 1.00, NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', 1.00, NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', 1.00, NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', 1.00, NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', 1.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) NOT NULL,
  `contact_person_number` varchar(20) NOT NULL,
  `address` text DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `road` varchar(255) DEFAULT NULL,
  `house` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_settings`
--

CREATE TABLE `data_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_settings`
--

INSERT INTO `data_settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'admin_login_url', 'admin', 'login_admin', '2023-06-11 14:34:59', '2023-06-11 14:34:59'),
(2, 'admin_employee_login_url', 'admin-employee', 'login_admin_employee', '2023-06-11 14:34:59', '2023-06-11 14:34:59'),
(3, 'store_login_url', 'store', 'login_store', '2023-06-11 14:34:59', '2023-06-11 14:34:59'),
(4, 'store_employee_login_url', 'store-employee', 'login_store_employee', '2023-06-11 14:34:59', '2023-06-11 14:34:59'),
(5, 'fixed_header_title', 'Manage Your  Daily Life in one platform', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(6, 'fixed_header_sub_title', 'More than just a reliable  eCommerce platform', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(7, 'fixed_module_title', 'Your eCommerce venture starts here !', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(8, 'fixed_module_sub_title', 'Enjoy all services in one platform', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(9, 'fixed_referal_title', 'Earn point by', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(10, 'fixed_referal_sub_title', 'Refer Your Friend', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(11, 'fixed_newsletter_title', 'Sign Up to Our Newsletter', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(12, 'fixed_newsletter_sub_title', 'Receive Latest News, Updates and Many Other News Every Week', 'admin_landing_page', '2023-06-11 15:06:27', '2023-06-11 15:06:27'),
(13, 'fixed_footer_article_title', 'Shopswallet is a complete package!  It\'s time to empower your multivendor online business with  powerful features!', 'admin_landing_page', '2023-06-11 15:06:27', '2024-01-12 12:09:05'),
(14, 'feature_title', 'Remarkable Features that You Can Count!', 'admin_landing_page', '2023-06-11 15:14:25', '2023-06-11 15:14:25'),
(15, 'feature_short_description', 'Jam-packed with outstanding features to elevate your online ordering and delivery easier, and smarter than ever before. It\'s time to empower your multivendor online business with 6amMart\'s powerful features!', 'admin_landing_page', '2023-06-11 15:14:25', '2023-06-11 15:14:25'),
(16, 'earning_title', 'Earn Money', 'admin_landing_page', '2023-06-11 15:26:01', '2023-06-11 15:26:01'),
(17, 'earning_sub_title', 'Earn money  by using different platform', 'admin_landing_page', '2023-06-11 15:26:01', '2023-06-11 15:26:01'),
(18, 'earning_seller_image', '2023-08-16-64dcaa6634ab5.png', 'admin_landing_page', '2023-06-11 15:27:29', '2023-08-15 23:52:22'),
(19, 'seller_app_earning_links', '{\"playstore_url_status\":null,\"playstore_url\":null,\"apple_store_url_status\":null,\"apple_store_url\":null}', 'admin_landing_page', NULL, NULL),
(20, 'earning_delivery_image', '2023-08-16-64dcaa7ba5b80.png', 'admin_landing_page', '2023-06-11 15:28:48', '2023-08-15 23:52:43'),
(21, 'dm_app_earning_links', '{\"playstore_url_status\":null,\"playstore_url\":null,\"apple_store_url_status\":null,\"apple_store_url\":null}', 'admin_landing_page', NULL, NULL),
(22, 'why_choose_title', 'What so Special About Shopswallet ?', 'admin_landing_page', '2023-06-11 15:30:30', '2024-01-12 12:09:49'),
(23, 'counter_section', '{\"app_download_count_numbers\":\"300\",\"seller_count_numbers\":\"85\",\"deliveryman_count_numbers\":\"150\",\"customer_count_numbers\":\"10000\",\"status\":\"1\"}', 'admin_landing_page', NULL, NULL),
(24, 'download_user_app_title', 'Let’s  Manage', 'admin_landing_page', '2023-06-11 15:38:17', '2023-06-11 15:38:17'),
(25, 'download_user_app_sub_title', 'Your business  Smartly or Earn.', 'admin_landing_page', '2023-06-11 15:38:17', '2023-06-11 15:38:17'),
(26, 'download_user_app_image', '2023-08-16-64dcaab460ac2.png', 'admin_landing_page', '2023-06-11 15:38:17', '2023-08-15 23:53:40'),
(27, 'download_user_app_links', '{\"playstore_url_status\":\"1\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/apps\\/details?id=com.sixamtech.sixam_mart_store_app\",\"apple_store_url_status\":\"1\",\"apple_store_url\":\"https:\\/\\/www.apple.com\\/app-store\"}', 'admin_landing_page', NULL, NULL),
(28, 'testimonial_title', 'People Who Shared Love with us?', 'admin_landing_page', '2023-06-11 15:42:04', '2023-06-11 15:42:04'),
(29, 'contact_us_title', 'Contact Us', 'admin_landing_page', '2023-06-11 15:53:22', '2023-06-11 15:53:22'),
(30, 'contact_us_sub_title', 'Any question or remarks? Just write us a message!', 'admin_landing_page', '2023-06-11 15:53:22', '2023-06-11 15:53:22'),
(31, 'contact_us_image', '2023-08-16-64dcab0c7b434.png', 'admin_landing_page', '2023-06-11 15:53:23', '2023-08-15 23:55:08'),
(32, 'refund_policy_status', '1', 'admin_landing_page', '2023-06-11 20:10:58', '2023-06-11 20:10:58'),
(33, 'refund_policy', NULL, 'admin_landing_page', '2023-06-11 20:10:59', '2023-06-11 20:10:59'),
(34, 'header_title', '$Your e-Commerce!$', 'react_landing_page', '2023-06-12 16:30:53', '2023-06-12 19:41:19'),
(35, 'header_sub_title', 'Venture Starts Here', 'react_landing_page', '2023-06-12 16:30:53', '2023-06-12 17:55:14'),
(36, 'header_tag_line', 'More than just a reliable $eCommerce$ platform', 'react_landing_page', '2023-06-12 16:30:53', '2023-06-12 17:45:24'),
(37, 'header_icon', '2023-08-16-64dcac0088f46.png', 'react_landing_page', '2023-06-12 16:30:53', '2023-08-15 23:59:12'),
(38, 'header_banner', '2023-08-20-64e1e31738bbc.png', 'react_landing_page', '2023-06-12 16:30:53', '2023-08-19 22:55:35'),
(39, 'company_title', '$6amMart$', 'react_landing_page', '2023-06-12 16:35:07', '2023-06-12 17:46:19'),
(40, 'company_sub_title', 'is Best Delivery Service Near You', 'react_landing_page', '2023-06-12 16:35:07', '2023-06-12 16:35:07'),
(41, 'company_description', '6amMart is a one-stop shop for all your daily necessities. You can shop for groceries, and pharmacy items, order food, and send important parcels from one place to another from the comfort of your home.', 'react_landing_page', '2023-06-12 16:35:07', '2023-06-12 16:35:07'),
(42, 'company_button_name', 'Order Now', 'react_landing_page', '2023-06-12 16:35:07', '2023-06-12 17:46:52'),
(43, 'company_button_url', 'https://6ammart-react.6amtech.com/', 'react_landing_page', '2023-06-12 16:35:07', '2023-06-12 16:35:07'),
(44, 'download_user_app_title', 'Complete Multipurpose eBusiness Solution', 'react_landing_page', '2023-06-12 16:40:30', '2023-06-12 16:40:30'),
(45, 'download_user_app_sub_title', '6amMart is a Laravel and Flutter Framework-based multi-vendor food, grocery, eCommerce, parcel, and pharmacy delivery system. It has six modules to cover all your business function', 'react_landing_page', '2023-06-12 16:40:30', '2023-06-12 16:40:30'),
(46, 'download_user_app_image', NULL, 'react_landing_page', '2023-06-12 16:40:30', '2023-06-12 16:40:30'),
(47, 'download_user_app_links', '{\"playstore_url_status\":\"1\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/\",\"apple_store_url_status\":\"1\",\"apple_store_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}', 'react_landing_page', NULL, NULL),
(48, 'earning_title', 'Let’s Start Earning with $6amMart$', 'react_landing_page', '2023-06-12 16:43:22', '2023-06-12 16:43:22'),
(49, 'earning_sub_title', 'Join our online marketplace revolution and boost your income.', 'react_landing_page', '2023-06-12 16:43:22', '2023-06-12 16:43:22'),
(50, 'earning_seller_title', 'Become a Seller', 'react_landing_page', '2023-06-12 16:45:07', '2023-06-12 16:45:07'),
(51, 'earning_seller_sub_title', 'Register as seller & open shop in 6amMart to start your business', 'react_landing_page', '2023-06-12 16:45:07', '2023-06-12 16:45:07'),
(52, 'earning_seller_button_name', 'Register', 'react_landing_page', '2023-06-12 16:45:07', '2023-06-12 16:45:07'),
(53, 'earning_seller_button_url', 'https://6ammart-admin.6amtech.com/store/apply', 'react_landing_page', '2023-06-12 16:45:07', '2023-06-12 16:45:07'),
(54, 'earning_dm_title', 'Become a $Delivery Man$', 'react_landing_page', '2023-06-12 16:45:55', '2023-06-12 17:53:01'),
(55, 'earning_dm_sub_title', 'Register as delivery man and earn money', 'react_landing_page', '2023-06-12 16:45:55', '2023-06-12 16:45:55'),
(56, 'earning_dm_button_name', 'Register', 'react_landing_page', '2023-06-12 16:45:55', '2023-06-12 16:45:55'),
(57, 'earning_dm_button_url', 'https://6ammart-admin.6amtech.com/deliveryman/apply', 'react_landing_page', '2023-06-12 16:45:55', '2023-06-12 16:45:55'),
(58, 'promotion_banner', '[{\"img\":\"2023-08-16-64dcac89cd0fa.png\"},{\"img\":\"2023-08-16-64dcac93a324a.png\"},{\"img\":\"2023-08-16-64dcad5a24940.png\"}]', 'react_landing_page', NULL, '2023-08-16 00:01:02'),
(59, 'business_title', '$Let’s$', 'react_landing_page', '2023-06-12 16:52:29', '2023-06-12 16:52:29'),
(60, 'business_sub_title', 'Manage your business  Smartly', 'react_landing_page', '2023-06-12 16:52:29', '2023-06-12 17:54:18'),
(61, 'business_image', '2023-08-16-64dcad66585e9.png', 'react_landing_page', '2023-06-12 16:52:29', '2023-08-16 00:05:10'),
(62, 'download_business_app_links', '{\"seller_playstore_url_status\":\"1\",\"seller_playstore_url\":\"https:\\/\\/play.google.com\\/store\",\"seller_appstore_url_status\":\"1\",\"seller_appstore_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\",\"dm_playstore_url_status\":\"1\",\"dm_playstore_url\":\"https:\\/\\/play.google.com\\/store\",\"dm_appstore_url_status\":\"1\",\"dm_appstore_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}', 'react_landing_page', NULL, NULL),
(63, 'testimonial_title', 'We $satisfied$ some Customer & Restaurant Owners', 'react_landing_page', '2023-06-12 16:53:04', '2023-06-12 16:53:04'),
(64, 'fixed_promotional_banner', '2023-08-16-64dcadedb4fac.png', 'react_landing_page', '2023-06-12 17:18:24', '2023-08-16 00:07:25'),
(65, 'fixed_footer_description', 'Connect with our social media and other sites to keep up to date', 'react_landing_page', '2023-06-12 17:21:12', '2023-06-12 17:21:12'),
(66, 'fixed_newsletter_title', 'Join Us!', 'react_landing_page', '2023-06-12 17:23:45', '2023-06-12 17:23:45'),
(67, 'fixed_newsletter_sub_title', 'Subscribe to our weekly newsletter and be a part of our journey to self discovery and love.', 'react_landing_page', '2023-06-12 17:23:45', '2023-06-12 17:23:45'),
(68, 'fixed_header_title', 'Shopswallet', 'flutter_landing_page', '2023-06-12 17:31:35', '2024-01-12 12:11:45'),
(69, 'fixed_header_sub_title', 'More than just reliable eCommerce platform', 'flutter_landing_page', '2023-06-12 17:31:35', '2023-06-12 17:32:30'),
(70, 'fixed_header_image', '2024-01-12-65a180e1dce5e.png', 'flutter_landing_page', '2023-06-12 17:31:35', '2024-01-12 12:11:45'),
(71, 'fixed_location_title', 'Qatar', 'flutter_landing_page', '2023-06-12 17:35:02', '2024-01-12 12:11:28'),
(72, 'fixed_module_title', 'Your eCommerce venture starts here !', 'flutter_landing_page', '2023-06-12 17:37:29', '2023-06-12 17:37:29'),
(73, 'fixed_module_sub_title', 'Enjoy all services in one platform', 'flutter_landing_page', '2023-06-12 17:37:29', '2023-06-12 17:37:29'),
(74, 'join_seller_title', 'Become a Seller', 'flutter_landing_page', '2023-06-12 18:12:56', '2023-06-12 18:12:56'),
(75, 'join_seller_sub_title', 'Registered as a seller and open shop for start your business', 'flutter_landing_page', '2023-06-12 18:12:56', '2023-06-12 18:12:56'),
(76, 'join_seller_button_name', 'Register', 'flutter_landing_page', '2023-06-12 18:12:56', '2023-06-12 18:12:56'),
(77, 'join_seller_button_url', 'https://6ammart-admin.6amtech.com/store/apply', 'flutter_landing_page', '2023-06-12 18:12:56', '2023-06-12 18:12:56'),
(78, 'join_delivery_man_title', 'Join as  Deliveryman', 'flutter_landing_page', '2023-06-12 18:16:03', '2023-06-12 18:16:03'),
(79, 'join_delivery_man_sub_title', 'Registered as a deliveryman and earn money', 'flutter_landing_page', '2023-06-12 18:16:03', '2023-06-12 18:16:03'),
(80, 'join_delivery_man_button_name', 'Register', 'flutter_landing_page', '2023-06-12 18:16:03', '2023-06-12 18:16:03'),
(81, 'join_delivery_man_button_url', 'https://6ammart-admin.6amtech.com/deliveryman/apply', 'flutter_landing_page', '2023-06-12 18:16:03', '2023-06-12 18:16:03'),
(82, 'download_user_app_title', 'Download app and enjoy more!', 'flutter_landing_page', '2023-06-12 18:17:56', '2023-06-12 18:17:56'),
(83, 'download_user_app_sub_title', 'Download app from', 'flutter_landing_page', '2023-06-12 18:17:56', '2023-06-12 18:17:56'),
(84, 'download_user_app_image', '2023-08-16-64dcae82675b2.png', 'flutter_landing_page', '2023-06-12 18:17:56', '2023-08-16 00:09:54'),
(85, 'download_user_app_links', '{\"playstore_url_status\":\"1\",\"playstore_url\":\"https:\\/\\/play.google.com\\/store\\/\",\"apple_store_url_status\":\"1\",\"apple_store_url\":\"https:\\/\\/www.apple.com\\/app-store\\/\"}', 'flutter_landing_page', NULL, NULL),
(86, 'fixed_link', '{\"web_app_url_status\":null,\"web_app_url\":null}', 'admin_landing_page', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `identity_number` varchar(30) DEFAULT NULL,
  `identity_type` varchar(50) DEFAULT NULL,
  `identity_image` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `earning` tinyint(1) NOT NULL DEFAULT 1,
  `current_orders` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL DEFAULT 'zone_wise',
  `store_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') NOT NULL DEFAULT 'approved',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `assigned_order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disbursements`
--

CREATE TABLE `disbursements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `total_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_for` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disbursement_details`
--

CREATE TABLE `disbursement_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disbursement_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `disbursement_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `payment_method` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `disbursement_withdrawal_methods`
--

CREATE TABLE `disbursement_withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `method_fields` text NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) NOT NULL DEFAULT 'percentage',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_vehicles`
--

CREATE TABLE `d_m_vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `starting_coverage_area` double(16,2) NOT NULL,
  `maximum_coverage_area` double(16,2) NOT NULL,
  `extra_charges` double(16,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `background_image` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `button_name` varchar(100) DEFAULT NULL,
  `button_url` varchar(255) DEFAULT NULL,
  `footer_text` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `email_type` varchar(255) DEFAULT NULL,
  `email_template` varchar(255) DEFAULT NULL,
  `privacy` tinyint(1) NOT NULL DEFAULT 0,
  `refund` tinyint(1) NOT NULL DEFAULT 0,
  `cancelation` tinyint(1) NOT NULL DEFAULT 0,
  `contact` tinyint(1) NOT NULL DEFAULT 0,
  `facebook` tinyint(1) NOT NULL DEFAULT 0,
  `instagram` tinyint(1) NOT NULL DEFAULT 0,
  `twitter` tinyint(1) NOT NULL DEFAULT 0,
  `linkedin` tinyint(1) NOT NULL DEFAULT 0,
  `pinterest` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `body`, `background_image`, `image`, `logo`, `icon`, `button_name`, `button_url`, `footer_text`, `copyright_text`, `type`, `email_type`, `email_template`, `privacy`, `refund`, `cancelation`, `contact`, `facebook`, `instagram`, `twitter`, `linkedin`, `pinterest`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Change Password Request', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL, NULL, '2023-06-12-6486f303174e0.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 Shopswallet. All rights reserved.', 'admin', 'forget_password', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 16:26:24', '2024-01-11 23:14:47'),
(2, 'New Store Registration Request', '<p>Please find below the details of the new Store registration:</p>\n\n<p>&nbsp;</p>\n\n<p><strong>Store Name: {storeName}</strong></p>\n\n<p>To review the store from the respective Module, go to:&nbsp;</p>\n\n<p><strong>Module Section</strong><strong>&rarr;Store Management&rarr;New Stores</strong></p>\n\n<p>&nbsp;</p>\n\n<p>Or you can directly review the store here &rarr;</p>\n\n<p>&nbsp;</p>', NULL, '2023-06-12-6486f4420b5c1.png', '2023-06-12-6486f4420d61d.png', NULL, 'Review Request', 'https://www.facebook.com/', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'store_registration', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 16:32:34', '2023-06-12 19:59:26'),
(3, 'New Deliveryman Registration Request', '<p>Please find below the details of the new Deliveryman registration:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Deliveryman Name: {deliveryManName}</strong></p>\r\n\r\n<p>To review the store from the respective Module, go to:&nbsp;</p>\r\n\r\n<p><strong>Users</strong><strong>&rarr;Deliveryman Management&rarr;New Deliveryman</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-6486f4fe20b2c.png', '2023-06-12-6486f528877fe.png', NULL, 'Review Request', 'https://www.facebook.com/', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'dm_registration', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 16:35:42', '2023-06-12 20:04:49'),
(4, 'New Withdraw Request', '<p>Please find below the details of the new Withdraw Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Store Name: {storeName}</strong></p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;</p>\r\n\r\n<p><strong>Transactions &amp; Reports</strong><strong>&rarr;Withdraw Requests</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-6486f5b6a24a4.png', 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'withdraw_request', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 16:38:46', '2023-06-12 20:04:17'),
(5, '“BUY ONE GET ONE” Campaign Join Request', '<p>Please find below the details of the new Campaign Join Request:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Store Name: {storeName}</strong></p>\r\n\r\n<p>To review the Refund Request, go to:&nbsp;</p>\r\n\r\n<p><strong>Module Section</strong><strong>&rarr;Choose Module&rarr;Promotion Management&rarr;Campaigns&rarr;Basic Campaigns&rarr;Buy One Get One</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-6486f611cfb9b.png', '2023-06-12-6486f611cfdf0.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'campaign_request', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 16:40:17', '2023-06-12 20:06:04'),
(6, 'You Have A Refund Request.', '<p>Please find below the details of the new Refund Request:</p>\r\n\r\n<p><strong>Customer Name: {userName}</strong></p>\r\n\r\n<p><strong>Order ID: {orderId}</strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, '2023-06-12-6486fb27a6a00.png', NULL, 'Review Request', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'refund_request', '2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 17:01:59', '2023-06-12 20:14:43'),
(7, 'Mart Morning [ID 1234] Just Signed In', '<p>Mart Morning [ID 1234] just signed in from the Store Panel.&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Login Time:</strong> 12.00pm</p>', NULL, NULL, '2023-06-12-6486fbdeb92d6.png', NULL, 'Check Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'admin', 'login', '2', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 17:05:02', '2023-06-12 17:05:02'),
(8, 'Your Registration is Submitted Successfully!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Store Registration Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your store registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-6487024230762.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 17:32:18', '2023-06-12 17:32:18'),
(9, 'Congratulations! Your Registration is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>First</strong>, you need to log in to your store panel.&nbsp;</p>\r\n\r\n<p><strong>After that,</strong> please set up your store and start selling!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> &rarr; </strong><a href=\"https://6ammart-admin.6amtech.com/store-panel/business-settings/store-setup\">https://6ammart-admin.6amtech.com/store-panel/business-settings/store-setup</a></p>', NULL, NULL, NULL, '2023-06-12-648702fb014dd.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'approve', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 17:35:23', '2023-06-12 20:01:31'),
(10, 'Your Registration is Rejected', '<p>Dear User,&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your store registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To find out more please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648706ce4d5fb.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'deny', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 17:47:03', '2023-06-12 17:51:42'),
(11, 'Congratulations! Your Withdrawal is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw is approved by the Admin and transferred to you bank account.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870788562d9.png', 'See details', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'withdraw_approve', '6', 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '2023-06-12 17:54:48', '2023-06-12 17:54:48'),
(12, 'Your Withdraw Request was Rejected.', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you requested to withdraw is rejected by the Admin.</p>\r\n\r\n<p>Reason: Insufficient Balance.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648708244930a.png', 'See Details', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'withdraw_deny', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 17:57:24', '2023-06-12 17:57:24'),
(13, 'Your Request is Completed!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Campaign Request.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Soon you&rsquo;ll know if your request is approved or rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-648708d132665.png', '2023-06-12-6487088da18cb.png', NULL, 'See Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'campaign_request', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 17:59:09', '2023-06-12 18:00:17'),
(14, 'Congratulations! Your Campaign Request is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your request to join campaign is approved by the Admin.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-6487091d3ee5a.png', '2023-06-12-6487091d3f0b3.png', NULL, 'View Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'campaign_approve', '1', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:01:33', '2023-06-12 20:04:45'),
(15, 'Your Campaign Join Request Was Rejected.', '<p>Dear User,</p>\r\n\r\n<p>Your request to join the&nbsp;campaign was rejected by the admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-648709ce3e893.png', '2023-06-12-648709ce3ead2.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'store', 'campaign_deny', '7', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:04:30', '2023-06-12 20:06:55'),
(16, 'Your Registration is Completed!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;ve received your Deliveryman Registration Request.</p>\r\n\r\n<p>Soon you&rsquo;ll know if your Deliveryman registration is accepted or declined by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Stay Tuned!</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870c80bb7bb.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, '2023-06-12 18:16:00', '2023-06-12 18:16:00'),
(17, 'Congratulations! Your Registration is Approved!', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your registration is approved by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Here&rsquo;s what to do next:&nbsp;</strong></p>\r\n\r\n<ol>\r\n	<li>Download the Deliveryman app</li>\r\n	<li>Login with below credentials.</li>\r\n</ol>\r\n\r\n<p><strong>After that,</strong> please set up your account and start delivery!&nbsp;</p>\r\n\r\n<p><br />\r\n<strong>Click here</strong><strong> to download the app&rarr; </strong><a href=\"https://play.google.com/store/apps/details?id=com.sixamtech.sixam_mart_delivery_app&amp;pli=1\">https://play.google.com/store/apps/details?id=com.sixamtech.sixam_mart_delivery_app&amp;pli=1</a></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870cebc5fc6.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'approve', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:17:47', '2023-06-12 20:09:23'),
(18, 'Your Registration is Rejected', '<p>Dear User,&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We&rsquo;re sorry to announce that your Deliveryman registration was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To find out more please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870da0bf819.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'deny', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:20:48', '2023-06-12 18:20:48'),
(19, 'Your Account is Suspended.', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your Deliveryman account has been suspended by the Admin/Store.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please contact related person to know more.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-06-12-64870e1ba4908.png', '2023-06-12-64870e1ba4cd1.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'suspend', '7', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:22:51', '2023-06-12 18:22:51'),
(20, 'Cash Collected.', '<p>Dear User,</p>\r\n\r\n<p>The Admin has collected cash from you.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870ecf8ef10.png', 'See Details', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'dm', 'cash_collect', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:25:51', '2023-06-12 20:11:22'),
(21, 'Reset Your Password', '<p>Please use this OTP to reset your Password&nbsp;&rarr;</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64870f8dcfcc5.png', '', '', 'Please contact us for any queries; we’re always happy to help.', 'Copyright 2023 6amMart. All right reserved.', 'dm', 'forget_password', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:29:01', '2023-06-12 20:12:27'),
(22, 'Your Registration is Successful!', '<p>Congratulations!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You&rsquo;ve successfully registered.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64871218e4c0e.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'registration', '5', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:39:52', '2023-06-12 18:39:52'),
(23, 'Please Register with The OTP', '<p>ONE MORE STEP:&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Please copy the following OTP &amp; paste in on your sign-up page to complete your registration.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648712f6a5196.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'registration_otp', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:43:34', '2023-06-12 20:13:03'),
(24, 'Confirm Your Login.', '<p>Please copy the following OTP &amp; paste in on your Log in page to confirm your account.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648713d7b9612.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'login_otp', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:46:46', '2023-06-12 20:13:41'),
(25, 'Please Verify Your Delivery.', '<p>Please give the following OTP to your Deliveryman to ensure your order.</p>\r\n\r\n<p><strong>7 5 8 9 4 3 </strong></p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-648714cf7f15a.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'order_verification', '4', 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, '2023-06-12 18:51:27', '2023-06-12 18:51:27'),
(26, 'Your Order is Successful', '<p>Hi <strong>{userName}</strong>,</p>\r\n\r\n<p>Your order is successful. Please find your invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, 'Track Order', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'new_order', '3', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:52:36', '2023-06-12 20:16:37'),
(27, 'Refund Order', '<p>Hi <strong>{userName}</strong>,</p>\r\n\r\n<p>We&rsquo;ve refunded your requested amount. Please find your refund invoice below.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'refund_order', '9', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:53:40', '2023-06-12 20:18:12'),
(28, 'Reset Your Password', '<p>Please copy the following OTP &amp; paste in on your Log in page to&nbsp;reset your Password.</p>', NULL, NULL, NULL, '2023-06-12-64872af38ecfb.png', '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved..', 'user', 'forget_password', '4', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:54:59', '2023-06-12 20:25:55'),
(29, 'Your Refund Request was Rejected.', '<p>Dear User,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The amount you request for a refund was rejected by the Admin.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>To know more please contact us.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, '2023-06-12-648716141b3fd.png', NULL, '', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'refund_request_deny', '8', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:56:52', '2023-06-12 18:56:52'),
(30, 'Fund Added to your Wallet.', '<p>Dear <strong>{userName}</strong>,</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>The Admin has sent fund to your Wallet. Please check your wallet.</p>\r\n\r\n<p>&nbsp;</p>', NULL, NULL, NULL, '2023-06-12-64871653198e0.png', 'Check Status', '', 'Please contact us for any queries; we’re always happy to help.', '© 2023 6amMart. All rights reserved.', 'user', 'add_fund', '6', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-06-12 18:57:55', '2023-06-12 20:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `modules` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'custom',
  `amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_by` varchar(50) DEFAULT 'admin',
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `type`, `amount`, `order_id`, `created_at`, `updated_at`, `description`, `created_by`, `store_id`, `delivery_man_id`, `user_id`) VALUES
(1, 'free_delivery', 0.000, 100002, '2024-01-17 12:41:56', '2024-01-17 12:41:56', '', 'vendor', 3, NULL, NULL),
(2, 'discount_on_product', 9.500, 100002, '2024-01-17 12:41:56', '2024-01-17 12:41:56', '', 'vendor', 3, NULL, NULL),
(3, 'discount_on_product', 0.500, 100002, '2024-01-17 12:41:56', '2024-01-17 12:41:56', '', 'admin', NULL, NULL, NULL),
(4, 'free_delivery', 0.000, 100005, '2024-01-26 06:27:02', '2024-01-26 06:27:02', '', 'vendor', 3, NULL, NULL),
(5, 'discount_on_product', 0.950, 100005, '2024-01-26 06:27:02', '2024-01-26 06:27:02', '', 'vendor', 3, NULL, NULL),
(6, 'discount_on_product', 0.050, 100005, '2024-01-26 06:27:02', '2024-01-26 06:27:02', '', 'admin', NULL, NULL, NULL);

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
-- Table structure for table `flash_sales`
--

CREATE TABLE `flash_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `is_publish` tinyint(1) NOT NULL DEFAULT 1,
  `admin_discount_percentage` double(24,3) NOT NULL,
  `vendor_discount_percentage` double(24,3) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale_items`
--

CREATE TABLE `flash_sale_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_sale_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) NOT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `available_stock` int(11) NOT NULL,
  `discount_type` varchar(255) NOT NULL,
  `discount` double(23,3) NOT NULL DEFAULT 0.000,
  `discount_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `price` double(23,3) NOT NULL DEFAULT 0.000,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flutter_special_criterias`
--

CREATE TABLE `flutter_special_criterias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flutter_special_criterias`
--

INSERT INTO `flutter_special_criterias` (`id`, `title`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo Feature Title', '2023-08-16-64dcae4ca0594.png', 1, '2023-08-16 00:09:00', '2023-08-16 00:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `fcm_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`id`, `ip_address`, `fcm_token`, `created_at`, `updated_at`) VALUES
(1, '103.184.71.76', '@', '2024-01-12 01:46:09', '2024-01-12 01:46:09'),
(2, '74.125.151.132', '@', '2024-01-12 02:01:46', '2024-01-12 02:01:46'),
(3, '74.125.151.133', '@', '2024-01-12 02:06:29', '2024-01-12 02:06:29'),
(4, '103.184.71.76', '@', '2024-01-12 10:23:17', '2024-01-12 10:23:17'),
(5, '103.184.71.76', '@', '2024-01-12 11:57:49', '2024-01-12 11:57:49'),
(6, '65.154.226.171', '@', '2024-01-12 12:04:07', '2024-01-12 12:04:07'),
(7, '178.152.31.47', '@', '2024-01-12 12:08:14', '2024-01-12 12:08:14'),
(8, '103.184.71.76', 'eujWLlS4Q7qmpo26SUDTxG:APA91bGQkUhmxG2bjPO8C2ytjGiZsD5n5eH6x_uUpwekaR9lTxpUG3cx4J7xPvFCZRZ0fSD4YhecxpnLb84H8h2XKW1rKMHGj6xa1mocKwjGAXjm2PoegENkH8A-g2-V4PUeI05j7z5_', '2024-01-12 12:11:21', '2024-01-12 12:11:21'),
(9, '74.125.210.133', 'BLACKLISTED', '2024-01-12 14:19:21', '2024-01-12 14:19:21'),
(10, '103.184.71.185', '@', '2024-01-14 08:21:47', '2024-01-14 08:21:47'),
(11, '103.184.71.185', 'cBpXLNEVT_eJPQqPH2IGDx:APA91bF10yMPUSmXA7M2SNnSxOVwb08tuxtElWPNsjYJDhalaUM9FISgXF51Zq36XvKJQoHKEGNSYAUGUtSyezmgm7J8vEgfRijjDL-cGcSEDWDCPeZrA78Ntx5WTNb83ytxRTo486cN', '2024-01-15 03:44:52', '2024-01-15 03:44:52'),
(12, '74.125.216.197', '@', '2024-01-16 01:22:52', '2024-01-16 01:22:52'),
(13, '66.249.72.197', '@', '2024-01-16 13:37:09', '2024-01-16 13:37:09'),
(14, '66.249.72.196', '@', '2024-01-16 13:37:16', '2024-01-16 13:37:16'),
(15, '2405:201:600a:8021:cd82:8df0:72ec:5b91', '@', '2024-01-16 23:10:49', '2024-01-16 23:10:49'),
(16, '74.125.218.197', '@', '2024-01-18 02:21:56', '2024-01-18 02:21:56'),
(17, '66.249.64.129', '@', '2024-01-20 21:39:17', '2024-01-20 21:39:17'),
(18, '66.249.64.129', '@', '2024-01-20 22:07:56', '2024-01-20 22:07:56'),
(19, '66.249.89.68', '@', '2024-01-21 02:08:36', '2024-01-21 02:08:36'),
(20, '66.249.89.64', '@', '2024-01-22 02:43:21', '2024-01-22 02:43:21'),
(21, '66.249.89.65', '@', '2024-01-22 02:47:21', '2024-01-22 02:47:21'),
(22, '2406:d00:aaaa:40e0:49bc:dcd6:246d:f91c', 'fVszD9qQTZSGb5svfpSoVX:APA91bFcSpxHqBrJSntbNGVPgB7BBoQa-CGaG7M1QU5jQGt954EOPsZl2BsTZnbpyaaMEt-bkLFhjGEy2n9rh6K6fz2hcXI3v_sL9l6x8Pa-YKE7rL5No97gMJ1yLyH2QXSNyaQcjoSC', '2024-01-23 01:41:09', '2024-01-23 01:41:09'),
(23, '2406:d00:aaaa:89d8:a07a:712b:c434:b344', 'ekVx8pe0QUCj01dKavrTDX:APA91bEy5zjjF1-N1GyJnAKPJm8EiWdbgH9yYbLppfAUPmBhcEM_Cucu0nJNkzw6fYxd91GIKaPrh4ii1islf53xwsPulyWIedi-H5VHLXh1px5rBuEV31TNK9VblC7Sy9WeGxfiv-iZ', '2024-01-23 11:04:28', '2024-01-23 11:04:28'),
(24, '178.152.31.47', '@', '2024-01-28 02:21:25', '2024-01-28 02:21:25'),
(25, '66.249.77.196', '@', '2024-01-28 05:46:11', '2024-01-28 05:46:11'),
(26, '66.249.77.196', '@', '2024-01-28 05:46:12', '2024-01-28 05:46:12'),
(27, '66.249.77.198', '@', '2024-01-29 00:25:41', '2024-01-29 00:25:41'),
(28, '74.125.218.198', '@', '2024-01-29 01:19:54', '2024-01-29 01:19:54'),
(29, '66.249.92.208', '@', '2024-01-30 02:00:20', '2024-01-30 02:00:20'),
(30, '74.125.151.133', '@', '2024-01-31 01:25:25', '2024-01-31 01:25:25'),
(31, '74.125.151.132', '@', '2024-01-31 19:51:05', '2024-01-31 19:51:05'),
(32, '74.125.151.133', '@', '2024-01-31 19:51:05', '2024-01-31 19:51:05'),
(33, '178.153.74.63', '@', '2024-02-03 00:40:19', '2024-02-03 00:40:19'),
(34, '74.125.151.132', '@', '2024-02-04 01:12:48', '2024-02-04 01:12:48'),
(35, '2406:d00:aaaa:319d:e156:a9a5:22ba:a455', 'e5_tXURPStGEI5ObwwHk24:APA91bFjIlWK31Is3nGmCoTemrGn2M_jTqsuay5wE1vlqVWtVcFojuD_vqPo6kubqOWot4-YMY35LHoYbxLDyZKFb-ipc82KmIIjr2bpzwbUDUWhzL2DnKOoymDW68ggLNxEf1swqTWm', '2024-02-06 00:13:51', '2024-02-06 00:13:51'),
(36, '2406:d00:aaaa:319d:7091:abef:1dfb:f4e', 'foi80_NZTtmGYyJjIbyhgC:APA91bHptLZ6pz--xCfcW-Tg5wEb35KKXTj6KhgJzNsbmFrlAbZDWm_MX97o3145EE5SBV9XiHEkQdNvlwwcAy2vmZPRyJ6R5dUj59538uE6ruCsRD1SF92vnTv148DT3nUHQSUztPHb', '2024-02-06 04:09:13', '2024-02-06 04:09:13'),
(37, '74.125.151.133', '@', '2024-02-07 02:01:54', '2024-02-07 02:01:54'),
(38, '74.125.151.134', '@', '2024-02-07 20:22:48', '2024-02-07 20:22:48'),
(39, '74.125.151.134', '@', '2024-02-07 20:22:48', '2024-02-07 20:22:48'),
(40, '74.125.151.132', '@', '2024-02-08 01:46:57', '2024-02-08 01:46:57'),
(41, '74.125.151.128', '@', '2024-02-09 05:30:09', '2024-02-09 05:30:09'),
(42, '66.249.70.132', '@', '2024-02-09 17:00:33', '2024-02-09 17:00:33'),
(43, '66.249.70.132', '@', '2024-02-09 17:00:40', '2024-02-09 17:00:40'),
(44, '111.88.87.129', 'eZO6lo3XTUuQ7CkpqmsOLW:APA91bEhiPiu34SomS77kGsw3OzTaqJ6DxZU3fSHFEw3D_X_j3zCzz4j4XOJ7OqNFBhAxgWAVeZ74iXEOKGaRgBaBzhNCPd4ZHNtyyDTB-QNtYUvjj_GqEZadOnJ0QPIIdT9RNG3Fnc-', '2024-02-09 20:28:28', '2024-02-09 20:28:28'),
(45, '74.125.151.134', '@', '2024-02-10 13:06:08', '2024-02-10 13:06:08'),
(46, '103.82.125.230', '@', '2024-02-10 19:02:32', '2024-02-10 19:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `add_ons` varchar(255) DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `avg_rating` double(16,14) NOT NULL DEFAULT 0.00000000000000,
  `rating_count` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(255) DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `food_variations` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `organic` tinyint(1) NOT NULL DEFAULT 0,
  `maximum_cart_quantity` int(11) DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `category_id`, `category_ids`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `store_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`, `module_id`, `brand_id`, `stock`, `unit_id`, `images`, `food_variations`, `slug`, `recommended`, `organic`, `maximum_cart_quantity`, `is_approved`) VALUES
(1, 'Disney Fruts', 'Disney Fruts', '2024-02-14-65cc81a3a5d56.png', 1, '[{\"id\":\"1\",\"position\":1}]', '[]', '[]', '[]', '[]', 100.00, 0.00, 'percent', 9.00, 'percent', '00:00:00', '23:59:59', 0, 1, 2, '2024-02-14 06:32:27', '2024-02-14 06:32:27', 0, 0.00000000000000, 0, NULL, 2, NULL, 0, 1, '[\"2024-02-14-65cc81a3a456f.png\"]', '[]', 'disney-fruts', 0, 1, NULL, 1),
(2, 'Disney Fruts Fruts', 'Disney Fruts Fruts', '2024-02-14-65cc81f74f0aa.png', 2, '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]', '[]', '[]', '[]', '[]', 125.00, 0.00, 'percent', 5.00, 'percent', '00:00:00', '23:59:59', 0, 1, 2, '2024-02-14 06:33:51', '2024-02-14 06:33:51', 0, 0.00000000000000, 0, NULL, 2, 2, 0, 1, '[\"2024-02-14-65cc81f74c893.png\"]', '[]', 'disney-sub-fruts', 0, 1, NULL, 1),
(3, 'Disney Fruts Fruts Fruts', 'Disney Fruts Fruts Fruts', '2024-02-14-65cc824b1e5c3.png', 3, '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2},{\"id\":\"3\",\"position\":3}]', '[]', '[]', '[]', '[]', 152.00, 0.00, 'percent', 12.00, 'percent', '00:00:00', '23:59:59', 0, 1, 2, '2024-02-14 06:35:15', '2024-02-14 06:35:15', 0, 0.00000000000000, 0, NULL, 2, NULL, 0, 1, '[\"2024-02-14-65cc824b1becb.png\"]', '[]', 'disney-sub-sub-fruts', 0, 1, NULL, 1),
(4, 'Bitcoin Buy and sale', 'Bitcoin Buy and sale', '2024-02-14-65cc82a1a0021.png', 4, '[{\"id\":\"4\",\"position\":1}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'percent', '00:00:00', '23:59:59', 0, 1, 2, '2024-02-14 06:36:41', '2024-02-14 06:36:41', 0, 0.00000000000000, 0, NULL, 2, NULL, 0, 1, '[\"2024-02-14-65cc82a19dd7b.png\"]', '[]', 'demo', 0, 1, NULL, 1),
(5, 'Chill Buy Now', 'Chilli by now', '2024-02-14-65cc831de617e.png', 6, '[{\"id\":\"4\",\"position\":1},{\"id\":\"6\",\"position\":2}]', '[]', '[]', '[]', '[]', 450.00, 0.00, 'percent', 13.00, 'percent', '00:00:00', '23:59:59', 0, 1, 0, '2024-02-14 06:38:45', '2024-02-14 06:38:45', 0, 0.00000000000000, 0, NULL, 2, NULL, 0, 1, '[\"2024-02-14-65cc831de385d.png\"]', '[]', 'xxx', 0, 1, NULL, 1),
(6, 'King Product Buy Now', 'King Product Buy Now', '2024-02-14-65cc83be79648.png', 3, '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2},{\"id\":\"3\",\"position\":3}]', '[{\"type\":\"Red\",\"price\":250,\"stock\":11.98}]', '[]', '[\"1\"]', '[{\"name\":\"choice_1\",\"title\":\"Color\",\"options\":[\"Red\"]}]', 250.00, 0.00, 'percent', 0.00, 'percent', '00:00:00', '23:59:59', 0, 1, 2, '2024-02-14 06:41:26', '2024-02-14 06:43:24', 0, 0.00000000000000, 0, NULL, 2, NULL, 11, 1, '[\"2024-02-14-65cc83be75437.png\"]', '[]', 'ccc', 0, 1, NULL, 1),
(7, 'TEst ACD', 'asdasd', '2024-03-06-65e7eb892770e.png', 13, '[{\"id\":\"11\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"13\",\"position\":3}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'amount', '00:00:00', '23:59:59', 0, 1, 0, '2024-03-06 01:05:29', '2024-03-06 01:20:48', 0, 0.00000000000000, 0, NULL, 8, NULL, 0, 1, '[\"2024-03-06-65e7eb89258e6.png\"]', '[]', 'xxx-2', 0, 0, NULL, 1),
(8, 'TEst ACDU', 'zxczxczx', '2024-03-06-65e7f25bd632b.png', 13, '[{\"id\":\"11\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"13\",\"position\":3}]', '[]', '[]', '[]', '[]', 1.00, 0.00, 'percent', 0.00, 'amount', '00:00:00', '23:59:59', 0, 1, 0, '2024-03-06 01:34:35', '2024-03-06 03:40:15', 0, 0.00000000000000, 0, NULL, 8, NULL, 0, 1, '[\"2024-03-06-65e7f25bd459a.png\"]', '[]', 'cc', 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `add_ons` varchar(255) DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) NOT NULL DEFAULT 'percent',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT 0,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `food_variations` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `maximum_cart_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_tag`
--

CREATE TABLE `item_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) DEFAULT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `sender_id`, `message`, `file`, `is_seen`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Hi boss any one here', NULL, 1, '2024-01-14 09:49:50', '2024-03-10 02:14:40'),
(2, 1, 2, 'yes we are here to help you sir', NULL, 1, '2024-01-15 01:21:44', '2024-02-03 22:58:06'),
(3, 1, 1, 'My order was cancelled', NULL, 1, '2024-01-15 01:22:44', '2024-03-10 02:14:40'),
(4, 1, 2, 'yes sir we are checking for that can i keep you on hold for a mint', NULL, 1, '2024-01-15 01:23:39', '2024-02-03 22:58:06'),
(5, 1, 2, 'sir you miss place the order', NULL, 1, '2024-01-15 01:24:38', '2024-02-03 22:58:06'),
(6, 2, 3, 'Hi sir', NULL, 1, '2024-01-15 12:12:30', '2024-02-09 05:17:16'),
(7, 2, 3, 'Are you looking for', NULL, 1, '2024-01-15 12:12:37', '2024-02-09 05:17:16'),
(8, 2, 1, 'Yes 👍', NULL, 1, '2024-01-15 12:13:13', '2024-02-09 05:11:35'),
(9, 2, 1, 'Hi sir i want to cancel my order', NULL, 1, '2024-01-17 12:40:08', '2024-02-09 05:11:35'),
(10, 2, 1, 'Hello sir any updates', NULL, 1, '2024-02-03 22:57:45', '2024-02-09 05:11:35'),
(11, 1, 1, 'Sir shop owner is not ready 😔', NULL, 1, '2024-02-03 22:58:03', '2024-03-10 02:14:40'),
(12, 1, 2, 'kkkkk', NULL, 0, '2024-02-07 02:56:01', '2024-02-07 02:56:01'),
(13, 2, 3, 'hi how are you guys', NULL, 1, '2024-02-09 05:11:48', '2024-02-09 05:17:16'),
(14, 1, 5, 'test', NULL, 0, '2024-02-22 04:39:42', '2024-02-22 04:39:42');

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
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(4, '2016_06_01_000004_create_oauth_clients_table', 30),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(8, '2021_06_17_054551_create_soft_credentials_table', 31),
(9, '2022_04_10_030533_create_newsletters_table', 32),
(10, '2022_04_12_015827_create_social_media_table', 32),
(11, '2022_04_12_215009_create_jobs_table', 32),
(12, '2022_04_21_145207_add_column_to_modules_table', 32),
(13, '2022_05_12_170027_add_column_to_customer_addresses_table', 33),
(14, '2022_05_14_155444_add_all_zones_column_to_modules_table', 33),
(15, '2022_05_26_120821_change_data_column_to_user_notifiations_table', 33),
(16, '2022_03_31_103418_create_wallet_transactions_table', 34),
(17, '2022_03_31_103827_create_loyalty_point_transactions_table', 34),
(18, '2022_04_09_161150_add_wallet_point_columns_to_users_table', 34),
(19, '2022_05_14_122133_add_dm_tips_column_to_orders_table', 34),
(20, '2022_05_14_122603_add_dm_tips_column_to_order_transactions_table', 34),
(21, '2022_05_17_153333_add_ref_code_to_users_table', 34),
(22, '2022_07_31_103626_add_free_delivery_by_column_to_orders_table', 35),
(23, '2022_09_10_112137_create_user_infos_table', 36),
(24, '2022_09_10_112203_create_conversations_table', 36),
(25, '2022_09_10_112220_create_messages_table', 36),
(26, '2022_10_18_092639_create_refunds_table', 37),
(27, '2022_10_18_093323_add_refund_request_cancel_column_to_orders_table', 37),
(28, '2022_10_18_093529_create_refund_reasons_table', 37),
(29, '2022_10_19_150319_add_delivery_column_to_parcel_categories_table', 37),
(30, '2022_10_19_165501_add_default_link_column_to_banners_table', 37),
(31, '2022_10_20_105050_module_zone', 37),
(32, '2022_10_22_115553_add_is_logged_column_to_admins_table', 37),
(33, '2022_10_22_122336_add_is_logged_column_to_vendor_employees_table', 37),
(34, '2022_10_25_153214_add_payment_method_columns_to_zones_table', 37),
(35, '2022_10_31_165427_add_rename_delivery_charge_column_to_stores_table', 37),
(36, '2022_11_05_094404_add_delivery_fee_comission_to_order_transactions_table', 37),
(37, '2022_11_13_130054_create_contacts_table', 37),
(38, '2022_11_15_111925_create_expenses_table', 37),
(39, '2022_11_15_112413_add_expense_column_to_order_transactions_table', 37),
(40, '2022_12_20_104455_add_food_variations_column_to_items_table', 38),
(41, '2022_12_21_154227_alter_table_order_details_change_variation', 38),
(42, '2022_12_29_103803_add_order_id_column_to_expenses_table', 38),
(43, '2022_12_29_105321_add_maximum_cod_order_amount_column_to_module_zone_table', 38),
(44, '2022_12_29_114005_add_prescription_order_column_to_orders_table', 38),
(45, '2022_12_31_111437_create_notification_messages_table', 38),
(46, '2023_01_02_112948_create_tags_table', 38),
(47, '2023_01_02_113235_item_tag', 38),
(48, '2023_01_03_093510_add_current_language_key_column_to_users_table', 38),
(49, '2023_01_07_115354_add_prescription_order_to_stores_table', 38),
(50, '2023_01_07_180000_add_description_to_expenses_table', 38),
(51, '2023_01_10_124723_add_food_variations_column_to_item_campaigns_table', 38),
(52, '2023_01_10_145928_change_refund_amount_column_type', 38),
(53, '2023_01_10_150108_change_amount_column_type', 38),
(54, '2023_01_23_144828_add_tax_status_column_to_orders_table', 39),
(55, '2023_01_30_114113_change_delivery_charge_column_type_to_admin_wallets_table', 39),
(56, '2023_01_23_103943_add_slug_to_items_table', 40),
(57, '2023_01_23_144001_add_slug_to_categories_table', 40),
(58, '2023_01_23_144119_add_slug_to_item_campaigns_table', 40),
(59, '2023_01_23_144232_add_slug_to_stores_table', 40),
(60, '2023_02_25_133200_create_d_m_vehicles_table', 40),
(61, '2023_02_25_133302_add_vehicle_id_column_to_delivery_men_table', 40),
(62, '2023_02_25_133409_add_vehicle_id_column_to_orders_table', 40),
(63, '2023_02_25_163329_add_maximum_delivery_charge_column_to_module_zone_table', 40),
(64, '2023_02_25_175825_add_otp_hit_count_cols_in_phone_verifications_table', 40),
(65, '2023_02_25_175912_add_hit_count_at_col_in_password_resets_table', 40),
(66, '2023_02_26_144503_add_campaign_status_to_campaign_store_table', 40),
(67, '2023_02_26_162224_add_recommened_to_items_table', 40),
(68, '2023_02_27_102931_add_ref_by_col_to_users_table', 40),
(69, '2023_02_27_111635_create_order_cancel_reasons_table', 40),
(70, '2023_02_27_111937_add_cancellation_reason_col_to_orders_table', 40),
(71, '2023_02_27_161418_add_created_by_columns_to_coupons_table', 40),
(72, '2023_02_27_161533_add_created_by_columns_to_expenses_table', 40),
(73, '2023_02_27_162252_add_store_expense_columns_to_order_transactions_table', 40),
(74, '2023_02_27_162357_add_coupon_created_by_columns_to_orders_table', 40),
(75, '2023_03_01_154319_add_maximum_delivery_charge_column_to_stores_table', 40),
(76, '2023_03_02_103114_add_discount_on_product_by_column_to_orders_table', 40),
(77, '2023_03_02_143919_change_amount_column_to_expenses_table', 40),
(78, '2023_03_02_144258_add_discount_amount_by_store_col_to_order_transactions_table', 40),
(79, '2023_03_11_120645_add_temp_block_time_col_to_phone_verifications_table', 41),
(80, '2023_03_11_121000_add_temp_block_time_col_to_password_resets_table', 41),
(81, '2023_03_13_181502_add_temp_token_column_to_users_table', 41),
(82, '2023_04_05_112916_add_created_by_col_to_password_resets_table', 42),
(83, '2023_05_04_100012_create_data_settings_table', 42),
(84, '2023_05_04_100930_create_admin_promotional_banners_table', 42),
(85, '2023_05_04_101825_create_admin_features_table', 42),
(86, '2023_05_04_102015_create_admin_special_criterias_table', 42),
(87, '2023_05_07_152523_create_admin_testimonials_table', 42),
(88, '2023_05_07_173609_create_flutter_special_criterias_table', 42),
(89, '2023_05_08_125811_create_react_testimonials_table', 42),
(90, '2023_05_09_170006_create_email_templates_table', 42),
(91, '2023_05_16_104129_add_cutlery_processing_time_unavailable_product_note_col_to_orders_table', 42),
(92, '2023_05_18_093438_add_featured_col_to_categories_table', 42),
(93, '2023_05_18_143530_add_delivery_instruction_col_to_orders_table', 42),
(94, '2023_05_18_163841_add_organic_col_to_items_table', 42),
(95, '2023_05_28_153920_add_tax_percentage_col_to_orders_table', 42),
(96, '2023_06_11_172741_add_cutlery_col_to_stores_table', 42),
(97, '2023_07_05_104537_add_maximum_cart_quantity_col_to_items_table', 43),
(98, '2023_07_05_135741_add_service_charge_col_to_orders_table', 43),
(99, '2023_07_05_145800_add_service_charge_col_to_order_transactions_table', 43),
(100, '2023_07_05_155429_add_order_proof_col_to_orders_table', 43),
(101, '2023_07_06_124530_add_partially_paid_amount_col_to_orders_table', 43),
(102, '2023_07_06_144944_create_order_payments_table', 43),
(103, '2023_07_09_120533_add_meta_cols_to_stores_table', 43),
(104, '2023_07_09_143746_create_wallet_payments_table', 43),
(105, '2023_07_10_121938_create_wallet_bonuses_table', 43),
(106, '2023_07_10_153950_add_user_id_col_to_expenses_table', 43),
(107, '2023_07_19_124016_add_maximum_cart_quantity_col_to_item_campaigns_table', 43),
(108, '0000_00_00_000000_create_websockets_statistics_entries_table', 44),
(109, '2023_08_10_131937_create_offline_payment_methods_table', 44),
(110, '2023_08_10_132315_create_offline_payments_table', 44),
(111, '2023_08_14_123526_create_temp_products_table', 44),
(112, '2023_08_14_153229_add_is_approved_col_to_items_table', 44),
(113, '2023_08_20_143852_add_created_by_col_to_banners_table', 44),
(114, '2023_08_21_115610_add_announcement_cols_to_stores_table', 44),
(115, '2023_08_21_173527_create_guests_table', 44),
(116, '2023_08_22_102914_add_is_guest_col_to_orders_table', 44),
(117, '2023_08_24_123045_create_common_conditions_table', 44),
(118, '2023_08_24_151032_create_pharmacy_item_details_table', 44),
(119, '2023_08_26_164947_create_module_wise_banners_table', 44),
(120, '2023_08_27_123438_create_module_wise_why_chooses_table', 44),
(121, '2023_08_28_114316_create_flash_sales_table', 44),
(122, '2023_08_28_134428_create_flash_sale_items_table', 44),
(123, '2023_09_07_131829_create_carts_table', 44),
(124, '2023_09_20_122921_create_store_configs_table', 44),
(125, '2023_09_23_184806_add_flash_sale_cols_to_orders_table', 44),
(126, '2023_10_08_103818_add_increased_delivery_fee_in_zones_table', 44),
(127, '2023_11_21_123038_create_withdrawal_methods_table', 45),
(128, '2023_11_21_123229_create_disbursement_withdrawal_methods_table', 45),
(129, '2023_11_21_123320_create_disbursements_table', 45),
(130, '2023_11_21_123742_add_cols_to_withdraw_requests_table', 45),
(131, '2023_11_21_124049_create_disbursement_details_table', 45),
(132, '2023_11_21_160728_add_created_by_col_to_account_transactions_table', 45),
(133, '2023_11_23_093859_create_parcel_delivery_instructions_table', 45),
(134, '2024_02_27_124758_create_service_cities_table', 46),
(136, '2024_02_29_083045_add_slug_to_service_cities', 47),
(137, '2024_02_29_062908_create_time_slots_table', 48),
(139, '2024_03_11_092456_create_services_table', 49),
(141, '2024_04_17_090230_create_brands_table', 50);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(191) NOT NULL,
  `module_type` varchar(191) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `stores_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) DEFAULT NULL,
  `theme_id` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `all_zone_service` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_type`, `thumbnail`, `status`, `stores_count`, `created_at`, `updated_at`, `icon`, `theme_id`, `description`, `all_zone_service`) VALUES
(1, 'Demo Module', 'grocery', '2023-08-16-64dca575bf3a9.png', 0, 2, '2023-08-15 23:31:17', '2024-01-10 13:58:21', '2023-08-16-64dca575bc1c2.png', 1, '<p>Demo module description.</p>', 0),
(2, 'Grocery', 'grocery', '2024-02-09-65c616b3d299c.png', 1, 3, '2024-01-10 13:57:56', '2024-02-09 07:04:19', '2024-02-09-65c616b3d1771.png', 1, '<p>Grocery</p>', 0),
(3, 'E-commerce', 'ecommerce', '2024-01-15-65a4d99a7cb37.png', 1, 0, '2024-01-15 01:07:06', '2024-01-15 01:07:06', '2024-01-15-65a4d99a732c4.png', 1, '<p>commerce</p>', 0),
(4, 'Food', 'food', '2024-01-15-65a4da7fe0526.png', 1, 0, '2024-01-15 01:10:55', '2024-01-15 01:10:55', '2024-01-15-65a4da7fdc15d.png', 1, '<p>food</p>', 0),
(5, 'Pharmacy', 'pharmacy', '2024-01-15-65a4dae0bb1c1.png', 1, 0, '2024-01-15 01:12:32', '2024-01-15 01:12:32', '2024-01-15-65a4dae0b646f.png', 1, '<p>pharmacy</p>', 0),
(6, 'Parcel', 'parcel', '2024-01-15-65a4db2025aed.png', 1, 0, '2024-01-15 01:13:36', '2024-01-15 01:13:36', '2024-01-15-65a4db2021862.png', 1, '<p>Parcel</p>', 0),
(7, 'services', 'parcel', '2024-01-15-65a4db65c8d62.png', 0, 0, '2024-01-15 01:14:45', '2024-03-06 00:37:24', '2024-01-15-65a4db65c3d5c.png', 1, '<p>services</p>', 0),
(8, 'Service', 'services', '2024-02-25-65daaa467972b.png', 1, 4, '2024-02-24 23:47:34', '2024-03-10 04:25:49', '2024-02-25-65daaa465576d.png', 1, '<p>test</p>', 0),
(9, 'Booking', 'booking', '2024-03-06-65e7e659c841d.png', 1, 0, '2024-03-06 00:43:21', '2024-03-06 00:43:21', '2024-03-06-65e7e659a8493.png', 1, '<p>Booking</p>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_types`
--

CREATE TABLE `module_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_wise_banners`
--

CREATE TABLE `module_wise_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_wise_banners`
--

INSERT INTO `module_wise_banners` (`id`, `module_id`, `key`, `value`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'bottom_section_banner', '2024-01-12-65a166fb80c9a.png', 'promotional_banner', 1, NULL, NULL),
(2, 2, 'best_reviewed_section_banner', '2024-01-12-65a1670ae19ad.png', 'promotional_banner', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_wise_why_chooses`
--

CREATE TABLE `module_wise_why_chooses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `short_description` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module_zone`
--

CREATE TABLE `module_zone` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `minimum_shipping_charge` double(23,2) DEFAULT NULL,
  `maximum_cod_order_amount` double(23,2) DEFAULT NULL,
  `maximum_shipping_charge` double(23,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_zone`
--

INSERT INTO `module_zone` (`id`, `module_id`, `zone_id`, `per_km_shipping_charge`, `minimum_shipping_charge`, `maximum_cod_order_amount`, `maximum_shipping_charge`) VALUES
(1, 1, 1, 10.00, 10.00, 10.00, 10.00),
(2, 2, 2, 10.00, 100.00, 50000.00, 500.00),
(3, 2, 3, 1.00, 25.00, 500.00, 50.00),
(4, 2, 4, 1.00, 10.00, 10000.00, 50.00),
(5, 3, 4, 1.00, 10.00, 10000.00, 50.00),
(6, 5, 4, 1.00, 10.00, 100000.00, 50.00),
(7, 4, 4, 1.00, 10.00, 10000.00, 20.00),
(8, 3, 3, 1.00, 25.00, 500.00, 50.00),
(9, 4, 3, 1.00, 25.00, 500.00, 50.00),
(10, 5, 3, 1.00, 25.00, 500.00, 50.00),
(11, 2, 5, 12.00, 12.00, 12.00, 12.00),
(12, 8, 6, 20.00, 20.00, 20.00, 20.00);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_messages`
--

CREATE TABLE `notification_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_type` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_messages`
--

INSERT INTO `notification_messages` (`id`, `module_type`, `key`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 'grocery', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:40'),
(2, 'grocery', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:40'),
(3, 'grocery', 'order_processing_message', '{userName}, Your order is Processing by {storeName}', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:40'),
(4, 'grocery', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:40'),
(5, 'grocery', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:40'),
(6, 'grocery', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:40'),
(7, 'grocery', 'out_for_delivery_message', '{userName}, Your order {orderId} is ready for delivery', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:41'),
(8, 'grocery', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:41'),
(9, 'grocery', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:41'),
(10, 'grocery', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:41'),
(11, 'grocery', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 16:53:45', '2023-06-12 18:33:41'),
(12, 'food', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:14'),
(13, 'food', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:14'),
(14, 'food', 'order_processing_message', '{userName}, Your food is started for cooking by {storeName}', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:14'),
(15, 'food', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:14'),
(16, 'food', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:14'),
(17, 'food', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:14'),
(18, 'food', 'out_for_delivery_message', '{userName}, Your order {orderId}  is ready for delivery', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:14'),
(19, 'food', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:15'),
(20, 'food', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:15'),
(21, 'food', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:15'),
(22, 'food', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 16:56:00', '2023-06-12 19:19:15'),
(23, 'pharmacy', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(24, 'pharmacy', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(25, 'pharmacy', 'order_processing_message', '{userName}, Your order is Processing by {storeName}', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(26, 'pharmacy', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(27, 'pharmacy', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(28, 'pharmacy', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(29, 'pharmacy', 'out_for_delivery_message', '{userName}, Your order {orderId} is ready for delivery', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(30, 'pharmacy', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(31, 'pharmacy', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(32, 'pharmacy', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(33, 'pharmacy', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 16:57:46', '2023-06-12 19:22:20'),
(34, 'ecommerce', 'order_pending_message', '{userName}, Your  order {orderId} is successfully placed', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(35, 'ecommerce', 'order_confirmation_msg', '{userName}, Your order {orderId} is confirmed', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(36, 'ecommerce', 'order_processing_message', '{userName}, Your order is Processing by {storeName}', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(37, 'ecommerce', 'order_handover_message', 'Delivery man is on the way. For this order {orderId}', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(38, 'ecommerce', 'order_refunded_message', 'Order {orderId} Refunded successfully', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(39, 'ecommerce', 'refund_request_canceled', 'Order {orderId}  Refund request is canceled', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(40, 'ecommerce', 'out_for_delivery_message', '{userName}, Your order {orderId} is ready for delivery', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(41, 'ecommerce', 'order_delivered_message', 'Your order {orderId} is delivered', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(42, 'ecommerce', 'delivery_boy_assign_message', 'Your order {orderId} has been assigned to a delivery man', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(43, 'ecommerce', 'delivery_boy_delivered_message', 'Order {orderId} delivered successfully', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(44, 'ecommerce', 'order_cancled_message', 'Order {orderId} is canceled by your request', 1, '2023-01-17 16:59:24', '2023-06-12 19:25:02'),
(45, 'parcel', 'order_pending_message', '{userName}, Your parcel order is successfully placed', 1, '2023-01-17 17:01:02', '2023-06-12 19:29:42'),
(46, 'parcel', 'order_confirmation_msg', 'Your order {orderId} is confirmed', 1, '2023-01-17 17:01:02', '2023-06-12 19:29:42'),
(47, 'parcel', 'out_for_delivery_message', 'Your parcel order  {orderId}  is ready for delivery', 1, '2023-01-17 17:01:02', '2023-06-12 19:29:42'),
(48, 'parcel', 'order_delivered_message', 'Your parcel id  {orderId}  is delivered', 1, '2023-01-17 17:01:02', '2023-06-12 19:29:42'),
(49, 'parcel', 'delivery_boy_assign_message', 'Your order {orderId}  has been assigned to a delivery man', 1, '2023-01-17 17:01:02', '2023-06-12 19:29:42'),
(50, 'parcel', 'delivery_boy_delivered_message', 'parcel id  {orderId}  delivered successfully', 1, '2023-01-17 17:01:02', '2023-06-12 19:29:42'),
(51, 'parcel', 'order_cancled_message', 'Order is canceled by your request', 1, '2023-01-17 17:01:02', '2023-01-17 17:01:02');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('003e25981188b60f37186a102df26657c010054180a0c99f63fbe87aa2dd7f172c8372d5a70b2972', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-15 08:10:37', '2024-01-15 08:10:37', '2025-01-15 08:10:37'),
('0cebc60750e549f330c35d0a65f119757c666f27cc5b699a318d7feea81e279239f83ac34200ba30', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-12 12:08:37', '2024-01-12 12:08:37', '2025-01-12 12:08:37'),
('1997498c08f04f1161ded157f82506c23fa168c752745971925b7cae8ed34224242877bcfd0f1064', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-02-14 05:29:33', '2024-02-14 05:29:33', '2025-02-14 10:59:33'),
('1b40eeffda2fb54adee67396066baf69f440370526bff091bff4962cefcd342af6ecf4c0033d7ece', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-13 12:09:58', '2024-01-13 12:09:58', '2025-01-13 12:09:58'),
('200662fe1a4c43d8beeee09329d07166a51f3e57b3d7472da36c39744500354c88e65445ee8b3f03', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-15 01:34:11', '2024-01-15 01:34:11', '2025-01-15 01:34:11'),
('297627a682f677ce755449322433a81c0446adcb3ccebf681b160ae5313eb7dae09337e357736d67', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-02-09 04:52:48', '2024-02-09 04:52:48', '2025-02-09 04:52:48'),
('29af4a7952d54c3aa750370970ff0f4df50bcd55e1b4525436992d3e5aecc6f285bcfaf9c378caa8', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-15 08:10:25', '2024-01-15 08:10:25', '2025-01-15 08:10:25'),
('32f65bf364e310738ee1edd9ed0db8c00bc0fc573b2b4fb5febe3949b66520d8c798c4411f27bcec', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-02-13 12:35:32', '2024-02-13 12:35:34', '2025-02-13 18:05:32'),
('50a14982c42b6b1c173b1b20635dfc829a4049cbb41f8bf55c46dc4f77ab9f8506d872de30afc040', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-11 11:09:50', '2024-01-11 11:09:50', '2025-01-11 11:09:50'),
('7f61c2484cea414f9d44b0c836548ad81f5b130ff8876c6d7905a6bde6aeea284b1813db20edd9b8', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-15 01:38:01', '2024-01-15 01:38:01', '2025-01-15 01:38:01'),
('8d4b215392630838820ccaddec5999ed5994b50ea612f883b8e8ad7b0e02d1a66a4afd15291e26e2', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-15 03:21:53', '2024-01-15 03:21:53', '2025-01-15 03:21:53'),
('9ad56480260224cd59793128e89dcfee6deb6291c974cd95d5b7295d7ab707998bd8b56cea43fca7', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-15 04:10:12', '2024-01-15 04:10:12', '2025-01-15 04:10:12'),
('d6e01226e742d09bfe74f86a20cf49436586ca4278081e49b9658a2456a05c3eb9a9a1022768d1c4', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-01-15 01:34:23', '2024-01-15 01:34:23', '2025-01-15 01:34:23'),
('e68980da94f48dd990a1a84de6eccc7b0689266fad1d40ea0b8d5b6f73b431cd95850221e1e7f705', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-02-06 04:30:57', '2024-02-06 04:30:57', '2025-02-06 04:30:57'),
('e6e87cd7390dee3ff873beb41f5253e21999181fada0ee80c2a0bbaa60c0bc1f5df86097f4127ce0', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-02-06 04:00:27', '2024-02-06 04:00:27', '2025-02-06 04:00:27'),
('eb531a0f5413ee6bdb76fef2406547289feca2f784572008fbf5b9d4418baf5045c0165d44b2ed58', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2024-02-03 22:55:45', '2024-02-03 22:55:45', '2025-02-03 22:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qBN0j6SW6nIf47748tgxaKxnqKqCacTxa6gii8yc', NULL, 'http://localhost', 1, 0, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, NULL, 'Laravel Password Grant Client', 'oqQ90HOU0egjgQ01LRzHo9rADUavq16jzWm1TrjT', 'users', 'http://localhost', 0, 1, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(3, NULL, 'stackfood Personal Access Client', 'iRxXixYp4CDo7TWbWNCMelAUwgtScaEMGudnbHQk', NULL, 'http://localhost', 1, 0, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36'),
(4, NULL, 'stackfood Password Grant Client', 'FzGJ1vSlbfGP2mWqF6V575QgVCEfbBHVNA41ApeC', 'users', 'http://localhost', 0, 1, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, 3, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payments`
--

CREATE TABLE `offline_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_fields` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `method_fields` text NOT NULL,
  `method_informations` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_title` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) DEFAULT NULL,
  `transaction_reference` varchar(30) DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `order_note` text DEFAULT NULL,
  `order_type` varchar(255) NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `store_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT 0.00,
  `edited` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_time` varchar(255) DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_attachment` varchar(191) DEFAULT NULL,
  `parcel_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `charge_payer` enum('sender','receiver') DEFAULT NULL,
  `distance` double(16,3) NOT NULL DEFAULT 0.000,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00,
  `free_delivery_by` varchar(255) DEFAULT NULL,
  `refund_request_canceled` timestamp NULL DEFAULT NULL,
  `prescription_order` tinyint(1) NOT NULL DEFAULT 0,
  `tax_status` varchar(50) DEFAULT NULL,
  `dm_vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancellation_reason` varchar(255) DEFAULT NULL,
  `canceled_by` varchar(50) DEFAULT NULL,
  `coupon_created_by` varchar(50) DEFAULT NULL,
  `discount_on_product_by` varchar(50) NOT NULL DEFAULT 'vendor',
  `processing_time` varchar(10) DEFAULT NULL,
  `unavailable_item_note` varchar(255) DEFAULT NULL,
  `cutlery` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_instruction` text DEFAULT NULL,
  `tax_percentage` double(24,3) DEFAULT NULL,
  `additional_charge` double(23,3) NOT NULL DEFAULT 0.000,
  `order_proof` varchar(255) DEFAULT NULL,
  `partially_paid_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `flash_admin_discount_amount` double(24,3) NOT NULL DEFAULT 0.000,
  `flash_store_discount_amount` double(24,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel_reasons`
--

CREATE TABLE `order_cancel_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) DEFAULT NULL,
  `end_location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `item_details` text DEFAULT NULL,
  `variation` text DEFAULT NULL,
  `add_ons` text DEFAULT NULL,
  `discount_on_item` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `tax_amount` decimal(24,2) NOT NULL DEFAULT 1.00,
  `variant` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_ref` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(50) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `store_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `parcel_catgory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00,
  `delivery_fee_comission` double(24,2) NOT NULL DEFAULT 0.00,
  `admin_expense` decimal(23,3) DEFAULT 0.000,
  `store_expense` double(23,3) DEFAULT 0.000,
  `discount_amount_by_store` double(23,3) DEFAULT 0.000,
  `additional_charge` double(23,3) NOT NULL DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_categories`
--

CREATE TABLE `parcel_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `orders_count` int(11) NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parcel_per_km_shipping_charge` double(23,2) DEFAULT NULL,
  `parcel_minimum_shipping_charge` double(23,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_delivery_instructions`
--

CREATE TABLE `parcel_delivery_instructions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instruction` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL,
  `created_by` varchar(50) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `otp_hit_count`, `is_blocked`, `is_temp_blocked`, `temp_block_time`, `created_by`) VALUES
('Faizuddin732@gmail.com', 'C137EOMGK7LI4P0', '2024-01-15 11:59:08', 0, 0, 0, NULL, 'vendor'),
('admin@adminxx.com', 'GEJC36RJCCYIFK7', '2024-02-02 10:10:51', 0, 0, 0, NULL, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `gateway_callback_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_hook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failure_hook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payer_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `external_redirect_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `attribute_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_item_details`
--

CREATE TABLE `pharmacy_item_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `common_condition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_basic` tinyint(1) NOT NULL DEFAULT 0,
  `temp_product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `otp_hit_count` tinyint(4) NOT NULL DEFAULT 0,
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `is_temp_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `temp_block_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `method` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `react_testimonials`
--

CREATE TABLE `react_testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `review` text DEFAULT NULL,
  `reviewer_image` varchar(255) DEFAULT NULL,
  `company_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `react_testimonials`
--

INSERT INTO `react_testimonials` (`id`, `name`, `designation`, `review`, `reviewer_image`, `company_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'CTO', 'Very good Service.', '2023-08-16-64dcad86217a2.png', 'def.png', 1, '2023-08-16 00:05:42', '2023-08-16 00:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `customer_reason` varchar(255) DEFAULT NULL,
  `customer_note` text DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `refund_amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `refund_status` varchar(50) NOT NULL,
  `refund_method` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_reasons`
--

CREATE TABLE `refund_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refund_reasons`
--

INSERT INTO `refund_reasons` (`id`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 'I ordered the wrong food', 1, '2023-08-16 23:39:23', '2023-08-16 23:39:23'),
(2, 'Damaged Or Defective item', 1, '2024-02-09 16:32:42', '2024-02-09 16:32:42'),
(3, 'Received Wrong item/package', 1, '2024-02-09 16:33:21', '2024-02-09 16:33:21'),
(4, 'Missing Items/Parts', 1, '2024-02-09 16:33:49', '2024-02-09 16:33:49');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `item_id`, `user_id`, `comment`, `attachment`, `rating`, `order_id`, `created_at`, `updated_at`, `item_campaign_id`, `status`, `module_id`) VALUES
(1, 4, 2, 'Good 💯', '[]', 5, 100002, '2024-01-17 12:42:31', '2024-01-17 12:42:31', NULL, 1, 2);

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
(1, 7, 8, 6, 6, 13, '[{\"id\":\"11\",\"position\":1},{\"id\":\"12\",\"position\":2},{\"id\":\"13\",\"position\":3}]', '<p>dddd</p>', NULL, 1800.00, 0.00, 'percent', 'daily,monthly', '08:00 am,11:30 pm', NULL, 'EW', 1, 0, '2024-03-13 03:46:33', '2024-03-14 01:44:50');

-- --------------------------------------------------------

--
-- Table structure for table `service_cities`
--

CREATE TABLE `service_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active 0=Inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_cities`
--

INSERT INTO `service_cities` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Gulshan', 'gulshan', 1, '2024-02-28 03:50:39', '2024-02-29 03:29:48'),
(3, 'Gulshan', 'gulshan1', 1, '2024-02-29 00:56:03', '2024-02-29 03:29:51'),
(4, 'TestU', 'test', 1, '2024-02-29 02:33:25', '2024-02-29 03:20:34');

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT 0.00,
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `rating` varchar(255) DEFAULT NULL,
  `cover_photo` varchar(255) DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 1,
  `take_away` tinyint(1) NOT NULL DEFAULT 1,
  `item_section` tinyint(1) NOT NULL DEFAULT 1,
  `type_one` varchar(111) NOT NULL DEFAULT 'Local',
  `type_two` varchar(111) NOT NULL DEFAULT 'Retailer',
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `off_day` varchar(191) NOT NULL DEFAULT ' ',
  `gst` varchar(191) DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT 0,
  `pos_system` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_shipping_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `delivery_time` varchar(100) DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT 1,
  `non_veg` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_place_to_schedule_interval` int(11) DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `per_km_shipping_charge` double(16,3) UNSIGNED NOT NULL DEFAULT 0.000,
  `prescription_order` tinyint(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `maximum_shipping_charge` double(23,3) DEFAULT NULL,
  `cutlery` tinyint(1) NOT NULL DEFAULT 0,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_image` varchar(100) DEFAULT NULL,
  `announcement` tinyint(1) NOT NULL DEFAULT 0,
  `announcement_message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `item_section`, `type_one`, `type_two`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `minimum_shipping_charge`, `delivery_time`, `veg`, `non_veg`, `order_count`, `total_order`, `module_id`, `order_place_to_schedule_interval`, `featured`, `per_km_shipping_charge`, `prescription_order`, `slug`, `maximum_shipping_charge`, `cutlery`, `meta_title`, `meta_description`, `meta_image`, `announcement`, `announcement_message`) VALUES
(2, 'Royal Crown Grocery Outlet', '+919716580257', 'aryanzyraj@gmail.com', '2024-01-10-659ef6194e55d.png', '28.57416566596674', '77.07532266592516', 'Delhi', NULL, 0.00, NULL, 0, 1, 2, '2024-01-10 13:55:05', '2024-01-10 13:55:05', 0, NULL, '2024-01-10-659ef619577f7.png', 1, 1, 1, 'Local', 'Retailer', 0.00, 2, 1, 1, ' ', NULL, 0, 0, 0.00, '30-80 min', 1, 1, 0, 0, 2, 0, 0, 0.000, 0, 'royal-crown-grocery-outlet', NULL, 0, NULL, NULL, NULL, 0, NULL),
(3, 'new Shop', '+97466182120', 'Faizuddin732@gmail.com', '2024-01-12-65a18827c2a51.png', '25.301880689836928', '51.49492944636313', 'madnith khalifa\r\ndoha', NULL, 1.00, NULL, 0, 1, 3, '2024-01-12 12:42:47', '2024-01-26 06:27:02', 1, '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":1}', '2024-01-12-65a18827cedca.png', 1, 1, 1, 'Local', 'Retailer', 1.00, 3, 1, 1, ' ', '{\"status\":null,\"code\":null}', 1, 1, 0.00, '20-45 min', 0, 0, 2, 3, 2, 25, 1, 0.000, 0, 'new-shop', 5000.000, 0, NULL, NULL, NULL, 0, NULL),
(4, 'Royal Crown Grocery Outlet', '+9748700304469', 'admin@gmail.com', '2024-01-15-65a5011e8564e.png', '25.31419419559734', '51.47532652701648', 'Royal Crown Grocery Outlet', NULL, 0.00, NULL, 0, 1, 4, '2024-01-15 03:55:42', '2024-01-26 06:24:46', 0, NULL, '2024-01-15-65a5011e8eb8d.png', 1, 1, 1, 'Local', 'Retailer', 0.00, 3, 1, 1, ' ', NULL, 1, 1, 0.00, '30-60 min', 1, 1, 0, 2, 2, 0, 1, 0.000, 0, 'royal-crown-grocery-outlet-2', NULL, 0, NULL, NULL, NULL, 0, NULL),
(5, 'Aliya store', '+97430853951', 'techstudio.agency@gamil.com', '2024-02-09-65c622d3c459b.png', '25.26334275181729', '51.524164050479335', '7G7F+8M Doha, Qatar', NULL, 0.00, NULL, 0, 1, 5, '2024-02-09 07:04:19', '2024-04-17 07:22:02', 0, NULL, '2024-02-09-65c622d3ce449.png', 1, 1, 1, 'International', 'Wholeseller', 1.00, 4, 1, 1, ' ', NULL, 1, 1, 0.00, '10-30 min', 1, 1, 0, 0, 2, 0, 0, 0.000, 0, 'aliya-store', NULL, 0, NULL, NULL, NULL, 0, NULL),
(6, 'Store', '+8801794973738', 'mutasim@gmail.com', '2024-03-10-65ed44c1451fb.png', '23.789553699192552', '90.41199616103852', 'Store', NULL, 0.00, NULL, 0, 1, 6, '2024-03-10 02:27:29', '2024-03-10 02:32:57', 0, NULL, '2024-03-10-65ed44c17f665.png', 1, 1, 1, 'Local', 'Retailer', 1.00, 6, 1, 1, ' ', NULL, 0, 0, 0.00, '30-60 min', 1, 1, 0, 0, 8, 0, 0, 0.000, 0, 'store', NULL, 0, NULL, NULL, NULL, 0, NULL),
(11, 'Test Api', '+8801724698392', 'test@gmail.com', '2024-03-10-65ed607d1497f.png', '23.78986785054063', '90.41394344478333', 'Test Address Api', NULL, 0.00, NULL, 0, 1, 19, '2024-03-10 04:25:49', '2024-03-13 03:18:52', 0, NULL, 'def.png', 1, 1, 1, 'Local', 'Retailer', 1.00, 6, 1, 1, ' ', NULL, 0, 0, 0.00, '30-60 min', 1, 1, 0, 0, 8, 0, 0, 0.000, 0, 'test-api', NULL, 0, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `store_configs`
--

CREATE TABLE `store_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0,
  `is_recommended_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_schedule`
--

CREATE TABLE `store_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_schedule`
--

INSERT INTO `store_schedule` (`id`, `store_id`, `day`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '04:58:00', '23:55:59', '2024-01-15 04:30:03', '2024-01-15 04:30:03'),
(2, 4, 2, '04:58:00', '23:55:59', '2024-01-15 04:30:08', '2024-01-15 04:30:08'),
(3, 4, 3, '04:58:00', '23:55:59', '2024-01-15 04:30:12', '2024-01-15 04:30:12'),
(4, 4, 4, '04:58:00', '23:55:59', '2024-01-15 04:30:16', '2024-01-15 04:30:16'),
(5, 4, 5, '04:58:00', '23:55:59', '2024-01-15 04:30:19', '2024-01-15 04:30:19'),
(6, 4, 6, '04:58:00', '23:55:59', '2024-01-15 04:30:22', '2024-01-15 04:30:22'),
(7, 4, 0, '04:58:00', '23:55:59', '2024-01-15 04:30:25', '2024-01-15 04:30:25'),
(8, 3, 1, '04:35:00', '23:58:59', '2024-01-15 05:05:59', '2024-01-15 05:05:59'),
(9, 3, 2, '04:35:00', '23:58:59', '2024-01-15 05:06:01', '2024-01-15 05:06:01'),
(10, 3, 3, '04:35:00', '23:58:59', '2024-01-15 05:06:04', '2024-01-15 05:06:04'),
(11, 3, 4, '04:35:00', '23:58:59', '2024-01-15 05:06:07', '2024-01-15 05:06:07'),
(12, 3, 5, '04:35:00', '23:58:59', '2024-01-15 05:06:10', '2024-01-15 05:06:10'),
(13, 3, 6, '04:35:00', '23:58:59', '2024-01-15 05:06:13', '2024-01-15 05:06:13'),
(14, 3, 0, '04:35:00', '23:58:59', '2024-01-15 05:06:15', '2024-01-15 05:06:15'),
(16, 5, 2, '00:10:00', '00:11:59', '2024-02-09 07:10:57', '2024-02-09 07:10:57'),
(17, 5, 3, '00:10:00', '00:11:59', '2024-02-09 07:11:00', '2024-02-09 07:11:00'),
(18, 5, 4, '00:10:00', '00:11:59', '2024-02-09 07:11:03', '2024-02-09 07:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `store_wallets`
--

CREATE TABLE `store_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_wallets`
--

INSERT INTO `store_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 3, 95.05, 0.00, 0.00, 100.00, '2024-01-12 12:43:00', '2024-01-26 06:27:02'),
(2, 4, 0.00, 0.00, 0.00, 0.00, '2024-01-15 04:18:55', '2024-01-15 04:18:55'),
(3, 5, 0.00, 0.00, 0.00, 0.00, '2024-02-09 07:08:37', '2024-02-09 07:08:37'),
(4, 6, 0.00, 0.00, 0.00, 0.00, '2024-03-10 02:28:00', '2024-03-10 02:28:00'),
(5, 19, 0.00, 0.00, 0.00, 0.00, '2024-03-13 03:19:00', '2024-03-13 03:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(1, 'good', '2024-01-15 12:06:37', '2024-01-15 12:06:37');

-- --------------------------------------------------------

--
-- Table structure for table `temp_products`
--

CREATE TABLE `temp_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) DEFAULT NULL,
  `tag_ids` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `food_variations` text DEFAULT NULL,
  `add_ons` varchar(255) DEFAULT NULL,
  `attributes` varchar(255) DEFAULT NULL,
  `choice_options` text DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) NOT NULL DEFAULT 'percent',
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) NOT NULL DEFAULT 'percent',
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `organic` tinyint(1) NOT NULL DEFAULT 0,
  `common_condition_id` bigint(20) UNSIGNED DEFAULT NULL,
  `basic` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `stock` int(11) DEFAULT 0,
  `maximum_cart_quantity` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_rejected` tinyint(1) NOT NULL DEFAULT 0,
  `available_time_ends` time DEFAULT NULL,
  `available_time_starts` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `dstatus` tinyint(1) NOT NULL COMMENT '1=current 0=next',
  `days` int(11) NOT NULL,
  `timeslots` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=publish 0=unpublish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `category_id`, `dstatus`, `days`, `timeslots`, `status`, `created_at`, `updated_at`) VALUES
(1, 11, 0, 4, '08:00 am,09:30 pm,10:50 pm', 1, '2024-03-03 00:42:37', '2024-03-03 03:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `translationable_type`, `translationable_id`, `locale`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Module', 1, 'en', 'module_name', 'Demo Module', NULL, NULL),
(2, 'App\\Models\\Module', 1, 'en', 'description', '<p>Demo module description.</p>', NULL, NULL),
(3, 'App\\Models\\Zone', 1, 'en', 'name', 'Demo Zone', NULL, NULL),
(6, 'App\\Models\\Store', 1, 'en', 'name', 'Demo Store', NULL, NULL),
(7, 'App\\Models\\Store', 1, 'en', 'address', 'House, road', NULL, NULL),
(10, 'App\\Models\\AdminPromotionalBanner', 1, 'en', 'title', 'Demo Title', NULL, NULL),
(11, 'App\\Models\\AdminPromotionalBanner', 1, 'en', 'sub_title', 'Demo Promotional Subtitle', NULL, NULL),
(12, 'App\\Models\\AdminFeature', 1, 'en', 'title', 'Demo Feature Title', NULL, NULL),
(13, 'App\\Models\\AdminFeature', 1, 'en', 'sub_title', 'Demo Feature  Sub Title', NULL, NULL),
(14, 'App\\Models\\AdminSpecialCriteria', 1, 'en', 'title', 'Demo Title', NULL, NULL),
(15, 'App\\Models\\DataSetting', 24, 'en', 'download_user_app_title', 'Let’s  Manage', NULL, NULL),
(16, 'App\\Models\\DataSetting', 25, 'en', 'download_user_app_sub_title', 'Your business  Smartly or Earn.', NULL, NULL),
(17, 'App\\Models\\DataSetting', 29, 'en', 'contact_us_title', 'Contact Us', NULL, NULL),
(18, 'App\\Models\\DataSetting', 30, 'en', 'contact_us_sub_title', 'Any question or remarks? Just write us a message!', NULL, NULL),
(19, 'App\\Models\\DataSetting', 34, 'en', 'header_title', '$Your e-Commerce!$', NULL, NULL),
(20, 'App\\Models\\DataSetting', 35, 'en', 'header_sub_title', 'Venture Starts Here', NULL, NULL),
(21, 'App\\Models\\DataSetting', 36, 'en', 'header_tag_line', 'More than just a reliable $eCommerce$ platform', NULL, NULL),
(22, 'App\\Models\\DataSetting', 59, 'en', 'business_title', '$Let’s$', NULL, NULL),
(23, 'App\\Models\\DataSetting', 60, 'en', 'business_sub_title', 'Manage your business  Smartly', NULL, NULL),
(24, 'App\\Models\\DataSetting', 68, 'en', 'fixed_header_title', '6amMart', NULL, NULL),
(25, 'App\\Models\\DataSetting', 69, 'en', 'fixed_header_sub_title', 'More than just reliable eCommerce platform', NULL, NULL),
(26, 'App\\Models\\FlutterSpecialCriteria', 1, 'en', 'title', 'Demo Feature Title', NULL, NULL),
(27, 'App\\Models\\DataSetting', 82, 'en', 'download_user_app_title', 'Download app and enjoy more!', NULL, NULL),
(28, 'App\\Models\\DataSetting', 83, 'en', 'download_user_app_sub_title', 'Download app from', NULL, NULL),
(29, 'App\\Models\\RefundReason', 1, 'en', 'reason', 'I ordered the wrong food', NULL, NULL),
(30, 'App\\Models\\Zone', 2, 'en', 'name', 'Delhi', NULL, NULL),
(31, 'App\\Models\\Store', 2, 'en', 'name', 'Royal Crown Grocery Outlet', NULL, NULL),
(32, 'App\\Models\\Store', 2, 'en', 'address', 'Delhi', NULL, NULL),
(33, 'App\\Models\\Module', 2, 'en', 'module_name', 'Grocery', NULL, NULL),
(34, 'App\\Models\\Module', 2, 'en', 'description', '<p>Grocery</p>', NULL, NULL),
(35, 'App\\Models\\Zone', 3, 'en', 'name', 'Madinath khalifa', NULL, NULL),
(36, 'App\\Models\\EmailTemplate', 1, 'en', 'title', 'Change Password Request', NULL, NULL),
(37, 'App\\Models\\EmailTemplate', 1, 'en', 'body', '<p>The following user has forgotten his password &amp; requested to change/reset their password.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>User Name: {userName}</strong></p>', NULL, NULL),
(38, 'App\\Models\\EmailTemplate', 1, 'en', 'button_name', '', NULL, NULL),
(39, 'App\\Models\\EmailTemplate', 1, 'en', 'footer_text', 'Please contact us for any queries; we’re always happy to help.', NULL, NULL),
(40, 'App\\Models\\EmailTemplate', 1, 'en', 'copyright_text', '© 2023 Shopswallet. All rights reserved.', NULL, NULL),
(41, 'App\\Models\\Unit', 1, 'en', 'unit', 'Kg', NULL, NULL),
(42, 'App\\Models\\Unit', 2, 'en', 'unit', 'Pcs', NULL, NULL),
(43, 'App\\Models\\Unit', 3, 'en', 'unit', 'Ltr', NULL, NULL),
(44, 'App\\Models\\Unit', 4, 'en', 'unit', 'Pack', NULL, NULL),
(45, 'App\\Models\\Attribute', 1, 'en', 'name', 'Color', NULL, NULL),
(46, 'App\\Models\\Attribute', 2, 'en', 'name', 'Type', NULL, NULL),
(47, 'App\\Models\\Attribute', 3, 'en', 'name', 'Size', NULL, NULL),
(50, 'App\\Models\\Banner', 1, 'en', 'title', 'Offer Banner', NULL, NULL),
(51, 'App\\Models\\Banner', 2, 'en', 'title', 'Offer Banner', NULL, NULL),
(52, 'App\\Models\\Banner', 3, 'en', 'title', 'Offer Banner', NULL, NULL),
(53, 'App\\Models\\Banner', 4, 'en', 'title', 'Offer Banner', NULL, NULL),
(54, 'App\\Models\\DataSetting', 5, 'en', 'fixed_header_title', 'Manage Your  Daily Life in one platform', NULL, NULL),
(55, 'App\\Models\\DataSetting', 6, 'en', 'fixed_header_sub_title', 'More than just a reliable  eCommerce platform', NULL, NULL),
(56, 'App\\Models\\DataSetting', 7, 'en', 'fixed_module_title', 'Your eCommerce venture starts here !', NULL, NULL),
(57, 'App\\Models\\DataSetting', 8, 'en', 'fixed_module_sub_title', 'Enjoy all services in one platform', NULL, NULL),
(58, 'App\\Models\\DataSetting', 9, 'en', 'fixed_referal_title', 'Earn point by', NULL, NULL),
(59, 'App\\Models\\DataSetting', 10, 'en', 'fixed_referal_sub_title', 'Refer Your Friend', NULL, NULL),
(60, 'App\\Models\\DataSetting', 11, 'en', 'fixed_newsletter_title', 'Sign Up to Our Newsletter', NULL, NULL),
(61, 'App\\Models\\DataSetting', 12, 'en', 'fixed_newsletter_sub_title', 'Receive Latest News, Updates and Many Other News Every Week', NULL, NULL),
(62, 'App\\Models\\DataSetting', 13, 'en', 'fixed_footer_article_title', 'Shopswallet is a complete package!  It\'s time to empower your multivendor online business with  powerful features!', NULL, NULL),
(63, 'App\\Models\\DataSetting', 22, 'en', 'why_choose_title', 'What so Special About Shopswallet ?', NULL, NULL),
(64, 'App\\Models\\DataSetting', 71, 'en', 'fixed_location_title', 'Qatar', NULL, NULL),
(65, 'App\\Models\\Store', 3, 'en', 'name', 'new Shop', NULL, NULL),
(66, 'App\\Models\\Store', 3, 'en', 'address', 'madnith khalifa\r\ndoha', NULL, NULL),
(71, 'App\\Models\\Module', 3, 'en', 'module_name', 'E-commerce', NULL, NULL),
(72, 'App\\Models\\Module', 3, 'en', 'description', '<p>commerce</p>', NULL, NULL),
(73, 'App\\Models\\Module', 4, 'en', 'module_name', 'Food', NULL, NULL),
(74, 'App\\Models\\Module', 4, 'en', 'description', '<p>food</p>', NULL, NULL),
(75, 'App\\Models\\Module', 5, 'en', 'module_name', 'Pharmacy', NULL, NULL),
(76, 'App\\Models\\Module', 5, 'en', 'description', '<p>pharmacy</p>', NULL, NULL),
(77, 'App\\Models\\Module', 6, 'en', 'module_name', 'Parcel', NULL, NULL),
(78, 'App\\Models\\Module', 6, 'en', 'description', '<p>Parcel</p>', NULL, NULL),
(79, 'App\\Models\\Module', 7, 'en', 'module_name', 'services', NULL, NULL),
(80, 'App\\Models\\Module', 7, 'en', 'description', '<p>services</p>', NULL, NULL),
(81, 'App\\Models\\Zone', 4, 'en', 'name', 'All qatar', NULL, NULL),
(82, 'App\\Models\\Store', 4, 'en', 'name', 'Royal Crown Grocery Outlet', NULL, NULL),
(83, 'App\\Models\\Store', 4, 'en', 'address', 'Royal Crown Grocery Outlet', NULL, NULL),
(325, 'App\\Models\\Item', 1, 'en', 'name', 'Disney Fruts', NULL, NULL),
(326, 'App\\Models\\Item', 1, 'en', 'description', 'Disney Fruts', NULL, NULL),
(327, 'App\\Models\\Item', 2, 'en', 'name', 'Disney Sub Fruts', NULL, NULL),
(328, 'App\\Models\\Item', 2, 'en', 'description', 'Disney Sub Fruts', NULL, NULL),
(329, 'App\\Models\\Item', 3, 'en', 'name', 'Disney Sub Sub Fruts', NULL, NULL),
(330, 'App\\Models\\Item', 3, 'en', 'description', 'Disney Sub Sub Fruts', NULL, NULL),
(331, 'App\\Models\\Item', 4, 'en', 'name', 'demo', NULL, NULL),
(332, 'App\\Models\\Item', 4, 'en', 'description', 'demo', NULL, NULL),
(335, 'App\\Models\\Item', 5, 'en', 'name', 'Chill Buy Now', NULL, NULL),
(336, 'App\\Models\\Item', 5, 'en', 'description', 'Chill Buy Now', NULL, NULL),
(339, 'App\\Models\\Item', 6, 'en', 'name', 'King Product Buy Now', NULL, NULL),
(340, 'App\\Models\\Item', 6, 'en', 'description', 'King Product Buy Now', NULL, NULL),
(343, 'App\\Models\\Item', 7, 'en', 'name', 'xxx', NULL, NULL),
(344, 'App\\Models\\Item', 7, 'en', 'description', 'xxxx', NULL, NULL),
(345, 'App\\Models\\Item', 8, 'en', 'name', 'TEst ACDU', NULL, NULL),
(346, 'App\\Models\\Item', 8, 'en', 'description', 'zxczxcxz', NULL, NULL),
(349, 'App\\Models\\Item', 9, 'en', 'name', 'vv', NULL, NULL),
(350, 'App\\Models\\Item', 9, 'en', 'description', 'vv', NULL, NULL),
(353, 'App\\Models\\Category', 1, 'en', 'name', 'Fruts', NULL, NULL),
(354, 'App\\Models\\Category', 2, 'en', 'name', 'Fruts Fruts', NULL, NULL),
(355, 'App\\Models\\Category', 3, 'en', 'name', 'Fruts Fruts Fruts', NULL, NULL),
(356, 'App\\Models\\Category', 4, 'en', 'name', 'TEstu', NULL, NULL),
(357, 'App\\Models\\Category', 5, 'en', 'name', 'Juce', NULL, NULL),
(358, 'App\\Models\\Category', 6, 'en', 'name', 'Chilly', NULL, NULL),
(359, 'App\\Models\\Zone', 5, 'en', 'name', 'Gulshan', NULL, NULL),
(360, 'App\\Models\\Module', 8, 'en', 'module_name', 'Service', NULL, NULL),
(361, 'App\\Models\\Module', 8, 'en', 'description', '<p>test</p>', NULL, NULL),
(375, 'App\\Models\\Category', 11, 'en', 'name', 'AC', NULL, NULL),
(376, 'App\\Models\\Category', 11, 'en', 'category_title', 'Ac Clenings E', NULL, NULL),
(377, 'App\\Models\\Category', 11, 'ar', 'name', 'عنوان', NULL, NULL),
(378, 'App\\Models\\Category', 11, 'ar', 'category_title', 'عنوان الاختبار', NULL, NULL),
(379, 'App\\Models\\Category', 12, 'en', 'name', 'TEst ACE', NULL, NULL),
(380, 'App\\Models\\Category', 12, 'ar', 'name', 'عنوان e', NULL, NULL),
(381, 'App\\Models\\Category', 13, 'en', 'name', 'TEst Acd Child', NULL, NULL),
(382, 'App\\Models\\Category', 13, 'ar', 'name', 'عنوانA Test', NULL, NULL),
(383, 'App\\Models\\Category', 14, 'en', 'name', 'TEstAddon E', NULL, NULL),
(384, 'App\\Models\\Category', 14, 'en', 'category_title', 'Test Title Addon', NULL, NULL),
(385, 'App\\Models\\Category', 14, 'ar', 'name', 'عنوانA', NULL, NULL),
(386, 'App\\Models\\Category', 14, 'ar', 'category_title', 'Test Title Addon', NULL, NULL),
(387, 'App\\Models\\Category', 15, 'en', 'name', 'TEst', NULL, NULL),
(388, 'App\\Models\\Category', 15, 'en', 'category_title', 'Test Title E', NULL, NULL),
(389, 'App\\Models\\Category', 15, 'ar', 'name', 'عنوان', NULL, NULL),
(390, 'App\\Models\\Category', 15, 'ar', 'category_title', 'Test Title D', NULL, NULL),
(391, 'App\\Models\\Category', 16, 'en', 'name', 'Add On E', NULL, NULL),
(392, 'App\\Models\\Category', 16, 'en', 'category_title', 'Add On Title EE', NULL, NULL),
(393, 'App\\Models\\Category', 16, 'ar', 'name', 'عنوان A', NULL, NULL),
(394, 'App\\Models\\Category', 16, 'ar', 'category_title', 'عنوان الاختبار A', NULL, NULL),
(397, 'App\\Models\\ServiceCity', 2, 'en', 'name', 'Gulshan', NULL, NULL),
(398, 'App\\Models\\ServiceCity', 3, 'en', 'name', 'Gulshan', NULL, NULL),
(399, 'App\\Models\\ServiceCity', 3, 'ar', 'name', 'عنوان', NULL, NULL),
(400, 'App\\Models\\ServiceCity', 4, 'en', 'name', 'TEstU', NULL, NULL),
(401, 'App\\Models\\ServiceCity', 4, 'ar', 'name', 'عنوانU', NULL, NULL),
(402, 'App\\Models\\Category', 4, 'ar', 'name', 'عنوانu', NULL, NULL),
(403, 'App\\Models\\ServiceCity', 2, 'ar', 'name', 'عنوان', NULL, NULL),
(404, 'App\\Models\\Banner', 5, 'en', 'title', 'Test', NULL, NULL),
(405, 'App\\Models\\Banner', 5, 'ar', 'title', 'asdsasa', NULL, NULL),
(406, 'App\\Models\\Zone', 6, 'en', 'name', 'Dhaka', NULL, NULL),
(407, 'App\\Models\\Zone', 6, 'ar', 'name', 'عنوان', NULL, NULL),
(408, 'App\\Models\\Module', 8, 'ar', 'module_name', 'خدمة', NULL, NULL),
(409, 'App\\Models\\Module', 9, 'en', 'module_name', 'Booking', NULL, NULL),
(410, 'App\\Models\\Module', 9, 'en', 'description', '<p>Booking</p>', NULL, NULL),
(411, 'App\\Models\\Module', 9, 'ar', 'module_name', 'الحجز', NULL, NULL),
(412, 'App\\Models\\Module', 9, 'ar', 'description', '<p>الحجز</p>', NULL, NULL),
(413, 'App\\Models\\Item', 8, 'ar', 'name', 'عنوانU', NULL, NULL),
(414, 'App\\Models\\Item', 8, 'ar', 'description', 'عنوانxcxzcxz', NULL, NULL),
(415, 'App\\Models\\Category', 17, 'en', 'name', 'TEst ACD', NULL, NULL),
(416, 'App\\Models\\Category', 18, 'en', 'name', 'ggg', NULL, NULL),
(417, 'App\\Models\\Category', 18, 'en', 'category_title', 'ggg', NULL, NULL),
(418, 'App\\Models\\Category', 19, 'en', 'name', 'bbb', NULL, NULL),
(419, 'App\\Models\\Category', 19, 'en', 'category_title', 'bbb', NULL, NULL),
(420, 'App\\Models\\Category', 20, 'en', 'name', 'bbbbsub', NULL, NULL),
(421, 'App\\Models\\Category', 21, 'en', 'name', 'childbbbb', NULL, NULL),
(422, 'App\\Models\\Store', 6, 'en', 'name', 'Store', NULL, NULL),
(423, 'App\\Models\\Store', 6, 'en', 'address', 'Store', NULL, NULL),
(424, 'App\\Models\\Service', 1, 'en', 'service_details', '<p>eeeee</p>', NULL, NULL),
(425, 'App\\Models\\Service', 1, 'ar', 'service_details', '<p>aaaaa</p>', NULL, NULL),
(426, 'App\\Models\\Brand', 1, 'en', 'name', 'Test Brand E', NULL, NULL),
(427, 'App\\Models\\Brand', 1, 'ar', 'name', 'عنوان A', NULL, NULL),
(428, 'App\\Models\\Brand', 1, 'en', 'name', 'Test Brand E', NULL, NULL),
(429, 'App\\Models\\Brand', 1, 'ar', 'name', 'عنوان A', NULL, NULL),
(430, 'App\\Models\\Brand', 2, 'en', 'name', 'TEst ACD', NULL, NULL),
(431, 'App\\Models\\Brand', 2, 'ar', 'name', 'عنوان', NULL, NULL),
(432, 'App\\Models\\Store', 5, 'en', 'name', 'Aliya store', NULL, NULL),
(433, 'App\\Models\\Store', 5, 'en', 'address', '7G7F+8M Doha, Qatar', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Kg', '2024-01-12 10:13:05', '2024-01-12 10:13:05'),
(2, 'Pcs', '2024-01-12 10:13:28', '2024-01-12 10:13:28'),
(3, 'Ltr', '2024-01-12 10:13:41', '2024-01-12 10:13:41'),
(4, 'Pack', '2024-01-12 10:13:50', '2024-01-12 10:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) DEFAULT NULL,
  `cm_firebase_token` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(255) DEFAULT NULL,
  `social_id` varchar(255) DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT 0.000,
  `ref_code` varchar(10) DEFAULT NULL,
  `current_language_key` varchar(255) DEFAULT 'en',
  `ref_by` bigint(20) UNSIGNED DEFAULT NULL,
  `temp_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`, `zone_id`, `wallet_balance`, `loyalty_point`, `ref_code`, `current_language_key`, `ref_by`, `temp_token`) VALUES
(1, 'Aryan', 'Raj', '+918700304469', 'piyaryanraj@gmail.com', NULL, 0, NULL, '$2y$10$vMPnvaRmF.CQZMi7J9C9YeubKbYGSa81XvrmS7TlKSE4HQPKK0Wly', NULL, '2024-01-11 11:09:50', '2024-01-15 05:07:43', NULL, 'cBpXLNEVT_eJPQqPH2IGDx:APA91bF10yMPUSmXA7M2SNnSxOVwb08tuxtElWPNsjYJDhalaUM9FISgXF51Zq36XvKJQoHKEGNSYAUGUtSyezmgm7J8vEgfRijjDL-cGcSEDWDCPeZrA78Ntx5WTNb83ytxRTo486cN', 1, 0, NULL, NULL, 4, 0.000, 0.000, 'TZDOJI1MZQ', 'en', NULL, NULL),
(2, 'Faizuddin', 'Mohammed', '+97466182120', 'FaizUddin732@gmail.com', NULL, 0, NULL, '$2y$10$ynpQBuW3uE.N1726hxi9H.e.BSQOUHtcYd3i6vVvOXSdJNBNlB/j.', NULL, '2024-01-13 12:09:58', '2024-02-03 22:56:03', NULL, 'ch_gOpjBT_a3Chc91z4GJV:APA91bFbCRy_3JKIrXyoUe35kBZNYyIif6gFzKsu38Skoe5vurAotKCZBD0ZzPT-2UwKn9xSegp2dzWlaob6JSf96-TRHAFUQtwu_c1c_24hxA3m8r2rkAnqM2nKG5ZSbWqgnoVvt7-7', 1, 2, NULL, NULL, 0, 0.000, 0.000, 'NI2DA6J5LR', 'en', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_infos`
--

CREATE TABLE `user_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deliveryman_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_infos`
--

INSERT INTO `user_infos` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `admin_id`, `user_id`, `vendor_id`, `deliveryman_id`, `created_at`, `updated_at`) VALUES
(1, 'Faizuddin', 'Mohammed', '+97466182120', 'FaizUddin732@gmail.com', NULL, NULL, 2, NULL, NULL, '2024-01-14 09:49:38', '2024-01-14 09:49:38'),
(2, 'Aryan', 'Raj', '8700304469', 'aryanrajhost@gmail.com', NULL, 2, NULL, NULL, NULL, '2024-01-15 01:21:44', '2024-01-15 01:21:44'),
(3, 'new Shop', '', '+97466182120', 'Faizuddin732@gmail.com', '2024-01-12-65a18827c2a51.png', NULL, NULL, 3, NULL, '2024-01-15 12:12:25', '2024-01-15 12:12:25'),
(4, 'Royal Crown Grocery Outlet', '', '+9748700304469', 'admin@gmail.com', '2024-01-15-65a5011e8564e.png', NULL, NULL, 4, NULL, '2024-02-06 04:31:51', '2024-02-06 04:31:51'),
(5, 'Mutasim', 'Naib', '01724698392', 'mutasim@gmail.com', 'def.png', 3, NULL, NULL, NULL, '2024-02-22 04:39:42', '2024-02-22 04:39:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `data`, `status`, `user_id`, `vendor_id`, `delivery_man_id`, `created_at`, `updated_at`) VALUES
(1, '{\"title\":\"Order push title\",\"description\":\"Aryan Raj, Your  order 100001 is successfully placed\",\"order_id\":100001,\"image\":\"\",\"type\":\"order_status\"}', 1, 1, NULL, NULL, '2024-01-15 05:07:43', '2024-01-15 05:07:43'),
(2, '{\"title\":\"Order push title\",\"description\":\"New order push description\",\"order_id\":100001,\"module_id\":2,\"order_type\":\"delivery\",\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 4, NULL, '2024-01-15 05:07:44', '2024-01-15 05:07:44'),
(3, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your  order 100002 is successfully placed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-15 12:11:33', '2024-01-15 12:11:33'),
(4, '{\"title\":\"Order push title\",\"description\":\"New order push description\",\"order_id\":100002,\"module_id\":2,\"order_type\":\"delivery\",\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2024-01-15 12:11:34', '2024-01-15 12:11:34'),
(5, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your order 100002 is confirmed\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-15 12:13:46', '2024-01-15 12:13:46'),
(6, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your order is Processing by new Shop\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-15 12:14:22', '2024-01-15 12:14:22'),
(7, '{\"title\":\"Order push title\",\"description\":\"Delivery man is on the way. For this order 100002\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-15 12:14:37', '2024-01-15 12:14:37'),
(8, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your  order 100003 is successfully placed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-17 12:38:32', '2024-01-17 12:38:32'),
(9, '{\"title\":\"Order push title\",\"description\":\"New order push description\",\"order_id\":100003,\"module_id\":2,\"order_type\":\"delivery\",\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2024-01-17 12:38:32', '2024-01-17 12:38:32'),
(10, '{\"title\":\"Order push title\",\"description\":\"Your order 100002 is delivered\",\"order_id\":100002,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-17 12:41:56', '2024-01-17 12:41:56'),
(11, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your order 100003 is confirmed\",\"order_id\":100003,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-17 12:43:22', '2024-01-17 12:43:22'),
(12, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your  order 100004 is successfully placed\",\"order_id\":100004,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:24:47', '2024-01-26 06:24:47'),
(13, '{\"title\":\"Order push title\",\"description\":\"New order push description\",\"order_id\":100004,\"module_id\":2,\"order_type\":\"delivery\",\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 4, NULL, '2024-01-26 06:24:47', '2024-01-26 06:24:47'),
(14, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your  order 100005 is successfully placed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:26:06', '2024-01-26 06:26:06'),
(15, '{\"title\":\"Order push title\",\"description\":\"New order push description\",\"order_id\":100005,\"module_id\":2,\"order_type\":\"delivery\",\"image\":\"\",\"type\":\"new_order\"}', 1, NULL, 3, NULL, '2024-01-26 06:26:07', '2024-01-26 06:26:07'),
(16, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your order 100005 is confirmed\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:26:36', '2024-01-26 06:26:36'),
(17, '{\"title\":\"Order push title\",\"description\":\"Faizuddin Mohammed, Your order is Processing by new Shop\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:26:43', '2024-01-26 06:26:43'),
(18, '{\"title\":\"Order push title\",\"description\":\"Delivery man is on the way. For this order 100005\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:26:51', '2024-01-26 06:26:51'),
(19, '{\"title\":\"Order push title\",\"description\":\"Delivery man is on the way. For this order 100005\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:26:52', '2024-01-26 06:26:52'),
(20, '{\"title\":\"Order push title\",\"description\":\"Delivery man is on the way. For this order 100005\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:26:57', '2024-01-26 06:26:57'),
(21, '{\"title\":\"Order push title\",\"description\":\"Your order 100005 is delivered\",\"order_id\":100005,\"image\":\"\",\"type\":\"order_status\"}', 1, 2, NULL, NULL, '2024-01-26 06:27:02', '2024-01-26 06:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) NOT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `account_no` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `firebase_token` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(2, 'Aryan', 'Raj', '+919716580257', 'aryanrajhost@gmail.com', NULL, '$2y$10$vMPnvaRmF.CQZMi7J9C9YeubKbYGSa81XvrmS7TlKSE4HQPKK0Wly', NULL, '2024-01-10 13:55:05', '2024-02-09 20:23:48', NULL, NULL, NULL, NULL, NULL, 1, 'dceTdelDSdKqJsGS6FhhjS:APA91bFE-VhK6WHeuJpjKw7eirnQx0zuUMLlHRf7x38tCCxl5Kx1kBtITxbclIRwnwPuFltBmoC5fZMuzXMxresULsxGG6mVrfZxaR7XA5k6OC9N4Tvs2Tthz4bTObowBOLC2whlrEms', 'dNUXnMVc5habP9i7kkl5jGUnqG1H04d1cqKwerueNnl3xPrWAQSYFvmPM3Sw51uWcSbep6ZgA82nKgoPRByZbEZB18sLJ2acmHRKi02P112ySBLbZuGzs668'),
(3, 'Faizuddin', 'Mohammed', '+97466182120', 'Faizuddin732@gmail.com', NULL, '$2y$10$v0aHE7ladFNCtNq82MmPzO6i1B8Qf8610cW6kS/BL8pDSPb7wDfo6', NULL, '2024-01-12 12:42:47', '2024-02-09 05:11:24', NULL, NULL, NULL, NULL, '2024-02-09-65c6085c4c0d6.png', 1, 'cX1mjRtBQtekhD_52YYbza:APA91bF3j-yUYsfxabEZbXnLb-Ch7MwPKasgjG2lElTY3DigOA08FO9_V_GeFlMfwYXXK07HIR00VIIbSSYyGda4YfcyJq8EBdpxkhQX0-jWHNkvECoMvZ4V7L4h44HCt8WfYfLpgqLn', 'gMh5WqqUEbxsslBi3WoKQEqE5UuPQiKZM5zGAdLtDSaEdLKkhem2qWfjXQBqHQqX3a0QYjrfXcRTxlOWakRAzlSrmue6E7YMwHSHi8cTg6ooaea1Y5loyJAE'),
(4, 'Aryan', 'Raj', '+9748700304469', 'admin@gmail.com', NULL, '$2y$10$j3Wjsc0/csROK1M8a7yzae7DQUlX6/8h5M15Le.qYzJTIdUcxPs1S', NULL, '2024-01-15 03:55:42', '2024-01-15 03:55:42', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(5, 'tech', 'studio', '+97430853951', 'techstudio.agency@gamil.com', NULL, '$2y$10$G2Mmr6jh8NPEQgfkhWYgPeUza8afiaKQcRw4rJcM7NgNQhIJFMyEi', NULL, '2024-02-09 07:04:19', '2024-02-09 07:07:44', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(6, 'Sss', 'mit', '+8801794973738', 'mutasim@gmail.com', NULL, '$2y$10$xRFJO1VtWfjpBPnw51ysdujPE/FWv7wsl0K4WyNGF5.V0A7FJRo02', NULL, '2024-03-10 02:27:29', '2024-03-13 01:46:55', NULL, NULL, NULL, NULL, '2024-03-13-65f12fbfc9618.png', 1, NULL, NULL),
(19, 'Test Api Owner', 'Last Owner', '+8801724698392', 'test@gmail.com', NULL, '$2y$10$PTNADR5FGz8.SB81LGZb..vNHjfo/QBugJmbgHs7sjQ2OlFTCHWfW', NULL, '2024-03-10 04:25:49', '2024-03-10 04:25:49', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `firebase_token` varchar(255) DEFAULT NULL,
  `auth_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_logged_in` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_bonuses`
--

CREATE TABLE `wallet_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `bonus_type` varchar(255) NOT NULL,
  `bonus_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `minimum_add_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `maximum_bonus_amount` double(23,3) NOT NULL DEFAULT 0.000,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_payments`
--

CREATE TABLE `wallet_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_ref` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(50) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawal_methods`
--

CREATE TABLE `withdrawal_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `method_fields` text NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(23,3) NOT NULL DEFAULT 0.000,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `withdrawal_method_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'manual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_wise_topic` varchar(255) DEFAULT NULL,
  `customer_wise_topic` varchar(255) DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) DEFAULT NULL,
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `digital_payment` tinyint(1) NOT NULL DEFAULT 0,
  `increased_delivery_fee` double(8,2) NOT NULL DEFAULT 0.00,
  `increased_delivery_fee_status` tinyint(1) NOT NULL DEFAULT 0,
  `increase_delivery_charge_message` varchar(255) DEFAULT NULL,
  `offline_payment` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `store_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`, `cash_on_delivery`, `digital_payment`, `increased_delivery_fee`, `increased_delivery_fee_status`, `increase_delivery_charge_message`, `offline_payment`) VALUES
(2, 'Delhi', 0x000000000103000000010000000f0000008a3710bbea3853406cb7f9677fda3c408a3710bb7a30534039d1a94d6baa3c40673710bb58345340fcda6031c8773c408a3710bb96325340ae164bcef44e3c40673710bb74365340fe51e5376c373c40673710bb08485340cad47bd0233b3c408a3710bb42595340cad47bd0233b3c40673710bbac675340b5c75ad349463c40673710bb1469534038b1c85fa76c3c408a3710bb6e69534015ae989d23993c40673710bbdc6453406560b17e51c43c408a3710bb265753406eb0eac3a7e03c40673710bb08485340f270f24331de3c40673710bbe43e534062bdf0341ee33c408a3710bbea3853406cb7f9677fda3c40, 1, '2024-01-10 13:50:57', '2024-01-10 13:59:22', 'zone_2_store', 'zone_2_customer', 'zone_2_delivery_man', 1, 0, 0.00, 0, NULL, 0),
(3, 'Madinath khalifa', 0x00000000010300000001000000060000007b18d9d3f7bc4940d14c5052dd5239405618d9f327b8494097391027d3523940cc18d933c5bc4940225d380bcb4b3940b618d97362c14940be9cfc2cfc4c3940bb18d93376c049400acad82d4d5339407b18d9d3f7bc4940d14c5052dd523940, 1, '2024-01-11 22:51:44', '2024-01-15 01:40:58', 'zone_2_store', 'zone_2_customer', 'zone_2_delivery_man', 1, 1, 100.00, 1, 'full traffics', 1),
(4, 'All qatar', 0x000000000103000000010000000e00000058344134be9c494056c9a31cd784384058344134866b49405976cf0f2cd93840583441347e64494097fac10ebc2a3940583441344660494013837aa501773940583441348e7249402d6f9fc427c8394058344134de8b4940a5ef020de0043a405834413486984940165ca60caa203a4058344134a6b449408972ad8516193a40583441348ecc494042df645978e139405834413486c549409c01278f9f7e39405834413426cb49400ef10adbe4503940583441345efc4940d4dbf7603028394058344134269e49409d752152ec72384058344134be9c494056c9a31cd7843840, 1, '2024-01-15 01:36:27', '2024-01-15 01:44:59', 'zone_3_store', 'zone_3_customer', 'zone_3_delivery_man', 1, 0, 1.00, 1, '1', 0),
(5, 'Gulshan', 0x0000000001030000000100000004000000afb05eb3b5975640f359d220a2c93740c9b05e33e899564067e8327a47c33740adb05ed32b9856408d106a9984ca3740afb05eb3b5975640f359d220a2c93740, 1, '2024-02-22 06:48:40', '2024-02-22 06:50:41', 'zone_5_store', 'zone_5_customer', 'zone_5_delivery_man', 0, 0, 10.00, 1, 'Rainy Season', 0),
(6, 'Dhaka', 0x0000000001030000000100000004000000209a28b6b0985640450c12f1d8c93740449a28a69f9b56400913db0e1cce37405a9a28663a9b564030aa63ff89c43740209a28b6b0985640450c12f1d8c93740, 1, '2024-03-06 00:27:54', '2024-03-06 00:29:45', 'zone_5_store', 'zone_5_customer', 'zone_5_delivery_man', 1, 1, 0.00, 0, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addon_settings`
--
ALTER TABLE `addon_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_settings_id_index` (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_features`
--
ALTER TABLE `admin_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_promotional_banners`
--
ALTER TABLE `admin_promotional_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_special_criterias`
--
ALTER TABLE `admin_special_criterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_testimonials`
--
ALTER TABLE `admin_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_module_id_foreign` (`module_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_category_id_foreign` (`category_id`),
  ADD KEY `brands_module_id_foreign` (`module_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `common_conditions`
--
ALTER TABLE `common_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_module_id_foreign` (`module_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_settings`
--
ALTER TABLE `data_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `disbursements`
--
ALTER TABLE `disbursements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disbursement_details`
--
ALTER TABLE `disbursement_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disbursement_withdrawal_methods`
--
ALTER TABLE `disbursement_withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_vehicles`
--
ALTER TABLE `d_m_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `flash_sales`
--
ALTER TABLE `flash_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flutter_special_criterias`
--
ALTER TABLE `flutter_special_criterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_module_id_foreign` (`module_id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `item_tag`
--
ALTER TABLE `item_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
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
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_types`
--
ALTER TABLE `module_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_wise_banners`
--
ALTER TABLE `module_wise_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_wise_why_chooses`
--
ALTER TABLE `module_wise_why_chooses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_zone`
--
ALTER TABLE `module_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_messages`
--
ALTER TABLE `notification_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `offline_payments`
--
ALTER TABLE `offline_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `orders_module_id_foreign` (`module_id`);

--
-- Indexes for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_zone_id_index` (`zone_id`),
  ADD KEY `order_transactions_module_id_foreign` (`module_id`);

--
-- Indexes for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parcel_categories_name_unique` (`name`),
  ADD KEY `parcel_categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `parcel_delivery_instructions`
--
ALTER TABLE `parcel_delivery_instructions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pharmacy_item_details`
--
ALTER TABLE `pharmacy_item_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `react_testimonials`
--
ALTER TABLE `react_testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_reasons`
--
ALTER TABLE `refund_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_module_id_foreign` (`module_id`);

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
-- Indexes for table `service_cities`
--
ALTER TABLE `service_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`),
  ADD KEY `stores_module_id_foreign` (`module_id`);

--
-- Indexes for table `store_configs`
--
ALTER TABLE `store_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_schedule`
--
ALTER TABLE `store_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_wallets`
--
ALTER TABLE `store_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_products`
--
ALTER TABLE `temp_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_slots_category_id_foreign` (`category_id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  ADD KEY `users_zone_id_index` (`zone_id`);

--
-- Indexes for table `user_infos`
--
ALTER TABLE `user_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wallet_bonuses`
--
ALTER TABLE `wallet_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_features`
--
ALTER TABLE `admin_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_promotional_banners`
--
ALTER TABLE `admin_promotional_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_special_criterias`
--
ALTER TABLE `admin_special_criterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_testimonials`
--
ALTER TABLE `admin_testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `common_conditions`
--
ALTER TABLE `common_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `data_settings`
--
ALTER TABLE `data_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disbursements`
--
ALTER TABLE `disbursements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disbursement_details`
--
ALTER TABLE `disbursement_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `disbursement_withdrawal_methods`
--
ALTER TABLE `disbursement_withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_vehicles`
--
ALTER TABLE `d_m_vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sales`
--
ALTER TABLE `flash_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_sale_items`
--
ALTER TABLE `flash_sale_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flutter_special_criterias`
--
ALTER TABLE `flutter_special_criterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_tag`
--
ALTER TABLE `item_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `module_types`
--
ALTER TABLE `module_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_wise_banners`
--
ALTER TABLE `module_wise_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module_wise_why_chooses`
--
ALTER TABLE `module_wise_why_chooses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_zone`
--
ALTER TABLE `module_zone`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_messages`
--
ALTER TABLE `notification_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offline_payments`
--
ALTER TABLE `offline_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_cancel_reasons`
--
ALTER TABLE `order_cancel_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcel_delivery_instructions`
--
ALTER TABLE `parcel_delivery_instructions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacy_item_details`
--
ALTER TABLE `pharmacy_item_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `react_testimonials`
--
ALTER TABLE `react_testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_reasons`
--
ALTER TABLE `refund_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_cities`
--
ALTER TABLE `service_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `store_configs`
--
ALTER TABLE `store_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `store_schedule`
--
ALTER TABLE `store_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `store_wallets`
--
ALTER TABLE `store_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `temp_products`
--
ALTER TABLE `temp_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_infos`
--
ALTER TABLE `user_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_bonuses`
--
ALTER TABLE `wallet_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_payments`
--
ALTER TABLE `wallet_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawal_methods`
--
ALTER TABLE `withdrawal_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banners`
--
ALTER TABLE `banners`
  ADD CONSTRAINT `banners_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `brands_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD CONSTRAINT `item_campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD CONSTRAINT `parcel_categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

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

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `stores_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD CONSTRAINT `time_slots_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
