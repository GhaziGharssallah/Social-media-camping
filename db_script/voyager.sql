-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: camp_pro
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Category 1','category-1','2020-03-04 19:48:31','2020-03-04 19:48:31'),(2,NULL,1,'Category 2','category-2','2020-03-04 19:48:31','2020-03-04 19:48:31');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cities_country_id_foreign` (`country_id`),
  CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `followers` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_user`
--

DROP TABLE IF EXISTS `community_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_user`
--

LOCK TABLES `community_user` WRITE;
/*!40000 ALTER TABLE `community_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `shortname` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,NULL,1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,NULL,4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,NULL,6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(29,6,'id','text','Id',1,0,0,0,0,0,'{}',1),(30,6,'country_code','text','Country Code',0,1,1,1,1,1,'{}',2),(31,6,'name','text','Name',0,1,1,1,1,1,'{}',3),(32,6,'asciiname','text','Asciiname',0,1,1,1,1,1,'{}',4),(33,6,'latitude','text','Latitude',0,1,1,1,1,1,'{}',5),(34,6,'longitude','text','Longitude',0,1,1,1,1,1,'{}',6),(35,6,'feature_class','text','Feature Class',0,1,1,1,1,1,'{}',7),(36,6,'feature_code','text','Feature Code',0,1,1,1,1,1,'{}',8),(37,6,'subadmin1_code','text','Subadmin1 Code',0,1,1,1,1,1,'{}',9),(38,6,'subadmin2_code','text','Subadmin2 Code',0,1,1,1,1,1,'{}',10),(39,6,'population','text','Population',0,1,1,1,1,1,'{}',11),(40,6,'time_zone','text','Time Zone',0,1,1,1,1,1,'{}',12),(41,6,'active','text','Active',0,1,1,1,1,1,'{}',13),(42,6,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',14),(43,6,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',15),(44,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(45,7,'category_id','text','Category Id',0,1,1,1,1,1,'{}',3),(46,7,'user_id','text','User Id',1,1,1,1,1,1,'{}',2),(47,7,'group_id','text','Group Id',0,1,1,1,1,1,'{}',4),(48,7,'has_image','text','Has Image',1,1,1,1,1,1,'{}',5),(49,7,'content','text','Content',0,1,1,1,1,1,'{}',6),(50,7,'title','text','Title',1,1,1,1,1,1,'{}',7),(51,7,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(52,7,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(53,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(54,8,'post_id','text','Post Id',1,1,1,1,1,1,'{}',2),(55,8,'image_path','text','Image Path',1,1,1,1,1,1,'{}',3),(56,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,9,'post_id','text','Post Id',1,1,1,1,1,1,'{}',2),(58,9,'comment_user_id','text','Comment User Id',1,1,1,1,1,1,'{}',3),(59,9,'comment','text_area','Comment',1,1,1,1,1,1,'{}',4),(60,9,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(61,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(62,9,'seen','text','Seen',1,1,1,1,1,1,'{}',7);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2020-03-04 19:48:23','2020-03-04 19:48:23'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2020-03-04 19:48:23','2020-03-04 19:48:23'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'','',1,0,NULL,'2020-03-04 19:48:24','2020-03-04 19:48:24'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category',NULL,'','',1,0,NULL,'2020-03-04 19:48:30','2020-03-04 19:48:30'),(6,'localisations','localisations','Localisation','Localisations',NULL,'App\\Models\\Localisation',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2020-05-13 14:58:35','2020-05-13 14:58:35'),(7,'posts','posts','Models\\Post','Posts',NULL,'App\\Models\\Post',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2020-05-13 15:00:22','2020-05-13 15:00:22'),(8,'post_images','post-images','Post Image','Post Images',NULL,'App\\Models\\PostImage',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2020-05-13 15:02:35','2020-05-13 15:02:35'),(9,'post_comments','post-comments','Post Comment','Post Comments',NULL,'App\\Models\\PostComment',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2020-05-13 15:04:36','2020-05-13 15:04:36');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hobby_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_hobby_id_foreign` (`hobby_id`),
  CONSTRAINT `groups_hobby_id_foreign` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobbies`
--

DROP TABLE IF EXISTS `hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hobbies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` VALUES (1,'camp '),(2,'nature'),(3,' voyage'),(4,' tourisme');
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localisations`
--

DROP TABLE IF EXISTS `localisations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localisations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31204909 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localisations`
--

LOCK TABLES `localisations` WRITE;
/*!40000 ALTER TABLE `localisations` DISABLE KEYS */;
INSERT INTO `localisations` VALUES (2463950,'TN','Menzel Temime','Menzel Temime','36.77973','10.98556','P','PPL','TN.19',NULL,NULL,'Africa/Tunis','1','2016-10-07 23:00:00','2016-10-07 23:00:00'),(2463951,'TN','Zaouiat Djedidi','Zaouiat Djedidi','37','10.5743','P','PPL','TN.19',NULL,'6583','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2464041,'TN','Zaghouan','Zaghouan','36','10.1429','P','PPLA','TN.37',NULL,'16911','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2464168,'TN','Oued Lill','Oued Lill','37','10.0406','P','PPL','TN.36',NULL,'47101','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2464427,'TN','Touza','Touza','36','10.8273','P','PPL','TN.16',NULL,'6085','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2464465,'TN','la Médina','la Medina',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2464470,'TN','Tunis','Tunis','37','10.1658','P','PPLC','TN.36',NULL,'693210','Africa/Tunis','1','2017-08-15 23:00:00','2017-08-15 23:00:00'),(2464648,'TN','Tozeur','Tozeur','34','8.13352','P','PPLA','TN.35',NULL,'34943','Africa/Tunis','1','2014-07-15 23:00:00','2014-07-15 23:00:00'),(2464700,'TN','Tataouine Nord','Tataouine Nord',NULL,NULL,NULL,NULL,'TN.34',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2464701,'TN','Tataouine','Tataouine','33','10.4518','P','PPLA','TN.34',NULL,'62577','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2464704,'TN','Testour','Testour','37','9.44307','P','PPL','TN.17',NULL,'13708','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2464795,'TN','Thala','Thala','36','8.67031','P','PPL','TN.02',NULL,'16068','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2464804,'TN','Takelsa','Takelsa','37','10.6333','P','PPL','TN.19',NULL,'20659','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2464809,'TN','Tajerouine','Tajerouine','36','8.55276','P','PPL','TN.14',NULL,'18909','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2464855,'TN','Tabursuq','Tabursuq','36','9.24751','P','PPL','TN.17',NULL,'12727','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2464871,'TN','Tabarka','Tabarka','37','8.75801','P','PPL','TN.06',NULL,'13712','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2464914,'TN','Sousse Médina','Sousse Medina',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2464915,'TN','Sousse','Sousse','36','10.637','P','PPLA','TN.23',NULL,'164123','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2464977,'TN','Sbeitla','Sbeitla',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2465029,'TN','Siliana Sud','Siliana Sud',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2465030,'TN','Siliana','Siliana','36','9.37082','P','PPLA','TN.22',NULL,'26960','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2465138,'TN','Sidi Alouane','Sidi Alouane','35','10.939','P','PPL','TN.15',NULL,'7051','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2465836,'TN','Sidi Bouzid Ouest','Sidi Bouzid Ouest',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2465840,'TN','Sidi Bouzid','Sidi Bouzid','35','9.48494','P','PPLA','TN.33',NULL,'42098','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2466034,'TN','Sidi Bou Ali','Sidi Bou Ali','36','10.4731','P','PPL','TN.23',NULL,'8855','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2466895,'TN','Chorbane','Chorbane',NULL,NULL,NULL,NULL,'TN.15',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2466897,'TN','Chorbane','Chorbane','35','10.3858','P','PPL','TN.15',NULL,'6430','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2467180,'TN','Souassi','Souassi',NULL,NULL,NULL,NULL,'TN.15',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2467239,'TN','Sakiet Sidi Youssef','Sakiet Sidi Youssef','36','8.35547','P','PPL','TN.14',NULL,'6442','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2467246,'TN','Skanes','Skanes','36','10.8','P','PPL','TN.16',NULL,'64222','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2467368,'TN','Sejenane','Sejenane','37','9.23806','P','PPL','TN.18',NULL,'5009','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2467454,'TN','Sfax','Sfax','35','10.7603','P','PPLA','TN.32',NULL,'277278','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2467506,'TN','Sbiba','Sbiba','36','9.0737','P','PPL','TN.02',NULL,'6291','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2467521,'TN','La Sebala du Mornag','La Sebala du Mornag','37','10.292','P','PPL','TN.36',NULL,'33421','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2467813,'TN','Rafrāf','Rafraf','37','10.1837','P','PPL','TN.18',NULL,'9255','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2467815,'TN','Radès','Rades','37','10.2753','P','PPL','TN.36',NULL,'44298','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2467856,'TN','Ksour Essaf','Ksour Essaf','35','10.9948','P','PPL','TN.15',NULL,'27936','Africa/Tunis','1','2013-03-17 23:00:00','2013-03-17 23:00:00'),(2467890,'TN','Ksibet el Mediouni','Ksibet el Mediouni','36','10.8426','P','PPL','TN.16',NULL,'11313','Africa/Tunis','1','2016-10-08 23:00:00','2016-10-08 23:00:00'),(2467920,'TN','Korba','Korba','37','10.8586','P','PPL','TN.19',NULL,'33589','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2467959,'TN','Kélibia','Kelibia','37','11.0939','P','PPL','TN.19',NULL,'43209','Africa/Tunis','1','2016-10-07 23:00:00','2016-10-07 23:00:00'),(2468016,'TN','Kébili Sud','Kebili Sud',NULL,NULL,NULL,NULL,'TN.31',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2468018,'TN','Kebili','Kebili','34','8.96903','P','PPLA','TN.31',NULL,'19875','Africa/Tunis','1','2014-10-31 23:00:00','2014-10-31 23:00:00'),(2468106,'TN','Ksar Hellal','Ksar Hellal','36','10.8905','P','PPL','TN.16',NULL,'39792','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2468245,'TN','Carthage','Carthage','37','10.3316','P','PPL','TN.36',NULL,'15922','Africa/Tunis','1','2010-07-09 23:00:00','2010-07-09 23:00:00'),(2468285,'TN','El Fahs','El Fahs','36','9.90651','P','PPL','TN.37',NULL,'18083','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2468329,'TN','Galaat el Andeless','Galaat el Andeless','37','10.1183','P','PPL','TN.38',NULL,'15313','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2468349,'TN','Gafour','Gafour','36','9.32424','P','PPL','TN.22',NULL,'10556','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2468353,'TN','Gafsa','Gafsa','34','8.78417','P','PPLA','TN.30','TN.30.2468352','81232','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2468369,'TN','Gabès','Gabes','34','10.0982','P','PPLA','TN.29',NULL,'110075','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2468561,'TN','Nefta','Nefta','34','7.87765','P','PPL','TN.35',NULL,'21720','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2468579,'TN','Nabeul','Nabeul','36','10.7376','P','PPLA','TN.19',NULL,'56387','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2468925,'TN','Midoun','Midoun','34','10.9923','P','PPL','TN.28',NULL,'120000','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2469088,'TN','Mateur','Mateur','37','9.66557','P','PPL','TN.18',NULL,'31005','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2469140,'TN','Msaken','Msaken','36','10.5808','P','PPL','TN.23',NULL,'64563','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2469255,'TN','Menzel Kamel','Menzel Kamel','36','10.6673','P','PPL','TN.16',NULL,'8314','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2469256,'TN','Menzel Jemil','Menzel Jemil','37','9.91448','P','PPL','TN.18',NULL,'21542','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2469262,'TN','Mennzel Bou Zelfa','Mennzel Bou Zelfa','37','10.5843','P','PPL','TN.19',NULL,'16231','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2469264,'TN','Menzel Bourguiba','Menzel Bourguiba','37','9.78594','P','PPL','TN.18',NULL,'46245','Africa/Tunis','1','2016-10-07 23:00:00','2016-10-07 23:00:00'),(2469268,'TN','Menzel Abderhaman','Menzel Abderhaman','37','9.86313','P','PPL','TN.18',NULL,'15769','Africa/Tunis','1','2016-10-14 23:00:00','2016-10-14 23:00:00'),(2469274,'TN','Manouba','Manouba','37','10.0972','P','PPLA','TN.39',NULL,'24948','Africa/Tunis','1','2011-03-07 23:00:00','2011-03-07 23:00:00'),(2469321,'TN','Melloulèche','Mellouleche','35','11.035','P','PPL','TN.15',NULL,'6441','Africa/Tunis','1','2016-10-08 23:00:00','2016-10-08 23:00:00'),(2469341,'TN','Maktar','Maktar','36','9.20072','P','PPL','TN.22',NULL,'14500','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2469386,'TN','Medjez el Bab','Medjez el Bab','37','9.61231','P','PPL','TN.17',NULL,'20118','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2469473,'TN','Medenine','Medenine','33','10.5055','P','PPLA','TN.28',NULL,'61705','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2469474,'TN','Médenine Sud','Medenine Sud',NULL,NULL,NULL,NULL,'TN.28',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2469571,'TN','Lemta','Lemta','36','10.8833','P','PPL','TN.16',NULL,'5382','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2470086,'TN','Jendouba','Jendouba',NULL,NULL,NULL,NULL,'TN.06',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2470088,'TN','Jendouba','Jendouba','37','8.78024','P','PPLA','TN.06',NULL,'51408','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2470120,'TN','Jilma','Jilma','35','9.42385','P','PPL','TN.33',NULL,'5647','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2470173,'TN','Zarzis','Zarzis','34','11.1122','P','PPL','TN.28',NULL,'79316','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2470189,'TN','Jemna','Jemna','34','9.01472','P','PPL','TN.31',NULL,'6254','Africa/Tunis','1','2014-10-31 23:00:00','2014-10-31 23:00:00'),(2470191,'TN','Djemmal','Djemmal','36','10.757','P','PPL','TN.16',NULL,'39990','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2470260,'TN','Djebeniana','Djebeniana','35','10.9081','P','PPL','TN.32',NULL,'7349','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2470384,'TN','Houmt Souk','Houmt Souk','34','10.8574','P','PPL','TN.28',NULL,'62583','Africa/Tunis','1','2014-07-14 23:00:00','2014-07-14 23:00:00'),(2470483,'TN','Harqalah','Harqalah','36','10.509','P','PPL','TN.23',NULL,'6942','Africa/Tunis','1','2016-10-08 23:00:00','2016-10-08 23:00:00'),(2470579,'TN','Hammam Sousse','Hammam Sousse','36','10.6031','P','PPL','TN.23',NULL,'33834','Africa/Tunis','1','2014-10-31 23:00:00','2014-10-31 23:00:00'),(2470587,'TN','la Banlieue Sud','la Banlieue Sud',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2470588,'TN','Hammam-Lif','Hammam-Lif','37','10.3416','P','PPL','TN.36',NULL,'47760','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2470656,'TN','La Goulette','La Goulette','37','10.305','P','PPL','TN.36',NULL,'79795','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2470800,'TN','Haffouz','Haffouz','36','9.67624','P','PPL','TN.03',NULL,'7765','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2470996,'TN','Rhar el Melah','Rhar el Melah','37','10.1906','P','PPL','TN.18',NULL,'5018','Africa/Tunis','1','2016-10-14 23:00:00','2016-10-14 23:00:00'),(2471060,'TN','Feriana','Feriana',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2471287,'TN','Douz','Douz','33','9.0203','P','PPL','TN.31',NULL,'28127','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2471454,'TN','Degache','Degache','34','8.2081','P','PPL','TN.35',NULL,'8134','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2471475,'TN','Douar Tindja','Douar Tindja','37','9.75','P','PPL','TN.18',NULL,'18551','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2471637,'TN','Dar Chabanne','Dar Chabanne','36','10.7517','P','PPL','TN.19',NULL,'33953','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2471915,'TN','Bou Arkoub','Bou Arkoub','37','10.5509','P','PPL','TN.19',NULL,'10024','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2472261,'TN','Bou Arada','Bou Arada','36','9.62175','P','PPL','TN.22',NULL,'12158','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2472380,'TN','Bir el Hafey','Bir el Hafey','35','9.19321','P','PPL','TN.33',NULL,'5016','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2472431,'TN','Ben Gardane','Ben Gardane','33','11.2197','P','PPL','TN.28',NULL,'13364','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2472479,'TN','Ben Arous','Ben Arous','37','10.2189','P','PPLA','TN.27',NULL,'74932','Africa/Tunis','1','2013-08-05 23:00:00','2013-08-05 23:00:00'),(2472701,'TN','Bizerte Sud','Bizerte Sud',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2472706,'TN','Bizerte','Bizerte','37','9.87391','P','PPLA','TN.18',NULL,'115268','Africa/Tunis','1','2016-12-14 23:00:00','2016-12-14 23:00:00'),(2472722,'TN','Beni Khiar','Beni Khiar','36','10.7822','P','PPL','TN.19',NULL,'18011','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2472724,'TN','Beni Khalled','Beni Khalled','37','10.59','P','PPL','TN.19',NULL,'11300','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2472732,'TN','Beni Hassane','Beni Hassane','36','10.8087','P','PPL','TN.16',NULL,'8139','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2472744,'TN','Banbalah','Banbalah','36','10.8','P','PPL','TN.16',NULL,'12367','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2472772,'TN','Béja Nord','Beja Nord',NULL,NULL,NULL,NULL,'TN.17',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2472774,'TN','Béja','Beja','37','9.18169','P','PPLA','TN.17',NULL,'57233','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2472833,'TN','Zouila','Zouila','36','11.0606','P','PPLX','TN.15',NULL,'44349','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473161,'TN','Skhira','Skhira','34','10.07','P','PPL','TN.32',NULL,'9211','Africa/Tunis','1','2016-10-07 23:00:00','2016-10-07 23:00:00'),(2473163,'TN','Sbikha','Sbikha','36','10.0208','P','PPL','TN.03',NULL,'7062','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473169,'TN','Seïada','Seiada','36','10.8925','P','PPL','TN.16',NULL,'13718','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473177,'TN','As Sars','As Sars','36','9.02117','P','PPL','TN.14',NULL,'10979','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2473183,'TN','As Sanad','As Sanad','34','9.26404','P','PPL','TN.30',NULL,'7859','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473190,'TN','Sahline','Sahline','36','10.7111','P','PPL','TN.16',NULL,'13806','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473229,'TN','Chebba','Chebba','35','11.115','P','PPL','TN.15',NULL,'21559','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473247,'TN','Ariana','Ariana','37','10.1934','P','PPLA','TN.38',NULL,'97687','Africa/Tunis','1','2013-08-05 23:00:00','2013-08-05 23:00:00'),(2473257,'TN','Ar Rudayyif','Ar Rudayyif','34','8.15549','P','PPL','TN.30',NULL,'30048','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473258,'TN','Er Regueb','Er Regueb','35','9.78654','P','PPL','TN.33',NULL,'6702','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473418,'TN','Oueslatia','Oueslatia',NULL,NULL,NULL,NULL,'TN.03',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2473420,'TN','Ouardenine','Ouardenine','36','10.674','P','PPL','TN.16',NULL,'18287','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473439,'TN','El Ksour','El Ksour','36','8.88493','P','PPL','TN.14',NULL,'5034','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473449,'TN','Kairouan','Kairouan','36','10.0963','P','PPLA','TN.03',NULL,'119794','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2473450,'TN','Kairouan Sud','Kairouan Sud',NULL,NULL,NULL,NULL,'TN.03',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2473457,'TN','Kasserine','Kasserine','35','8.83651','P','PPLA','TN.02',NULL,'81987','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2473459,'TN','Kasserine Sud','Kasserine Sud',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2473470,'TN','Gremda','Gremda','35','10.7833','P','PPL','TN.32',NULL,'33744','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473486,'TN','El Golaa','El Golaa','33','9.00678','P','PPL','TN.31',NULL,'7189','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473493,'TN','Monastir','Monastir','36','10.8262','P','PPLA','TN.16',NULL,'71546','Africa/Tunis','1','2012-05-15 23:00:00','2012-05-15 23:00:00'),(2473499,'TN','La Mohammedia','La Mohammedia','37','10.1563','P','PPL','TN.36',NULL,'66593','Africa/Tunis','1','2016-09-07 23:00:00','2016-09-07 23:00:00'),(2473517,'TN','Metlaoui','Metlaoui','34','8.40157','P','PPL','TN.30',NULL,'41899','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473525,'TN','Mezzouna','Mezzouna','35','9.84193','P','PPL','TN.33',NULL,'5564','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473532,'TN','Metouia','Metouia',NULL,NULL,NULL,NULL,'TN.29',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2473533,'TN','Al Matlīn','Al Matlin','37','10.05','P','PPL','TN.18',NULL,'7370','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2473540,'TN','Al Marsá','Al Marsa','37','10.3247','P','PPL','TN.36',NULL,'65640','Africa/Tunis','1','2010-08-02 23:00:00','2010-08-02 23:00:00'),(2473558,'TN','El Maamoura','El Maamoura','36','10.8061','P','PPL','TN.19',NULL,'6969','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2473571,'TN','Mu‘tamadīyat al Maḩras','Mu`tamadiyat al Mahras',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2473572,'TN','Mahdia','Mahdia','36','11.0622','P','PPLA','TN.15',NULL,'45977','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2473628,'TN','Le Krib','Le Krib','36','9.13613','P','PPL','TN.22',NULL,'7691','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473634,'TN','El Kef','El Kef','36','8.70486','P','PPLA','TN.14',NULL,'47979','Africa/Tunis','1','2014-03-07 23:00:00','2014-03-07 23:00:00'),(2473636,'TN','Kef Est','Kef Est',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2473654,'TN','El Jem','El Jem','35','10.7167','P','PPL','TN.15',NULL,'20029','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473663,'TN','Nefza','Nefza',NULL,NULL,NULL,NULL,'TN.17',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(2473716,'TN','El Haouaria','El Haouaria','37','11.0144','P','PPL','TN.19',NULL,'9273','Africa/Tunis','1','2013-08-03 23:00:00','2013-08-03 23:00:00'),(2473744,'TN','Hammamet','Hammamet','36','10.6167','P','PPL','TN.19',NULL,'53733','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473747,'TN','El Hamma','El Hamma','34','9.79629','P','PPL','TN.29',NULL,'62000','Africa/Tunis','1','2014-11-28 23:00:00','2014-11-28 23:00:00'),(2473823,'TN','El Battan','El Battan','37','9.84424','P','PPL','TN.39',NULL,'6047','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2473826,'TN','Bekalta','Bekalta','36','10.9947','P','PPL','TN.16',NULL,'15937','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473876,'TN','El Alia','El Alia','37','10.0348','P','PPL','TN.18',NULL,'16083','Africa/Tunis','1','2015-09-05 23:00:00','2015-09-05 23:00:00'),(2473913,'TN','Akouda','Akouda','36','10.5653','P','PPL','TN.23',NULL,'20027','Africa/Tunis','1','2012-01-17 23:00:00','2012-01-17 23:00:00'),(2581754,'TN','Douane','Douane','36','10.7557','P','PPL','TN.19',NULL,'60192','Africa/Tunis','1','2011-02-07 23:00:00','2011-02-07 23:00:00'),(6355180,'TN','Port el Kantaoui','Port el Kantaoui','36','10.5943','P','PPL','TN.23',NULL,'6000','Africa/Tunis','1','2016-10-07 23:00:00','2016-10-07 23:00:00'),(7870271,'TN','Balta Bou Aouane','Balta Bou Aouane',NULL,NULL,NULL,NULL,'TN.06',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870272,'TN','Bou Salem','Bou Salem',NULL,NULL,NULL,NULL,'TN.06',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870274,'TN','Oued Meliz','Oued Meliz',NULL,NULL,NULL,NULL,'TN.06',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870275,'TN','Beni Khedeche','Beni Khedeche',NULL,NULL,NULL,NULL,'TN.28',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870276,'TN','Medenine Nord','Medenine Nord',NULL,NULL,NULL,NULL,'TN.28',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870277,'TN','Medenine Sud','Medenine Sud',NULL,NULL,NULL,NULL,'TN.28',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870278,'TN','Sidi Makhlouf','Sidi Makhlouf',NULL,NULL,NULL,NULL,'TN.28',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870280,'TN','Ben Guerdane','Ben Guerdane',NULL,NULL,NULL,NULL,'TN.28',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870283,'TN','Djedliane','Djedliane',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870284,'TN','Ayoun','Ayoun',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870300,'TN','Hidra','Hidra',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870307,'TN','Foussana','Foussana',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870318,'TN','Oudhna','Oudhna',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870548,'TN','Sijoumi','Sijoumi',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870549,'TN','Sidi Hassine','Sidi Hassine',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870578,'TN','Nadhour','Nadhour',NULL,NULL,NULL,NULL,'TN.37',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870601,'TN','Sejnane','Sejnane',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870602,'TN','Joumine','Joumine',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870603,'TN','Ghazala','Ghazala',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870604,'TN','Nefza','Nefza',NULL,NULL,NULL,NULL,'TN.17',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870605,'TN','Beja Sud','Beja Sud',NULL,NULL,NULL,NULL,'TN.17',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870606,'TN','Goubellat','Goubellat',NULL,NULL,NULL,NULL,'TN.17',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870609,'TN','Fernana','Fernana',NULL,NULL,NULL,NULL,'TN.06',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870612,'TN','Kef Quest','Kef Quest',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870615,'TN','Kef Est','Kef Est',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870616,'TN','Es Sers','Es Sers',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870617,'TN','Nebeur','Nebeur',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870618,'TN','Elkrib','Elkrib',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870619,'TN','Bourouis','Bourouis',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870620,'TN','Siliana Nord','Siliana Nord',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7870645,'TN','Raoued','Raoued',NULL,NULL,NULL,NULL,'TN.38',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(7911270,'TN','Jerba Ajim','Jerba Ajim',NULL,NULL,NULL,NULL,'TN.28',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(9072611,'TN','Ksar District','Ksar District',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31101910,'TN','Menzel Habib','Menzel Habib',NULL,NULL,NULL,NULL,'TN.29',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104807,'TN','Hammam El Guezaz','Hammam El Guezaz',NULL,NULL,NULL,NULL,'TN.19',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104809,'TN','El Mida','El Mida',NULL,NULL,NULL,NULL,'TN.19',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104810,'TN','Menzel Bouzelfa','Menzel Bouzelfa',NULL,NULL,NULL,NULL,'TN.19',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104811,'TN','Bou Argoub','Bou Argoub',NULL,NULL,NULL,NULL,'TN.19',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104812,'TN','Dar Chaabane El Fehri','Dar Chaabane El Fehri',NULL,NULL,NULL,NULL,'TN.19',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104932,'TN','Bouficha','Bouficha',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104936,'TN','Hergla','Hergla',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104938,'TN','Kondar','Kondar',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104939,'TN','Sidi El Hani','Sidi El Hani',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104941,'TN','Kalaa Sghira','Kalaa Sghira',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104943,'TN','Sousse Jawhara','Sousse Jawhara',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104944,'TN','Sousse Sidi Abdelhamid','Sousse Sidi Abdelhamid',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104945,'TN','Sousse Riadh','Sousse Riadh',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104948,'TN','Zaouia-Ksiba-Thrayet','Zaouia-Ksiba-Thrayet',NULL,NULL,NULL,NULL,'TN.23',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104955,'TN','Téboulba','Teboulba',NULL,NULL,NULL,NULL,'TN.16',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104956,'TN','Sayada Lamta Bouhjar','Sayada Lamta Bouhjar',NULL,NULL,NULL,NULL,'TN.16',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104958,'TN','Sfax Ouest','Sfax Ouest',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104959,'TN','Thyna','Thyna',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104960,'TN','Sfax Sud','Sfax Sud',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104961,'TN','Sakiet Ezzit','Sakiet Ezzit',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104962,'TN','Sakiet Eddaier','Sakiet Eddaier',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104963,'TN','Ksar Helal','Ksar Helal',NULL,NULL,NULL,NULL,'TN.16',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104965,'TN','Ouerdanine','Ouerdanine',NULL,NULL,NULL,NULL,'TN.16',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104966,'TN','Bembla','Bembla',NULL,NULL,NULL,NULL,'TN.16',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104967,'TN','Zeramdine','Zeramdine',NULL,NULL,NULL,NULL,'TN.16',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104968,'TN','Beni Hassen','Beni Hassen',NULL,NULL,NULL,NULL,'TN.16',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104978,'TN','Ouled Chamekh','Ouled Chamekh',NULL,NULL,NULL,NULL,'TN.15',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104979,'TN','Bou Merdès','Bou Merdes',NULL,NULL,NULL,NULL,'TN.15',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31104980,'TN','Hbira','Hbira',NULL,NULL,NULL,NULL,'TN.15',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105072,'TN','Melloulech','Melloulech',NULL,NULL,NULL,NULL,'TN.15',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105076,'TN','El Amra','El Amra',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105077,'TN','El Hencha','El Hencha',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105078,'TN','Agareb','Agareb',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105079,'TN','Ghraiba','Ghraiba',NULL,NULL,NULL,NULL,'TN.32',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105081,'TN','Dekhilet Toujane','Dekhilet Toujane',NULL,NULL,NULL,NULL,'TN.29',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105082,'TN','Nouvelle Matmata','Nouvelle Matmata',NULL,NULL,NULL,NULL,'TN.29',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105083,'TN','Ghannouch','Ghannouch',NULL,NULL,NULL,NULL,'TN.29',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105087,'TN','Smar','Smar',NULL,NULL,NULL,NULL,'TN.34',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105088,'TN','Bir Lahmar','Bir Lahmar',NULL,NULL,NULL,NULL,'TN.34',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105089,'TN','Tataouine Sud','Tataouine Sud',NULL,NULL,NULL,NULL,'TN.34',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105090,'TN','Dhehiba','Dhehiba',NULL,NULL,NULL,NULL,'TN.34',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105091,'TN','Kébili Nord','Kebili Nord',NULL,NULL,NULL,NULL,'TN.31',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31105092,'TN','Rejim Maatoug','Rejim Maatoug',NULL,NULL,NULL,NULL,'TN.31',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106372,'TN','El Faouar','El Faouar',NULL,NULL,NULL,NULL,'TN.31',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106373,'TN','Souk Lahad','Souk Lahad',NULL,NULL,NULL,NULL,'TN.31',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106374,'TN','Douz Sud','Douz Sud',NULL,NULL,NULL,NULL,'TN.31',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106375,'TN','Hazoua','Hazoua',NULL,NULL,NULL,NULL,'TN.35',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106377,'TN','Tamaghza','Tamaghza',NULL,NULL,NULL,NULL,'TN.35',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106593,'TN','Mdhila','Mdhila',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106594,'TN','Om El Araïes','Om El Araies',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106651,'TN','El Ksar','El Ksar',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106652,'TN','Belkhir','Belkhir',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106653,'TN','Sned','Sned',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106656,'TN','Gafsa Nord','Gafsa Nord',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106657,'TN','Sidi Aïch','Sidi Aich',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106662,'TN','Menzel Bouzaiene','Menzel Bouzaiene',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106663,'TN','Sidi Ali Ben Aoun','Sidi Ali Ben Aoun',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106665,'TN','Souk Jedid','Souk Jedid',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106666,'TN','Ouled Haffouz','Ouled Haffouz',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106667,'TN','Sidi Bouzid Est','Sidi Bouzid Est',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106668,'TN','Jelma','Jelma',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106669,'TN','Cebalet Ouled Asker','Cebalet Ouled Asker',NULL,NULL,NULL,NULL,'TN.33',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106670,'TN','Ezzouhour','Ezzouhour',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106671,'TN','Kasserine Nord','Kasserine Nord',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106672,'TN','Mejel Bel Abbès','Mejel Bel Abbes',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106673,'TN','Hassi El Ferid','Hassi El Ferid',NULL,NULL,NULL,NULL,'TN.02',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106862,'TN','El Ala','El Ala',NULL,NULL,NULL,NULL,'TN.03',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106863,'TN','Kairouan Nord','Kairouan Nord',NULL,NULL,NULL,NULL,'TN.03',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106864,'TN','Cherarda','Cherarda',NULL,NULL,NULL,NULL,'TN.03',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31106865,'TN','Chebika','Chebika',NULL,NULL,NULL,NULL,'TN.03',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107060,'TN','Dahmani','Dahmani',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107061,'TN','Jerissa','Jerissa',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107062,'TN','Kalaa Khasba','Kalaa Khasba',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107173,'TN','Kalaat Senan','Kalaat Senan',NULL,NULL,NULL,NULL,'TN.14',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107575,'TN','El Aroussa','El Aroussa',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107576,'TN','Bargou','Bargou',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107577,'TN','Kesra','Kesra',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31107578,'TN','Rouhia','Rouhia',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108351,'TN','Tibar','Tibar',NULL,NULL,NULL,NULL,'TN.17',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108352,'TN','Bir Mcherga','Bir Mcherga',NULL,NULL,NULL,NULL,'TN.37',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108353,'TN','Zriba','Zriba',NULL,NULL,NULL,NULL,'TN.37',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108354,'TN','Saouaf','Saouaf',NULL,NULL,NULL,NULL,'TN.37',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108355,'TN','Tinja','Tinja',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108356,'TN','Utique','Utique',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108357,'TN','Bizerte Nord','Bizerte Nord',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108358,'TN','Zarzouna','Zarzouna',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108361,'TN','Ghar El Melh','Ghar El Melh',NULL,NULL,NULL,NULL,'TN.18',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108937,'TN','Borj El Amri','Borj El Amri',NULL,NULL,NULL,NULL,'TN.39',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108943,'TN','Mornaguia','Mornaguia',NULL,NULL,NULL,NULL,'TN.39',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108956,'TN','Douar Hicher','Douar Hicher',NULL,NULL,NULL,NULL,'TN.39',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108957,'TN','Oued Ellil','Oued Ellil',NULL,NULL,NULL,NULL,'TN.39',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31108958,'TN','Jedaïda','Jedaida',NULL,NULL,NULL,NULL,'TN.39',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109010,'TN','Mornag','Mornag',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109011,'TN','Hammam Chatt','Hammam Chatt',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109013,'TN','Ezzahra','Ezzahra',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109014,'TN','Mohamedia','Mohamedia',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109015,'TN','Fouchana','Fouchana',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109016,'TN','El Mourouj','El Mourouj',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109017,'TN','la Nouvelle Médina','la Nouvelle Medina',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109018,'TN','Mégrine','Megrine',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109019,'TN','Bou Mhel El Bassatine','Bou Mhel El Bassatine',NULL,NULL,NULL,NULL,'TN.27',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109021,'TN','Soukra','Soukra',NULL,NULL,NULL,NULL,'TN.38',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109022,'TN','Cité Ettadhamen','Cite Ettadhamen',NULL,NULL,NULL,NULL,'TN.38',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109023,'TN','El Mnihla','El Mnihla',NULL,NULL,NULL,NULL,'TN.38',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109024,'TN','Sidi Thabet','Sidi Thabet',NULL,NULL,NULL,NULL,'TN.38',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109078,'TN','Kalaat El Andalous','Kalaat El Andalous',NULL,NULL,NULL,NULL,'TN.38',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109157,'TN','El Hrairia','El Hrairia',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109158,'TN','El Kabaria','El Kabaria',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109159,'TN','Jebel Jelloud','Jebel Jelloud',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109164,'TN','El Ouardia','El Ouardia',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109165,'TN','Sidi El Béchir','Sidi El Bechir',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109166,'TN','Bab Souika','Bab Souika',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109167,'TN','Ezzouhour','Ezzouhour',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109168,'TN','Bardo','Bardo',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109170,'TN','Ettahrir','Ettahrir',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109171,'TN','El Omrane Supérieur','El Omrane Superieur',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109172,'TN','El Omrane','El Omrane',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109174,'TN','El Menzah','El Menzah',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109175,'TN','Bab El Bhar','Bab El Bhar',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109176,'TN','Cité El Khadra','Cite El Khadra',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109178,'TN','Le Kram','Le Kram',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31109180,'TN','La Marsa','La Marsa',NULL,NULL,NULL,NULL,'TN.36',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31128523,'TN','Gabès Ouest','Gabes Ouest',NULL,NULL,NULL,NULL,'TN.29',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31128524,'TN','Gabès Sud','Gabes Sud',NULL,NULL,NULL,NULL,'TN.29',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31154520,'TN','Gaafour','Gaafour',NULL,NULL,NULL,NULL,'TN.22',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31204905,'TN','Gafsa Sud','Gafsa Sud',NULL,NULL,NULL,NULL,'TN.30',NULL,NULL,'Africa/Tunis','1',NULL,NULL),(31204906,'TN','Zahrouni','Zahrouni',NULL,NULL,'P','PPL','TN.36',NULL,'15922','Africa/Tunis','1','2010-07-09 23:00:00','2010-07-09 23:00:00'),(31204907,'TN','El Manar','El Manar',NULL,NULL,'P','PPL','TN.36',NULL,'15922','Africa/Tunis','1','2010-07-09 23:00:00','2010-07-09 23:00:00'),(31204908,'TN','Sidi Daoud','Sidi Daoud',NULL,NULL,'P','PPL','TN.19',NULL,'15922','Africa/Tunis','1','2010-07-09 23:00:00','2010-07-09 23:00:00');
/*!40000 ALTER TABLE `localisations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
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
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2020-03-04 19:48:25','2020-03-04 19:48:25','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,4,'2020-03-04 19:48:25','2020-05-13 15:08:29','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2020-03-04 19:48:25','2020-03-04 19:48:25','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2020-03-04 19:48:25','2020-03-04 19:48:25','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,6,'2020-03-04 19:48:26','2020-05-13 15:08:29',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,1,'2020-03-04 19:48:26','2020-05-13 15:08:29','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,2,'2020-03-04 19:48:26','2020-05-13 15:08:29','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,3,'2020-03-04 19:48:26','2020-05-13 15:08:29','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,4,'2020-03-04 19:48:26','2020-05-13 15:08:30','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,7,'2020-03-04 19:48:26','2020-05-13 15:08:30','voyager.settings.index',NULL),(11,1,'Categories','','_self','voyager-categories',NULL,NULL,5,'2020-03-04 19:48:31','2020-05-13 15:08:29','voyager.categories.index',NULL),(13,1,'Hooks','','_self','voyager-hook',NULL,5,5,'2020-03-04 19:51:57','2020-05-13 15:08:30','voyager.hooks',NULL),(14,1,'Localisations','','_self',NULL,NULL,NULL,8,'2020-05-13 14:58:36','2020-05-13 15:08:30','voyager.localisations.index',NULL),(15,1,'Posts','','_self',NULL,NULL,NULL,9,'2020-05-13 15:00:23','2020-05-13 15:08:30','voyager.posts.index',NULL),(16,1,'Post Images','','_self',NULL,NULL,NULL,10,'2020-05-13 15:02:35','2020-05-13 15:08:30','voyager.post-images.index',NULL),(17,1,'Post Comments','','_self',NULL,NULL,NULL,11,'2020-05-13 15:04:37','2020-05-13 15:08:30','voyager.post-comments.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2020-03-04 19:48:25','2020-03-04 19:48:25');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_01_01_000000_create_pages_table',1),(6,'2016_01_01_000000_create_posts_table',1),(7,'2016_02_15_204651_create_categories_table',1),(8,'2016_05_19_173453_create_menu_table',1),(9,'2016_10_21_190000_create_roles_table',1),(10,'2016_10_21_190000_create_settings_table',1),(11,'2016_11_30_135954_create_permission_table',1),(12,'2016_11_30_141208_create_permission_role_table',1),(13,'2016_12_26_201236_data_types__add__server_side',1),(14,'2017_01_13_000000_add_route_to_menu_items_table',1),(15,'2017_01_14_005015_create_translations_table',1),(16,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(17,'2017_03_06_000000_add_controller_to_data_types_table',1),(18,'2017_04_11_000000_alter_post_nullable_fields_table',1),(19,'2017_04_21_000000_add_order_to_data_rows_table',1),(20,'2017_07_05_210000_add_policyname_to_data_types_table',1),(21,'2017_08_05_000000_add_group_to_settings_table',1),(22,'2017_11_26_013050_add_user_role_relationship',1),(23,'2017_11_26_015000_create_user_roles_table',1),(24,'2018_03_11_000000_add_user_settings',1),(25,'2018_03_14_000000_add_details_to_data_types_table',1),(26,'2018_03_16_000000_make_settings_value_nullable',1),(27,'2017_05_20_131345_update_users_table',2),(28,'2017_05_20_131839_create_user_direct_messages',2),(29,'2017_05_20_132515_create_user_following_table',2),(30,'2017_05_20_133038_create_countries',2),(31,'2017_05_20_133151_create_cities_table',2),(32,'2017_05_20_133406_create_hobbies_table',2),(33,'2017_05_20_133512_create_groups_table',2),(34,'2017_05_20_133707_create_user_hobbies_table',2),(35,'2017_05_20_133850_create_user_locations_table',2),(36,'2017_05_20_202256_update_users_table_2',2),(37,'2017_06_03_143218_update_users_table_3',2),(38,'2017_06_03_185756_update_user_locations_table',2),(39,'2017_06_06_182742_create_user_relationship_table',2),(40,'2017_06_08_181805_update_seen_tables',2),(41,'2018_02_07_113522_add_sign_in_at_to_users',2),(42,'2018_04_07_120024_create_communities_table',2),(43,'2018_04_13_145941_community_user',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2020-03-04 19:48:26','2020-03-04 19:48:26'),(2,'browse_bread',NULL,'2020-03-04 19:48:26','2020-03-04 19:48:26'),(3,'browse_database',NULL,'2020-03-04 19:48:26','2020-03-04 19:48:26'),(4,'browse_media',NULL,'2020-03-04 19:48:26','2020-03-04 19:48:26'),(5,'browse_compass',NULL,'2020-03-04 19:48:27','2020-03-04 19:48:27'),(6,'browse_menus','menus','2020-03-04 19:48:27','2020-03-04 19:48:27'),(7,'read_menus','menus','2020-03-04 19:48:27','2020-03-04 19:48:27'),(8,'edit_menus','menus','2020-03-04 19:48:27','2020-03-04 19:48:27'),(9,'add_menus','menus','2020-03-04 19:48:27','2020-03-04 19:48:27'),(10,'delete_menus','menus','2020-03-04 19:48:27','2020-03-04 19:48:27'),(11,'browse_roles','roles','2020-03-04 19:48:27','2020-03-04 19:48:27'),(12,'read_roles','roles','2020-03-04 19:48:27','2020-03-04 19:48:27'),(13,'edit_roles','roles','2020-03-04 19:48:27','2020-03-04 19:48:27'),(14,'add_roles','roles','2020-03-04 19:48:27','2020-03-04 19:48:27'),(15,'delete_roles','roles','2020-03-04 19:48:27','2020-03-04 19:48:27'),(16,'browse_users','users','2020-03-04 19:48:28','2020-03-04 19:48:28'),(17,'read_users','users','2020-03-04 19:48:28','2020-03-04 19:48:28'),(18,'edit_users','users','2020-03-04 19:48:28','2020-03-04 19:48:28'),(19,'add_users','users','2020-03-04 19:48:28','2020-03-04 19:48:28'),(20,'delete_users','users','2020-03-04 19:48:28','2020-03-04 19:48:28'),(21,'browse_settings','settings','2020-03-04 19:48:28','2020-03-04 19:48:28'),(22,'read_settings','settings','2020-03-04 19:48:28','2020-03-04 19:48:28'),(23,'edit_settings','settings','2020-03-04 19:48:28','2020-03-04 19:48:28'),(24,'add_settings','settings','2020-03-04 19:48:28','2020-03-04 19:48:28'),(25,'delete_settings','settings','2020-03-04 19:48:28','2020-03-04 19:48:28'),(26,'browse_categories','categories','2020-03-04 19:48:31','2020-03-04 19:48:31'),(27,'read_categories','categories','2020-03-04 19:48:31','2020-03-04 19:48:31'),(28,'edit_categories','categories','2020-03-04 19:48:31','2020-03-04 19:48:31'),(29,'add_categories','categories','2020-03-04 19:48:31','2020-03-04 19:48:31'),(30,'delete_categories','categories','2020-03-04 19:48:31','2020-03-04 19:48:31'),(36,'browse_hooks',NULL,'2020-03-04 19:51:57','2020-03-04 19:51:57'),(37,'browse_localisations','localisations','2020-05-13 14:58:35','2020-05-13 14:58:35'),(38,'read_localisations','localisations','2020-05-13 14:58:35','2020-05-13 14:58:35'),(39,'edit_localisations','localisations','2020-05-13 14:58:35','2020-05-13 14:58:35'),(40,'add_localisations','localisations','2020-05-13 14:58:35','2020-05-13 14:58:35'),(41,'delete_localisations','localisations','2020-05-13 14:58:35','2020-05-13 14:58:35'),(42,'browse_posts','posts','2020-05-13 15:00:23','2020-05-13 15:00:23'),(43,'read_posts','posts','2020-05-13 15:00:23','2020-05-13 15:00:23'),(44,'edit_posts','posts','2020-05-13 15:00:23','2020-05-13 15:00:23'),(45,'add_posts','posts','2020-05-13 15:00:23','2020-05-13 15:00:23'),(46,'delete_posts','posts','2020-05-13 15:00:23','2020-05-13 15:00:23'),(47,'browse_post_images','post_images','2020-05-13 15:02:35','2020-05-13 15:02:35'),(48,'read_post_images','post_images','2020-05-13 15:02:35','2020-05-13 15:02:35'),(49,'edit_post_images','post_images','2020-05-13 15:02:35','2020-05-13 15:02:35'),(50,'add_post_images','post_images','2020-05-13 15:02:35','2020-05-13 15:02:35'),(51,'delete_post_images','post_images','2020-05-13 15:02:35','2020-05-13 15:02:35'),(52,'browse_post_comments','post_comments','2020-05-13 15:04:37','2020-05-13 15:04:37'),(53,'read_post_comments','post_comments','2020-05-13 15:04:37','2020-05-13 15:04:37'),(54,'edit_post_comments','post_comments','2020-05-13 15:04:37','2020-05-13 15:04:37'),(55,'add_post_comments','post_comments','2020-05-13 15:04:37','2020-05-13 15:04:37'),(56,'delete_post_comments','post_comments','2020-05-13 15:04:37','2020-05-13 15:04:37');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `comment_user_id` int(10) unsigned NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  KEY `post_comments_comment_user_id_foreign` (`comment_user_id`),
  CONSTRAINT `post_comments_comment_user_id_foreign` FOREIGN KEY (`comment_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comments`
--

LOCK TABLES `post_comments` WRITE;
/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */;
INSERT INTO `post_comments` VALUES (5,38,1,'khjbj','2020-03-04 22:12:26','2020-03-04 22:12:26',0),(6,42,2,'jlhk','2020-03-04 22:42:03','2020-03-04 22:42:03',0),(7,42,2,'mnin nji','2020-03-05 10:24:44','2020-03-05 10:24:44',0),(8,42,2,'5km mamouraa','2020-03-05 10:24:54','2020-03-05 10:24:54',0),(16,48,3,'rg','2020-03-05 15:25:05','2020-03-05 15:26:03',1),(19,55,3,'nice','2020-03-05 20:20:30','2020-03-05 20:20:30',0);
/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_images`
--

DROP TABLE IF EXISTS `post_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_images_post_id_foreign` (`post_id`),
  CONSTRAINT `post_images_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_images`
--

LOCK TABLES `post_images` WRITE;
/*!40000 ALTER TABLE `post_images` DISABLE KEYS */;
INSERT INTO `post_images` VALUES (4,35,'4e23aa24c6f7080443240cda2d332c2d.jpg'),(5,37,'6aa4af047e1fc3ae6dc0b6e8c8e86830.JPG'),(6,39,'25920f6c8eaa0534ec767b6955e3a3a7.jpg'),(7,41,'d7cf118893713ec7e4626cc38e72c8d6.JPG'),(8,42,'c785dfb7b59a16fc672dbdfa32a9bc4a.JPG'),(10,51,'f675470ea71e968df9b7f11f85935ea3.JPG'),(11,53,'a798218279fdc5797e6b0996da688b92.JPG'),(12,54,'dacd8d12140bc866540d972426857159.jpg'),(13,55,'60c72ed388091ae621f256a22b7bcd8f.jpg'),(14,56,'dfaa76919d139b8de7ea45df15a50955.png'),(16,58,'d6d1b8069c302e266ae99ecd397adc3c.jpeg');
/*!40000 ALTER TABLE `post_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_likes` (
  `post_id` int(10) unsigned NOT NULL,
  `like_user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`,`like_user_id`),
  KEY `post_likes_like_user_id_foreign` (`like_user_id`),
  CONSTRAINT `post_likes_like_user_id_foreign` FOREIGN KEY (`like_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES (35,1,'2020-03-04 21:57:44','2020-03-04 21:57:44',0),(38,1,'2020-03-04 22:12:21','2020-03-04 22:12:21',0),(40,2,'2020-03-04 22:16:21','2020-03-04 22:16:21',0),(51,4,'2020-03-05 11:29:45','2020-03-05 11:29:45',0),(52,3,'2020-03-05 20:21:52','2020-03-05 20:21:52',0),(54,3,'2020-03-05 19:12:04','2020-03-05 19:12:04',0),(56,3,'2020-03-07 09:00:11','2020-03-07 09:00:58',1);
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `has_image` tinyint(1) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (35,NULL,1,0,1,'','.','2020-03-04 21:57:41','2020-03-04 21:57:41'),(37,NULL,1,0,1,'','.','2020-03-04 22:11:08','2020-03-04 22:11:08'),(38,NULL,1,0,0,'xxxxxxxxxxxxxxxn','.','2020-03-04 22:11:28','2020-03-04 22:11:28'),(39,NULL,2,0,1,'c v','.','2020-03-04 22:12:50','2020-03-04 22:12:50'),(40,NULL,2,0,0,'szsz','.','2020-03-04 22:16:18','2020-03-04 22:16:18'),(41,NULL,2,0,1,'kjl','.','2020-03-04 22:33:02','2020-03-04 22:33:02'),(42,NULL,2,0,1,'','.','2020-03-04 22:39:56','2020-03-04 22:39:56'),(44,NULL,2,0,0,'ss','.','2020-03-05 10:55:53','2020-03-05 10:55:53'),(45,NULL,2,0,0,'s','.','2020-03-05 10:56:07','2020-03-05 10:56:07'),(46,NULL,2,0,0,'ss','.','2020-03-05 10:56:20','2020-03-05 10:56:20'),(47,NULL,2,0,0,'aa','.','2020-03-05 10:56:32','2020-03-05 10:56:32'),(48,NULL,2,0,0,'sd','.','2020-03-05 10:59:24','2020-03-05 10:59:24'),(49,NULL,2,0,0,'q','.','2020-03-05 10:59:43','2020-03-05 10:59:43'),(51,NULL,4,0,1,'ss','.','2020-03-05 11:29:40','2020-03-05 11:29:40'),(52,NULL,4,0,0,'dfdf','.','2020-03-05 11:30:26','2020-03-05 11:30:26'),(53,NULL,2,0,1,'sd','.','2020-03-05 15:28:58','2020-03-05 15:28:58'),(54,NULL,3,0,1,'test','.','2020-03-05 17:36:41','2020-03-05 17:36:41'),(55,NULL,3,0,1,'camping','.','2020-03-05 20:16:32','2020-03-05 20:16:32'),(56,NULL,3,0,1,'root','.','2020-03-06 11:37:47','2020-03-06 11:37:47'),(58,NULL,8,0,1,'test post','.','2020-03-20 21:16:22','2020-03-20 21:16:22');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2020-03-04 19:48:26','2020-03-04 19:48:26'),(2,'user','Normal User','2020-03-04 19:48:26','2020-03-04 19:48:26');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID','','','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Voyager','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)','','','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_direct_messages`
--

DROP TABLE IF EXISTS `user_direct_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_direct_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_user_id` int(10) unsigned NOT NULL,
  `receiver_user_id` int(10) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `sender_delete` tinyint(1) NOT NULL DEFAULT '0',
  `receiver_delete` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_direct_messages_sender_user_id_foreign` (`sender_user_id`),
  KEY `user_direct_messages_receiver_user_id_foreign` (`receiver_user_id`),
  CONSTRAINT `user_direct_messages_receiver_user_id_foreign` FOREIGN KEY (`receiver_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_direct_messages_sender_user_id_foreign` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_direct_messages`
--

LOCK TABLES `user_direct_messages` WRITE;
/*!40000 ALTER TABLE `user_direct_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_direct_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_following`
--

DROP TABLE IF EXISTS `user_following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_following` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `following_user_id` int(10) unsigned NOT NULL,
  `follower_user_id` int(10) unsigned NOT NULL,
  `allow` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_following_following_user_id_foreign` (`following_user_id`),
  KEY `user_following_follower_user_id_foreign` (`follower_user_id`),
  CONSTRAINT `user_following_follower_user_id_foreign` FOREIGN KEY (`follower_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_following_following_user_id_foreign` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_following`
--

LOCK TABLES `user_following` WRITE;
/*!40000 ALTER TABLE `user_following` DISABLE KEYS */;
INSERT INTO `user_following` VALUES (1,1,3,1),(2,2,3,1),(3,2,1,1),(4,3,1,1),(5,5,2,0),(6,4,2,1),(7,4,3,0),(8,6,3,0),(9,5,3,0),(10,3,7,1),(14,7,3,0);
/*!40000 ALTER TABLE `user_following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hobbies`
--

DROP TABLE IF EXISTS `user_hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_hobbies` (
  `user_id` int(10) unsigned NOT NULL,
  `hobby_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`hobby_id`),
  KEY `user_hobbies_hobby_id_foreign` (`hobby_id`),
  CONSTRAINT `user_hobbies_hobby_id_foreign` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_hobbies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hobbies`
--

LOCK TABLES `user_hobbies` WRITE;
/*!40000 ALTER TABLE `user_hobbies` DISABLE KEYS */;
INSERT INTO `user_hobbies` VALUES (3,1),(3,2),(3,3),(3,4);
/*!40000 ALTER TABLE `user_hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_locations`
--

DROP TABLE IF EXISTS `user_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_locations` (
  `user_id` int(10) unsigned NOT NULL,
  `city_id` int(10) unsigned NOT NULL,
  `latitud` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitud` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`user_id`),
  KEY `user_locations_city_id_foreign` (`city_id`),
  CONSTRAINT `user_locations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `user_locations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_locations`
--

LOCK TABLES `user_locations` WRITE;
/*!40000 ALTER TABLE `user_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_relationship`
--

DROP TABLE IF EXISTS `user_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_relationship` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `related_user_id` int(10) unsigned NOT NULL,
  `main_user_id` int(10) unsigned NOT NULL,
  `relation_type` int(11) NOT NULL DEFAULT '0',
  `allow` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_relationship_related_user_id_foreign` (`related_user_id`),
  KEY `user_relationship_main_user_id_foreign` (`main_user_id`),
  CONSTRAINT `user_relationship_main_user_id_foreign` FOREIGN KEY (`main_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_relationship_related_user_id_foreign` FOREIGN KEY (`related_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_relationship`
--

LOCK TABLES `user_relationship` WRITE;
/*!40000 ALTER TABLE `user_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(140) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_sing_in_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com',NULL,'$2y$10$Q7daOSWbFZIDCVSqgh7gO.waqTgnNE9z4M07MFA7.1Hk.huKn/iVe','c2aycCONSqPvh7iAbdYnehMeJNQg68M84ONm5kFihyQKUfjaYvvo0qM9DEhC',NULL,'2020-03-04 19:48:32','2020-03-04 20:59:36',0,NULL,0,NULL,NULL,'0b17435a3394a8430ac5564536358435.jpg','adminn','abf7082886615e5df60af2125568cdde.jpg',NULL),(2,NULL,'test','test@gmail.com',NULL,'$2y$10$yV17YOzWRLVQXaK43nmgX.1u5sT3HiKujNiHnllhNbSXMwy0cqSv6',NULL,NULL,'2020-03-04 20:42:33','2020-03-04 22:40:12',0,NULL,0,NULL,NULL,'0c669566c5b47361b256d8675d8b5b9c.jpg','ssssssssss','4edefb2bc53459c833fcddc888a5ca73.JPG',NULL),(3,2,'demo','demodemo@gmail.com',NULL,'$2y$10$m/n7IRDdui48IZMQZoBM7.vQD2Q6ENRFumx3Ud6FVzy8AR.UDjwce','fpkJ8rki1KsDbmmuunavdmW9ZuWH5UC7ffpZGqFNABuEwp2Gk46xz0EWNdEG',NULL,'2020-03-04 20:51:07','2020-03-20 21:09:06',0,'1997-03-03',0,'28357935','GTA','406bdd84e98d80a60af440766a8370f1.jpg','demoooo','71a2098b1bbaf23a2b07a130292f94d3.JPG',NULL),(4,2,'ghazi','ghazi@gmail.com',NULL,'$2y$10$Hdp/PL7cv0OkldbiTaOnJuHMnzXWotMXCSqp8lk0Wzn3KdAhyVJFq',NULL,NULL,'2020-03-04 21:08:06','2020-03-05 12:21:02',0,'0000-00-00',0,'','sdsd',NULL,'sasa',NULL,NULL),(5,2,'gghazi','ghazigharssalla@gmail.com',NULL,'$2y$10$0JsGNw48iEW4s9sSEoVLn.OjLMFU.R2w4fQbUkWy.65qrh9oftKbO',NULL,NULL,'2020-03-04 22:20:42','2020-03-04 22:41:25',0,NULL,0,NULL,NULL,'5de935701d5c6c3a8feec7db835ae263.jpg','ddddddd','2e504784491403e936a0b6f1f10e9912.JPG',NULL),(6,2,'aaaaa','aaaa@gmail.com',NULL,'$2y$10$x13eTSzTvvqvIYD.wTergu0MgKoFvyGOrx7fpqfAeL/smjtrqZ.zS',NULL,NULL,'2020-03-05 12:30:23','2020-03-05 13:41:44',0,'2020-02-25',0,'283579355','555',NULL,'aaaa',NULL,NULL),(7,2,'campp','campp@gmail.com',NULL,'$2y$10$eyxyto6yew2iWqWCNMQW1edA3JGBgqUQefCtRtUDoy6NMF1q/6HhW',NULL,NULL,'2020-03-05 21:58:37','2020-03-05 22:15:35',0,NULL,0,NULL,NULL,NULL,'09865408',NULL,NULL),(8,2,'meher','meher@gmail.com',NULL,'$2y$10$WxXMqNS63Jt/AUiyyYy8vuXNMJknwHvD5rXuq0KHYIbeNncmvhkNW',NULL,NULL,'2020-03-20 21:15:30','2020-03-20 21:15:30',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-14  1:21:09
