-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2022 at 06:19 AM
-- Server version: 5.7.33
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `press_link_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_setting`
--

CREATE TABLE `application_setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_file` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_setting`
--

INSERT INTO `application_setting` (`id`, `identifier`, `meta_key`, `value`, `is_file`, `created_at`, `updated_at`, `deleted_at`) VALUES
(17, 'application_setting', 'application_name', 'PRESS-Link', 0, '2022-03-22 00:40:47', NULL, NULL),
(18, 'application_setting', 'logo', 'application_setting/NFeVQFkeOw7OhOiW7mO4WUDpIbSKusCZa5GtRC2v.png', 1, '2022-03-22 00:40:47', NULL, NULL),
(19, 'application_setting', 'favicon', 'application_setting/xvqxexOZxqsZGRC6huuu7Gs8uK2OpVEnvOn9ZaKZ.png', 1, '2022-03-22 00:40:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `slug`, `title`, `image_url`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'barber', 'Barber', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(2, 0, 'beauticians', 'Beauticians', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(3, 0, 'tutors', 'Tutors', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(4, 0, 'mechanic', 'Mechanic', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(5, 0, 'car-wash', 'Car Wash', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(6, 0, 'home-cleaning', 'Home Cleaning', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', '2022-03-23 06:08:12'),
(7, 0, 'decor', 'Decor', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(8, 0, 'event-planner', 'Event Planner', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(9, 0, 'makeup-artist', 'Makeup Artist', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', NULL),
(10, 0, 'designing', 'Designing', 'category/default.png', '1', NULL, '2022-02-14 03:10:44', '2022-03-23 06:19:32'),
(11, 0, 'sasada', 'sasada123', 'category/vyDfcSMnzHjh3VFCQ4g4CBDHcDLlhYnCH6wuF3Dr.png', '0', NULL, '2022-03-23 05:25:59', '2022-03-23 06:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `message_type` varchar(33) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `file_url` varchar(33) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_data` text COLLATE utf8mb4_unicode_ci,
  `custom_data` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_message_status`
--

CREATE TABLE `chat_message_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `chat_message_id` int(11) NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comments',
  `reference_module` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(33) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(33) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'single',
  `member_limit` int(11) NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_status`
--

CREATE TABLE `chat_room_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `chat_message_id` bigint(20) UNSIGNED NOT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_room_users`
--

CREATE TABLE `chat_room_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `last_chat_message_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `last_message_timestamp` datetime DEFAULT NULL,
  `unread_message_counts` int(11) NOT NULL DEFAULT '0',
  `is_anonymous` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `is_owner` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_modules`
--

CREATE TABLE `cms_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa fa-list',
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sort_order` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_modules`
--

INSERT INTO `cms_modules` (`id`, `parent_id`, `name`, `route_name`, `icon`, `status`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 0, 'Cms Roles Management', 'cms-roles-management.index', 'fa fa-key', '1', '1.00', '2022-02-03 01:26:36', NULL, NULL),
(2, 0, 'Cms Users Management', 'cms-users-management.index', 'fa fa-users', '1', '2.00', '2022-02-03 01:26:36', NULL, NULL),
(3, 0, 'Application Setting', 'admin.application-setting', 'fa fa-cog', '1', '6.00', '2022-02-03 01:26:36', NULL, NULL),
(4, 0, 'Users Management', 'app-users.index', 'fa fa-users', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(5, 0, 'Content Management', 'content-management.index', 'fa fa-tasks', '1', '4.00', '2022-02-03 01:26:36', NULL, NULL),
(6, 0, 'FAQ`s', 'faq.index', 'fa fa-question-circle-o', '1', '5.00', '2022-02-03 01:26:36', NULL, NULL),
(7, 0, 'Service Provider', 'provider.index', 'fa fa-users', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(8, 0, 'Category Management', 'category.index', 'fa fa-list', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(9, 0, 'Booking Management', '', 'fa fa-calendar', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(12, 9, 'Pending', 'booking.pending', 'fa fa-calendar', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(13, 9, 'Accepted', 'booking.accepted', 'fa fa-calendar', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(14, 9, 'Rejected', 'booking.rejected', 'fa fa-calendar', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(15, 9, 'Completed', 'booking.completed', 'fa fa-calendar', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(16, 0, 'Earnings Management ', 'provider-earning.index', 'fa fa-money', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(17, 0, 'Cash-out Request', 'cash-out-request.index', 'fa fa-money', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(19, 17, 'Pending Cash out', 'cash-out-request.pending', 'fa fa-money', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(21, 17, 'Accept Cash out', 'cash-out-request.accepted', 'fa fa-money', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL),
(22, 17, 'Reject Cash out', 'cash-out-request.rejected', 'fa fa-money', '1', '3.00', '2022-02-03 01:26:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_module_permissions`
--

CREATE TABLE `cms_module_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `cms_module_id` bigint(20) UNSIGNED NOT NULL,
  `is_add` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_update` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_delete` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_module_permissions`
--

INSERT INTO `cms_module_permissions` (`id`, `cms_role_id`, `cms_module_id`, `is_add`, `is_view`, `is_update`, `is_delete`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, '0', '0', '0', '0', '2022-04-07 01:03:50', NULL, NULL),
(2, 2, 2, '0', '0', '0', '0', '2022-04-07 01:03:50', NULL, NULL),
(3, 2, 4, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(4, 2, 7, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(5, 2, 8, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(6, 2, 12, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(7, 2, 13, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(8, 2, 14, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(9, 2, 15, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(10, 2, 16, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(11, 2, 19, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(12, 2, 21, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(13, 2, 22, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(14, 2, 5, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(15, 2, 6, '1', '1', '1', '1', '2022-04-07 01:03:50', NULL, NULL),
(16, 2, 3, '0', '0', '0', '0', '2022-04-07 01:03:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_roles`
--

CREATE TABLE `cms_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super_admin` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_roles`
--

INSERT INTO `cms_roles` (`id`, `name`, `slug`, `is_super_admin`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Super Admin', 'super-admin', '1', '2022-02-03 01:26:36', NULL, NULL),
(2, 'Admin', 'admin', '0', '2022-04-07 01:03:50', '2022-04-07 01:03:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `user_ref_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `cms_role_id`, `user_ref_id`, `name`, `username`, `slug`, `email`, `mobile_no`, `password`, `image_url`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'PRES-Link', 'presslink', 'press-link', 'admin@presslink.com', '1-8882051816', '$2y$10$w3AzEpyF31t7Yl30eWxq..RMo.cRM1hK16mDBkqgmd4T1wRJ7YQK2', NULL, '1', NULL, '2022-02-03 01:26:36', NULL, NULL),
(2, 2, 0, 'Sub Admin', 'sub-admin', 'sub-admin', 'subadmin@presslink.com', '1-8882051813', '$2y$10$bk8sj9Gp3Lkuy0TADVzoXOV4aPYXGiWbNarfxOpHZtvOh.QTfWC7i', 'cms_users/oEpu2Ttyjpz7kTr7B4SS9S7qxMZF5ZoSNhCVnh31.jpg', '1', NULL, '2022-04-07 01:06:38', '2022-04-07 01:06:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widgets`
--

CREATE TABLE `cms_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `div_column_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `widget_type` enum('small_box','line_chart','bar_chat','pie_chart','map_chart') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_widgets`
--

INSERT INTO `cms_widgets` (`id`, `title`, `description`, `icon`, `color`, `div_column_class`, `link`, `widget_type`, `sql`, `config`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Total User', NULL, 'icon-user', '#4b71fa', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from users limit 1', '', '0', NULL, NULL, NULL),
(2, 'Total Roles', NULL, 'icon-people', '#7bcb4d', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from users limit 1', '', '0', NULL, NULL, NULL),
(3, 'Total User', NULL, 'icon-user', '#4b71fa', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from users limit 1', '', '0', NULL, NULL, NULL),
(4, 'Total Roles', NULL, 'icon-people', '#7bcb4d ', 'col-md-3', '/admin/app-users', 'small_box', 'Select count(*) from users limit 1', '', '0', NULL, NULL, NULL),
(5, 'Users', NULL, 'icon-user', '#fff', 'col-md-12', '/admin/app-users', 'line_chart', 'SELECT count(id) AS value, MONTHNAME(created_at) as label FROM users where YEAR(created_at) = YEAR(now()) group by MONTH(created_at) order by MONTH(created_at) asc', '', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_widget_role`
--

CREATE TABLE `cms_widget_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cms_widget_id` bigint(20) UNSIGNED NOT NULL,
  `cms_role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_management`
--

CREATE TABLE `content_management` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_management`
--

INSERT INTO `content_management` (`id`, `title`, `slug`, `content`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Terms Condition', 'terms-condition', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', NULL, NULL),
(2, 'Privacy Policy', 'privacy-policy', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', NULL, NULL),
(3, 'About Us', 'about-us', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', NULL, NULL),
(4, 'FAQ\'s', 'faqs', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-11 15:01:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `slug`, `question`, `answer`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '61fb759c870ec61fb759c870ee', 'How to change the language', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-17 15:45:47', NULL, NULL),
(2, '61fb759c870f161fb759c870f2', 'How to restore your chat history', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 1, '2020-02-17 15:51:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1, 'default', '{\"uuid\":\"3654e99f-af19-4e25-ae51-2134cdfa0ed8\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1789:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/presslink_web_api.test\\/user\\/verify\\/eyJpdiI6ImVJb2QrY1VNVUZ2cVlqaDF1VStnMWc9PSIsInZhbHVlIjoiN0htYXFPa2J1TFQ1NmhpaGpiYUsxTURNOWNHdGIwS3RwMUtldkticnN0ND0iLCJtYWMiOiIxMDZhOWRiZGNjN2MxNDg3ZjlhNjE2YTVlMDRmN2YzNmQ0ZGExNzcxZGU1MjBkYjA0MzVjNGIxM2ZkZjBkZTliIiwidGFnIjoiIn0=\\\">Verify Now<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:17:\\\"test7@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1643869615, 1643869615),
(2, 'default', '{\"uuid\":\"79cf85b0-2d8c-402a-a5ea-797e19e29969\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6ImVaZlBibGZvd2prZURQc1VnRG5uVlE9PSIsInZhbHVlIjoibVlSNGdzaEVOaExZNHZKS1duNnVGUDUxMzh3Qk5zNHY4R2cxVW1CaXprWT0iLCJtYWMiOiJlNjUzZTVmZTc5YzgyYjcyNWY4MTM0NDJhNTRlMGUyMmQ5NjA0N2NmODVjNmQ4Nzk4MGJkNGM2ZWU0OTUzMjk1IiwidGFnIjoiIn0=\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"test@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644847629, 1644847629),
(3, 'default', '{\"uuid\":\"23aaf7c8-73b7-429c-a980-543b8aa47853\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6Ikl6LzhiY0xsMWlSM1lCcGJhME83S0E9PSIsInZhbHVlIjoiTXFRUFhEekYwR2EzRHhHTXNmWHNFNjl3Zkw0L1F2MFZlcDRlV1JFbVBZaz0iLCJtYWMiOiJhNTVmODQ1Mjc3ZDFkNDYxYTlhYmI4MmZmZmFjNGM5NDE5OWMwOGFkMzI2ZjQ0N2FhODM3ZmNmOTczYTUyNzQ2IiwidGFnIjoiIn0=\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"test@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644847740, 1644847740),
(4, 'default', '{\"uuid\":\"e067de77-7b24-42a7-a558-8f44c0de5b91\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1743:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/presslink_web_api.test\\/user\\/reset-password\\/qj1StrFBV6qoQf9VlJk201WD2nca5x2W5y1KykH5Kyh5fKZAFPYmteggnTbNsGaZiVQAsEmaQODWIX7diGIUGuzByMpMlhYcIIFc8RK436AvooDmOefFB4OMWE3rg4pDEXLj4Fbkx8SOil0hmwEizK\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"test12a@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183873, 1645183873),
(5, 'default', '{\"uuid\":\"8a41aa0f-05b6-4060-9d28-08aeba27bb40\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1743:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/presslink_web_api.test\\/user\\/reset-password\\/XG8fGD5CzK1dr3pRhjUtQTGiyh6s0pKsKRvj1zh3ZzIpPnTcHT3VsFPq7GwxCePlnD2aeNUqA4K04OzaG3IPNAgTeZ4giFhYsMoARPADdlNvSxCHZQacjGY2Dz5gdID3FtH4341AjJfInsPE0ZYPVY\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"test12a@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183909, 1645183909),
(6, 'default', '{\"uuid\":\"986844d1-e89e-41dd-98d4-2220fc3b1ae8\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1743:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/presslink_web_api.test\\/user\\/reset-password\\/UFvdRtERD3UXnPRtJMmqzvqzJXfs38kKzSgHTJlj7BIuWOISE3DiB74EtPiFGvP3ll7Jzrsmni525BwUUzYalOabs8sfd98teyjYpCdc04vnURTvMWKiMmPLv8d3dwvLPVMnbv0svuSkBPqj7iZNDL\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"test12a@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183944, 1645183944),
(7, 'default', '{\"uuid\":\"1b925aff-e0e4-4331-98de-8cd38bdf0961\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1743:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/presslink_web_api.test\\/user\\/reset-password\\/4k3YVIRnBpyUBEFNkzAtiR0zJ2ZgTomLZF0K154pnsW7PztD7StUYAPdtS1kHzZqEUYxPRZlEdA9UUAJiIL5U2hqawqqCkj2IEE9n67ocE8ozXbYGvDJ2MXxYDcA9imztIELSphQZf3t8ZTWW7ybNL\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"test12a@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645184021, 1645184021),
(8, 'default', '{\"uuid\":\"9cd0483a-da16-4e26-9905-ae7c113b14c2\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1743:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/presslink_web_api.test\\/user\\/reset-password\\/LTxOynAqhW5Wwbqq27v86OtQjjLAswA20rt8zXpKSPydQLMddOOOxDoFoVuvAeO7i3I6ayrvmpwrJqHV1gdwHqO79EytE3b0OULfNj6ZsCvLZuCyG0wlCXbnYFg02Yfwsy88OdOYlgmUtK51sd31RY\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"test12a@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645184055, 1645184055),
(9, 'default', '{\"uuid\":\"f26d5350-6db6-4888-ad65-fd159bf78aeb\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1743:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/presslink_web_api.test\\/user\\/reset-password\\/Z2QZfuSQXf4YCwnWZ7h8eSkq5yjUzBKxepchmCG4VUMDIUVnaFwJZMqvoQ505h3WwmL1iuhCfAHFKNUqsMByNtOe77I30kkeuBnCxIrFF28pjQ3tNbCqafbl62dOpSZzaqVX3exnk4Qn2zp3h3rclH\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:19:\\\"test12a@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645184309, 1645184309),
(14, 'default', '{\"uuid\":\"405b1f9d-e749-40f2-9928-98f6dc6db385\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/IdDM572ZTM9ZmPPOjVTbpP2dxeNlSL88waK9j5tkeBBPGeEvdANpG2DyzmAJI9rTjqVyZsbAopZN4w8imdnJEV5S4qa2TScWcvolbio5k10SogSKY1AXJC2kUoKuwbdkTBzGpVnVkBZ7KWZjYDY89x\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644906594, 1644906594),
(15, 'default', '{\"uuid\":\"fb513a59-fec1-4177-9d59-29e8c4647379\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/rYEoAZ38JPrMeTZOckjfYR0UVmzahrSaVWCjbOnj3NrbjosDxl1zVtHOJTKp3UEDUQTrjqUm2lfCNzDx2d3srC8SSIMRPtJtRvxYcutxJurGW9he9GCxacRTyvetJzTUwblhlHFlVZduaeTmQducxH\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644906768, 1644906768),
(16, 'default', '{\"uuid\":\"52420343-caca-48f1-96a1-6b2f7fb74095\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/wX7FBiQPFk0nHECQE4LobjCGoqnQ8vee4CcS0ZtfvbwtuUpIaYRITluWrcKOOIH2tEBKxBQCIBqgOBenGg0gFiNfdNUesTc2yuQOLGYho7mM5TN4bKLQrhOAn3b8bRYu2g78qAxGAgJ0eZZt9AUyvX\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644906804, 1644906804),
(17, 'default', '{\"uuid\":\"28329ece-4a59-41ae-80a9-d11346e916e0\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/X3xrV818bZuwk8ZJ0M26JKOjjEATjVe4Ih49r4fER9AY8usXowvErVahJAweGd3JHcnHfdI2ANsz1gIcCEV7rV3VLfOMujPntvzBT6iB5reV8ujynCMUdF2PXT7O1jSuQm1IEARLBJ9sULJf1wwvA0\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644906948, 1644906948);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(18, 'default', '{\"uuid\":\"249c1170-4513-48c0-917e-b85f90870dc5\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/2lq3AjybIfaqOvVuwEjsuXmIF8D3ImGdaY6v1jp9FucdUTJ8XClTg8qv1sC86vHdCI4Fhw2NgnHPjM2H8aKZzA0nyl69XPF05frsA47z1Vjpjfb0cEAapnuG8lI6BfDcxIGSCI4ohhh4BLssO5NjFK\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644906967, 1644906967),
(19, 'default', '{\"uuid\":\"61fb5e4f-75ee-419c-bde3-4583e518fb94\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/C694yZ4UH5xkPtj5IwHo6KylZpJY0CxZvkTNUnLz3lH9TxOqyBwjcwzMXqGjWEWeY1cCIwC2CesTjxk1z5xrlemmghft1hGM44VmWMNdLJedY5L3BhE2RpfNAPKlcotmEfV1WtcejttyyPSdAeVEkk\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644907096, 1644907096),
(20, 'default', '{\"uuid\":\"a5e35d06-d0bb-41e6-a5b4-263cd841c8d6\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1761:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Liam,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/ft6h0AwvZX1OPEmdHQHMEUK9W3UJUgWXkgYVrA6fJhEOobDck7yKHAprYs9pahPvnmZxgfYFsz8pmrU6XyRH28ARXIiP65PQzMuoWVF94QhMwpeIMbw0w5gGPeS5N4CheQOgFmfxhWolU0Mm452oZm\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Liam@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644907125, 1644907125),
(21, 'default', '{\"uuid\":\"96555541-4874-4ae1-9359-fe1fb03c1f51\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/w9hYgliWoyrReSqjqV4xEUItHmRs1Qq8bE8RSausGr05SpOxX0kKWvonGIFygGGAcsfiiwBEHi7iRcyv1cdzUQZGqmhqxQAMG6VGkXCGpuWMZFtAqZWpJof7Q9RXs1gKvzlh74GlqUUIkvYngn4Wxf\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:13:\\\"Xyz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644907136, 1644907136),
(22, 'default', '{\"uuid\":\"96f8d7fb-1542-4431-9750-fcc0a7d755ca\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/gGMRvTegnDftiBeeinUtQpGkNfnZHmSM1aGUsaSv5lrqGWD7ne5ZBALOUhfNyjNOjH2xaqs4XnvQwKxaby6W8TVhktd5gDF3ECESwQ4SbKwDEEts3hltMDE9Cs0PVn6gyyfus7YXpKtA76Bn9YnMCq\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644907178, 1644907178),
(23, 'default', '{\"uuid\":\"1d16b67d-be31-42b7-a88d-23edc46ca07d\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Terry,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/KbbVcPL1nvun7UDK2T3YTA9zicx80E7X2njxVfN0EmVJj1q5q6cn79BaNX8ImLaiZmzNKwUmecFB2GgFV1Sp6Zz3lm3Xh8pqPp6nxCDDo6lq6yznOfnYB8ae3trYP3lPafTDjL0GMaH7WqhIVAKd0R\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"Terry@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644907244, 1644907244),
(24, 'default', '{\"uuid\":\"4013110b-b060-4a48-8bdb-15bfa5cbc8e1\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/lzEOg5H0c280E0KHoKA1IMZtRkekaDUVz9Y7yNBksVkQYWHeSJNoJ0IuLkj95IrWC5qCG7gnwwbCDRMNJPfDzo8SSJw3iBjbcS3eLCKv3cZt1WiXAmeLpTypgaMhshYRICKgO9gJ8eULEmEXGf9jPh\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644908826, 1644908826),
(25, 'default', '{\"uuid\":\"339085f5-d4e7-4236-88a0-39b6e466fe94\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/X0i4l9mK6cF5CNPor9drsun3UAxxqTy1VregFGarQ1JZFjSYhYsBtnj9CWhbp1x1RhRth6MrKLMQDVZ5qnEfSaNn5euN9cC052Aggxk34FXrG7DO65aGKBGZRXiZ2LLXF9quGYWZ0jqh5rAV1Ye0Yi\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644924183, 1644924183),
(26, 'default', '{\"uuid\":\"3bf5dd30-4bd4-4d25-ab1a-3d51e21b80de\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/w8zRC7StdykabMMxI7H1RXC9kR4WqQ4aQs8ANj9fW7vUADBJrYB6txmu7t1gPbbyBtocWDsZWR8TRmO48CmEVb4lCAkONA0oc5b1tLEYpchnSHp2ZgXIhFColXTrGyIChUDdjQX6q0z1rjRrHAVNnv\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644924280, 1644924280),
(27, 'default', '{\"uuid\":\"a06b48d7-81cd-4cdd-a0bc-d7935050c600\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/Ex5LCqHTPI7mfCOBLTAATWX5Im3AZa4gRDgD1vVADBpA2u8yADyY1LoDSrRkUIzdVHZIiHnN7UjWRFuJk4GhD1D7u4DTfGdAWePid3aW3PsqXRPvhdZOM0Ql0NygMNPkTIHcEwvS2sPVkLGZF0snzb\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644924436, 1644924436),
(28, 'default', '{\"uuid\":\"92eb6558-e7ae-407d-9bfc-43d1e6145056\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/n3jqHWQng3dSuOVgrkvl7gf7gH3jYE7F5lholEegYOQQKAsVjppWrq5vTswuHreoEG2qlIzG1cQUSmC27IYWZxscx408Sf6KxRc2mkJCqBQLyPIqnuHNF61SDThYuE5QqQG6d0yp4LdzO44Dwjjp7i\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Xyzz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1644925157, 1644925157),
(29, 'default', '{\"uuid\":\"68bbb596-3c49-484b-bbfd-0ddfc6cb8691\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1760:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Xyz,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/jAgL7QMc3WV1YbSPY20SnzwO5J2SrfDfPeYALirrYpOoOA9YmQWn0OdA8kfnDsifC1aYhjD33KXe81gEj9zMz3RjherHmeVOEAHAttwJUewsmfokC342NGdBo1y0WArKSGRT3EI0szXuRVhYuWOn4f\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:13:\\\"Xyz@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645072230, 1645072230),
(30, 'default', '{\"uuid\":\"83f3c20f-0646-41bd-8bee-b607d52d4c93\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/lk0rUCXakrZz5cWcFZlZaA2GyAL9gnQXdllPAffTehhCyfrNSDffdz53b7EmIBpWfixVnxu7nWsqDGUi0df9OFlmhBe9S9DS51JDLrpxEACleZMIR1QPiEsSKDgL2aZbMGwbLxu4d6bTdYX3AZsmoa\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183287, 1645183287);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(31, 'default', '{\"uuid\":\"e5308e65-1719-4869-aa02-03d0b0495250\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/DjJmadCfjh94VoBiCnsng8EM1FQ46AoGQU4UPOGIHZx84Lm2LqygTEtnwt4lFmwdTRkAzzQhke1LMgwfJYSaZDKZIf8hjOXotIj3Z4Qlk7hkmtWaqnlktq929rJvf1BSX3PoJy7WqlLtifZL3wEse5\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183294, 1645183294),
(32, 'default', '{\"uuid\":\"25f8d030-dc09-4d2d-9dbc-63c54399aad1\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/1E3eADHbwpxlSZ8ffI57b6cFLE2BDDmU4aRBQHx38jzDsOtTQh2bkARsYdHKyRCpXnkDlwGhtbinDXNtu82bx50Hi9nzwEmhA08GdSaxGE2btga69PLz9RLU7De1g0hNYoCWADQ3gezy5YJsaLmlPX\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183334, 1645183334),
(33, 'default', '{\"uuid\":\"10dfdc69-2439-4eed-a14f-ddf19bc6f08a\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/V3d2X9bxQrJjoaWNc31tiNwtweDnvTbTc0vhPDn2WKPGTxTTKkcRUwP5SY026SozbGN0xmtsbNIVy6orOxgPeziMAe0trbOxy7MekGKrTpoDsHkCLGUlTdf68Yjty1n9EsT1QkOSJklNkTvG9jlgj1\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183353, 1645183353),
(34, 'default', '{\"uuid\":\"397b23e4-ff34-4db7-a72d-424f69350bc8\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Terry,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/bGL89WT0onhIVzx8HpxAm6vvXwZyIjZVqGIBBncLt0lrjkDhk2Mu6UnMIQxJ8IE3yXjvCXccrGcDc1t8UehpyQgiUNWsLLmDxq7U46hJxZ94twEJUK9eeENEkopYWnmWjXZpO16OvZcg8dmnnavmqE\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"Terry@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183455, 1645183455),
(35, 'default', '{\"uuid\":\"885d5ad8-0ea3-4be7-bd29-bfc73ce2d438\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1764:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"http:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/fE1AFaiQzMUBbfIggiCmyGi6IXJkSVNkny6ftY1Zp7G8cCLXzA4Nd1ShhkvYk5ExILvQALHSumj1F1Py6x4VRKDDuS5iuTSHFlAI8GwOVDcEyd5DIlEDC5O0veXD2YarnirBGt1XYeXlrYKWF1UgrO\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645183715, 1645183715),
(36, 'default', '{\"uuid\":\"87a341de-b14c-4426-9fe7-48416f4938a0\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/65po8dZr0D2Q4uDZWwiPQkNXLW9jIB8UcSWYgB9nursVzQ85vY5wqSuq5RJ81Jlm94xMvTkPhhlfdw2EgKQipbULQjcCWt8zFauPWxAaHqMY8W7ifBLnK7YLhoju8rHSic70LagE5XlhcT6Vm5PeIT\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645184338, 1645184338),
(37, 'default', '{\"uuid\":\"d3d2d013-ce35-49bd-a618-8571ce16b818\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/vBTrCu62FUwVAwG6nn2Jb1QbMpoaiLbkUVLSZqsCjgHTbf8RsbzQ8rGUIaZy3FhkEue8jU9hmybq5nUy4FhtRxhC5fM8tZb3s4Wg1Fn2Lt9cY4OZfbA5j0QFI63rNAHRImzPqhonVbPwgkP5UcxN2m\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645184367, 1645184367),
(38, 'default', '{\"uuid\":\"117334c3-f87d-4e14-8347-eb6f7307b172\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Terry,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/JYnhzZY0nfCI5nLYm5SSBRDyDEfCaaHI2nz5OUYGpSKb3z6N53o9gqczRCbrW15K3SaxVYvUL4goMae51nrAdI0lfEhk2oAulkxQxRjntQCNX9A4QJKqRhO8JjGHBLvR9BGdd1Shwua9qBHBkPVjM2\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:15:\\\"Terry@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645184385, 1645184385),
(39, 'default', '{\"uuid\":\"b060c3ea-c9dd-4197-858a-26c713becc99\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Provider,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/gFXNYToLz6pPN4qFwowtMvDIaU8bwST4cCEHKfP7daxesI8YgkIBq7OrDbkLmGjJn9yOVW9C8jSrdlNYTzi8ihcfocScZCk9RIzLNJKIt2v4XkA6mqg8O25KJa3CRsp1KOj8QUh8UyJU8VkNvDDtaU\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"last@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645430955, 1645430955),
(40, 'default', '{\"uuid\":\"1588ad18-208f-4d8d-a46f-ff61ff6c8315\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1761:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Seek,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/DEgbXVz96DGfZTDt0CoqIvVfGoyIkZzF1YNyI56jN2vOsCNj2T9Es6eO6EcJwVFM432VokNP7DUwHMZ3xqGEfagDvB2QhA7fTF2qrnTLGiDLh0v4nHLGRqhsieYiSbR4VYbKMSpg7wYADlaipN66kd\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"Seek12@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645517143, 1645517143),
(41, 'default', '{\"uuid\":\"27c8dcff-3ca6-4100-b960-f05f4b304fc1\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1771:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Wrvtb2wfb2th25,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/quYyaNB0kQDXQ8qqiwYHzWm1ZsMCuQrpuoU5B3RPWt32XeXJstYUtyk8Hgt9ogN6lVFKOYm9JoX5ODmKLmfXLlG99Fdf4ZAcCRntE0LBm764qYQgeG1sNduTfiEfyLE6oqUOUFsDQZ2ucuwJx1Tgff\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:14:\\\"Vvvv@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645519643, 1645519643),
(42, 'default', '{\"uuid\":\"a8c7743d-8285-454c-8265-0d75ea5f0104\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1765:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Bbbbbbbb,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/bOVStuAFkZNgTvjxVQk4X7QHUBRzTdSjsYSO9CC9rsRc6pJkkIBQxhYg5aNU4GacGedvfQXemr6CYv5Yrtem41PWIdTbCmIQmDmirNaa6KFU4XNm63grNGB4bVbgavA3xjBxAgGvKNythzvpuk2SrZ\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:13:\\\"Bbb@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645526352, 1645526352),
(43, 'default', '{\"uuid\":\"6a741b54-f5b5-4b0f-b9db-feb24cd93ff5\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1766:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\r\\n    <tr>\\r\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\r\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\r\\n                <tr>\\r\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Alex john,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :<\\/p>\\r\\n                        <p><a href=\\\"https:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/reset-password\\/9dQ9uYoUJhIqFpU8t2jCuAfr6m3VgbAH4utQt8QkSlGoDqjFclRb7PjrJAUs3hWygVpFCYEOlFWhqGNO2hLfuxHNaU80R0M0Jhq4djhAcjDTeST2uN5xOFC1s8cm4nAgcH4naYM7cFpaOHDJp1h5bj\\\">Reset Password<\\/a><\\/p>\\r\\n                        <br>\\r\\n                        <br>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\r\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\r\\n                    <\\/td>\\r\\n                <\\/tr>\\r\\n            <\\/table>\\r\\n        <\\/td>\\r\\n    <\\/tr>\\r\\n<\\/table>\\r\\n\\\";s:12:\\\"mail_subject\\\";s:28:\\\"Forgot Password Confirmation\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:16:\\\"alex@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645599441, 1645599441);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(44, 'default', '{\"uuid\":\"a2d84ea2-0903-4d49-a7be-7f3e78038d7e\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1824:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Shoaib Ansari,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/verify\\/eyJpdiI6IkY0eUFMYURSSUZMRmtrL0RJbmk3OUE9PSIsInZhbHVlIjoia3c1UWY5ZldkS1E4WmJVS2F6VmZBUk9nR3F1TFk5bzJRSmVwazlOcGdSNjdGSEpGdkpvazhxclNibU5WbzR1RSIsIm1hYyI6Ijg3NzQxOTE2Yzg2YTc0NzEyODZhMDgxZGJhYmViZDA2MjVkNGQ4NzdiOWRjZGUzZjQ0NGI5OTZiM2UyZDc2YmIiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"shoaibansari824@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645615653, 1645615653),
(45, 'default', '{\"uuid\":\"dd063b50-917e-4708-a952-4d3417f9d3f6\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1824:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi Shoaib Ansari,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/press-link-web-api.dev.retrocubedev.com\\/user\\/verify\\/eyJpdiI6InZRUGFkWEg1VWYzSUJ4WmExVHUzN2c9PSIsInZhbHVlIjoiVUJnZ2tIa1JFcFNqdmtLa2FmalJPMHRVQUMzb1k4dlFlYklkeEZMR3pNbWJaVkgwaG5CQ2RDZ2cxV00yZnlNZCIsIm1hYyI6IjlhYTBmMjk0ZmFiY2NiMDc5MTFmMDA2MTUyNGQzMGMzMjVlNmUzZTY2NmI2ZjI1YWViMWQxYjNkZDFjZjY4ZjQiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">\\u00a9 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"shoaibansari824@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1645615841, 1645615841),
(46, 'default', '{\"uuid\":\"eeb585c2-69d2-4503-9b28-f1706087bfe2\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6Inpla0FPbGhWOTVpdlRrRGN2Y2RTSUE9PSIsInZhbHVlIjoibVFGTVlCVkdyUm9RU0xzNHptU0dsYVZVRk9SU0pQVXQ3dkNmYVBVS293cz0iLCJtYWMiOiI4ZTYwY2NlNzZjOGY4OWUzNzgwZjEwZGI1MTY0NmNhNTFjNmE2MjYyOTYwZGQwNjg4OTE5ODcxOWYzN2JhMDZmIiwidGFnIjoiIn0=\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"test127a@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649228776, 1649228776),
(47, 'default', '{\"uuid\":\"01068ef6-d56c-47af-8cc5-bc7ad0476834\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6Ink3OERGbUVtb1h0ems3SVQ5U0N4VlE9PSIsInZhbHVlIjoibkw1L095UWN1emRPQUxWK2o3Z2lNVTRwcS9PWUtyNDBxZWJNQUw5Rys2UT0iLCJtYWMiOiJmMGY1MzY0YmRjM2YyOWIxMjQ1NjI2OWQ0YzdmYTIyZDIxMGEyMDEwNDJiYWI3Y2QyYmU2NWZhMTRlYTQ4ZjY2IiwidGFnIjoiIn0=\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:21:\\\"test127sa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649760196, 1649760196),
(48, 'default', '{\"uuid\":\"eb9ebfd3-3292-46d6-9a10-9ff886eb1516\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6ImpxS0UvSVRtTU1xUTZGLzI3OWd4WlE9PSIsInZhbHVlIjoiSnFEWDNRSm5LRVVqcHJlS1M5R1lUQUpXdzc0ekdVZTZVTHpyeGgwYUVBQT0iLCJtYWMiOiJiMGJiYjkzMDg3YzZiM2YxOGY5Njk0YjRhNDg1YmUwNGEyYTU4NzdhZTZjM2JhZTgxOGY4MTM5MGJiM2RhMTQ1IiwidGFnIjoiIn0=\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:22:\\\"test1277sa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649932104, 1649932104),
(49, 'default', '{\"uuid\":\"bd692914-c918-403c-887c-3ff357f6070f\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1762:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6InBZeFRDNXk3eTdER01maGFTTlNNQkE9PSIsInZhbHVlIjoiZjZMVVg4c01rMXN3ZkpVYnRDTUtZZ25FOGFIN3FDRzRQT215aGc0d0R5UT0iLCJtYWMiOiJjYmE5YjAyNjNiY2JkNGNiZTgxNGY3YzVkNjc5MzIxMzFiMjM3M2NiYjQ1Njc0ZGEyYThhMGY1ODAyNDRmMWJmIiwidGFnIjoiIn0=\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:23:\\\"test12787sa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649932449, 1649932449),
(50, 'default', '{\"uuid\":\"f94db972-cad5-414b-972a-10c606242168\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6Im90NFBnNGovODMxRjc4N0U0cTlaR2c9PSIsInZhbHVlIjoiRGRnYVFQTnFaSDA2YXovaGx4LzlIdVp0d3FuZ1hrcSt3QlhwU2hSWVpUWDZaV2VHQ1NiaXgxbS8zYzZDQVdVSSIsIm1hYyI6IjgwYWUzMmUzZDI5ZWY4NDFkNWFhN2ZhYTc3YzQzZGFjZDA2ZjM5NmRiMTgyOGJiN2ZlM2E4NTFkYjg5NDFhMTciLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"test12787ssa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649932827, 1649932827),
(51, 'default', '{\"uuid\":\"f3ab0adb-f71e-42fa-a3b3-1ba1e358b566\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6IlVKaEdUd1hMc1Izc2ZiYjNjNmF4emc9PSIsInZhbHVlIjoiZ21mdlhUcWpzWFRkTWJodlhINThxT25ZRFlMenJrb3lkNUhCRXRsdjY2V3ZwTUhqaWRNWU1QREV2MW5JeDcrLyIsIm1hYyI6IjFjMzhkNDQ1OTE2MWUxMzQ1NjkyMTc2MWY5N2JjODQzNWQ0NjBjOWVjNDYzNWE2OTYwMjg4ZGMyMDY0ZWQ5NjkiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"test12787ssa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649933004, 1649933004),
(52, 'default', '{\"uuid\":\"ec273756-28a8-47e8-955b-1038056a2900\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6IlErejY0ZE8zWk1DeVBuVWNWd2ROU0E9PSIsInZhbHVlIjoidnJuOXZnOFUvTG1vdDRicHhlUHlqenViRjhpK0NneC9IeUNqV0d1d3JkeExjSWk5Q3RIVmh4eDhqbjdJL2hCWCIsIm1hYyI6IjUxNzgwOGVmNDNjNjM1MWZlOTU4MzdkMTEzYmZkODFlZGNiMGIwOGU5MDIyYTI3MzJhNThmYjlhODJlY2MyYWYiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"test12787ssa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649933347, 1649933347),
(53, 'default', '{\"uuid\":\"116738fc-1052-443e-bbca-a224443020ed\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6IityYnEvSEZqQXdmcDJDSnRIMzhKZ2c9PSIsInZhbHVlIjoiV2xMU2wzN2tiUTd1NXZGTmxzRGh4YkgrdzRqLzB3d0xoREpRclc2djh5cTY0WFZBV3FqWFJidGhmTE5xeEFGOCIsIm1hYyI6ImI5NjRmZmM2MmFmOWY3NTUxMThjYWI3ZDc2MWM2NzMxZDFmYTk3MTgzN2M1NTM3YzE4MTJkODRjMDU4M2JiNWYiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"test12787ssa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649933404, 1649933404),
(54, 'default', '{\"uuid\":\"86d2bef5-fc41-4f54-8643-0c390669d3f0\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6InZLS2dSNjc3YVlhN1pkek4zTVI4bUE9PSIsInZhbHVlIjoiYjhuOG9YUldBa1VUWE80SHpaZ3pjd2h1WnhBd3FKcXRuTFRZWDVYUjRrSkZSOGVMQi96aVgzVWNSbC90N3F4UyIsIm1hYyI6ImNmMWYxNGE4N2RkMmI3YTFjMjI1NjU2NTU3MTEwNzEwYjQ2NzFiZDgxYWVjNWViMzg1ZDU5Mzg3ZDg0YmU2MDMiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"test12787ssa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649933467, 1649933467),
(55, 'default', '{\"uuid\":\"12779a53-3120-4e1b-ac79-1fa944be8bfc\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6IlZ4bGNwZDNjSTlNRFJRNC95YkFBMEE9PSIsInZhbHVlIjoiY0x5ZzE0RlhENkNoMmtkVnNyWERKZ25FMnJpSURMVm1hcmRkb3BDd09oaEtaQXMzVXBxWnFMODZreEMyYlE5ciIsIm1hYyI6ImIxZWM3ODA0OGI2ODk5NjBmMTg2MDUzZjcyZjNiZTRmMWNjZTBlYjlkOGNjZDQzYzA2NTM1YmNiMjA4NjMyMWQiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:24:\\\"test12787ssa@yopmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1649933506, 1649933506),
(56, 'default', '{\"uuid\":\"205fa445-0f86-4a35-86b0-312785922acb\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6Iko0QWVFc2JxMTNad3FBd2UwVHVHN3c9PSIsInZhbHVlIjoiN1NPSFZLODREOU9FTlh4NkttR2dPUHZ6SnhFRm9TejJ4L1ZlOEY1bmEwWit0Tzd2T2Ftc2pNUEd0dUE4Sm9IdiIsIm1hYyI6IjU5NDgwYzg4YTc1MDY3M2ZlODljMmY1MDJhNTAxYjMzYjQyYTYxOWVkNzBlY2EzY2FhODZkOGZhN2Q0NGNhNjAiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"shoaibansari824@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1650274113, 1650274113);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(57, 'default', '{\"uuid\":\"f43ad358-8d4c-4654-a83f-35a0fe494037\",\"displayName\":\"App\\\\Mail\\\\DefaultEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":13:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\DefaultEmail\\\":31:{s:7:\\\"content\\\";s:1790:\\\"<table class=\\\"main\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\\\">\\n    <tr>\\n        <td class=\\\"wrapper\\\" style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\\\">\\n            <table border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\\\">\\n                <tr>\\n                    <td style=\\\"font-family: sans-serif; font-size: 14px; vertical-align: top;\\\">\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Hi test,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Your account has been created successfully. First, you need to confirm your account. Just click the below link<\\/p>\\n                        <p><a href=\\\"http:\\/\\/127.0.0.1:8000\\/user\\/verify\\/eyJpdiI6Ikg0SlEyUG1GSm9BL1JxbnhYN0ZjNHc9PSIsInZhbHVlIjoiVVhqYkxIR0hOZ3lRVERmTG5CS2J0R01YeGR6MkJMdW5rN01zWmhYSUlROFhzR25jUHVadW1BVG54REM1aThncSIsIm1hYyI6IjM5YzIwYzVjMjNlZTRiNTdmNjMxZGYxN2M1NmM5MTkyNzVjNjRlOTRjZGZmMzQwNDBkNWMwOGFmNTg2M2FhNDAiLCJ0YWciOiIifQ==\\\">Verify Now<\\/a><\\/p>\\n                        <br>\\n                        <br>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">Regards,<\\/p>\\n                        <p style=\\\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\\\">© 2022 PRESS-Link All Rights reserved.<\\/p>\\n                    <\\/td>\\n                <\\/tr>\\n            <\\/table>\\n        <\\/td>\\n    <\\/tr>\\n<\\/table>\\n\\\";s:12:\\\"mail_subject\\\";s:21:\\\"Welcome to PRESS-Link\\\";s:15:\\\"attachment_path\\\";a:0:{}s:6:\\\"locale\\\";N;s:4:\\\"from\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:25:\\\"shoaibansari824@gmail.com\\\";}}s:2:\\\"cc\\\";a:0:{}s:3:\\\"bcc\\\";a:0:{}s:7:\\\"replyTo\\\";a:0:{}s:7:\\\"subject\\\";N;s:8:\\\"markdown\\\";N;s:7:\\\"\\u0000*\\u0000html\\\";N;s:4:\\\"view\\\";N;s:8:\\\"textView\\\";N;s:8:\\\"viewData\\\";a:0:{}s:11:\\\"attachments\\\";a:0:{}s:14:\\\"rawAttachments\\\";a:0:{}s:15:\\\"diskAttachments\\\";a:0:{}s:9:\\\"callbacks\\\";a:0:{}s:5:\\\"theme\\\";N;s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";s:29:\\\"\\u0000*\\u0000assertionableRenderStrings\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1650358088, 1650358088);

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `module`, `module_id`, `user_id`, `keyword`, `created_at`, `updated_at`) VALUES
(1, 'User keyword', 42, 42, 'men', '2022-02-18 07:17:43', '2022-02-18 07:17:43'),
(2, 'User keyword', 42, 42, 'saloon', '2022-02-18 07:17:44', '2022-02-18 07:17:44'),
(3, 'User keyword', 42, 42, 'menlook', '2022-02-18 07:17:44', '2022-02-18 07:17:44'),
(4, 'User keyword', 42, 42, 'style', '2022-02-18 07:17:44', '2022-02-18 07:17:44'),
(5, 'User keyword', 43, 43, 'men', '2022-02-18 10:10:18', '2022-02-18 10:10:18'),
(6, 'User keyword', 43, 43, 'saloon', '2022-02-18 10:10:18', '2022-02-18 10:10:18'),
(7, 'User keyword', 43, 43, 'menlook', '2022-02-18 10:10:19', '2022-02-18 10:10:19'),
(8, 'User keyword', 43, 43, 'style', '2022-02-18 10:10:19', '2022-02-18 10:10:19'),
(9, 'User keyword', 47, 47, 'men', '2022-02-18 10:49:01', '2022-02-18 10:49:01'),
(10, 'User keyword', 47, 47, 'saloon', '2022-02-18 10:49:01', '2022-02-18 10:49:01'),
(11, 'User keyword', 47, 47, 'menlook', '2022-02-18 10:49:01', '2022-02-18 10:49:01'),
(12, 'User keyword', 47, 47, 'style', '2022-02-18 10:49:01', '2022-02-18 10:49:01'),
(13, 'User keyword', 49, 49, 'men', '2022-02-18 10:58:17', '2022-02-18 10:58:17'),
(14, 'User keyword', 49, 49, 'saloon', '2022-02-18 10:58:17', '2022-02-18 10:58:17'),
(15, 'User keyword', 49, 49, 'menlook', '2022-02-18 10:58:18', '2022-02-18 10:58:18'),
(16, 'User keyword', 49, 49, 'style', '2022-02-18 10:58:18', '2022-02-18 10:58:18'),
(234, 'User keyword', 67, 67, 'do', '2022-02-22 07:50:34', '2022-02-22 07:50:34'),
(235, 'User keyword', 67, 67, 'dfdsf', '2022-02-22 07:50:34', '2022-02-22 07:50:34'),
(291, 'User keyword', 74, 74, 'aSA', '2022-02-22 10:06:09', '2022-02-22 10:06:09'),
(292, 'User keyword', 74, 74, 'sasdsa', '2022-02-22 10:06:09', '2022-02-22 10:06:09'),
(293, 'User keyword', 74, 74, 'Assad', '2022-02-22 10:06:09', '2022-02-22 10:06:09'),
(314, 'User keyword', 78, 78, 'Zz.', '2022-02-22 10:45:20', '2022-02-22 10:45:20'),
(316, 'User keyword', 78, 78, 'x', '2022-02-22 10:45:20', '2022-02-22 10:45:20'),
(317, 'User keyword', 78, 78, 'qdcwrcwrv', '2022-02-22 10:45:20', '2022-02-22 10:45:20'),
(318, 'User keyword', 80, 80, 'Asdas', '2022-02-23 05:31:53', '2022-02-23 05:31:53'),
(319, 'User keyword', 80, 80, 'asd', '2022-02-23 05:31:53', '2022-02-23 05:31:53'),
(320, 'User keyword', 80, 80, 'asdasd', '2022-02-23 05:31:53', '2022-02-23 05:31:53'),
(321, 'User keyword', 80, 80, 'sd', '2022-02-23 05:31:53', '2022-02-23 05:31:53'),
(322, 'User keyword', 81, 81, 'Asds', '2022-02-23 05:46:21', '2022-02-23 05:46:21'),
(323, 'User keyword', 81, 81, 'Asdas', '2022-02-23 05:46:21', '2022-02-23 05:46:21'),
(324, 'User keyword', 81, 81, 'Weqe', '2022-02-23 05:46:21', '2022-02-23 05:46:21'),
(330, 'User keyword', 82, 82, 'Sadsd', '2022-02-23 05:50:04', '2022-02-23 05:50:04'),
(331, 'User keyword', 82, 82, 'Asdas', '2022-02-23 05:50:04', '2022-02-23 05:50:04'),
(332, 'User keyword', 82, 82, 'Asdas', '2022-02-23 05:50:04', '2022-02-23 05:50:04'),
(333, 'User keyword', 82, 82, 'adsd', '2022-02-23 05:50:04', '2022-02-23 05:50:04'),
(336, 'User keyword', 88, 88, 'Bugu', '2022-02-23 08:13:43', '2022-02-23 08:13:43'),
(337, 'User keyword', 89, 89, 'Jsjssjjdd', '2022-02-23 09:50:18', '2022-02-23 09:50:18'),
(338, 'User keyword', 89, 89, 'jfkfdjd', '2022-02-23 09:50:18', '2022-02-23 09:50:18'),
(339, 'User keyword', 90, 90, 'Trendy', '2022-02-23 10:17:41', '2022-02-23 10:17:41'),
(340, 'User keyword', 90, 90, 'fashionable', '2022-02-23 10:17:41', '2022-02-23 10:17:41'),
(341, 'User keyword', 91, 91, 'Suwgd', '2022-02-23 10:50:22', '2022-02-23 10:50:22'),
(342, 'User keyword', 91, 91, 'dehdveh', '2022-02-23 10:50:22', '2022-02-23 10:50:22'),
(343, 'User keyword', 91, 91, 'd', '2022-02-23 10:50:22', '2022-02-23 10:50:22'),
(344, 'User keyword', 92, 92, 'Shsh', '2022-02-23 10:58:47', '2022-02-23 10:58:47'),
(345, 'User keyword', 92, 92, 'susbs', '2022-02-23 10:58:47', '2022-02-23 10:58:47'),
(346, 'User keyword', 92, 92, 's', '2022-02-23 10:58:47', '2022-02-23 10:58:47'),
(348, 'User keyword', 75, 75, 'gtgtg', '2022-02-23 11:43:15', '2022-02-23 11:43:15'),
(354, 'User keyword', 107, 107, 'Ndjdsjsjs', '2022-02-24 07:58:21', '2022-02-24 07:58:21'),
(379, 'User keyword', 115, 115, '2t2htt2h2tb', '2022-02-24 10:09:09', '2022-02-24 10:09:09'),
(382, 'User keyword', 87, 87, 'Trendy', '2022-02-24 10:21:50', '2022-02-24 10:21:50'),
(383, 'User keyword', 87, 87, 'vibrant', '2022-02-24 10:21:50', '2022-02-24 10:21:50'),
(443, 'User keyword', 110, 110, 'Hjk', '2022-02-25 06:52:46', '2022-02-25 06:52:46'),
(457, 'User keyword', 117, 117, 'Decor', '2022-02-25 10:06:35', '2022-02-25 10:06:35'),
(458, 'User keyword', 117, 117, 'free', '2022-02-25 10:06:35', '2022-02-25 10:06:35'),
(459, 'User keyword', 114, 114, 'eeffe', '2022-02-25 10:27:40', '2022-02-25 10:27:40'),
(468, 'User keyword', 121, 121, 'Trendy', '2022-02-28 05:53:50', '2022-02-28 05:53:50'),
(469, 'User keyword', 121, 121, 'fashioned', '2022-02-28 05:53:50', '2022-02-28 05:53:50'),
(472, 'User keyword', 123, 123, 'Makeup', '2022-02-28 06:16:58', '2022-02-28 06:16:58'),
(473, 'User keyword', 123, 123, 'designer', '2022-02-28 06:16:58', '2022-02-28 06:16:58'),
(474, 'User keyword', 123, 123, 'makeup', '2022-02-28 06:16:58', '2022-02-28 06:16:58'),
(475, 'User keyword', 124, 124, 'Dd', '2022-02-28 06:40:55', '2022-02-28 06:40:55'),
(476, 'User keyword', 122, 122, 'Dkdkdu', '2022-02-28 07:11:23', '2022-02-28 07:11:23'),
(477, 'User keyword', 122, 122, 'sjsjs', '2022-02-28 07:11:23', '2022-02-28 07:11:23'),
(478, 'User keyword', 125, 125, 'Dd', '2022-02-28 08:08:17', '2022-02-28 08:08:17'),
(479, 'User keyword', 127, 127, 'Sja', '2022-02-28 09:44:27', '2022-02-28 09:44:27'),
(480, 'User keyword', 127, 127, 'shab', '2022-02-28 09:44:27', '2022-02-28 09:44:27'),
(481, 'User keyword', 130, 130, '4kssm', '2022-02-28 10:23:16', '2022-02-28 10:23:16'),
(488, 'User keyword', 132, 132, 'Fghhhhhhh', '2022-02-28 11:43:31', '2022-02-28 11:43:31'),
(489, 'User keyword', 132, 132, 'gryjhf', '2022-02-28 11:43:31', '2022-02-28 11:43:31'),
(490, 'User keyword', 132, 132, 'grfgg', '2022-02-28 11:43:31', '2022-02-28 11:43:31'),
(491, 'User keyword', 133, 133, 'Fundraising', '2022-02-28 22:45:25', '2022-02-28 22:45:25'),
(492, 'Service keyword', 20, 125, 'abc', '2022-03-01 06:20:32', '2022-03-01 06:20:32'),
(493, 'Service keyword', 20, 125, 'xyz', '2022-03-01 06:20:32', '2022-03-01 06:20:32'),
(494, 'Service keyword', 21, 125, 'abc', '2022-03-01 06:22:55', '2022-03-01 06:22:55'),
(495, 'Service keyword', 21, 125, 'xyz', '2022-03-01 06:22:55', '2022-03-01 06:22:55'),
(496, 'Service keyword', 22, 125, 'sd', '2022-03-01 06:23:38', '2022-03-01 06:23:38'),
(497, 'Service keyword', 22, 125, 'ds', '2022-03-01 06:23:38', '2022-03-01 06:23:38'),
(498, 'Service keyword', 22, 125, 'dsadasdsad', '2022-03-01 06:23:38', '2022-03-01 06:23:38'),
(505, 'Service keyword', 26, 125, 'ddd', '2022-03-01 06:49:47', '2022-03-01 06:49:47'),
(513, 'Service keyword', 25, 125, 'eee', '2022-03-01 08:10:03', '2022-03-01 08:10:03'),
(514, 'Service keyword', 25, 125, 'ds', '2022-03-01 08:10:04', '2022-03-01 08:10:04'),
(515, 'Service keyword', 25, 125, 'dsadsd', '2022-03-01 08:10:04', '2022-03-01 08:10:04'),
(549, 'Service keyword', 27, 125, 'as', '2022-03-01 08:25:09', '2022-03-01 08:25:09'),
(550, 'Service keyword', 27, 125, 'a', '2022-03-01 08:25:09', '2022-03-01 08:25:09'),
(551, 'Service keyword', 27, 125, 'sasa', '2022-03-01 08:25:09', '2022-03-01 08:25:09'),
(562, 'Service keyword', 24, 125, 'ddd', '2022-03-01 08:26:18', '2022-03-01 08:26:18'),
(563, 'Service keyword', 24, 125, 'as', '2022-03-01 08:26:19', '2022-03-01 08:26:19'),
(564, 'Service keyword', 24, 125, 'fdsf', '2022-03-01 08:26:19', '2022-03-01 08:26:19'),
(565, 'Service keyword', 24, 125, 'fdsfdsf', '2022-03-01 08:26:19', '2022-03-01 08:26:19'),
(567, 'Service keyword', 23, 125, 'sddddddddddd', '2022-03-01 08:26:48', '2022-03-01 08:26:48'),
(583, 'Service keyword', 28, 125, 'sdas', '2022-03-01 09:49:53', '2022-03-01 09:49:53'),
(584, 'Service keyword', 28, 125, 'as', '2022-03-01 09:49:53', '2022-03-01 09:49:53'),
(585, 'Service keyword', 28, 125, 'dsad', '2022-03-01 09:49:53', '2022-03-01 09:49:53'),
(586, 'Service keyword', 28, 125, 'as', '2022-03-01 09:49:53', '2022-03-01 09:49:53'),
(587, 'Service keyword', 28, 125, 'asd', '2022-03-01 09:49:53', '2022-03-01 09:49:53'),
(588, 'Service keyword', 29, 125, 'dsad', '2022-03-01 10:32:29', '2022-03-01 10:32:29'),
(589, 'Service keyword', 29, 125, 'asdas', '2022-03-01 10:32:29', '2022-03-01 10:32:29'),
(590, 'Service keyword', 30, 125, 'dasdas', '2022-03-01 10:32:50', '2022-03-01 10:32:50'),
(591, 'Service keyword', 31, 125, 'as', '2022-03-01 10:33:07', '2022-03-01 10:33:07'),
(592, 'Service keyword', 32, 125, 'asdasd', '2022-03-01 10:36:28', '2022-03-01 10:36:28'),
(593, 'Service keyword', 32, 125, 'a', '2022-03-01 10:36:28', '2022-03-01 10:36:28'),
(594, 'Service keyword', 32, 125, 'das', '2022-03-01 10:36:28', '2022-03-01 10:36:28'),
(595, 'Service keyword', 32, 125, 'asd', '2022-03-01 10:36:28', '2022-03-01 10:36:28'),
(596, 'Service keyword', 32, 125, 'ad', '2022-03-01 10:36:28', '2022-03-01 10:36:28'),
(597, 'Service keyword', 33, 125, 'wwewe', '2022-03-01 10:37:16', '2022-03-01 10:37:16'),
(598, 'Service keyword', 34, 125, 'eeewewe', '2022-03-01 10:37:26', '2022-03-01 10:37:26'),
(599, 'Service keyword', 35, 125, 'you', '2022-03-01 10:37:39', '2022-03-01 10:37:39'),
(600, 'Service keyword', 35, 125, 'uytu', '2022-03-01 10:37:39', '2022-03-01 10:37:39'),
(601, 'Service keyword', 36, 125, 'adsdsadasd', '2022-03-01 10:41:08', '2022-03-01 10:41:08'),
(602, 'Service keyword', 37, 125, 'sdasd', '2022-03-01 10:41:20', '2022-03-01 10:41:20'),
(603, 'Service keyword', 38, 125, 'sdasdsa', '2022-03-01 10:41:40', '2022-03-01 10:41:40'),
(604, 'Service keyword', 39, 125, 'sdas', '2022-03-01 10:44:44', '2022-03-01 10:44:44'),
(605, 'Service keyword', 39, 125, 'sadasdasdasd', '2022-03-01 10:44:45', '2022-03-01 10:44:45'),
(606, 'Service keyword', 40, 125, 'aaafff', '2022-03-01 10:47:13', '2022-03-01 10:47:13'),
(607, 'Service keyword', 41, 125, 'big', '2022-03-01 10:47:44', '2022-03-01 10:47:44'),
(608, 'Service keyword', 41, 125, 'ju', '2022-03-01 10:47:44', '2022-03-01 10:47:44'),
(609, 'Service keyword', 41, 125, 'h', '2022-03-01 10:47:44', '2022-03-01 10:47:44'),
(610, 'Service keyword', 41, 125, 'hbklcf', '2022-03-01 10:47:44', '2022-03-01 10:47:44'),
(611, 'Service keyword', 42, 125, 'hhgg', '2022-03-01 10:48:05', '2022-03-01 10:48:05'),
(612, 'Service keyword', 43, 125, 'sdas', '2022-03-01 10:51:10', '2022-03-01 10:51:10'),
(613, 'Service keyword', 44, 125, 'dasdasd', '2022-03-01 10:53:10', '2022-03-01 10:53:10'),
(614, 'Service keyword', 45, 125, 'asa', '2022-03-01 10:53:20', '2022-03-01 10:53:20'),
(615, 'Service keyword', 46, 125, 'ds', '2022-03-01 10:53:37', '2022-03-01 10:53:37'),
(616, 'Service keyword', 47, 125, 'sdas', '2022-03-01 10:54:53', '2022-03-01 10:54:53'),
(617, 'Service keyword', 48, 125, 'fa', '2022-03-01 10:55:13', '2022-03-01 10:55:13'),
(618, 'Service keyword', 49, 125, 'sdas', '2022-03-01 10:57:08', '2022-03-01 10:57:08'),
(620, 'Service keyword', 51, 125, 'addsa', '2022-03-01 10:59:13', '2022-03-01 10:59:13'),
(621, 'Service keyword', 52, 125, 'adsd', '2022-03-01 10:59:24', '2022-03-01 10:59:24'),
(622, 'Service keyword', 53, 125, 'adsaad', '2022-03-01 10:59:40', '2022-03-01 10:59:40'),
(625, 'Service keyword', 54, 125, 'dsfdsf', '2022-03-01 11:02:18', '2022-03-01 11:02:18'),
(629, 'Service keyword', 55, 134, 'BridalMakeUp', '2022-03-01 11:08:44', '2022-03-01 11:08:44'),
(630, 'Service keyword', 55, 134, 'Brides', '2022-03-01 11:08:44', '2022-03-01 11:08:44'),
(631, 'Service keyword', 56, 134, 'Party', '2022-03-01 11:10:14', '2022-03-01 11:10:14'),
(632, 'Service keyword', 56, 134, 'MakeUp', '2022-03-01 11:10:14', '2022-03-01 11:10:14'),
(633, 'Service keyword', 57, 134, 'www', '2022-03-02 05:03:28', '2022-03-02 05:03:28'),
(634, 'Service keyword', 57, 134, 'wqewq', '2022-03-02 05:03:28', '2022-03-02 05:03:28'),
(635, 'Service keyword', 57, 134, 'eqweqwe', '2022-03-02 05:03:29', '2022-03-02 05:03:29'),
(636, 'Service keyword', 58, 134, 'sdasd', '2022-03-02 05:03:41', '2022-03-02 05:03:41'),
(637, 'Service keyword', 58, 134, 'dasdasdasd', '2022-03-02 05:03:41', '2022-03-02 05:03:41'),
(640, 'Service keyword', 60, 134, 'CBC', '2022-03-02 05:05:11', '2022-03-02 05:05:11'),
(641, 'Service keyword', 60, 134, 'sdsd', '2022-03-02 05:05:11', '2022-03-02 05:05:11'),
(644, 'Service keyword', 59, 134, 'we’re', '2022-03-02 05:07:23', '2022-03-02 05:07:23'),
(645, 'Service keyword', 59, 134, 'ewewe', '2022-03-02 05:07:23', '2022-03-02 05:07:23'),
(646, 'Service keyword', 61, 134, 'ads', '2022-03-02 05:13:06', '2022-03-02 05:13:06'),
(647, 'Service keyword', 61, 134, 'd', '2022-03-02 05:13:06', '2022-03-02 05:13:06'),
(648, 'Service keyword', 61, 134, 'ad', '2022-03-02 05:13:06', '2022-03-02 05:13:06'),
(649, 'Service keyword', 61, 134, 'asdasd', '2022-03-02 05:13:06', '2022-03-02 05:13:06'),
(650, 'Service keyword', 62, 134, 'sdasd', '2022-03-02 05:16:45', '2022-03-02 05:16:45'),
(652, 'Service keyword', 63, 134, 'dsdas', '2022-03-02 05:22:17', '2022-03-02 05:22:17'),
(653, 'Service keyword', 50, 125, 'sdas', '2022-03-02 05:38:34', '2022-03-02 05:38:34'),
(654, 'Service keyword', 64, 125, 'd75d75', '2022-03-02 05:39:12', '2022-03-02 05:39:12'),
(655, 'Service keyword', 66, 134, 'fdsfdf', '2022-03-02 06:20:57', '2022-03-02 06:20:57'),
(656, 'Service keyword', 67, 134, 'dsadasd', '2022-03-02 06:21:16', '2022-03-02 06:21:16'),
(657, 'Service keyword', 68, 134, 'dad', '2022-03-02 06:27:11', '2022-03-02 06:27:11'),
(658, 'Service keyword', 69, 134, 'u4u4', '2022-03-02 06:35:01', '2022-03-02 06:35:01'),
(659, 'Service keyword', 69, 134, 'rhrhr', '2022-03-02 06:35:01', '2022-03-02 06:35:01'),
(660, 'Service keyword', 70, 134, 'sd', '2022-03-02 06:36:07', '2022-03-02 06:36:07'),
(661, 'Service keyword', 71, 134, 'dasd', '2022-03-02 06:36:18', '2022-03-02 06:36:18'),
(662, 'Service keyword', 72, 134, 'dsada', '2022-03-02 06:36:33', '2022-03-02 06:36:33'),
(665, 'User keyword', 137, 137, 'Asd', '2022-03-02 07:09:04', '2022-03-02 07:09:04'),
(667, 'User keyword', 134, 134, 'MakeUp', '2022-03-02 10:12:58', '2022-03-02 10:12:58'),
(668, 'User keyword', 134, 134, 'Brides', '2022-03-02 10:12:58', '2022-03-02 10:12:58'),
(669, 'User keyword', 134, 134, 'Wonderful', '2022-03-02 10:12:58', '2022-03-02 10:12:58'),
(671, 'Service keyword', 74, 138, 'asdas', '2022-03-02 11:06:15', '2022-03-02 11:06:15'),
(672, 'Service keyword', 75, 138, 'asdas', '2022-03-02 11:06:28', '2022-03-02 11:06:28'),
(673, 'Service keyword', 76, 138, 'dddd', '2022-03-02 11:06:45', '2022-03-02 11:06:45'),
(674, 'User keyword', 138, 138, 'Sdasdo', '2022-03-02 11:08:05', '2022-03-02 11:08:05'),
(675, 'User keyword', 139, 139, 'Asdas', '2022-03-03 10:33:42', '2022-03-03 10:33:42'),
(676, 'Service keyword', 77, 139, 'sas', '2022-03-03 10:35:28', '2022-03-03 10:35:28'),
(677, 'Service keyword', 78, 139, 'dasd', '2022-03-03 10:35:47', '2022-03-03 10:35:47'),
(678, 'Service keyword', 73, 134, 'dasd', '2022-03-03 11:50:24', '2022-03-03 11:50:24'),
(679, 'Service keyword', 79, 139, 'aas', '2022-03-04 04:41:17', '2022-03-04 04:41:17'),
(680, 'Service keyword', 80, 139, 'ghjgh', '2022-03-04 04:41:47', '2022-03-04 04:41:47'),
(681, 'User keyword', 140, 140, 'Washhhh', '2022-03-04 10:21:33', '2022-03-04 10:21:33'),
(682, 'Service keyword', 81, 140, 'FirstWash', '2022-03-04 10:23:32', '2022-03-04 10:23:32'),
(683, 'Service keyword', 82, 140, 'Clean', '2022-03-04 10:24:10', '2022-03-04 10:24:10'),
(684, 'Service keyword', 82, 140, 'Wash', '2022-03-04 10:24:10', '2022-03-04 10:24:10'),
(692, 'Service keyword', 85, 142, 'abc', '2022-03-07 13:22:32', '2022-03-07 13:22:32'),
(693, 'Service keyword', 85, 142, 'xyz', '2022-03-07 13:22:32', '2022-03-07 13:22:32'),
(694, 'Service keyword', 86, 142, 'abc', '2022-03-07 13:22:46', '2022-03-07 13:22:46'),
(695, 'Service keyword', 86, 142, 'xyz', '2022-03-07 13:22:46', '2022-03-07 13:22:46'),
(701, 'Service keyword', 87, 140, 'sad', '2022-03-07 14:49:45', '2022-03-07 14:49:45'),
(703, 'Service keyword', 88, 140, 'dasdasd', '2022-03-07 14:50:20', '2022-03-07 14:50:20'),
(704, 'Service keyword', 83, 140, 'crystal', '2022-03-07 14:50:43', '2022-03-07 14:50:43'),
(705, 'Service keyword', 83, 140, 'clear', '2022-03-07 14:50:43', '2022-03-07 14:50:43'),
(706, 'Service keyword', 83, 140, 'Wash', '2022-03-07 14:50:43', '2022-03-07 14:50:43'),
(707, 'Service keyword', 89, 140, 'das', '2022-03-07 14:56:29', '2022-03-07 14:56:29'),
(708, 'Service keyword', 90, 140, 'dasdas', '2022-03-07 14:57:54', '2022-03-07 14:57:54'),
(709, 'Service keyword', 91, 140, 'dsds', '2022-03-07 15:02:22', '2022-03-07 15:02:22'),
(710, 'Service keyword', 92, 140, 'dasdas', '2022-03-07 15:03:55', '2022-03-07 15:03:55'),
(711, 'Service keyword', 93, 140, 'seas', '2022-03-07 15:05:25', '2022-03-07 15:05:25'),
(712, 'User keyword', 142, 142, 'men', '2022-03-07 15:22:15', '2022-03-07 15:22:15'),
(713, 'User keyword', 142, 142, 'saloon', '2022-03-07 15:22:15', '2022-03-07 15:22:15'),
(714, 'User keyword', 142, 142, 'menlook', '2022-03-07 15:22:15', '2022-03-07 15:22:15'),
(715, 'User keyword', 142, 142, 'style', '2022-03-07 15:22:15', '2022-03-07 15:22:15'),
(716, 'Service keyword', 94, 142, 'sdas', '2022-03-07 15:23:01', '2022-03-07 15:23:01'),
(717, 'Service keyword', 94, 142, 'ChristinaProvider', '2022-03-07 15:23:01', '2022-03-07 15:23:01'),
(718, 'Service keyword', 95, 142, 'ChristinaProvider', '2022-03-07 15:23:31', '2022-03-07 15:23:31'),
(719, 'Service keyword', 95, 142, 'Service', '2022-03-07 15:23:31', '2022-03-07 15:23:31'),
(720, 'Service keyword', 95, 142, '2', '2022-03-07 15:23:31', '2022-03-07 15:23:31'),
(727, 'Service keyword', 97, 142, 'ddasd', '2022-03-07 16:39:14', '2022-03-07 16:39:14'),
(728, 'Service keyword', 98, 142, 'serviceDetails', '2022-03-08 12:37:32', '2022-03-08 12:37:32'),
(735, 'Service keyword', 99, 142, 'status', '2022-03-08 12:49:58', '2022-03-08 12:49:58'),
(736, 'Service keyword', 99, 142, 'status', '2022-03-08 12:49:58', '2022-03-08 12:49:58'),
(738, 'Service keyword', 101, 142, 'blah', '2022-03-08 12:50:57', '2022-03-08 12:50:57'),
(740, 'Service keyword', 100, 142, 'blah', '2022-03-08 12:53:23', '2022-03-08 12:53:23'),
(745, 'Service keyword', 96, 142, 'oppo', '2022-03-08 12:59:47', '2022-03-08 12:59:47'),
(746, 'Service keyword', 96, 142, 'oppo', '2022-03-08 12:59:47', '2022-03-08 12:59:47'),
(747, 'Service keyword', 96, 142, 'oppo', '2022-03-08 12:59:47', '2022-03-08 12:59:47'),
(748, 'Service keyword', 96, 142, 'oppo', '2022-03-08 12:59:47', '2022-03-08 12:59:47'),
(749, 'Service keyword', 96, 142, 'oppo', '2022-03-08 12:59:47', '2022-03-08 12:59:47'),
(751, 'Service keyword', 102, 142, 'blah', '2022-03-08 13:01:50', '2022-03-08 13:01:50'),
(752, 'Service keyword', 104, 142, 'serviceee', '2022-03-08 13:03:12', '2022-03-08 13:03:12'),
(753, 'Service keyword', 104, 142, 'create', '2022-03-08 13:03:12', '2022-03-08 13:03:12'),
(754, 'Service keyword', 104, 142, 'test', '2022-03-08 13:03:12', '2022-03-08 13:03:12'),
(768, 'Service keyword', 103, 142, 'styles', '2022-03-08 13:14:26', '2022-03-08 13:14:26'),
(769, 'Service keyword', 103, 142, 'men', '2022-03-08 13:14:26', '2022-03-08 13:14:26'),
(775, 'Service keyword', 105, 142, 'serviceee', '2022-03-08 13:18:19', '2022-03-08 13:18:19'),
(776, 'Service keyword', 105, 142, 'create', '2022-03-08 13:18:19', '2022-03-08 13:18:19'),
(777, 'Service keyword', 105, 142, 'test', '2022-03-08 13:18:19', '2022-03-08 13:18:19'),
(782, 'Service keyword', 107, 142, 'sadas', '2022-03-08 13:19:38', '2022-03-08 13:19:38'),
(783, 'Service keyword', 107, 142, 'ad', '2022-03-08 13:19:38', '2022-03-08 13:19:38'),
(784, 'Service keyword', 107, 142, 'as', '2022-03-08 13:19:38', '2022-03-08 13:19:38'),
(785, 'Service keyword', 107, 142, 'as', '2022-03-08 13:19:38', '2022-03-08 13:19:38'),
(800, 'Service keyword', 106, 142, 'styles', '2022-03-08 14:58:37', '2022-03-08 14:58:37'),
(801, 'Service keyword', 106, 142, 'men', '2022-03-08 14:58:37', '2022-03-08 14:58:37'),
(805, 'Service keyword', 109, 142, 'dasdasdasd', '2022-03-08 15:06:58', '2022-03-08 15:06:58'),
(808, 'Service keyword', 108, 142, 'fdfd', '2022-03-08 15:44:22', '2022-03-08 15:44:22'),
(809, 'User keyword', 144, 144, 'Decor', '2022-03-08 16:17:51', '2022-03-08 16:17:51'),
(810, 'User keyword', 144, 144, 'stylus', '2022-03-08 16:17:51', '2022-03-08 16:17:51'),
(811, 'Service keyword', 110, 142, 'dasdasd', '2022-03-08 16:40:50', '2022-03-08 16:40:50'),
(812, 'Service keyword', 111, 144, 'green', '2022-03-08 16:56:31', '2022-03-08 16:56:31'),
(813, 'Service keyword', 111, 144, 'decor', '2022-03-08 16:56:31', '2022-03-08 16:56:31'),
(815, 'Service keyword', 112, 142, 'asdasd', '2022-03-09 10:27:40', '2022-03-09 10:27:40'),
(816, 'Service keyword', 113, 142, 'Testing', '2022-03-09 11:03:07', '2022-03-09 11:03:07'),
(817, 'Service keyword', 113, 142, 'Status', '2022-03-09 11:03:07', '2022-03-09 11:03:07'),
(818, 'Service keyword', 114, 142, 'service', '2022-03-09 11:11:52', '2022-03-09 11:11:52'),
(819, 'Service keyword', 114, 142, 'Order', '2022-03-09 11:11:52', '2022-03-09 11:11:52'),
(820, 'Service keyword', 115, 142, 'New', '2022-03-09 11:28:10', '2022-03-09 11:28:10'),
(821, 'Service keyword', 115, 142, 'Service', '2022-03-09 11:28:10', '2022-03-09 11:28:10'),
(822, 'Service keyword', 115, 142, 'TEst', '2022-03-09 11:28:10', '2022-03-09 11:28:10'),
(823, 'Service keyword', 116, 142, 'okayyyy', '2022-03-09 11:29:10', '2022-03-09 11:29:10'),
(824, 'Service keyword', 117, 142, 'service', '2022-03-09 11:54:17', '2022-03-09 11:54:17'),
(825, 'Service keyword', 117, 142, 'test', '2022-03-09 11:54:17', '2022-03-09 11:54:17'),
(827, 'Service keyword', 119, 142, 'My', '2022-03-09 14:53:46', '2022-03-09 14:53:46'),
(828, 'Service keyword', 119, 142, 'service', '2022-03-09 14:53:46', '2022-03-09 14:53:46'),
(829, 'Service keyword', 119, 142, 'My', '2022-03-09 14:53:46', '2022-03-09 14:53:46'),
(830, 'Service keyword', 119, 142, 'service', '2022-03-09 14:53:46', '2022-03-09 14:53:46'),
(831, 'Service keyword', 120, 142, 'newwwww', '2022-03-09 14:54:21', '2022-03-09 14:54:21'),
(832, 'Service keyword', 121, 142, 'TESTING KEYWORDS', '2022-03-09 15:28:04', '2022-03-09 15:28:04'),
(833, 'Service keyword', 121, 142, 'TESTING KEYWORDS', '2022-03-09 15:28:04', '2022-03-09 15:28:04'),
(834, 'Service keyword', 121, 142, 'SDSDASD', '2022-03-09 15:28:04', '2022-03-09 15:28:04'),
(835, 'Service keyword', 121, 142, 'EQWEQWE', '2022-03-09 15:28:04', '2022-03-09 15:28:04'),
(836, 'Service keyword', 121, 142, 'ASDASDASDASDASDASDSDASDSDAS', '2022-03-09 15:28:04', '2022-03-09 15:28:04'),
(837, 'Service keyword', 118, 142, 'Dasds', '2022-03-09 15:55:07', '2022-03-09 15:55:07'),
(838, 'Service keyword', 118, 142, 'Dasdasd', '2022-03-09 15:55:07', '2022-03-09 15:55:07'),
(839, 'Service keyword', 123, 142, 'create testing', '2022-03-09 16:18:40', '2022-03-09 16:18:40'),
(840, 'Service keyword', 124, 142, 'new service cuz', '2022-03-09 16:23:47', '2022-03-09 16:23:47'),
(841, 'Service keyword', 127, 142, 'Dsdsa', '2022-03-09 16:33:23', '2022-03-09 16:33:23'),
(842, 'Service keyword', 128, 142, 'Fdsf', '2022-03-09 16:36:38', '2022-03-09 16:36:38'),
(843, 'Service keyword', 129, 142, 'qaws', '2022-03-10 09:33:44', '2022-03-10 09:33:44'),
(844, 'Service keyword', 129, 142, 'Dddd', '2022-03-10 09:33:44', '2022-03-10 09:33:44'),
(845, 'Service keyword', 129, 142, 'Adasdas', '2022-03-10 09:33:44', '2022-03-10 09:33:44'),
(846, 'Service keyword', 130, 142, 'justttt justttt', '2022-03-10 09:40:23', '2022-03-10 09:40:23'),
(847, 'Service keyword', 130, 142, 'justttt', '2022-03-10 09:40:23', '2022-03-10 09:40:23'),
(848, 'Service keyword', 130, 142, 'justttt', '2022-03-10 09:40:23', '2022-03-10 09:40:23'),
(849, 'Service keyword', 131, 142, 'new service', '2022-03-10 09:42:45', '2022-03-10 09:42:45'),
(850, 'Service keyword', 132, 142, 'Sd', '2022-03-10 09:46:34', '2022-03-10 09:46:34'),
(851, 'Service keyword', 133, 142, 'Asdas', '2022-03-10 09:49:45', '2022-03-10 09:49:45'),
(852, 'Service keyword', 134, 142, 'Service 2', '2022-03-10 09:52:16', '2022-03-10 09:52:16'),
(853, 'Service keyword', 135, 142, 'Service 3', '2022-03-10 09:53:22', '2022-03-10 09:53:22'),
(854, 'Service keyword', 136, 142, 'Dd', '2022-03-10 09:57:12', '2022-03-10 09:57:12'),
(855, 'Service keyword', 137, 142, 'Service 5', '2022-03-10 09:59:25', '2022-03-10 09:59:25'),
(856, 'Service keyword', 138, 142, 'Sds', '2022-03-10 10:07:49', '2022-03-10 10:07:49'),
(857, 'Service keyword', 139, 142, '77', '2022-03-10 10:11:16', '2022-03-10 10:11:16'),
(858, 'Service keyword', 140, 142, 'Fdsf', '2022-03-10 10:13:41', '2022-03-10 10:13:41'),
(859, 'Service keyword', 141, 142, 'Dasd', '2022-03-10 10:20:23', '2022-03-10 10:20:23'),
(860, 'Service keyword', 142, 142, 'Ad', '2022-03-10 10:20:47', '2022-03-10 10:20:47'),
(861, 'Service keyword', 143, 142, 'Dasd', '2022-03-10 10:25:14', '2022-03-10 10:25:14'),
(862, 'Service keyword', 144, 142, 'S', '2022-03-10 10:27:24', '2022-03-10 10:27:24'),
(867, 'Service keyword', 168, 142, 'keywordsdfdsf', '2022-03-10 13:12:59', '2022-03-10 13:12:59'),
(868, 'Service keyword', 168, 142, 'Fdsfdfdsf', '2022-03-10 13:12:59', '2022-03-10 13:12:59'),
(869, 'Service keyword', 171, 142, 'Edit', '2022-03-10 14:57:47', '2022-03-10 14:57:47'),
(871, 'Service keyword', 182, 142, 'Fyf', '2022-03-11 09:59:22', '2022-03-11 09:59:22'),
(872, 'Service keyword', 192, 146, 'Hlh', '2022-03-11 14:56:55', '2022-03-11 14:56:55'),
(873, 'Service keyword', 193, 146, 'Uyi', '2022-03-11 15:01:04', '2022-03-11 15:01:04'),
(874, 'Service keyword', 194, 146, 'Qwerty', '2022-03-11 15:01:45', '2022-03-11 15:01:45'),
(875, 'Service keyword', 194, 146, 'Qqqq', '2022-03-11 15:01:45', '2022-03-11 15:01:45'),
(876, 'Service keyword', 194, 146, '343424', '2022-03-11 15:01:45', '2022-03-11 15:01:45'),
(877, 'Service keyword', 194, 146, 'Ewe', '2022-03-11 15:01:45', '2022-03-11 15:01:45'),
(878, 'Service keyword', 194, 146, '453', '2022-03-11 15:01:45', '2022-03-11 15:01:45'),
(879, 'Service keyword', 195, 146, 'Asdasdasd', '2022-03-11 15:04:00', '2022-03-11 15:04:00'),
(880, 'Service keyword', 195, 146, 'Adsasdasd', '2022-03-11 15:04:00', '2022-03-11 15:04:00'),
(881, 'Service keyword', 195, 146, 'Daasdasd', '2022-03-11 15:04:00', '2022-03-11 15:04:00'),
(882, 'Service keyword', 195, 146, 'Asda', '2022-03-11 15:04:00', '2022-03-11 15:04:00'),
(883, 'Service keyword', 195, 146, 'Asdasd', '2022-03-11 15:04:00', '2022-03-11 15:04:00'),
(884, 'Service keyword', 196, 146, 'Qwerer', '2022-03-11 15:05:06', '2022-03-11 15:05:06'),
(885, 'Service keyword', 196, 146, 'Qweqwewe', '2022-03-11 15:05:06', '2022-03-11 15:05:06'),
(886, 'Service keyword', 196, 146, 'Qweqweqw', '2022-03-11 15:05:06', '2022-03-11 15:05:06'),
(887, 'Service keyword', 196, 146, 'Weqweqe', '2022-03-11 15:05:06', '2022-03-11 15:05:06'),
(888, 'User keyword', 148, 148, 'Edgar DEsignnnnss', '2022-03-11 16:13:52', '2022-03-11 16:13:52'),
(889, 'User keyword', 148, 148, 'Edgar', '2022-03-11 16:13:52', '2022-03-11 16:13:52'),
(890, 'User keyword', 148, 148, 'Designnnnss', '2022-03-11 16:13:52', '2022-03-11 16:13:52'),
(891, 'Service keyword', 3, 148, 'Hl', '2022-03-11 16:24:47', '2022-03-11 16:24:47'),
(892, 'Service keyword', 7, 148, 'Testing', '2022-03-15 08:29:22', '2022-03-15 08:29:22'),
(893, 'Service keyword', 7, 148, '123', '2022-03-15 08:29:22', '2022-03-15 08:29:22'),
(894, 'Service keyword', 7, 148, 'Bleerle', '2022-03-15 08:29:22', '2022-03-15 08:29:22'),
(895, 'Service keyword', 7, 148, 'Dasdas', '2022-03-15 08:29:22', '2022-03-15 08:29:22'),
(896, 'Service keyword', 7, 148, 'Sdsa', '2022-03-15 08:29:22', '2022-03-15 08:29:22'),
(905, 'User keyword', 146, 146, 'Trenton', '2022-03-15 11:20:19', '2022-03-15 11:20:19'),
(906, 'User keyword', 146, 146, 'Designers', '2022-03-15 11:20:19', '2022-03-15 11:20:19'),
(907, 'User keyword', 146, 146, 'WeDesign', '2022-03-15 11:20:19', '2022-03-15 11:20:19'),
(908, 'User keyword', 146, 146, 'Designersssss', '2022-03-15 11:20:19', '2022-03-15 11:20:19'),
(922, 'Service keyword', 10, 150, 'styles', '2022-03-16 08:22:22', '2022-03-16 08:22:22'),
(923, 'Service keyword', 10, 150, 'men', '2022-03-16 08:22:22', '2022-03-16 08:22:22'),
(930, 'Service keyword', 11, 150, 'Asds', '2022-03-16 08:26:05', '2022-03-16 08:26:05'),
(944, 'Service keyword', 9, 150, 'Duaneee MekeUp Service', '2022-03-16 08:34:27', '2022-03-16 08:34:27'),
(945, 'Service keyword', 9, 150, 'Duaneee', '2022-03-16 08:34:27', '2022-03-16 08:34:27'),
(946, 'Service keyword', 9, 150, 'Testing', '2022-03-16 08:34:27', '2022-03-16 08:34:27'),
(950, 'Service keyword', 13, 150, 'Asdas', '2022-03-16 08:35:17', '2022-03-16 08:35:17'),
(951, 'Service keyword', 13, 150, 'Asdasdasdasdasdasd', '2022-03-16 08:35:17', '2022-03-16 08:35:17'),
(959, 'Service keyword', 12, 150, 'New1', '2022-03-16 08:43:17', '2022-03-16 08:43:17'),
(960, 'Service keyword', 12, 150, 'New2', '2022-03-16 08:43:17', '2022-03-16 08:43:17'),
(961, 'Service keyword', 12, 150, 'New3', '2022-03-16 08:43:17', '2022-03-16 08:43:17'),
(962, 'User keyword', 150, 150, 'NewYork', '2022-03-16 08:43:48', '2022-03-16 08:43:48'),
(963, 'User keyword', 150, 150, 'Artist', '2022-03-16 08:43:48', '2022-03-16 08:43:48'),
(964, 'User keyword', 151, 151, 'men', '2022-04-06 02:06:16', '2022-04-06 02:06:16'),
(965, 'User keyword', 151, 151, 'saloon', '2022-04-06 02:06:16', '2022-04-06 02:06:16'),
(966, 'User keyword', 151, 151, 'menlook', '2022-04-06 02:06:16', '2022-04-06 02:06:16'),
(967, 'User keyword', 151, 151, 'style', '2022-04-06 02:06:16', '2022-04-06 02:06:16');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `wildcard` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `identifier`, `subject`, `body`, `wildcard`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'forgot-password', 'Forgot Password Confirmation', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n    <tr>\r\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n                <tr>\r\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">A request has been made to recover password for your account. Please follow below link to generate new password for your account :</p>\r\n                        <p><a href=\"[LINK]\">Reset Password</a></p>\r\n                        <br>\r\n                        <br>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\r\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2022-02-03 01:26:36', NULL, NULL),
(2, 'user_registration', 'Welcome to [APP_NAME]', '<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\n    <tr>\n        <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\n                <tr>\n                    <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Hi [USERNAME],</p>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Your account has been created successfully. First, you need to confirm your account. Just click the below link</p>\n                        <p><a href=\"[LINK]\">Verify Now</a></p>\n                        <br>\n                        <br>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">Regards,</p>\n                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">© [YEAR] [APP_NAME] All Rights reserved.</p>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>\n', '[USERNAME],[LINK],[YEAR],[APP_NAME]', '2022-02-03 01:26:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_id` int(11) NOT NULL,
  `filename` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_url_blur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail_url` text COLLATE utf8mb4_unicode_ci,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `media_type` enum('public','private') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `meta` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2021_03_05_000000_create_cms_roles_table', 1),
(3, '2021_03_05_172240_create_cms_users_table', 1),
(4, '2021_03_05_174918_create_cms_modules_table', 1),
(5, '2021_03_05_175415_create_cms_module_permissions_table', 1),
(6, '2021_03_06_185651_create_mail_templates_table', 1),
(7, '2021_03_08_191839_create_reset_password_table', 1),
(8, '2021_03_13_121206_create_application_setting_table', 1),
(9, '2021_04_20_200223_create_user_groups_table', 1),
(12, '2021_06_04_181436_create_notification_table', 1),
(13, '2021_06_06_130550_create_notification_setting_table', 1),
(14, '2021_08_29_105840_create_jobs_table', 1),
(15, '2021_09_07_154417_create_cms_widgets_table', 1),
(16, '2021_09_07_161059_create_cms_widget_role_table', 1),
(17, '2021_09_08_081135_create_content_management_table', 1),
(18, '2021_09_08_082346_create_faqs_table', 1),
(19, '2021_09_20_180624_create_media_table', 1),
(21, '2021_04_20_202053_create_user_api_token_table', 3),
(22, '2021_04_20_200451_create_users_table', 4),
(23, '2022_02_14_065536_create_categories_table', 5),
(24, '2022_02_14_065709_create_services_table', 5),
(25, '2022_02_14_070717_create_keywords_table', 5),
(26, '2022_02_16_111148_create_orders_table', 6),
(27, '2022_02_16_111208_create_order_items_table', 6),
(28, '2022_03_04_065902_create_reviews_table', 7),
(29, '2022_03_14_124749_create_provider_transactions', 8),
(30, '2022_04_05_105425_create_user_cash_out', 9),
(32, '2022_04_14_065142_create_user_bank_details', 10),
(33, '2022_04_14_112353_create_user_cards', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor_id` int(11) NOT NULL,
  `actor_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `target_id` int(11) NOT NULL,
  `target_type` enum('users','cms_users') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'users',
  `reference_id` int(11) NOT NULL,
  `reference_module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_redirect_link` text COLLATE utf8mb4_unicode_ci,
  `is_read` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `is_view` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `unique_id`, `identifier`, `actor_id`, `actor_type`, `target_id`, `target_type`, `reference_id`, `reference_module`, `title`, `description`, `web_redirect_link`, `is_read`, `is_view`, `created_at`, `updated_at`) VALUES
(1, '624e9801dfe4d', 'new_order', 147, 'users', 148, 'users', 39, 'order', 'PRESS-Link', 'You have a new order #39', NULL, '0', '0', '2022-04-07 02:51:29', '2022-04-07 07:17:31'),
(6, '624eb0778455d', 'update_order', 148, 'users', 147, 'users', 39, 'order', 'PRESS-Link', 'Your appointment request has been rejected by David Provider at 14th February 2022, 08:10 AM', NULL, '0', '0', '2022-04-07 04:35:51', '2022-04-07 04:45:47'),
(7, '624eb243c417a', 'update_order', 148, 'users', 147, 'users', 39, 'order', 'PRESS-Link', 'Your session with David Provider has been completed, Please rate his services', NULL, '0', '0', '2022-04-07 04:43:31', '2022-04-07 04:45:47'),
(8, '624ed61d46d6a', 'new_order', 147, 'users', 148, 'users', 40, 'order', 'PRESS-Link', 'You have a new appointment request #40', NULL, '0', '0', '2022-04-07 07:16:29', '2022-04-07 07:17:31'),
(9, '625d2da700686', 'new_order', 160, 'users', 148, 'users', 41, 'order', 'PRESS-Link', 'You have a new appointment request #41', NULL, '0', '0', '2022-04-18 04:21:43', NULL),
(10, '625d2e3e704ba', 'update_order', 148, 'users', 160, 'users', 41, 'order', 'PRESS-Link', 'Your appointment request has been rejected by David Provider at 14th February 2022, 08:10 AM', NULL, '0', '0', '2022-04-18 04:24:14', NULL),
(11, '625d307d7549f', 'new_order', 161, 'users', 148, 'users', 42, 'order', 'PRESS-Link', 'You have a new appointment request #42', NULL, '0', '0', '2022-04-18 04:33:49', NULL),
(12, '625d30d1b7035', 'update_order', 148, 'users', 161, 'users', 42, 'order', 'PRESS-Link', 'Your appointment request has been accepted by David Provider at 14th February 2022, 08:10 AM', NULL, '0', '0', '2022-04-18 04:35:13', NULL),
(13, '6278ceafcac5f', 'update_order', 148, 'users', 147, 'users', 1, 'order', 'PRESS-Link', 'Your appointment request has been accepted by David Provider at 27th April 2022, 12:47 PM', NULL, '0', '0', '2022-05-09 03:19:59', NULL),
(14, '6278cee122ff0', 'update_order', 148, 'users', 147, 'users', 1, 'order', 'PRESS-Link', 'Your appointment request has been accepted by David Provider at 27th April 2022, 12:47 PM', NULL, '0', '0', '2022-05-09 03:20:49', NULL),
(15, '6278cf36903cd', 'update_order', 148, 'users', 147, 'users', 1, 'order', 'PRESS-Link', 'Your appointment request has been accepted by David Provider at 27th April 2022, 12:47 PM', NULL, '0', '0', '2022-05-09 03:22:14', NULL),
(16, '6278d0bd2d6ef', 'update_order', 148, 'users', 147, 'users', 1, 'order', 'PRESS-Link', 'Your appointment request has been accepted by David Provider at 27th April 2022, 12:47 PM', NULL, '0', '0', '2022-05-09 03:28:45', NULL),
(17, '6278d18fa667a', 'update_order', 148, 'users', 147, 'users', 1, 'order', 'PRESS-Link', 'Your session with David Provider has been completed, Please rate his services', NULL, '0', '0', '2022-05-09 03:32:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `chat_room_identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `transition_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_note` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_job` datetime DEFAULT NULL,
  `end_job` datetime DEFAULT NULL,
  `grand_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `include_vat` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 => pending, 1=>accepted, 2=>rejected, 3=>completed',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `slug`, `user_id`, `provider_id`, `chat_room_identifier`, `date_time`, `transition_id`, `card_id`, `additional_note`, `address`, `latitude`, `longitude`, `start_job`, `end_job`, `grand_total`, `include_vat`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '622b2bcebbf6c1646996430', 147, 148, 'order-chat-room-1', '2022-04-27 12:47:44', NULL, NULL, NULL, '732 Andreanne Rest', '56.6850', '-113.8341', NULL, '2022-05-09 08:32:15', '999999.99', '0.00', 3, NULL, '2022-03-11 16:00:30', '2022-05-09 03:32:15'),
(2, '622b3597829811646998935', 147, 148, NULL, '2022-03-11 03:31:59', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', '2022-03-11 11:45:21', '2022-03-11 11:45:25', '999999.99', '0.00', 3, NULL, '2022-03-11 16:42:15', '2022-03-11 16:45:25'),
(3, '623016418118e1647318593', 147, 148, NULL, '2022-03-14 21:16:50', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', '2022-03-15 04:30:34', '2022-03-15 04:30:41', '215.00', '0.00', 3, NULL, '2022-03-15 08:29:53', '2022-03-15 08:30:41'),
(4, '62302e1d27b7d1647324701', 147, 148, NULL, '2022-03-14 23:11:34', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '415.00', '0.00', 0, NULL, '2022-03-15 10:11:41', '2022-03-15 10:11:41'),
(5, '62302f05344091647324933', 147, 148, NULL, '2022-03-14 23:15:25', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '615.00', '0.00', 0, NULL, '2022-03-15 10:15:33', '2022-03-15 10:15:33'),
(6, '62302f335c6f21647324979', 147, 148, NULL, '2022-03-14 23:16:04', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '815.00', '0.00', 0, NULL, '2022-03-15 10:16:19', '2022-03-15 10:16:19'),
(7, '62302f84c88a21647325060', 147, 148, NULL, '2022-03-14 23:16:32', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1015.00', '0.00', 0, NULL, '2022-03-15 10:17:40', '2022-03-15 10:17:40'),
(8, '62302fc8d41ea1647325128', 147, 146, NULL, '2022-03-14 23:16:32', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1030.00', '0.00', 0, NULL, '2022-03-15 10:18:48', '2022-03-15 10:18:48'),
(9, '6230307f219551647325311', 147, 146, NULL, '2022-03-14 23:21:36', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1045.00', '0.00', 0, NULL, '2022-03-15 10:21:51', '2022-03-15 10:21:51'),
(10, '62303162cb28b1647325538', 147, 148, NULL, '2022-03-14 23:24:52', NULL, NULL, 'adddddddddddd', 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1245.00', '0.00', 0, NULL, '2022-03-15 10:25:38', '2022-03-15 10:25:38'),
(11, '623031a20c3081647325602', 147, 148, NULL, '2022-03-14 23:26:35', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1445.00', '0.00', 0, NULL, '2022-03-15 10:26:42', '2022-03-15 10:26:42'),
(12, '6230325b3d60b1647325787', 147, 148, NULL, '2022-03-14 23:29:35', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1645.00', '0.00', 0, NULL, '2022-03-15 10:29:47', '2022-03-15 10:29:47'),
(13, '623032c1392731647325889', 147, 146, NULL, '2022-03-14 23:31:10', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1660.00', '0.00', 0, NULL, '2022-03-15 10:31:29', '2022-03-15 10:31:29'),
(14, '6230467fb0b311647330943', 147, 148, NULL, '2022-03-15 00:40:30', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1860.00', '0.00', 0, NULL, '2022-03-15 11:55:43', '2022-03-15 11:55:43'),
(15, '623067c043a4d1647339456', 147, 148, NULL, '2022-03-15 03:08:36', NULL, NULL, 'tesidasda', 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1960.00', '0.00', 0, NULL, '2022-03-15 14:17:36', '2022-03-15 14:17:36'),
(16, '62306891636771647339665', 147, 146, NULL, '2022-03-15 03:08:36', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '1975.00', '0.00', 0, NULL, '2022-03-15 14:21:05', '2022-03-15 14:21:05'),
(17, '6230692c77e2e1647339820', 147, 148, NULL, '2022-03-15 03:08:36', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '2175.00', '0.00', 0, NULL, '2022-03-15 14:23:40', '2022-03-15 14:23:40'),
(18, '62306ae4259d31647340260', 149, 148, NULL, '2022-03-15 03:27:50', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '2375.00', '0.00', 0, NULL, '2022-03-15 14:31:00', '2022-03-15 14:31:00'),
(19, '62306b7662b891647340406', 147, 148, NULL, '2022-03-15 03:27:50', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', '2022-03-18 06:51:49', '2022-03-18 06:53:01', '2475.00', '0.00', 3, NULL, '2022-03-15 14:33:26', '2022-03-18 01:53:02'),
(20, '62306ba8daf141647340456', 149, 148, NULL, '2022-03-15 03:27:50', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '2475.00', '0.00', 0, NULL, '2022-03-15 14:34:16', '2022-03-15 14:34:16'),
(21, '62306be6a87ef1647340518', 149, 148, NULL, '2022-03-15 03:34:37', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '2575.00', '0.00', 0, NULL, '2022-03-15 14:35:18', '2022-03-15 14:35:18'),
(22, '62306dfdb42a71647341053', 149, 148, NULL, '2022-03-15 03:44:07', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '2775.00', '0.00', 0, NULL, '2022-03-15 14:44:13', '2022-03-15 14:44:13'),
(23, '62306e28f0b331647341096', 149, 146, NULL, '2022-03-15 03:44:07', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '2790.00', '0.00', 0, NULL, '2022-03-15 14:44:56', '2022-03-15 14:44:56'),
(24, '62306ebfd74e31647341247', 149, 148, NULL, '2022-04-02 17:00:56', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '2990.00', '0.00', 0, NULL, '2022-03-15 14:47:27', '2022-03-15 14:47:27'),
(25, '62306f0996e301647341321', 149, 148, NULL, '2022-04-02 17:00:56', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '3190.00', '0.00', 0, NULL, '2022-03-15 14:48:41', '2022-03-15 14:48:41'),
(26, '62306f1238d6a1647341330', 149, 148, NULL, '2022-04-02 17:00:56', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '3390.00', '0.00', 0, NULL, '2022-03-15 14:48:50', '2022-03-15 14:48:50'),
(27, '62306f92b2a871647341458', 149, 146, NULL, '2022-03-15 03:50:41', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '3405.00', '0.00', 0, NULL, '2022-03-15 14:50:58', '2022-03-15 14:50:58'),
(28, '62306fd09dbec1647341520', 149, 148, NULL, '2022-03-15 03:51:51', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '3605.00', '0.00', 0, NULL, '2022-03-15 14:52:00', '2022-03-15 14:52:00'),
(29, '62306fef71a101647341551', 149, 146, NULL, '2022-03-15 03:51:51', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '3620.00', '0.00', 0, NULL, '2022-03-15 14:52:31', '2022-03-15 14:52:31'),
(30, '62307000a1a171647341568', 149, 146, NULL, '2022-03-15 03:51:51', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', '2022-03-16 06:35:11', '2022-03-16 10:37:57', '3635.00', '0.00', 3, NULL, '2022-03-15 14:52:48', '2022-03-16 05:37:57'),
(31, '623070fe8f19a1647341822', 149, 148, NULL, '2022-03-15 03:51:51', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '3835.00', '0.00', 0, NULL, '2022-03-15 14:57:02', '2022-03-15 14:57:02'),
(32, '6230712854af71647341864', 149, 148, NULL, '2022-03-15 03:51:51', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '4035.00', '0.00', 0, NULL, '2022-03-15 14:57:44', '2022-03-15 14:57:44'),
(33, '6230752ecedd41647342894', 149, 148, NULL, '2022-03-15 04:03:41', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '4235.00', '0.00', 0, NULL, '2022-03-15 15:14:54', '2022-03-15 15:14:54'),
(34, '623077572e0431647343447', 149, 148, NULL, '2022-03-15 04:23:38', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '4435.00', '0.00', 1, NULL, '2022-03-15 15:24:07', '2022-03-15 15:36:46'),
(35, '62317482e368d1647408258', 149, 148, NULL, '2022-03-15 22:17:48', NULL, NULL, NULL, 'Texas City, TX, USA', '29.383844999999965', '-94.90270019999998', NULL, NULL, '4635.00', '0.00', 0, NULL, '2022-03-16 09:24:18', '2022-03-16 09:24:18'),
(39, '624e9801c1bd51649317889', 147, 148, NULL, '2022-02-14 08:10:44', NULL, NULL, NULL, '732 Andreanne Rest', '56.6850', '-113.8341', NULL, '2022-04-07 09:43:31', '200.00', '0.00', 3, NULL, '2022-04-07 02:51:29', '2022-04-07 04:43:31'),
(40, '624ed61ccb6111649333788', 147, 148, NULL, '2022-02-14 08:10:44', NULL, NULL, NULL, '732 Andreanne Rest', '56.6850', '-113.8341', NULL, NULL, '200.00', '0.00', 0, NULL, '2022-04-07 07:16:28', '2022-04-07 07:16:29'),
(41, '625d2da6ac3091650273702', 160, 148, NULL, '2022-02-14 08:10:44', NULL, '7', NULL, '732 Andreanne Rest', '56.6850', '-113.8341', NULL, NULL, '200.00', '0.00', 1, NULL, '2022-04-18 04:21:42', '2022-04-18 04:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_id`, `provider_id`, `quantity`, `price`, `total`, `deleted_at`, `created_at`, `updated_at`) VALUES
(116, 1, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-11 16:00:30', '2022-03-11 16:00:30'),
(117, 2, 5, 148, 1, '0.00', '0.00', NULL, '2022-03-11 16:42:15', '2022-03-11 16:42:15'),
(118, 3, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 08:29:53', '2022-03-15 08:29:53'),
(119, 4, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 10:11:41', '2022-03-15 10:11:41'),
(120, 5, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 10:15:33', '2022-03-15 10:15:33'),
(121, 6, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 10:16:19', '2022-03-15 10:16:19'),
(122, 7, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 10:17:40', '2022-03-15 10:17:40'),
(123, 8, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 10:18:48', '2022-03-15 10:18:48'),
(124, 9, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 10:21:51', '2022-03-15 10:21:51'),
(125, 10, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 10:25:38', '2022-03-15 10:25:38'),
(126, 11, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 10:26:42', '2022-03-15 10:26:42'),
(127, 12, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 10:29:47', '2022-03-15 10:29:47'),
(128, 13, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 10:31:29', '2022-03-15 10:31:29'),
(129, 14, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 11:55:43', '2022-03-15 11:55:43'),
(130, 15, 6, 148, 1, '100.00', '100.00', NULL, '2022-03-15 14:17:36', '2022-03-15 14:17:36'),
(131, 16, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 14:21:05', '2022-03-15 14:21:05'),
(132, 17, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:23:40', '2022-03-15 14:23:40'),
(133, 18, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:31:00', '2022-03-15 14:31:00'),
(134, 19, 6, 148, 1, '100.00', '100.00', NULL, '2022-03-15 14:33:26', '2022-03-15 14:33:26'),
(135, 20, 5, 148, 1, '0.00', '0.00', NULL, '2022-03-15 14:34:16', '2022-03-15 14:34:16'),
(136, 21, 4, 148, 1, '100.00', '100.00', NULL, '2022-03-15 14:35:18', '2022-03-15 14:35:18'),
(137, 22, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:44:13', '2022-03-15 14:44:13'),
(138, 23, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 14:44:56', '2022-03-15 14:44:56'),
(139, 24, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:47:27', '2022-03-15 14:47:27'),
(140, 25, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:48:41', '2022-03-15 14:48:41'),
(141, 26, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:48:50', '2022-03-15 14:48:50'),
(142, 27, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 14:50:58', '2022-03-15 14:50:58'),
(143, 28, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:52:00', '2022-03-15 14:52:00'),
(144, 29, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 14:52:31', '2022-03-15 14:52:31'),
(145, 30, 2, 146, 1, '15.00', '15.00', NULL, '2022-03-15 14:52:48', '2022-03-15 14:52:48'),
(146, 31, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:57:02', '2022-03-15 14:57:02'),
(147, 32, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 14:57:44', '2022-03-15 14:57:44'),
(148, 33, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 15:14:54', '2022-03-15 15:14:54'),
(149, 34, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-15 15:24:07', '2022-03-15 15:24:07'),
(150, 35, 7, 148, 1, '200.00', '200.00', NULL, '2022-03-16 09:24:18', '2022-03-16 09:24:18'),
(153, 39, 7, 148, 1, '200.00', '200.00', NULL, '2022-04-07 02:51:29', '2022-04-07 02:51:29'),
(154, 40, 7, 148, 1, '200.00', '200.00', NULL, '2022-04-07 07:16:29', '2022-04-07 07:16:29'),
(155, 41, 7, 148, 1, '200.00', '200.00', NULL, '2022-04-18 04:21:42', '2022-04-18 04:21:42');

-- --------------------------------------------------------

--
-- Table structure for table `provider_transactions`
--

CREATE TABLE `provider_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `reference_module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_transactions`
--

INSERT INTO `provider_transactions` (`id`, `provider_id`, `identifier`, `title`, `reference_id`, `reference_module`, `date`, `amount`, `created_at`, `updated_at`) VALUES
(1, 148, 'Order', 'Service 1', 19, 'Order', '2022-03-18', '2475.00', '2022-03-18 01:53:01', '2022-03-18 01:53:01'),
(3, 148, 'Cash Out', 'Cash Out', 3, 'Cash Out', '2022-04-06', '100.00', '2022-04-06 07:23:27', '2022-04-06 07:23:27'),
(4, 148, 'Cash Out', 'Cash Out', 2, 'Cash Out', '2022-04-07', '100.00', '2022-04-06 23:37:50', '2022-04-06 23:37:50'),
(5, 148, 'Order', 'Testing abc', 39, 'Order', '2022-04-07', '200.00', '2022-04-07 04:43:31', '2022-04-07 04:43:31'),
(6, 148, 'Order', 'Service 1', 1, 'Order', '2022-05-09', '999999.99', '2022-05-09 03:32:15', '2022-05-09 03:32:15');

-- --------------------------------------------------------

--
-- Table structure for table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `feedback` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `slug`, `user_id`, `provider_id`, `order_id`, `rating`, `feedback`, `created_at`, `updated_at`) VALUES
(1, '62303278bd3e51647325816', 147, 148, 12, 2, 'Niceeeee', '2022-03-15 10:30:16', '2022-03-15 10:30:16'),
(2, '623032d93b55b1647325913', 147, 146, 13, 4, 'Trenton service is nice', '2022-03-15 10:31:53', '2022-03-15 10:31:53'),
(3, '6230469f36d641647330975', 147, 148, 14, 5, 'Edgarrrrrrr designer works very hard i love their services', '2022-03-15 11:56:15', '2022-03-15 11:56:15'),
(4, '623067e64d35c1647339494', 147, 148, 15, 1, 'Very bad service', '2022-03-15 14:18:14', '2022-03-15 14:18:14'),
(5, '623068a6d26831647339686', 147, 146, 16, 0, 'Not enjoying', '2022-03-15 14:21:26', '2022-03-15 14:21:26'),
(6, '623068debe63c1647339742', 149, 146, 16, 2, 'fdsf fdsfsdf sfsfsd', '2022-03-15 14:22:22', '2022-03-15 14:22:22'),
(7, '62306b03d59cb1647340291', 149, 148, 18, 0, 'Okokok', '2022-03-15 14:31:31', '2022-03-15 14:31:31'),
(9, '62306c18dd1821647340568', 149, 148, 21, 5, 'Coreyy', '2022-03-15 14:36:08', '2022-03-15 14:36:08'),
(10, '62306e08ac4391647341064', 149, 148, 22, 1, 'Sdasd', '2022-03-15 14:44:24', '2022-03-15 14:44:24'),
(11, '62306e3f3b9ae1647341119', 149, 146, 23, 4, 'They are great', '2022-03-15 14:45:19', '2022-03-15 14:45:19'),
(12, '62306fa39e3a11647341475', 149, 146, 27, 3, 'Sdasd', '2022-03-15 14:51:15', '2022-03-15 14:51:15'),
(13, '62306fd9759781647341529', 149, 148, 28, 3, 'Sdsadsadsa', '2022-03-15 14:52:09', '2022-03-15 14:52:09'),
(14, '62306ffb54b511647341563', 149, 146, 29, 3, 'Qqqqq', '2022-03-15 14:52:43', '2022-03-15 14:52:43'),
(15, '62307008a6f4c1647341576', 149, 146, 30, 1, 'Dsds', '2022-03-15 14:52:56', '2022-03-15 14:52:56'),
(16, '62307106230f01647341830', 149, 148, 31, 5, 'Asdsa', '2022-03-15 14:57:10', '2022-03-15 14:57:10'),
(17, '62307537d5b381647342903', 149, 148, 33, 1, 'Ttt', '2022-03-15 15:15:03', '2022-03-15 15:15:03'),
(18, '62307763bf8281647343459', 149, 148, 34, 2, 'Sdas', '2022-03-15 15:24:19', '2022-03-15 15:24:19'),
(19, '6231748ceb2461647408268', 149, 148, 35, 5, 'Todayyy', '2022-03-16 09:24:28', '2022-03-16 09:24:28'),
(43, '6243eebd834d51648619197', 147, 148, 19, 2, 'bad service', '2022-03-30 00:46:37', '2022-03-30 00:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 => deactivate, 1 => active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `category_id`, `user_id`, `title`, `slug`, `image_url`, `description`, `price`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 146, 'Service 1', 'service-1', '{\"image_path\":\"services\\/MYcJLO0xr3s7ofzFbb4b6fYfptguHKwxdiIS033C.png\",\"image_width\":1024,\"image_height\":1024,\"blur_hash\":\"LAFqSKMz00?u{ERQ%2%L4Tt7?uIB\"}', 'lorem lorem lorem lorem lorem', '15.00', 1, NULL, '2022-03-11 15:54:53', '2022-03-11 15:54:53'),
(2, 1, 146, 'Service 1', 'service-11845', '{\"image_path\":\"services\\/5Wss3P1cOaEcsdgZ13Xf92YPauoFu13kMe2PW8Xy.png\",\"image_width\":1024,\"image_height\":1024,\"blur_hash\":\"LAFqSKMz00?u{ERQ%2%L4Tt7?uIB\"}', 'lorem lorem lorem lorem lorem', '15.00', 1, NULL, '2022-03-11 15:56:23', '2022-03-11 15:56:23'),
(3, 1, 148, 'hggk', 'hggk', '{\"image_path\":\"services\\/lgp7KbvvJJi13Xaed5hnwygXuT1YQFNN7w6zKDVQ.jpg\",\"image_width\":4032,\"image_height\":3024,\"blur_hash\":\"LCDacl%$%htT?K?I-r-qLb-;%Nkr\"}', 'Service 1 Description', '100.00', 1, NULL, '2022-03-11 16:24:47', '2022-03-15 15:26:09'),
(4, 1, 148, 'dadasdsda', 'dadasdsda', '{\"image_path\":\"services\\/s62RCH5wKt1XPuUAC5siw4tqvaqlWBrdlOUhI7h4.jpg\",\"image_width\":1127,\"image_height\":709,\"blur_hash\":\"LHJaA=Im00~E#;%Lx[D*55RQs.xt\"}', 'Service 1 Description', '100.00', 1, NULL, '2022-03-11 16:31:34', '2022-03-11 16:31:34'),
(5, 1, 148, 'ppp', 'sadasdasd', '{\"image_path\":\"services\\/wVRncImoSSONL3XmAdPHXMG29UnRQIopPBwoEFqP.jpg\",\"image_width\":4288,\"image_height\":2848,\"blur_hash\":\"LCEpDFRh9P%X~mN1Rj--NHtQt1V@\"}', 'Service 1 Description', '0.00', 1, NULL, '2022-03-11 16:31:50', '2022-03-11 16:35:05'),
(6, 1, 148, 'Service 1', 'service-11735', '{\"image_path\":\"services\\/pPcYUSbCyC3ZkpEnakXgdxzJGG0OYGGae0aerh3E.jpg\",\"image_width\":4032,\"image_height\":3024,\"blur_hash\":\"LCDacl%$%htT?K?I-r-qLb-;%Nkr\"}', 'Service 1 Description', '100.00', 1, NULL, '2022-03-11 16:45:46', '2022-03-11 16:45:46'),
(7, 1, 148, 'Testing abc', 'testing-abc', '{\"image_path\":\"services\\/mhGR3de0d3LKpckBR2TFDryWK9vY4wSdxfq2EwA4.jpg\",\"image_width\":1127,\"image_height\":709,\"blur_hash\":\"LHJaA=Im00~E#;%Lx[D*55RQs.xt\"}', 'Testing described', '200.00', 1, NULL, '2022-03-15 08:29:22', '2022-03-15 08:29:22'),
(8, 1, 147, 'new service for corey', 'new-service-for-corey', '{\"image_path\":\"services\\/8cG04f6HduWWw3CShId0rcQsJkDlnA6lfJyiW5vF.jpg\",\"image_width\":4288,\"image_height\":2848,\"blur_hash\":\"LCEpDFRh9P%X~mN1Rj--NHtQt1V@\"}', 'Service 1 Description', '100.00', 1, NULL, '2022-03-15 14:24:33', '2022-03-15 14:24:33'),
(9, 1, 150, 'Duaneee MakeUp Service Edit', 'duaneee-makeup-service', '{\"image_path\":\"services\\/OgNUAYnEpxQewZ4UQxHjclPKI49vNyzY88QfuobC.jpg\",\"image_width\":3000,\"image_height\":2002,\"blur_hash\":\"LRCZL.xu0Js=^-xuIUjcx^xun,Ri\"}', 'Duaneee MekeUp Service Description Edit', '500.00', 1, NULL, '2022-03-16 08:12:02', '2022-03-16 08:34:27'),
(10, 1, 150, 'lorem lorem12', 'xyz', NULL, 'lorem lorem lorem lorem lorem', '20.00', 1, '2022-03-16 08:33:31', '2022-03-16 08:21:54', '2022-03-16 08:33:31'),
(11, 1, 150, 'Service sdsd', 'service-sdsd', '{\"image_path\":\"services\\/UKAL2s0K08mmLfavUZtivCaY5F4YLaldIvuS709R.jpg\",\"image_width\":4288,\"image_height\":2848,\"blur_hash\":\"L^I5f0%MRjof_4xuWAj]x^oJj?kC\"}', 'Service 1 Description', '20.00', 1, '2022-03-16 08:26:34', '2022-03-16 08:24:31', '2022-03-16 08:26:34'),
(12, 1, 150, 'qqq', 'qqq', '{\"image_path\":\"services\\/f29POmVatucy76VvytvzSMBhjVE2KNKfGorGgHnZ.jpg\",\"image_width\":3000,\"image_height\":2002,\"blur_hash\":\"LWFYfN00xE%M_4DiskxtE4%1RjRk\"}', 'qqqq', '20.00', 1, NULL, '2022-03-16 08:27:09', '2022-03-16 08:43:17'),
(13, 1, 150, 'Tesitng Keywordss', 'tesitng-keywordss', '{\"image_path\":\"services\\/eR4nzZhbxkZghvmgwPRf5QAOUNQSB3iekIhWci5m.jpg\",\"image_width\":4288,\"image_height\":2848,\"blur_hash\":\"LCEpDFRh9P%X~mN1Rj--NHtQt1V@\"}', 'Tesitng Keywordss  Description', '300.00', 1, '2022-03-16 08:35:20', '2022-03-16 08:35:07', '2022-03-16 08:35:20'),
(14, 1, 148, 'ewewewewe', 'ewewewewe', '{\"image_path\":\"services\\/bGSqYEfP6vegAyj2IiMNEDhj9tgAlPYVMIKejqtG.jpg\",\"image_width\":1668,\"image_height\":2500,\"blur_hash\":\"LeFPHT_4-;%M%MM{RjofM{Rjofof\"}', 'Service 1 Description', '100.00', 1, NULL, '2022-03-16 09:40:15', '2022-03-16 09:40:15'),
(15, 1, 148, 'wewewewewewewe', 'wewewewewewewe', '{\"image_path\":\"services\\/LSn504hpuzko7pbSMdit4h1Dttfxpd5902FPDUit.jpg\",\"image_width\":3000,\"image_height\":2002,\"blur_hash\":\"LWFYfN00xE%M_4DiskxtE4%1RjRk\"}', 'Service 1 Description', '100.00', 1, NULL, '2022-03-16 09:40:29', '2022-03-16 09:40:29'),
(16, 1, 148, 'dasdasdasdasdasdasd', 'dasdasdasdasdasdasd', '{\"image_path\":\"services\\/d3odHztJUbRciihV7NP7qttuZkze6VcYftAPEECK.jpg\",\"image_width\":3000,\"image_height\":2002,\"blur_hash\":\"LWFYfN00xE%M_4DiskxtE4%1RjRk\"}', 'Service 1 Description', '100.00', 1, NULL, '2022-03-16 09:40:55', '2022-03-16 09:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stripe_cus_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_group_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `image_url_blur` text COLLATE utf8mb4_unicode_ci,
  `cover_image_url` text COLLATE utf8mb4_unicode_ci,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `is_email_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verify_at` datetime DEFAULT NULL,
  `is_mobile_verify` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_verify_at` datetime DEFAULT NULL,
  `is_approve` tinyint(4) NOT NULL DEFAULT '1',
  `approve_at` datetime DEFAULT NULL,
  `business_category` bigint(20) DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_timings` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_business` text COLLATE utf8mb4_unicode_ci,
  `platform_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `online_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mobile_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` decimal(9,2) NOT NULL DEFAULT '0.00',
  `total_ratings` int(11) NOT NULL DEFAULT '0',
  `total_reviews` int(11) NOT NULL DEFAULT '0',
  `total_earnings` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_remaining` decimal(8,2) NOT NULL DEFAULT '0.00',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `stripe_cus_id`, `user_group_id`, `name`, `username`, `slug`, `email`, `mobile_no`, `password`, `image_url`, `image_url_blur`, `cover_image_url`, `status`, `is_email_verify`, `email_verify_at`, `is_mobile_verify`, `mobile_verify_at`, `is_approve`, `approve_at`, `business_category`, `business_name`, `business_timings`, `about_business`, `platform_id`, `platform_type`, `country`, `city`, `state`, `zipcode`, `address`, `latitude`, `longitude`, `online_status`, `mobile_otp`, `email_otp`, `rating`, `total_ratings`, `total_reviews`, `total_earnings`, `total_remaining`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(147, NULL, 1, 'David', 'david', 'david', 'David@yopmail.com', '+1-2394826486', '$2y$10$4vAhvxPhfUPRPJ/eWIRZv.ZSXKLsjhaHr5hzDYizFD7jeWFRqpJ5G', NULL, NULL, NULL, '1', '1', '2022-03-10 10:22:36', '0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Sdasd', NULL, NULL, '0', NULL, NULL, '0.00', 0, 0, '0.00', '0.00', NULL, '2022-03-10 15:22:29', '2022-03-15 11:52:02', NULL),
(148, NULL, 2, 'David Provider', 'edgar', 'edgar', 'Edgar@yopmail.com', '+1-5403200720', '$2y$10$4vAhvxPhfUPRPJ/eWIRZv.ZSXKLsjhaHr5hzDYizFD7jeWFRqpJ5G', '', NULL, NULL, '1', '1', '2022-03-11 11:14:15', '0', NULL, 1, NULL, 6, 'pizza point', '3:12 AM - 4:13 AM', 'Edgar DEsignnnnss', NULL, NULL, NULL, 'Asdsad', 'Asdasd', '3233223', 'Ssadasd', '43.7184038', '-79.5181406', '0', NULL, NULL, '2.67', 32, 12, '999999.99', '999999.99', NULL, '2022-03-11 16:13:50', '2022-05-09 03:32:15', NULL),
(160, 'cus_LVR7gSNyy5XSyH', 1, 'test', 'test', 'test', 'test12787ssa@yopmail.com', '+92-3242704709', '$2y$10$qTI0Fs4n8Y26ODf2PG2Q0.RXBrPHyvGacbiIuPZSdHWVoZMZVxLDy', 'users/user_default.png', NULL, NULL, '1', '1', '2022-04-14 15:53:46', '0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0.00', 0, 0, '0.00', '0.00', NULL, '2022-04-14 05:51:46', '2022-04-14 05:51:47', NULL),
(162, 'cus_LXHGTDgJFJ91lH', 1, 'test', 'test1358', 'test1358', 'shoaibansari824@gmail.com', '+92-3042161678', '$2y$10$ErFRFzVx/v7Xq3BHTJxbT.2oKFyWoxPN/K1u6c2Uwq7IPHDTZ9K3e', 'users/pAswJFqa4XSobMBRdGizEpK7x7jcgPpZfqZcIafj.png', 'LAFqSKMz00?u{ERQ%2%L4Tt7?uIB', NULL, '1', '0', NULL, '0', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, '0.00', 0, 0, '0.00', '0.00', NULL, '2022-04-19 03:48:05', '2022-04-19 03:48:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_api_token`
--

CREATE TABLE `user_api_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `udid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `platform_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'custom',
  `platform_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_api_token`
--

INSERT INTO `user_api_token` (`id`, `user_id`, `api_token`, `refresh_token`, `udid`, `device_type`, `device_token`, `platform_type`, `platform_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(184, 142, '26481a6f9224fa3079c32e63a6dfd70a53cc96dade21de693798466c8c30b8cf', '1dad5021537941c2c73e0744580148c3d8b68fc4286e19e013496de5b81edf8a', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-15 08:36:57', '2022-03-15 08:36:57', NULL),
(189, 143, '28075a4a7fc65ea6e92e9f0932d9b3a9f17bea94ff58cf250bff1199a8ee76fd', 'a03bf28e00d08d139c08c4465fc1b4050c07db3198e5caff233a3c40d28b5511', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-10 15:20:36', '2022-03-10 15:20:36', NULL),
(190, 144, '25502d954401aed7e53741ace8b8dfd8e41309ba85e01b132fe638b0048dab06', '17f3770beed7274dac35d39fd9e8e403f5f58218933d41c1c0208ef13c6f9f87', 'api.Pd*!(5675', 'android', 'asdasd', 'custom', NULL, '192.140.145.242', 'okhttp/4.9.1', '2022-03-09 10:49:54', '2022-03-09 10:49:54', NULL),
(191, 145, '1a3284b1706347e7b52289ddaa1e91f722f65640f8aa2c6350f1d5c3a62c636e', '77fcac2c404978973d8c8969f8dc428ce886b480ca9e062362aff904c9f7a21f', 'api.Pd*!(5675', 'ios', '1234567890', 'custom', NULL, '74.63.219.202', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-09 15:06:39', NULL, NULL),
(192, 2, '8e40a6dc511259003f81fc1fca26d6d55e5d373b85d1e658c345179db37fb1ed', 'edde7bfe0de5c622d900f5bcc222c72901b81ad10a76070f5defeab117612a63', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-03-11 11:20:01', '2022-03-11 11:20:01', NULL),
(193, 146, 'd4ee00bd8ed4782b5b103814632c0d2e84063c0c75a6942b6dab47c17ff6e32b', '75947738cb2a7ae9a4ee03497c6b7945025cedc99e76b2807e4465c76602f8f2', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-15 12:13:18', '2022-03-15 12:13:18', NULL),
(194, 147, '21697bda293045ec5ed438f80dbb4407d6faac7444eb7042cb4de69a91b4e076', 'a3dc53b8e20449ea86409c347a940d723db3c99d80ba6fac82f998a00a459298', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-15 14:33:06', '2022-03-15 14:33:06', NULL),
(195, 146, '64746b3b5cf94cf3c99423a973fd928569f737320cac85c3ecf9a5f9149569f2', 'ad20a186e807b61a99a197701b9a38cafcc68b87f97e7ab18add48028127c7cb', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-03-11 15:53:53', '2022-03-11 15:53:53', NULL),
(196, 147, 'ec967d040fe4c89eaa2332e313d29f2c714635633682e4e2863c6fc585b3b338', '4776b72d4fb18dc9853227aafab026bd5f1454b82565fab9ab31d6af6b0ffa52', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '110.93.250.194', 'PostmanRuntime/7.29.0', '2022-03-11 15:59:17', '2022-03-11 15:59:17', NULL),
(197, 148, '1e4d0892eb93424f8e320eb27ba26336829b6ebcd474f0542d9e75a10a31ac74', '30664e7cb269079a271aae55161377e334283296729381fda39496c6e4eb12f2', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-16 09:39:50', '2022-03-16 09:39:50', NULL),
(198, 141, 'c2f3d7bf7e602a7cbb64df01ff706a5310ebd86626ebb8970fb7fa36ad36b924', 'ca259cd39c2a4700018e84a9cbe471cf20532be32f339d16cd3e529162f2e528', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-15 08:36:39', '2022-03-15 08:36:39', NULL),
(199, 149, '8baedbdbe0b6955e54a11ce964a30065a3d6929d0514285abb9b00da7263a0bb', '9da1e33efc3592d38c36ea0782e9fb9b2e842809300e740b28aea29607ab498d', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-16 09:41:07', '2022-03-16 09:41:07', NULL),
(200, 150, '3fba9e5d24185cb6039e22f7256a3cabbc2828bf386353520942889c29d39c9e', 'd11039d9af0f62bd3f87720be8eea01a31df55cd458485bb4729373ce27a13e4', 'api.Pd*!(5675', 'ios', 'asdasd', 'custom', NULL, '110.93.250.194', 'Presslink/1 CFNetwork/1220.1 Darwin/19.6.0', '2022-03-16 08:42:34', '2022-03-16 08:42:34', NULL),
(201, 2, '75a10ae154689f25f90b3d2b6d5ed3b9a450d3fad7c400584e49e1c5cc5cd631', '5ae69dbc859c8bab1723bae3e7d92f8ba329702ed20b21bfffff81d9f713f72b', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-03-16 00:59:02', '2022-03-16 00:59:02', NULL),
(202, 147, '7506cc5858fc692598f6166b45d42f05df79630562f2eb1934ec38d1a62f8537', 'e6ac56bdd2819b34876ea38d94ad10d748820770c042b8a5ddf24aacb6641218', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-05-02 04:59:30', '2022-05-02 04:59:30', NULL),
(203, 146, '7d1f5a2ce070e98455f508b6a86eabdd6b0b3ee9e8acd38e88c567c9b117f269', '77c451c1385922d2c2ffb4d986fe3ba9551dbc122666d1456d91699f248c130a', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-03-29 00:53:36', '2022-03-29 00:53:36', NULL),
(204, 148, 'd4e83136f03968860e775c5d1d6a6a2837905df7aa7e62bdb402425452a26ca6', '91b8916cc3f5ad1c7678ecb08e74235bf0ce9d7bac8b07f52010fcb6faf4c1f1', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-05-09 03:14:48', '2022-05-09 03:14:48', NULL),
(205, 151, '76d8929cee30e34e235df3e2cfb514b39bd6f46698d2c5f5525c6c2a3f98c036', '2b20017f89368d172af5e95899fe3923e1b4d544c70961a8dcf48f815cfee9f2', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-06 02:06:14', NULL, NULL),
(206, 152, '57fe9b35d11658843cf8bb0625d2b144756ab1131afc686306b503aae7a7b295', 'f630c184bc359a7aafe0b43f3da908dd53b6e9cb7ffc7ff501db7772d73177f0', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-12 05:43:14', NULL, NULL),
(207, 153, '86520c0c7a62cc9ed37d278ea37c0a60c7f8428d261c382f94871ab321d0a870', 'f2d87ef60903accaf5018bbd3b79f5765c3c9369d9afd6fefc703c05b2216082', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-14 05:28:24', NULL, NULL),
(208, 154, 'f8a499421599d5b5e5624d1c66b9329bfb366b39787e3830e87ab02ff2ee77a9', '6f3880fd7784def1079ec6942dbc16c98424e227b0e5d5de7ef1da014b4dc426', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-14 05:34:09', NULL, NULL),
(209, 155, '986d303316307f8b9e5fb46235fc11613c0428583a8c2bb4c335b050174d1d93', '87f7839c8c2b3849b0ff6e715c51ab1c1c529f5a43dd1846c65c2c206c902280', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-14 05:40:27', NULL, NULL),
(210, 156, '921317baaacd26cc199708dfbb011cb1c21d8a5b51c6283d738d33f7f392d731', '66dd5c3ce128456b7171ce49698422d2ab840d719fcab18a8009ec2f2c83fcab', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-14 05:43:24', NULL, NULL),
(211, 157, '3310ad767773e9b860e9c3f3f19350224e2112fa47dec8926517e23a57485cb0', '118770fd5724a7d68ce6301a83f72f8ed24140cca862a14e8d2080ce48a5d1c2', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-14 05:49:07', NULL, NULL),
(212, 158, 'a2c4427637c6e1621feb85ac1b36fd1e596cce74b34ce4c148d70193581935a4', 'ac64fb8d45313eee3b61e72392afb61804911c9dcbb4b2fa1c147827278bcc24', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-14 05:50:04', NULL, NULL),
(213, 159, 'f6bff91d00d84d1c1f8e3c0a28b88126a9b97abdbc5d6eb64a892c7cd3b00af6', 'e4bc07fd914320f0cc1a58df454b7fc29572c2ce352bae4c3bdf6b848aee1b0b', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-14 05:51:07', NULL, NULL),
(214, 160, '0d01fbe9d93fd30ee99a63539366974270bb46ab656066a7de3a11c93ee9c94a', '5756aabde2bb720e75adc9965aa7135b2b3c1707718608b3e9f92c7cecccd99c', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-05-02 04:59:50', '2022-05-02 04:59:50', NULL),
(215, 161, '63c2cb08f5fa31b3b7b1f274c896b6eba70a9072b77bd4477127e6e583cb47b4', '5386992cfa9b2893c57579337b5b58fe3948a3d30c1ed106cadbc575e7ac4d5c', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-18 04:31:02', '2022-04-18 04:31:02', NULL),
(216, 162, '33e5dddbf7faebbea3e57bc076574437717c7fc267956f99cc3893177300c92f', 'd98681f18759926b7d9acae7d896c022a01b6f1a661f33973be29b0ac5aa416f', 'e772afbf-65a2-4263-9ef9-65a3763d44b4', 'android', '1234567890', 'custom', NULL, '127.0.0.1', 'PostmanRuntime/7.29.0', '2022-04-19 03:48:05', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_bank_details`
--

CREATE TABLE `user_bank_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ss_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routing_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `front_image` text COLLATE utf8mb4_unicode_ci,
  `back_image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_bank_details`
--

INSERT INTO `user_bank_details` (`id`, `slug`, `user_id`, `account_number`, `ss_number`, `routing_number`, `front_image`, `back_image`, `created_at`, `updated_at`) VALUES
(3, '625e4d789f92d1650347384', 148, '12345678910', '123456780', '123456787', '{\"image_path\":\"bank_details\\/flUSrb0AqfLsAjeGOHDkUjhzbKZ5GuSGmphyBKBy.png\",\"image_width\":50,\"image_height\":50,\"blur_hash\":\"LISeOKMx+u~W-pkCV@ae=e%MUGD%\"}', '{\"image_path\":\"bank_details\\/TinV8WVyYo6vy2pxU9IrLxHimXNMafteNuOMgNX8.png\",\"image_width\":138,\"image_height\":147,\"blur_hash\":\"LaSzU-iwy?-pm7V@o}s:yrt7SNRj\"}', '2022-04-19 00:49:44', '2022-04-19 01:11:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE `user_cards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `card_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exp_month` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exp_year` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last4` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '1 => default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_cards`
--

INSERT INTO `user_cards` (`id`, `slug`, `user_id`, `card_id`, `exp_month`, `exp_year`, `last4`, `brand`, `status`, `created_at`, `updated_at`) VALUES
(7, '6258250672fca1649943814', 160, 'eyJpdiI6InR3cXNIamFTUnhXeVUwdVhCUHFRTnc9PSIsInZhbHVlIjoiUFBWYlEvUzFNSzhnWUJ1WjhKY0RNRkZJSnhML0IzT2lYMG8yN3RiemU2VT0iLCJtYWMiOiIzOGVhMWU1ZjllYjU3MzgxNTI5ODFjZDJlYmE4ZDExOTg4YTdjYTUwMTA2OWM4Y2VjMmQwZjQ2M2ZmZGNhNmYzIiwidGFnIjoiIn0=', 'eyJpdiI6InJ4aFh1MTUxYmxpVUpkamRXa0JtcHc9PSIsInZhbHVlIjoiZVhyWjVWUjFZZFp1WEpKdHpFYWRsZz09IiwibWFjIjoiMTRmOTM5MjAwMmZjOTBjZGZiMTU5Y2M0YmM3YTYzZGIzM2I5MGI5MmFjZDdmODc4YmYzNGQyOTQyZjU0MmI5YiIsInRhZyI6IiJ9', 'eyJpdiI6IkpISjZHcUpmMGVZd3JhaTk4R1hNM2c9PSIsInZhbHVlIjoiOXNaV291dzJOZnB2d2tXdUxRYkM4UT09IiwibWFjIjoiNTU3ZWQ3OGMzM2M4YjRiZTYwOWIyYzdkMGFjYmQxZmYzNTUyNjUxZmMwNzNiNWM2NDJiODRiZDI2OTQyMjE5MyIsInRhZyI6IiJ9', 'eyJpdiI6IkZsbHVYb3NoRXRmQjZnWjZiZjlWUnc9PSIsInZhbHVlIjoiclBXSEduZ3JWeW51Q21pRnEvZ0w4Zz09IiwibWFjIjoiYmRhNzRhNjdjMTZjODNhYjRkZGVhNDIxZjc1NDU4OWFlNTlhZDgzMmVlOTRiNGM2ODU4MjdmMjhmMTNiZTY5YSIsInRhZyI6IiJ9', 'eyJpdiI6IktXRlREZW1uNFVqaFM0ZUZ5ck1DSWc9PSIsInZhbHVlIjoiYm1lbHVPQWlEVHNvRjNUR1pRTElHZz09IiwibWFjIjoiYTljMzRmZDE1ZWE5YWRlMzY1YjgxZWEwNzRkODg4NGQxZjI4ZjMxYTExNzk0NjE3OTEyZTcwNDQ2OWRmODUxNyIsInRhZyI6IiJ9', '0', '2022-04-14 08:43:34', '2022-04-15 00:54:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_cash_out`
--

CREATE TABLE `user_cash_out` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 => pending, 1=>accepted, 2=>rejected',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_cash_out`
--

INSERT INTO `user_cash_out` (`id`, `slug`, `user_id`, `admin_id`, `amount`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, '624d4e2e967261649233454', 148, 1, '100.00', NULL, 0, '2022-04-06 03:24:14', '2022-04-06 06:37:08'),
(2, '624d4e3e568171649233470', 148, 1, '100.00', NULL, 1, '2022-04-06 03:24:30', '2022-04-06 23:37:49'),
(3, '624d4e53e53811649233491', 148, 1, '100.00', NULL, 1, '2022-04-06 03:24:51', '2022-04-06 07:23:27'),
(4, '6257e42479b231649927204', 148, 0, '100.00', NULL, 0, '2022-04-14 04:06:44', '2022-04-14 04:06:44'),
(5, '6257e63c9d7dd1649927740', 148, 0, '100.00', NULL, 0, '2022-04-14 04:15:40', '2022-04-14 04:15:40'),
(6, '6257e644df12b1649927748', 148, 0, '100.00', NULL, 0, '2022-04-14 04:15:48', '2022-04-14 04:15:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Service Seeker', 'service-seeker', '1', '2022-02-03 01:26:36', NULL, NULL),
(2, 'Service Provider', 'service-provider', '1', '2022-02-03 01:26:36', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application_setting`
--
ALTER TABLE `application_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_messages_user_id_foreign` (`user_id`),
  ADD KEY `chat_messages_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_messages_message_type_status_index` (`message_type`,`status`);

--
-- Indexes for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_message_status_chat_room_id_foreign` (`chat_room_id`);

--
-- Indexes for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_rooms_created_by_foreign` (`created_by`),
  ADD KEY `identifier` (`identifier`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `chat_room_status`
--
ALTER TABLE `chat_room_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_room_status_user_id_foreign` (`user_id`),
  ADD KEY `chat_room_status_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_room_status_chat_message_id_foreign` (`chat_message_id`),
  ADD KEY `chat_room_status_is_read_index` (`is_read`);

--
-- Indexes for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_room_users_chat_room_id_foreign` (`chat_room_id`),
  ADD KEY `chat_room_users_user_id_foreign` (`user_id`),
  ADD KEY `chat_room_users_last_chat_message_id_foreign` (`last_chat_message_id`),
  ADD KEY `chat_room_users_last_message_timestamp_status_is_owner_index` (`last_message_timestamp`,`status`,`is_owner`);

--
-- Indexes for table `cms_modules`
--
ALTER TABLE `cms_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_modules_name_unique` (`name`),
  ADD UNIQUE KEY `cms_modules_route_name_unique` (`route_name`);

--
-- Indexes for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_module_permissions_cms_role_id_foreign` (`cms_role_id`),
  ADD KEY `cms_module_permissions_cms_module_id_foreign` (`cms_module_id`);

--
-- Indexes for table `cms_roles`
--
ALTER TABLE `cms_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_users_username_unique` (`username`),
  ADD UNIQUE KEY `cms_users_slug_unique` (`slug`),
  ADD UNIQUE KEY `cms_users_email_unique` (`email`),
  ADD UNIQUE KEY `cms_users_mobile_no_unique` (`mobile_no`),
  ADD KEY `cms_users_cms_role_id_foreign` (`cms_role_id`);

--
-- Indexes for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_widgets_widget_type_index` (`widget_type`);

--
-- Indexes for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_widget_role_cms_widget_id_foreign` (`cms_widget_id`),
  ADD KEY `cms_widget_role_cms_role_id_foreign` (`cms_role_id`);

--
-- Indexes for table `content_management`
--
ALTER TABLE `content_management`
  ADD PRIMARY KEY (`id`),
  ADD KEY `content_management_slug_index` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_slug_index` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keywords_module_module_id_user_id_index` (`module`,`module_id`,`user_id`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail_templates_identifier_unique` (`identifier`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_module_module_id_index` (`module`,`module_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_unique_id_identifier_target_id_index` (`unique_id`,`identifier`,`target_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_item_id_foreign` (`item_id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `provider_transactions`
--
ALTER TABLE `provider_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_transactions_provider_id_index` (`provider_id`),
  ADD KEY `provider_transactions_order_id_index` (`reference_id`);

--
-- Indexes for table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_index` (`user_id`),
  ADD KEY `reviews_provider_id_index` (`provider_id`),
  ADD KEY `reviews_order_id_index` (`order_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_category_id_index` (`category_id`),
  ADD KEY `services_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_no_unique` (`mobile_no`),
  ADD KEY `index1` (`user_group_id`,`slug`,`email`,`mobile_no`,`is_email_verify`,`status`);

--
-- Indexes for table `user_api_token`
--
ALTER TABLE `user_api_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_api_token_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `user_api_token_refresh_token_unique` (`refresh_token`),
  ADD KEY `user_api_token_user_id_foreign` (`user_id`),
  ADD KEY `user_api_token_api_token_index` (`api_token`);

--
-- Indexes for table `user_bank_details`
--
ALTER TABLE `user_bank_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_bank_details_user_id_index` (`user_id`);

--
-- Indexes for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_cards_user_id_index` (`user_id`);

--
-- Indexes for table `user_cash_out`
--
ALTER TABLE `user_cash_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_cash_out_user_id_index` (`user_id`),
  ADD KEY `user_cash_out_admin_id_index` (`admin_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application_setting`
--
ALTER TABLE `application_setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_room_status`
--
ALTER TABLE `chat_room_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_modules`
--
ALTER TABLE `cms_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_roles`
--
ALTER TABLE `cms_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_widgets`
--
ALTER TABLE `cms_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_management`
--
ALTER TABLE `content_management`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=968;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `provider_transactions`
--
ALTER TABLE `provider_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `user_api_token`
--
ALTER TABLE `user_api_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `user_bank_details`
--
ALTER TABLE `user_bank_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_cash_out`
--
ALTER TABLE `user_cash_out`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_message_status`
--
ALTER TABLE `chat_message_status`
  ADD CONSTRAINT `chat_message_status_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD CONSTRAINT `chat_rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_room_status`
--
ALTER TABLE `chat_room_status`
  ADD CONSTRAINT `chat_room_status_chat_message_id_foreign` FOREIGN KEY (`chat_message_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_room_status_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_room_status_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_room_users`
--
ALTER TABLE `chat_room_users`
  ADD CONSTRAINT `chat_room_users_chat_room_id_foreign` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_room_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_module_permissions`
--
ALTER TABLE `cms_module_permissions`
  ADD CONSTRAINT `cms_module_permissions_cms_module_id_foreign` FOREIGN KEY (`cms_module_id`) REFERENCES `cms_modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_module_permissions_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD CONSTRAINT `cms_users_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_widget_role`
--
ALTER TABLE `cms_widget_role`
  ADD CONSTRAINT `cms_widget_role_cms_role_id_foreign` FOREIGN KEY (`cms_role_id`) REFERENCES `cms_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_widget_role_cms_widget_id_foreign` FOREIGN KEY (`cms_widget_id`) REFERENCES `cms_widgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
