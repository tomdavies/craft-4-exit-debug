-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: c4debug
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nlxazybpzvalxngkvchouqyyryzgfpubokqq` (`ownerId`),
  CONSTRAINT `fk_cbkjpxtchnyfstkpvwwzfwsthdxatzgosuoe` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nlxazybpzvalxngkvchouqyyryzgfpubokqq` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mxplslzhocrcawcwccgnitzsikplqphezold` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_tqsgyoppouenqpszoghlqnznyawxlnbhwzop` (`dateRead`),
  KEY `fk_vbfiissyhgowzjbzxzjgywcvqpjioinixvju` (`pluginId`),
  CONSTRAINT `fk_kpabyjwwharhwjgvvrmiyvwipccpfsuqqwob` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vbfiissyhgowzjbzxzjgywcvqpjioinixvju` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_khuapsemjgsgevuykwqgqfdwudqzycgdcwnd` (`volumeId`),
  KEY `idx_iyehyxotkuthkumekbjuksaoqmjiwqcidfaw` (`volumeId`),
  KEY `fk_ubrmjhlfptdkkcmfuhwbbvubfynrentrizbl` (`sessionId`),
  CONSTRAINT `fk_tmyeuqawozaovgxouhgiaxudjpshdfdfayov` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubrmjhlfptdkkcmfuhwbbvubfynrentrizbl` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text COLLATE utf8_unicode_ci,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8_unicode_ci,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cvwnczcvmsxonkwcoxwtbwohsrqpnnkkocvj` (`filename`,`folderId`),
  KEY `idx_xvsvdsvhhmvrurzcnqinejoakkukrkkkzekh` (`folderId`),
  KEY `idx_flvcaonpmumdmfbvfsurimmkblczlcfbogjp` (`volumeId`),
  KEY `fk_ghokoetpcxuhcmjkardzcfcohosmluzsvevd` (`uploaderId`),
  CONSTRAINT `fk_axwryvsptueravvitmxswtflvtaqyqkdnhgs` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ghokoetpcxuhcmjkardzcfcohosmluzsvevd` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ixvapjbmenqjhuxmwizlnsgkrwbbjyzmioio` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nudqufbvqtrggocmqccqpsnobuhiwulmmfkt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kvlsgfanjueqbnoievflwqmklvyhfhaucmwb` (`groupId`),
  KEY `fk_irzfiqdsdraqrtkxjrwelacwlwwhqdwrlffq` (`parentId`),
  CONSTRAINT `fk_irzfiqdsdraqrtkxjrwelacwlwwhqdwrlffq` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wjwsrkdqftkgfkopysytwautmhqfqhkltjof` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zgvfxcxsvbdxapppkzvficjpcpwbvleapsjn` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_owbciwsndojpzvmehldbdbknvgoeahmjdohi` (`name`),
  KEY `idx_ogitxdcrxuwuyhbacdmralkyogrhebpikenl` (`handle`),
  KEY `idx_xhdbknkpuvgiockqsrbmjcqdhbnkoqxqhycm` (`structureId`),
  KEY `idx_pcubocqiygbbzmlpfgphtrofkzrjwowrkatl` (`fieldLayoutId`),
  KEY `idx_qjssoarsmnoptsfpfyyvvbhhltkefzdhruzd` (`dateDeleted`),
  CONSTRAINT `fk_hhqcazgvvgvonskxcudoukbewcwxmrfgalfe` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wswzsrbygzqokxzjtgiqbmtxzbrhdoacxggz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zvpwjcwjdpccxpgzkqrofilbxyhnqwbmunah` (`groupId`,`siteId`),
  KEY `idx_xoimamwihjzyawdwpozsqosizxwsydjcksyi` (`siteId`),
  CONSTRAINT `fk_jalwlxdwpotuldsphzwrfcadccsrtxivuano` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_njdjmxbfpadtzeghsoceqokkrrmfrcspybxb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_kpnzckbyvjonhefpxaseymdjlyqklmodnrdy` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ibgralivhiynvemfwzwxqbynwvqewbtfhdmc` (`siteId`),
  KEY `fk_yhfowxruanoghahvqkslnyprhefrvywkzvug` (`userId`),
  CONSTRAINT `fk_ibgralivhiynvemfwzwxqbynwvqewbtfhdmc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yhfowxruanoghahvqkslnyprhefrvywkzvug` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ywaibhletaqvwliwbfjaotuwnxijjjwkhgkt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_hoaytxcsekykvxzasnsoyjxwhumhokcxyoas` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_fumewhmktdpkqcswhoefcvlkrcdomsdovmqa` (`siteId`),
  KEY `fk_xwivgqglbfbmklmkybwkctcoqfsojbqcgldl` (`fieldId`),
  KEY `fk_tazkkrzymwahqebeoldqtvlrcbyngknrochk` (`userId`),
  CONSTRAINT `fk_eiklftcczaaudlevnuebkxtpczeefxhghplg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fumewhmktdpkqcswhoefcvlkrcdomsdovmqa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tazkkrzymwahqebeoldqtvlrcbyngknrochk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_xwivgqglbfbmklmkybwkctcoqfsojbqcgldl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_harlkqdnbzuuilwcgjwzmxetxxlgckcnifnj` (`elementId`,`siteId`),
  KEY `idx_dqodxyiutdyqnsdtqnkzfilsbxxqycuxdkbv` (`siteId`),
  KEY `idx_nvyejwyzyjfwzsdiaakbnrsjwgzhuzofkuke` (`title`),
  CONSTRAINT `fk_ghcgldqelgaxclrtgsttogtlalrvdepuymod` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iumpwywrbwkhbwyqkqclqdrlnkuqberosmeg` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-04-21 10:33:02','2022-04-21 10:33:02','27a839a3-8c8c-410b-b5d4-dbe92d370e16');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tyasrrbkrqqlyydaohdummpzhaxibkniehye` (`userId`),
  CONSTRAINT `fk_tyasrrbkrqqlyydaohdummpzhaxibkniehye` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `traces` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qvbfowysrnyuomngmwszewlsmxfsbowzdsrl` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_txolrmdkmdzjvyqzhjhkeljyvmpdsxfleegc` (`creatorId`,`provisional`),
  KEY `idx_yqtjcsemqsaqlbqvyykqtfesnnuljttykgfj` (`saved`),
  KEY `fk_nzgwfevucjjrncsnmyiicavjkmghmackewtj` (`canonicalId`),
  CONSTRAINT `fk_nzgwfevucjjrncsnmyiicavjkmghmackewtj` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uaexhlpvcvnpdbpxcuzptbkqwdmpfjntremq` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_znbywimpxvkefkbckneeeyjtkngofwfdtbaj` (`dateDeleted`),
  KEY `idx_ssjwezfiflyehwscqdzrgvdfzuacxhmldtun` (`fieldLayoutId`),
  KEY `idx_nzhnyrkaqaeakjxrcjsaqnapmqhaewmrxwzc` (`type`),
  KEY `idx_ffvpgoryrkbtoljqlokcmuebsygixpkmmcbf` (`enabled`),
  KEY `idx_tversnctfzlaqhsddmuinhprpuziekeacvxb` (`archived`,`dateCreated`),
  KEY `idx_splgyqyozkgzrvbrjdfgyypixcypfxoeewfp` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_qfesplequxiwuldktgxutgjxnyvxnvtkmkyt` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_bhfyzezovdyyzzeauwmmazcirbvgnmyilomj` (`canonicalId`),
  KEY `fk_drqfgnpsbfisaedoyvfnynukhpmjbciovidw` (`draftId`),
  KEY `fk_xkyajsgwjwzzyiorrgzeixutorqubdrehyom` (`revisionId`),
  CONSTRAINT `fk_bhfyzezovdyyzzeauwmmazcirbvgnmyilomj` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_drqfgnpsbfisaedoyvfnynukhpmjbciovidw` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_krstxvgsdwrogaqlanfvljolufrnyicxyaxg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xkyajsgwjwzzyiorrgzeixutorqubdrehyom` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-04-21 10:33:02','2022-04-21 10:33:02',NULL,NULL,'93b01ef8-64f6-4622-b1ac-609c70f75c7b');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kavkugykbrojzsjuymqhmsujxbmzhdlxohez` (`elementId`,`siteId`),
  KEY `idx_rrqlmytenkfljhcifrejhxvjwgttojpnrzwz` (`siteId`),
  KEY `idx_hijnrlnrhjrfzzykommtysvwoffjtkpsgdjy` (`slug`,`siteId`),
  KEY `idx_wieuikicpugkckneroyhbnwmbdeqzmogfyhi` (`enabled`),
  KEY `idx_yboduxbncjjqkgyavisulenigzhoxwxehxsj` (`uri`,`siteId`),
  CONSTRAINT `fk_rxdpgozlxngiwcplapaxsvznacatzznaohgv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xqdkdvfhtktshmashzdeyztpnvxmuhtvwbwt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-04-21 10:33:02','2022-04-21 10:33:02','53eaa938-5beb-4d9b-bd55-b4c87f45987d');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wxvidamdblyrkavwgwyttoyidvaccwhybngw` (`postDate`),
  KEY `idx_hogpvxehqrptgixqaucexvppnldpnigbwxrw` (`expiryDate`),
  KEY `idx_ebwggmvhaoazazaccbhsjjsivbhyqvpzzwri` (`authorId`),
  KEY `idx_ivzaykxylwoyqpbmrwypoyitidxyhmnsqmla` (`sectionId`),
  KEY `idx_sbvtwssylttpmypxgeibgsqngnumcfqfrwzc` (`typeId`),
  KEY `fk_behqarikpohvjfdvvxtsqumegflnxmxeemux` (`parentId`),
  CONSTRAINT `fk_axqhjdzlrumahuugatibbbigannokpexjdxa` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_behqarikpohvjfdvvxtsqumegflnxmxeemux` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dmwinwxkjduzqackbasinglctqzxltlnahol` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fqycaahusnndncnwltcdnebchzggvzjqziss` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gufhqzwajhdpkterxkqjpylhwvmzgfvjtlqe` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ndgpjhachdxgirucwciqeztlgizyfmjkqkdx` (`name`,`sectionId`),
  KEY `idx_lqcpphgxczeqgngahfwsuvhvjujfoqacduoi` (`handle`,`sectionId`),
  KEY `idx_wyraoshdkdbrpozgbqpchtsnwscguwvncpgu` (`sectionId`),
  KEY `idx_xjyhodgjwaaqtdgdsydxxkirpccxrxgzqcax` (`fieldLayoutId`),
  KEY `idx_zvzrxqkgorpgftlftdubtwfuemreconuwjit` (`dateDeleted`),
  CONSTRAINT `fk_dpquertxkcnogoxdkhkzsqbptmhqqufbqfza` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tcoskkpcwogvitrzhyayuzbuqwrqsbwtohno` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kxlgbgshcfcixtuebmnjtgotfintqduhetvp` (`name`),
  KEY `idx_bvcbgsymoghhumccfvqpgjbtipahjkpvnobr` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-04-21 10:33:01','2022-04-21 10:33:01',NULL,'0a7c9269-a9f0-4c7d-b379-cf32cbb5c38c');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gnybftlmsbuabrxtmrzcxopzryoheljnkfmc` (`layoutId`,`fieldId`),
  KEY `idx_ywgcvukmlypdpfbimxptwtncnedwqkkdyiew` (`sortOrder`),
  KEY `idx_rmbtcypahilvaaptmmbedqdtvsezsiyxgfyt` (`tabId`),
  KEY `idx_bvoiqpfywhswugvtcydpbahbufrotzrctfaa` (`fieldId`),
  CONSTRAINT `fk_bnyiwupmavxigqgezqnilwsqpunnasxewyjo` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mcbpuigkbhbykhlpmmuaokvgjxhzwshwkvch` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tjngziavtzjanlqvqqlbuhsvcljjkhxgkfsz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_twpbqhxxzjgfyvcxdhcssxrhkwnasifdyzmj` (`dateDeleted`),
  KEY `idx_eajgtecuravxfhaltlhskpchnlcxspibepib` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `elements` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_whozangzsakrtkokebmvjbsbvzyflzyqpmsn` (`sortOrder`),
  KEY `idx_ghucawezifnvkhfrqevclyqjcccuglfppmbn` (`layoutId`),
  CONSTRAINT `fk_iylzutesqgjeewelytbosfiufughmchdwvnw` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lrbauzcmlyyuwtsoiyxvjqutxwxzknnjiohm` (`handle`,`context`),
  KEY `idx_zjashknxssjllhgsuyfgtmyuxkbrjvjytmgh` (`groupId`),
  KEY `idx_vockqtsppkmysflnvnlqphsakeqoivozhgvj` (`context`),
  CONSTRAINT `fk_ffzzwrpdkgnfxploquvokeudswsiyozlimxp` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bqkcouoxujgvfnccrwmvvrairaknjfuectsd` (`name`),
  KEY `idx_aielbglewzxecpklnotypmhqjpqqjdxoitvf` (`handle`),
  KEY `idx_htbjgqxuzxmrvruopmdumijzofgkpcpzonbb` (`fieldLayoutId`),
  KEY `idx_ulknkjatboqozmemzdwjkuhjcortxresvfvf` (`sortOrder`),
  CONSTRAINT `fk_ovymcbzyrsutboawtvtybzjaqhsxyehgafus` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vlzsrdbongxphoqhpsuzrdjsytztgdlsvcki` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `scope` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qeelvjjafcjezmdgsmjinzqpbyixdntjzyhd` (`accessToken`),
  UNIQUE KEY `idx_huijdnvvuagihyucaxyocpfyvrmmcbiuseye` (`name`),
  KEY `fk_fvgodtynhzdkndksqasfdtvjjxspxakfyhzi` (`schemaId`),
  CONSTRAINT `fk_fvgodtynhzdkndksqasfdtvjjxspxakfyhzi` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_offgfgtwatmlaldwrgnefkdfsruyobnymlrt` (`assetId`,`format`,`transformString`),
  KEY `idx_hrsrrmsjhhmgbftcuzoyeswvextedwwbemfp` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ynzshqlfhknjucvdjdtfnzggvvaqdoyotywj` (`name`),
  KEY `idx_tldxxxfuexpsuhovirsoubfytkyoqkqmrnyv` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'4.0.0-beta.4','4.0.0.9',0,'zawipugpbqop','3@xeloiyujnl','2022-04-21 10:33:01','2022-04-21 11:54:29','076a1933-b649-4bd6-bd9b-9cf51584323f');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gykzjmmtecoigrvxmnkngijlrbojjyxyrczw` (`primaryOwnerId`),
  KEY `idx_zwrblvwjksblwkdwplwckrzslpmcfkwrrhcp` (`fieldId`),
  KEY `idx_gkzmhotraayabwiszfaqdhmyagalbabaqabt` (`typeId`),
  CONSTRAINT `fk_jrsmgkvpkyrxlnlaienaubhnkpfbzdyrxbqt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pttvcywbgsgmielwzabsnpolozybehbnvzpk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rlnotmklzykndhzkbmuurkrxkphtwpazlxps` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xdcxyldqasynrxqghzzvwvapjwkrkeqpocly` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_igbdteykeljkgjdqwyaxafsfpchwitpdnuvj` (`ownerId`),
  CONSTRAINT `fk_igbdteykeljkgjdqwyaxafsfpchwitpdnuvj` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kdipjcljzgqyuknenleupnocjkwxolctcsyo` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yxtiulmcgneczcuwshrvaxzrgpftemvzqlvm` (`name`,`fieldId`),
  KEY `idx_kkaueurjrlefnxbdcfbcngcyrgdxvdsuzwrc` (`handle`,`fieldId`),
  KEY `idx_ikmlzvskevtwxkrenogxrgbvqwwecpcabsfo` (`fieldId`),
  KEY `idx_xbvbvituhmzyjszlpeqnvbqhrzctssrenfbl` (`fieldLayoutId`),
  CONSTRAINT `fk_glraqrmdtzezggrcvfhvoqnyvafpwyjkdbjl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ywnumrmjiolmwcquvapygyvdhutvryzxnaae` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iiqovzkhivjqlwtvvcsgnbwbjzqhfgjproqa` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','2caa5daf-0288-4e80-87ff-1f881a1c1c96'),(2,'craft','m150403_183908_migrations_table_changes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','7a2fd969-c2cf-44f7-8563-6083cb509fc9'),(3,'craft','m150403_184247_plugins_table_changes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6a1df311-590d-46d0-b7e3-d98a5123bd99'),(4,'craft','m150403_184533_field_version','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','a002d2ed-0337-4ab2-9e61-4863e4852b35'),(5,'craft','m150403_184729_type_columns','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','aa81fdec-9fb6-4af9-bcfe-55355f92fa28'),(6,'craft','m150403_185142_volumes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','0b7e85cb-cac2-4c63-81c1-5cf88409a809'),(7,'craft','m150428_231346_userpreferences','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b8c6e75f-f245-4df6-ace2-40f220787b99'),(8,'craft','m150519_150900_fieldversion_conversion','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','42a92671-8156-46c8-99df-b343329cb117'),(9,'craft','m150617_213829_update_email_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1560f292-5768-4ec9-8afe-d3640f29a481'),(10,'craft','m150721_124739_templatecachequeries','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','d2babc14-52aa-496a-88e1-677a218bb14f'),(11,'craft','m150724_140822_adjust_quality_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','9eac90aa-dbe5-4878-b4d4-b99ae87a3d01'),(12,'craft','m150815_133521_last_login_attempt_ip','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e09c22ab-2139-4c69-9e6b-8db121c3e651'),(13,'craft','m151002_095935_volume_cache_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6db5aa93-0a7d-4f4e-b482-24ba2440a1b7'),(14,'craft','m151005_142750_volume_s3_storage_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','ca4f270d-4227-473d-9b7c-626d4ad29011'),(15,'craft','m151016_133600_delete_asset_thumbnails','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c0c84403-e658-4efa-8851-d55008d32bcc'),(16,'craft','m151209_000000_move_logo','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1179ed91-f2bb-4191-a939-f909544aa878'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b8d0ec7f-7512-4a33-b868-522cbbda1e70'),(18,'craft','m151215_000000_rename_asset_permissions','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','f705d86b-d21c-45d1-9b50-d470abcb8823'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1782ea10-f8c1-459f-a420-70d19fd743ab'),(20,'craft','m160708_185142_volume_hasUrls_setting','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1d16da51-3bc7-4d20-8574-cdf1865f95c6'),(21,'craft','m160714_000000_increase_max_asset_filesize','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','cf55e8ed-0296-4db2-887c-e39abc8b110b'),(22,'craft','m160727_194637_column_cleanup','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','3a9a3abf-f222-44a0-83aa-6d9fabeed46d'),(23,'craft','m160804_110002_userphotos_to_assets','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4dd53873-91fb-4c26-8877-52cbaeda8b75'),(24,'craft','m160807_144858_sites','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','9c4ff6ab-a359-4537-a7a6-ab2ae024ae0f'),(25,'craft','m160829_000000_pending_user_content_cleanup','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','46cd421b-7664-4ded-8733-b1b5c5fe891b'),(26,'craft','m160830_000000_asset_index_uri_increase','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','0872babb-9879-4c1c-ac1e-8c017956ba2c'),(27,'craft','m160912_230520_require_entry_type_id','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','35ee0318-105e-43f1-8421-5a70c31da8f8'),(28,'craft','m160913_134730_require_matrix_block_type_id','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','381caa37-3dd1-4993-9968-7ad59f0e2613'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','88bfdce2-7b04-45d4-a5c0-1dfee70c5a89'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c94915c6-4cc2-4410-af6d-e0f71f2b1077'),(31,'craft','m160925_113941_route_uri_parts','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','8cf6d4ff-fbc4-40ad-8805-088c299a35af'),(32,'craft','m161006_205918_schemaVersion_not_null','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','87ae1ab4-6142-428b-b583-854b8d099165'),(33,'craft','m161007_130653_update_email_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','a732e65c-097e-41d2-9fa2-423a804e0f19'),(34,'craft','m161013_175052_newParentId','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','7c69d5b5-32c7-4e7b-82e1-28a35defdb6a'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','dd9447a7-57bb-4e3d-a9a2-d3b09d15128b'),(36,'craft','m161021_182140_rename_get_help_widget','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c8d2ee68-068a-4d2e-9d46-eee972c85215'),(37,'craft','m161025_000000_fix_char_columns','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','93ebc440-360f-42b8-8df0-34a11e083f93'),(38,'craft','m161029_124145_email_message_languages','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','80b25e9e-4fa2-4051-b9d2-bc9074dc7fa6'),(39,'craft','m161108_000000_new_version_format','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c555e1ce-119c-40a1-9f7e-92f4b1643944'),(40,'craft','m161109_000000_index_shuffle','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','dd1e88a1-bc86-433e-8a0e-6354fb34c13c'),(41,'craft','m161122_185500_no_craft_app','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4807f385-8212-49c8-be43-b4fb1c708a88'),(42,'craft','m161125_150752_clear_urlmanager_cache','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4cf28699-d46c-4517-a9ff-a2e7ad04ee9b'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','ac1cf0fb-04f9-46e0-a447-2063cc1aab13'),(44,'craft','m170114_161144_udates_permission','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','360212eb-438f-4a31-ba6a-c5ef86e67fff'),(45,'craft','m170120_000000_schema_cleanup','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b273ffbf-8d6e-47bb-8aa8-df6b3113f925'),(46,'craft','m170126_000000_assets_focal_point','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','09efca38-2e20-4a1d-a51a-f7c28fe10154'),(47,'craft','m170206_142126_system_name','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b6f0ee30-1bc1-4f1a-9f4c-fa5257ad59d7'),(48,'craft','m170217_044740_category_branch_limits','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','3fea6316-c9a6-4807-b8eb-c074add2c5c9'),(49,'craft','m170217_120224_asset_indexing_columns','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c5ad93f2-d033-4482-b6fe-01d8f7f3dc94'),(50,'craft','m170223_224012_plain_text_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6ff92260-b209-40f9-aa84-08c1bdd3d804'),(51,'craft','m170227_120814_focal_point_percentage','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','28f1c396-f5ab-4885-92fc-d4000fe61269'),(52,'craft','m170228_171113_system_messages','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','f1856dec-8065-40c7-b453-131b2bbeff7f'),(53,'craft','m170303_140500_asset_field_source_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b7bbab64-5e04-4236-8efe-c95b292a45a7'),(54,'craft','m170306_150500_asset_temporary_uploads','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','d0455698-0f6b-4acc-ad5d-e63ccef68ee5'),(55,'craft','m170523_190652_element_field_layout_ids','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','f6031d63-faf3-4542-8fba-2e51c95abca2'),(56,'craft','m170621_195237_format_plugin_handles','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','554dff5f-4326-4cdf-9c25-a8c4e72223d7'),(57,'craft','m170630_161027_deprecation_line_nullable','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','16bcf57f-7e1b-485c-bef4-956250134d68'),(58,'craft','m170630_161028_deprecation_changes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','86f0768e-4b90-4f76-b4cd-454030033f6f'),(59,'craft','m170703_181539_plugins_table_tweaks','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','5a4d6ff5-deb3-44f9-ac10-61ef4720c2bf'),(60,'craft','m170704_134916_sites_tables','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','a379535f-9a3e-40e0-85aa-6acd068b6ba8'),(61,'craft','m170706_183216_rename_sequences','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b40cb5ef-5d32-4ff5-b059-8210f96adcbf'),(62,'craft','m170707_094758_delete_compiled_traits','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','02c615b5-8821-48dd-8bc4-e094536395a0'),(63,'craft','m170731_190138_drop_asset_packagist','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4560813b-08c1-4ac9-b595-5c3dfb7e3ed6'),(64,'craft','m170810_201318_create_queue_table','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e8474607-b9d4-44c7-85a1-ef2b5b9bef14'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','aac35377-6171-48ed-9a31-8b4b89ccd8ac'),(66,'craft','m170914_204621_asset_cache_shuffle','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','d8107f51-59ff-449b-9658-13bf04aa1578'),(67,'craft','m171011_214115_site_groups','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b4a0c4f1-099f-4cbb-b487-156317704738'),(68,'craft','m171012_151440_primary_site','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','75045c05-37e1-4ebe-b987-3c368580ea67'),(69,'craft','m171013_142500_transform_interlace','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','98a9fe78-9d2a-4ac8-b247-6b71f4321db2'),(70,'craft','m171016_092553_drop_position_select','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','d9b86d98-ef31-4f6f-b474-b7b061a72385'),(71,'craft','m171016_221244_less_strict_translation_method','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6156fc0a-be55-4b6d-a9a5-1fd73e68df72'),(72,'craft','m171107_000000_assign_group_permissions','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','7f7368fa-b1f4-40be-b3c3-6410104d04c0'),(73,'craft','m171117_000001_templatecache_index_tune','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','8a0b9cf5-1565-4ce5-b184-c4dca9dc9107'),(74,'craft','m171126_105927_disabled_plugins','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','753cf00d-f690-4910-8e3d-043a87fc41e2'),(75,'craft','m171130_214407_craftidtokens_table','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b8098315-012d-41c2-a6cc-08c6186c561e'),(76,'craft','m171202_004225_update_email_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','68c56b21-d466-4acd-87e9-5f2dcd06827b'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','200ad5f7-3c75-4fb4-afc7-c60caf6eadc1'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','ab788ced-dc9e-4e37-b450-fc0a8798abbc'),(79,'craft','m171218_143135_longtext_query_column','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','a0e3f62e-1dd1-4d09-8c63-3fb2554015a1'),(80,'craft','m171231_055546_environment_variables_to_aliases','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6ae97ecd-76e1-47ea-80c0-29544c6d3115'),(81,'craft','m180113_153740_drop_users_archived_column','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','756eac84-0f35-4539-97d6-e8c054483cff'),(82,'craft','m180122_213433_propagate_entries_setting','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1381e2b3-5ffc-48bc-868b-34dcb6d26d7f'),(83,'craft','m180124_230459_fix_propagate_entries_values','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','739012bf-2cac-4261-962c-b75453ff31ce'),(84,'craft','m180128_235202_set_tag_slugs','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e3123a5e-612c-43c0-9033-13a2a6bd8559'),(85,'craft','m180202_185551_fix_focal_points','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','428a6455-20c7-4dd8-b1d3-1f03391e5c6c'),(86,'craft','m180217_172123_tiny_ints','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','da1f9374-8ef0-478f-bd72-44c8d71d74e0'),(87,'craft','m180321_233505_small_ints','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','35cb98cd-721e-4862-8bdb-477ac2048ecc'),(88,'craft','m180404_182320_edition_changes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','54339cbb-588f-4886-bf38-9c624d438405'),(89,'craft','m180411_102218_fix_db_routes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','ceec7488-613d-4fc2-ba3a-a13b25284b7f'),(90,'craft','m180416_205628_resourcepaths_table','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6a1f3627-c729-4fa3-b107-2a1e428d7950'),(91,'craft','m180418_205713_widget_cleanup','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e9a44384-03a3-4467-98d3-443365d71c77'),(92,'craft','m180425_203349_searchable_fields','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c315f9e2-205d-4095-b707-274c76cfebfa'),(93,'craft','m180516_153000_uids_in_field_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','78c94ea5-f50b-49a5-b19a-97397aaad4b3'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','a3e73fdb-7be9-4c81-8b2c-8d444425e6c8'),(95,'craft','m180518_173000_permissions_to_uid','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','32b51d73-3eac-4bf9-bcfa-28fd0f71895b'),(96,'craft','m180520_173000_matrix_context_to_uids','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','fb1f185e-3ad4-40ce-b2b7-8e2d074df4a5'),(97,'craft','m180521_172900_project_config_table','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e1a15864-6ec6-4d9e-9efc-0ae74f73fae3'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4ccc8f15-1778-4506-bd73-a83446b2ca53'),(99,'craft','m180731_162030_soft_delete_sites','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c7363f4c-2e17-481e-8841-8fa37e8f65aa'),(100,'craft','m180810_214427_soft_delete_field_layouts','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','fe839e56-3062-4e07-9ede-10af5cbf218e'),(101,'craft','m180810_214439_soft_delete_elements','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','8f510837-0a9e-479f-a720-d3090a1eef32'),(102,'craft','m180824_193422_case_sensitivity_fixes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','43cdd628-5513-446a-b734-4b456c9b2dc7'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','99af7771-e93e-4cd5-a8a4-68d2a4d4ffe7'),(104,'craft','m180904_112109_permission_changes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','20de75da-d1b8-4dcc-8600-ff6df8fa8e8c'),(105,'craft','m180910_142030_soft_delete_sitegroups','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','958ad989-e6f8-475c-88b1-eda3938eea1a'),(106,'craft','m181011_160000_soft_delete_asset_support','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','219b5ba7-e653-48e5-8e2e-84b619c4793f'),(107,'craft','m181016_183648_set_default_user_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','f5f4e251-6eb6-46fd-97da-4687596e3c02'),(108,'craft','m181017_225222_system_config_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','527b32cd-ff1d-417a-864b-6a7f99f5d7af'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b51d7d1b-0a3e-433b-a12e-568ad59399ea'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1b74065a-758b-4a56-9962-132a082e0849'),(111,'craft','m181112_203955_sequences_table','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','f2d905a9-038c-4c66-a0af-7cbaa4d2735f'),(112,'craft','m181121_001712_cleanup_field_configs','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','41746867-db06-4c88-b811-12f4d75ddcf0'),(113,'craft','m181128_193942_fix_project_config','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','ff998a0e-c434-4883-9a09-d2ec59a6e95b'),(114,'craft','m181130_143040_fix_schema_version','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6d119cab-d363-42a0-9c1e-0bb7aaa87869'),(115,'craft','m181211_143040_fix_entry_type_uids','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','88dce175-fb16-4532-bcc3-ea7ace62a422'),(116,'craft','m181217_153000_fix_structure_uids','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','0ad4aacf-0089-4a21-9c37-06fd67ed58eb'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','8f47ba08-cb74-487b-a434-e77d6cdc9eb1'),(118,'craft','m190108_110000_cleanup_project_config','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e69fc2a7-330b-42c0-95fc-aadf06a6f601'),(119,'craft','m190108_113000_asset_field_setting_change','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6006b3de-916d-409d-b87b-1287cfec3111'),(120,'craft','m190109_172845_fix_colspan','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','8de3fbda-d67f-4b2c-9c75-57aee1cf1ed3'),(121,'craft','m190110_150000_prune_nonexisting_sites','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c76f2cbc-604d-4ca6-8fd9-d3bdabef0056'),(122,'craft','m190110_214819_soft_delete_volumes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','15a77921-2a55-48a7-9f3b-75cc2a18e3fe'),(123,'craft','m190112_124737_fix_user_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','3c9f98a7-2382-4461-bcaf-c5fb62aaca48'),(124,'craft','m190112_131225_fix_field_layouts','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','438f985e-b847-48b1-b475-8fb9a86a1155'),(125,'craft','m190112_201010_more_soft_deletes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','ba074f83-e527-4e4d-93de-b18359ecddcf'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','f8269740-d94e-4226-92d3-ad9ff23c1ac8'),(127,'craft','m190121_120000_rich_text_config_setting','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','bed50471-d5f7-472a-a688-85e0304586e4'),(128,'craft','m190125_191628_fix_email_transport_password','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6d213cde-b923-4d00-af63-fc40a5db38f4'),(129,'craft','m190128_181422_cleanup_volume_folders','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','8a617a37-417a-416c-a1d4-cea8c4120ec4'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','dd5c8794-9b5f-4ae5-a1ef-d76a14f8295b'),(131,'craft','m190218_143000_element_index_settings_uid','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e661a4e4-0239-407c-a010-894bf3b09963'),(132,'craft','m190312_152740_element_revisions','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','a07d127a-59d9-452d-bdd6-cfa8c381ebcc'),(133,'craft','m190327_235137_propagation_method','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','0d926e14-2b6e-4ef4-b8e9-7f55006f4bfd'),(134,'craft','m190401_223843_drop_old_indexes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e279e964-06b6-4d86-9588-4f0b152f5ee3'),(135,'craft','m190416_014525_drop_unique_global_indexes','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','2223dae4-0cf9-4871-9b47-b4fd651af970'),(136,'craft','m190417_085010_add_image_editor_permissions','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','61dfe9d7-223c-4faf-bb4c-5e7dadb2665e'),(137,'craft','m190502_122019_store_default_user_group_uid','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','76ec2f41-7e69-413c-8f34-442f8acdb254'),(138,'craft','m190504_150349_preview_targets','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b2e61ac6-f581-44d3-b23e-f63e87cae42a'),(139,'craft','m190516_184711_job_progress_label','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','8e7e4f7f-80a2-408f-8441-31c787cc9e1e'),(140,'craft','m190523_190303_optional_revision_creators','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','fadce619-be9c-4de1-a70a-1bfc10d9cdb5'),(141,'craft','m190529_204501_fix_duplicate_uids','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1033048f-09aa-4336-82c8-79cce77ecd2e'),(142,'craft','m190605_223807_unsaved_drafts','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b2530c71-370d-482b-ab64-192bb8794355'),(143,'craft','m190607_230042_entry_revision_error_tables','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','eae147c6-6eab-4b76-9e79-6e524199430b'),(144,'craft','m190608_033429_drop_elements_uid_idx','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','7726d0f2-a25e-48e0-abc2-351c85fcd514'),(145,'craft','m190617_164400_add_gqlschemas_table','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','1ce1077c-f8a0-4257-8696-966d049e7477'),(146,'craft','m190624_234204_matrix_propagation_method','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','5ca156d7-8b9d-4e83-8327-22c304326527'),(147,'craft','m190711_153020_drop_snapshots','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4caf3cc0-7fec-4f85-8b80-e30e11228188'),(148,'craft','m190712_195914_no_draft_revisions','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','01795afd-c482-4eba-83ad-2334d6299d4b'),(149,'craft','m190723_140314_fix_preview_targets_column','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','0ebc8459-85c9-45a1-b793-ba898f54dc14'),(150,'craft','m190820_003519_flush_compiled_templates','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4d21d6cc-0cc5-4e0a-a680-ca1c44e68d09'),(151,'craft','m190823_020339_optional_draft_creators','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','9032ffe5-228d-4332-88ad-c9ac40320f56'),(152,'craft','m190913_152146_update_preview_targets','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','b296f35c-f03c-4a30-9f04-87422c436910'),(153,'craft','m191107_122000_add_gql_project_config_support','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','a57a7d1e-4f10-4b7e-9bc0-cdc83d410878'),(154,'craft','m191204_085100_pack_savable_component_settings','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','ec8b1a61-bc0f-4407-bed6-021c4e4baa7c'),(155,'craft','m191206_001148_change_tracking','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','e590b5df-0608-406c-bd97-a630dd0675ce'),(156,'craft','m191216_191635_asset_upload_tracking','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','2c7b962d-8f4a-4662-8df4-be3e9cf979a7'),(157,'craft','m191222_002848_peer_asset_permissions','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','30b9a880-dbd0-44e2-961e-4a9ad611387c'),(158,'craft','m200127_172522_queue_channels','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c479fd8a-3e5c-4665-aa90-5b938db5dbd9'),(159,'craft','m200211_175048_truncate_element_query_cache','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c25e1d4c-0d84-4399-a06b-fdd778d2a509'),(160,'craft','m200213_172522_new_elements_index','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','50b61d6a-b4b0-4b53-890f-8cf7213f430f'),(161,'craft','m200228_195211_long_deprecation_messages','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','035b08e7-7323-48bb-bd3e-03ed200e3cfb'),(162,'craft','m200306_054652_disabled_sites','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','c2dcb70f-c873-40e8-93b9-7b50b2a05af0'),(163,'craft','m200522_191453_clear_template_caches','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','4583a624-6c57-46f4-9e50-404a87e6694b'),(164,'craft','m200606_231117_migration_tracks','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','5c454dca-0c6e-41b8-a8ed-339e171aa61e'),(165,'craft','m200619_215137_title_translation_method','2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 10:33:02','6a0a2e87-5270-4fbb-b187-354a95e8690e'),(166,'craft','m200620_005028_user_group_descriptions','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','699ea652-4dee-4031-814a-4cdf1c8c30f8'),(167,'craft','m200620_230205_field_layout_changes','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','472d566c-bbfc-4bf1-a3e7-4741e70c5d28'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','2fa10e5e-b387-4b8b-a3ab-39aff0c91725'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','422c2e1e-a2b8-46ce-9bac-a4c7062eb903'),(170,'craft','m200630_183000_drop_configmap','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','72d0edca-a84a-4bb2-912d-dac9c9fac6fd'),(171,'craft','m200715_113400_transform_index_error_flag','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','481ade79-7f74-4e19-b11b-32870cbc68f4'),(172,'craft','m200716_110900_replace_file_asset_permissions','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','26af22a4-40b5-4e18-9617-ded4351ba43c'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','95a29629-5dd7-45b8-bacd-18787135b8c2'),(174,'craft','m200720_175543_drop_unique_constraints','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','44f863b4-dc22-46dd-9041-1cc5160756da'),(175,'craft','m200825_051217_project_config_version','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','5a61cf6c-517d-4acf-9a34-6c7bc02a3a61'),(176,'craft','m201116_190500_asset_title_translation_method','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','9bb60411-9673-4e43-9ab7-cb9863230b01'),(177,'craft','m201124_003555_plugin_trials','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','943f4b37-6296-42ad-923b-0eb0e929d27a'),(178,'craft','m210209_135503_soft_delete_field_groups','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','9a4acfcf-6092-4c35-ba79-101f10892c89'),(179,'craft','m210212_223539_delete_invalid_drafts','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','cbf4355d-fc0e-4242-9545-f5442525dde3'),(180,'craft','m210214_202731_track_saved_drafts','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','505e448d-65c3-4d7a-8203-bafbc3302c59'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','7abd05bd-4984-495c-9418-7f334d813564'),(182,'craft','m210302_212318_canonical_elements','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','7ab6d9a4-8149-44f7-83e9-1e4de9f7d2bc'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','d840b181-5bcc-4291-8c59-b42ba987a61d'),(184,'craft','m210329_214847_field_column_suffixes','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','58d5307e-a06d-4958-9cf6-0aa2c221a9c7'),(185,'craft','m210331_220322_null_author','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','df405cd3-804e-460f-a5d0-c2c844b5d067'),(186,'craft','m210405_231315_provisional_drafts','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','ccf6331f-2d4e-42d4-88c7-c30c61c9606b'),(187,'craft','m210602_111300_project_config_names_in_config','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','9f4ea657-a857-4ace-8e7a-228d694956ed'),(188,'craft','m210611_233510_default_placement_settings','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','30434c98-45c4-4ba4-ab15-28fb3f6335d1'),(189,'craft','m210613_145522_sortable_global_sets','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','82efc662-8efe-4913-b746-39f180d19fe5'),(190,'craft','m210613_184103_announcements','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','abd4b752-7eae-4415-b05d-bff7bbba1da9'),(191,'craft','m210829_000000_element_index_tweak','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','9bfe4368-f9aa-4279-af97-8781deeef8fb'),(192,'craft','m220209_095604_add_indexes','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','5a002d84-4d34-4bf7-97ce-79b07bc0ece4'),(193,'craft','m220214_000000_truncate_sessions','2022-04-21 10:33:03','2022-04-21 10:33:03','2022-04-21 10:33:03','23065b7d-559f-400f-a37c-b3e93f5c0549'),(194,'craft','m210121_145800_asset_indexing_changes','2022-04-21 11:54:26','2022-04-21 11:54:26','2022-04-21 11:54:26','9869c294-14ea-4519-a843-94a6611c54d2'),(195,'craft','m210624_222934_drop_deprecated_tables','2022-04-21 11:54:26','2022-04-21 11:54:26','2022-04-21 11:54:26','b6a9755e-d1d5-4c32-9a71-0364b6a6f37e'),(196,'craft','m210724_180756_rename_source_cols','2022-04-21 11:54:26','2022-04-21 11:54:26','2022-04-21 11:54:26','27eaca14-88ef-4900-9971-34ce2c0699f9'),(197,'craft','m210809_124211_remove_superfluous_uids','2022-04-21 11:54:27','2022-04-21 11:54:27','2022-04-21 11:54:27','d75170b1-7bd2-4060-9628-59fed356a4fa'),(198,'craft','m210817_014201_universal_users','2022-04-21 11:54:28','2022-04-21 11:54:28','2022-04-21 11:54:28','7de097b5-5112-4ddf-a150-8caf2000b10a'),(199,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-04-21 11:54:28','2022-04-21 11:54:28','2022-04-21 11:54:28','69fdc149-df4e-4a7b-a0a4-a5c4a1687163'),(200,'craft','m211115_135500_image_transformers','2022-04-21 11:54:28','2022-04-21 11:54:28','2022-04-21 11:54:28','f88e7a3e-cd80-4576-bc57-09ad727712d5'),(201,'craft','m211201_131000_filesystems','2022-04-21 11:54:28','2022-04-21 11:54:28','2022-04-21 11:54:28','b3d89a08-0a1c-46e5-a162-4231e095994c'),(202,'craft','m220103_043103_tab_conditions','2022-04-21 11:54:28','2022-04-21 11:54:28','2022-04-21 11:54:28','18dc3121-f27f-4dbc-a261-9d90c5c7aaa9'),(203,'craft','m220104_003433_asset_alt_text','2022-04-21 11:54:28','2022-04-21 11:54:28','2022-04-21 11:54:28','b82ac62a-7dc8-420f-9b99-a2d1c4360b57'),(204,'craft','m220123_213619_update_permissions','2022-04-21 11:54:28','2022-04-21 11:54:28','2022-04-21 11:54:28','cb04430d-54fb-42ad-a8d7-45b8024b8558'),(205,'craft','m220126_003432_addresses','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','9dacd878-2346-4d19-9285-178d905232e0'),(206,'craft','m220213_015220_matrixblocks_owners_table','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','5b5ca306-a174-4cb0-a138-6250201d9f9e'),(207,'craft','m220222_122159_full_names','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','83df164a-5600-4574-89d4-0519bd0b91f0'),(208,'craft','m220223_180559_nullable_address_owner','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','b3553e05-f7a7-454c-9a31-6e6d8ade07f8'),(209,'craft','m220225_165000_transform_filesystems','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','390fa0e4-f07f-4460-bf3d-34efc07a31b1'),(210,'craft','m220309_152006_rename_field_layout_elements','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','555c4101-2085-4624-bd17-998952aff7ed'),(211,'craft','m220314_211928_field_layout_element_uids','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','8ce6ebad-efbc-48b1-9138-3a2cfa2bbfcb'),(212,'craft','m220316_123800_transform_fs_subpath','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','49697187-9366-4005-9fb5-d48ca4573463'),(213,'craft','m220317_174250_release_all_jobs','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','7e4e33cb-b422-4ccf-9a99-71ba802c81e6'),(214,'craft','m220330_150000_add_site_gql_schema_components','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','979b54c8-0849-4b1b-94b4-4cf12e620bc1'),(215,'craft','m220413_024536_site_enabled_string','2022-04-21 11:54:29','2022-04-21 11:54:29','2022-04-21 11:54:29','7c7cd296-0187-4e1d-8a7a-77381b774277');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mooixitoquczcrxgmlpmcfirvyrjkcrmqjat` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1650542069'),('email.fromEmail','\"tom@tomdavies.net\"'),('email.fromName','\"Craft 4 Test\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.0a7c9269-a9f0-4c7d-b379-cf32cbb5c38c.name','\"Common\"'),('meta.__names__.0a7c9269-a9f0-4c7d-b379-cf32cbb5c38c','\"Common\"'),('meta.__names__.d55216e1-491b-43e1-9fff-8ee7d3857065','\"Craft 4 Test\"'),('meta.__names__.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d','\"Craft 4 Test\"'),('siteGroups.d55216e1-491b-43e1-9fff-8ee7d3857065.name','\"Craft 4 Test\"'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.handle','\"default\"'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.hasUrls','true'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.language','\"en-US\"'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.name','\"Craft 4 Test\"'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.primary','true'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.siteGroup','\"d55216e1-491b-43e1-9fff-8ee7d3857065\"'),('sites.f2ae6050-3770-4fe6-a926-8bacfcdfaf5d.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft 4 Test\"'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_voujbfozvmvgfocxdhgsfpzqmhpboddixmbt` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zzjqqrzxlmylnxurzmxdatwmxkarjsohkzpk` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wgrgrygznojxtbakjeesxgtcnvsiknfxxrgv` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_hgtihtowqwtqdlrebeedaubtrlokxsffilqr` (`sourceId`),
  KEY `idx_rqtetynsjvgnoyqtaveiemfsuukuuxxijqvo` (`targetId`),
  KEY `idx_ebqpxqfbkqosmmxklycnirlfduyamtohbrdf` (`sourceSiteId`),
  CONSTRAINT `fk_bjudqhiwoeedsyxbeberkqwnyzntawcejslo` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_riikratxbnvucbymfgxeiyvfcsikusckpryi` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vkiebdobckfjftbghobljexrrxwpbedajvya` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wnxbhokntunfhrbsmacxozlpprywihnopgdb` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('1bd10a5a','@craft/web/assets/installer/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dgnejthoezysdegdfzzrzqiqxwqlihdzpzsk` (`canonicalId`,`num`),
  KEY `fk_ebliiecxjziqqhubmbdcpgkpwmtfmlyenuiv` (`creatorId`),
  CONSTRAINT `fk_ebliiecxjziqqhubmbdcpgkpwmtfmlyenuiv` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tvggbjlybqthksiapadmjlbeekfixtvqtcvg` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_wsjwiettvmvdrnlqvynufcicbryindkelkpw` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' tom tomdavies net '),(1,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nvuzmqqwlfqatunsnxpobmawiwyxswmuuobn` (`handle`),
  KEY `idx_oqigvytqgmkxacxrtmjwbyuuribbatrcynaq` (`name`),
  KEY `idx_anepgygodcmpulvtsoauxvuzabxmbrklykvi` (`structureId`),
  KEY `idx_kvgokgcojqyvlmqhjbkwrgpejrjsnnacrhbd` (`dateDeleted`),
  CONSTRAINT `fk_granrqxzhxnnzzxhbbrldgpwumwspwvixpyd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `template` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ibnsfytfiqhopsyugcoeemuamcoakydasakw` (`sectionId`,`siteId`),
  KEY `idx_jpupstnydghznimawnqbmryomkprufemspao` (`siteId`),
  CONSTRAINT `fk_ahchklhnlmoffunzthwdhtchsjvtjxwmohku` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tsfciotyervhnasaugwmtkxjkylscuxqoyjc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_asrceujokidpwssruxpbftlixeknvxqzsucw` (`uid`),
  KEY `idx_buothprdwtxqlnitcntncbedhjrpfbucvqro` (`token`),
  KEY `idx_taprlakdowqjdzhiuohcznzcckepdrsbqtuy` (`dateUpdated`),
  KEY `idx_sxkewaajkmuvcdfdjqhvehchodyhpgqbtmwb` (`userId`),
  CONSTRAINT `fk_szohxhcgjlpheqeydsiomkxwgteazlgmdlxv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jqfrrwsddlfuaofqozswkbbcdxlsbxripchz` (`userId`,`message`),
  CONSTRAINT `fk_filulhvxngjwflmeztusruawvtcqqvdfgegy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nyuknhudaizujbherauiezmzufnkyzjpzcaq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Craft 4 Test','2022-04-21 10:33:01','2022-04-21 10:33:01',NULL,'d55216e1-491b-43e1-9fff-8ee7d3857065');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fzpuokdhjdtazmvdamtwhharvldgfkgrlggu` (`dateDeleted`),
  KEY `idx_klbswhivkmlzfzkyurpnzbpotevpgvpahgss` (`handle`),
  KEY `idx_vmwnqexnppkihhvduguzablunflrlyyzekxe` (`sortOrder`),
  KEY `fk_dcimifofxaxchpftrvrfvjuemrzfoiijdxxu` (`groupId`),
  CONSTRAINT `fk_dcimifofxaxchpftrvrfvjuemrzfoiijdxxu` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'1','Craft 4 Test','default','en-US',1,'$PRIMARY_SITE_URL',1,'2022-04-21 10:33:01','2022-04-21 10:33:01',NULL,'f2ae6050-3770-4fe6-a926-8bacfcdfaf5d');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rewqyhasdibkcsnehpcdjdminiyendedkkze` (`structureId`,`elementId`),
  KEY `idx_hgonplmjkptladdtuwchkksbutrymzmesytv` (`root`),
  KEY `idx_rrbiwhjxveoltkweupgazetlpumdjckqjtis` (`lft`),
  KEY `idx_rwmudegpkxpsgpfyqrmqhodqztxjlfvddnmb` (`rgt`),
  KEY `idx_zkzxizhzgydudntazehojvwaoprsemnbyaec` (`level`),
  KEY `idx_pgtiawamqirbwlgfwuaudqmwdbelymjfquyu` (`elementId`),
  CONSTRAINT `fk_lxhmtajiyjshlmeygyizrmxviblskwzoqjsy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vuwildouotznuqcigjsxkdxwdtvtnsrfgwiu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qfcmxmrkzdjwogqmnwzxwinmorxstjhhecho` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zgxvffawcrchaciaeaqiirvvqippuurwuwjj` (`key`,`language`),
  KEY `idx_fdxgmpwnqleiohghvcxyhozoloqfzsjumoej` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_axbbscjzzibbgruroflbprxswpmxwgnuxvfc` (`name`),
  KEY `idx_qdrcsbprgutoqbctsclfyfiqbclafqkjuxfq` (`handle`),
  KEY `idx_ilwmosgnkegdfecrbkpkocswmnawtwcxubfx` (`dateDeleted`),
  KEY `fk_cuearbevklwyfhcoxbgzlzwtyenppzfukhxi` (`fieldLayoutId`),
  CONSTRAINT `fk_cuearbevklwyfhcoxbgzlzwtyenppzfukhxi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cvpwzzxgxnxahcrmwlqtcnbcfigyzfinpbzr` (`groupId`),
  CONSTRAINT `fk_brxcxaytzxgrvmuxlsyaconebqnaphxyvrhv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_twlpktdvrpbbrnjazcykhoehuilivmwnzdnc` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `route` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xykslnpjoouvpoiqtnqqrfmpoafxlpkxkxtw` (`token`),
  KEY `idx_oiecoanjktxzlyshixnbflfkztyjfrqrmfpx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_inqyzbejetgqvtczxvqzeviilbxmucpacjqy` (`handle`),
  KEY `idx_yhactiqleagofznezrlppbbvayfjkjmidswq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bykokunguuzgdjsstxifiykrxdabwmytxkjj` (`groupId`,`userId`),
  KEY `idx_rlxpzxzmfxrxogoarsipwgqxwdlibbyfhtgk` (`userId`),
  CONSTRAINT `fk_acwqxbjhmwdbupgwmkgrdtwqrwwyygrqaqca` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_extmxqauwqfcbffiekkvhfdlzqhpmmrfuhvs` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gbjpggwtkxxnbgisgugbkslhgktxykzknovi` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_blzraykzbamvrbuneibazgjocvgmjzhvcjmw` (`permissionId`,`groupId`),
  KEY `idx_uyhxxozudkbvxehpikiyxbojrpojludaijkc` (`groupId`),
  CONSTRAINT `fk_mldlaehvemodwqusgfovtlzwqkkldydfxbkl` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wyqfealnzlpivdbipxjelhijadqulzzpcqtr` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jgzuptmeevnrnvvjxnmlflwfldzxuqmxersr` (`permissionId`,`userId`),
  KEY `idx_crosuiiyuclwuubqfosfnghutrrrzpiiteam` (`userId`),
  CONSTRAINT `fk_bbmbyfbwfgolsflfujsblyhynxvngfgrkzac` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hqkwbgkvqctaixhwetbiljwnuqnwysivqzqc` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_xebtilhdqitfnneznqjolensugyeuhrcijty` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rbmueghkfolwccaoeatvhkrvtdwzvqzcekwr` (`verificationCode`),
  KEY `idx_kirgtfahskilknxcvvfbnciaghtvxvdvssjt` (`email`),
  KEY `idx_rtyqbldlanmbbtonohgdihyfmboaklzqghrg` (`username`),
  KEY `fk_owbmbtuobnoonkkbxgvzopakifgwukdjqmbd` (`photoId`),
  KEY `idx_msnqjkdtinldkxejmoeyanzknscvkncdpjbn` (`active`),
  KEY `idx_taczkqkybfipzhcptufporpwvrqpwsejavis` (`locked`),
  KEY `idx_wyflxtzgpfvvzqaiptbtmskphwtokczqoojs` (`pending`),
  KEY `idx_iiuaallfldxrszqpkfbvcunloaehdsptweac` (`suspended`),
  CONSTRAINT `fk_owbmbtuobnoonkkbxgvzopakifgwukdjqmbd` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wqzelhjkygvstccqvwsyuavyrcwaldclcibr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,NULL,'tom@tomdavies.net','$2y$13$yQb5Q0sR/HpJR7MwlF8Y7uXgddKTS56F.jmGthLoRYORZMxccMdra',1,1,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,'2022-04-21 10:33:02','2022-04-21 10:33:02','2022-04-21 11:54:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vejnwkwlhzkhntrnjrnwjecuszcqpyvyioot` (`name`,`parentId`,`volumeId`),
  KEY `idx_gaonymfridkwyglprsyhjrilyjmvmrfbqyzg` (`parentId`),
  KEY `idx_zqifjimejsjofqugoxbybeeslxercfqpanua` (`volumeId`),
  CONSTRAINT `fk_jtxxzlwthyuolvdioupwkprynkpssmygqkyy` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_parujsytneoiqdcvntmpudrpvwfggpfqtujt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transformFs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_venpgtsjrtntnhxqwmhhzkhubscwmnayqftf` (`name`),
  KEY `idx_afjvcucnvzfdwdgjatqzsskboitblmevsmwb` (`handle`),
  KEY `idx_jxoirhkehfrtdxuguccskchllitrftuzmdvx` (`fieldLayoutId`),
  KEY `idx_llrdqwezjqidvlkcezisakkujtlwlgtxhvst` (`dateDeleted`),
  CONSTRAINT `fk_oorydnmdhlkkobynhtuhtvlyieqggsmsewjj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iplakbivvabbvtbuhcozorxpftzstslseblu` (`userId`),
  CONSTRAINT `fk_bocmmizellvdtiaisqubtflaehtgnegiwbme` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-21 11:55:41
