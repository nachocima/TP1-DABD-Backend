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
-- Table structure for table `cartas_usadas`
--

DROP TABLE IF EXISTS `cartas_usadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartas_usadas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_partida` int NOT NULL,
  `id_carta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_partida` (`id_partida`),
  KEY `id_carta` (`id_carta`),
  CONSTRAINT `cartas_usadas_ibfk_1` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id`),
  CONSTRAINT `cartas_usadas_ibfk_2` FOREIGN KEY (`id_carta`) REFERENCES `cartas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas_usadas`
--

LOCK TABLES `cartas_usadas` WRITE;
/*!40000 ALTER TABLE `cartas_usadas` DISABLE KEYS */;
INSERT INTO `cartas_usadas` VALUES (1,1,1),(2,1,8),(3,1,52),(4,1,25),(5,1,43),(6,1,43),(7,1,27),(8,1,6),(9,1,40),(10,1,16),(11,1,49),(12,1,4),(13,1,31),(14,1,50),(15,1,1),(16,2,3),(17,2,23),(18,2,5),(19,2,13),(20,2,46),(21,2,36),(22,2,9),(23,2,50),(24,2,46),(25,2,7),(26,2,49),(27,2,43),(28,2,35),(29,2,39),(30,2,13),(31,2,30),(32,2,49),(33,2,28),(34,2,15),(35,2,51),(36,2,28),(37,2,15),(38,2,30),(39,2,11),(40,2,38),(41,3,37),(42,3,1),(43,3,30),(44,3,10),(45,3,40),(46,3,51),(47,3,52),(48,3,11),(49,3,23),(50,3,24),(51,3,47),(52,3,13),(53,3,50),(54,3,31),(55,3,11),(56,3,23),(57,3,49),(58,3,47),(59,3,11),(60,3,3),(61,3,21),(62,3,17),(63,3,18),(64,3,43),(65,3,17),(66,3,26),(67,3,48),(68,3,14),(69,3,14),(70,3,28),(71,3,8),(72,3,13),(73,3,3),(74,3,15),(75,3,16),(76,3,38),(77,3,44),(78,3,16),(79,3,47),(80,3,51),(81,3,38),(82,3,49),(83,3,30),(84,3,26),(85,3,14),(86,3,43),(87,3,34),(88,3,13),(89,3,10),(90,3,42),(91,3,8),(92,3,20),(93,3,49),(94,3,6),(95,3,29),(96,3,30),(97,3,29),(98,3,22),(99,3,5),(100,4,41),(101,4,35),(102,4,2),(103,4,5),(104,4,15),(105,4,41),(106,4,2),(107,4,28),(108,4,16),(109,4,28),(110,4,51),(111,4,43),(112,4,50),(113,4,6),(114,4,28),(115,4,27),(116,4,38),(117,5,42),(118,5,5),(119,5,41),(120,5,47),(121,5,7),(122,5,45),(123,5,14),(124,5,16),(125,5,38),(126,5,5),(127,5,9),(128,5,40),(129,5,42),(130,5,3),(131,5,16),(132,5,18),(133,5,7),(134,5,38),(135,5,9),(136,5,2),(137,5,10),(138,7,22),(139,7,22),(140,7,51),(141,7,27),(142,8,9),(143,8,41),(144,8,43),(145,8,28),(146,8,33),(147,8,45),(148,8,35),(149,8,49),(150,8,5),(151,8,10),(152,8,37),(153,8,9),(154,8,35),(155,8,1),(156,8,8),(157,8,24),(158,8,36),(159,8,47),(160,3,51),(161,14,33),(162,14,4),(163,14,31),(164,14,36),(165,14,46);
/*!40000 ALTER TABLE `cartas_usadas` ENABLE KEYS */;
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
