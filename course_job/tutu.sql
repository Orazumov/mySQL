-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: localhost    Database: tutu
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `car_name` varchar(255) NOT NULL,
  `car_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_car_type_id_fk` (`car_type_id`),
  CONSTRAINT `car_car_type_id_fk` FOREIGN KEY (`car_type_id`) REFERENCES `car_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'С',1),(2,'О',2),(3,'ПЛ.',3),(4,'К.',4),(5,'М.',5),(6,'СВ.',6);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_place`
--

DROP TABLE IF EXISTS `car_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_place` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `car_id` int unsigned NOT NULL,
  `place_type_id` int unsigned NOT NULL,
  `place_num` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `car_place_type_id_fk` (`place_type_id`),
  KEY `car_place_car_id_fk` (`car_id`),
  CONSTRAINT `car_place_car_id_fk` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  CONSTRAINT `car_place_type_id_fk` FOREIGN KEY (`place_type_id`) REFERENCES `places_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_place`
--

LOCK TABLES `car_place` WRITE;
/*!40000 ALTER TABLE `car_place` DISABLE KEYS */;
INSERT INTO `car_place` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3),(4,1,1,4),(5,1,1,5),(6,1,1,6),(7,1,1,7),(8,1,1,8),(9,1,1,9),(10,1,1,10),(11,1,1,11),(12,1,1,12),(13,1,1,13),(14,1,1,14),(15,1,1,15),(16,1,1,16),(17,1,1,17),(18,1,1,18),(19,1,1,19),(20,1,1,20),(21,1,1,21),(22,1,1,22),(23,1,1,23),(24,1,1,24),(25,1,1,25),(26,2,1,1),(27,2,1,2),(28,2,1,3),(29,2,1,4),(30,2,1,5),(31,2,1,6),(32,2,1,7),(33,2,1,8),(34,2,1,9),(35,2,1,10),(36,2,1,11),(37,2,1,12),(38,2,1,13),(39,2,1,14),(40,2,1,15),(41,2,1,16),(42,2,1,17),(43,2,1,18),(44,2,1,19),(45,2,1,20),(46,2,1,21),(47,2,1,22),(48,2,1,23),(49,2,1,24),(50,2,1,25),(51,3,2,1),(52,3,3,2),(53,3,2,3),(54,3,3,4),(55,3,4,5),(56,3,5,6),(57,3,2,7),(58,3,3,8),(59,3,2,9),(60,3,3,10),(61,3,4,11),(62,3,5,12),(63,3,2,13),(64,3,3,14),(65,3,2,15),(66,3,3,16),(67,3,4,17),(68,3,5,18),(69,3,2,19),(70,3,3,20),(71,3,2,21),(72,3,3,22),(73,3,4,23),(74,3,5,24),(75,4,6,1),(76,4,7,2),(77,4,6,3),(78,4,7,4),(79,4,6,5),(80,4,7,6),(81,4,6,7),(82,4,7,8),(83,4,6,9),(84,4,7,10),(85,4,6,11),(86,4,7,12),(87,4,6,13),(88,4,7,14),(89,4,6,15),(90,4,7,16),(91,4,6,17),(92,4,7,18),(93,4,6,19),(94,4,7,20),(95,4,6,21),(96,4,7,22),(97,4,6,23),(98,4,7,24),(99,4,8,1),(100,4,8,2),(101,4,8,3),(102,4,8,4),(103,4,8,5),(104,4,8,6),(105,4,8,7),(106,4,8,8),(107,4,8,9),(108,4,8,10),(109,4,8,11),(110,4,8,12),(111,4,8,13),(112,4,8,14),(113,4,8,15),(114,4,8,16),(115,4,8,17),(116,4,8,18),(117,4,8,19),(118,4,8,20),(119,4,8,21),(120,4,8,22),(121,4,8,23),(122,4,8,24),(123,4,8,1),(124,4,8,2),(125,4,8,3),(126,4,8,4),(127,4,8,5),(128,4,8,6),(129,4,8,7),(130,4,8,8),(131,4,8,9),(132,4,8,10),(133,4,8,11),(134,4,8,12),(135,4,8,13),(136,4,8,14),(137,4,8,15),(138,4,8,16),(139,4,8,17),(140,4,8,18),(141,4,8,19),(142,4,8,20),(143,4,8,21),(144,4,8,22),(145,4,8,23),(146,4,8,24);
/*!40000 ALTER TABLE `car_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type`
--

DROP TABLE IF EXISTS `car_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `car_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type`
--

LOCK TABLES `car_type` WRITE;
/*!40000 ALTER TABLE `car_type` DISABLE KEYS */;
INSERT INTO `car_type` VALUES (1,'Вагон с местами для сидения'),(2,'Вагон открытого с местами для сидения (общий)'),(3,'Спальный пассажирский вагон открытого типа (плацкартный)'),(4,'Купейный с 4–х местными купе'),(5,'Мягкий с 2-х местными купе с ванной комнатой'),(6,'Мягкий с 2–х местными купе');
/*!40000 ALTER TABLE `car_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `train_id` int unsigned NOT NULL,
  `rate` int unsigned DEFAULT NULL,
  `feedback` json DEFAULT NULL,
  `feedback_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feedback_train_id_fk` (`train_id`),
  CONSTRAINT `feedback_train_id_fk` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,5,'{\"who\": \"Alex\", \"text\": \"Мне все понравилось, сидишь себе и едешь!\"}','2007-05-08 12:35:29'),(2,2,4,'{\"who\": \"Misha\", \"text\": \"В целом все хорошо, новые постели\"}','2018-06-15 18:00:05'),(3,3,1,'{\"who\": \"Konstantin\", \"text\": \"Да вы что смеетесь?! сравните с поездами в Европе, и за те же деньги, кстати!\"}','2020-03-15 17:00:05'),(4,4,5,'{\"who\": \"Alena\", \"text\": \"Вежливый проводник, все понравилось!\"}','2015-01-01 18:00:05'),(5,5,5,'{\"who\": \"Max\", \"text\": \"Отлично.\"}','2017-07-15 18:00:05'),(6,6,3,'{\"who\": \"455monster\", \"text\": \"А че, неплохо так, везет!\"}','2014-02-15 14:00:05'),(7,7,5,'{\"who\": \"Greg\", \"text\": \"Oh, I liked everything! Mysterious russian soul!\"}','2018-08-04 15:00:05');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!50001 DROP VIEW IF EXISTS `feedbacks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feedbacks` AS SELECT 
 1 AS `name`,
 1 AS `who`,
 1 AS `rate`,
 1 AS `feed_text`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `places_types`
--

DROP TABLE IF EXISTS `places_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `place_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places_types`
--

LOCK TABLES `places_types` WRITE;
/*!40000 ALTER TABLE `places_types` DISABLE KEYS */;
INSERT INTO `places_types` VALUES (1,'Сидячее место'),(2,'Плацкарт верх'),(3,'Плацкарт низ'),(4,'Плацкарт боковое верх'),(5,'Плацкарт боковое низ'),(6,'Купе вех'),(7,'Купе низ'),(8,'Мягкое купе');
/*!40000 ALTER TABLE `places_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_way`
--

DROP TABLE IF EXISTS `platform_way`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platform_way` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `station_id` int unsigned NOT NULL,
  `way_id` int unsigned NOT NULL,
  `platform_number` int unsigned NOT NULL,
  `platform_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stations_line_way_id_fk` (`way_id`),
  KEY `platform_way_platform_type_id_fk` (`platform_type_id`),
  KEY `platform_way_station_id_fk` (`station_id`),
  CONSTRAINT `platform_way_platform_type_id_fk` FOREIGN KEY (`platform_type_id`) REFERENCES `platforms_types` (`id`),
  CONSTRAINT `platform_way_station_id_fk` FOREIGN KEY (`station_id`) REFERENCES `stations_base` (`id`),
  CONSTRAINT `stations_line_way_id_fk` FOREIGN KEY (`way_id`) REFERENCES `ways` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_way`
--

LOCK TABLES `platform_way` WRITE;
/*!40000 ALTER TABLE `platform_way` DISABLE KEYS */;
INSERT INTO `platform_way` VALUES (1,1,1,1,1),(2,1,2,1,1),(3,2,1,1,1),(4,2,2,1,1),(5,3,1,1,1),(6,3,2,1,1),(7,4,1,1,1),(8,4,2,1,1),(9,5,1,1,1),(10,5,2,1,1),(11,6,1,1,1),(12,6,2,1,1),(13,7,1,1,1),(14,7,2,1,1),(15,8,1,1,1),(16,8,2,1,1),(17,8,1,2,1),(18,8,2,2,1),(19,9,1,1,1),(20,9,2,1,1),(21,10,1,1,1),(22,10,2,1,1),(23,10,1,2,1),(24,10,2,2,1),(25,11,1,1,1),(26,11,2,1,1),(27,12,1,1,1),(28,12,2,1,1),(29,13,1,1,1),(30,13,2,1,1),(31,14,1,1,1),(32,14,2,1,1),(33,15,1,1,1),(34,15,2,1,1),(35,16,1,1,1),(36,16,2,1,1),(37,16,1,2,1),(38,16,2,2,1),(39,17,1,1,1),(40,17,2,1,1),(41,18,1,1,1),(42,18,2,1,1),(43,19,1,1,1),(44,19,2,1,1),(45,20,1,1,1),(46,20,2,1,1),(47,20,1,2,1),(48,20,2,2,1),(49,21,1,1,1),(50,21,2,1,1),(51,22,1,1,1),(52,22,2,1,1),(53,23,1,1,1),(54,23,2,1,1),(55,24,1,1,1),(56,24,2,1,1),(57,25,1,1,1),(58,25,2,1,1),(59,25,1,2,1),(60,25,2,2,1),(61,26,1,1,1),(62,26,2,1,1),(63,27,1,1,1),(64,27,2,1,1),(65,28,1,1,1),(66,28,2,1,1),(67,28,1,2,1),(68,28,2,2,1);
/*!40000 ALTER TABLE `platform_way` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms_types`
--

DROP TABLE IF EXISTS `platforms_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `platform_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms_types`
--

LOCK TABLES `platforms_types` WRITE;
/*!40000 ALTER TABLE `platforms_types` DISABLE KEYS */;
INSERT INTO `platforms_types` VALUES (1,'Верхняя'),(2,'Нижняя');
/*!40000 ALTER TABLE `platforms_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `price_per_km` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,3);
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_per_place_type`
--

DROP TABLE IF EXISTS `price_per_place_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_per_place_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `place_type_id` int unsigned NOT NULL,
  `price` int unsigned NOT NULL,
  `price_reduced` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `price_per_place_type_place_type_id_fk` (`place_type_id`),
  CONSTRAINT `price_per_place_type_place_type_id_fk` FOREIGN KEY (`place_type_id`) REFERENCES `places_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_per_place_type`
--

LOCK TABLES `price_per_place_type` WRITE;
/*!40000 ALTER TABLE `price_per_place_type` DISABLE KEYS */;
INSERT INTO `price_per_place_type` VALUES (1,1,100,50),(2,2,200,150),(3,3,210,160),(4,4,150,100),(5,5,150,100),(6,6,250,200),(7,7,250,200),(8,8,500,500);
/*!40000 ALTER TABLE `price_per_place_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `railways`
--

DROP TABLE IF EXISTS `railways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `railways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `railway_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `railways`
--

LOCK TABLES `railways` WRITE;
/*!40000 ALTER TABLE `railways` DISABLE KEYS */;
INSERT INTO `railways` VALUES (1,'Leningradskii'),(2,'Yaroslavskii'),(3,'Kazanskii'),(4,'Belorusskii'),(5,'Kurskii'),(6,'Kievskii'),(7,'Rizhskii');
/*!40000 ALTER TABLE `railways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `schedule_train_car_place_price`
--

DROP TABLE IF EXISTS `schedule_train_car_place_price`;
/*!50001 DROP VIEW IF EXISTS `schedule_train_car_place_price`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schedule_train_car_place_price` AS SELECT 
 1 AS `stations_line_id`,
 1 AS `express_flag`,
 1 AS `date_time_arrive`,
 1 AS `stop_time`,
 1 AS `station_id`,
 1 AS `name`,
 1 AS `car_num`,
 1 AS `car_name`,
 1 AS `place_num`,
 1 AS `place_type_name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stations_base`
--

DROP TABLE IF EXISTS `stations_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) NOT NULL,
  `distance` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_base`
--

LOCK TABLES `stations_base` WRITE;
/*!40000 ALTER TABLE `stations_base` DISABLE KEYS */;
INSERT INTO `stations_base` VALUES (1,'Moskva Yaroslavskaya',0.000),(2,'Moskva-3',2.100),(3,'Malenkovskaya',3.600),(4,'Yauza',5.100),(5,'Severyanin',6.900),(6,'Losinoostrovskaya',8.900),(7,'Los',10.700),(8,'Perlovskaya',12.200),(9,'Taininskaya',14.000),(10,'Mjtishi',16.000),(11,'Stroitel',17.500),(12,'Chelyuskinskaya',19.500),(13,'Tarasovskaya',21.300),(14,'Klyazma',22.800),(15,'Mamontovskaya',24.900),(16,'Pushkino',26.700),(17,'Zavetj Ilicha',28.500),(18,'Pravda',30.500),(19,'Zelenogradskaya',32.000),(20,'43km',34.000),(21,'Sofrino',35.800),(22,'Ashukinskaya',37.800),(23,'Kalistovo',39.300),(24,'Radonezh',41.400),(25,'Abramcevo',43.200),(26,'Hotkovo',45.000),(27,'Semhoz',47.000),(28,'Sergiev Pasad',49.100);
/*!40000 ALTER TABLE `stations_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_line`
--

DROP TABLE IF EXISTS `stations_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_line` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `line_name` varchar(255) NOT NULL,
  `railway_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stations_line_railway_id_fk` (`railway_id`),
  CONSTRAINT `stations_line_railway_id_fk` FOREIGN KEY (`railway_id`) REFERENCES `railways` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_line`
--

LOCK TABLES `stations_line` WRITE;
/*!40000 ALTER TABLE `stations_line` DISABLE KEYS */;
INSERT INTO `stations_line` VALUES (1,'Сергиево-Посадская',2);
/*!40000 ALTER TABLE `stations_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations_line_stations_base`
--

DROP TABLE IF EXISTS `stations_line_stations_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations_line_stations_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stations_line_id` int unsigned NOT NULL,
  `station_id` int unsigned NOT NULL,
  `station_number` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stations_line_stations_base_stations_line_id_fk` (`stations_line_id`),
  KEY `stations_line_stations_base_station_id_fk` (`station_id`),
  CONSTRAINT `stations_line_stations_base_station_id_fk` FOREIGN KEY (`station_id`) REFERENCES `stations_base` (`id`),
  CONSTRAINT `stations_line_stations_base_stations_line_id_fk` FOREIGN KEY (`stations_line_id`) REFERENCES `stations_line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations_line_stations_base`
--

LOCK TABLES `stations_line_stations_base` WRITE;
/*!40000 ALTER TABLE `stations_line_stations_base` DISABLE KEYS */;
INSERT INTO `stations_line_stations_base` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,5),(6,1,6,6),(7,1,7,7),(8,1,8,8),(9,1,9,9),(10,1,10,10),(11,1,11,11),(12,1,12,12),(13,1,13,13),(14,1,14,14),(15,1,15,15),(16,1,16,16),(17,1,17,17),(18,1,18,18),(19,1,19,19),(20,1,20,20),(21,1,21,21),(22,1,22,22),(23,1,23,23),(24,1,24,24),(25,1,25,25),(26,1,26,26),(27,1,27,27),(28,1,28,28);
/*!40000 ALTER TABLE `stations_line_stations_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type_id` int unsigned NOT NULL,
  `feedback_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `train_train_feedback_id_fk` (`feedback_id`),
  KEY `train_type_id_fk` (`type_id`),
  CONSTRAINT `train_train_feedback_id_fk` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`id`),
  CONSTRAINT `train_type_id_fk` FOREIGN KEY (`type_id`) REFERENCES `train_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'EL601',1,1),(2,'SKK150',2,2),(3,'EKS750',3,3),(4,'PAS451',4,4),(5,'SKO298',5,5),(6,'VSO788',6,6),(7,'MVS898',7,7),(9,'SAMPLE_NAME',5,NULL);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_car`
--

DROP TABLE IF EXISTS `train_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_car` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `train_id` int unsigned NOT NULL,
  `car_id` int unsigned NOT NULL,
  `car_num` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `train_car_train_id_fk` (`train_id`),
  KEY `train_car_car_id_fk` (`car_id`),
  CONSTRAINT `train_car_car_id_fk` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  CONSTRAINT `train_car_train_id_fk` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_car`
--

LOCK TABLES `train_car` WRITE;
/*!40000 ALTER TABLE `train_car` DISABLE KEYS */;
INSERT INTO `train_car` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3),(4,1,1,4),(5,1,1,5),(6,2,3,1),(7,2,3,2),(8,2,2,3),(9,2,3,4),(10,2,4,5),(11,3,3,1),(12,3,3,2),(13,3,4,3),(14,3,4,4),(15,3,5,5),(16,4,1,1),(17,4,1,2),(18,4,1,3),(19,4,2,4),(20,4,2,5),(21,5,3,1),(22,5,3,2),(23,5,3,3),(24,5,4,4),(25,5,4,5),(26,6,3,1),(27,6,4,2),(28,6,4,3),(29,6,6,4),(30,6,6,5),(31,7,3,1),(32,7,3,2),(33,7,4,3),(34,7,4,4),(35,7,6,5),(36,5,1,1),(37,5,1,2),(38,5,1,3),(39,5,1,4),(40,5,1,5);
/*!40000 ALTER TABLE `train_car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `train_full`
--

DROP TABLE IF EXISTS `train_full`;
/*!50001 DROP VIEW IF EXISTS `train_full`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `train_full` AS SELECT 
 1 AS `name`,
 1 AS `car_num`,
 1 AS `car_name`,
 1 AS `place_num`,
 1 AS `place_type_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `train_time`
--

DROP TABLE IF EXISTS `train_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_time` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stations_line_id` int unsigned NOT NULL,
  `train_id` int unsigned NOT NULL,
  `express_flag` bit(1) NOT NULL,
  `date_time_arrive` datetime DEFAULT CURRENT_TIMESTAMP,
  `stop_time` time DEFAULT NULL,
  `station_id` int unsigned NOT NULL,
  `platform_way_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `train_time_platform_way_id_fk` (`platform_way_id`),
  KEY `train_time_train_id_fk` (`train_id`),
  KEY `train_stations_line_id_fk` (`stations_line_id`),
  KEY `train_time_station_id_fk` (`station_id`),
  CONSTRAINT `train_stations_line_id_fk` FOREIGN KEY (`stations_line_id`) REFERENCES `stations_line` (`id`),
  CONSTRAINT `train_time_platform_way_id_fk` FOREIGN KEY (`platform_way_id`) REFERENCES `platform_way` (`id`),
  CONSTRAINT `train_time_station_id_fk` FOREIGN KEY (`station_id`) REFERENCES `stations_base` (`id`),
  CONSTRAINT `train_time_train_id_fk` FOREIGN KEY (`train_id`) REFERENCES `train` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_time`
--

LOCK TABLES `train_time` WRITE;
/*!40000 ALTER TABLE `train_time` DISABLE KEYS */;
INSERT INTO `train_time` VALUES (1,1,1,_binary '\0','2011-02-12 08:25:00','00:01:00',1,1),(2,1,1,_binary '\0','2011-02-12 08:28:00','00:01:00',2,3),(3,1,1,_binary '\0','2011-02-12 08:33:00','00:01:00',3,5),(4,1,1,_binary '\0','2011-02-12 08:37:00','00:02:00',4,7),(5,1,1,_binary '\0','2011-02-12 08:42:00','00:03:00',5,9),(6,1,1,_binary '\0','2011-02-12 08:50:00','00:01:00',6,11),(7,1,1,_binary '\0','2011-02-12 08:54:00','00:01:00',7,13),(8,1,1,_binary '\0','2011-02-12 08:58:00','00:01:00',8,15),(9,1,1,_binary '\0','2011-02-12 09:02:00','00:01:00',9,19),(10,1,1,_binary '\0','2011-02-12 09:04:00','00:02:00',10,21),(11,1,1,_binary '\0','2011-02-12 09:10:00','00:01:00',11,25),(12,1,1,_binary '\0','2011-02-12 09:13:00','00:01:00',12,27),(13,1,1,_binary '\0','2011-02-12 09:17:00','00:01:00',13,29),(14,1,1,_binary '\0','2011-02-12 09:20:00','00:02:00',14,31),(15,1,1,_binary '\0','2011-02-12 09:25:00','00:02:00',15,33),(16,1,1,_binary '\0','2011-02-12 09:30:00','00:01:00',16,35),(17,1,1,_binary '\0','2011-02-12 09:33:00','00:01:00',17,39),(18,1,1,_binary '\0','2011-02-12 09:37:00','00:01:00',18,41),(19,1,1,_binary '\0','2011-02-12 09:41:00','00:01:00',19,43),(20,1,1,_binary '\0','2011-02-12 09:44:00','00:02:00',20,45),(21,1,1,_binary '\0','2011-02-12 09:47:00','00:01:00',21,49),(22,1,1,_binary '\0','2011-02-12 09:50:00','00:05:00',22,51),(23,1,1,_binary '\0','2011-02-12 09:58:00','00:01:00',23,53),(24,1,1,_binary '\0','2011-02-12 10:01:00','00:01:00',24,55),(25,1,1,_binary '\0','2011-02-12 10:04:00','00:02:00',25,57),(26,1,1,_binary '\0','2011-02-12 10:08:00','00:01:00',26,61),(27,1,1,_binary '\0','2011-02-12 10:10:00','00:01:00',27,63),(28,1,1,_binary '\0','2011-02-12 10:15:00','00:20:00',28,65),(29,1,2,_binary '\0','2011-02-12 11:25:00','00:01:00',1,1),(30,1,2,_binary '\0','2011-02-12 11:28:00','00:01:00',2,3),(31,1,2,_binary '\0','2011-02-12 11:33:00','00:01:00',3,5),(32,1,2,_binary '\0','2011-02-12 11:37:00','00:02:00',4,7),(33,1,2,_binary '\0','2011-02-12 11:42:00','00:03:00',5,9),(34,1,2,_binary '\0','2011-02-12 11:50:00','00:01:00',6,11),(35,1,2,_binary '\0','2011-02-12 11:54:00','00:01:00',7,13),(36,1,2,_binary '\0','2011-02-12 11:58:00','00:01:00',8,15),(37,1,2,_binary '\0','2011-02-12 12:02:00','00:01:00',9,19),(38,1,2,_binary '\0','2011-02-12 12:04:00','00:02:00',10,21),(39,1,2,_binary '\0','2011-02-12 12:10:00','00:01:00',11,25),(40,1,2,_binary '\0','2011-02-12 12:13:00','00:01:00',12,27),(41,1,2,_binary '\0','2011-02-12 12:17:00','00:01:00',13,29),(42,1,2,_binary '\0','2011-02-12 12:20:00','00:02:00',14,31),(43,1,2,_binary '\0','2011-02-12 12:25:00','00:02:00',15,33),(44,1,2,_binary '\0','2011-02-12 12:30:00','00:01:00',16,35),(45,1,2,_binary '\0','2011-02-12 12:33:00','00:01:00',17,39),(46,1,2,_binary '\0','2011-02-12 12:37:00','00:01:00',18,41),(47,1,2,_binary '\0','2011-02-12 12:41:00','00:01:00',19,43),(48,1,2,_binary '\0','2011-02-12 12:44:00','00:02:00',20,45),(49,1,2,_binary '\0','2011-02-12 12:47:00','00:01:00',21,49),(50,1,2,_binary '\0','2011-02-12 12:50:00','00:05:00',22,51),(51,1,2,_binary '\0','2011-02-12 12:58:00','00:01:00',23,53),(52,1,2,_binary '\0','2011-02-12 13:01:00','00:01:00',24,55),(53,1,2,_binary '\0','2011-02-12 13:04:00','00:02:00',25,57),(54,1,2,_binary '\0','2011-02-12 13:08:00','00:01:00',26,61),(55,1,2,_binary '\0','2011-02-12 13:10:00','00:01:00',27,63),(56,1,2,_binary '\0','2011-02-12 13:15:00','00:20:00',28,65),(57,1,3,_binary '','2011-02-12 12:25:00','00:01:00',1,1),(58,1,3,_binary '','2011-02-12 12:28:00','00:01:00',2,3),(59,1,3,_binary '','2011-02-12 12:33:00','00:01:00',3,5),(60,1,3,_binary '','2011-02-12 12:37:00','00:02:00',4,7),(61,1,3,_binary '','2011-02-12 12:42:00','00:03:00',5,9),(62,1,3,_binary '','2011-02-12 12:50:00','00:01:00',6,11),(63,1,3,_binary '','2011-02-12 12:54:00','00:01:00',7,13),(64,1,3,_binary '','2011-02-12 12:58:00','00:01:00',8,15),(65,1,3,_binary '','2011-02-12 13:02:00','00:01:00',9,19),(66,1,3,_binary '','2011-02-12 13:25:00','00:02:00',20,45),(67,1,3,_binary '','2011-02-12 13:29:00','00:01:00',21,49),(68,1,3,_binary '','2011-02-12 13:33:00','00:05:00',22,51),(69,1,3,_binary '','2011-02-12 13:40:00','00:01:00',23,53),(70,1,3,_binary '','2011-02-12 13:43:00','00:01:00',24,55),(71,1,3,_binary '','2011-02-12 13:45:00','00:02:00',25,57),(72,1,3,_binary '','2011-02-12 13:50:00','00:01:00',26,61),(73,1,3,_binary '','2011-02-12 13:54:00','00:01:00',27,63),(74,1,3,_binary '','2011-02-12 14:00:00','00:20:00',28,65),(75,1,4,_binary '','2011-02-12 14:25:00','00:01:00',1,1),(76,1,4,_binary '','2011-02-12 14:28:00','00:01:00',2,3),(77,1,4,_binary '','2011-02-12 14:33:00','00:01:00',3,5),(78,1,4,_binary '','2011-02-12 14:37:00','00:02:00',4,7),(79,1,4,_binary '','2011-02-12 14:42:00','00:03:00',5,9),(80,1,4,_binary '','2011-02-12 14:50:00','00:01:00',6,11),(81,1,4,_binary '','2011-02-12 14:54:00','00:01:00',7,13),(82,1,4,_binary '','2011-02-12 14:58:00','00:01:00',8,15),(83,1,4,_binary '','2011-02-12 15:02:00','00:01:00',9,19),(84,1,4,_binary '','2011-02-12 15:40:00','00:02:00',25,57),(85,1,4,_binary '','2011-02-12 15:44:00','00:01:00',26,61),(86,1,4,_binary '','2011-02-12 15:47:00','00:01:00',27,63),(87,1,4,_binary '','2011-02-12 15:50:00','00:20:00',28,65),(88,1,5,_binary '\0','2011-02-12 17:25:00','00:01:00',1,1),(89,1,5,_binary '\0','2011-02-12 17:28:00','00:01:00',2,3),(90,1,5,_binary '\0','2011-02-12 17:33:00','00:01:00',3,5),(91,1,5,_binary '\0','2011-02-12 17:37:00','00:02:00',4,7),(92,1,5,_binary '\0','2011-02-12 17:42:00','00:03:00',5,9),(93,1,5,_binary '\0','2011-02-12 17:50:00','00:01:00',6,11),(94,1,5,_binary '\0','2011-02-12 17:54:00','00:01:00',7,13),(95,1,5,_binary '\0','2011-02-12 17:58:00','00:01:00',8,15),(96,1,5,_binary '\0','2011-02-12 18:02:00','00:01:00',9,19),(97,1,5,_binary '\0','2011-02-12 18:04:00','00:02:00',10,21),(98,1,5,_binary '\0','2011-02-12 18:10:00','00:01:00',11,25),(99,1,5,_binary '\0','2011-02-12 18:13:00','00:01:00',12,27),(100,1,5,_binary '\0','2011-02-12 18:17:00','00:01:00',13,29),(101,1,5,_binary '\0','2011-02-12 18:20:00','00:02:00',14,31),(102,1,5,_binary '\0','2011-02-12 18:25:00','00:02:00',15,33),(103,1,5,_binary '\0','2011-02-12 18:30:00','00:01:00',16,35),(104,1,5,_binary '\0','2011-02-12 18:33:00','00:01:00',17,39),(105,1,5,_binary '\0','2011-02-12 18:37:00','00:01:00',18,41),(106,1,5,_binary '\0','2011-02-12 18:41:00','00:01:00',19,43),(107,1,5,_binary '\0','2011-02-12 18:44:00','00:02:00',20,45),(108,1,5,_binary '\0','2011-02-12 18:47:00','00:01:00',21,49),(109,1,5,_binary '\0','2011-02-12 18:50:00','00:05:00',22,51),(110,1,5,_binary '\0','2011-02-12 18:58:00','00:01:00',23,53),(111,1,5,_binary '\0','2011-02-12 19:01:00','00:01:00',24,55),(112,1,5,_binary '\0','2011-02-12 19:04:00','00:02:00',25,57),(113,1,5,_binary '\0','2011-02-12 19:08:00','00:01:00',26,61),(114,1,5,_binary '\0','2011-02-12 19:10:00','00:01:00',27,63),(115,1,5,_binary '\0','2011-02-12 19:15:00','00:20:00',28,65),(116,1,6,_binary '\0','2011-02-12 19:25:00','00:01:00',1,1),(117,1,6,_binary '\0','2011-02-12 19:28:00','00:01:00',2,3),(118,1,6,_binary '\0','2011-02-12 19:33:00','00:01:00',3,5),(119,1,6,_binary '\0','2011-02-12 19:37:00','00:02:00',4,7),(120,1,6,_binary '\0','2011-02-12 19:42:00','00:03:00',6,9),(121,1,6,_binary '\0','2011-02-12 19:50:00','00:01:00',6,11),(122,1,6,_binary '\0','2011-02-12 19:54:00','00:01:00',7,13),(123,1,6,_binary '\0','2011-02-12 19:58:00','00:01:00',8,15),(124,1,6,_binary '\0','2011-02-12 20:02:00','00:01:00',9,19),(125,1,6,_binary '\0','2011-02-12 20:04:00','00:02:00',10,21),(126,1,6,_binary '\0','2011-02-12 20:10:00','00:01:00',11,25),(127,1,6,_binary '\0','2011-02-12 20:13:00','00:01:00',12,27),(128,1,6,_binary '\0','2011-02-12 20:17:00','00:01:00',13,29),(129,1,6,_binary '\0','2011-02-12 20:20:00','00:02:00',14,31),(130,1,6,_binary '\0','2011-02-12 20:25:00','00:02:00',15,33),(131,1,6,_binary '\0','2011-02-12 20:30:00','00:01:00',16,35),(132,1,6,_binary '\0','2011-02-12 20:33:00','00:01:00',17,39),(133,1,6,_binary '\0','2011-02-12 20:37:00','00:01:00',18,41),(134,1,6,_binary '\0','2011-02-12 20:41:00','00:01:00',19,43),(135,1,6,_binary '\0','2011-02-12 20:44:00','00:02:00',20,45),(136,1,6,_binary '\0','2011-02-12 20:47:00','00:01:00',21,49),(137,1,6,_binary '\0','2011-02-12 20:50:00','00:05:00',22,51),(138,1,6,_binary '\0','2011-02-12 20:58:00','00:01:00',23,53),(139,1,6,_binary '\0','2011-02-12 21:01:00','00:01:00',24,55),(140,1,6,_binary '\0','2011-02-12 21:04:00','00:02:00',25,57),(141,1,6,_binary '\0','2011-02-12 21:08:00','00:01:00',26,61),(142,1,6,_binary '\0','2011-02-12 21:10:00','00:01:00',27,63),(143,1,6,_binary '\0','2011-02-12 21:15:00','00:20:00',28,65),(144,1,7,_binary '\0','2011-02-12 21:25:00','00:01:00',1,1),(145,1,7,_binary '\0','2011-02-12 21:28:00','00:01:00',2,3),(146,1,7,_binary '\0','2011-02-12 21:33:00','00:01:00',3,5),(147,1,7,_binary '\0','2011-02-12 21:37:00','00:02:00',4,7),(148,1,7,_binary '\0','2011-02-12 21:42:00','00:03:00',7,9),(149,1,7,_binary '\0','2011-02-12 21:50:00','00:01:00',6,11),(150,1,7,_binary '\0','2011-02-12 21:54:00','00:01:00',7,13),(151,1,7,_binary '\0','2011-02-12 21:58:00','00:01:00',8,15),(152,1,7,_binary '\0','2011-02-12 22:02:00','00:01:00',9,19),(153,1,7,_binary '\0','2011-02-12 22:04:00','00:02:00',10,21),(154,1,7,_binary '\0','2011-02-12 22:10:00','00:01:00',11,25),(155,1,7,_binary '\0','2011-02-12 22:13:00','00:01:00',12,27),(156,1,7,_binary '\0','2011-02-12 22:17:00','00:01:00',13,29),(157,1,7,_binary '\0','2011-02-12 22:20:00','00:02:00',14,31),(158,1,7,_binary '\0','2011-02-12 22:25:00','00:02:00',15,33),(159,1,7,_binary '\0','2011-02-12 22:30:00','00:01:00',16,35),(160,1,7,_binary '\0','2011-02-12 22:33:00','00:01:00',17,39),(161,1,7,_binary '\0','2011-02-12 22:37:00','00:01:00',18,41),(162,1,7,_binary '\0','2011-02-12 22:41:00','00:01:00',19,43),(163,1,7,_binary '\0','2011-02-12 22:44:00','00:02:00',20,45),(164,1,7,_binary '\0','2011-02-12 22:47:00','00:01:00',21,49),(165,1,7,_binary '\0','2011-02-12 22:50:00','00:05:00',22,51),(166,1,7,_binary '\0','2011-02-12 22:58:00','00:01:00',23,53),(167,1,7,_binary '\0','2011-02-12 23:01:00','00:01:00',24,55),(168,1,7,_binary '\0','2011-02-12 23:04:00','00:02:00',25,57),(169,1,7,_binary '\0','2011-02-12 23:08:00','00:01:00',26,61),(170,1,7,_binary '\0','2011-02-12 23:10:00','00:01:00',27,63),(171,1,7,_binary '\0','2011-02-12 23:15:00','00:20:00',28,65);
/*!40000 ALTER TABLE `train_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_time_one_train`
--

DROP TABLE IF EXISTS `train_time_one_train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_time_one_train` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `stations_line_id` int unsigned DEFAULT NULL,
  `train_id` int unsigned DEFAULT NULL,
  `express_flag` bit(1) DEFAULT NULL,
  `date_time_arrive` datetime DEFAULT NULL,
  `stop_time` time DEFAULT NULL,
  `station_id` int unsigned DEFAULT NULL,
  `platform_way_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_time_one_train`
--

LOCK TABLES `train_time_one_train` WRITE;
/*!40000 ALTER TABLE `train_time_one_train` DISABLE KEYS */;
/*!40000 ALTER TABLE `train_time_one_train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_type`
--

DROP TABLE IF EXISTS `train_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `train_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_type`
--

LOCK TABLES `train_type` WRITE;
/*!40000 ALTER TABLE `train_type` DISABLE KEYS */;
INSERT INTO `train_type` VALUES (1,'Пассажирские круглогодичного обращения'),(2,'Скорые пассажирские'),(3,'Скоростные'),(4,'Пассажирские сезонные и разового назначения'),(5,'Скорые сезонные и разового обращения'),(6,'Высокоскоростные'),(7,'Скорые, обслуживаемые мотор-вагонными составами');
/*!40000 ALTER TABLE `train_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ways`
--

DROP TABLE IF EXISTS `ways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ways` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `way_number` int unsigned NOT NULL,
  `way_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ways`
--

LOCK TABLES `ways` WRITE;
/*!40000 ALTER TABLE `ways` DISABLE KEYS */;
INSERT INTO `ways` VALUES (1,1,'Первый путь'),(2,2,'Второй путь');
/*!40000 ALTER TABLE `ways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `feedbacks`
--

/*!50001 DROP VIEW IF EXISTS `feedbacks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feedbacks` AS select `tr`.`name` AS `name`,json_extract(`fd`.`feedback`,'$.who') AS `who`,`fd`.`rate` AS `rate`,json_extract(`fd`.`feedback`,'$.text') AS `feed_text` from (`feedback` `fd` join `train` `tr` on((`fd`.`train_id` = `tr`.`id`))) order by `fd`.`rate` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schedule_train_car_place_price`
--

/*!50001 DROP VIEW IF EXISTS `schedule_train_car_place_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `schedule_train_car_place_price` AS select distinct `ti`.`stations_line_id` AS `stations_line_id`,`ti`.`express_flag` AS `express_flag`,`ti`.`date_time_arrive` AS `date_time_arrive`,`ti`.`stop_time` AS `stop_time`,`ti`.`station_id` AS `station_id`,`tr`.`name` AS `name`,`tc`.`car_num` AS `car_num`,`c`.`car_name` AS `car_name`,`cp`.`place_num` AS `place_num`,`pt`.`place_type_name` AS `place_type_name`,`pri`.`price` AS `price` from ((((((`train_time` `ti` left join `train` `tr` on((`ti`.`train_id` = `tr`.`id`))) left join `train_car` `tc` on((`tr`.`id` = `tc`.`train_id`))) left join `car` `c` on((`c`.`id` = `tc`.`car_id`))) left join `car_place` `cp` on((`cp`.`car_id` = `c`.`id`))) left join `places_types` `pt` on((`pt`.`id` = `cp`.`place_type_id`))) left join `price_per_place_type` `pri` on((`pri`.`place_type_id` = `pt`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `train_full`
--

/*!50001 DROP VIEW IF EXISTS `train_full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `train_full` AS select `tr`.`name` AS `name`,`tc`.`car_num` AS `car_num`,`c`.`car_name` AS `car_name`,`cp`.`place_num` AS `place_num`,`pt`.`place_type_name` AS `place_type_name` from ((((`train` `tr` join `train_car` `tc` on((`tr`.`id` = `tc`.`train_id`))) join `car` `c` on((`c`.`id` = `tc`.`car_id`))) join `car_place` `cp` on((`cp`.`car_id` = `c`.`id`))) join `places_types` `pt` on((`pt`.`id` = `cp`.`place_type_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-25 21:59:56
