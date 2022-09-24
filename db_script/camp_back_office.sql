-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 07 juin 2020 à 00:29
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `camp_back_office`
--

-- --------------------------------------------------------

--
-- Structure de la table `all_posts`
--

CREATE TABLE `all_posts` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `all_posts`
--

INSERT INTO `all_posts` (`id`, `image_path`, `content`) VALUES
(1, '4e23aa24c6f7080443240cda2d332c2d.jpg', ''),
(2, '6aa4af047e1fc3ae6dc0b6e8c8e86830.JPG', ''),
(3, '25920f6c8eaa0534ec767b6955e3a3a7.jpg', 'c v'),
(4, 'd7cf118893713ec7e4626cc38e72c8d6.JPG', 'kjl'),
(5, 'c785dfb7b59a16fc672dbdfa32a9bc4a.JPG', ''),
(6, 'f675470ea71e968df9b7f11f85935ea3.JPG', 'ss'),
(7, 'a798218279fdc5797e6b0996da688b92.JPG', 'sd'),
(8, 'dacd8d12140bc866540d972426857159.jpg', 'test'),
(9, '60c72ed388091ae621f256a22b7bcd8f.jpg', 'camping'),
(10, '0e83ffb39de81110b40ec19a1870d81a.mp4', '');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-03-04 19:48:31', '2020-03-04 19:48:31'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-03-04 19:48:31', '2020-03-04 19:48:31');

-- --------------------------------------------------------

--
-- Structure de la table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `communities`
--

CREATE TABLE `communities` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `followers` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `community_user`
--

CREATE TABLE `community_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `shortname` char(2) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 6, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(30, 6, 'country_code', 'text', 'Country Code', 0, 1, 1, 1, 1, 1, '{}', 2),
(31, 6, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(32, 6, 'asciiname', 'text', 'Asciiname', 0, 1, 1, 1, 1, 1, '{}', 4),
(33, 6, 'latitude', 'text', 'Latitude', 0, 1, 1, 1, 1, 1, '{}', 5),
(34, 6, 'longitude', 'text', 'Longitude', 0, 1, 1, 1, 1, 1, '{}', 6),
(35, 6, 'feature_class', 'text', 'Feature Class', 0, 1, 1, 1, 1, 1, '{}', 7),
(36, 6, 'feature_code', 'text', 'Feature Code', 0, 1, 1, 1, 1, 1, '{}', 8),
(37, 6, 'subadmin1_code', 'text', 'Subadmin1 Code', 0, 1, 1, 1, 1, 1, '{}', 9),
(38, 6, 'subadmin2_code', 'text', 'Subadmin2 Code', 0, 1, 1, 1, 1, 1, '{}', 10),
(39, 6, 'population', 'text', 'Population', 0, 1, 1, 1, 1, 1, '{}', 11),
(40, 6, 'time_zone', 'text', 'Time Zone', 0, 1, 1, 1, 1, 1, '{}', 12),
(41, 6, 'active', 'text', 'Active', 0, 1, 1, 1, 1, 1, '{}', 13),
(42, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 14),
(43, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(44, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 7, 'category_id', 'text', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(46, 7, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(47, 7, 'group_id', 'text', 'Group Id', 0, 1, 1, 1, 1, 1, '{}', 4),
(48, 7, 'has_image', 'text', 'Has Image', 1, 1, 1, 1, 1, 1, '{}', 5),
(49, 7, 'content', 'text', 'Content', 0, 1, 1, 1, 1, 1, '{}', 6),
(50, 7, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 7),
(51, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(52, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(53, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(54, 8, 'post_id', 'text', 'Post Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(55, 8, 'image_path', 'text', 'Image Path', 1, 1, 1, 1, 1, 1, '{}', 3),
(56, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 9, 'post_id', 'text', 'Post Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 9, 'comment_user_id', 'text', 'Comment User Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 9, 'comment', 'text_area', 'Comment', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(61, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 9, 'seen', 'text', 'Seen', 1, 1, 1, 1, 1, 1, '{}', 7),
(63, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 13, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2);

-- --------------------------------------------------------

--
-- Structure de la table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-03-04 19:48:23', '2020-03-04 19:48:23'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-03-04 19:48:23', '2020-03-04 19:48:23'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2020-03-04 19:48:24', '2020-03-04 19:48:24'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-03-04 19:48:30', '2020-03-04 19:48:30'),
(6, 'localisations', 'localisations', 'Localisation', 'Localisations', NULL, 'App\\Models\\Localisation', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-13 14:58:35', '2020-05-13 14:58:35'),
(7, 'posts', 'posts', 'Models\\Post', 'Posts', NULL, 'App\\Models\\Post', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-13 15:00:22', '2020-05-13 15:00:22'),
(8, 'post_images', 'post-images', 'Post Image', 'Post Images', NULL, 'App\\Models\\PostImage', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-13 15:02:35', '2020-05-13 15:02:35'),
(9, 'post_comments', 'post-comments', 'Post Comment', 'Post Comments', NULL, 'App\\Models\\PostComment', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-13 15:04:36', '2020-05-13 15:04:36'),
(13, 'hobbies', 'hobbies', 'Hobby', 'Hobbies', NULL, 'App\\Models\\Hobby', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-05-13 23:22:26', '2020-05-13 23:22:26');

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `hobby_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `hobbies`
--

INSERT INTO `hobbies` (`id`, `name`) VALUES
(1, 'camp '),
(2, 'nature'),
(3, ' voyage'),
(4, ' tourisme'),
(5, 'ship');

-- --------------------------------------------------------

--
-- Structure de la table `localisations`
--

CREATE TABLE `localisations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asciiname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subadmin2_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `localisations`
--

INSERT INTO `localisations` (`id`, `country_code`, `name`, `asciiname`, `latitude`, `longitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(2463950, 'TN', 'Menzel Temime', 'Menzel Temime', '36.77973', '10.98556', 'P', 'PPL', 'TN.19', NULL, NULL, 'Africa/Tunis', '1', '2016-10-07 23:00:00', '2016-10-07 23:00:00'),
(2463951, 'TN', 'Zaouiat Djedidi', 'Zaouiat Djedidi', '36.64375', '10.5743', 'P', 'PPL', 'TN.19', NULL, '6583', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2464041, 'TN', 'Zaghouan', 'Zaghouan', '36.4117196', '10.1429', 'P', 'PPLA', 'TN.37', NULL, '16911', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2464168, 'TN', 'Oued Lill', 'Oued Lill', '36.83408', '\r\n10.04057\r\n', 'P', 'PPL', 'TN.36', NULL, '47101', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2464427, 'TN', 'Touza', 'Touza', '35.6182055', '10.8273', 'P', 'PPL', 'TN.16', NULL, '6085', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2464465, 'TN', 'la Médina', 'la Medina', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2464470, 'TN', 'Tunis', 'Tunis', '33.8439408', '9.400138', 'P', 'PPLC', 'TN.36', NULL, '693210', 'Africa/Tunis', '1', '2017-08-15 23:00:00', '2020-06-01 15:05:43'),
(2464648, 'TN', 'Tozeur', 'Tozeur', '33.913485', '8.1118241', 'P', 'PPLA', 'TN.35', NULL, '34943', 'Africa/Tunis', '1', '2014-07-15 23:00:00', '2020-06-01 15:00:38'),
(2464700, 'TN', 'Tataouine Nord', 'Tataouine Nord', NULL, NULL, NULL, NULL, 'TN.34', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2464701, 'TN', 'Tataouine', 'Tataouine', '31.7317009', '10.4518', 'P', 'PPLA', 'TN.34', NULL, '62577', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2464704, 'TN', 'Testour', 'Testour', '37', '9.44307', 'P', 'PPL', 'TN.17', NULL, '13708', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2464795, 'TN', 'Thala', 'Thala', '36', '8.67031', 'P', 'PPL', 'TN.02', NULL, '16068', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2464804, 'TN', 'Takelsa', 'Takelsa', '36.7932113', '10.6750994', 'P', 'PPL', 'TN.19', NULL, '20659', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:28:04'),
(2464809, 'TN', 'Tajerouine', 'Tajerouine', '35.9658838', '8.55276', 'P', 'PPL', 'TN.14', NULL, '18909', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2464855, 'TN', 'Tabursuq', 'Tabursuq', '36', '9.24751', 'P', 'PPL', 'TN.17', NULL, '12727', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2464871, 'TN', 'Tabarka', 'Tabarka', '36.9545614', '8.75801', 'P', 'PPL', 'TN.06', NULL, '13712', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2464914, 'TN', 'Sousse Médina', 'Sousse Medina', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2464915, 'TN', 'Sousse', 'Sousse', '35.828829', '10.637', 'P', 'PPLA', 'TN.23', NULL, '164123', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2464977, 'TN', 'Sbeitla', 'Sbeitla', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2465029, 'TN', 'Siliana Sud', 'Siliana Sud', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2465030, 'TN', 'Siliana', 'Siliana', '35.9715323', '9.37082', 'P', 'PPLA', 'TN.22', NULL, '26960', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2465138, 'TN', 'Sidi Alouane', 'Sidi Alouane', '35.287745', '10.939', 'P', 'PPL', 'TN.15', NULL, '7051', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2465836, 'TN', 'Sidi Bouzid Ouest', 'Sidi Bouzid Ouest', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2465840, 'TN', 'Sidi Bouzid', 'Sidi Bouzid', '34.881181', '9.48494', 'P', 'PPLA', 'TN.33', NULL, '42098', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2466034, 'TN', 'Sidi Bou Ali', 'Sidi Bou Ali', '35.9601079', '10.4731', 'P', 'PPL', 'TN.23', NULL, '8855', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2466895, 'TN', 'Chorbane', 'Chorbane', NULL, NULL, NULL, NULL, 'TN.15', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2466897, 'TN', 'Chorbane', 'Chorbane', '35.2267742', '10.3858', 'P', 'PPL', 'TN.15', NULL, '6430', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2467180, 'TN', 'Souassi', 'Souassi', NULL, NULL, NULL, NULL, 'TN.15', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2467239, 'TN', 'Sakiet Sidi Youssef', 'Sakiet Sidi Youssef', '36.1688975', '8.35547', 'P', 'PPL', 'TN.14', NULL, '6442', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2467246, 'TN', 'Skanes', 'Skanes', '35.7659', '10.8', 'P', 'PPL', 'TN.16', NULL, '64222', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2467368, 'TN', 'Sejenane', 'Sejenane', '37.05722', '9.23806', 'P', 'PPL', 'TN.18', NULL, '5009', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2467454, 'TN', 'Sfax', 'Sfax', '34.7231273', '10.7603', 'P', 'PPLA', 'TN.32', NULL, '277278', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2467506, 'TN', 'Sbiba', 'Sbiba', '35.4957796', '9.0737', 'P', 'PPL', 'TN.02', NULL, '6291', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2467521, 'TN', 'La Sebala du Mornag', 'La Sebala du Mornag', '36.67931', '10.292', 'P', 'PPL', 'TN.36', NULL, '33421', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2467813, 'TN', 'Rafrāf', 'Rafraf', '37.192281', '10.1837', 'P', 'PPL', 'TN.18', NULL, '9255', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2467815, 'TN', 'Radès', 'Rades', '36.7759457', '10.2753', 'P', 'PPL', 'TN.36', NULL, '44298', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2467856, 'TN', 'Ksour Essaf', 'Ksour Essaf', '35.3566022', '10.9948', 'P', 'PPL', 'TN.15', NULL, '27936', 'Africa/Tunis', '1', '2013-03-17 23:00:00', '2013-03-17 23:00:00'),
(2467890, 'TN', 'Ksibet el Mediouni', 'Ksibet el Mediouni', '35.6447684', '10.8426', 'P', 'PPL', 'TN.16', NULL, '11313', 'Africa/Tunis', '1', '2016-10-08 23:00:00', '2020-06-01 15:09:23'),
(2467920, 'TN', 'Korba', 'Korba', '36.6055128', '10.8586', 'P', 'PPL', 'TN.19', NULL, '33589', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2467959, 'TN', 'Kélibia', 'Kelibia', '36.844354', '11.0939', 'P', 'PPL', 'TN.19', NULL, '43209', 'Africa/Tunis', '1', '2016-10-07 23:00:00', '2020-06-01 15:10:46'),
(2468016, 'TN', 'Kébili Sud', 'Kebili Sud', NULL, NULL, NULL, NULL, 'TN.31', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2468018, 'TN', 'Kebili', 'Kebili', '33.7061148', '8.96903', 'P', 'PPLA', 'TN.31', NULL, '19875', 'Africa/Tunis', '1', '2014-10-31 23:00:00', '2014-10-31 23:00:00'),
(2468106, 'TN', 'Ksar Hellal', 'Ksar Hellal', '35.638016', '10.8905', 'P', 'PPL', 'TN.16', NULL, '39792', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:20:27'),
(2468245, 'TN', 'Carthage', 'Carthage', '36.851627', '10.3316', 'P', 'PPL', 'TN.36', NULL, '15922', 'Africa/Tunis', '1', '2010-07-09 23:00:00', '2010-07-09 23:00:00'),
(2468285, 'TN', 'El Fahs', 'El Fahs', '36.2697603', '9.90651', 'P', 'PPL', 'TN.37', NULL, '18083', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2468329, 'TN', 'Galaat el Andeless', 'Galaat el Andeless', '37.0629', '10.1183', 'P', 'PPL', 'TN.38', NULL, '15313', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2468349, 'TN', 'Gafour', 'Gafour', '35.205573', '9.32424', 'P', 'PPL', 'TN.22', NULL, '10556', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2468353, 'TN', 'Gafsa', 'Gafsa', '34.43367', '8.78417', 'P', 'PPLA', 'TN.30', 'TN.30.2468352', '81232', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2468369, 'TN', 'Gabès', 'Gabes', '34.43367', '10.0982', 'P', 'PPLA', 'TN.29', NULL, '110075', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2468561, 'TN', 'Nefta', 'Nefta', '33.820495', '7.87765', 'P', 'PPL', 'TN.35', NULL, '21720', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2468579, 'TN', 'Nabeul', 'Nabeul', '33.820495', '10.7376', 'P', 'PPLA', 'TN.19', NULL, '56387', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2468925, 'TN', 'Midoun', 'Midoun', '33.824737', '10.9923', 'P', 'PPL', 'TN.28', NULL, '120000', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2469088, 'TN', 'Mateur', 'Mateur', '37', '9.66557', 'P', 'PPL', 'TN.18', NULL, '31005', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2469140, 'TN', 'Msaken', 'Msaken', '35.6736816', '10.5808', 'P', 'PPL', 'TN.23', NULL, '64563', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:25:28'),
(2469255, 'TN', 'Menzel Kamel', 'Menzel Kamel', '35.6362636', '10.6673', 'P', 'PPL', 'TN.16', NULL, '8314', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2469256, 'TN', 'Menzel Jemil', 'Menzel Jemil', '37.2036599', '9.91448', 'P', 'PPL', 'TN.18', NULL, '21542', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2469262, 'TN', 'Mennzel Bou Zelfa', 'Mennzel Bou Zelfa', '36.68312', '10.5843', 'P', 'PPL', 'TN.19', NULL, '16231', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2469264, 'TN', 'Menzel Bourguiba', 'Menzel Bourguiba', '37.1076327', '9.858566', 'P', 'PPL', 'TN.18', NULL, '46245', 'Africa/Tunis', '1', '2016-10-07 23:00:00', '2020-06-01 15:11:53'),
(2469268, 'TN', 'Menzel Abderhaman', 'Menzel Abderhaman', '37.23737', '9.86313', 'P', 'PPL', 'TN.18', NULL, '15769', 'Africa/Tunis', '1', '2016-10-14 23:00:00', '2020-06-01 15:07:48'),
(2469274, 'TN', 'Manouba', 'Manouba', '36.8115973', '10.0972', 'P', 'PPLA', 'TN.39', NULL, '24948', 'Africa/Tunis', '1', '2011-03-07 23:00:00', '2011-03-07 23:00:00'),
(2469321, 'TN', 'Melloulèche', 'Mellouleche', '35.1654741', '11.035', 'P', 'PPL', 'TN.15', NULL, '6441', 'Africa/Tunis', '1', '2016-10-08 23:00:00', '2016-10-08 23:00:00'),
(2469341, 'TN', 'Maktar', 'Maktar', '35.8558974', '9.20072', 'P', 'PPL', 'TN.22', NULL, '14500', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2469386, 'TN', 'Medjez el Bab', 'Medjez el Bab', '36.7101084', '9.61231', 'P', 'PPL', 'TN.17', NULL, '20118', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:21:06'),
(2469473, 'TN', 'Medenine', 'Medenine', '33.3434395', '10.5055', 'P', 'PPLA', 'TN.28', NULL, '61705', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2469474, 'TN', 'Médenine Sud', 'Medenine Sud', NULL, NULL, NULL, NULL, 'TN.28', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2469571, 'TN', 'Lemta', 'Lemta', '34.1684596', '4.9929681', 'P', 'PPL', 'TN.16', NULL, '5382', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2470086, 'TN', 'Jendouba', 'Jendouba', NULL, NULL, NULL, NULL, 'TN.06', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2470088, 'TN', 'Jendouba', 'Jendouba', '36.6779725', '8.78024', 'P', 'PPLA', 'TN.06', NULL, '51408', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2470120, 'TN', 'Jilma', 'Jilma', '35.32943', '9.42385', 'P', 'PPL', 'TN.33', NULL, '5647', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2470173, 'TN', 'Zarzis', 'Zarzis', '33.4662476', '11.1122', 'P', 'PPL', 'TN.28', NULL, '79316', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2470189, 'TN', 'Jemna', 'Jemna', '33.5695675', '9.01472', 'P', 'PPL', 'TN.31', NULL, '6254', 'Africa/Tunis', '1', '2014-10-31 23:00:00', '2014-10-31 23:00:00'),
(2470191, 'TN', 'Djemmal', 'Djemmal', '35.62231', '10.757', 'P', 'PPL', 'TN.16', NULL, '39990', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2470260, 'TN', 'Djebeniana', 'Djebeniana', '35.0982036', '10.9081', 'P', 'PPL', 'TN.32', NULL, '7349', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2470384, 'TN', 'Houmt Souk', 'Houmt Souk', '33.875676', '10.8574', 'P', 'PPL', 'TN.28', NULL, '62583', 'Africa/Tunis', '1', '2014-07-14 23:00:00', '2014-07-14 23:00:00'),
(2470483, 'TN', 'Harqalah', 'Harqalah', '35.9563347', '38.9462059', 'P', 'PPL', 'TN.23', NULL, '6942', 'Africa/Tunis', '1', '2016-10-08 23:00:00', '2020-06-01 15:10:08'),
(2470579, 'TN', 'Hammam Sousse', 'Hammam Sousse', '35.8748634', '10.6031', 'P', 'PPL', 'TN.23', NULL, '33834', 'Africa/Tunis', '1', '2014-10-31 23:00:00', '2014-10-31 23:00:00'),
(2470587, 'TN', 'la Banlieue Sud', 'la Banlieue Sud', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2470588, 'TN', 'Hammam-Lif', 'Hammam-Lif', '36.7188', '10.3416', 'P', 'PPL', 'TN.36', NULL, '47760', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2470656, 'TN', 'La Goulette', 'La Goulette', '36.8342214', '10.305', 'P', 'PPL', 'TN.36', NULL, '79795', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2470800, 'TN', 'Haffouz', 'Haffouz', '35.6165', '9.67624', 'P', 'PPL', 'TN.03', NULL, '7765', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2470996, 'TN', 'Rhar el Melah', 'Rhar el Melah', '37.16939', '10.19064', 'P', 'PPL', 'TN.18', NULL, '5018', 'Africa/Tunis', '1', '2016-10-14 23:00:00', '2020-06-01 15:06:44'),
(2471060, 'TN', 'Feriana', 'Feriana', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2471287, 'TN', 'Douz', 'Douz', '33.457057', '9.0203', 'P', 'PPL', 'TN.31', NULL, '28127', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2471454, 'TN', 'Degache', 'Degache', '34', '8.2081', 'P', 'PPL', 'TN.35', NULL, '8134', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2471475, 'TN', 'Douar Tindja', 'Douar Tindja', '37', '9.75', 'P', 'PPL', 'TN.18', NULL, '18551', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2471637, 'TN', 'Dar Chabanne', 'Dar Chabanne', '36', '10.7517', 'P', 'PPL', 'TN.19', NULL, '33953', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2471915, 'TN', 'Bou Arkoub', 'Bou Arkoub', '37', '10.5509', 'P', 'PPL', 'TN.19', NULL, '10024', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2472261, 'TN', 'Bou Arada', 'Bou Arada', '36', '9.62175', 'P', 'PPL', 'TN.22', NULL, '12158', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2472380, 'TN', 'Bir el Hafey', 'Bir el Hafey', '35', '9.19321', 'P', 'PPL', 'TN.33', NULL, '5016', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2472431, 'TN', 'Ben Gardane', 'Ben Gardane', '33', '11.2197', 'P', 'PPL', 'TN.28', NULL, '13364', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2472479, 'TN', 'Ben Arous', 'Ben Arous', '37', '10.2189', 'P', 'PPLA', 'TN.27', NULL, '74932', 'Africa/Tunis', '1', '2013-08-05 23:00:00', '2013-08-05 23:00:00'),
(2472701, 'TN', 'Bizerte Sud', 'Bizerte Sud', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2472706, 'TN', 'Bizerte', 'Bizerte', '37.2768', '9.87391', 'P', 'PPLA', 'TN.18', NULL, '115268', 'Africa/Tunis', '1', '2016-12-14 23:00:00', '2020-05-20 10:47:59'),
(2472722, 'TN', 'Beni Khiar', 'Beni Khiar', '36', '10.7822', 'P', 'PPL', 'TN.19', NULL, '18011', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2472724, 'TN', 'Beni Khalled', 'Beni Khalled', '36.6497149', '10.5910641', 'P', 'PPL', 'TN.19', NULL, '11300', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:26:16'),
(2472732, 'TN', 'Beni Hassane', 'Beni Hassane', '32.0348925', '-6.9277519', 'P', 'PPL', 'TN.16', NULL, '8139', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:27:09'),
(2472744, 'TN', 'Banbalah', 'Banbalah', '36', '10.8', 'P', 'PPL', 'TN.16', NULL, '12367', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2472772, 'TN', 'Béja Nord', 'Beja Nord', NULL, NULL, NULL, NULL, 'TN.17', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2472774, 'TN', 'Béja', 'Beja', '37', '9.18169', 'P', 'PPLA', 'TN.17', NULL, '57233', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2472833, 'TN', 'Zouila', 'Zouila', '36', '11.0606', 'P', 'PPLX', 'TN.15', NULL, '44349', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473161, 'TN', 'Skhira', 'Skhira', '35.4646452', '10.07', 'P', 'PPL', 'TN.32', NULL, '9211', 'Africa/Tunis', '1', '2016-10-07 23:00:00', '2020-06-01 15:12:44'),
(2473163, 'TN', 'Sbikha', 'Sbikha', '36', '10.0208', 'P', 'PPL', 'TN.03', NULL, '7062', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473169, 'TN', 'Seïada', 'Seiada', '36', '10.8925', 'P', 'PPL', 'TN.16', NULL, '13718', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2473177, 'TN', 'As Sars', 'As Sars', '36', '9.02117', 'P', 'PPL', 'TN.14', NULL, '10979', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2473183, 'TN', 'As Sanad', 'As Sanad', '34', '9.26404', 'P', 'PPL', 'TN.30', NULL, '7859', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473190, 'TN', 'Sahline', 'Sahline', '36', '10.7111', 'P', 'PPL', 'TN.16', NULL, '13806', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473229, 'TN', 'Chebba', 'Chebba', '35', '11.115', 'P', 'PPL', 'TN.15', NULL, '21559', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473247, 'TN', 'Ariana', 'Ariana', '37', '10.1934', 'P', 'PPLA', 'TN.38', NULL, '97687', 'Africa/Tunis', '1', '2013-08-05 23:00:00', '2013-08-05 23:00:00'),
(2473257, 'TN', 'Ar Rudayyif', 'Ar Rudayyif', '34', '8.15549', 'P', 'PPL', 'TN.30', NULL, '30048', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473258, 'TN', 'Er Regueb', 'Er Regueb', '34.8541995', '9.78654', 'P', 'PPL', 'TN.33', NULL, '6702', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:28:47'),
(2473418, 'TN', 'Oueslatia', 'Oueslatia', NULL, NULL, NULL, NULL, 'TN.03', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2473420, 'TN', 'Ouardenine', 'Ouardenine', '36', '10.674', 'P', 'PPL', 'TN.16', NULL, '18287', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2473439, 'TN', 'El Ksour', 'El Ksour', '36', '8.88493', 'P', 'PPL', 'TN.14', NULL, '5034', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473449, 'TN', 'Kairouan', 'Kairouan', '36', '10.0963', 'P', 'PPLA', 'TN.03', NULL, '119794', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2473450, 'TN', 'Kairouan Sud', 'Kairouan Sud', NULL, NULL, NULL, NULL, 'TN.03', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2473457, 'TN', 'Kasserine', 'Kasserine', '35', '8.83651', 'P', 'PPLA', 'TN.02', NULL, '81987', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2473459, 'TN', 'Kasserine Sud', 'Kasserine Sud', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2473470, 'TN', 'Gremda', 'Gremda', '35', '10.7833', 'P', 'PPL', 'TN.32', NULL, '33744', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2473486, 'TN', 'El Golaa', 'El Golaa', '33', '9.00678', 'P', 'PPL', 'TN.31', NULL, '7189', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473493, 'TN', 'Monastir', 'Monastir', '36', '10.8262', 'P', 'PPLA', 'TN.16', NULL, '71546', 'Africa/Tunis', '1', '2012-05-15 23:00:00', '2012-05-15 23:00:00'),
(2473499, 'TN', 'La Mohammedia', 'La Mohammedia', '33.6958383', '10.1563', 'P', 'PPL', 'TN.36', NULL, '66593', 'Africa/Tunis', '1', '2016-09-07 23:00:00', '2020-06-01 15:19:45'),
(2473517, 'TN', 'Metlaoui', 'Metlaoui', '34.234975', '8.40157', 'P', 'PPL', 'TN.30', NULL, '41899', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:30:27'),
(2473525, 'TN', 'Mezzouna', 'Mezzouna', '35', '9.84193', 'P', 'PPL', 'TN.33', NULL, '5564', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2473532, 'TN', 'Metouia', 'Metouia', NULL, NULL, NULL, NULL, 'TN.29', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2473533, 'TN', 'Al Matlīn', 'Al Matlin', '37', '10.05', 'P', 'PPL', 'TN.18', NULL, '7370', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2473540, 'TN', 'Al Marsá', 'Al Marsa', '37', '10.3247', 'P', 'PPL', 'TN.36', NULL, '65640', 'Africa/Tunis', '1', '2010-08-02 23:00:00', '2010-08-02 23:00:00'),
(2473558, 'TN', 'El Maamoura', 'El Maamoura', '36', '10.8061', 'P', 'PPL', 'TN.19', NULL, '6969', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2473571, 'TN', 'Mu‘tamadīyat al Maḩras', 'Mu`tamadiyat al Mahras', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2473572, 'TN', 'Mahdia', 'Mahdia', '36', '11.0622', 'P', 'PPLA', 'TN.15', NULL, '45977', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2473628, 'TN', 'Le Krib', 'Le Krib', '36', '9.13613', 'P', 'PPL', 'TN.22', NULL, '7691', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2473634, 'TN', 'El Kef', 'El Kef', '36', '8.70486', 'P', 'PPLA', 'TN.14', NULL, '47979', 'Africa/Tunis', '1', '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(2473636, 'TN', 'Kef Est', 'Kef Est', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2473654, 'TN', 'El Jem', 'El Jem', '35', '10.7167', 'P', 'PPL', 'TN.15', NULL, '20029', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473663, 'TN', 'Nefza', 'Nefza', NULL, NULL, NULL, NULL, 'TN.17', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(2473716, 'TN', 'El Haouaria', 'El Haouaria', '37', '11.0144', 'P', 'PPL', 'TN.19', NULL, '9273', 'Africa/Tunis', '1', '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(2473744, 'TN', 'Hammamet', 'Hammamet', '36.4096837', '10.6167', 'P', 'PPL', 'TN.19', NULL, '53733', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2020-06-01 15:24:00'),
(2473747, 'TN', 'El Hamma', 'El Hamma', '34', '9.79629', 'P', 'PPL', 'TN.29', NULL, '62000', 'Africa/Tunis', '1', '2014-11-28 23:00:00', '2014-11-28 23:00:00'),
(2473823, 'TN', 'El Battan', 'El Battan', '37', '9.84424', 'P', 'PPL', 'TN.39', NULL, '6047', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2473826, 'TN', 'Bekalta', 'Bekalta', '36', '10.9947', 'P', 'PPL', 'TN.16', NULL, '15937', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2473876, 'TN', 'El Alia', 'El Alia', '37', '10.0348', 'P', 'PPL', 'TN.18', NULL, '16083', 'Africa/Tunis', '1', '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(2473913, 'TN', 'Akouda', 'Akouda', '36', '10.5653', 'P', 'PPL', 'TN.23', NULL, '20027', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00'),
(2581754, 'TN', 'Douane', 'Douane', '36', '10.7557', 'P', 'PPL', 'TN.19', NULL, '60192', 'Africa/Tunis', '1', '2011-02-07 23:00:00', '2011-02-07 23:00:00'),
(6355180, 'TN', 'Port el Kantaoui', 'Port el Kantaoui', '35.8936974', '10.5943', 'P', 'PPL', 'TN.23', NULL, '6000', 'Africa/Tunis', '1', '2016-10-07 23:00:00', '2020-06-01 15:13:45'),
(7870271, 'TN', 'Balta Bou Aouane', 'Balta Bou Aouane', NULL, NULL, NULL, NULL, 'TN.06', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870272, 'TN', 'Bou Salem', 'Bou Salem', NULL, NULL, NULL, NULL, 'TN.06', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870274, 'TN', 'Oued Meliz', 'Oued Meliz', NULL, NULL, NULL, NULL, 'TN.06', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870275, 'TN', 'Beni Khedeche', 'Beni Khedeche', NULL, NULL, NULL, NULL, 'TN.28', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870276, 'TN', 'Medenine Nord', 'Medenine Nord', NULL, NULL, NULL, NULL, 'TN.28', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870277, 'TN', 'Medenine Sud', 'Medenine Sud', NULL, NULL, NULL, NULL, 'TN.28', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870278, 'TN', 'Sidi Makhlouf', 'Sidi Makhlouf', NULL, NULL, NULL, NULL, 'TN.28', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870280, 'TN', 'Ben Guerdane', 'Ben Guerdane', NULL, NULL, NULL, NULL, 'TN.28', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870283, 'TN', 'Djedliane', 'Djedliane', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870284, 'TN', 'Ayoun', 'Ayoun', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870300, 'TN', 'Hidra', 'Hidra', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870307, 'TN', 'Foussana', 'Foussana', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870318, 'TN', 'Oudhna', 'Oudhna', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870548, 'TN', 'Sijoumi', 'Sijoumi', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870549, 'TN', 'Sidi Hassine', 'Sidi Hassine', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870578, 'TN', 'Nadhour', 'Nadhour', NULL, NULL, NULL, NULL, 'TN.37', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870601, 'TN', 'Sejnane', 'Sejnane', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870602, 'TN', 'Joumine', 'Joumine', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870603, 'TN', 'Ghazala', 'Ghazala', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870604, 'TN', 'Nefza', 'Nefza', NULL, NULL, NULL, NULL, 'TN.17', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870605, 'TN', 'Beja Sud', 'Beja Sud', NULL, NULL, NULL, NULL, 'TN.17', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870606, 'TN', 'Goubellat', 'Goubellat', NULL, NULL, NULL, NULL, 'TN.17', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870609, 'TN', 'Fernana', 'Fernana', NULL, NULL, NULL, NULL, 'TN.06', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870612, 'TN', 'Kef Quest', 'Kef Quest', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870615, 'TN', 'Kef Est', 'Kef Est', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870616, 'TN', 'Es Sers', 'Es Sers', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870617, 'TN', 'Nebeur', 'Nebeur', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870618, 'TN', 'Elkrib', 'Elkrib', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870619, 'TN', 'Bourouis', 'Bourouis', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870620, 'TN', 'Siliana Nord', 'Siliana Nord', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7870645, 'TN', 'Raoued', 'Raoued', NULL, NULL, NULL, NULL, 'TN.38', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(7911270, 'TN', 'Jerba Ajim', 'Jerba Ajim', NULL, NULL, NULL, NULL, 'TN.28', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(9072611, 'TN', 'Ksar District', 'Ksar District', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31101910, 'TN', 'Menzel Habib', 'Menzel Habib', NULL, NULL, NULL, NULL, 'TN.29', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104807, 'TN', 'Hammam El Guezaz', 'Hammam El Guezaz', NULL, NULL, NULL, NULL, 'TN.19', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104809, 'TN', 'El Mida', 'El Mida', NULL, NULL, NULL, NULL, 'TN.19', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104810, 'TN', 'Menzel Bouzelfa', 'Menzel Bouzelfa', NULL, NULL, NULL, NULL, 'TN.19', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104811, 'TN', 'Bou Argoub', 'Bou Argoub', NULL, NULL, NULL, NULL, 'TN.19', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104812, 'TN', 'Dar Chaabane El Fehri', 'Dar Chaabane El Fehri', NULL, NULL, NULL, NULL, 'TN.19', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104932, 'TN', 'Bouficha', 'Bouficha', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104936, 'TN', 'Hergla', 'Hergla', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104938, 'TN', 'Kondar', 'Kondar', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104939, 'TN', 'Sidi El Hani', 'Sidi El Hani', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104941, 'TN', 'Kalaa Sghira', 'Kalaa Sghira', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104943, 'TN', 'Sousse Jawhara', 'Sousse Jawhara', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104944, 'TN', 'Sousse Sidi Abdelhamid', 'Sousse Sidi Abdelhamid', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104945, 'TN', 'Sousse Riadh', 'Sousse Riadh', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104948, 'TN', 'Zaouia-Ksiba-Thrayet', 'Zaouia-Ksiba-Thrayet', NULL, NULL, NULL, NULL, 'TN.23', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104955, 'TN', 'Téboulba', 'Teboulba', NULL, NULL, NULL, NULL, 'TN.16', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104956, 'TN', 'Sayada Lamta Bouhjar', 'Sayada Lamta Bouhjar', NULL, NULL, NULL, NULL, 'TN.16', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104958, 'TN', 'Sfax Ouest', 'Sfax Ouest', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104959, 'TN', 'Thyna', 'Thyna', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104960, 'TN', 'Sfax Sud', 'Sfax Sud', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104961, 'TN', 'Sakiet Ezzit', 'Sakiet Ezzit', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104962, 'TN', 'Sakiet Eddaier', 'Sakiet Eddaier', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104963, 'TN', 'Ksar Helal', 'Ksar Helal', NULL, NULL, NULL, NULL, 'TN.16', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104965, 'TN', 'Ouerdanine', 'Ouerdanine', NULL, NULL, NULL, NULL, 'TN.16', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104966, 'TN', 'Bembla', 'Bembla', NULL, NULL, NULL, NULL, 'TN.16', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104967, 'TN', 'Zeramdine', 'Zeramdine', NULL, NULL, NULL, NULL, 'TN.16', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104968, 'TN', 'Beni Hassen', 'Beni Hassen', NULL, NULL, NULL, NULL, 'TN.16', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104978, 'TN', 'Ouled Chamekh', 'Ouled Chamekh', NULL, NULL, NULL, NULL, 'TN.15', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104979, 'TN', 'Bou Merdès', 'Bou Merdes', NULL, NULL, NULL, NULL, 'TN.15', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31104980, 'TN', 'Hbira', 'Hbira', NULL, NULL, NULL, NULL, 'TN.15', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105072, 'TN', 'Melloulech', 'Melloulech', NULL, NULL, NULL, NULL, 'TN.15', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105076, 'TN', 'El Amra', 'El Amra', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105077, 'TN', 'El Hencha', 'El Hencha', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105078, 'TN', 'Agareb', 'Agareb', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105079, 'TN', 'Ghraiba', 'Ghraiba', NULL, NULL, NULL, NULL, 'TN.32', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105081, 'TN', 'Dekhilet Toujane', 'Dekhilet Toujane', NULL, NULL, NULL, NULL, 'TN.29', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105082, 'TN', 'Nouvelle Matmata', 'Nouvelle Matmata', NULL, NULL, NULL, NULL, 'TN.29', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105083, 'TN', 'Ghannouch', 'Ghannouch', NULL, NULL, NULL, NULL, 'TN.29', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105087, 'TN', 'Smar', 'Smar', NULL, NULL, NULL, NULL, 'TN.34', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105088, 'TN', 'Bir Lahmar', 'Bir Lahmar', NULL, NULL, NULL, NULL, 'TN.34', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105089, 'TN', 'Tataouine Sud', 'Tataouine Sud', NULL, NULL, NULL, NULL, 'TN.34', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105090, 'TN', 'Dhehiba', 'Dhehiba', NULL, NULL, NULL, NULL, 'TN.34', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105091, 'TN', 'Kébili Nord', 'Kebili Nord', NULL, NULL, NULL, NULL, 'TN.31', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31105092, 'TN', 'Rejim Maatoug', 'Rejim Maatoug', NULL, NULL, NULL, NULL, 'TN.31', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106372, 'TN', 'El Faouar', 'El Faouar', NULL, NULL, NULL, NULL, 'TN.31', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106373, 'TN', 'Souk Lahad', 'Souk Lahad', NULL, NULL, NULL, NULL, 'TN.31', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106374, 'TN', 'Douz Sud', 'Douz Sud', NULL, NULL, NULL, NULL, 'TN.31', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106375, 'TN', 'Hazoua', 'Hazoua', NULL, NULL, NULL, NULL, 'TN.35', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106377, 'TN', 'Tamaghza', 'Tamaghza', NULL, NULL, NULL, NULL, 'TN.35', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106593, 'TN', 'Mdhila', 'Mdhila', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106594, 'TN', 'Om El Araïes', 'Om El Araies', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106651, 'TN', 'El Ksar', 'El Ksar', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106652, 'TN', 'Belkhir', 'Belkhir', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106653, 'TN', 'Sned', 'Sned', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106656, 'TN', 'Gafsa Nord', 'Gafsa Nord', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106657, 'TN', 'Sidi Aïch', 'Sidi Aich', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106662, 'TN', 'Menzel Bouzaiene', 'Menzel Bouzaiene', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106663, 'TN', 'Sidi Ali Ben Aoun', 'Sidi Ali Ben Aoun', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106665, 'TN', 'Souk Jedid', 'Souk Jedid', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106666, 'TN', 'Ouled Haffouz', 'Ouled Haffouz', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106667, 'TN', 'Sidi Bouzid Est', 'Sidi Bouzid Est', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106668, 'TN', 'Jelma', 'Jelma', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106669, 'TN', 'Cebalet Ouled Asker', 'Cebalet Ouled Asker', NULL, NULL, NULL, NULL, 'TN.33', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106670, 'TN', 'Ezzouhour', 'Ezzouhour', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106671, 'TN', 'Kasserine Nord', 'Kasserine Nord', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106672, 'TN', 'Mejel Bel Abbès', 'Mejel Bel Abbes', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106673, 'TN', 'Hassi El Ferid', 'Hassi El Ferid', NULL, NULL, NULL, NULL, 'TN.02', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106862, 'TN', 'El Ala', 'El Ala', NULL, NULL, NULL, NULL, 'TN.03', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106863, 'TN', 'Kairouan Nord', 'Kairouan Nord', NULL, NULL, NULL, NULL, 'TN.03', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106864, 'TN', 'Cherarda', 'Cherarda', NULL, NULL, NULL, NULL, 'TN.03', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31106865, 'TN', 'Chebika', 'Chebika', NULL, NULL, NULL, NULL, 'TN.03', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107060, 'TN', 'Dahmani', 'Dahmani', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107061, 'TN', 'Jerissa', 'Jerissa', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107062, 'TN', 'Kalaa Khasba', 'Kalaa Khasba', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107173, 'TN', 'Kalaat Senan', 'Kalaat Senan', NULL, NULL, NULL, NULL, 'TN.14', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107575, 'TN', 'El Aroussa', 'El Aroussa', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107576, 'TN', 'Bargou', 'Bargou', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107577, 'TN', 'Kesra', 'Kesra', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31107578, 'TN', 'Rouhia', 'Rouhia', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108351, 'TN', 'Tibar', 'Tibar', NULL, NULL, NULL, NULL, 'TN.17', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108352, 'TN', 'Bir Mcherga', 'Bir Mcherga', NULL, NULL, NULL, NULL, 'TN.37', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108353, 'TN', 'Zriba', 'Zriba', NULL, NULL, NULL, NULL, 'TN.37', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108354, 'TN', 'Saouaf', 'Saouaf', NULL, NULL, NULL, NULL, 'TN.37', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108355, 'TN', 'Tinja', 'Tinja', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108356, 'TN', 'Utique', 'Utique', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108357, 'TN', 'Bizerte Nord', 'Bizerte Nord', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108358, 'TN', 'Zarzouna', 'Zarzouna', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108361, 'TN', 'Ghar El Melh', 'Ghar El Melh', NULL, NULL, NULL, NULL, 'TN.18', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108937, 'TN', 'Borj El Amri', 'Borj El Amri', NULL, NULL, NULL, NULL, 'TN.39', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108943, 'TN', 'Mornaguia', 'Mornaguia', NULL, NULL, NULL, NULL, 'TN.39', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108956, 'TN', 'Douar Hicher', 'Douar Hicher', NULL, NULL, NULL, NULL, 'TN.39', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108957, 'TN', 'Oued Ellil', 'Oued Ellil', NULL, NULL, NULL, NULL, 'TN.39', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31108958, 'TN', 'Jedaïda', 'Jedaida', NULL, NULL, NULL, NULL, 'TN.39', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109010, 'TN', 'Mornag', 'Mornag', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109011, 'TN', 'Hammam Chatt', 'Hammam Chatt', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109013, 'TN', 'Ezzahra', 'Ezzahra', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109014, 'TN', 'Mohamedia', 'Mohamedia', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109015, 'TN', 'Fouchana', 'Fouchana', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109016, 'TN', 'El Mourouj', 'El Mourouj', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109017, 'TN', 'la Nouvelle Médina', 'la Nouvelle Medina', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109018, 'TN', 'Mégrine', 'Megrine', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109019, 'TN', 'Bou Mhel El Bassatine', 'Bou Mhel El Bassatine', NULL, NULL, NULL, NULL, 'TN.27', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109021, 'TN', 'Soukra', 'Soukra', NULL, NULL, NULL, NULL, 'TN.38', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109022, 'TN', 'Cité Ettadhamen', 'Cite Ettadhamen', NULL, NULL, NULL, NULL, 'TN.38', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109023, 'TN', 'El Mnihla', 'El Mnihla', NULL, NULL, NULL, NULL, 'TN.38', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109024, 'TN', 'Sidi Thabet', 'Sidi Thabet', NULL, NULL, NULL, NULL, 'TN.38', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109078, 'TN', 'Kalaat El Andalous', 'Kalaat El Andalous', NULL, NULL, NULL, NULL, 'TN.38', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109157, 'TN', 'El Hrairia', 'El Hrairia', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109158, 'TN', 'El Kabaria', 'El Kabaria', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109159, 'TN', 'Jebel Jelloud', 'Jebel Jelloud', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109164, 'TN', 'El Ouardia', 'El Ouardia', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109165, 'TN', 'Sidi El Béchir', 'Sidi El Bechir', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109166, 'TN', 'Bab Souika', 'Bab Souika', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109167, 'TN', 'Ezzouhour', 'Ezzouhour', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109168, 'TN', 'Bardo', 'Bardo', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109170, 'TN', 'Ettahrir', 'Ettahrir', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109171, 'TN', 'El Omrane Supérieur', 'El Omrane Superieur', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109172, 'TN', 'El Omrane', 'El Omrane', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109174, 'TN', 'El Menzah', 'El Menzah', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109175, 'TN', 'Bab El Bhar', 'Bab El Bhar', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109176, 'TN', 'Cité El Khadra', 'Cite El Khadra', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109178, 'TN', 'Le Kram', 'Le Kram', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31109180, 'TN', 'La Marsa', 'La Marsa', NULL, NULL, NULL, NULL, 'TN.36', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31128523, 'TN', 'Gabès Ouest', 'Gabes Ouest', NULL, NULL, NULL, NULL, 'TN.29', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31128524, 'TN', 'Gabès Sud', 'Gabes Sud', NULL, NULL, NULL, NULL, 'TN.29', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31154520, 'TN', 'Gaafour', 'Gaafour', NULL, NULL, NULL, NULL, 'TN.22', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31204905, 'TN', 'Gafsa Sud', 'Gafsa Sud', NULL, NULL, NULL, NULL, 'TN.30', NULL, NULL, 'Africa/Tunis', '1', NULL, NULL),
(31204906, 'TN', 'Zahrouni', 'Zahrouni', NULL, NULL, 'P', 'PPL', 'TN.36', NULL, '15922', 'Africa/Tunis', '1', '2010-07-09 23:00:00', '2010-07-09 23:00:00'),
(31204907, 'TN', 'El Manar', 'El Manar', NULL, NULL, 'P', 'PPL', 'TN.36', NULL, '15922', 'Africa/Tunis', '1', '2010-07-09 23:00:00', '2010-07-09 23:00:00'),
(31204908, 'TN', 'Sidi Daoud', 'Sidi Daoud', NULL, NULL, 'P', 'PPL', 'TN.19', NULL, '15922', 'Africa/Tunis', '1', '2010-07-09 23:00:00', '2010-07-09 23:00:00'),
(31204909, 'TN', 'Nefta', 'Nefta', '33.820495', '7.87765', 'P', 'PPL', 'TN.35', NULL, '21720', 'Africa/Tunis', '1', '2012-01-17 23:00:00', '2012-01-17 23:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-03-04 19:48:25', '2020-03-04 19:48:25');

-- --------------------------------------------------------

--
-- Structure de la table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-03-04 19:48:25', '2020-03-04 19:48:25', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 4, '2020-03-04 19:48:25', '2020-05-13 15:08:29', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-03-04 19:48:25', '2020-03-04 19:48:25', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-03-04 19:48:25', '2020-03-04 19:48:25', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2020-03-04 19:48:26', '2020-05-13 15:08:29', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-03-04 19:48:26', '2020-05-13 15:08:29', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-03-04 19:48:26', '2020-05-13 15:08:29', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-03-04 19:48:26', '2020-05-13 15:08:29', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-03-04 19:48:26', '2020-05-13 15:08:30', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 7, '2020-03-04 19:48:26', '2020-05-13 15:08:30', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 5, '2020-03-04 19:48:31', '2020-05-13 15:08:29', 'voyager.categories.index', NULL),
(13, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-03-04 19:51:57', '2020-05-13 15:08:30', 'voyager.hooks', NULL),
(14, 1, 'Localisations', '', '_self', NULL, NULL, NULL, 8, '2020-05-13 14:58:36', '2020-05-13 15:08:30', 'voyager.localisations.index', NULL),
(15, 1, 'Posts', '', '_self', NULL, NULL, NULL, 9, '2020-05-13 15:00:23', '2020-05-13 15:08:30', 'voyager.posts.index', NULL),
(16, 1, 'Post Images', '', '_self', NULL, NULL, NULL, 10, '2020-05-13 15:02:35', '2020-05-13 15:08:30', 'voyager.post-images.index', NULL),
(17, 1, 'Post Comments', '', '_self', NULL, NULL, NULL, 11, '2020-05-13 15:04:37', '2020-05-13 15:08:30', 'voyager.post-comments.index', NULL),
(18, 1, 'Hobbies', '', '_self', NULL, NULL, NULL, 12, '2020-05-13 23:22:26', '2020-05-13 23:22:26', 'voyager.hobbies.index', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2017_05_20_131345_update_users_table', 2),
(28, '2017_05_20_131839_create_user_direct_messages', 2),
(29, '2017_05_20_132515_create_user_following_table', 2),
(30, '2017_05_20_133038_create_countries', 2),
(31, '2017_05_20_133151_create_cities_table', 2),
(32, '2017_05_20_133406_create_hobbies_table', 2),
(33, '2017_05_20_133512_create_groups_table', 2),
(34, '2017_05_20_133707_create_user_hobbies_table', 2),
(35, '2017_05_20_133850_create_user_locations_table', 2),
(36, '2017_05_20_202256_update_users_table_2', 2),
(37, '2017_06_03_143218_update_users_table_3', 2),
(38, '2017_06_03_185756_update_user_locations_table', 2),
(39, '2017_06_06_182742_create_user_relationship_table', 2),
(40, '2017_06_08_181805_update_seen_tables', 2),
(41, '2018_02_07_113522_add_sign_in_at_to_users', 2),
(42, '2018_04_07_120024_create_communities_table', 2),
(43, '2018_04_13_145941_community_user', 2);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-03-04 19:48:26', '2020-03-04 19:48:26'),
(2, 'browse_bread', NULL, '2020-03-04 19:48:26', '2020-03-04 19:48:26'),
(3, 'browse_database', NULL, '2020-03-04 19:48:26', '2020-03-04 19:48:26'),
(4, 'browse_media', NULL, '2020-03-04 19:48:26', '2020-03-04 19:48:26'),
(5, 'browse_compass', NULL, '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(6, 'browse_menus', 'menus', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(7, 'read_menus', 'menus', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(8, 'edit_menus', 'menus', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(9, 'add_menus', 'menus', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(10, 'delete_menus', 'menus', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(11, 'browse_roles', 'roles', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(12, 'read_roles', 'roles', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(13, 'edit_roles', 'roles', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(14, 'add_roles', 'roles', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(15, 'delete_roles', 'roles', '2020-03-04 19:48:27', '2020-03-04 19:48:27'),
(16, 'browse_users', 'users', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(17, 'read_users', 'users', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(18, 'edit_users', 'users', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(19, 'add_users', 'users', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(20, 'delete_users', 'users', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(21, 'browse_settings', 'settings', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(22, 'read_settings', 'settings', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(23, 'edit_settings', 'settings', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(24, 'add_settings', 'settings', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(25, 'delete_settings', 'settings', '2020-03-04 19:48:28', '2020-03-04 19:48:28'),
(26, 'browse_categories', 'categories', '2020-03-04 19:48:31', '2020-03-04 19:48:31'),
(27, 'read_categories', 'categories', '2020-03-04 19:48:31', '2020-03-04 19:48:31'),
(28, 'edit_categories', 'categories', '2020-03-04 19:48:31', '2020-03-04 19:48:31'),
(29, 'add_categories', 'categories', '2020-03-04 19:48:31', '2020-03-04 19:48:31'),
(30, 'delete_categories', 'categories', '2020-03-04 19:48:31', '2020-03-04 19:48:31'),
(36, 'browse_hooks', NULL, '2020-03-04 19:51:57', '2020-03-04 19:51:57'),
(37, 'browse_localisations', 'localisations', '2020-05-13 14:58:35', '2020-05-13 14:58:35'),
(38, 'read_localisations', 'localisations', '2020-05-13 14:58:35', '2020-05-13 14:58:35'),
(39, 'edit_localisations', 'localisations', '2020-05-13 14:58:35', '2020-05-13 14:58:35'),
(40, 'add_localisations', 'localisations', '2020-05-13 14:58:35', '2020-05-13 14:58:35'),
(41, 'delete_localisations', 'localisations', '2020-05-13 14:58:35', '2020-05-13 14:58:35'),
(42, 'browse_posts', 'posts', '2020-05-13 15:00:23', '2020-05-13 15:00:23'),
(43, 'read_posts', 'posts', '2020-05-13 15:00:23', '2020-05-13 15:00:23'),
(44, 'edit_posts', 'posts', '2020-05-13 15:00:23', '2020-05-13 15:00:23'),
(45, 'add_posts', 'posts', '2020-05-13 15:00:23', '2020-05-13 15:00:23'),
(46, 'delete_posts', 'posts', '2020-05-13 15:00:23', '2020-05-13 15:00:23'),
(47, 'browse_post_images', 'post_images', '2020-05-13 15:02:35', '2020-05-13 15:02:35'),
(48, 'read_post_images', 'post_images', '2020-05-13 15:02:35', '2020-05-13 15:02:35'),
(49, 'edit_post_images', 'post_images', '2020-05-13 15:02:35', '2020-05-13 15:02:35'),
(50, 'add_post_images', 'post_images', '2020-05-13 15:02:35', '2020-05-13 15:02:35'),
(51, 'delete_post_images', 'post_images', '2020-05-13 15:02:35', '2020-05-13 15:02:35'),
(52, 'browse_post_comments', 'post_comments', '2020-05-13 15:04:37', '2020-05-13 15:04:37'),
(53, 'read_post_comments', 'post_comments', '2020-05-13 15:04:37', '2020-05-13 15:04:37'),
(54, 'edit_post_comments', 'post_comments', '2020-05-13 15:04:37', '2020-05-13 15:04:37'),
(55, 'add_post_comments', 'post_comments', '2020-05-13 15:04:37', '2020-05-13 15:04:37'),
(56, 'delete_post_comments', 'post_comments', '2020-05-13 15:04:37', '2020-05-13 15:04:37'),
(57, 'browse_hobbies', 'hobbies', '2020-05-13 23:22:26', '2020-05-13 23:22:26'),
(58, 'read_hobbies', 'hobbies', '2020-05-13 23:22:26', '2020-05-13 23:22:26'),
(59, 'edit_hobbies', 'hobbies', '2020-05-13 23:22:26', '2020-05-13 23:22:26'),
(60, 'add_hobbies', 'hobbies', '2020-05-13 23:22:26', '2020-05-13 23:22:26'),
(61, 'delete_hobbies', 'hobbies', '2020-05-13 23:22:26', '2020-05-13 23:22:26');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 4),
(7, 1),
(7, 4),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 4),
(17, 1),
(17, 4),
(18, 1),
(19, 1),
(20, 1),
(20, 4),
(21, 1),
(21, 6),
(22, 1),
(22, 6),
(23, 1),
(23, 6),
(24, 1),
(24, 6),
(25, 1),
(25, 6),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 4),
(43, 1),
(43, 4),
(44, 1),
(45, 1),
(46, 1),
(46, 4),
(47, 1),
(47, 4),
(48, 1),
(48, 4),
(49, 1),
(50, 1),
(51, 1),
(51, 4),
(52, 1),
(52, 4),
(53, 1),
(53, 4),
(54, 1),
(55, 1),
(56, 1),
(56, 4),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `has_image` tinyint(1) NOT NULL DEFAULT 0,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `group_id`, `has_image`, `content`, `title`, `created_at`, `updated_at`) VALUES
(35, NULL, 1, 0, 1, '', '.', '2020-03-04 21:57:41', '2020-03-04 21:57:41'),
(37, NULL, 1, 0, 1, '', '.', '2020-03-04 22:11:08', '2020-03-04 22:11:08'),
(39, NULL, 2, 0, 1, 'c v', '.', '2020-03-04 22:12:50', '2020-03-04 22:12:50'),
(40, NULL, 2, 0, 0, 'szsz', '.', '2020-03-04 22:16:18', '2020-03-04 22:16:18'),
(41, NULL, 2, 0, 1, 'kjl', '.', '2020-03-04 22:33:02', '2020-03-04 22:33:02'),
(42, NULL, 2, 0, 1, '', '.', '2020-03-04 22:39:56', '2020-03-04 22:39:56'),
(44, NULL, 2, 0, 0, 'ss', '.', '2020-03-05 10:55:53', '2020-03-05 10:55:53'),
(45, NULL, 2, 0, 0, 's', '.', '2020-03-05 10:56:07', '2020-03-05 10:56:07'),
(46, NULL, 2, 0, 0, 'ss', '.', '2020-03-05 10:56:20', '2020-03-05 10:56:20'),
(47, NULL, 2, 0, 0, 'aa', '.', '2020-03-05 10:56:32', '2020-03-05 10:56:32'),
(48, NULL, 2, 0, 0, 'sd', '.', '2020-03-05 10:59:24', '2020-03-05 10:59:24'),
(49, NULL, 2, 0, 0, 'q', '.', '2020-03-05 10:59:43', '2020-03-05 10:59:43'),
(51, NULL, 4, 0, 1, 'ss', '.', '2020-03-05 11:29:40', '2020-03-05 11:29:40'),
(52, NULL, 4, 0, 0, 'dfdf', '.', '2020-03-05 11:30:26', '2020-03-05 11:30:26'),
(53, NULL, 2, 0, 1, 'sd', '.', '2020-03-05 15:28:58', '2020-03-05 15:28:58'),
(54, NULL, 3, 0, 1, 'test', '.', '2020-03-05 17:36:41', '2020-03-05 17:36:41'),
(55, NULL, 3, 0, 1, 'camping', '.', '2020-03-05 20:16:32', '2020-03-05 20:16:32'),
(65, NULL, 13, 0, 1, 'belle vue', '.', '2020-05-30 06:12:49', '2020-05-30 06:12:49'),
(66, NULL, 13, 0, 1, '', '.', '2020-05-30 06:13:08', '2020-05-30 06:13:08');

-- --------------------------------------------------------

--
-- Structure de la table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `comment_user_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_comments`
--

INSERT INTO `post_comments` (`id`, `post_id`, `comment_user_id`, `comment`, `created_at`, `updated_at`, `seen`) VALUES
(6, 42, 2, 'jlhk', '2020-03-04 22:42:03', '2020-03-04 22:42:03', 0),
(30, 66, 3, 'df', '2020-06-05 07:26:54', '2020-06-05 07:26:54', 0);

-- --------------------------------------------------------

--
-- Structure de la table `post_images`
--

CREATE TABLE `post_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_images`
--

INSERT INTO `post_images` (`id`, `post_id`, `image_path`) VALUES
(4, 35, '4e23aa24c6f7080443240cda2d332c2d.jpg'),
(5, 37, '6aa4af047e1fc3ae6dc0b6e8c8e86830.JPG'),
(6, 39, '25920f6c8eaa0534ec767b6955e3a3a7.jpg'),
(7, 41, 'd7cf118893713ec7e4626cc38e72c8d6.JPG'),
(8, 42, 'c785dfb7b59a16fc672dbdfa32a9bc4a.JPG'),
(10, 51, 'f675470ea71e968df9b7f11f85935ea3.JPG'),
(11, 53, 'a798218279fdc5797e6b0996da688b92.JPG'),
(12, 54, 'dacd8d12140bc866540d972426857159.jpg'),
(13, 55, '60c72ed388091ae621f256a22b7bcd8f.jpg'),
(19, 65, '8e98cb56e3d42fb1cddba3738197292c.jpg'),
(20, 66, '1a283cc83ae7b1d5cd9a1082fbfa4930.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `post_likes`
--

CREATE TABLE `post_likes` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `like_user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_likes`
--

INSERT INTO `post_likes` (`post_id`, `like_user_id`, `created_at`, `updated_at`, `seen`) VALUES
(35, 1, '2020-03-04 21:57:44', '2020-03-04 21:57:44', 0),
(40, 2, '2020-03-04 22:16:21', '2020-03-04 22:16:21', 0),
(51, 4, '2020-03-05 11:29:45', '2020-03-05 11:29:45', 0),
(52, 3, '2020-03-05 20:21:52', '2020-03-05 20:21:52', 0),
(54, 3, '2020-03-05 19:12:04', '2020-03-05 19:12:04', 0),
(55, 3, '2020-05-20 10:53:56', '2020-05-20 10:53:56', 0),
(65, 13, '2020-05-30 08:47:15', '2020-05-30 08:47:15', 0),
(66, 3, '2020-06-05 07:24:06', '2020-06-05 07:24:06', 0),
(66, 13, '2020-05-30 08:47:04', '2020-05-30 08:47:04', 0);

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-03-04 19:48:26', '2020-03-04 19:48:26'),
(2, 'user', 'Normal User', '2020-03-04 19:48:26', '2020-03-04 19:48:26'),
(4, 'controlleur', 'controlleur', '2020-05-15 19:40:17', '2020-05-15 19:40:17'),
(6, 'nopost', 'nopost', '2020-05-20 23:17:34', '2020-05-20 23:17:34');

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\May2020\\b9UcnTPJFTDODZ07zOup.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'CAMP_BACKEND', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'LET\'S CAMP. BACK_OFFICE', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\May2020\\3y5RII8d3QxDvqNAPiqi.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Structure de la table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sing_in_at` timestamp NULL DEFAULT NULL,
  `avatar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `private`, `birthday`, `sex`, `phone`, `bio`, `profile_path`, `username`, `cover_path`, `last_sing_in_at`, `avatar`) VALUES
(1, 1, 'Admin', 'admin@admin.com', NULL, '$2y$10$Q7daOSWbFZIDCVSqgh7gO.waqTgnNE9z4M07MFA7.1Hk.huKn/iVe', '6M7Qlhjfbl1GVDPbac0c3urph3ZwB93Z3FB58lgODeWv0GbTV9e9IheCcX56', NULL, '2020-03-04 19:48:32', '2020-03-04 20:59:36', 0, NULL, 0, NULL, NULL, '0b17435a3394a8430ac5564536358435.jpg', 'adminn', 'abf7082886615e5df60af2125568cdde.jpg', NULL, NULL),
(2, NULL, 'test', 'test@gmail.com', NULL, '$2y$10$yV17YOzWRLVQXaK43nmgX.1u5sT3HiKujNiHnllhNbSXMwy0cqSv6', NULL, NULL, '2020-03-04 20:42:33', '2020-03-04 22:40:12', 0, NULL, 0, NULL, NULL, '0c669566c5b47361b256d8675d8b5b9c.jpg', 'ssssssssss', '4edefb2bc53459c833fcddc888a5ca73.JPG', NULL, NULL),
(3, 2, 'demo', 'demodemo@gmail.com', NULL, '$2y$10$m/n7IRDdui48IZMQZoBM7.vQD2Q6ENRFumx3Ud6FVzy8AR.UDjwce', 'Y6CO1DLmP5gi4XejTDU2GHKdop3AWeHmSHhWZyL376VReEuBpdi66JepMaap', NULL, '2020-03-04 20:51:07', '2020-05-26 22:31:10', 0, '1997-03-03', 0, '28357935', 'GTA', '6075668cd01acd7f17eb43ac5c3b02d9.png', 'demoooo', '71a2098b1bbaf23a2b07a130292f94d3.JPG', NULL, NULL),
(4, 2, 'ghazi', 'ghazi@gmail.com', NULL, '$2y$10$Hdp/PL7cv0OkldbiTaOnJuHMnzXWotMXCSqp8lk0Wzn3KdAhyVJFq', NULL, NULL, '2020-03-04 21:08:06', '2020-03-05 12:21:02', 0, '0000-00-00', 0, '', 'sdsd', NULL, 'sasa', NULL, NULL, NULL),
(8, 2, 'meher', 'meher@gmail.com', NULL, '$2y$10$WxXMqNS63Jt/AUiyyYy8vuXNMJknwHvD5rXuq0KHYIbeNncmvhkNW', NULL, NULL, '2020-03-20 21:15:30', '2020-03-20 21:15:30', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, NULL, 'ala eddine', 'alaedine@gmail.com', NULL, '$2y$10$IOusaattwXgV8umpC4ystuhYQqtUgU/yPYorfbdkIDK6PMTlzBiii', NULL, NULL, '2020-05-30 06:11:33', '2020-05-30 06:13:28', 0, NULL, 0, NULL, NULL, NULL, 'aladin', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_direct_messages`
--

CREATE TABLE `user_direct_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_user_id` int(10) UNSIGNED NOT NULL,
  `receiver_user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `sender_delete` tinyint(1) NOT NULL DEFAULT 0,
  `receiver_delete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_following`
--

CREATE TABLE `user_following` (
  `id` int(10) UNSIGNED NOT NULL,
  `following_user_id` int(10) UNSIGNED NOT NULL,
  `follower_user_id` int(10) UNSIGNED NOT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_following`
--

INSERT INTO `user_following` (`id`, `following_user_id`, `follower_user_id`, `allow`) VALUES
(1, 1, 3, 1),
(2, 2, 3, 1),
(3, 2, 1, 1),
(6, 4, 2, 1),
(7, 4, 3, 0),
(18, 2, 13, 0),
(23, 1, 13, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_hobbies`
--

CREATE TABLE `user_hobbies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `hobby_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_hobbies`
--

INSERT INTO `user_hobbies` (`user_id`, `hobby_id`) VALUES
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `user_locations`
--

CREATE TABLE `user_locations` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `city_id` int(10) UNSIGNED NOT NULL,
  `latitud` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitud` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_relationship`
--

CREATE TABLE `user_relationship` (
  `id` int(10) UNSIGNED NOT NULL,
  `related_user_id` int(10) UNSIGNED NOT NULL,
  `main_user_id` int(10) UNSIGNED NOT NULL,
  `relation_type` int(11) NOT NULL DEFAULT 0,
  `allow` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `all_posts`
--
ALTER TABLE `all_posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Index pour la table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`);

--
-- Index pour la table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `community_user`
--
ALTER TABLE `community_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Index pour la table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Index pour la table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groups_hobby_id_foreign` (`hobby_id`);

--
-- Index pour la table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `localisations`
--
ALTER TABLE `localisations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Index pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Index pour la table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`),
  ADD KEY `post_comments_comment_user_id_foreign` (`comment_user_id`);

--
-- Index pour la table `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_images_post_id_foreign` (`post_id`);

--
-- Index pour la table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`post_id`,`like_user_id`),
  ADD KEY `post_likes_like_user_id_foreign` (`like_user_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Index pour la table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Index pour la table `user_direct_messages`
--
ALTER TABLE `user_direct_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_direct_messages_sender_user_id_foreign` (`sender_user_id`),
  ADD KEY `user_direct_messages_receiver_user_id_foreign` (`receiver_user_id`);

--
-- Index pour la table `user_following`
--
ALTER TABLE `user_following`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_following_following_user_id_foreign` (`following_user_id`),
  ADD KEY `user_following_follower_user_id_foreign` (`follower_user_id`);

--
-- Index pour la table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD PRIMARY KEY (`user_id`,`hobby_id`),
  ADD KEY `user_hobbies_hobby_id_foreign` (`hobby_id`);

--
-- Index pour la table `user_locations`
--
ALTER TABLE `user_locations`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_locations_city_id_foreign` (`city_id`);

--
-- Index pour la table `user_relationship`
--
ALTER TABLE `user_relationship`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_relationship_related_user_id_foreign` (`related_user_id`),
  ADD KEY `user_relationship_main_user_id_foreign` (`main_user_id`);

--
-- Index pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `all_posts`
--
ALTER TABLE `all_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `community_user`
--
ALTER TABLE `community_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT pour la table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `localisations`
--
ALTER TABLE `localisations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31204910;

--
-- AUTO_INCREMENT pour la table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT pour la table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `user_direct_messages`
--
ALTER TABLE `user_direct_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_following`
--
ALTER TABLE `user_following`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `user_relationship`
--
ALTER TABLE `user_relationship`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_hobby_id_foreign` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_comment_user_id_foreign` FOREIGN KEY (`comment_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `post_images`
--
ALTER TABLE `post_images`
  ADD CONSTRAINT `post_images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_like_user_id_foreign` FOREIGN KEY (`like_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `user_direct_messages`
--
ALTER TABLE `user_direct_messages`
  ADD CONSTRAINT `user_direct_messages_receiver_user_id_foreign` FOREIGN KEY (`receiver_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_direct_messages_sender_user_id_foreign` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `user_following`
--
ALTER TABLE `user_following`
  ADD CONSTRAINT `user_following_follower_user_id_foreign` FOREIGN KEY (`follower_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_following_following_user_id_foreign` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD CONSTRAINT `user_hobbies_hobby_id_foreign` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_hobbies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_locations`
--
ALTER TABLE `user_locations`
  ADD CONSTRAINT `user_locations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `user_locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_relationship`
--
ALTER TABLE `user_relationship`
  ADD CONSTRAINT `user_relationship_main_user_id_foreign` FOREIGN KEY (`main_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_relationship_related_user_id_foreign` FOREIGN KEY (`related_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
