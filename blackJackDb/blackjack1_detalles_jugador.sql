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
-- Table structure for table `detalles_jugador`
--

DROP TABLE IF EXISTS `detalles_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_jugador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_jugada` int NOT NULL,
  `id_carta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jugada` (`id_jugada`),
  KEY `id_carta` (`id_carta`),
  CONSTRAINT `detalles_jugador_ibfk_1` FOREIGN KEY (`id_jugada`) REFERENCES `jugadas` (`id`),
  CONSTRAINT `detalles_jugador_ibfk_2` FOREIGN KEY (`id_carta`) REFERENCES `cartas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_jugador`
--

LOCK TABLES `detalles_jugador` WRITE;
/*!40000 ALTER TABLE `detalles_jugador` DISABLE KEYS */;
INSERT INTO `detalles_jugador` VALUES (1,1,1),(2,1,8),(3,2,43),(4,2,43),(5,2,27),(6,3,16),(7,3,49),(8,3,4),(9,3,31),(10,4,50),(11,4,1),(12,5,3),(13,5,23),(14,5,5),(15,6,36),(16,6,9),(17,6,50),(18,7,46),(19,7,7),(20,7,49),(21,8,43),(22,8,35),(23,8,39),(24,9,13),(25,9,30),(26,9,49),(27,10,28),(28,10,15),(29,10,51),(30,10,28),(31,11,37),(32,11,1),(33,12,30),(34,12,10),(35,12,40),(36,12,51),(37,13,52),(38,13,11),(39,14,47),(40,14,13),(41,15,23),(42,15,49),(43,16,3),(44,16,21),(45,16,17),(46,17,48),(47,17,14),(48,18,13),(49,18,3),(50,18,15),(51,18,16),(52,19,47),(53,19,51),(54,19,38),(55,20,49),(56,20,30),(57,20,26),(58,21,14),(59,21,43),(60,21,34),(61,22,13),(62,22,10),(63,23,49),(64,23,6),(65,23,29),(66,24,41),(67,24,35),(68,24,2),(69,24,5),(70,25,43),(71,25,50),(72,25,6),(73,26,42),(74,26,5),(75,26,41),(76,26,47),(77,27,38),(78,27,5),(79,27,9),(80,28,40),(81,28,42),(82,28,3),(83,29,9),(84,29,2),(85,29,10),(86,30,22),(87,30,22),(88,31,9),(89,31,41),(90,31,43),(91,31,28),(92,32,49),(93,32,5),(94,32,10),(95,33,37),(96,33,9),(97,34,8),(98,34,24),(99,2,51),(100,35,33),(101,35,4),(102,35,31);
/*!40000 ALTER TABLE `detalles_jugador` ENABLE KEYS */;
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
