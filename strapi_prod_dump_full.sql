-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: strapi_db
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abouts_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `abouts_created_by_id_fk` (`created_by_id`),
  KEY `abouts_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `abouts_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `abouts_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abouts`
--

LOCK TABLES `abouts` WRITE;
/*!40000 ALTER TABLE `abouts` DISABLE KEYS */;
INSERT INTO `abouts` VALUES (1,'ajfxu80ggm75raupgk0vhsky','About the strapi blog','2025-07-23 05:52:05.274000','2025-07-23 05:52:05.274000','2025-07-23 05:52:05.259000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `abouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abouts_cmps`
--

DROP TABLE IF EXISTS `abouts_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abouts_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `abouts_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `abouts_field_idx` (`field`),
  KEY `abouts_component_type_idx` (`component_type`),
  KEY `abouts_entity_fk` (`entity_id`),
  CONSTRAINT `abouts_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `abouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abouts_cmps`
--

LOCK TABLES `abouts_cmps` WRITE;
/*!40000 ALTER TABLE `abouts_cmps` DISABLE KEYS */;
INSERT INTO `abouts_cmps` VALUES (1,1,6,'shared.quote','blocks',1),(2,1,11,'shared.rich-text','blocks',2),(3,1,6,'shared.media','blocks',3);
/*!40000 ALTER TABLE `abouts_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_parameters` json DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `conditions` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'kcbwxi2lwvuparpruxlbrta6','plugin::content-manager.explorer.create','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[]','2025-07-23 05:51:48.258000','2025-07-23 05:51:48.258000','2025-07-23 05:51:48.259000',NULL,NULL,NULL),(3,'ay4u1ennes7qh3g2nn1ah0me','plugin::content-manager.explorer.create','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[]','2025-07-23 05:51:48.338000','2025-07-29 16:31:41.318000','2025-07-23 05:51:48.338000',NULL,NULL,NULL),(4,'rg4yja13lxkacny709vwri82','plugin::content-manager.explorer.create','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[]','2025-07-23 05:51:48.367000','2025-07-29 16:31:41.318000','2025-07-23 05:51:48.368000',NULL,NULL,NULL),(5,'wt8prv9ad7ecym21jbr45z25','plugin::content-manager.explorer.create','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2025-07-23 05:51:48.407000','2025-07-23 05:51:48.407000','2025-07-23 05:51:48.412000',NULL,NULL,NULL),(6,'v4ifbw18mxsqe3ej0317loxf','plugin::content-manager.explorer.read','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[]','2025-07-23 05:51:48.448000','2025-07-23 05:51:48.448000','2025-07-23 05:51:48.449000',NULL,NULL,NULL),(8,'i78207pewur5lv0t7pax3cbv','plugin::content-manager.explorer.read','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[]','2025-07-23 05:51:48.535000','2025-07-29 16:31:41.318000','2025-07-23 05:51:48.535000',NULL,NULL,NULL),(9,'l4w3tpmyfzws7px601dd9mt4','plugin::content-manager.explorer.read','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[]','2025-07-23 05:51:48.569000','2025-07-29 16:31:41.318000','2025-07-23 05:51:48.569000',NULL,NULL,NULL),(10,'mvo51im23r1sbukicwp8blm7','plugin::content-manager.explorer.read','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2025-07-23 05:51:48.606000','2025-07-23 05:51:48.606000','2025-07-23 05:51:48.606000',NULL,NULL,NULL),(11,'q81ax3gzwthneseyb6ilhgrm','plugin::content-manager.explorer.update','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[]','2025-07-23 05:51:48.632000','2025-07-23 05:51:48.632000','2025-07-23 05:51:48.633000',NULL,NULL,NULL),(13,'xawqzd74cbte5965pr10b95a','plugin::content-manager.explorer.update','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[]','2025-07-23 05:51:48.701000','2025-07-29 16:31:41.318000','2025-07-23 05:51:48.701000',NULL,NULL,NULL),(14,'de2z1tduu7ooaqh7shair47o','plugin::content-manager.explorer.update','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[]','2025-07-23 05:51:48.730000','2025-07-29 16:31:41.319000','2025-07-23 05:51:48.731000',NULL,NULL,NULL),(15,'kb4ps52d3ab3l9ke91hgpjsn','plugin::content-manager.explorer.update','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2025-07-23 05:51:48.761000','2025-07-23 05:51:48.761000','2025-07-23 05:51:48.762000',NULL,NULL,NULL),(16,'i60oy8j3yf2t0xcr8p1ojn2x','plugin::content-manager.explorer.delete','{}','api::about.about','{}','[]','2025-07-23 05:51:48.795000','2025-07-23 05:51:48.795000','2025-07-23 05:51:48.795000',NULL,NULL,NULL),(18,'km6zz9ozepbo0ac4qmkhjte0','plugin::content-manager.explorer.delete','{}','api::author.author','{}','[]','2025-07-23 05:51:48.857000','2025-07-23 05:51:48.857000','2025-07-23 05:51:48.857000',NULL,NULL,NULL),(19,'wd3d6dyfnw0zztjy08ujj2wq','plugin::content-manager.explorer.delete','{}','api::category.category','{}','[]','2025-07-23 05:51:48.891000','2025-07-23 05:51:48.891000','2025-07-23 05:51:48.891000',NULL,NULL,NULL),(20,'ycr2ky83bmkrwn2w6n6ta1iz','plugin::content-manager.explorer.delete','{}','api::global.global','{}','[]','2025-07-23 05:51:48.922000','2025-07-23 05:51:48.922000','2025-07-23 05:51:48.922000',NULL,NULL,NULL),(21,'nvcy7ocq71nz6anyr5ch98me','plugin::content-manager.explorer.publish','{}','api::about.about','{}','[]','2025-07-23 05:51:48.954000','2025-07-23 05:51:48.954000','2025-07-23 05:51:48.954000',NULL,NULL,NULL),(23,'m5r0ixeq0tmcg933rjqab45e','plugin::content-manager.explorer.publish','{}','api::author.author','{}','[]','2025-07-23 05:51:49.015000','2025-07-23 05:51:49.015000','2025-07-23 05:51:49.016000',NULL,NULL,NULL),(24,'kvwz557hf3htz26rvobhe8ku','plugin::content-manager.explorer.publish','{}','api::category.category','{}','[]','2025-07-23 05:51:49.065000','2025-07-23 05:51:49.065000','2025-07-23 05:51:49.065000',NULL,NULL,NULL),(25,'yto14wcf2jqjjtzil1kktmo7','plugin::content-manager.explorer.publish','{}','api::global.global','{}','[]','2025-07-23 05:51:49.127000','2025-07-23 05:51:49.127000','2025-07-23 05:51:49.127000',NULL,NULL,NULL),(26,'o8cer6dx63s6qbrkp2eut02z','plugin::upload.read','{}',NULL,'{}','[]','2025-07-23 05:51:49.162000','2025-07-23 05:51:49.162000','2025-07-23 05:51:49.162000',NULL,NULL,NULL),(27,'y4ogm3wfo382s3lmxqaqxsp8','plugin::upload.configure-view','{}',NULL,'{}','[]','2025-07-23 05:51:49.194000','2025-07-23 05:51:49.194000','2025-07-23 05:51:49.194000',NULL,NULL,NULL),(28,'jrnjpxfzge33o6fune64fkly','plugin::upload.assets.create','{}',NULL,'{}','[]','2025-07-23 05:51:49.227000','2025-07-23 05:51:49.227000','2025-07-23 05:51:49.227000',NULL,NULL,NULL),(29,'v60n2lf5g17gv3fzp7hm0p7v','plugin::upload.assets.update','{}',NULL,'{}','[]','2025-07-23 05:51:49.256000','2025-07-23 05:51:49.256000','2025-07-23 05:51:49.256000',NULL,NULL,NULL),(30,'rembse7hnp8auqqkzl9w2hwz','plugin::upload.assets.download','{}',NULL,'{}','[]','2025-07-23 05:51:49.301000','2025-07-23 05:51:49.301000','2025-07-23 05:51:49.301000',NULL,NULL,NULL),(31,'x3750vq9qe7t4txf0eenlbli','plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2025-07-23 05:51:49.333000','2025-07-23 05:51:49.333000','2025-07-23 05:51:49.333000',NULL,NULL,NULL),(32,'s8nlzismb7ofwnanejuhxr86','plugin::content-manager.explorer.create','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.389000','2025-07-23 05:51:49.389000','2025-07-23 05:51:49.389000',NULL,NULL,NULL),(34,'llzchqhqhxt3libzpkulxe1b','plugin::content-manager.explorer.create','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.450000','2025-07-29 16:31:41.319000','2025-07-23 05:51:49.450000',NULL,NULL,NULL),(35,'yio4y47e1q3ewkqfyfgw1icl','plugin::content-manager.explorer.create','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.483000','2025-07-29 16:31:41.319000','2025-07-23 05:51:49.483000',NULL,NULL,NULL),(36,'fjv35xkh7mknw2k9mq53mhlv','plugin::content-manager.explorer.create','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.514000','2025-07-23 05:51:49.514000','2025-07-23 05:51:49.514000',NULL,NULL,NULL),(37,'w3qjb34dwagqrn4cewzvvkc3','plugin::content-manager.explorer.read','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.549000','2025-07-23 05:51:49.549000','2025-07-23 05:51:49.549000',NULL,NULL,NULL),(39,'j06l51u9x0tnuor5s5mwbj4g','plugin::content-manager.explorer.read','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.615000','2025-07-29 16:31:41.319000','2025-07-23 05:51:49.615000',NULL,NULL,NULL),(40,'w5m11oswuvbi9rsg6t7uv6it','plugin::content-manager.explorer.read','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.654000','2025-07-29 16:31:41.319000','2025-07-23 05:51:49.654000',NULL,NULL,NULL),(41,'y0y76zhc5p02wiw59t3zkexl','plugin::content-manager.explorer.read','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.686000','2025-07-23 05:51:49.686000','2025-07-23 05:51:49.686000',NULL,NULL,NULL),(42,'b4gl88922x82crnxxl6i97vo','plugin::content-manager.explorer.update','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.720000','2025-07-23 05:51:49.720000','2025-07-23 05:51:49.720000',NULL,NULL,NULL),(44,'sd9r78wxvoy78ud71duxt4rv','plugin::content-manager.explorer.update','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.777000','2025-07-29 16:31:41.319000','2025-07-23 05:51:49.777000',NULL,NULL,NULL),(45,'wc4orcmsmjqo8photkyyuilc','plugin::content-manager.explorer.update','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.805000','2025-07-29 16:31:41.319000','2025-07-23 05:51:49.805000',NULL,NULL,NULL),(46,'g0m0p2cgb88qeerjjk04ulrz','plugin::content-manager.explorer.update','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[\"admin::is-creator\"]','2025-07-23 05:51:49.834000','2025-07-23 05:51:49.834000','2025-07-23 05:51:49.834000',NULL,NULL,NULL),(47,'kfufezv0xs007uk53kc5wryu','plugin::content-manager.explorer.delete','{}','api::about.about','{}','[\"admin::is-creator\"]','2025-07-23 05:51:49.865000','2025-07-23 05:51:49.865000','2025-07-23 05:51:49.865000',NULL,NULL,NULL),(49,'prxz9iwjpqi7oub34sgp1ipm','plugin::content-manager.explorer.delete','{}','api::author.author','{}','[\"admin::is-creator\"]','2025-07-23 05:51:49.924000','2025-07-23 05:51:49.924000','2025-07-23 05:51:49.924000',NULL,NULL,NULL),(50,'d1p0s5xisd3l1f9djl60dfgt','plugin::content-manager.explorer.delete','{}','api::category.category','{}','[\"admin::is-creator\"]','2025-07-23 05:51:49.955000','2025-07-23 05:51:49.955000','2025-07-23 05:51:49.955000',NULL,NULL,NULL),(51,'gurcxm4ewbvn8wz40v766nlh','plugin::content-manager.explorer.delete','{}','api::global.global','{}','[\"admin::is-creator\"]','2025-07-23 05:51:49.993000','2025-07-23 05:51:49.993000','2025-07-23 05:51:49.993000',NULL,NULL,NULL),(52,'qjueetqzjnyvfu67avp1u74z','plugin::upload.read','{}',NULL,'{}','[\"admin::is-creator\"]','2025-07-23 05:51:50.027000','2025-07-23 05:51:50.027000','2025-07-23 05:51:50.027000',NULL,NULL,NULL),(53,'gaafy0j62l1jkff33h2xf1e7','plugin::upload.configure-view','{}',NULL,'{}','[]','2025-07-23 05:51:50.116000','2025-07-23 05:51:50.116000','2025-07-23 05:51:50.116000',NULL,NULL,NULL),(54,'r33cjaqcz4su3gecewosycdv','plugin::upload.assets.create','{}',NULL,'{}','[]','2025-07-23 05:51:50.147000','2025-07-23 05:51:50.147000','2025-07-23 05:51:50.147000',NULL,NULL,NULL),(55,'g5j6g2c74yhwkhemm6j1hdhc','plugin::upload.assets.update','{}',NULL,'{}','[\"admin::is-creator\"]','2025-07-23 05:51:50.178000','2025-07-23 05:51:50.178000','2025-07-23 05:51:50.178000',NULL,NULL,NULL),(56,'szgq14xkamst5dzekj77d315','plugin::upload.assets.download','{}',NULL,'{}','[]','2025-07-23 05:51:50.210000','2025-07-23 05:51:50.210000','2025-07-23 05:51:50.210000',NULL,NULL,NULL),(57,'ct2senj92cp6ffp1bh61r416','plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2025-07-23 05:51:50.240000','2025-07-23 05:51:50.240000','2025-07-23 05:51:50.240000',NULL,NULL,NULL),(58,'t3aq4walvykmxzpvip0souv7','plugin::content-manager.explorer.create','{}','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2025-07-23 05:51:50.327000','2025-07-23 05:51:50.327000','2025-07-23 05:51:50.327000',NULL,NULL,NULL),(59,'ranzg1sd5ovw3lid1e49mfd0','plugin::content-manager.explorer.create','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[]','2025-07-23 05:51:50.356000','2025-07-23 05:51:50.356000','2025-07-23 05:51:50.356000',NULL,NULL,NULL),(63,'t2qu0v9f2dx2q8hdacw1g5tx','plugin::content-manager.explorer.create','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2025-07-23 05:51:50.514000','2025-07-23 05:51:50.514000','2025-07-23 05:51:50.514000',NULL,NULL,NULL),(64,'vlviybm8qtsp4rle6evwx07c','plugin::content-manager.explorer.read','{}','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2025-07-23 05:51:50.548000','2025-07-23 05:51:50.548000','2025-07-23 05:51:50.548000',NULL,NULL,NULL),(65,'mhl41us3p8bpvcrok45bm9nx','plugin::content-manager.explorer.read','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[]','2025-07-23 05:51:50.587000','2025-07-23 05:51:50.587000','2025-07-23 05:51:50.587000',NULL,NULL,NULL),(69,'wtcxsspumfb3b6wm9bw9sv35','plugin::content-manager.explorer.read','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2025-07-23 05:51:50.713000','2025-07-23 05:51:50.713000','2025-07-23 05:51:50.713000',NULL,NULL,NULL),(70,'cpdjgee0446r7o0170ktuu0u','plugin::content-manager.explorer.update','{}','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2025-07-23 05:51:50.743000','2025-07-23 05:51:50.743000','2025-07-23 05:51:50.743000',NULL,NULL,NULL),(71,'bkzh9e2r9otoeetxbv4tk181','plugin::content-manager.explorer.update','{}','api::about.about','{\"fields\": [\"title\", \"blocks\"]}','[]','2025-07-23 05:51:52.560000','2025-07-23 05:51:52.560000','2025-07-23 05:51:52.560000',NULL,NULL,NULL),(75,'ctkb95xjbzsr2dx9nxkcp5h2','plugin::content-manager.explorer.update','{}','api::global.global','{\"fields\": [\"siteName\", \"favicon\", \"siteDescription\", \"defaultSeo.metaTitle\", \"defaultSeo.metaDescription\", \"defaultSeo.shareImage\"]}','[]','2025-07-23 05:51:52.733000','2025-07-23 05:51:52.733000','2025-07-23 05:51:52.733000',NULL,NULL,NULL),(76,'lpeeb6n84dzkueaztzv6vvdm','plugin::content-manager.explorer.delete','{}','plugin::users-permissions.user','{}','[]','2025-07-23 05:51:52.773000','2025-07-23 05:51:52.773000','2025-07-23 05:51:52.773000',NULL,NULL,NULL),(77,'r48t64hf8gk06ckuxefvx409','plugin::content-manager.explorer.delete','{}','api::about.about','{}','[]','2025-07-23 05:51:52.801000','2025-07-23 05:51:52.801000','2025-07-23 05:51:52.801000',NULL,NULL,NULL),(79,'q9bz7h1eensjid6gra4shpun','plugin::content-manager.explorer.delete','{}','api::author.author','{}','[]','2025-07-23 05:51:52.855000','2025-07-23 05:51:52.855000','2025-07-23 05:51:52.856000',NULL,NULL,NULL),(80,'a0vlaxji81x3y6gifyceljyc','plugin::content-manager.explorer.delete','{}','api::category.category','{}','[]','2025-07-23 05:51:52.892000','2025-07-23 05:51:52.892000','2025-07-23 05:51:52.892000',NULL,NULL,NULL),(81,'pqpez5bmc3551ewim20cak3o','plugin::content-manager.explorer.delete','{}','api::global.global','{}','[]','2025-07-23 05:51:52.923000','2025-07-23 05:51:52.923000','2025-07-23 05:51:52.923000',NULL,NULL,NULL),(82,'tcvvvnx74g1bfb7htmaoflwg','plugin::content-manager.explorer.publish','{}','plugin::users-permissions.user','{}','[]','2025-07-23 05:51:52.957000','2025-07-23 05:51:52.957000','2025-07-23 05:51:52.957000',NULL,NULL,NULL),(83,'lhnrqeds4b3e8hbamcwghp9v','plugin::content-manager.explorer.publish','{}','api::about.about','{}','[]','2025-07-23 05:51:52.996000','2025-07-23 05:51:52.996000','2025-07-23 05:51:52.997000',NULL,NULL,NULL),(85,'vl6b81vwjn010arf0etgrotz','plugin::content-manager.explorer.publish','{}','api::author.author','{}','[]','2025-07-23 05:51:53.066000','2025-07-23 05:51:53.066000','2025-07-23 05:51:53.066000',NULL,NULL,NULL),(86,'m1c1zrk9ijns45ypz5wgp5tk','plugin::content-manager.explorer.publish','{}','api::category.category','{}','[]','2025-07-23 05:51:53.100000','2025-07-23 05:51:53.100000','2025-07-23 05:51:53.100000',NULL,NULL,NULL),(87,'zavu6qttabcj2dd1qpp9bu70','plugin::content-manager.explorer.publish','{}','api::global.global','{}','[]','2025-07-23 05:51:53.139000','2025-07-23 05:51:53.139000','2025-07-23 05:51:53.139000',NULL,NULL,NULL),(88,'ccuuzox14luk6oty17mz5fe8','plugin::content-manager.single-types.configure-view','{}',NULL,'{}','[]','2025-07-23 05:51:53.177000','2025-07-23 05:51:53.177000','2025-07-23 05:51:53.177000',NULL,NULL,NULL),(89,'oa2sz2w4wdfit0xkek0bfxj0','plugin::content-manager.collection-types.configure-view','{}',NULL,'{}','[]','2025-07-23 05:51:53.215000','2025-07-23 05:51:53.215000','2025-07-23 05:51:53.215000',NULL,NULL,NULL),(90,'erxn15k4sv5athvkrzepbgk4','plugin::content-manager.components.configure-layout','{}',NULL,'{}','[]','2025-07-23 05:51:53.250000','2025-07-23 05:51:53.250000','2025-07-23 05:51:53.251000',NULL,NULL,NULL),(91,'yg4daniztcpnzclij31c20xy','plugin::content-type-builder.read','{}',NULL,'{}','[]','2025-07-23 05:51:53.283000','2025-07-23 05:51:53.283000','2025-07-23 05:51:53.283000',NULL,NULL,NULL),(92,'hkiosjl3ousn3hfvatpxf3pk','plugin::email.settings.read','{}',NULL,'{}','[]','2025-07-23 05:51:53.321000','2025-07-23 05:51:53.321000','2025-07-23 05:51:53.321000',NULL,NULL,NULL),(93,'jl0v8slb174f2cbfw7c45q7q','plugin::upload.read','{}',NULL,'{}','[]','2025-07-23 05:51:53.353000','2025-07-23 05:51:53.353000','2025-07-23 05:51:53.353000',NULL,NULL,NULL),(94,'uc564xlgcs61kuqn19xde51g','plugin::upload.assets.create','{}',NULL,'{}','[]','2025-07-23 05:51:53.397000','2025-07-23 05:51:53.397000','2025-07-23 05:51:53.397000',NULL,NULL,NULL),(95,'ebbk88g3yq0te2lvybf3sgfj','plugin::upload.assets.update','{}',NULL,'{}','[]','2025-07-23 05:51:53.428000','2025-07-23 05:51:53.428000','2025-07-23 05:51:53.428000',NULL,NULL,NULL),(96,'qt5eysmz3z494pfvceqyv1px','plugin::upload.assets.download','{}',NULL,'{}','[]','2025-07-23 05:51:53.461000','2025-07-23 05:51:53.461000','2025-07-23 05:51:53.461000',NULL,NULL,NULL),(97,'cn971fns4cku66153wque857','plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2025-07-23 05:51:53.492000','2025-07-23 05:51:53.492000','2025-07-23 05:51:53.492000',NULL,NULL,NULL),(98,'asy36qzljy0knvrqwjl5bup1','plugin::upload.configure-view','{}',NULL,'{}','[]','2025-07-23 05:51:54.106000','2025-07-23 05:51:54.106000','2025-07-23 05:51:54.106000',NULL,NULL,NULL),(99,'kbf356r9mlct6rpw4yums0z1','plugin::upload.settings.read','{}',NULL,'{}','[]','2025-07-23 05:51:54.489000','2025-07-23 05:51:54.489000','2025-07-23 05:51:54.489000',NULL,NULL,NULL),(100,'o1p8csbi0iwbmhezerc2wmia','plugin::i18n.locale.create','{}',NULL,'{}','[]','2025-07-23 05:51:54.524000','2025-07-23 05:51:54.524000','2025-07-23 05:51:54.524000',NULL,NULL,NULL),(101,'jwx5sywnwc2tvuaf1sbahksa','plugin::i18n.locale.read','{}',NULL,'{}','[]','2025-07-23 05:51:54.554000','2025-07-23 05:51:54.554000','2025-07-23 05:51:54.554000',NULL,NULL,NULL),(102,'m01c44baak0j76szx58g2rb9','plugin::i18n.locale.update','{}',NULL,'{}','[]','2025-07-23 05:51:54.605000','2025-07-23 05:51:54.605000','2025-07-23 05:51:54.605000',NULL,NULL,NULL),(103,'i60m0dgama7yh02x7cr7cdh9','plugin::i18n.locale.delete','{}',NULL,'{}','[]','2025-07-23 05:51:54.650000','2025-07-23 05:51:54.650000','2025-07-23 05:51:54.650000',NULL,NULL,NULL),(104,'p1u0dmq5vuipvst86snvrcvw','plugin::users-permissions.roles.create','{}',NULL,'{}','[]','2025-07-23 05:51:54.684000','2025-07-23 05:51:54.684000','2025-07-23 05:51:54.686000',NULL,NULL,NULL),(105,'wpozs6abt77a5ua76wrey431','plugin::users-permissions.roles.read','{}',NULL,'{}','[]','2025-07-23 05:51:54.720000','2025-07-23 05:51:54.720000','2025-07-23 05:51:54.720000',NULL,NULL,NULL),(106,'rccqohbfj1bev12h5peix86j','plugin::users-permissions.roles.update','{}',NULL,'{}','[]','2025-07-23 05:51:54.752000','2025-07-23 05:51:54.752000','2025-07-23 05:51:54.753000',NULL,NULL,NULL),(107,'p04ci3mwkoxexth8a46z82y4','plugin::users-permissions.roles.delete','{}',NULL,'{}','[]','2025-07-23 05:51:54.781000','2025-07-23 05:51:54.781000','2025-07-23 05:51:54.781000',NULL,NULL,NULL),(108,'tho8gmak6fx1zycb51chr2pz','plugin::users-permissions.providers.read','{}',NULL,'{}','[]','2025-07-23 05:51:54.815000','2025-07-23 05:51:54.815000','2025-07-23 05:51:54.815000',NULL,NULL,NULL),(109,'n8qpa949fwydxoct4zw6emfx','plugin::users-permissions.providers.update','{}',NULL,'{}','[]','2025-07-23 05:51:54.860000','2025-07-23 05:51:54.860000','2025-07-23 05:51:54.860000',NULL,NULL,NULL),(110,'vz62u54i2r69pn2vddiknm76','plugin::users-permissions.email-templates.read','{}',NULL,'{}','[]','2025-07-23 05:51:54.895000','2025-07-23 05:51:54.895000','2025-07-23 05:51:54.895000',NULL,NULL,NULL),(111,'vv6sa6lfgpd498nzgzqg6jva','plugin::users-permissions.email-templates.update','{}',NULL,'{}','[]','2025-07-23 05:51:54.926000','2025-07-23 05:51:54.926000','2025-07-23 05:51:54.929000',NULL,NULL,NULL),(112,'lnh0izinyjqcvd6evspgg6cd','plugin::users-permissions.advanced-settings.read','{}',NULL,'{}','[]','2025-07-23 05:51:54.965000','2025-07-23 05:51:54.965000','2025-07-23 05:51:54.965000',NULL,NULL,NULL),(113,'dbmgzzzkvshp56a2v32ahi0h','plugin::users-permissions.advanced-settings.update','{}',NULL,'{}','[]','2025-07-23 05:51:55.000000','2025-07-23 05:51:55.000000','2025-07-23 05:51:55.000000',NULL,NULL,NULL),(114,'oj4as65a21udttfy53ytl7m1','admin::marketplace.read','{}',NULL,'{}','[]','2025-07-23 05:51:55.033000','2025-07-23 05:51:55.033000','2025-07-23 05:51:55.033000',NULL,NULL,NULL),(115,'zk85kw17xh8cmr46bcqglv9k','admin::webhooks.create','{}',NULL,'{}','[]','2025-07-23 05:51:55.060000','2025-07-23 05:51:55.060000','2025-07-23 05:51:55.060000',NULL,NULL,NULL),(116,'rtx1szw08ccvfd02oveisgxr','admin::webhooks.read','{}',NULL,'{}','[]','2025-07-23 05:51:55.095000','2025-07-23 05:51:55.095000','2025-07-23 05:51:55.095000',NULL,NULL,NULL),(117,'t3ucfhltf45q56ewtsxlqp95','admin::webhooks.update','{}',NULL,'{}','[]','2025-07-23 05:51:55.129000','2025-07-23 05:51:55.129000','2025-07-23 05:51:55.129000',NULL,NULL,NULL),(118,'kkgoq9j816mu3frv9tbygv69','admin::webhooks.delete','{}',NULL,'{}','[]','2025-07-23 05:51:55.162000','2025-07-23 05:51:55.162000','2025-07-23 05:51:55.162000',NULL,NULL,NULL),(119,'ep3n2utxcl8idormkmvjnwb3','admin::users.create','{}',NULL,'{}','[]','2025-07-23 05:51:55.194000','2025-07-23 05:51:55.194000','2025-07-23 05:51:55.194000',NULL,NULL,NULL),(120,'gwatvfwnb7le10cju4k5rakb','admin::users.read','{}',NULL,'{}','[]','2025-07-23 05:51:55.221000','2025-07-23 05:51:55.221000','2025-07-23 05:51:55.221000',NULL,NULL,NULL),(121,'nqk68a976acgvgbz3mibtt8b','admin::users.update','{}',NULL,'{}','[]','2025-07-23 05:51:55.249000','2025-07-23 05:51:55.249000','2025-07-23 05:51:55.249000',NULL,NULL,NULL),(122,'t4faggfolcxgjgmmzta5euux','admin::users.delete','{}',NULL,'{}','[]','2025-07-23 05:51:55.305000','2025-07-23 05:51:55.305000','2025-07-23 05:51:55.305000',NULL,NULL,NULL),(123,'m7c4tvwaxbpytftk6ny1237h','admin::roles.create','{}',NULL,'{}','[]','2025-07-23 05:51:55.330000','2025-07-23 05:51:55.330000','2025-07-23 05:51:55.331000',NULL,NULL,NULL),(124,'arcptc7rqasembkbtwhruliq','admin::roles.read','{}',NULL,'{}','[]','2025-07-23 05:51:55.364000','2025-07-23 05:51:55.364000','2025-07-23 05:51:55.365000',NULL,NULL,NULL),(125,'yj0qhna9t7ax6fpls6nn8t5o','admin::roles.update','{}',NULL,'{}','[]','2025-07-23 05:51:55.396000','2025-07-23 05:51:55.396000','2025-07-23 05:51:55.396000',NULL,NULL,NULL),(126,'ejqg1lfcib092n6qvm9ru2ns','admin::roles.delete','{}',NULL,'{}','[]','2025-07-23 05:51:55.427000','2025-07-23 05:51:55.427000','2025-07-23 05:51:55.427000',NULL,NULL,NULL),(127,'mshzqcqv4sinpqa8c0gb8xm4','admin::api-tokens.access','{}',NULL,'{}','[]','2025-07-23 05:51:55.461000','2025-07-23 05:51:55.461000','2025-07-23 05:51:55.461000',NULL,NULL,NULL),(128,'an2i89llkmasxosdc8n8rkbo','admin::api-tokens.create','{}',NULL,'{}','[]','2025-07-23 05:51:55.491000','2025-07-23 05:51:55.491000','2025-07-23 05:51:55.492000',NULL,NULL,NULL),(129,'dpb6xlf1104q6txnr8ugbk21','admin::api-tokens.read','{}',NULL,'{}','[]','2025-07-23 05:51:55.526000','2025-07-23 05:51:55.526000','2025-07-23 05:51:55.526000',NULL,NULL,NULL),(130,'j2wx8c9vmn4dxia6q38az89t','admin::api-tokens.update','{}',NULL,'{}','[]','2025-07-23 05:51:55.557000','2025-07-23 05:51:55.557000','2025-07-23 05:51:55.557000',NULL,NULL,NULL),(131,'x1ym1rtu6z4rv16th6j1qf8c','admin::api-tokens.regenerate','{}',NULL,'{}','[]','2025-07-23 05:51:55.623000','2025-07-23 05:51:55.623000','2025-07-23 05:51:55.623000',NULL,NULL,NULL),(132,'sy4t3jccg98wurk1a3794rc4','admin::api-tokens.delete','{}',NULL,'{}','[]','2025-07-23 05:51:55.655000','2025-07-23 05:51:55.655000','2025-07-23 05:51:55.655000',NULL,NULL,NULL),(133,'qagl477x9ydxlvdrtuca0pnk','admin::project-settings.update','{}',NULL,'{}','[]','2025-07-23 05:51:55.694000','2025-07-23 05:51:55.694000','2025-07-23 05:51:55.695000',NULL,NULL,NULL),(134,'fjtjqj9og2el4n1fc1r4200x','admin::project-settings.read','{}',NULL,'{}','[]','2025-07-23 05:51:55.723000','2025-07-23 05:51:55.723000','2025-07-23 05:51:55.723000',NULL,NULL,NULL),(135,'n4ch2yes5xf8qi4al5zfiz9z','admin::transfer.tokens.access','{}',NULL,'{}','[]','2025-07-23 05:51:55.764000','2025-07-23 05:51:55.764000','2025-07-23 05:51:55.764000',NULL,NULL,NULL),(136,'mlo0vgui3shawz2p0prw7pvm','admin::transfer.tokens.create','{}',NULL,'{}','[]','2025-07-23 05:51:55.792000','2025-07-23 05:51:55.792000','2025-07-23 05:51:55.792000',NULL,NULL,NULL),(137,'ttzugk9n9wbvc83jhvxhogye','admin::transfer.tokens.read','{}',NULL,'{}','[]','2025-07-23 05:51:55.825000','2025-07-23 05:51:55.825000','2025-07-23 05:51:55.826000',NULL,NULL,NULL),(138,'l40vxis2dac9m7negktfunnz','admin::transfer.tokens.update','{}',NULL,'{}','[]','2025-07-23 05:51:55.861000','2025-07-23 05:51:55.861000','2025-07-23 05:51:55.861000',NULL,NULL,NULL),(139,'w2w25x0dq9aw409alryw1qny','admin::transfer.tokens.regenerate','{}',NULL,'{}','[]','2025-07-23 05:51:55.893000','2025-07-23 05:51:55.893000','2025-07-23 05:51:55.893000',NULL,NULL,NULL),(140,'o6p1iv2dhlk78pe8o08bb58p','admin::transfer.tokens.delete','{}',NULL,'{}','[]','2025-07-23 05:51:55.926000','2025-07-23 05:51:55.926000','2025-07-23 05:51:55.927000',NULL,NULL,NULL),(148,'lpo73ffylrb4te9cw43f1gsv','plugin::content-manager.explorer.delete','{}','api::site.site','{}','[]','2025-07-29 15:56:24.269000','2025-07-29 15:56:24.269000','2025-07-29 15:56:24.269000',NULL,NULL,NULL),(150,'os9jr1k6fp7g9orzu4l9sqlt','plugin::content-manager.explorer.publish','{}','api::site.site','{}','[]','2025-07-29 15:56:24.333000','2025-07-29 15:56:24.333000','2025-07-29 15:56:24.333000',NULL,NULL,NULL),(160,'s3121x7rlumdbssb7zqsv8j6','plugin::content-manager.explorer.create','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[]','2025-07-29 16:31:40.978000','2025-07-29 16:31:40.978000','2025-07-29 16:31:40.979000',NULL,NULL,NULL),(161,'aqrjrtwp1bn3qu3smyslikn9','plugin::content-manager.explorer.create','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[]','2025-07-29 16:31:41.015000','2025-07-29 16:31:41.015000','2025-07-29 16:31:41.016000',NULL,NULL,NULL),(163,'v5aib5f3bckbvwn3doswe020','plugin::content-manager.explorer.read','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[]','2025-07-29 16:31:41.069000','2025-07-29 16:31:41.069000','2025-07-29 16:31:41.069000',NULL,NULL,NULL),(164,'bywcfspfo5vnqzdbdtsty5qf','plugin::content-manager.explorer.read','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[]','2025-07-29 16:31:41.105000','2025-07-29 16:31:41.105000','2025-07-29 16:31:41.105000',NULL,NULL,NULL),(166,'adb74t44g4hgt5gsyrqyf1xd','plugin::content-manager.explorer.update','{}','api::author.author','{\"fields\": [\"name\", \"avatar\", \"email\"]}','[]','2025-07-29 16:31:41.168000','2025-07-29 16:31:41.168000','2025-07-29 16:31:41.168000',NULL,NULL,NULL),(167,'hnwuf43xvxs4hxopfmbd7ouz','plugin::content-manager.explorer.update','{}','api::category.category','{\"fields\": [\"name\", \"slug\", \"description\"]}','[]','2025-07-29 16:31:41.201000','2025-07-29 16:31:41.201000','2025-07-29 16:31:41.201000',NULL,NULL,NULL),(189,'xwapb9uy68xejclxuujvhwze','plugin::content-manager.explorer.delete','{}','api::navbar.navbar','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-05 21:54:26.651000','2025-08-05 21:54:26.651000','2025-08-05 21:54:26.651000',NULL,NULL,NULL),(190,'udatuvsceuaimc1q6a0svpbq','plugin::content-manager.explorer.publish','{}','api::navbar.navbar','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-05 21:54:26.683000','2025-08-05 21:54:26.683000','2025-08-05 21:54:26.684000',NULL,NULL,NULL),(191,'b12071znzx1h72vftz8i4q75','plugin::content-manager.explorer.create','{}','api::navbar.navbar','{\"fields\": [\"logo\", \"logoAlt\", \"link.label\", \"link.sectionId\", \"site\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-05 21:56:03.156000','2025-08-05 21:56:03.156000','2025-08-05 21:56:03.157000',NULL,NULL,NULL),(192,'ngii5o3uden877djby9y1s0i','plugin::content-manager.explorer.read','{}','api::navbar.navbar','{\"fields\": [\"logo\", \"logoAlt\", \"link.label\", \"link.sectionId\", \"site\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-05 21:56:03.193000','2025-08-05 21:56:03.193000','2025-08-05 21:56:03.193000',NULL,NULL,NULL),(193,'tk4o515n6f81hj438j6lkcpo','plugin::content-manager.explorer.update','{}','api::navbar.navbar','{\"fields\": [\"logo\", \"logoAlt\", \"link.label\", \"link.sectionId\", \"site\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-05 21:56:03.221000','2025-08-05 21:56:03.221000','2025-08-05 21:56:03.221000',NULL,NULL,NULL),(197,'yay22loco99htok2tgquht48','plugin::content-manager.explorer.delete','{}','api::block-faq.block-faq','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:05:36.519000','2025-08-21 22:05:36.519000','2025-08-21 22:05:36.520000',NULL,NULL,NULL),(198,'iuy5wegx0wvyilwpcyhs2o44','plugin::content-manager.explorer.publish','{}','api::block-faq.block-faq','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:05:36.549000','2025-08-21 22:05:36.549000','2025-08-21 22:05:36.550000',NULL,NULL,NULL),(199,'en6vn9kquonyitkp3k0bxfo3','plugin::content-manager.explorer.create','{}','api::block-faq.block-faq','{\"fields\": [\"Faq.question\", \"Faq.answer\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:06:45.665000','2025-08-21 22:06:45.665000','2025-08-21 22:06:45.666000',NULL,NULL,NULL),(200,'jdejgiw78hrbnanhaqolxozi','plugin::content-manager.explorer.read','{}','api::block-faq.block-faq','{\"fields\": [\"Faq.question\", \"Faq.answer\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:06:45.708000','2025-08-21 22:06:45.708000','2025-08-21 22:06:45.708000',NULL,NULL,NULL),(201,'of3kr175pj2ucbara8nyfl2k','plugin::content-manager.explorer.update','{}','api::block-faq.block-faq','{\"fields\": [\"Faq.question\", \"Faq.answer\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:06:45.736000','2025-08-21 22:06:45.736000','2025-08-21 22:06:45.736000',NULL,NULL,NULL),(217,'lv9ts8yo8n3mn07jkysg5jp0','plugin::content-manager.explorer.delete','{}','api::page.page','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:22:30.554000','2025-08-21 22:22:30.554000','2025-08-21 22:22:30.554000',NULL,NULL,NULL),(218,'sl01qp0jff0dr0zcl3pzhgoo','plugin::content-manager.explorer.publish','{}','api::page.page','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:22:30.582000','2025-08-21 22:22:30.582000','2025-08-21 22:22:30.582000',NULL,NULL,NULL),(223,'fe428wkgow4c2efkmflme3rk','plugin::content-manager.explorer.create','{}','api::site.site','{\"fields\": [\"name\", \"slug\", \"domain_us\", \"mx_site\", \"domain_mx\", \"pages\", \"faqs\"]}','[]','2025-08-21 22:30:31.848000','2025-08-21 22:30:31.848000','2025-08-21 22:30:31.849000',NULL,NULL,NULL),(225,'a9yih3i1tnie7z0p1ssbq5e6','plugin::content-manager.explorer.read','{}','api::site.site','{\"fields\": [\"name\", \"slug\", \"domain_us\", \"mx_site\", \"domain_mx\", \"pages\", \"faqs\"]}','[]','2025-08-21 22:30:31.924000','2025-08-21 22:30:31.924000','2025-08-21 22:30:31.924000',NULL,NULL,NULL),(227,'ywr30pqs8jpls7bdzlya6w53','plugin::content-manager.explorer.update','{}','api::site.site','{\"fields\": [\"name\", \"slug\", \"domain_us\", \"mx_site\", \"domain_mx\", \"pages\", \"faqs\"]}','[]','2025-08-21 22:30:31.980000','2025-08-21 22:30:31.980000','2025-08-21 22:30:31.980000',NULL,NULL,NULL),(228,'thtv5qexse3nhwpu00vu0z8f','plugin::content-manager.explorer.delete','{}','api::faq.faq','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:30:32.015000','2025-08-21 22:30:32.015000','2025-08-21 22:30:32.015000',NULL,NULL,NULL),(229,'v15mafvqz9iq3js2cz06jfg1','plugin::content-manager.explorer.publish','{}','api::faq.faq','{\"locales\": [\"en\", \"es\"]}','[]','2025-08-21 22:30:32.048000','2025-08-21 22:30:32.048000','2025-08-21 22:30:32.049000',NULL,NULL,NULL),(245,'iodc1k3owd3mwsmfbayigm0f','plugin::content-manager.explorer.create','{}','api::faq.faq','{\"fields\": [\"site\", \"faq.question\", \"faq.answer\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-22 03:52:13.351000','2025-08-22 03:52:13.351000','2025-08-22 03:52:13.352000',NULL,NULL,NULL),(246,'m3j0agl8kexlnhpn5srcs7u6','plugin::content-manager.explorer.create','{}','api::page.page','{\"fields\": [\"slug\", \"site\", \"page\", \"title\", \"page_structure\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-22 03:52:13.398000','2025-08-22 03:52:13.398000','2025-08-22 03:52:13.399000',NULL,NULL,NULL),(247,'uah67384swy9awy48z6s2kp9','plugin::content-manager.explorer.read','{}','api::faq.faq','{\"fields\": [\"site\", \"faq.question\", \"faq.answer\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-22 03:52:13.431000','2025-08-22 03:52:13.431000','2025-08-22 03:52:13.431000',NULL,NULL,NULL),(248,'s2xaxu8dwdl1uhnulmsjok9w','plugin::content-manager.explorer.read','{}','api::page.page','{\"fields\": [\"slug\", \"site\", \"page\", \"title\", \"page_structure\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-22 03:52:13.461000','2025-08-22 03:52:13.461000','2025-08-22 03:52:13.461000',NULL,NULL,NULL),(249,'czocvesz7i9zhoprhpl6eqxx','plugin::content-manager.explorer.update','{}','api::faq.faq','{\"fields\": [\"site\", \"faq.question\", \"faq.answer\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-22 03:52:13.499000','2025-08-22 03:52:13.499000','2025-08-22 03:52:13.499000',NULL,NULL,NULL),(250,'iyo3b9mesaljc8xgj617ivse','plugin::content-manager.explorer.update','{}','api::page.page','{\"fields\": [\"slug\", \"site\", \"page\", \"title\", \"page_structure\"], \"locales\": [\"en\", \"es\"]}','[]','2025-08-22 03:52:13.540000','2025-08-22 03:52:13.540000','2025-08-22 03:52:13.540000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions_role_lnk`
--

DROP TABLE IF EXISTS `admin_permissions_role_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions_role_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_lnk_fk` (`permission_id`),
  KEY `admin_permissions_role_lnk_ifk` (`role_id`),
  KEY `admin_permissions_role_lnk_oifk` (`permission_ord`),
  CONSTRAINT `admin_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions_role_lnk`
--

LOCK TABLES `admin_permissions_role_lnk` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_lnk` DISABLE KEYS */;
INSERT INTO `admin_permissions_role_lnk` VALUES (1,1,2,1),(3,3,2,3),(4,4,2,4),(5,5,2,5),(6,6,2,6),(8,8,2,8),(9,9,2,9),(10,10,2,10),(11,11,2,11),(13,13,2,13),(14,14,2,14),(15,15,2,15),(16,16,2,16),(18,18,2,18),(19,19,2,19),(20,20,2,20),(21,21,2,21),(23,23,2,23),(24,24,2,24),(25,25,2,25),(26,26,2,26),(27,27,2,27),(28,28,2,28),(29,29,2,29),(30,30,2,30),(31,31,2,31),(32,32,3,1),(34,34,3,3),(35,35,3,4),(36,36,3,5),(37,37,3,6),(39,39,3,8),(40,40,3,9),(41,41,3,10),(42,42,3,11),(44,44,3,13),(45,45,3,14),(46,46,3,15),(47,47,3,16),(49,49,3,18),(50,50,3,19),(51,51,3,20),(52,52,3,21),(53,53,3,22),(54,54,3,23),(55,55,3,24),(56,56,3,25),(57,57,3,26),(58,58,1,1),(59,59,1,2),(63,63,1,6),(64,64,1,7),(65,65,1,8),(69,69,1,12),(70,70,1,13),(71,71,1,14),(75,75,1,18),(76,76,1,19),(77,77,1,20),(79,79,1,22),(80,80,1,23),(81,81,1,24),(82,82,1,25),(83,83,1,26),(85,85,1,28),(86,86,1,29),(87,87,1,30),(88,88,1,31),(89,89,1,32),(90,90,1,33),(91,91,1,34),(92,92,1,35),(93,93,1,36),(94,94,1,37),(95,95,1,38),(96,96,1,39),(97,97,1,40),(98,98,1,41),(99,99,1,42),(100,100,1,43),(101,101,1,44),(102,102,1,45),(103,103,1,46),(104,104,1,47),(105,105,1,48),(106,106,1,49),(107,107,1,50),(108,108,1,51),(109,109,1,52),(110,110,1,53),(111,111,1,54),(112,112,1,55),(113,113,1,56),(114,114,1,57),(115,115,1,58),(116,116,1,59),(117,117,1,60),(118,118,1,61),(119,119,1,62),(120,120,1,63),(121,121,1,64),(122,122,1,65),(123,123,1,66),(124,124,1,67),(125,125,1,68),(126,126,1,69),(127,127,1,70),(128,128,1,71),(129,129,1,72),(130,130,1,73),(131,131,1,74),(132,132,1,75),(133,133,1,76),(134,134,1,77),(135,135,1,78),(136,136,1,79),(137,137,1,80),(138,138,1,81),(139,139,1,82),(140,140,1,83),(148,148,1,91),(150,150,1,93),(160,160,1,100),(161,161,1,101),(163,163,1,103),(164,164,1,104),(166,166,1,106),(167,167,1,107),(194,189,1,119),(195,190,1,120),(196,191,1,121),(197,192,1,122),(198,193,1,123),(202,197,1,127),(203,198,1,128),(204,199,1,129),(205,200,1,130),(206,201,1,131),(222,217,1,143),(223,218,1,144),(228,223,1,149),(230,225,1,151),(232,227,1,153),(233,228,1,154),(234,229,1,155),(250,245,1,156),(251,246,1,157),(252,247,1,158),(253,248,1,159),(254,249,1,160),(255,250,1,161);
/*!40000 ALTER TABLE `admin_permissions_role_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'a1rhfi6h7ow9xunupeahwo5e','Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2025-07-23 05:51:48.168000','2025-07-23 05:51:48.168000','2025-07-23 05:51:48.169000',NULL,NULL,NULL),(2,'j8oln4cyhrm0xext1h73jwke','Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2025-07-23 05:51:48.199000','2025-07-23 05:51:48.199000','2025-07-23 05:51:48.199000',NULL,NULL,NULL),(3,'sygy4fnzzwt0cd8mssfaeshv','Author','strapi-author','Authors can manage the content they have created.','2025-07-23 05:51:48.223000','2025-07-23 05:51:48.223000','2025-07-23 05:51:48.223000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'fkl4pvu5ha4dvvbqudi969yg','Jorge','Sanchez',NULL,'jorge.sanchez@adh.com','$2a$10$PPJJBI02E4wXUBPqsTMKx.2tFhc83Blla2x3pEOuz6qWlfQX1clPO',NULL,NULL,1,0,NULL,'2025-07-24 14:44:50.647000','2025-07-24 14:44:50.647000','2025-07-24 14:44:50.649000',NULL,NULL,NULL),(2,'b9069u2uqj75ouvfnok9zoi2','Diego','Del Vecchio',NULL,'diego.delvecchio@grupobd.mx','$2a$10$jg1XZTERqLfI7kiZ.Zfn..4n9Z4znKEaodGe4iwyTUBE3fhypXfg6',NULL,NULL,1,0,NULL,'2025-08-05 22:15:55.156000','2025-08-05 22:16:48.516000','2025-08-05 22:15:55.157000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users_roles_lnk`
--

DROP TABLE IF EXISTS `admin_users_roles_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users_roles_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `role_ord` double unsigned DEFAULT NULL,
  `user_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_lnk_uq` (`user_id`,`role_id`),
  KEY `admin_users_roles_lnk_fk` (`user_id`),
  KEY `admin_users_roles_lnk_ifk` (`role_id`),
  KEY `admin_users_roles_lnk_ofk` (`role_ord`),
  KEY `admin_users_roles_lnk_oifk` (`user_ord`),
  CONSTRAINT `admin_users_roles_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users_roles_lnk`
--

LOCK TABLES `admin_users_roles_lnk` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_lnk` DISABLE KEYS */;
INSERT INTO `admin_users_roles_lnk` VALUES (1,1,1,1,1),(2,2,1,1,2);
/*!40000 ALTER TABLE `admin_users_roles_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authors_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `authors_created_by_id_fk` (`created_by_id`),
  KEY `authors_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `authors_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `authors_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'jat2kn3tdcx40lsd0z4yleah','David Doe','daviddoe@strapi.io','2025-07-23 05:51:57.121000','2025-07-23 05:51:57.121000','2025-07-23 05:51:57.116000',NULL,NULL,NULL),(2,'xckaexqq9ko163r0wjsz99qp','Sarah Baker','sarahbaker@strapi.io','2025-07-23 05:51:58.126000','2025-07-23 05:51:58.126000','2025-07-23 05:51:58.107000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_faqs`
--

DROP TABLE IF EXISTS `block_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `block_faqs_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `block_faqs_created_by_id_fk` (`created_by_id`),
  KEY `block_faqs_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `block_faqs_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `block_faqs_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_faqs`
--

LOCK TABLES `block_faqs` WRITE;
/*!40000 ALTER TABLE `block_faqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block_faqs_cmps`
--

DROP TABLE IF EXISTS `block_faqs_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block_faqs_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_faqs_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `block_faqs_field_idx` (`field`),
  KEY `block_faqs_component_type_idx` (`component_type`),
  KEY `block_faqs_entity_fk` (`entity_id`),
  CONSTRAINT `block_faqs_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `block_faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block_faqs_cmps`
--

LOCK TABLES `block_faqs_cmps` WRITE;
/*!40000 ALTER TABLE `block_faqs_cmps` DISABLE KEYS */;
/*!40000 ALTER TABLE `block_faqs_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `categories_created_by_id_fk` (`created_by_id`),
  KEY `categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'okua4pi1l9uwf9s2xige7htj','news','news',NULL,'2025-07-23 05:51:56.315000','2025-07-23 05:51:56.315000','2025-07-23 05:51:56.301000',NULL,NULL,NULL),(2,'lc2b4bx08mlb15hlyt2cna0g','tech','tech',NULL,'2025-07-23 05:51:56.338000','2025-07-23 05:51:56.338000','2025-07-23 05:51:56.332000',NULL,NULL,NULL),(3,'h65bit7t7ictdtpfzfdis9j1','food','food',NULL,'2025-07-23 05:51:56.365000','2025-07-23 05:51:56.365000','2025-07-23 05:51:56.362000',NULL,NULL,NULL),(4,'ihghoul8sp0tptlj8dtde0pz','nature','nature',NULL,'2025-07-23 05:51:56.390000','2025-07-23 05:51:56.390000','2025-07-23 05:51:56.388000',NULL,NULL,NULL),(5,'fwmeh77begpfvw69k8xrhz91','story','story',NULL,'2025-07-23 05:51:56.419000','2025-07-23 05:51:56.419000','2025-07-23 05:51:56.414000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_blocks_heroes`
--

DROP TABLE IF EXISTS `components_blocks_heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_blocks_heroes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_blocks_heroes`
--

LOCK TABLES `components_blocks_heroes` WRITE;
/*!40000 ALTER TABLE `components_blocks_heroes` DISABLE KEYS */;
INSERT INTO `components_blocks_heroes` VALUES (1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `components_blocks_heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_blocks_heroes_cmps`
--

DROP TABLE IF EXISTS `components_blocks_heroes_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_blocks_heroes_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_blocks_heroes_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_blocks_heroes_field_idx` (`field`),
  KEY `components_blocks_heroes_component_type_idx` (`component_type`),
  KEY `components_blocks_heroes_entity_fk` (`entity_id`),
  CONSTRAINT `components_blocks_heroes_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_blocks_heroes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_blocks_heroes_cmps`
--

LOCK TABLES `components_blocks_heroes_cmps` WRITE;
/*!40000 ALTER TABLE `components_blocks_heroes_cmps` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_blocks_heroes_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_faq_faqs`
--

DROP TABLE IF EXISTS `components_faq_faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_faq_faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_faq_faqs`
--

LOCK TABLES `components_faq_faqs` WRITE;
/*!40000 ALTER TABLE `components_faq_faqs` DISABLE KEYS */;
INSERT INTO `components_faq_faqs` VALUES (1,'question 1','answer 1'),(2,'question 2','answer 2'),(3,'pregunta 1','respuesta 1'),(4,'pregunta 2','respuesta 2'),(5,'question 1','answer 1'),(6,'question 2','answer 2'),(7,'question 1','answer 1'),(8,'question 2','answer 2'),(9,'pregunta 1','respuesta 1'),(10,'pregunta 2','respuesta 2'),(11,'question 1','answer 1'),(12,'question 1','answer 1'),(13,'question 1','answer 1'),(14,'question 1','answer 1'),(15,'question 2','answer 2'),(20,'question 1','answer 1'),(23,'pregunta 1','respuesta 1'),(24,'pregunta 2','respuesta 2');
/*!40000 ALTER TABLE `components_faq_faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_buttons`
--

DROP TABLE IF EXISTS `components_shared_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_buttons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `has_class` tinyint(1) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `has_css` tinyint(1) DEFAULT NULL,
  `css` longtext,
  `sort` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_buttons`
--

LOCK TABLES `components_shared_buttons` WRITE;
/*!40000 ALTER TABLE `components_shared_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_shared_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_media`
--

DROP TABLE IF EXISTS `components_shared_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_media`
--

LOCK TABLES `components_shared_media` WRITE;
/*!40000 ALTER TABLE `components_shared_media` DISABLE KEYS */;
INSERT INTO `components_shared_media` VALUES (1),(2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `components_shared_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_nav_links`
--

DROP TABLE IF EXISTS `components_shared_nav_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_nav_links` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `section_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_nav_links`
--

LOCK TABLES `components_shared_nav_links` WRITE;
/*!40000 ALTER TABLE `components_shared_nav_links` DISABLE KEYS */;
INSERT INTO `components_shared_nav_links` VALUES (1,'HOME','hero'),(2,'MEMBERSHIPS -','memberships'),(3,'FAQ','faq'),(4,'CONTACT','contact'),(9,'INICIO','hero'),(10,'MEMBRESIAS','memberships'),(11,'FAQS','faq'),(12,'CONTACTO','contact'),(25,'INICIO','hero'),(26,'MEMBRESIAS','memberships'),(27,'FAQS','faq'),(28,'CONTACTO','contact'),(29,'HOME','hero'),(30,'MEMBERSHIPS -','memberships'),(31,'FAQ','faq'),(32,'CONTACT','contact');
/*!40000 ALTER TABLE `components_shared_nav_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_quotes`
--

DROP TABLE IF EXISTS `components_shared_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_quotes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_quotes`
--

LOCK TABLES `components_shared_quotes` WRITE;
/*!40000 ALTER TABLE `components_shared_quotes` DISABLE KEYS */;
INSERT INTO `components_shared_quotes` VALUES (1,'Thelonius Monk','You\'ve got to dig it to dig it, you dig?'),(2,'Thelonius Monk','You\'ve got to dig it to dig it, you dig?'),(3,'Thelonius Monk','You\'ve got to dig it to dig it, you dig?'),(4,'Thelonius Monk','You\'ve got to dig it to dig it, you dig?'),(5,'Thelonius Monk','You\'ve got to dig it to dig it, you dig?'),(6,'Thelonius Monk','You\'ve got to dig it to dig it, you dig?');
/*!40000 ALTER TABLE `components_shared_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_rich_texts`
--

DROP TABLE IF EXISTS `components_shared_rich_texts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_rich_texts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_rich_texts`
--

LOCK TABLES `components_shared_rich_texts` WRITE;
/*!40000 ALTER TABLE `components_shared_rich_texts` DISABLE KEYS */;
INSERT INTO `components_shared_rich_texts` VALUES (1,'## Probant \n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. \n\n## Abit sua\n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. '),(2,'## Spatiantia astra \n\nFoeda, medio silva *errandum*: onus formam munere. Mutata bibulis est auxiliare arces etiamnunc verbis virgineo Priamidas illa Thescelus, nam fit locis lucis auras. Exitus hospes gratulor ut pondere [speslimite](http://www.curas.io/figuram); quid habent, Avernales faciente de. Pervenit Ino sonabile supplex cognoscenti vires, Bacchumque errat miserarum venandi dignabere dedisti. Discrimina iuncosaque virgaque tot sine superest [fissus](http://quos.org/sitet.aspx). Non color esset potest non sumit, sed vix arserat. Nisi immo silva tantum pectusque quos pennis quisquam artus!'),(3,'## Probant \n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. \n\n## Abit sua\n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. '),(4,'## Spatiantia astra \n\nFoeda, medio silva *errandum*: onus formam munere. Mutata bibulis est auxiliare arces etiamnunc verbis virgineo Priamidas illa Thescelus, nam fit locis lucis auras. Exitus hospes gratulor ut pondere [speslimite](http://www.curas.io/figuram); quid habent, Avernales faciente de. Pervenit Ino sonabile supplex cognoscenti vires, Bacchumque errat miserarum venandi dignabere dedisti. Discrimina iuncosaque virgaque tot sine superest [fissus](http://quos.org/sitet.aspx). Non color esset potest non sumit, sed vix arserat. Nisi immo silva tantum pectusque quos pennis quisquam artus!'),(5,'## Probant \n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. \n\n## Abit sua\n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. '),(6,'## Spatiantia astra \n\nFoeda, medio silva *errandum*: onus formam munere. Mutata bibulis est auxiliare arces etiamnunc verbis virgineo Priamidas illa Thescelus, nam fit locis lucis auras. Exitus hospes gratulor ut pondere [speslimite](http://www.curas.io/figuram); quid habent, Avernales faciente de. Pervenit Ino sonabile supplex cognoscenti vires, Bacchumque errat miserarum venandi dignabere dedisti. Discrimina iuncosaque virgaque tot sine superest [fissus](http://quos.org/sitet.aspx). Non color esset potest non sumit, sed vix arserat. Nisi immo silva tantum pectusque quos pennis quisquam artus!'),(7,'## Probant \n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. \n\n## Abit sua\n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. '),(8,'## Spatiantia astra \n\nFoeda, medio silva *errandum*: onus formam munere. Mutata bibulis est auxiliare arces etiamnunc verbis virgineo Priamidas illa Thescelus, nam fit locis lucis auras. Exitus hospes gratulor ut pondere [speslimite](http://www.curas.io/figuram); quid habent, Avernales faciente de. Pervenit Ino sonabile supplex cognoscenti vires, Bacchumque errat miserarum venandi dignabere dedisti. Discrimina iuncosaque virgaque tot sine superest [fissus](http://quos.org/sitet.aspx). Non color esset potest non sumit, sed vix arserat. Nisi immo silva tantum pectusque quos pennis quisquam artus!'),(9,'## Probant \n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. \n\n## Abit sua\n\nse Lorem markdownum negat. Argo *saxa* videnda cornuaque hunc qui tanta spes teneas! Obliquis est dicenti est salutat ille tamen iuvenum nostrae dolore. - Colores nocituraque comitata eripiunt - Addit quodcunque solum cui et dextram illis - Nulli meus nec extemplo ille ferebat pressit Se blandita fulvae vox gravem Pittheus cesserunt sanguine herbis tu comitum tenuit. Sui in ruunt; Doridaque maculosae fuissem! Et loqui. '),(10,'## Spatiantia astra \n\nFoeda, medio silva *errandum*: onus formam munere. Mutata bibulis est auxiliare arces etiamnunc verbis virgineo Priamidas illa Thescelus, nam fit locis lucis auras. Exitus hospes gratulor ut pondere [speslimite](http://www.curas.io/figuram); quid habent, Avernales faciente de. Pervenit Ino sonabile supplex cognoscenti vires, Bacchumque errat miserarum venandi dignabere dedisti. Discrimina iuncosaque virgaque tot sine superest [fissus](http://quos.org/sitet.aspx). Non color esset potest non sumit, sed vix arserat. Nisi immo silva tantum pectusque quos pennis quisquam artus!'),(11,'## Dedit imago conspicuus cum capillis totidem inhibere\n\nLorem markdownum **rerum**, est limine: columbas: ab infelix hostem arbore nudis\ncrudelis. Videtur reliquit ambo ferrum dote sub amne fatis **illuc**, in magis,\nnec.'),(12,NULL),(14,NULL),(15,'**HOLA**\n\nEsta es una prueba con enumeraciones:\n\n- La primera\n- La segunda\n- La tercera'),(17,'**HOLA**\n\nEsta es una prueba con enumeraciones:\n\n- La primera\n- La segunda\n- La tercera');
/*!40000 ALTER TABLE `components_shared_rich_texts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_seos`
--

DROP TABLE IF EXISTS `components_shared_seos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_seos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_seos`
--

LOCK TABLES `components_shared_seos` WRITE;
/*!40000 ALTER TABLE `components_shared_seos` DISABLE KEYS */;
INSERT INTO `components_shared_seos` VALUES (1,'Page','A blog made with Strapi');
/*!40000 ALTER TABLE `components_shared_seos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_shared_sliders`
--

DROP TABLE IF EXISTS `components_shared_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_shared_sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_shared_sliders`
--

LOCK TABLES `components_shared_sliders` WRITE;
/*!40000 ALTER TABLE `components_shared_sliders` DISABLE KEYS */;
INSERT INTO `components_shared_sliders` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `components_shared_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `faqs_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `faqs_created_by_id_fk` (`created_by_id`),
  KEY `faqs_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `faqs_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `faqs_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'t34x6n8kaeu09etfu6zcy2rd','2025-08-21 22:33:53.564000','2025-08-21 22:33:53.564000',NULL,1,1,'en'),(2,'t34x6n8kaeu09etfu6zcy2rd','2025-08-21 22:34:17.491000','2025-08-21 22:34:17.491000',NULL,1,1,'es'),(3,'t34x6n8kaeu09etfu6zcy2rd','2025-08-21 22:33:53.564000','2025-08-21 22:33:53.564000','2025-08-21 22:34:47.454000',1,1,'en');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_cmps`
--

DROP TABLE IF EXISTS `faqs_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faqs_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `faqs_field_idx` (`field`),
  KEY `faqs_component_type_idx` (`component_type`),
  KEY `faqs_entity_fk` (`entity_id`),
  CONSTRAINT `faqs_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_cmps`
--

LOCK TABLES `faqs_cmps` WRITE;
/*!40000 ALTER TABLE `faqs_cmps` DISABLE KEYS */;
INSERT INTO `faqs_cmps` VALUES (1,1,1,'faq.faq','faq',1),(2,1,2,'faq.faq','faq',2),(3,2,3,'faq.faq','faq',1),(4,2,4,'faq.faq','faq',2),(5,3,5,'faq.faq','faq',1),(6,3,6,'faq.faq','faq',2);
/*!40000 ALTER TABLE `faqs_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_site_lnk`
--

DROP TABLE IF EXISTS `faqs_site_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_site_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `faq_id` int unsigned DEFAULT NULL,
  `site_id` int unsigned DEFAULT NULL,
  `faq_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faqs_site_lnk_uq` (`faq_id`,`site_id`),
  KEY `faqs_site_lnk_fk` (`faq_id`),
  KEY `faqs_site_lnk_ifk` (`site_id`),
  KEY `faqs_site_lnk_oifk` (`faq_ord`),
  CONSTRAINT `faqs_site_lnk_fk` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `faqs_site_lnk_ifk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_site_lnk`
--

LOCK TABLES `faqs_site_lnk` WRITE;
/*!40000 ALTER TABLE `faqs_site_lnk` DISABLE KEYS */;
INSERT INTO `faqs_site_lnk` VALUES (1,1,1,1),(2,2,1,2),(3,3,6,1);
/*!40000 ALTER TABLE `faqs_site_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `formats` json DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` json DEFAULT NULL,
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'jc0gcvewn6vkj28v8dwhwa13','daviddoe@strapi','An image uploaded to Strapi called daviddoe@strapi','daviddoe@strapi',2418,2711,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_daviddoe_strapi_a7b0581b0a.jpeg\", \"hash\": \"large_daviddoe_strapi_a7b0581b0a\", \"mime\": \"image/jpeg\", \"name\": \"large_daviddoe@strapi\", \"path\": null, \"size\": 74.82, \"width\": 892, \"height\": 1000, \"sizeInBytes\": 74823}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_daviddoe_strapi_a7b0581b0a.jpeg\", \"hash\": \"small_daviddoe_strapi_a7b0581b0a\", \"mime\": \"image/jpeg\", \"name\": \"small_daviddoe@strapi\", \"path\": null, \"size\": 22.43, \"width\": 446, \"height\": 500, \"sizeInBytes\": 22427}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_daviddoe_strapi_a7b0581b0a.jpeg\", \"hash\": \"medium_daviddoe_strapi_a7b0581b0a\", \"mime\": \"image/jpeg\", \"name\": \"medium_daviddoe@strapi\", \"path\": null, \"size\": 44.32, \"width\": 669, \"height\": 750, \"sizeInBytes\": 44315}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_daviddoe_strapi_a7b0581b0a.jpeg\", \"hash\": \"thumbnail_daviddoe_strapi_a7b0581b0a\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_daviddoe@strapi\", \"path\": null, \"size\": 4.2, \"width\": 139, \"height\": 156, \"sizeInBytes\": 4201}}','daviddoe_strapi_a7b0581b0a','.jpeg','image/jpeg',587.69,'/uploads/daviddoe_strapi_a7b0581b0a.jpeg',NULL,'local',NULL,'/','2025-07-23 05:51:57.092000','2025-07-23 05:51:57.092000','2025-07-23 05:51:57.095000',NULL,NULL,NULL),(2,'k7dei5jdrqfltezm5dxapl1s','sarahbaker@strapi','An image uploaded to Strapi called sarahbaker@strapi','sarahbaker@strapi',3321,2746,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_sarahbaker_strapi_203a6798a0.jpeg\", \"hash\": \"large_sarahbaker_strapi_203a6798a0\", \"mime\": \"image/jpeg\", \"name\": \"large_sarahbaker@strapi\", \"path\": null, \"size\": 101.83, \"width\": 1000, \"height\": 827, \"sizeInBytes\": 101826}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_sarahbaker_strapi_203a6798a0.jpeg\", \"hash\": \"small_sarahbaker_strapi_203a6798a0\", \"mime\": \"image/jpeg\", \"name\": \"small_sarahbaker@strapi\", \"path\": null, \"size\": 30.54, \"width\": 500, \"height\": 413, \"sizeInBytes\": 30537}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_sarahbaker_strapi_203a6798a0.jpeg\", \"hash\": \"medium_sarahbaker_strapi_203a6798a0\", \"mime\": \"image/jpeg\", \"name\": \"medium_sarahbaker@strapi\", \"path\": null, \"size\": 61.49, \"width\": 750, \"height\": 620, \"sizeInBytes\": 61487}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_sarahbaker_strapi_203a6798a0.jpeg\", \"hash\": \"thumbnail_sarahbaker_strapi_203a6798a0\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_sarahbaker@strapi\", \"path\": null, \"size\": 6.68, \"width\": 189, \"height\": 156, \"sizeInBytes\": 6684}}','sarahbaker_strapi_203a6798a0','.jpeg','image/jpeg',795.13,'/uploads/sarahbaker_strapi_203a6798a0.jpeg',NULL,'local',NULL,'/','2025-07-23 05:51:58.057000','2025-07-23 05:51:58.057000','2025-07-23 05:51:58.057000',NULL,NULL,NULL),(3,'g3drwhocy14qbb6y8voutiu4','the-internet-s-own-boy','An image uploaded to Strapi called the-internet-s-own-boy','the-internet-s-own-boy',1200,707,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_the_internet_s_own_boy_49e5291a57.jpeg\", \"hash\": \"large_the_internet_s_own_boy_49e5291a57\", \"mime\": \"image/jpeg\", \"name\": \"large_the-internet-s-own-boy\", \"path\": null, \"size\": 70.12, \"width\": 1000, \"height\": 589, \"sizeInBytes\": 70123}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_the_internet_s_own_boy_49e5291a57.jpeg\", \"hash\": \"small_the_internet_s_own_boy_49e5291a57\", \"mime\": \"image/jpeg\", \"name\": \"small_the-internet-s-own-boy\", \"path\": null, \"size\": 25.18, \"width\": 500, \"height\": 295, \"sizeInBytes\": 25184}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_the_internet_s_own_boy_49e5291a57.jpeg\", \"hash\": \"medium_the_internet_s_own_boy_49e5291a57\", \"mime\": \"image/jpeg\", \"name\": \"medium_the-internet-s-own-boy\", \"path\": null, \"size\": 45.97, \"width\": 750, \"height\": 442, \"sizeInBytes\": 45972}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_the_internet_s_own_boy_49e5291a57.jpeg\", \"hash\": \"thumbnail_the_internet_s_own_boy_49e5291a57\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_the-internet-s-own-boy\", \"path\": null, \"size\": 8.36, \"width\": 245, \"height\": 144, \"sizeInBytes\": 8363}}','the_internet_s_own_boy_49e5291a57','.jpeg','image/jpeg',91.55,'/uploads/the_internet_s_own_boy_49e5291a57.jpeg',NULL,'local',NULL,'/','2025-07-23 05:51:58.325000','2025-07-23 05:51:58.325000','2025-07-23 05:51:58.326000',NULL,NULL,NULL),(4,'ri5qkjw1u5yp4vbxah7oke9o','coffee-art','An image uploaded to Strapi called coffee-art','coffee-art',5824,3259,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_coffee_art_7f6cb54126.jpeg\", \"hash\": \"large_coffee_art_7f6cb54126\", \"mime\": \"image/jpeg\", \"name\": \"large_coffee-art\", \"path\": null, \"size\": 40.76, \"width\": 1000, \"height\": 559, \"sizeInBytes\": 40757}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_coffee_art_7f6cb54126.jpeg\", \"hash\": \"small_coffee_art_7f6cb54126\", \"mime\": \"image/jpeg\", \"name\": \"small_coffee-art\", \"path\": null, \"size\": 15.26, \"width\": 500, \"height\": 280, \"sizeInBytes\": 15256}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_coffee_art_7f6cb54126.jpeg\", \"hash\": \"medium_coffee_art_7f6cb54126\", \"mime\": \"image/jpeg\", \"name\": \"medium_coffee-art\", \"path\": null, \"size\": 27.05, \"width\": 750, \"height\": 419, \"sizeInBytes\": 27046}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_coffee_art_7f6cb54126.jpeg\", \"hash\": \"thumbnail_coffee_art_7f6cb54126\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_coffee-art\", \"path\": null, \"size\": 5.86, \"width\": 245, \"height\": 137, \"sizeInBytes\": 5855}}','coffee_art_7f6cb54126','.jpeg','image/jpeg',978.11,'/uploads/coffee_art_7f6cb54126.jpeg',NULL,'local',NULL,'/','2025-07-23 05:52:00.169000','2025-07-23 05:52:00.169000','2025-07-23 05:52:00.169000',NULL,NULL,NULL),(5,'ycxlcaao13s0ov4wz8zsp8ah','coffee-beans','An image uploaded to Strapi called coffee-beans','coffee-beans',5021,3347,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_coffee_beans_a2ef18f21b.jpeg\", \"hash\": \"large_coffee_beans_a2ef18f21b\", \"mime\": \"image/jpeg\", \"name\": \"large_coffee-beans\", \"path\": null, \"size\": 115.63, \"width\": 1000, \"height\": 666, \"sizeInBytes\": 115625}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_coffee_beans_a2ef18f21b.jpeg\", \"hash\": \"small_coffee_beans_a2ef18f21b\", \"mime\": \"image/jpeg\", \"name\": \"small_coffee-beans\", \"path\": null, \"size\": 31.12, \"width\": 500, \"height\": 333, \"sizeInBytes\": 31119}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_coffee_beans_a2ef18f21b.jpeg\", \"hash\": \"medium_coffee_beans_a2ef18f21b\", \"mime\": \"image/jpeg\", \"name\": \"medium_coffee-beans\", \"path\": null, \"size\": 67.8, \"width\": 750, \"height\": 500, \"sizeInBytes\": 67800}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_coffee_beans_a2ef18f21b.jpeg\", \"hash\": \"thumbnail_coffee_beans_a2ef18f21b\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_coffee-beans\", \"path\": null, \"size\": 7.97, \"width\": 234, \"height\": 156, \"sizeInBytes\": 7969}}','coffee_beans_a2ef18f21b','.jpeg','image/jpeg',2346.20,'/uploads/coffee_beans_a2ef18f21b.jpeg',NULL,'local',NULL,'/','2025-07-23 05:52:02.460000','2025-07-23 05:52:02.460000','2025-07-23 05:52:02.460000',NULL,NULL,NULL),(6,'sbbajb2q6wjzettgxhr9mike','this-shrimp-is-awesome','An image uploaded to Strapi called this-shrimp-is-awesome','this-shrimp-is-awesome',1200,630,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_this_shrimp_is_awesome_76870efc60.jpeg\", \"hash\": \"large_this_shrimp_is_awesome_76870efc60\", \"mime\": \"image/jpeg\", \"name\": \"large_this-shrimp-is-awesome\", \"path\": null, \"size\": 72.91, \"width\": 1000, \"height\": 525, \"sizeInBytes\": 72911}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_this_shrimp_is_awesome_76870efc60.jpeg\", \"hash\": \"small_this_shrimp_is_awesome_76870efc60\", \"mime\": \"image/jpeg\", \"name\": \"small_this-shrimp-is-awesome\", \"path\": null, \"size\": 27.02, \"width\": 500, \"height\": 263, \"sizeInBytes\": 27016}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_this_shrimp_is_awesome_76870efc60.jpeg\", \"hash\": \"medium_this_shrimp_is_awesome_76870efc60\", \"mime\": \"image/jpeg\", \"name\": \"medium_this-shrimp-is-awesome\", \"path\": null, \"size\": 48.24, \"width\": 750, \"height\": 394, \"sizeInBytes\": 48237}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_this_shrimp_is_awesome_76870efc60.jpeg\", \"hash\": \"thumbnail_this_shrimp_is_awesome_76870efc60\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_this-shrimp-is-awesome\", \"path\": null, \"size\": 9.63, \"width\": 245, \"height\": 129, \"sizeInBytes\": 9629}}','this_shrimp_is_awesome_76870efc60','.jpeg','image/jpeg',95.48,'/uploads/this_shrimp_is_awesome_76870efc60.jpeg',NULL,'local',NULL,'/','2025-07-23 05:52:02.707000','2025-07-23 05:52:02.707000','2025-07-23 05:52:02.708000',NULL,NULL,NULL),(7,'zeyr7pyqdpfpab3vegtxx6yp','a-bug-is-becoming-a-meme-on-the-internet','An image uploaded to Strapi called a-bug-is-becoming-a-meme-on-the-internet','a-bug-is-becoming-a-meme-on-the-internet',3628,2419,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_a_bug_is_becoming_a_meme_on_the_internet_843114dca6.jpeg\", \"hash\": \"large_a_bug_is_becoming_a_meme_on_the_internet_843114dca6\", \"mime\": \"image/jpeg\", \"name\": \"large_a-bug-is-becoming-a-meme-on-the-internet\", \"path\": null, \"size\": 50.97, \"width\": 1000, \"height\": 666, \"sizeInBytes\": 50972}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_a_bug_is_becoming_a_meme_on_the_internet_843114dca6.jpeg\", \"hash\": \"small_a_bug_is_becoming_a_meme_on_the_internet_843114dca6\", \"mime\": \"image/jpeg\", \"name\": \"small_a-bug-is-becoming-a-meme-on-the-internet\", \"path\": null, \"size\": 19.25, \"width\": 500, \"height\": 333, \"sizeInBytes\": 19245}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_a_bug_is_becoming_a_meme_on_the_internet_843114dca6.jpeg\", \"hash\": \"medium_a_bug_is_becoming_a_meme_on_the_internet_843114dca6\", \"mime\": \"image/jpeg\", \"name\": \"medium_a-bug-is-becoming-a-meme-on-the-internet\", \"path\": null, \"size\": 33.59, \"width\": 750, \"height\": 500, \"sizeInBytes\": 33590}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_a_bug_is_becoming_a_meme_on_the_internet_843114dca6.jpeg\", \"hash\": \"thumbnail_a_bug_is_becoming_a_meme_on_the_internet_843114dca6\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_a-bug-is-becoming-a-meme-on-the-internet\", \"path\": null, \"size\": 6.73, \"width\": 234, \"height\": 156, \"sizeInBytes\": 6728}}','a_bug_is_becoming_a_meme_on_the_internet_843114dca6','.jpeg','image/jpeg',234.02,'/uploads/a_bug_is_becoming_a_meme_on_the_internet_843114dca6.jpeg',NULL,'local',NULL,'/','2025-07-23 05:52:03.484000','2025-07-23 05:52:03.484000','2025-07-23 05:52:03.484000',NULL,NULL,NULL),(8,'agn2tqxq2qh5oqxisd6x1nuh','beautiful-picture','An image uploaded to Strapi called beautiful-picture','beautiful-picture',3824,2548,'{\"large\": {\"ext\": \".jpeg\", \"url\": \"/uploads/large_beautiful_picture_fddb6b1026.jpeg\", \"hash\": \"large_beautiful_picture_fddb6b1026\", \"mime\": \"image/jpeg\", \"name\": \"large_beautiful-picture\", \"path\": null, \"size\": 83.36, \"width\": 1000, \"height\": 666, \"sizeInBytes\": 83355}, \"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_beautiful_picture_fddb6b1026.jpeg\", \"hash\": \"small_beautiful_picture_fddb6b1026\", \"mime\": \"image/jpeg\", \"name\": \"small_beautiful-picture\", \"path\": null, \"size\": 23.35, \"width\": 500, \"height\": 333, \"sizeInBytes\": 23351}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_beautiful_picture_fddb6b1026.jpeg\", \"hash\": \"medium_beautiful_picture_fddb6b1026\", \"mime\": \"image/jpeg\", \"name\": \"medium_beautiful-picture\", \"path\": null, \"size\": 47.81, \"width\": 750, \"height\": 500, \"sizeInBytes\": 47812}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_beautiful_picture_fddb6b1026.jpeg\", \"hash\": \"thumbnail_beautiful_picture_fddb6b1026\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_beautiful-picture\", \"path\": null, \"size\": 6.44, \"width\": 234, \"height\": 156, \"sizeInBytes\": 6436}}','beautiful_picture_fddb6b1026','.jpeg','image/jpeg',710.28,'/uploads/beautiful_picture_fddb6b1026.jpeg',NULL,'local',NULL,'/','2025-07-23 05:52:04.298000','2025-07-23 05:52:04.298000','2025-07-23 05:52:04.298000',NULL,NULL,NULL),(9,'y2bu8bgyv53sq8kf5mqmmo5y','what-s-inside-a-black-hole','An image uploaded to Strapi called what-s-inside-a-black-hole','what-s-inside-a-black-hole',800,466,'{\"small\": {\"ext\": \".jpeg\", \"url\": \"/uploads/small_what_s_inside_a_black_hole_a8ce884cb5.jpeg\", \"hash\": \"small_what_s_inside_a_black_hole_a8ce884cb5\", \"mime\": \"image/jpeg\", \"name\": \"small_what-s-inside-a-black-hole\", \"path\": null, \"size\": 3.87, \"width\": 500, \"height\": 291, \"sizeInBytes\": 3867}, \"medium\": {\"ext\": \".jpeg\", \"url\": \"/uploads/medium_what_s_inside_a_black_hole_a8ce884cb5.jpeg\", \"hash\": \"medium_what_s_inside_a_black_hole_a8ce884cb5\", \"mime\": \"image/jpeg\", \"name\": \"medium_what-s-inside-a-black-hole\", \"path\": null, \"size\": 6.92, \"width\": 750, \"height\": 437, \"sizeInBytes\": 6923}, \"thumbnail\": {\"ext\": \".jpeg\", \"url\": \"/uploads/thumbnail_what_s_inside_a_black_hole_a8ce884cb5.jpeg\", \"hash\": \"thumbnail_what_s_inside_a_black_hole_a8ce884cb5\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_what-s-inside-a-black-hole\", \"path\": null, \"size\": 1.56, \"width\": 245, \"height\": 143, \"sizeInBytes\": 1556}}','what_s_inside_a_black_hole_a8ce884cb5','.jpeg','image/jpeg',7.50,'/uploads/what_s_inside_a_black_hole_a8ce884cb5.jpeg',NULL,'local',NULL,'/','2025-07-23 05:52:04.539000','2025-07-23 05:52:04.539000','2025-07-23 05:52:04.539000',NULL,NULL,NULL),(10,'oig6mg1wa1v7cz0nk25i8ekt','favicon','An image uploaded to Strapi called favicon','favicon',512,512,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_favicon_e1080be8f8.png\", \"hash\": \"small_favicon_e1080be8f8\", \"mime\": \"image/png\", \"name\": \"small_favicon\", \"path\": null, \"size\": 17.8, \"width\": 500, \"height\": 500, \"sizeInBytes\": 17800}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_favicon_e1080be8f8.png\", \"hash\": \"thumbnail_favicon_e1080be8f8\", \"mime\": \"image/png\", \"name\": \"thumbnail_favicon\", \"path\": null, \"size\": 4.61, \"width\": 156, \"height\": 156, \"sizeInBytes\": 4605}}','favicon_e1080be8f8','.png','image/png',2.74,'/uploads/favicon_e1080be8f8.png',NULL,'local',NULL,'/','2025-07-23 05:52:04.756000','2025-07-23 05:52:04.756000','2025-07-23 05:52:04.757000',NULL,NULL,NULL),(11,'h5930r10qg1vj9nd05cm633y','default-image','An image uploaded to Strapi called default-image','default-image',1208,715,'{\"large\": {\"ext\": \".png\", \"url\": \"/uploads/large_default_image_ab11ee48fe.png\", \"hash\": \"large_default_image_ab11ee48fe\", \"mime\": \"image/png\", \"name\": \"large_default-image\", \"path\": null, \"size\": 327.52, \"width\": 1000, \"height\": 592, \"sizeInBytes\": 327520}, \"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_default_image_ab11ee48fe.png\", \"hash\": \"small_default_image_ab11ee48fe\", \"mime\": \"image/png\", \"name\": \"small_default-image\", \"path\": null, \"size\": 75.58, \"width\": 500, \"height\": 296, \"sizeInBytes\": 75579}, \"medium\": {\"ext\": \".png\", \"url\": \"/uploads/medium_default_image_ab11ee48fe.png\", \"hash\": \"medium_default_image_ab11ee48fe\", \"mime\": \"image/png\", \"name\": \"medium_default-image\", \"path\": null, \"size\": 174.82, \"width\": 750, \"height\": 444, \"sizeInBytes\": 174821}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_default_image_ab11ee48fe.png\", \"hash\": \"thumbnail_default_image_ab11ee48fe\", \"mime\": \"image/png\", \"name\": \"thumbnail_default-image\", \"path\": null, \"size\": 21.18, \"width\": 245, \"height\": 145, \"sizeInBytes\": 21177}}','default_image_ab11ee48fe','.png','image/png',81.60,'/uploads/default_image_ab11ee48fe.png',NULL,'local',NULL,'/','2025-07-23 05:52:05.203000','2025-07-23 05:52:05.203000','2025-07-23 05:52:05.204000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_folder_lnk`
--

DROP TABLE IF EXISTS `files_folder_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_folder_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `folder_id` int unsigned DEFAULT NULL,
  `file_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_lnk_uq` (`file_id`,`folder_id`),
  KEY `files_folder_lnk_fk` (`file_id`),
  KEY `files_folder_lnk_ifk` (`folder_id`),
  KEY `files_folder_lnk_oifk` (`file_ord`),
  CONSTRAINT `files_folder_lnk_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_lnk_ifk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_folder_lnk`
--

LOCK TABLES `files_folder_lnk` WRITE;
/*!40000 ALTER TABLE `files_folder_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_folder_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_related_mph`
--

DROP TABLE IF EXISTS `files_related_mph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_related_mph` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `related_id` int unsigned DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_mph_fk` (`file_id`),
  KEY `files_related_mph_oidx` (`order`),
  KEY `files_related_mph_idix` (`related_id`),
  CONSTRAINT `files_related_mph_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_related_mph`
--

LOCK TABLES `files_related_mph` WRITE;
/*!40000 ALTER TABLE `files_related_mph` DISABLE KEYS */;
INSERT INTO `files_related_mph` VALUES (1,1,1,'api::author.author','avatar',1),(2,2,2,'api::author.author','avatar',1),(3,4,1,'shared.media','file',1),(4,4,1,'shared.slider','files',1),(5,5,1,'shared.slider','files',2),(6,3,1,'api::article.article','cover',1),(7,4,2,'shared.media','file',1),(8,4,2,'shared.slider','files',1),(9,5,2,'shared.slider','files',2),(10,6,2,'api::article.article','cover',1),(11,4,3,'shared.media','file',1),(12,4,3,'shared.slider','files',1),(13,5,3,'shared.slider','files',2),(14,7,3,'api::article.article','cover',1),(15,4,4,'shared.media','file',1),(16,4,4,'shared.slider','files',1),(17,5,4,'shared.slider','files',2),(18,8,4,'api::article.article','cover',1),(19,4,5,'shared.media','file',1),(20,4,5,'shared.slider','files',1),(21,5,5,'shared.slider','files',2),(22,9,5,'api::article.article','cover',1),(23,11,1,'shared.seo','shareImage',1),(24,10,1,'api::global.global','favicon',1),(25,4,6,'shared.media','file',1),(26,5,7,'shared.media','file',1),(27,5,8,'shared.media','file',1);
/*!40000 ALTER TABLE `files_related_mph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globals`
--

DROP TABLE IF EXISTS `globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `site_description` longtext,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `globals_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `globals_created_by_id_fk` (`created_by_id`),
  KEY `globals_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `globals_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globals_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globals`
--

LOCK TABLES `globals` WRITE;
/*!40000 ALTER TABLE `globals` DISABLE KEYS */;
INSERT INTO `globals` VALUES (1,'tvbhu6ex0v59tkms0bluf0m9','Strapi Blog','A Blog made with Strapi','2025-07-23 05:52:05.231000','2025-07-23 05:52:05.231000','2025-07-23 05:52:05.225000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globals_cmps`
--

DROP TABLE IF EXISTS `globals_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globals_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `globals_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `globals_field_idx` (`field`),
  KEY `globals_component_type_idx` (`component_type`),
  KEY `globals_entity_fk` (`entity_id`),
  CONSTRAINT `globals_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `globals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globals_cmps`
--

LOCK TABLES `globals_cmps` WRITE;
/*!40000 ALTER TABLE `globals_cmps` DISABLE KEYS */;
INSERT INTO `globals_cmps` VALUES (1,1,1,'shared.seo','defaultSeo',NULL);
/*!40000 ALTER TABLE `globals_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locale`
--

DROP TABLE IF EXISTS `i18n_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i18n_locale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locale`
--

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;
INSERT INTO `i18n_locale` VALUES (1,'rgrhgzhee7n7c5qvk8la1j78','English (en)','en','2025-07-23 05:51:47.776000','2025-07-23 05:51:47.776000','2025-07-23 05:51:47.779000',NULL,NULL,NULL),(2,'nfn4d483wo9zutnmmrq585mb','Spanish (es)','es','2025-07-29 16:35:29.399000','2025-07-29 16:35:29.399000','2025-07-29 16:35:29.400000',1,1,NULL);
/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navbars`
--

DROP TABLE IF EXISTS `navbars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navbars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `logo_alt` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `navbars_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `navbars_created_by_id_fk` (`created_by_id`),
  KEY `navbars_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `navbars_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `navbars_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navbars`
--

LOCK TABLES `navbars` WRITE;
/*!40000 ALTER TABLE `navbars` DISABLE KEYS */;
INSERT INTO `navbars` VALUES (1,'neqeqxc4pqrm538vt75jinty',NULL,'2025-08-05 21:57:10.041000','2025-08-05 22:04:39.308000',NULL,1,1,'en'),(3,'neqeqxc4pqrm538vt75jinty',NULL,'2025-08-05 21:57:54.514000','2025-08-05 22:04:39.324000',NULL,1,1,'es'),(7,'neqeqxc4pqrm538vt75jinty',NULL,'2025-08-05 21:57:54.514000','2025-08-05 22:04:39.369000','2025-08-05 22:01:00.148000',1,1,'es'),(8,'neqeqxc4pqrm538vt75jinty',NULL,'2025-08-05 21:57:10.041000','2025-08-05 22:04:39.308000','2025-08-05 22:04:39.341000',1,1,'en');
/*!40000 ALTER TABLE `navbars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navbars_cmps`
--

DROP TABLE IF EXISTS `navbars_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navbars_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navbars_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `navbars_field_idx` (`field`),
  KEY `navbars_component_type_idx` (`component_type`),
  KEY `navbars_entity_fk` (`entity_id`),
  CONSTRAINT `navbars_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `navbars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navbars_cmps`
--

LOCK TABLES `navbars_cmps` WRITE;
/*!40000 ALTER TABLE `navbars_cmps` DISABLE KEYS */;
INSERT INTO `navbars_cmps` VALUES (1,1,1,'shared.nav-links','link',1),(2,1,2,'shared.nav-links','link',2),(3,1,3,'shared.nav-links','link',3),(4,1,4,'shared.nav-links','link',4),(9,3,9,'shared.nav-links','link',1),(10,3,10,'shared.nav-links','link',2),(11,3,11,'shared.nav-links','link',3),(12,3,12,'shared.nav-links','link',4),(37,7,25,'shared.nav-links','link',1),(38,7,26,'shared.nav-links','link',2),(39,7,27,'shared.nav-links','link',3),(40,7,28,'shared.nav-links','link',4),(45,8,29,'shared.nav-links','link',1),(46,8,30,'shared.nav-links','link',2),(47,8,31,'shared.nav-links','link',3),(48,8,32,'shared.nav-links','link',4);
/*!40000 ALTER TABLE `navbars_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navbars_site_lnk`
--

DROP TABLE IF EXISTS `navbars_site_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navbars_site_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `navbar_id` int unsigned DEFAULT NULL,
  `site_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navbars_site_lnk_uq` (`navbar_id`,`site_id`),
  KEY `navbars_site_lnk_fk` (`navbar_id`),
  KEY `navbars_site_lnk_ifk` (`site_id`),
  CONSTRAINT `navbars_site_lnk_fk` FOREIGN KEY (`navbar_id`) REFERENCES `navbars` (`id`) ON DELETE CASCADE,
  CONSTRAINT `navbars_site_lnk_ifk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navbars_site_lnk`
--

LOCK TABLES `navbars_site_lnk` WRITE;
/*!40000 ALTER TABLE `navbars_site_lnk` DISABLE KEYS */;
INSERT INTO `navbars_site_lnk` VALUES (1,1,1),(6,8,6);
/*!40000 ALTER TABLE `navbars_site_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `pages_created_by_id_fk` (`created_by_id`),
  KEY `pages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `pages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'x4y5c2gy9oiaax44ri7hdibe','getaway-landing-page-en','2025-08-21 22:28:36.114000','2025-08-22 03:55:15.748000',NULL,1,1,'en','Landing Page','INSPIRA Get Away'),(3,'x4y5c2gy9oiaax44ri7hdibe','getaway-landing-page-es','2025-08-21 22:42:06.547000','2025-08-22 03:55:15.785000',NULL,1,1,'es','Landing Page','INSPIRA GetAway'),(4,'ar25cx1i0l8e87pgd9di13l4','getaway-confirmation-page-en','2025-08-21 22:43:11.424000','2025-08-22 03:35:33.695000',NULL,1,1,'en','Confirmation Page','INSPIRA GetAway Welcome!'),(5,'ar25cx1i0l8e87pgd9di13l4','getaway-confirmation-page-es','2025-08-21 22:44:47.399000','2025-08-22 03:35:33.675000',NULL,1,1,'es','Confirmation Page','INSPIRA GetAway Bienvenido!'),(6,'ar25cx1i0l8e87pgd9di13l4','getaway-confirmation-page-en','2025-08-21 22:43:11.424000','2025-08-22 03:35:33.734000','2025-08-21 22:44:56.064000',1,1,'en','Confirmation Page','INSPIRA GetAway Welcome!'),(7,'x4y5c2gy9oiaax44ri7hdibe','getaway-landing-page-en','2025-08-21 22:28:36.114000','2025-08-22 03:41:24.261000','2025-08-21 22:44:56.081000',1,1,'en','Landing Page','INSPIRA Get Away'),(11,'ar25cx1i0l8e87pgd9di13l4','getaway-confirmation-page-es','2025-08-21 22:44:47.399000','2025-08-22 03:35:33.675000','2025-08-22 03:35:33.711000',1,1,'es','Confirmation Page','INSPIRA GetAway Bienvenido!'),(13,'x4y5c2gy9oiaax44ri7hdibe','getaway-landing-page-es','2025-08-21 22:42:06.547000','2025-08-22 03:41:24.179000','2025-08-22 03:41:24.226000',1,1,'es','Landing Page','INSPIRA GetAway');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_cmps`
--

DROP TABLE IF EXISTS `pages_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `pages_field_idx` (`field`),
  KEY `pages_component_type_idx` (`component_type`),
  KEY `pages_entity_fk` (`entity_id`),
  CONSTRAINT `pages_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_cmps`
--

LOCK TABLES `pages_cmps` WRITE;
/*!40000 ALTER TABLE `pages_cmps` DISABLE KEYS */;
INSERT INTO `pages_cmps` VALUES (5,1,7,'faq.faq','faqs',1),(6,1,8,'faq.faq','faqs',2),(7,3,9,'faq.faq','faqs',1),(8,3,10,'faq.faq','faqs',2),(9,4,11,'faq.faq','faqs',1),(11,5,12,'faq.faq','faqs',1),(12,6,13,'faq.faq','faqs',1),(13,7,14,'shared.rich-text','page_structure',1),(14,7,14,'faq.faq','faqs',1),(15,7,15,'faq.faq','faqs',2),(22,11,20,'faq.faq','faqs',1),(29,3,15,'shared.rich-text','page_structure',2),(30,3,7,'shared.media','page_structure',3),(33,13,17,'shared.rich-text','page_structure',1),(34,13,8,'shared.media','page_structure',2),(35,13,23,'faq.faq','faqs',1),(36,13,24,'faq.faq','faqs',2),(37,1,12,'shared.rich-text','page_structure',1),(38,1,1,'blocks.hero','page_structure',2);
/*!40000 ALTER TABLE `pages_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_site_lnk`
--

DROP TABLE IF EXISTS `pages_site_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_site_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int unsigned DEFAULT NULL,
  `site_id` int unsigned DEFAULT NULL,
  `page_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_site_lnk_uq` (`page_id`,`site_id`),
  KEY `pages_site_lnk_fk` (`page_id`),
  KEY `pages_site_lnk_ifk` (`site_id`),
  KEY `pages_site_lnk_oifk` (`page_ord`),
  CONSTRAINT `pages_site_lnk_fk` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pages_site_lnk_ifk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_site_lnk`
--

LOCK TABLES `pages_site_lnk` WRITE;
/*!40000 ALTER TABLE `pages_site_lnk` DISABLE KEYS */;
INSERT INTO `pages_site_lnk` VALUES (1,1,1,1),(3,3,1,2),(4,4,1,3),(5,6,6,1),(6,7,6,1),(8,5,1,4),(9,11,6,3),(11,13,6,2);
/*!40000 ALTER TABLE `pages_site_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `domain_us` varchar(255) DEFAULT NULL,
  `mx_site` tinyint(1) DEFAULT NULL,
  `domain_mx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sites_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `sites_created_by_id_fk` (`created_by_id`),
  KEY `sites_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `sites_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sites_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'w1qfjztilqrz2y8od1powcrk','GetAway','get-away','2025-07-29 16:29:05.939000','2025-08-21 22:15:49.189000',NULL,1,1,NULL,'https://getaway.com',1,'https://getaway.com.mx'),(6,'w1qfjztilqrz2y8od1powcrk','GetAway','get-away','2025-07-29 16:29:05.939000','2025-08-21 22:15:49.189000','2025-08-21 22:15:49.198000',1,1,NULL,'https://getaway.com',1,'https://getaway.com.mx');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions`
--

LOCK TABLES `strapi_api_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions_token_lnk`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions_token_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int unsigned DEFAULT NULL,
  `api_token_id` int unsigned DEFAULT NULL,
  `api_token_permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_lnk_uq` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_lnk_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_lnk_ifk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_lnk_oifk` (`api_token_permission_ord`),
  CONSTRAINT `strapi_api_token_permissions_token_lnk_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_lnk_ifk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions_token_lnk`
--

LOCK TABLES `strapi_api_token_permissions_token_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_tokens`
--

DROP TABLE IF EXISTS `strapi_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `encrypted_key` longtext,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_tokens`
--

LOCK TABLES `strapi_api_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_api_tokens` DISABLE KEYS */;
INSERT INTO `strapi_api_tokens` VALUES (1,'pfpfqa9vu3qflgamcx28bdij','Read Only','A default API token with read-only permissions, only used for accessing resources','read-only','b3365de37fcb3e3fe3f8f13ffe57b72874ef36909e1272643e4de812af71aa288517a03e2515f59590004e2867b737b989de29eef735bc110b011c8ec8d3dc39','v1:894bdbba6b825785be9c41a13f8d82ac:322a848d92cc97efb55b314016f45070864b82f1128f6db5157ccc40c058c1df4c384761938b06a28d34460cfc9e782220a402a1174c697f00e8ad5d2469b1c81f36618a8f00959b21a55537ddfcebb539cdcf664e1b152f88ba754c069391becbcf058b53bde75480ec539940c272ee5a09053075d0d11e111cf5869021f36d42e801d650a9f78cd26198b6235bbeb882d68250164f3966b41d82939493c349b3aa75165390aa4868708d8920b4d805e38c0d0f20e05ad0463f2b9f40445fdffd9843c7e261058fd7c7021f2e714bc21d64f63d3e5dc2e6e4f81823d9c3710d891be1df60ac7b5417e333be53e30122c7f0968054d24d25c5eb984abea013e3:0ab83ea517f91063e4649a5869799400',NULL,NULL,NULL,'2025-07-23 05:51:56.128000','2025-07-23 05:51:56.128000','2025-07-23 05:51:56.133000',NULL,NULL,NULL),(2,'c3t7fm0pesrswyhx96qk00jd','Full Access','A default API token with full access permissions, used for accessing or modifying resources','full-access','3c41f138e2b1bf11b7af6f6abf5bd97faeb6c11826daf860aea30b2e763f0b20fe103149325ec600ed8493a9400d75e1ad21174c14f2751bc6581d2386d98477','v1:90c2a549db9ca2a7f7fe8ccc145d3223:54510d49af6d432a992827befb82759a9400d888f624c0f302c2523be07945007e8ad852c5f5103eccfc3dddaa3ba53cdfc0b2a88de0201b3b96dc8aacfabca307e8c9bc8382d3c440aa2d783980d4aab15ed0d8e0b23b43a234d73e7e053dc10c653d9fd054812574ef3c69756668c7feb765899d9fb44185a30769562aa46924cc7fe250122ffdc92ce51fd2eca2d9178901b91ad64c2eea849f0a2c829ab86a7f13e30c1b7093f9c5547339c16ae9e40edce74f97a3f8f153eb378a9a0755ce34825ac6ca5f585e5b5879044d970f643fb9490478866010e0ec397813862ac63693cc3108a1c85091e2f11a46f3aa43741ff00c2166589d2ee2f6db1a6e1f:8e555b8280f3d04975c0a170d729300f',NULL,NULL,NULL,'2025-07-23 05:51:56.166000','2025-07-23 05:51:56.166000','2025-07-23 05:51:56.166000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `strapi_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_core_store_settings`
--

DROP TABLE IF EXISTS `strapi_core_store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_core_store_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_core_store_settings`
--

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;
INSERT INTO `strapi_core_store_settings` VALUES (1,'strapi_content_types_schema','{\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"minLength\":1,\"required\":true,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"files\"}}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"plugin\":\"upload\",\"globalId\":\"UploadFile\",\"uid\":\"plugin::upload.file\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"minLength\":1,\"required\":true,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"file\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"upload_folders\"}}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"plugin\":\"upload\",\"globalId\":\"UploadFolder\",\"uid\":\"plugin::upload.folder\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"minLength\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelName\":\"folder\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::i18n.locale\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"i18n_locale\"}}},\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\",\"uid\":\"plugin::i18n.locale\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"i18n_locale\",\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"locale\"},\"plugin::content-releases.release\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_releases\"}}},\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesRelease\",\"uid\":\"plugin::content-releases.release\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"}},\"kind\":\"collectionType\"},\"modelName\":\"release\"},\"plugin::content-releases.release-action\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"contentType\":{\"type\":\"string\",\"required\":true},\"entryDocumentId\":{\"type\":\"string\"},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_release_actions\"}}},\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesReleaseAction\",\"uid\":\"plugin::content-releases.release-action\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"contentType\":{\"type\":\"string\",\"required\":true},\"entryDocumentId\":{\"type\":\"string\"},\"locale\":{\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"}},\"kind\":\"collectionType\"},\"modelName\":\"release-action\"},\"plugin::review-workflows.workflow\":{\"collectionName\":\"strapi_workflows\",\"info\":{\"name\":\"Workflow\",\"description\":\"\",\"singularName\":\"workflow\",\"pluralName\":\"workflows\",\"displayName\":\"Workflow\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"stages\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToMany\",\"mappedBy\":\"workflow\"},\"stageRequiredToPublish\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToOne\",\"required\":false},\"contentTypes\":{\"type\":\"json\",\"required\":true,\"default\":\"[]\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::review-workflows.workflow\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_workflows\"}}},\"plugin\":\"review-workflows\",\"globalId\":\"ReviewWorkflowsWorkflow\",\"uid\":\"plugin::review-workflows.workflow\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_workflows\",\"info\":{\"name\":\"Workflow\",\"description\":\"\",\"singularName\":\"workflow\",\"pluralName\":\"workflows\",\"displayName\":\"Workflow\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"stages\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToMany\",\"mappedBy\":\"workflow\"},\"stageRequiredToPublish\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToOne\",\"required\":false},\"contentTypes\":{\"type\":\"json\",\"required\":true,\"default\":\"[]\"}},\"kind\":\"collectionType\"},\"modelName\":\"workflow\"},\"plugin::review-workflows.workflow-stage\":{\"collectionName\":\"strapi_workflows_stages\",\"info\":{\"name\":\"Workflow Stage\",\"description\":\"\",\"singularName\":\"workflow-stage\",\"pluralName\":\"workflow-stages\",\"displayName\":\"Stages\"},\"options\":{\"version\":\"1.1.0\",\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false},\"color\":{\"type\":\"string\",\"configurable\":false,\"default\":\"#4945FF\"},\"workflow\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow\",\"relation\":\"manyToOne\",\"inversedBy\":\"stages\",\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::permission\",\"relation\":\"manyToMany\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::review-workflows.workflow-stage\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_workflows_stages\"}}},\"plugin\":\"review-workflows\",\"globalId\":\"ReviewWorkflowsWorkflowStage\",\"uid\":\"plugin::review-workflows.workflow-stage\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_workflows_stages\",\"info\":{\"name\":\"Workflow Stage\",\"description\":\"\",\"singularName\":\"workflow-stage\",\"pluralName\":\"workflow-stages\",\"displayName\":\"Stages\"},\"options\":{\"version\":\"1.1.0\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false},\"color\":{\"type\":\"string\",\"configurable\":false,\"default\":\"#4945FF\"},\"workflow\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow\",\"relation\":\"manyToOne\",\"inversedBy\":\"stages\",\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::permission\",\"relation\":\"manyToMany\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"workflow-stage\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_permissions\"}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\",\"uid\":\"plugin::users-permissions.permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"permission\",\"options\":{\"draftAndPublish\":false}},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.role\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_roles\"}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\",\"uid\":\"plugin::users-permissions.role\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"role\",\"options\":{\"draftAndPublish\":false}},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"timestamps\":true,\"draftAndPublish\":false},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_users\"}}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\",\"uid\":\"plugin::users-permissions.user\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"user\"},\"api::about.about\":{\"kind\":\"singleType\",\"collectionName\":\"abouts\",\"info\":{\"singularName\":\"about\",\"pluralName\":\"abouts\",\"displayName\":\"About\",\"description\":\"Write about yourself and the content you create\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"shared.media\",\"shared.quote\",\"shared.rich-text\",\"shared.slider\"]},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::about.about\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"abouts\"}}},\"apiName\":\"about\",\"globalId\":\"About\",\"uid\":\"api::about.about\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"abouts\",\"info\":{\"singularName\":\"about\",\"pluralName\":\"abouts\",\"displayName\":\"About\",\"description\":\"Write about yourself and the content you create\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\"},\"blocks\":{\"type\":\"dynamiczone\",\"components\":[\"shared.media\",\"shared.quote\",\"shared.rich-text\",\"shared.slider\"]}},\"kind\":\"singleType\"},\"modelName\":\"about\",\"actions\":{},\"lifecycles\":{}},\"api::author.author\":{\"kind\":\"collectionType\",\"collectionName\":\"authors\",\"info\":{\"singularName\":\"author\",\"pluralName\":\"authors\",\"displayName\":\"Author\",\"description\":\"Create authors for your content\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"avatar\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\"]},\"email\":{\"type\":\"string\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::author.author\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"authors\"}}},\"apiName\":\"author\",\"globalId\":\"Author\",\"uid\":\"api::author.author\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"authors\",\"info\":{\"singularName\":\"author\",\"pluralName\":\"authors\",\"displayName\":\"Author\",\"description\":\"Create authors for your content\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"avatar\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\"]},\"email\":{\"type\":\"string\"}},\"kind\":\"collectionType\"},\"modelName\":\"author\",\"actions\":{},\"lifecycles\":{}},\"api::block-faq.block-faq\":{\"kind\":\"collectionType\",\"collectionName\":\"block_faqs\",\"info\":{\"singularName\":\"block-faq\",\"pluralName\":\"block-faqs\",\"displayName\":\"block_faq\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"Faq\":{\"type\":\"component\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"faq.faq\",\"repeatable\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::block-faq.block-faq\",\"writable\":false,\"private\":false,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"block_faqs\"}}},\"apiName\":\"block-faq\",\"globalId\":\"BlockFaq\",\"uid\":\"api::block-faq.block-faq\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"block_faqs\",\"info\":{\"singularName\":\"block-faq\",\"pluralName\":\"block-faqs\",\"displayName\":\"block_faq\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"Faq\":{\"type\":\"component\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"faq.faq\",\"repeatable\":true}},\"kind\":\"collectionType\"},\"modelName\":\"block-faq\",\"actions\":{},\"lifecycles\":{}},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\",\"description\":\"Organize your content into categories\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\"},\"description\":{\"type\":\"text\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::category.category\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"categories\"}}},\"apiName\":\"category\",\"globalId\":\"Category\",\"uid\":\"api::category.category\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"Category\",\"description\":\"Organize your content into categories\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\"},\"slug\":{\"type\":\"uid\"},\"description\":{\"type\":\"text\"}},\"kind\":\"collectionType\"},\"modelName\":\"category\",\"actions\":{},\"lifecycles\":{}},\"api::faq.faq\":{\"kind\":\"collectionType\",\"collectionName\":\"faqs\",\"info\":{\"singularName\":\"faq\",\"pluralName\":\"faqs\",\"displayName\":\"faq\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"site\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::site.site\",\"inversedBy\":\"faqs\"},\"faq\":{\"type\":\"component\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"faq.faq\",\"repeatable\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::faq.faq\",\"writable\":false,\"private\":false,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"faqs\"}}},\"apiName\":\"faq\",\"globalId\":\"Faq\",\"uid\":\"api::faq.faq\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"faqs\",\"info\":{\"singularName\":\"faq\",\"pluralName\":\"faqs\",\"displayName\":\"faq\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"site\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::site.site\",\"inversedBy\":\"faqs\"},\"faq\":{\"type\":\"component\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"faq.faq\",\"repeatable\":true}},\"kind\":\"collectionType\"},\"modelName\":\"faq\",\"actions\":{},\"lifecycles\":{}},\"api::global.global\":{\"kind\":\"singleType\",\"collectionName\":\"globals\",\"info\":{\"singularName\":\"global\",\"pluralName\":\"globals\",\"displayName\":\"Global\",\"description\":\"Define global settings\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"siteName\":{\"type\":\"string\",\"required\":true},\"favicon\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\"]},\"siteDescription\":{\"type\":\"text\",\"required\":true},\"defaultSeo\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"shared.seo\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::global.global\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"globals\"}}},\"apiName\":\"global\",\"globalId\":\"Global\",\"uid\":\"api::global.global\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"globals\",\"info\":{\"singularName\":\"global\",\"pluralName\":\"globals\",\"displayName\":\"Global\",\"description\":\"Define global settings\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"siteName\":{\"type\":\"string\",\"required\":true},\"favicon\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\"]},\"siteDescription\":{\"type\":\"text\",\"required\":true},\"defaultSeo\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"shared.seo\"}},\"kind\":\"singleType\"},\"modelName\":\"global\",\"actions\":{},\"lifecycles\":{}},\"api::navbar.navbar\":{\"kind\":\"singleType\",\"collectionName\":\"navbars\",\"info\":{\"singularName\":\"navbar\",\"pluralName\":\"navbars\",\"displayName\":\"Navbar\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"logo\":{\"type\":\"media\",\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"multiple\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"logoAlt\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"link\":{\"type\":\"component\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"shared.nav-links\",\"repeatable\":true},\"site\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::site.site\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::navbar.navbar\",\"writable\":false,\"private\":false,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"navbars\"}}},\"apiName\":\"navbar\",\"globalId\":\"Navbar\",\"uid\":\"api::navbar.navbar\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"navbars\",\"info\":{\"singularName\":\"navbar\",\"pluralName\":\"navbars\",\"displayName\":\"Navbar\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"logo\":{\"type\":\"media\",\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"multiple\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"logoAlt\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"link\":{\"type\":\"component\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"component\":\"shared.nav-links\",\"repeatable\":true},\"site\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::site.site\"}},\"kind\":\"singleType\"},\"modelName\":\"navbar\",\"actions\":{},\"lifecycles\":{}},\"api::page.page\":{\"kind\":\"collectionType\",\"collectionName\":\"pages\",\"info\":{\"singularName\":\"page\",\"pluralName\":\"pages\",\"displayName\":\"page\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"type\":\"uid\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"required\":true},\"site\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::site.site\",\"inversedBy\":\"pages\"},\"page\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"required\":true},\"title\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"required\":true},\"page_structure\":{\"type\":\"dynamiczone\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"components\":[\"shared.rich-text\",\"shared.media\",\"shared.nav-links\",\"faq.faq\",\"blocks.hero\",\"shared.slider\",\"shared.seo\",\"shared.quote\",\"shared.buttons\"]},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::page.page\",\"writable\":false,\"private\":false,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"pages\"}}},\"apiName\":\"page\",\"globalId\":\"Page\",\"uid\":\"api::page.page\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"pages\",\"info\":{\"singularName\":\"page\",\"pluralName\":\"pages\",\"displayName\":\"page\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"slug\":{\"type\":\"uid\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"required\":true},\"site\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"api::site.site\",\"inversedBy\":\"pages\"},\"page\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":false}},\"required\":true},\"title\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"required\":true},\"page_structure\":{\"type\":\"dynamiczone\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"components\":[\"shared.rich-text\",\"shared.media\",\"shared.nav-links\",\"faq.faq\",\"blocks.hero\",\"shared.slider\",\"shared.seo\",\"shared.quote\",\"shared.buttons\"]}},\"kind\":\"collectionType\"},\"modelName\":\"page\",\"actions\":{},\"lifecycles\":{}},\"api::site.site\":{\"kind\":\"collectionType\",\"collectionName\":\"sites\",\"info\":{\"singularName\":\"site\",\"pluralName\":\"sites\",\"displayName\":\"Site\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"slug\":{\"type\":\"uid\",\"targetField\":\"name\"},\"domain_us\":{\"type\":\"string\",\"required\":true},\"mx_site\":{\"type\":\"boolean\",\"default\":false},\"domain_mx\":{\"type\":\"string\",\"conditions\":{\"visible\":{\"==\":[{\"var\":\"mx_site\"},true]}},\"required\":true},\"pages\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::page.page\",\"mappedBy\":\"site\"},\"faqs\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::faq.faq\",\"mappedBy\":\"site\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::site.site\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"sites\"}}},\"apiName\":\"site\",\"globalId\":\"Site\",\"uid\":\"api::site.site\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"sites\",\"info\":{\"singularName\":\"site\",\"pluralName\":\"sites\",\"displayName\":\"Site\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"slug\":{\"type\":\"uid\",\"targetField\":\"name\"},\"domain_us\":{\"type\":\"string\",\"required\":true},\"mx_site\":{\"type\":\"boolean\",\"default\":false},\"domain_mx\":{\"type\":\"string\",\"conditions\":{\"visible\":{\"==\":[{\"var\":\"mx_site\"},true]}},\"required\":true},\"pages\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::page.page\",\"mappedBy\":\"site\"},\"faqs\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::faq.faq\",\"mappedBy\":\"site\"}},\"kind\":\"collectionType\"},\"modelName\":\"site\",\"actions\":{},\"lifecycles\":{}},\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminPermission\",\"uid\":\"admin::permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelName\":\"permission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::user\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_users\"}}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"registrationToken\":{\"hidden\":true}}},\"plugin\":\"admin\",\"globalId\":\"AdminUser\",\"uid\":\"admin::user\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"user\",\"options\":{\"draftAndPublish\":false}},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::role\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_roles\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminRole\",\"uid\":\"admin::role\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelName\":\"role\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"encryptedKey\":{\"type\":\"text\",\"minLength\":1,\"configurable\":false,\"required\":false,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::api-token\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_api_tokens\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\",\"uid\":\"admin::api-token\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"encryptedKey\":{\"type\":\"text\",\"minLength\":1,\"configurable\":false,\"required\":false,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelName\":\"api-token\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::api-token-permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_api_token_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\",\"uid\":\"admin::api-token-permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelName\":\"api-token-permission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::transfer-token\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_transfer_tokens\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\",\"uid\":\"admin::transfer-token\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelName\":\"transfer-token\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::transfer-token-permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_transfer_token_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\",\"uid\":\"admin::transfer-token-permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelName\":\"transfer-token-permission\"}}','object',NULL,NULL),(2,'plugin_content_manager_configuration_components::shared.slider','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"documentId\",\"defaultSortBy\":\"documentId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"files\"],\"edit\":[[{\"name\":\"files\",\"size\":6}]]},\"uid\":\"shared.slider\",\"isComponent\":true}','object',NULL,NULL),(3,'plugin_content_manager_configuration_components::shared.seo','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"metaTitle\",\"defaultSortBy\":\"metaTitle\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"metaTitle\":{\"edit\":{\"label\":\"metaTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaTitle\",\"searchable\":true,\"sortable\":true}},\"metaDescription\":{\"edit\":{\"label\":\"metaDescription\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaDescription\",\"searchable\":true,\"sortable\":true}},\"shareImage\":{\"edit\":{\"label\":\"shareImage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"shareImage\",\"searchable\":false,\"sortable\":false}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"metaTitle\",\"metaDescription\",\"shareImage\"],\"edit\":[[{\"name\":\"metaTitle\",\"size\":6},{\"name\":\"metaDescription\",\"size\":6}],[{\"name\":\"shareImage\",\"size\":6}]]},\"uid\":\"shared.seo\",\"isComponent\":true}','object',NULL,NULL),(4,'plugin_content_manager_configuration_components::shared.rich-text','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"documentId\",\"defaultSortBy\":\"documentId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"body\":{\"edit\":{\"label\":\"body\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"body\",\"searchable\":false,\"sortable\":false}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[[{\"name\":\"body\",\"size\":12}]]},\"uid\":\"shared.rich-text\",\"isComponent\":true}','object',NULL,NULL),(5,'plugin_content_manager_configuration_components::shared.quote','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"body\":{\"edit\":{\"label\":\"body\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"body\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"body\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"body\",\"size\":6}]]},\"uid\":\"shared.quote\",\"isComponent\":true}','object',NULL,NULL),(6,'plugin_content_manager_configuration_components::shared.media','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"documentId\",\"defaultSortBy\":\"documentId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"file\":{\"edit\":{\"label\":\"file\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"file\",\"searchable\":false,\"sortable\":false}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"file\"],\"edit\":[[{\"name\":\"file\",\"size\":6}]]},\"uid\":\"shared.media\",\"isComponent\":true}','object',NULL,NULL),(7,'plugin_content_manager_configuration_content_types::plugin::upload.file','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]},\"uid\":\"plugin::upload.file\"}','object',NULL,NULL),(8,'plugin_content_manager_configuration_content_types::plugin::upload.folder','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]},\"uid\":\"plugin::upload.folder\"}','object',NULL,NULL),(9,'plugin_content_manager_configuration_content_types::plugin::i18n.locale','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]},\"uid\":\"plugin::i18n.locale\"}','object',NULL,NULL),(10,'plugin_content_manager_configuration_content_types::plugin::content-releases.release','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"releasedAt\":{\"edit\":{\"label\":\"releasedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"releasedAt\",\"searchable\":true,\"sortable\":true}},\"scheduledAt\":{\"edit\":{\"label\":\"scheduledAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"scheduledAt\",\"searchable\":true,\"sortable\":true}},\"timezone\":{\"edit\":{\"label\":\"timezone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"timezone\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}},\"actions\":{\"edit\":{\"label\":\"actions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"contentType\"},\"list\":{\"label\":\"actions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"releasedAt\",\"scheduledAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"releasedAt\",\"size\":6}],[{\"name\":\"scheduledAt\",\"size\":6},{\"name\":\"timezone\",\"size\":6}],[{\"name\":\"status\",\"size\":6},{\"name\":\"actions\",\"size\":6}]]},\"uid\":\"plugin::content-releases.release\"}','object',NULL,NULL),(11,'plugin_content_manager_configuration_content_types::plugin::content-releases.release-action','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"contentType\",\"defaultSortBy\":\"contentType\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"contentType\":{\"edit\":{\"label\":\"contentType\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentType\",\"searchable\":true,\"sortable\":true}},\"entryDocumentId\":{\"edit\":{\"label\":\"entryDocumentId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"entryDocumentId\",\"searchable\":true,\"sortable\":true}},\"release\":{\"edit\":{\"label\":\"release\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"release\",\"searchable\":true,\"sortable\":true}},\"isEntryValid\":{\"edit\":{\"label\":\"isEntryValid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isEntryValid\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"contentType\",\"entryDocumentId\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"contentType\",\"size\":6}],[{\"name\":\"entryDocumentId\",\"size\":6},{\"name\":\"release\",\"size\":6}],[{\"name\":\"isEntryValid\",\"size\":4}]]},\"uid\":\"plugin::content-releases.release-action\"}','object',NULL,NULL),(12,'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"stages\":{\"edit\":{\"label\":\"stages\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"stages\",\"searchable\":false,\"sortable\":false}},\"stageRequiredToPublish\":{\"edit\":{\"label\":\"stageRequiredToPublish\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"stageRequiredToPublish\",\"searchable\":true,\"sortable\":true}},\"contentTypes\":{\"edit\":{\"label\":\"contentTypes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentTypes\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"stages\",\"stageRequiredToPublish\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"stages\",\"size\":6}],[{\"name\":\"stageRequiredToPublish\",\"size\":6}],[{\"name\":\"contentTypes\",\"size\":12}]]},\"uid\":\"plugin::review-workflows.workflow\"}','object',NULL,NULL),(13,'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"color\":{\"edit\":{\"label\":\"color\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"color\",\"searchable\":true,\"sortable\":true}},\"workflow\":{\"edit\":{\"label\":\"workflow\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"workflow\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"color\",\"workflow\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"color\",\"size\":6}],[{\"name\":\"workflow\",\"size\":6},{\"name\":\"permissions\",\"size\":6}]]},\"uid\":\"plugin::review-workflows.workflow-stage\"}','object',NULL,NULL),(14,'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.permission\"}','object',NULL,NULL),(15,'plugin_content_manager_configuration_content_types::plugin::users-permissions.role','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.role\"}','object',NULL,NULL),(16,'plugin_content_manager_configuration_content_types::plugin::users-permissions.user','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.user\"}','object',NULL,NULL),(17,'plugin_content_manager_configuration_content_types::api::about.about','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"blocks\":{\"edit\":{\"label\":\"blocks\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocks\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"blocks\",\"size\":12}]]},\"uid\":\"api::about.about\"}','object',NULL,NULL),(19,'plugin_content_manager_configuration_content_types::api::author.author','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"avatar\":{\"edit\":{\"label\":\"avatar\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"avatar\",\"searchable\":false,\"sortable\":false}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"avatar\",\"email\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"avatar\",\"size\":6}],[{\"name\":\"email\",\"size\":6}]]},\"uid\":\"api::author.author\"}','object',NULL,NULL),(20,'plugin_content_manager_configuration_content_types::api::category.category','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]},\"uid\":\"api::category.category\"}','object',NULL,NULL),(21,'plugin_content_manager_configuration_content_types::api::global.global','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"siteName\",\"defaultSortBy\":\"siteName\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"siteName\":{\"edit\":{\"label\":\"siteName\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"siteName\",\"searchable\":true,\"sortable\":true}},\"favicon\":{\"edit\":{\"label\":\"favicon\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"favicon\",\"searchable\":false,\"sortable\":false}},\"siteDescription\":{\"edit\":{\"label\":\"siteDescription\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"siteDescription\",\"searchable\":true,\"sortable\":true}},\"defaultSeo\":{\"edit\":{\"label\":\"defaultSeo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"defaultSeo\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"siteName\",\"favicon\",\"siteDescription\"],\"edit\":[[{\"name\":\"siteName\",\"size\":6},{\"name\":\"favicon\",\"size\":6}],[{\"name\":\"siteDescription\",\"size\":6}],[{\"name\":\"defaultSeo\",\"size\":12}]]},\"uid\":\"api::global.global\"}','object',NULL,NULL),(22,'plugin_content_manager_configuration_content_types::admin::permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"actionParameters\":{\"edit\":{\"label\":\"actionParameters\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"actionParameters\",\"searchable\":false,\"sortable\":false}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6}],[{\"name\":\"actionParameters\",\"size\":12}],[{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]},\"uid\":\"admin::permission\"}','object',NULL,NULL),(23,'plugin_content_manager_configuration_content_types::admin::user','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]},\"uid\":\"admin::user\"}','object',NULL,NULL),(24,'plugin_content_manager_configuration_content_types::admin::role','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]},\"uid\":\"admin::role\"}','object',NULL,NULL),(25,'plugin_content_manager_configuration_content_types::admin::api-token','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"encryptedKey\":{\"edit\":{\"label\":\"encryptedKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"encryptedKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"encryptedKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::api-token\"}','object',NULL,NULL),(26,'plugin_content_manager_configuration_content_types::admin::api-token-permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::api-token-permission\"}','object',NULL,NULL),(27,'plugin_content_manager_configuration_content_types::admin::transfer-token','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::transfer-token\"}','object',NULL,NULL),(28,'plugin_content_manager_configuration_content_types::admin::transfer-token-permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::transfer-token-permission\"}','object',NULL,NULL),(29,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false}','object',NULL,NULL),(30,'plugin_upload_view_configuration','{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}','object',NULL,NULL),(31,'plugin_upload_metrics','{\"weeklySchedule\":\"7 42 21 * * 4\",\"lastWeeklyUpdate\":1755812527015}','object',NULL,NULL),(32,'plugin_i18n_default_locale','\"en\"','string',NULL,NULL),(33,'plugin_users-permissions_grant','{\"email\":{\"icon\":\"envelope\",\"enabled\":true},\"discord\":{\"icon\":\"discord\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"icon\":\"facebook-square\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"icon\":\"google\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"icon\":\"github\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"icon\":\"windows\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"icon\":\"twitter\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/twitter/callback\"},\"instagram\":{\"icon\":\"instagram\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"icon\":\"vk\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"icon\":\"twitch\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"icon\":\"linkedin\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"icon\":\"aws\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"icon\":\"reddit\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"icon\":\"book\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]},\"keycloak\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"myKeycloakProvider.com/realms/myrealm\",\"callback\":\"api/auth/keycloak/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]}}','object',NULL,NULL),(34,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object',NULL,NULL),(35,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object',NULL,NULL),(36,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null,\"ssoLockedRoles\":null}}','object',NULL,NULL),(37,'type_setup_initHasRun','true','boolean','development',NULL),(38,'plugin_content_manager_configuration_content_types::api::site.site','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"domain_us\":{\"edit\":{\"label\":\"domain_us\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"domain_us\",\"searchable\":true,\"sortable\":true}},\"mx_site\":{\"edit\":{\"label\":\"mx_site\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mx_site\",\"searchable\":true,\"sortable\":true}},\"domain_mx\":{\"edit\":{\"label\":\"domain_mx\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"domain_mx\",\"searchable\":true,\"sortable\":true}},\"pages\":{\"edit\":{\"label\":\"pages\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"documentId\"},\"list\":{\"label\":\"pages\",\"searchable\":false,\"sortable\":false}},\"faqs\":{\"edit\":{\"label\":\"faqs\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"documentId\"},\"list\":{\"label\":\"faqs\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"slug\",\"domain_us\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"domain_us\",\"size\":6},{\"name\":\"mx_site\",\"size\":4}],[{\"name\":\"domain_mx\",\"size\":6},{\"name\":\"pages\",\"size\":6}],[{\"name\":\"faqs\",\"size\":6}]]},\"uid\":\"api::site.site\"}','object',NULL,NULL),(41,'plugin_content_manager_configuration_components::shared.nav-links','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"label\",\"defaultSortBy\":\"label\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}},\"sectionId\":{\"edit\":{\"label\":\"sectionId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"sectionId\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"label\",\"sectionId\"],\"edit\":[[{\"name\":\"label\",\"size\":6},{\"name\":\"sectionId\",\"size\":6}]]},\"uid\":\"shared.nav-links\",\"isComponent\":true}','object',NULL,NULL),(42,'plugin_content_manager_configuration_content_types::api::navbar.navbar','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"logoAlt\",\"defaultSortBy\":\"logoAlt\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"logo\":{\"edit\":{\"label\":\"logo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"logo\",\"searchable\":false,\"sortable\":false}},\"logoAlt\":{\"edit\":{\"label\":\"logoAlt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"logoAlt\",\"searchable\":true,\"sortable\":true}},\"link\":{\"edit\":{\"label\":\"link\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"link\",\"searchable\":false,\"sortable\":false}},\"site\":{\"edit\":{\"label\":\"site\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"site\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"logo\",\"logoAlt\",\"link\"],\"edit\":[[{\"name\":\"logo\",\"size\":6},{\"name\":\"logoAlt\",\"size\":6}],[{\"name\":\"link\",\"size\":12}],[{\"name\":\"site\",\"size\":6}]]},\"uid\":\"api::navbar.navbar\"}','object',NULL,NULL),(43,'plugin_content_manager_configuration_components::faq.faq','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"question\",\"defaultSortBy\":\"question\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"question\":{\"edit\":{\"label\":\"question\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"question\",\"searchable\":true,\"sortable\":true}},\"answer\":{\"edit\":{\"label\":\"answer\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"answer\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"question\",\"size\":6},{\"name\":\"answer\",\"size\":6}]],\"list\":[\"id\",\"question\",\"answer\"]},\"uid\":\"faq.faq\",\"isComponent\":true}','object',NULL,NULL),(44,'plugin_content_manager_configuration_content_types::api::block-faq.block-faq','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"documentId\",\"defaultSortBy\":\"documentId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"Faq\":{\"edit\":{\"label\":\"Faq\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Faq\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Faq\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"Faq\",\"size\":12}]]},\"uid\":\"api::block-faq.block-faq\"}','object',NULL,NULL),(45,'plugin_content_manager_configuration_content_types::api::page.page','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"documentId\",\"defaultSortBy\":\"documentId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"site\":{\"edit\":{\"label\":\"site\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"site\",\"searchable\":true,\"sortable\":true}},\"page\":{\"edit\":{\"label\":\"page\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"page_structure\":{\"edit\":{\"label\":\"page_structure\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"page_structure\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"slug\",\"site\",\"createdAt\"],\"edit\":[[{\"name\":\"slug\",\"size\":6},{\"name\":\"site\",\"size\":6}],[{\"name\":\"page\",\"size\":6},{\"name\":\"title\",\"size\":6}],[{\"name\":\"page_structure\",\"size\":12}]]},\"uid\":\"api::page.page\"}','object',NULL,NULL),(46,'plugin_content_manager_configuration_content_types::api::faq.faq','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"documentId\",\"defaultSortBy\":\"documentId\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"site\":{\"edit\":{\"label\":\"site\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"site\",\"searchable\":true,\"sortable\":true}},\"faq\":{\"edit\":{\"label\":\"faq\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"faq\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"site\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"site\",\"size\":6}],[{\"name\":\"faq\",\"size\":12}]]},\"uid\":\"api::faq.faq\"}','object',NULL,NULL),(47,'plugin_content_manager_configuration_components::shared.buttons','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"label\",\"defaultSortBy\":\"label\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"sort\":{\"edit\":{\"label\":\"sort\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"sort\",\"searchable\":true,\"sortable\":true}},\"hasClass\":{\"edit\":{\"label\":\"hasClass\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hasClass\",\"searchable\":true,\"sortable\":true}},\"className\":{\"edit\":{\"label\":\"className\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"className\",\"searchable\":true,\"sortable\":true}},\"hasCss\":{\"edit\":{\"label\":\"hasCss\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hasCss\",\"searchable\":true,\"sortable\":true}},\"css\":{\"edit\":{\"label\":\"css\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"css\",\"searchable\":true,\"sortable\":true}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"label\",\"url\",\"hasClass\"],\"edit\":[[{\"name\":\"label\",\"size\":6},{\"name\":\"url\",\"size\":6}],[{\"name\":\"hasClass\",\"size\":4},{\"name\":\"className\",\"size\":6}],[{\"name\":\"hasCss\",\"size\":4},{\"name\":\"css\",\"size\":6}],[{\"name\":\"sort\",\"size\":4}]]},\"uid\":\"shared.buttons\",\"isComponent\":true}','object',NULL,NULL),(48,'plugin_content_manager_configuration_components::blocks.hero','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"background\":{\"edit\":{\"label\":\"background\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"background\",\"searchable\":false,\"sortable\":false}},\"sort\":{\"edit\":{\"label\":\"sort\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"sort\",\"searchable\":true,\"sortable\":true}},\"buttons\":{\"edit\":{\"label\":\"buttons\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"buttons\",\"searchable\":false,\"sortable\":false}},\"documentId\":{\"edit\":{},\"list\":{\"label\":\"documentId\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"background\",\"buttons\"],\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"description\",\"size\":12}],[{\"name\":\"background\",\"size\":6}],[{\"name\":\"buttons\",\"size\":12}],[{\"name\":\"sort\",\"size\":4}]]},\"uid\":\"blocks.hero\",\"isComponent\":true}','object',NULL,NULL);
/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_database_schema`
--

DROP TABLE IF EXISTS `strapi_database_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_database_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `schema` json DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_database_schema`
--

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;
INSERT INTO `strapi_database_schema` VALUES (27,'{\"tables\": [{\"name\": \"files\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"alternative_text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"caption\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"width\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"height\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"formats\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"hash\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"ext\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"mime\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"size\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"preview_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider_metadata\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_files_folder_path_index\", \"type\": null, \"columns\": [\"folder_path\"]}, {\"name\": \"upload_files_created_at_index\", \"type\": null, \"columns\": [\"created_at\"]}, {\"name\": \"upload_files_updated_at_index\", \"type\": null, \"columns\": [\"updated_at\"]}, {\"name\": \"upload_files_name_index\", \"type\": null, \"columns\": [\"name\"]}, {\"name\": \"upload_files_size_index\", \"type\": null, \"columns\": [\"size\"]}, {\"name\": \"upload_files_ext_index\", \"type\": null, \"columns\": [\"ext\"]}, {\"name\": \"files_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path_id\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_path_id_index\", \"type\": \"unique\", \"columns\": [\"path_id\"]}, {\"name\": \"upload_folders_path_index\", \"type\": \"unique\", \"columns\": [\"path\"]}, {\"name\": \"upload_folders_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"i18n_locale\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"i18n_locale_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_releases\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"released_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"scheduled_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"timezone\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"status\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_releases_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_releases_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_releases_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_releases_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_releases_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_release_actions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"content_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"entry_document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_entry_valid\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_release_actions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_release_actions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_release_actions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_release_actions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_release_actions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"content_types\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_workflows_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_workflows_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"color\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stages_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_workflows_stages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_workflows_stages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_roles_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmation_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmed\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"abouts_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"abouts_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"abouts_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"abouts_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"abouts_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"abouts_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"abouts\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"abouts\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"abouts_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"abouts_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"abouts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"abouts_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"abouts_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"authors\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"authors_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"authors_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"authors_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"authors_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"authors_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"block_faqs_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"block_faqs_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"block_faqs_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"block_faqs_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"block_faqs_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"block_faqs_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"block_faqs\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"block_faqs\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"block_faqs_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"block_faqs_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"block_faqs_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"block_faqs_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"block_faqs_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"categories\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"slug\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"categories_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"categories_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"categories_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"categories_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"faqs_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"faqs_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"faqs_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"faqs_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"faqs_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"faqs_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"faqs\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"faqs\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"faqs_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"faqs_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"faqs_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"faqs_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"faqs_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"globals_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"globals_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"globals_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"globals_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"globals_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"globals_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"globals\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"globals\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"site_name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"site_description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"globals_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"globals_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"globals_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"globals_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"globals_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navbars_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navbars_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"navbars_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"navbars_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"navbars_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"navbars_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navbars\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navbars\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"logo_alt\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navbars_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"navbars_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"navbars_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"navbars_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navbars_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"pages_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"pages_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"pages_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"pages_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"pages_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"pages_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"pages\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"pages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"slug\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"page\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"pages_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"pages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"pages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"sites\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"slug\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"domain_us\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"mx_site\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"domain_mx\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"sites_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"sites_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"sites_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"sites_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"sites_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action_parameters\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"subject\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"properties\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"conditions\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"firstname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lastname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"registration_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_active\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"prefered_language\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_roles_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"encrypted_key\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_tokens_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_tokens_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_shared_sliders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_seos\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"meta_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"meta_description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_rich_texts\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"body\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_quotes\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"body\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_nav_links\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"label\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"section_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_media\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_shared_buttons\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"label\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"sort\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"has_class\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"class_name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"has_css\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"css\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_faq_faqs\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"question\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"answer\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_blocks_heroes_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_blocks_heroes_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"components_blocks_heroes_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"components_blocks_heroes_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_blocks_heroes_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_blocks_heroes_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_blocks_heroes\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_blocks_heroes\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"sort\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_core_store_settings\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"value\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"environment\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"tag\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_webhooks\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"url\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"headers\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"events\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"enabled\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_history_versions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"content_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"related_document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"status\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"data\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"schema\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_history_versions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_history_versions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_related_mph\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_related_mph_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_related_mph_oidx\", \"columns\": [\"order\"]}, {\"name\": \"files_related_mph_idix\", \"columns\": [\"related_id\"]}], \"foreignKeys\": [{\"name\": \"files_related_mph_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_folder_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"file_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_folder_lnk_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_folder_lnk_ifk\", \"columns\": [\"folder_id\"]}, {\"name\": \"files_folder_lnk_uq\", \"type\": \"unique\", \"columns\": [\"file_id\", \"folder_id\"]}, {\"name\": \"files_folder_lnk_oifk\", \"columns\": [\"file_ord\"]}], \"foreignKeys\": [{\"name\": \"files_folder_lnk_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_folder_lnk_ifk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders_parent_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"inv_folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_parent_lnk_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"upload_folders_parent_lnk_ifk\", \"columns\": [\"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_lnk_uq\", \"type\": \"unique\", \"columns\": [\"folder_id\", \"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_lnk_oifk\", \"columns\": [\"folder_ord\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_parent_lnk_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_parent_lnk_ifk\", \"columns\": [\"inv_folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_release_actions_release_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"release_action_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"release_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"release_action_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_release_actions_release_lnk_fk\", \"columns\": [\"release_action_id\"]}, {\"name\": \"strapi_release_actions_release_lnk_ifk\", \"columns\": [\"release_id\"]}, {\"name\": \"strapi_release_actions_release_lnk_uq\", \"type\": \"unique\", \"columns\": [\"release_action_id\", \"release_id\"]}, {\"name\": \"strapi_release_actions_release_lnk_oifk\", \"columns\": [\"release_action_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_release_actions_release_lnk_fk\", \"columns\": [\"release_action_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_release_actions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_release_actions_release_lnk_ifk\", \"columns\": [\"release_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_releases\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"workflow_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"workflow_stage_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stage_required_to_publish_lnk_fk\", \"columns\": [\"workflow_id\"]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk_ifk\", \"columns\": [\"workflow_stage_id\"]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk_uq\", \"type\": \"unique\", \"columns\": [\"workflow_id\", \"workflow_stage_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stage_required_to_publish_lnk_fk\", \"columns\": [\"workflow_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk_ifk\", \"columns\": [\"workflow_stage_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows_stages\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stages_workflow_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"workflow_stage_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"workflow_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"workflow_stage_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stages_workflow_lnk_fk\", \"columns\": [\"workflow_stage_id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_ifk\", \"columns\": [\"workflow_id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_uq\", \"type\": \"unique\", \"columns\": [\"workflow_stage_id\", \"workflow_id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_oifk\", \"columns\": [\"workflow_stage_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stages_workflow_lnk_fk\", \"columns\": [\"workflow_stage_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows_stages\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_ifk\", \"columns\": [\"workflow_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stages_permissions_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"workflow_stage_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stages_permissions_lnk_fk\", \"columns\": [\"workflow_stage_id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_ifk\", \"columns\": [\"permission_id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_uq\", \"type\": \"unique\", \"columns\": [\"workflow_stage_id\", \"permission_id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_ofk\", \"columns\": [\"permission_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stages_permissions_lnk_fk\", \"columns\": [\"workflow_stage_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows_stages\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_ifk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_permissions\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions_role_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"up_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_permissions_role_lnk_uq\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"up_permissions_role_lnk_oifk\", \"columns\": [\"permission_ord\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users_role_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_role_lnk_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"up_users_role_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_users_role_lnk_uq\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"up_users_role_lnk_oifk\", \"columns\": [\"user_ord\"]}], \"foreignKeys\": [{\"name\": \"up_users_role_lnk_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_role_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"faqs_site_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"faq_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"site_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"faq_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"faqs_site_lnk_fk\", \"columns\": [\"faq_id\"]}, {\"name\": \"faqs_site_lnk_ifk\", \"columns\": [\"site_id\"]}, {\"name\": \"faqs_site_lnk_uq\", \"type\": \"unique\", \"columns\": [\"faq_id\", \"site_id\"]}, {\"name\": \"faqs_site_lnk_oifk\", \"columns\": [\"faq_ord\"]}], \"foreignKeys\": [{\"name\": \"faqs_site_lnk_fk\", \"columns\": [\"faq_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"faqs\", \"referencedColumns\": [\"id\"]}, {\"name\": \"faqs_site_lnk_ifk\", \"columns\": [\"site_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sites\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"navbars_site_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"navbar_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"site_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"navbars_site_lnk_fk\", \"columns\": [\"navbar_id\"]}, {\"name\": \"navbars_site_lnk_ifk\", \"columns\": [\"site_id\"]}, {\"name\": \"navbars_site_lnk_uq\", \"type\": \"unique\", \"columns\": [\"navbar_id\", \"site_id\"]}], \"foreignKeys\": [{\"name\": \"navbars_site_lnk_fk\", \"columns\": [\"navbar_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"navbars\", \"referencedColumns\": [\"id\"]}, {\"name\": \"navbars_site_lnk_ifk\", \"columns\": [\"site_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sites\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"pages_site_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"page_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"site_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"page_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"pages_site_lnk_fk\", \"columns\": [\"page_id\"]}, {\"name\": \"pages_site_lnk_ifk\", \"columns\": [\"site_id\"]}, {\"name\": \"pages_site_lnk_uq\", \"type\": \"unique\", \"columns\": [\"page_id\", \"site_id\"]}, {\"name\": \"pages_site_lnk_oifk\", \"columns\": [\"page_ord\"]}], \"foreignKeys\": [{\"name\": \"pages_site_lnk_fk\", \"columns\": [\"page_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"pages\", \"referencedColumns\": [\"id\"]}, {\"name\": \"pages_site_lnk_ifk\", \"columns\": [\"site_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sites\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_permissions_role_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"admin_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_permissions_role_lnk_uq\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"admin_permissions_role_lnk_oifk\", \"columns\": [\"permission_ord\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users_roles_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_roles_lnk_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"admin_users_roles_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_users_roles_lnk_uq\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"admin_users_roles_lnk_ofk\", \"columns\": [\"role_ord\"]}, {\"name\": \"admin_users_roles_lnk_oifk\", \"columns\": [\"user_ord\"]}], \"foreignKeys\": [{\"name\": \"admin_users_roles_lnk_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_roles_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions_token_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"api_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_token_lnk_fk\", \"columns\": [\"api_token_permission_id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_ifk\", \"columns\": [\"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_uq\", \"type\": \"unique\", \"columns\": [\"api_token_permission_id\", \"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_oifk\", \"columns\": [\"api_token_permission_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_token_lnk_fk\", \"columns\": [\"api_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_ifk\", \"columns\": [\"api_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"transfer_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_token_lnk_fk\", \"columns\": [\"transfer_token_permission_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_ifk\", \"columns\": [\"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_uq\", \"type\": \"unique\", \"columns\": [\"transfer_token_permission_id\", \"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_oifk\", \"columns\": [\"transfer_token_permission_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_token_lnk_fk\", \"columns\": [\"transfer_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_ifk\", \"columns\": [\"transfer_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_tokens\", \"referencedColumns\": [\"id\"]}]}]}','2025-08-22 15:19:14','98f5d458d894d1997e789ab81f9081a3c25dcf6004b51966756f012ead53a385');
/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_history_versions`
--

DROP TABLE IF EXISTS `strapi_history_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_history_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) NOT NULL,
  `related_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `data` json DEFAULT NULL,
  `schema` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_history_versions_created_by_id_fk` (`created_by_id`),
  CONSTRAINT `strapi_history_versions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_history_versions`
--

LOCK TABLES `strapi_history_versions` WRITE;
/*!40000 ALTER TABLE `strapi_history_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_history_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations`
--

DROP TABLE IF EXISTS `strapi_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations`
--

LOCK TABLES `strapi_migrations` WRITE;
/*!40000 ALTER TABLE `strapi_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations_internal`
--

DROP TABLE IF EXISTS `strapi_migrations_internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_migrations_internal` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations_internal`
--

LOCK TABLES `strapi_migrations_internal` WRITE;
/*!40000 ALTER TABLE `strapi_migrations_internal` DISABLE KEYS */;
INSERT INTO `strapi_migrations_internal` VALUES (1,'5.0.0-rename-identifiers-longer-than-max-length','2025-07-23 05:51:29'),(2,'5.0.0-02-created-document-id','2025-07-23 05:51:30'),(3,'5.0.0-03-created-locale','2025-07-23 05:51:30'),(4,'5.0.0-04-created-published-at','2025-07-23 05:51:30'),(5,'5.0.0-05-drop-slug-fields-index','2025-07-23 05:51:30'),(6,'core::5.0.0-discard-drafts','2025-07-23 05:51:30');
/*!40000 ALTER TABLE `strapi_migrations_internal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_release_actions`
--

DROP TABLE IF EXISTS `strapi_release_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_release_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `entry_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `is_entry_valid` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_release_actions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_release_actions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_release_actions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_release_actions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_release_actions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_release_actions`
--

LOCK TABLES `strapi_release_actions` WRITE;
/*!40000 ALTER TABLE `strapi_release_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_release_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_release_actions_release_lnk`
--

DROP TABLE IF EXISTS `strapi_release_actions_release_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_release_actions_release_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `release_action_id` int unsigned DEFAULT NULL,
  `release_id` int unsigned DEFAULT NULL,
  `release_action_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_release_actions_release_lnk_uq` (`release_action_id`,`release_id`),
  KEY `strapi_release_actions_release_lnk_fk` (`release_action_id`),
  KEY `strapi_release_actions_release_lnk_ifk` (`release_id`),
  KEY `strapi_release_actions_release_lnk_oifk` (`release_action_ord`),
  CONSTRAINT `strapi_release_actions_release_lnk_fk` FOREIGN KEY (`release_action_id`) REFERENCES `strapi_release_actions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_release_actions_release_lnk_ifk` FOREIGN KEY (`release_id`) REFERENCES `strapi_releases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_release_actions_release_lnk`
--

LOCK TABLES `strapi_release_actions_release_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_release_actions_release_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_release_actions_release_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_releases`
--

DROP TABLE IF EXISTS `strapi_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_releases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `released_at` datetime(6) DEFAULT NULL,
  `scheduled_at` datetime(6) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_releases_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_releases_created_by_id_fk` (`created_by_id`),
  KEY `strapi_releases_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_releases_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_releases_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_releases`
--

LOCK TABLES `strapi_releases` WRITE;
/*!40000 ALTER TABLE `strapi_releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions`
--

LOCK TABLES `strapi_transfer_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions_token_lnk`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions_token_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions_token_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transfer_token_permission_id` int unsigned DEFAULT NULL,
  `transfer_token_id` int unsigned DEFAULT NULL,
  `transfer_token_permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_transfer_token_permissions_token_lnk_uq` (`transfer_token_permission_id`,`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_fk` (`transfer_token_permission_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_ifk` (`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_oifk` (`transfer_token_permission_ord`),
  CONSTRAINT `strapi_transfer_token_permissions_token_lnk_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_transfer_token_permissions_token_lnk_ifk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions_token_lnk`
--

LOCK TABLES `strapi_transfer_token_permissions_token_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_tokens`
--

DROP TABLE IF EXISTS `strapi_transfer_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_tokens`
--

LOCK TABLES `strapi_transfer_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` json DEFAULT NULL,
  `events` json DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows`
--

DROP TABLE IF EXISTS `strapi_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content_types` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_workflows_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_workflows_created_by_id_fk` (`created_by_id`),
  KEY `strapi_workflows_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_workflows_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_workflows_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows`
--

LOCK TABLES `strapi_workflows` WRITE;
/*!40000 ALTER TABLE `strapi_workflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stage_required_to_publish_lnk`
--

DROP TABLE IF EXISTS `strapi_workflows_stage_required_to_publish_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stage_required_to_publish_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `workflow_id` int unsigned DEFAULT NULL,
  `workflow_stage_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stage_required_to_publish_lnk_uq` (`workflow_id`,`workflow_stage_id`),
  KEY `strapi_workflows_stage_required_to_publish_lnk_fk` (`workflow_id`),
  KEY `strapi_workflows_stage_required_to_publish_lnk_ifk` (`workflow_stage_id`),
  CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_fk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_ifk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stage_required_to_publish_lnk`
--

LOCK TABLES `strapi_workflows_stage_required_to_publish_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stage_required_to_publish_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stage_required_to_publish_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stages`
--

DROP TABLE IF EXISTS `strapi_workflows_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_workflows_stages_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_workflows_stages_created_by_id_fk` (`created_by_id`),
  KEY `strapi_workflows_stages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_workflows_stages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_workflows_stages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stages`
--

LOCK TABLES `strapi_workflows_stages` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stages` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stages_permissions_lnk`
--

DROP TABLE IF EXISTS `strapi_workflows_stages_permissions_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stages_permissions_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `workflow_stage_id` int unsigned DEFAULT NULL,
  `permission_id` int unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stages_permissions_lnk_uq` (`workflow_stage_id`,`permission_id`),
  KEY `strapi_workflows_stages_permissions_lnk_fk` (`workflow_stage_id`),
  KEY `strapi_workflows_stages_permissions_lnk_ifk` (`permission_id`),
  KEY `strapi_workflows_stages_permissions_lnk_ofk` (`permission_ord`),
  CONSTRAINT `strapi_workflows_stages_permissions_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stages_permissions_lnk_ifk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stages_permissions_lnk`
--

LOCK TABLES `strapi_workflows_stages_permissions_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stages_permissions_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stages_permissions_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stages_workflow_lnk`
--

DROP TABLE IF EXISTS `strapi_workflows_stages_workflow_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stages_workflow_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `workflow_stage_id` int unsigned DEFAULT NULL,
  `workflow_id` int unsigned DEFAULT NULL,
  `workflow_stage_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stages_workflow_lnk_uq` (`workflow_stage_id`,`workflow_id`),
  KEY `strapi_workflows_stages_workflow_lnk_fk` (`workflow_stage_id`),
  KEY `strapi_workflows_stages_workflow_lnk_ifk` (`workflow_id`),
  KEY `strapi_workflows_stages_workflow_lnk_oifk` (`workflow_stage_ord`),
  CONSTRAINT `strapi_workflows_stages_workflow_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stages_workflow_lnk_ifk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stages_workflow_lnk`
--

LOCK TABLES `strapi_workflows_stages_workflow_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stages_workflow_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stages_workflow_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions`
--

DROP TABLE IF EXISTS `up_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions`
--

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;
INSERT INTO `up_permissions` VALUES (1,'e0nn8wg61tx3wksux8y8htg9','plugin::users-permissions.user.me','2025-07-23 05:51:47.970000','2025-07-23 05:51:47.970000','2025-07-23 05:51:47.974000',NULL,NULL,NULL),(2,'tp4q75m67louj4sf0rcmdznc','plugin::users-permissions.auth.changePassword','2025-07-23 05:51:47.970000','2025-07-23 05:51:47.970000','2025-07-23 05:51:47.974000',NULL,NULL,NULL),(3,'f9shh7tsbs4yuqmu6ohnwc1b','plugin::users-permissions.auth.callback','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.027000',NULL,NULL,NULL),(4,'yxc7t0ohsgxmcgw4idhnkuur','plugin::users-permissions.auth.connect','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.027000',NULL,NULL,NULL),(5,'vju55cc2w2mc26eu6jg2i5ur','plugin::users-permissions.auth.forgotPassword','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.027000',NULL,NULL,NULL),(6,'fvyzgichys23x3aw63xtzwjq','plugin::users-permissions.auth.resetPassword','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.027000',NULL,NULL,NULL),(7,'dsjxeegbd87006597hjzem8b','plugin::users-permissions.auth.register','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.027000',NULL,NULL,NULL),(8,'c9cn6tywbeti8ov0m4obrp40','plugin::users-permissions.auth.emailConfirmation','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.027000',NULL,NULL,NULL),(9,'b89k239z9np6acb4bhgsjgbp','plugin::users-permissions.auth.sendEmailConfirmation','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.026000','2025-07-23 05:51:48.028000',NULL,NULL,NULL),(12,'x50mdaac4n6aea48gtjr1ovx','api::category.category.find','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.208000',NULL,NULL,NULL),(13,'xeayqkrhyxvctu9gsvh91dw4','api::category.category.findOne','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.208000',NULL,NULL,NULL),(14,'sd3ovpp2rscluzau7kt37nlf','api::author.author.find','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.208000',NULL,NULL,NULL),(15,'c2gpy0zv5de9cd7i68op8hdg','api::author.author.findOne','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.208000',NULL,NULL,NULL),(16,'s7qmo3u6ve43o13le3l0f4tb','api::global.global.find','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.208000',NULL,NULL,NULL),(18,'py0a18vrgdyg1kp2tjy836ok','api::about.about.find','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.207000','2025-07-23 05:51:56.208000',NULL,NULL,NULL),(22,'qiqswkwdtvs1kyopqt4l6thn','api::site.site.find','2025-07-29 16:50:11.865000','2025-07-29 16:50:11.865000','2025-07-29 16:50:11.866000',NULL,NULL,NULL),(23,'w5plclknhi8c2sqeuu43eba2','api::site.site.findOne','2025-07-29 16:50:11.865000','2025-07-29 16:50:11.865000','2025-07-29 16:50:11.866000',NULL,NULL,NULL),(24,'vhukcjlhtomvfjno6up7efwg','api::navbar.navbar.find','2025-08-05 22:02:12.128000','2025-08-05 22:02:12.128000','2025-08-05 22:02:12.129000',NULL,NULL,NULL),(25,'r4fbv9jz4eqk51x23peztp7d','api::page.page.find','2025-08-22 03:29:03.839000','2025-08-22 03:29:03.839000','2025-08-22 03:29:03.839000',NULL,NULL,NULL),(26,'mjzxc77hwb4k0k9ro96rxi8h','api::page.page.findOne','2025-08-22 03:29:03.839000','2025-08-22 03:29:03.839000','2025-08-22 03:29:03.839000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions_role_lnk`
--

DROP TABLE IF EXISTS `up_permissions_role_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions_role_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  KEY `up_permissions_role_lnk_fk` (`permission_id`),
  KEY `up_permissions_role_lnk_ifk` (`role_id`),
  KEY `up_permissions_role_lnk_oifk` (`permission_ord`),
  CONSTRAINT `up_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions_role_lnk`
--

LOCK TABLES `up_permissions_role_lnk` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_lnk` DISABLE KEYS */;
INSERT INTO `up_permissions_role_lnk` VALUES (1,1,1,1),(2,2,1,1),(3,3,2,1),(4,8,2,1),(5,7,2,1),(6,5,2,1),(7,6,2,1),(8,9,2,1),(9,4,2,1),(12,12,2,2),(13,15,2,2),(14,16,2,2),(15,14,2,3),(16,13,2,3),(19,18,2,3),(22,22,2,5),(23,23,2,5),(24,24,2,6),(25,25,2,7),(26,26,2,7);
/*!40000 ALTER TABLE `up_permissions_role_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_roles`
--

DROP TABLE IF EXISTS `up_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_roles`
--

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;
INSERT INTO `up_roles` VALUES (1,'cr5og7rnr73q437sgu5wavqh','Authenticated','Default role given to authenticated user.','authenticated','2025-07-23 05:51:47.926000','2025-07-23 05:51:47.926000','2025-07-23 05:51:47.927000',NULL,NULL,NULL),(2,'diwhjl5l167q50u7nt920q1u','Public','Default role given to unauthenticated user.','public','2025-07-23 05:51:47.944000','2025-08-22 03:29:03.819000','2025-07-23 05:51:47.945000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users`
--

DROP TABLE IF EXISTS `up_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users`
--

LOCK TABLES `up_users` WRITE;
/*!40000 ALTER TABLE `up_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_role_lnk`
--

DROP TABLE IF EXISTS `up_users_role_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users_role_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `user_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_lnk_uq` (`user_id`,`role_id`),
  KEY `up_users_role_lnk_fk` (`user_id`),
  KEY `up_users_role_lnk_ifk` (`role_id`),
  KEY `up_users_role_lnk_oifk` (`user_ord`),
  CONSTRAINT `up_users_role_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_role_lnk`
--

LOCK TABLES `up_users_role_lnk` WRITE;
/*!40000 ALTER TABLE `up_users_role_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users_role_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders`
--

DROP TABLE IF EXISTS `upload_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders`
--

LOCK TABLES `upload_folders` WRITE;
/*!40000 ALTER TABLE `upload_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders_parent_lnk`
--

DROP TABLE IF EXISTS `upload_folders_parent_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders_parent_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int unsigned DEFAULT NULL,
  `inv_folder_id` int unsigned DEFAULT NULL,
  `folder_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_lnk_uq` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_lnk_fk` (`folder_id`),
  KEY `upload_folders_parent_lnk_ifk` (`inv_folder_id`),
  KEY `upload_folders_parent_lnk_oifk` (`folder_ord`),
  CONSTRAINT `upload_folders_parent_lnk_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_lnk_ifk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders_parent_lnk`
--

LOCK TABLES `upload_folders_parent_lnk` WRITE;
/*!40000 ALTER TABLE `upload_folders_parent_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders_parent_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'strapi_db'
--

--
-- Dumping routines for database 'strapi_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-22 16:04:07
