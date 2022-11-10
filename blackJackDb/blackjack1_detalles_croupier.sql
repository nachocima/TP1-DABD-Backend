-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: blackjack1
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detalles_croupier`
--

DROP TABLE IF EXISTS `detalles_croupier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_croupier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_jugada` int NOT NULL,
  `id_carta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jugada` (`id_jugada`),
  KEY `id_carta` (`id_carta`),
  CONSTRAINT `detalles_croupier_ibfk_1` FOREIGN KEY (`id_jugada`) REFERENCES `jugadas` (`id`),
  CONSTRAINT `detalles_croupier_ibfk_2` FOREIGN KEY (`id_carta`) REFERENCES `cartas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_croupier`
--

LOCK TABLES `detalles_croupier` WRITE;
/*!40000 ALTER TABLE `detalles_croupier` DISABLE KEYS */;
INSERT INTO `detalles_croupier` VALUES (1,1,52),(2,1,25),(3,2,6),(4,2,40),(5,5,13),(6,5,46),(7,10,15),(8,10,30),(9,10,11),(10,10,38),(11,13,23),(12,13,24),(13,14,50),(14,14,31),(15,14,11),(16,15,47),(17,15,11),(18,16,18),(19,16,43),(20,16,17),(21,16,26),(22,17,14),(23,17,28),(24,17,8),(25,18,38),(26,18,44),(27,18,16),(28,22,42),(29,22,8),(30,22,20),(31,23,30),(32,23,29),(33,23,22),(34,23,5),(35,24,15),(36,24,41),(37,24,2),(38,24,28),(39,24,16),(40,24,28),(41,24,51),(42,25,28),(43,25,27),(44,25,38),(45,26,7),(46,26,45),(47,26,14),(48,26,16),(49,28,16),(50,28,18),(51,28,7),(52,28,38),(53,30,51),(54,30,27),(55,31,33),(56,31,45),(57,31,35),(58,33,35),(59,33,1),(60,34,36),(61,34,47),(62,35,36),(63,35,46);
/*!40000 ALTER TABLE `detalles_croupier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-10 18:33:55
