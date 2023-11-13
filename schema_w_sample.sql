-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: peered-mysql-prod-0521.cluster-cyjao3pjfcvf.us-east-1.rds.amazonaws.com    Database: freshwriting_prod
-- ------------------------------------------------------
-- Server version	5.7.12

CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_prod` /*!40100 DEFAULT CHARACTER SET latin1 */;

CREATE USER 'db_prod_dba'@'%' IDENTIFIED BY 'db_password';
GRANT ALL PRIVILEGES ON db_prod.* TO 'db_prod_dba'@'%';
FLUSH PRIVILEGES;

USE `db_prod`;

--
-- Table structure for table `attached_files`
--

DROP TABLE IF EXISTS `attached_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attached_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_file_size` int(11) DEFAULT NULL,
  `file_updated_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `essay_id` int(11) DEFAULT NULL,
  `file_relationship` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attached_files_on_essay_id` (`essay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `body_id` int(11) DEFAULT NULL,
  `cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_awards_on_body_id` (`body_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (11,'mcpartlin-award','McPartlin Award',NULL,'2014-04-16 18:30:00','2014-04-16 18:30:00',211,NULL,NULL,NULL,NULL),(12,'snite-museum-of-art','Snite Museum of Art',NULL,'2014-04-16 18:30:00','2014-04-16 18:30:00',212,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `editors`
--

DROP TABLE IF EXISTS `editors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_editors_on_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editors`
--

LOCK TABLES `editors` WRITE;
/*!40000 ALTER TABLE `editors` DISABLE KEYS */;
INSERT INTO `editors` VALUES (3,'rfox2',1,'2014-04-02 18:34:12','2014-04-02 18:39:24'),(5,'edietelm',1,'2014-04-02 18:35:11','2014-04-02 18:39:24'),(10,'pclauss',0,'2014-04-29 00:37:06','2014-04-29 00:37:06'),(12,'awetheri',1,'2014-05-02 18:33:37','2014-05-02 18:33:37'),(13,'jduffy',0,'2014-05-30 11:30:08','2014-05-30 11:30:08'),(14,'dwolfe2',1,'2015-01-05 19:09:22','2015-01-05 19:09:22'),(15,'djohns27',1,'2017-06-02 15:02:27','2017-06-02 15:02:27'),(16,'jdavidhe',0,'2018-04-02 14:51:44','2018-04-02 14:51:44'),(17,'efitzpa1',0,'2018-09-16 19:38:19','2018-09-16 19:38:19'),(18,'nmaclaug',0,'2018-09-16 19:39:04','2018-09-16 19:39:04'),(19,'hanstra',0,'2019-07-22 15:19:40','2019-07-22 15:19:40'),(22,'jdean6',0,'2019-08-23 16:35:25','2019-08-23 16:35:25'),(23,'t_heslib01',0,'2019-08-23 17:23:26','2019-08-23 17:23:26'),(25,'jwant',0,'2020-08-26 14:17:02','2020-08-26 14:17:02'),(28,'pweikel',1,'2021-09-08 14:48:38','2021-09-08 14:48:38'),(29,'lmacgowa',0,'2022-04-19 12:16:25','2022-04-19 12:16:25'),(30,'nmyers3',0,'2022-05-10 11:57:07','2022-05-10 11:57:07');
/*!40000 ALTER TABLE `editors` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `error_logs`
--

DROP TABLE IF EXISTS `error_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `netid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `params` text COLLATE utf8_unicode_ci,
  `stack_trace` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `exception_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6044 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `essay_awards`
--

DROP TABLE IF EXISTS `essay_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essay_awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `essay_id` int(11) DEFAULT NULL,
  `award_id` int(11) DEFAULT NULL,
  `placement` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_essay_awards_on_essay_id` (`essay_id`),
  KEY `index_essay_awards_on_award_id` (`award_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay_awards`
--

LOCK TABLES `essay_awards` WRITE;
/*!40000 ALTER TABLE `essay_awards` DISABLE KEYS */;
INSERT INTO `essay_awards` VALUES (7,15,11,2),(8,16,11,1),(9,17,12,1),(10,20,12,2),(11,21,12,3),(12,22,11,3),(13,33,11,1),(14,34,11,2),(15,35,11,3),(16,47,12,2),(17,48,12,1),(18,49,12,3),(19,59,11,1),(20,60,11,2),(21,61,11,3),(22,77,12,2),(23,80,12,3),(24,76,12,1),(25,91,12,2),(26,93,12,3),(27,96,11,3),(28,102,11,1),(29,103,11,2),(30,100,12,1),(31,111,11,1),(32,134,12,1),(33,135,12,2),(34,136,12,3),(35,110,11,3),(36,112,11,2),(37,166,11,1),(38,167,11,2),(39,169,12,1),(40,170,12,2),(41,171,12,3),(42,168,11,3),(43,191,12,1),(44,192,11,3),(45,208,11,1),(46,193,11,2),(47,194,12,2),(48,195,12,3),(49,236,12,1),(50,240,12,3),(51,226,11,1),(52,215,11,2),(53,247,12,2),(54,248,11,3),(55,268,11,1),(56,259,11,2),(57,283,11,3),(58,274,12,1),(59,275,12,2);
/*!40000 ALTER TABLE `essay_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `essay_styles`
--

DROP TABLE IF EXISTS `essay_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essay_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  `body_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_essay_styles_on_slug` (`slug`),
  KEY `index_essay_styles_on_body_id` (`body_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `essay_styles`
--

LOCK TABLES `essay_styles` WRITE;
/*!40000 ALTER TABLE `essay_styles` DISABLE KEYS */;
INSERT INTO `essay_styles` VALUES (31,'narrative','Narrative','2014-04-16 18:29:55','2014-04-16 18:29:55',NULL,NULL,NULL,NULL,184),(32,'analysis','Analysis','2014-04-16 18:29:55','2014-04-16 18:29:55',NULL,NULL,NULL,NULL,185),(33,'research','Research','2014-04-16 18:29:56','2014-04-16 18:29:56',NULL,NULL,NULL,NULL,186),(34,'definition','Definition','2014-04-16 18:29:56','2014-04-16 18:29:56',NULL,NULL,NULL,NULL,187),(35,'rebuttal','Rebuttal','2014-04-16 18:29:56','2014-04-16 18:29:56',NULL,NULL,NULL,NULL,188),(36,'reflective','Reflective','2014-04-16 18:29:56','2014-04-16 18:29:56',NULL,NULL,NULL,NULL,189);
/*!40000 ALTER TABLE `essay_styles` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `essays`
--

DROP TABLE IF EXISTS `essays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `essays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `embed` text COLLATE utf8_unicode_ci,
  `alt_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `essay_style_id` int(11) DEFAULT NULL,
  `body_id` int(11) DEFAULT NULL,
  `alt_body_id` int(11) DEFAULT NULL,
  `author_biography_id` int(11) DEFAULT NULL,
  `works_cited_id` int(11) DEFAULT NULL,
  `discussion_questions_id` int(11) DEFAULT NULL,
  `instructor_resources_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_file_size` int(11) DEFAULT NULL,
  `cover_image_updated_at` datetime DEFAULT NULL,
  `cover_image_credit` text COLLATE utf8_unicode_ci,
  `cover_image_alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_image_file_size` int(11) DEFAULT NULL,
  `author_image_updated_at` datetime DEFAULT NULL,
  `published_medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `embed_id` int(11) DEFAULT NULL,
  `wowza_media_id` int(11) DEFAULT NULL,
  `thumbnail_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_image_file_size` bigint(20) DEFAULT NULL,
  `thumbnail_image_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_essays_on_slug` (`slug`),
  KEY `index_essays_on_issue_id` (`issue_id`),
  KEY `index_essays_on_essay_style_id` (`essay_style_id`),
  KEY `index_essays_on_body_id` (`body_id`),
  KEY `index_essays_on_alt_body_id` (`alt_body_id`),
  KEY `index_essays_on_author_biography_id` (`author_biography_id`),
  KEY `index_essays_on_works_cited_id` (`works_cited_id`),
  KEY `index_essays_on_discussion_questions_id` (`discussion_questions_id`),
  KEY `index_essays_on_instructor_resources_id` (`instructor_resources_id`),
  KEY `index_essays_on_embed_id` (`embed_id`),
  KEY `index_essays_on_wowza_media_id` (`wowza_media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `essays` WRITE;
/*!40000 ALTER TABLE `essays` DISABLE KEYS */;
INSERT INTO `essays` VALUES (3,33,'imperfect-contradictory-beauty','Imperfect, Contradictory Beauty','Nathan McDevitt',NULL,NULL,'2014-04-16 18:30:04','2014-05-27 02:57:11',32,215,NULL,216,291,NULL,217,1,'Common_Redpoll.jpg','image/jpeg',993124,'2014-05-18 14:32:20','','Image: Finch','McDevitt.jpg','image/jpeg',644188,'2014-05-18 14:26:13','text',NULL,NULL,NULL,NULL,NULL,NULL),(4,33,'invisiball-report','Invisiball: An Infomercial','Multiple Authors',NULL,'Transcript','2014-04-16 18:30:05','2014-07-01 12:05:19',32,218,220,221,NULL,299,NULL,1,'Screen_Shot_2014-04-28_at_9.20.17_PM.png','image/png',155977,'2014-04-29 01:21:02','Screen Capture, \"Invisiball Infomercial\"','Screen Capture ',NULL,NULL,NULL,NULL,'video',219,NULL,NULL,NULL,NULL,NULL),(5,33,'the-streets-are-art','The Streets Are Art','Rachel Zavakos',NULL,NULL,'2014-04-16 18:30:05','2014-04-25 18:19:39',33,222,NULL,225,223,224,NULL,1,'Grafitti.png','image/png',3126755,'2014-04-25 18:19:37','Gaido. The Graffiti Artists. 2008. Deviant Art. Photograph. 6 December 2013','','Rachel_Zavakos.jpg','image/jpeg',354280,'2014-04-25 16:01:20','text',NULL,NULL,NULL,NULL,NULL,NULL),(6,33,'monsoon-winds-of-culture','Monsoon: Winds of Culture','Jennifer Cha',NULL,NULL,'2014-04-16 18:30:05','2015-07-01 19:06:00',32,226,274,229,NULL,228,306,1,'placesettingnocopyright.jpg','image/jpeg',3069143,'2014-05-17 18:39:03','','Image: Table Setting','CHA.jpg','image/jpeg',392972,'2014-05-17 18:39:06','audio',227,361,NULL,NULL,NULL,NULL),(7,33,'easing-into-the-future-federal-reserve-policy-under-janet-yellen','Easing into the Future: Federal Reserve Policy under Janet Yellen','Emily Campagna',NULL,NULL,'2014-04-16 18:30:05','2014-04-28 21:02:48',33,230,258,233,231,232,NULL,1,'macroshotbill.jpg','image/jpeg',184080,'2014-04-25 18:22:11','','','Emily_Campagna.jpg','image/jpeg',331326,'2014-04-25 16:03:39','text',NULL,NULL,NULL,NULL,NULL,NULL),(8,33,'you-say-tomato-i-say-fruit','You Say Tomato, I Say Fruit','Katelyn Frierotte',NULL,NULL,'2014-04-17 20:11:24','2014-04-28 23:39:19',34,236,NULL,238,237,259,NULL,1,'Tomato_nocopyright.jpg','image/jpeg',540512,'2014-04-17 20:13:33','','Tomatoes','Frierott.jpeg','image/jpeg',152296,'2014-04-25 15:58:28','text',NULL,NULL,NULL,NULL,NULL,NULL),(283,48,'poverty-amongst-the-rich','Poverty Amongst the Rich','Dulce Daniella Pedraza Gonzalez',NULL,NULL,'2022-05-14 13:46:13','2022-05-24 19:15:52',33,1182,NULL,1184,1183,1201,NULL,1,'Pedraza_Cover_Image.jpg','image/jpeg',604519,'2022-05-15 18:39:13','Image of author with brother in childhood, author\'s image','Image of author with brother in childhood','Pedraza_(Photo).jpg','image/jpeg',317131,'2022-05-15 18:39:16','text',NULL,NULL,'Pedraza_Cover_Image.jpg','image/jpeg',604519,'2022-05-15 18:39:15'),(284,48,'language-and-storytelling-as-a-means-of-resistance-in-a-handmaid-s-tale','Language and Storytelling as a Means of Resistance in A Handmaid\'s Tale','Elena Morgan',NULL,NULL,'2022-05-14 15:02:45','2022-05-15 17:12:46',32,1185,NULL,1187,1186,NULL,NULL,1,'Morgan_Cover_Image.jpg','image/jpeg',2498369,'2022-05-15 16:49:48','Victoria Pickering, \"Filming of The Handmaid\'s Tale at the Lincoln Memorial,\" 15 Feb. 2019','A photo of women in rows dressed in infamous red costuming from The Handmaid\'s Tale television series','Morgan_(Photo).jpeg','image/jpeg',68903,'2022-05-15 16:49:50','text',NULL,NULL,'Morgan_Cover_Image.jpg','image/jpeg',2498369,'2022-05-15 16:49:50'),(285,48,'a-meditation-on-learning','A Meditation on Learning','Nora Lavins',NULL,NULL,'2022-05-14 15:49:57','2022-05-24 18:13:22',31,1188,NULL,1189,NULL,1198,NULL,1,'Lavin_Cover_Image.jpg','image/jpeg',1310363,'2022-05-15 14:58:58','Photo by Nikhil Mitra on Unsplash','Image of a C','Lavins_(Photo).jpg','image/jpeg',1411543,'2022-05-15 14:59:08','text',NULL,NULL,'Lavin_Cover_Image.jpg','image/jpeg',1310363,'2022-05-15 14:59:05');
/*!40000 ALTER TABLE `essays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlighted_essays`
--

DROP TABLE IF EXISTS `highlighted_essays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `highlighted_essays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `essay_style_id` int(11) DEFAULT NULL,
  `essay_id` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_highlighted_essays_on_issue_id` (`issue_id`),
  KEY `index_highlighted_essays_on_essay_style_id` (`essay_style_id`),
  KEY `index_highlighted_essays_on_essay_id` (`essay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlighted_essays`
--

LOCK TABLES `highlighted_essays` WRITE;
/*!40000 ALTER TABLE `highlighted_essays` DISABLE KEYS */;
INSERT INTO `highlighted_essays` VALUES (13,33,33,5,NULL,'2014-04-21 17:38:47','2014-04-21 17:38:47'),(14,33,33,16,NULL,'2014-04-27 20:54:52','2014-04-27 20:54:52'),(15,33,32,17,NULL,'2014-04-27 20:56:02','2014-04-27 20:56:02'),(16,33,33,7,NULL,'2014-08-05 15:32:16','2014-08-05 15:32:16'),(17,33,34,8,NULL,'2014-08-06 02:54:42','2014-08-06 02:54:42'),(18,40,33,38,NULL,'2015-07-07 22:51:09','2015-07-07 22:51:09'),(19,40,32,41,NULL,'2015-07-07 22:51:38','2015-07-07 22:51:38'),(21,40,31,35,NULL,'2015-08-17 15:48:20','2015-08-17 15:48:20'),(22,40,33,46,NULL,'2015-08-17 19:03:40','2015-08-17 19:03:40'),(23,40,32,48,NULL,'2015-08-17 19:19:52','2015-08-17 19:19:52'),(24,41,33,59,NULL,'2016-06-24 14:43:00','2016-06-24 14:43:00'),(26,41,32,76,NULL,'2016-06-24 14:44:48','2016-06-24 14:44:48'),(31,42,33,87,NULL,'2017-08-14 20:39:01','2017-08-14 20:39:01'),(32,42,33,109,NULL,'2017-08-14 20:39:12','2017-08-14 20:39:12'),(33,42,33,94,NULL,'2017-08-15 13:25:52','2017-08-15 13:25:52'),(34,42,33,102,NULL,'2017-08-15 13:26:05','2017-08-15 13:26:05'),(35,42,32,92,NULL,'2017-08-15 13:27:33','2017-08-15 13:27:33'),(36,43,33,111,NULL,'2018-05-10 13:29:51','2018-05-10 13:29:51'),(37,43,33,118,NULL,'2018-05-10 13:30:34','2018-05-10 13:30:34'),(38,43,31,131,NULL,'2018-05-10 13:31:02','2018-05-10 13:31:02'),(40,43,33,115,NULL,'2018-05-10 14:28:04','2018-05-10 14:28:04'),(42,44,33,168,NULL,'2019-07-15 14:26:13','2019-07-15 14:26:13'),(43,44,32,167,NULL,'2019-07-15 14:32:20','2019-07-15 14:32:20'),(44,44,32,164,NULL,'2019-07-15 14:32:45','2019-07-15 14:32:45'),(45,44,31,166,NULL,'2019-07-15 14:33:02','2019-07-15 14:33:02'),(46,44,33,163,NULL,'2019-07-15 14:33:10','2019-07-15 14:33:10'),(47,44,32,170,NULL,'2019-07-15 14:33:19','2019-07-15 14:33:19'),(48,44,32,171,NULL,'2019-07-15 14:33:47','2019-07-15 14:33:47'),(53,45,36,203,NULL,'2020-07-19 13:32:48','2020-07-19 13:32:48'),(56,45,31,172,NULL,'2020-07-19 15:51:21','2020-07-19 15:51:21'),(59,45,33,207,NULL,'2020-07-19 15:51:56','2020-07-19 15:51:56'),(60,45,31,176,NULL,'2020-07-20 15:13:56','2020-07-20 15:13:56'),(61,45,33,208,NULL,'2020-07-20 15:14:30','2020-07-20 15:14:30'),(63,45,33,183,NULL,'2020-07-20 16:05:47','2020-07-20 16:05:47'),(64,45,33,209,NULL,'2020-07-20 23:12:55','2020-07-20 23:12:55');
/*!40000 ALTER TABLE `highlighted_essays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'figure_1_orig.png','image/png',570178,'2014-04-10 16:02:19','2014-04-10 16:02:19','2014-04-10 16:02:19'),(2,'figure_2_orig.png','image/png',399332,'2014-04-10 16:02:19','2014-04-10 16:02:19','2014-04-10 16:02:19'),(3,'figure_3_orig.png','image/png',329483,'2014-04-10 16:02:20','2014-04-10 16:02:20','2014-04-10 16:02:20'),(4,'figure_4_orig.png','image/png',490591,'2014-04-10 16:02:20','2014-04-10 16:02:20','2014-04-10 16:02:20'),(5,'figure_5_orig.png','image/png',448955,'2014-04-10 16:02:20','2014-04-10 16:02:20','2014-04-10 16:02:20'),(6,'figure_6_orig.png','image/png',163270,'2014-04-10 16:02:20','2014-04-10 16:02:21','2014-04-10 16:02:21'),(7,'figure_7_orig.png','image/png',585135,'2014-04-10 16:02:21','2014-04-10 16:02:21','2014-04-10 16:02:21'),(8,'figure_8_orig.png','image/jpeg',1804130,'2014-04-10 16:02:21','2014-04-10 16:02:22','2014-04-10 16:02:22'),(9,'figure_1_orig.png','image/png',570178,'2014-04-10 16:05:23','2014-04-10 16:05:24','2014-04-10 16:05:24'),(10,'figure_2_orig.png','image/png',399332,'2014-04-10 16:05:24','2014-04-10 16:05:24','2014-04-10 16:05:24'),(11,'figure_3_orig.png','image/png',329483,'2014-04-10 16:05:24','2014-04-10 16:05:24','2014-04-10 16:05:24'),(12,'figure_4_orig.png','image/png',490591,'2014-04-10 16:05:24','2014-04-10 16:05:24','2014-04-10 16:05:24');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `is_pdf` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `editorial_notes_id` int(11) DEFAULT NULL,
  `editorial_board_id` int(11) DEFAULT NULL,
  `acknowledgements_id` int(11) DEFAULT NULL,
  `old_cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_cover_image_file_size` int(11) DEFAULT NULL,
  `old_cover_image_updated_at` datetime DEFAULT NULL,
  `pdf_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf_file_size` int(11) DEFAULT NULL,
  `pdf_updated_at` datetime DEFAULT NULL,
  `large_cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `large_cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `large_cover_image_file_size` int(11) DEFAULT NULL,
  `large_cover_image_updated_at` datetime DEFAULT NULL,
  `small_cover_image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `small_cover_image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `small_cover_image_file_size` int(11) DEFAULT NULL,
  `small_cover_image_updated_at` datetime DEFAULT NULL,
  `cover_image_credit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image_alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issues_on_slug` (`slug`),
  KEY `index_issues_on_editorial_notes_id` (`editorial_notes_id`),
  KEY `index_issues_on_editorial_board_id` (`editorial_board_id`),
  KEY `index_issues_on_acknowledgements_id` (`acknowledgements_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (33,2014,'2014','Volume 14',1,NULL,'2014-04-16 18:29:57','2015-07-01 19:09:50',190,191,192,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'FreshWritingBanner2.jpg','image/jpeg',37924,'2014-05-21 16:37:21','FreshWritingBanner2-small.jpg','image/jpeg',17548,'2014-05-21 16:37:22','Deborah Forteza','Image: Writing and Reading Tools'),(34,2012,'2012','Volume 12',1,1,'2014-04-16 18:29:57','2021-08-30 15:27:05',193,194,195,'2012.jpg','image/jpeg',298901,'2014-04-16 18:29:57','2012.pdf','application/pdf',2314406,'2014-04-16 18:29:57','FW_12_Cover_Photo.png','image/png',800732,'2021-08-30 15:25:20','FW_12_Cover_Photo_small.png','image/png',539119,'2021-08-30 15:27:05','',''),(35,2011,'2011','Volume 11',1,1,'2014-04-16 18:29:58','2015-01-05 19:30:46',196,197,198,'2011.jpg','image/jpeg',216092,'2014-04-16 18:29:57','2011.pdf','application/pdf',1935004,'2014-04-16 18:29:57','2011-1.png','image/png',659063,'2015-01-05 19:30:45','2011-1.png','image/png',659063,'2015-01-05 19:30:45','',''),(36,2010,'2010','Volume 10',1,1,'2014-04-16 18:29:58','2015-01-05 20:10:03',199,200,201,'2010.jpg','image/jpeg',216092,'2014-04-16 18:29:58','2010.pdf','application/pdf',2108647,'2014-04-16 18:29:58','2010-1.png','image/png',466455,'2015-01-05 19:19:24','2010-1.png','image/png',466455,'2015-01-05 19:25:01','',''),(37,2009,'2009','Volume 9',1,1,'2014-04-16 18:29:59','2015-01-05 20:09:42',202,203,204,'2009.jpg','image/jpeg',216092,'2014-04-16 18:29:58','2009.pdf','application/pdf',1739588,'2014-04-16 18:29:58','2009-1.png','image/png',456989,'2015-01-05 19:19:03','2009-1.png','image/png',456989,'2015-01-05 19:24:50','',''),(38,2008,'2008','Volume 8',1,1,'2014-04-16 18:29:59','2015-01-05 20:17:46',205,206,207,'2008.jpg','image/jpeg',216092,'2014-04-16 18:29:59','2008.pdf','application/pdf',3862279,'2014-04-16 18:29:59','2008-1.png','image/png',1121520,'2015-01-05 19:18:46','2008-1.png','image/png',1121520,'2015-01-05 19:24:40','',''),(39,2006,'2006','Volume 6',1,1,'2014-04-16 18:30:00','2015-01-05 19:53:19',208,209,210,'2006.jpg','image/jpeg',216092,'2014-04-16 18:29:59','2006.pdf','application/pdf',4484718,'2014-04-16 18:29:59','2006-1.png','image/png',290389,'2015-01-05 19:18:20','2006-1.png','image/png',290389,'2015-01-05 19:24:03','','');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markdown_content_images`
--

DROP TABLE IF EXISTS `markdown_content_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markdown_content_images` (
  `markdown_content_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  KEY `md_image_index` (`markdown_content_id`,`image_id`),
  KEY `image_md_index` (`image_id`,`markdown_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markdown_content_images`
--

LOCK TABLES `markdown_content_images` WRITE;
/*!40000 ALTER TABLE `markdown_content_images` DISABLE KEYS */;
INSERT INTO `markdown_content_images` VALUES (241,33),(241,34),(260,37),(260,38),(260,39),(267,35),(267,36),(313,40),(315,41);
/*!40000 ALTER TABLE `markdown_content_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markdown_contents`
--

DROP TABLE IF EXISTS `markdown_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markdown_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1203 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `markdown_contents` WRITE;
/*!40000 ALTER TABLE `markdown_contents` DISABLE KEYS */;
INSERT INTO `markdown_contents` VALUES (184,'<p>Narrative essays are story-driven, typically using experience as evidence for some larger theme, question, or problem. Some of the most successful narrative essays formulate a <a href=\"http://www.k-state.edu/english/baker/english287/cc-dramatic_question.htm\">dramatic question</a> in the minds of readers and build tension toward a pivotal moment or turning point in the story, followed by falling action and resolution. </p>','2014-04-16 18:29:55','2015-04-02 15:29:21'),(185,'<p>Drawn from the Greek word <em><a href=\"http://www.oxforddictionaries.com/us/definition/american_english/analysis\">analusis</a></em> (meaning “to break up” or \"to loosen\"), analysis essays break a text into meaningful components, examining each component carefully in order to illuminate something significant about the text as a whole. The components identified as the basis for analysis are determined by the writer’s audience and purpose. For example:</p>\n\n<p>A <em>rhetorical</em> analysis identifies key rhetorical strategies at play in a text and the impact those rhetorical strategies have on an audience (e.g., the role of ethical, logical, and emotional <a href=\"https://owl.english.purdue.edu/owl/resource/588/04/\">appeals</a> in King’s “<a href=\"http://www.africa.upenn.edu/Articles_Gen/Letter_Birmingham.html\">Letter From a Birmingham Jail</a>” or the role of <em><a href=\"http://www.csuchico.edu/%7Epkittle/110/enthymeme.html\">enthymeme</a></em> in an advertisement). </p>\n\n<p>An <em>evaluative</em> analysis identifies key criteria for the text under scrutiny and examines the extent to which the text succeeds based on those criteria (e.g., the effectiveness of a speech, based on the speaker\'s clarity, presence, and organization, or the quality of a restaurant based on its ambiance, service, and menu options).</p>\n\n<p>A <em>lens</em> analysis breaks up a text in light of a specific theory, concept, or reading (e.g, the role of allegory in <em>Life of Pi</em>, or examination of a pro-life website through the lens of <a href=\"http://rhetorica.net/burke.htm\">Kenneth Burke\'s pentad</a>). </p>\n\n<p>A <em>satirical</em> analysis mimics the conventions of a genre in order to illuminate and critique those conventions (e.g., fake “news” venues like <a href=\"http://thedailyshow.cc.com/\"><em>The Daily Show</em></a> and <em><a href=\"http://www.theonion.com/\">The Onion</a></em>, or Swift’s “<a href=\"http://www2.hn.psu.edu/faculty/jmanis/swift/swift-modestproposal6x9.pdf\">A Modest Proposal</a>”).</p>\n\n<p>Regardless of the approach, the most successful analysis essays reveal something new or less obvious about the text under scrutiny, developing that case with evidence and examples from the text to demonstrate each point of discussion.</p>','2014-04-16 18:29:55','2015-04-02 15:29:21'),(444,'<p>Heath, Shirley Brice, and Shelby Wolf. \"Focus in Creative Learning: Drawing on Art for Language Development.\" <i>Literacy Literacy (formerly Reading)</i> 39.1 (2005): 38-45. <i>Academic Search Premier [EBSCO]</i>. Web. 11 Oct. 2015.</p><p>Hetland, Lois, and Ellen Winner. \"The Arts and Academic Achievement: What the Evidence Shows.\" <i>Arts Education Policy Review</i> 102.5 (2001): 3-6. <i>Academic Search Premier [EBSCO]</i>. Web. 15 Oct. 2015.</p><p>\"ISTEP+ Grades 3-8.\" <i>Indiana Department of Education</i>. Indiana Department of Education, 16 Aug. 2011. Web. 24 Nov. 2015.</p><p>\"National Core Arts Standards: A Conceptual Framework for Arts Learning.\" <i>Conceptual</i></p><p><i> Framework | National Core Arts Standards</i>. National Coalition for Core Arts Standards, n.d. Web. 24 Nov. 2015.</p><p>Parsad, B., and Spiegelman, M. (2012). <i>Arts Education in Public Elementary and Secondary Schools: 1999–2000 and 2009–10 </i>(NCES 2012–014). National<i> </i>Center for Education Statistics, Institute of Education Sciences, U.S.<i> </i>Department of Education. Washington, DC. Web.<i></i></p><p>Rosier, James Tyler, Lawrence Locker, and Karen Z. Naufel. \"Art and Memory: An Examination of the Learning Benefits of Visual-Art Exposure.\" <i>North</i> <i>American</i> <i>Journal of Psychology</i> 15.2 (2013): 265-78. <i>Academic Search</i> <i>Premier [EBSCO]</i>. Web. 11 Oct. 2015.</p><p>Sabol, F. Robert. \"Seismic Shifts in the Education Landscape: What Do They Mean for Arts Education and Arts Education Policy?\" Arts Education Policy Review 114.1 (2013): 33- 45. Academic Search Premier [EBSCO]. Web. 25 Oct. 2015.</p>  <p>Strauss, Valerie. \"How Is This Fair? Art Teacher Is Evaluated by Students\' Math Standardized Test Scores.\" <i>Washington Post</i>. The Washington Post, 25 Mar. 2015. Web. 24 Nov. 2015.</p><p>Thomas, E., and A. Mulvey. \"Using the Arts in Teaching and Learning: Building Student Capacity for Community-based Work in Health Psychology.\" Journal of Health Psychology 13.2 (2008): 239-50. Academic Search Premier [EBSCO]. Web. 25 Oct. 2015.</p>','2016-07-04 00:55:01','2016-07-20 20:22:35'),(445,'<p>A member of the Class of 2018 living in Duncan Hall, Brian Bingham wrote his Writing and Rhetoric research paper on the economic drivers behind rising collegiate tuition prices. After Notre Dame announced yet another price hike for the 2015-2016 school year, Bingham was inspired to take an in-depth look at the topic by a supply and demand lecture given by his microeconomics professor, Michael Mogavero. Bingham, who spent the past summer working as a beat reporter for the <i>Shelter Island Reporter </i>on eastern Long Island, is majoring in Finance and Political Science and hopes to work in his native New York City following graduation. He would like to thank Writing and Rhetoric Professor Elizabeth Capdevielle for her guidance and support throughout the semester, and for her aid in bringing this article to publication. </p>','2016-07-04 00:58:27','2016-07-21 17:06:08');
/*!40000 ALTER TABLE `markdown_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_pages_on_slug` (`slug`),
  KEY `index_pages_on_content_id` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (7,'About','about','about','2014-04-16 18:30:05','2014-04-16 18:30:05',234),(8,'Submission Guidelines','submission_guidelines','submission_guidelines','2014-04-16 18:30:05','2014-04-16 18:30:05',235);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `redactor2_assets`
--

DROP TABLE IF EXISTS `redactor2_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redactor2_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_redactor_assetable_type` (`assetable_type`,`type`,`assetable_id`),
  KEY `idx_redactor_assetable` (`assetable_type`,`assetable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `redactor2_assets` WRITE;
/*!40000 ALTER TABLE `redactor2_assets` DISABLE KEYS */;
INSERT INTO `redactor2_assets` VALUES (1,'TheStateOfAnonymousInfographic_Greene.png','image/png',1761218,NULL,NULL,'RedactorRails::Picture',1200,8898,'2015-06-26 14:34:06','2015-06-26 14:34:06'),(2,'Screen_Shot_2015-07-22_at_3.39.28_PM.png','image/png',363587,NULL,NULL,'RedactorRails::Picture',679,566,'2015-07-22 19:29:45','2015-07-22 19:29:45'),(3,'Screen_Shot_2015-07-22_at_3.42.48_PM.png','image/png',338643,NULL,NULL,'RedactorRails::Picture',682,575,'2015-07-22 19:32:36','2015-07-22 19:32:36'),(4,'Screen_Shot_2015-07-22_at_3.42.48_PM.png','image/png',338643,NULL,NULL,'RedactorRails::Picture',682,575,'2015-07-22 19:53:58','2015-07-22 19:53:58'),(5,'Screen_Shot_2015-08-17_at_2.38.46_PM.png','image/png',51714,NULL,NULL,'RedactorRails::Picture',651,386,'2015-08-17 18:27:03','2015-08-17 18:27:03'),(6,'Screen_Shot_2016-06-08_at_1.53.32_PM.png','image/png',1483944,NULL,NULL,'RedactorRails::Picture',732,972,'2016-07-20 15:24:35','2016-07-20 15:24:35'),(7,'Entry_6_Image__1_.jpg','image/jpeg',549096,NULL,NULL,'RedactorRails::Picture',3000,2178,'2016-07-20 16:18:25','2016-07-20 16:18:25'),(8,'mazzafull.jpg','image/jpeg',1298948,NULL,NULL,'RedactorRails::Picture',2416,3000,'2017-08-01 14:36:05','2017-08-01 14:36:05'),(9,'Screen_Shot_2017-06-20_at_2.05.39_PM.png','image/png',124012,NULL,NULL,'RedactorRails::Picture',1254,464,'2017-08-04 20:39:57','2017-08-04 20:39:57');
/*!40000 ALTER TABLE `redactor2_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140303162240'),('20140303212749'),('20140303212759'),('20140304192237'),('20140305192000'),('20140306161812'),('20140311135134'),('20140311135346'),('20140311135656'),('20140311140044'),('20140311150954'),('20140311162812'),('20140312143427'),('20140318143742'),('20140318171441'),('20140321171718'),('20140321171730'),('20140321171744'),('20140321171754'),('20140321171809'),('20140321171825'),('20140321172710'),('20140321172725'),('20140321172821'),('20140322182605'),('20140323201342'),('20140401135353'),('20140401184637'),('20140401195207'),('20140402202827'),('20140402204724'),('20140403182338'),('20140404135035'),('20140404135337'),('20140404140058'),('20140404140808'),('20140404140908'),('20140404165239'),('20140404165627'),('20140404171546'),('20140404171846'),('20140407184820'),('20140408142425'),('20140408144951'),('20140408152955'),('20140410182157'),('20140828134350'),('20140828140443'),('20150109141015'),('20150122141003'),('20150122151000'),('20160621013228'),('20210720130014'),('20210803150453');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jkennel',5,'2014-08-28 14:54:51','2014-06-05 13:34:55','10.41.61.21','10.40.28.192','2014-04-02 18:22:27','2014-08-28 14:54:51'),(2,'jhartzle',15,'2019-07-30 17:08:21','2019-07-03 13:44:50','129.74.231.142','129.74.117.228','2014-04-02 18:35:28','2019-07-30 17:08:21'),(3,'lthiel',64,'2017-06-05 18:01:22','2017-05-26 14:12:36','129.74.243.61','129.74.244.247','2014-04-02 21:46:20','2017-06-05 18:01:22'),(4,'edietelm',60,'2018-11-19 17:23:54','2018-10-22 17:54:01','99.65.191.66','129.74.239.41','2014-04-17 20:05:19','2018-11-19 17:23:54'),(5,'rfox2',9,'2019-07-27 13:55:23','2019-07-24 13:43:45','108.235.126.245','129.74.231.112','2014-04-28 14:30:05','2019-07-27 13:55:23'),(36,'shayward',0,NULL,NULL,NULL,NULL,'2020-04-23 15:05:01','2020-04-23 15:05:01'),(37,'dboughto',0,NULL,NULL,NULL,NULL,'2020-05-05 14:35:45','2020-05-05 14:35:45'),(38,'bokeefe',0,NULL,NULL,NULL,NULL,'2021-01-01 06:57:15','2021-01-01 06:57:15'),(39,'mnarlock',0,NULL,NULL,NULL,NULL,'2021-06-09 20:19:31','2021-06-09 20:19:31'),(40,'jwant',0,NULL,NULL,NULL,NULL,'2021-06-23 13:37:45','2021-06-23 13:37:45'),(41,'mkirkpa2',0,NULL,NULL,NULL,NULL,'2021-07-19 14:57:02','2021-07-19 14:57:02'),(42,'pweikel',0,NULL,NULL,NULL,NULL,'2021-09-08 14:49:13','2021-09-08 14:49:13'),(43,'jweinhol',0,NULL,NULL,NULL,NULL,'2021-11-23 13:27:23','2021-11-23 13:27:23'),(44,'mjain5',0,NULL,NULL,NULL,NULL,'2022-02-11 12:53:48','2022-02-11 12:53:48'),(45,'lmacgowa',0,NULL,NULL,NULL,NULL,'2022-04-11 14:30:56','2022-04-11 14:30:56'),(46,'rbatusic',0,NULL,NULL,NULL,NULL,'2022-05-06 19:09:29','2022-05-06 19:09:29'),(47,'edennis',0,NULL,NULL,NULL,NULL,'2022-05-06 19:44:41','2022-05-06 19:44:41'),(48,'jslott1',0,NULL,NULL,NULL,NULL,'2022-05-09 13:10:49','2022-05-09 13:10:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `whodunnit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_item_type_and_item_id` (`item_type`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2572 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,'Issue',12,'create',NULL,NULL,'2014-04-10 16:02:16'),(2,'Issue',13,'create',NULL,NULL,'2014-04-10 16:02:16'),(3,'Issue',14,'create',NULL,NULL,'2014-04-10 16:02:17'),(4,'Issue',15,'create',NULL,NULL,'2014-04-10 16:02:17'),(5,'Issue',16,'create',NULL,NULL,'2014-04-10 16:02:18'),(6,'Issue',17,'create',NULL,NULL,'2014-04-10 16:02:18'),(7,'Issue',18,'create',NULL,NULL,'2014-04-10 16:02:19'),(9,'Issue',19,'create',NULL,NULL,'2014-04-10 16:05:20'),(10,'Issue',20,'create',NULL,NULL,'2014-04-10 16:05:21'),(11,'Issue',21,'create',NULL,NULL,'2014-04-10 16:05:21'),(12,'Issue',22,'create',NULL,NULL,'2014-04-10 16:05:22'),(13,'Issue',23,'create',NULL,NULL,'2014-04-10 16:05:22');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET character_set_client = @saved_cs_client */;
-- Dump completed on 2022-07-21 16:28:51
