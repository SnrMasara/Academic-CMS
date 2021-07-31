-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2021 at 08:06 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academic`
--

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `thumbnail_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `project_id`, `parent_id`, `thumbnail_id`) VALUES
(1, 'accms', '2020-11-17 13:03:45', '2020-11-17 15:33:58', '2020-11-17 15:33:58', 1, NULL, NULL),
(2, 'Parent Directory', '2020-11-17 13:19:04', '2020-11-17 15:34:02', '2020-11-17 15:34:02', 2, NULL, NULL),
(3, 'Database systems', '2020-11-18 01:05:13', '2020-11-18 06:31:13', '2020-11-18 06:31:13', 2, NULL, 2),
(4, 'Documents', '2020-11-18 05:53:36', '2020-11-18 06:31:13', '2020-11-18 06:31:13', 1, NULL, NULL),
(5, 'Documents', '2020-11-18 05:53:50', '2020-11-18 06:32:10', '2020-11-18 06:32:10', 1, NULL, NULL),
(6, 'Parent Directory', '2020-11-18 06:27:48', '2020-11-18 06:40:45', '2020-11-18 06:40:45', 3, NULL, NULL),
(7, 'Parent Directory', '2020-11-18 06:29:00', '2020-11-18 06:40:45', '2020-11-18 06:40:45', 4, NULL, NULL),
(8, 'Parent Directory', '2020-11-18 06:30:10', '2020-11-18 06:40:45', '2020-11-18 06:40:45', 5, NULL, NULL),
(9, 'Database systems', '2020-11-18 06:39:00', '2020-11-18 06:40:45', '2020-11-18 06:40:45', 3, NULL, NULL),
(10, 'Database Management System', '2020-11-18 06:41:50', '2020-11-20 04:41:40', '2020-11-20 04:41:40', 3, NULL, 5),
(11, 'Notes', '2020-11-18 08:08:19', '2020-11-20 04:41:40', '2020-11-20 04:41:40', 4, 10, 7),
(12, 'Parent Directory', '2020-11-19 05:13:18', '2020-11-20 04:41:40', '2020-11-20 04:41:40', 6, NULL, NULL),
(13, 'Assignment Sub', '2020-11-19 05:14:19', '2020-11-20 04:41:40', '2020-11-20 04:41:40', 6, NULL, NULL),
(14, 'Parent Directory', '2020-11-20 04:29:26', '2020-11-20 04:41:40', '2020-11-20 04:41:40', 7, NULL, NULL),
(15, 'Lecture 1', '2020-11-20 04:30:16', '2020-11-20 04:41:40', '2020-11-20 04:41:40', 7, NULL, NULL),
(16, 'Parent Directory', '2020-11-20 04:32:32', '2020-11-20 04:41:40', '2020-11-20 04:41:40', 8, NULL, NULL),
(17, 'Parent Directory', '2020-11-20 04:50:21', '2020-11-20 04:50:21', NULL, 9, NULL, NULL),
(18, 'Parent Directory', '2020-11-20 04:50:40', '2020-11-20 04:50:40', NULL, 10, NULL, NULL),
(19, 'Parent Directory', '2020-11-20 04:50:59', '2020-11-20 04:50:59', NULL, 11, NULL, NULL),
(20, 'Parent Directory', '2020-11-20 04:51:25', '2020-11-20 04:51:25', NULL, 12, NULL, NULL),
(21, 'Assignment Submissions Folder', '2020-11-20 04:52:19', '2020-11-20 04:52:19', NULL, 9, NULL, NULL),
(22, 'Notes', '2020-11-20 04:53:04', '2020-11-20 04:53:04', NULL, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Folder', 1, 'c7a12490-f2f2-44a5-acfb-5566153097e8', 'files', '5fb3f4568bd0c_Branches_of_law18', '5fb3f4568bd0c_Branches_of_law18.pptx', 'application/vnd.openxmlformats-officedocument.presentationml.presentation', 'public', 'public', 89186, '[]', '[]', '[]', 1, '2020-11-17 13:03:46', '2020-11-17 13:03:46'),
(2, 'App\\Models\\Folder', 3, '897c99d6-3e4c-402c-aef5-4e71cf781ef4', 'files', '5fb49d7531d05_DSC_0445', '5fb49d7531d05_DSC_0445.JPG', 'image/jpeg', 'public', 'public', 6337789, '[]', '{\"generated_conversions\":{\"thumb\":true,\"preview\":true}}', '[]', 2, '2020-11-18 01:05:14', '2020-11-18 01:05:22'),
(3, 'App\\Models\\Folder', 4, '7323d074-5f00-40be-ba03-7b39311b5328', 'files', '5fb4e1058532a_DSC_0445', '5fb4e1058532a_DSC_0445.JPG', 'image/jpeg', 'public', 'public', 6337789, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 3, '2020-11-18 05:53:41', '2020-11-18 05:53:49'),
(4, 'App\\Models\\Folder', 9, '0073a6f2-55cb-4901-b966-e192f5b1ec10', 'files', '5fb4eba8eb61e_3M Auto', '5fb4eba8eb61e_3M-Auto.png', 'image/png', 'public', 'public', 540626, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 4, '2020-11-18 06:39:00', '2020-11-18 06:39:01'),
(5, 'App\\Models\\Folder', 10, '86c16a5c-0f8a-4088-9dba-f2e922042bd6', 'files', '5fb4ec5041e3e_3M Auto', '5fb4ec5041e3e_3M-Auto.png', 'image/png', 'public', 'public', 540626, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 5, '2020-11-18 06:41:50', '2020-11-18 06:41:51'),
(6, 'App\\Models\\Folder', 11, '42e9cb89-dbd7-45ee-bce4-55b25677b4f5', 'files', '5fb5009bb9c4c_Documentary content', '5fb5009bb9c4c_Documentary-content.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'public', 'public', 21706, '[]', '[]', '[]', 6, '2020-11-18 08:08:21', '2020-11-18 08:08:21'),
(7, 'App\\Models\\Folder', 11, 'a0cf1318-c6f6-4dc3-af0b-0a6075eb8ef5', 'files', '5fb500c893514_3M Auto', '5fb500c893514_3M-Auto.png', 'image/png', 'public', 'public', 540626, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 7, '2020-11-18 08:09:05', '2020-11-18 08:09:07'),
(8, 'App\\Models\\Folder', 13, '66ff44dc-e89f-4c85-b889-44ea2ac2bbc9', 'files', '5fb629819a21a_Documentary content', '5fb629819a21a_Documentary-content.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'public', 'public', 21706, '[]', '[]', '[]', 8, '2020-11-19 05:15:15', '2020-11-19 05:15:15'),
(9, 'App\\Models\\Folder', 13, '4b0e1b10-f313-42ab-84bc-201eac22fa12', 'files', '5fb6298f8d9c4_3M Auto', '5fb6298f8d9c4_3M-Auto.png', 'image/png', 'public', 'public', 540626, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 9, '2020-11-19 05:15:16', '2020-11-19 05:15:18'),
(10, 'App\\Models\\Folder', 15, 'e8c8088c-d57d-4678-ab19-b5a13dc7c075', 'files', '5fb7707e79c49_3M Auto', '5fb7707e79c49_3M-Auto.png', 'image/png', 'public', 'public', 540626, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 10, '2020-11-20 04:30:17', '2020-11-20 04:30:23'),
(11, 'App\\Models\\Folder', 21, '6f67e47b-ec99-4fdf-844b-685743a8b2ec', 'files', '5fb775b18a0af_Documentary content', '5fb775b18a0af_Documentary-content.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'public', 'public', 21706, '[]', '[]', '[]', 11, '2020-11-20 04:52:20', '2020-11-20 04:52:20'),
(12, 'App\\Models\\Folder', 22, 'ebbb082b-500c-478a-8fab-2d95497206f3', 'files', '5fb775de9c57d_3M Auto', '5fb775de9c57d_3M-Auto.png', 'image/png', 'public', 'public', 540626, '[]', '{\"generated_conversions\":{\"thumb\":true}}', '[]', 12, '2020-11-20 04:53:04', '2020-11-20 04:53:05');

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
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2020_11_17_000001_create_media_table', 1),
(8, '2020_11_17_000002_create_permissions_table', 1),
(9, '2020_11_17_000003_create_roles_table', 1),
(10, '2020_11_17_000004_create_users_table', 1),
(11, '2020_11_17_000005_create_projects_table', 1),
(12, '2020_11_17_000006_create_folders_table', 1),
(13, '2020_11_17_000007_create_permission_role_pivot_table', 1),
(14, '2020_11_17_000008_create_role_user_pivot_table', 1),
(15, '2020_11_17_000009_create_project_user_pivot_table', 1),
(16, '2020_11_17_000010_add_relationship_fields_to_folders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@admin.com', '$2y$10$dsE1ZDnxcuUnmfbNWoNIJO3aBdl9aZOaGYzCMQkHODScVfDD/q/9i', '2021-05-23 18:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'user_management_access', NULL, NULL, NULL),
(2, 'permission_create', NULL, NULL, NULL),
(3, 'permission_edit', NULL, NULL, NULL),
(4, 'permission_show', NULL, NULL, NULL),
(5, 'permission_delete', NULL, NULL, NULL),
(6, 'permission_access', NULL, NULL, NULL),
(7, 'role_create', NULL, NULL, NULL),
(8, 'role_edit', NULL, NULL, NULL),
(9, 'role_show', NULL, NULL, NULL),
(10, 'role_delete', NULL, NULL, NULL),
(11, 'role_access', NULL, NULL, NULL),
(12, 'user_create', NULL, NULL, NULL),
(13, 'user_edit', NULL, NULL, NULL),
(14, 'user_show', NULL, NULL, NULL),
(15, 'user_delete', NULL, NULL, NULL),
(16, 'user_access', NULL, NULL, NULL),
(17, 'project_create', NULL, NULL, NULL),
(18, 'project_edit', NULL, NULL, NULL),
(19, 'project_show', NULL, NULL, NULL),
(20, 'project_delete', NULL, NULL, NULL),
(21, 'project_access', NULL, NULL, NULL),
(22, 'folder_create', NULL, NULL, NULL),
(23, 'folder_edit', NULL, NULL, NULL),
(24, 'folder_show', NULL, NULL, NULL),
(25, 'folder_delete', NULL, NULL, NULL),
(26, 'folder_access', NULL, NULL, NULL),
(27, 'profile_password_edit', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Assignments', '2020-11-17 13:03:05', '2020-11-18 06:27:22', '2020-11-18 06:27:22'),
(2, 'AcademicCCMS', '2020-11-17 13:19:04', '2020-11-18 06:27:22', '2020-11-18 06:27:22'),
(3, 'Assignments', '2020-11-18 06:27:48', '2020-11-20 04:41:31', '2020-11-20 04:41:31'),
(4, 'Notes', '2020-11-18 06:29:00', '2020-11-19 05:13:34', '2020-11-19 05:13:34'),
(5, 'Tasks', '2020-11-18 06:30:10', '2020-11-20 04:41:31', '2020-11-20 04:41:31'),
(6, 'Assignment Submission', '2020-11-19 05:13:17', '2020-11-20 04:41:31', '2020-11-20 04:41:31'),
(7, 'DBMS Notes', '2020-11-20 04:29:26', '2020-11-20 04:41:31', '2020-11-20 04:41:31'),
(8, 'Submissions', '2020-11-20 04:32:32', '2020-11-20 04:41:31', '2020-11-20 04:41:31'),
(9, 'Database Management systems Course Notes', '2020-11-20 04:50:21', '2020-11-20 04:50:21', NULL),
(10, 'Business Notes', '2020-11-20 04:50:40', '2020-11-20 04:50:40', NULL),
(11, 'Assignments', '2020-11-20 04:50:59', '2020-11-20 04:50:59', NULL),
(12, 'Take Away Cats', '2020-11-20 04:51:24', '2020-11-20 04:51:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

CREATE TABLE `project_user` (
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_user`
--

INSERT INTO `project_user` (`project_id`, `user_id`) VALUES
(1, 2),
(3, 3),
(3, 4),
(4, 3),
(4, 4),
(5, 3),
(5, 4),
(6, 1),
(7, 3),
(8, 1),
(9, 5),
(9, 6),
(10, 6),
(11, 5),
(11, 6),
(12, 5),
(12, 6);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', NULL, NULL, NULL),
(2, 'User', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$10$Qs2yztQ7ZhC1TKXuaSXbM.S3oOZUJpTiwlPpti7QjKo8k7xNAlo9y', 'tQMeOuj5NLV3dXdafpBvYFapFIv63gyFuFBgSxT2ccckHTO2A4fvNVy1FB3m', NULL, NULL, NULL),
(2, 'Kevin Kennedy', 'njey60@gmail.com', NULL, '$2y$10$3Pm//1EJhrvnD6mErnJpLeH12.ZgHC3Hxv7niuLv.ljclqGfTdZU2', NULL, '2020-11-17 13:00:01', '2020-11-18 06:24:41', '2020-11-18 06:24:41'),
(3, 'Kennedy Masara', 'user1@accms.com', NULL, '$2y$10$XzJKe99REt4czIvTZrHFFOl/KRq1n5ReDAfE8RQVrdZ271ZGgK8Q2', NULL, '2020-11-18 06:25:46', '2020-11-20 04:41:12', '2020-11-20 04:41:12'),
(4, 'Shamim Nabayi', 'user2@accms.com', NULL, '$2y$10$zaQeJOwyD4gpU.4mYuKyMOmyGOqnys06jqBWjAeJtEDeYMt5EjLfC', NULL, '2020-11-18 06:26:43', '2020-11-20 04:41:12', '2020-11-20 04:41:12'),
(5, 'KennedyMasara@IT2', 'kennedy@it2.ttu', NULL, '$2y$10$CTD94T5z.5sEyEg1.nGFC.J0ujCYvDoKZiroutibS4cJMae22XjYW', NULL, '2020-11-20 04:43:21', '2020-11-20 04:43:21', NULL),
(6, 'HannaOkemwa@BBIT4', 'hannaokemwa@bbit4.ttu', NULL, '$2y$10$ZKqdgEPcHmnp.eCx6UbLxe5FyQX5RwRWZ.CRQNSVyqaYvZ7x6raPu', NULL, '2020-11-20 04:44:59', '2020-11-20 04:45:32', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_fk_2608139` (`project_id`),
  ADD KEY `parent_fk_2608163` (`parent_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `role_id_fk_2608094` (`role_id`),
  ADD KEY `permission_id_fk_2608094` (`permission_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_user`
--
ALTER TABLE `project_user`
  ADD KEY `project_id_fk_2608120` (`project_id`),
  ADD KEY `user_id_fk_2608120` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `user_id_fk_2608103` (`user_id`),
  ADD KEY `role_id_fk_2608103` (`role_id`);

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
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `folders`
--
ALTER TABLE `folders`
  ADD CONSTRAINT `parent_fk_2608163` FOREIGN KEY (`parent_id`) REFERENCES `folders` (`id`),
  ADD CONSTRAINT `project_fk_2608139` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_id_fk_2608094` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_id_fk_2608094` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_user`
--
ALTER TABLE `project_user`
  ADD CONSTRAINT `project_id_fk_2608120` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_2608120` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_id_fk_2608103` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_id_fk_2608103` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
