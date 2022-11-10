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
-- Table structure for table `jugadas`
--

DROP TABLE IF EXISTS `jugadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_partida` int NOT NULL,
  `puntos_jugador` int NOT NULL,
  `puntos_croupier` int NOT NULL,
  `ganador` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_partida` (`id_partida`),
  CONSTRAINT `jugadas_ibfk_1` FOREIGN KEY (`id_partida`) REFERENCES `partidas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadas`
--

LOCK TABLES `jugadas` WRITE;
/*!40000 ALTER TABLE `jugadas` DISABLE KEYS */;
INSERT INTO `jugadas` VALUES (1,1,19,20,'croupier'),(2,1,19,17,'jugador'),(3,1,22,0,'croupier'),(4,1,21,0,'jugador'),(5,2,18,17,'jugador'),(6,2,29,0,'croupier'),(7,2,24,0,'croupier'),(8,2,23,0,'croupier'),(9,2,24,0,'croupier'),(10,2,16,26,'jugador'),(11,3,21,0,'jugador'),(12,3,25,0,'croupier'),(13,3,20,20,'empate'),(14,3,18,25,'jugador'),(15,3,20,18,'jugador'),(16,3,15,23,'jugador'),(17,3,20,21,'croupier'),(18,3,18,18,'empate'),(19,3,28,0,'croupier'),(20,3,24,0,'croupier'),(21,3,23,0,'croupier'),(22,3,20,18,'jugador'),(23,3,19,21,'croupier'),(24,4,18,23,'jugador'),(25,4,20,23,'jugador'),(26,5,18,27,'jugador'),(27,5,24,0,'croupier'),(28,5,17,25,'jugador'),(29,5,21,0,'jugador'),(30,7,18,21,'croupier'),(31,8,17,22,'jugador'),(32,8,25,0,'croupier'),(33,8,19,20,'croupier'),(34,8,18,18,'empate'),(35,14,16,17,'croupier');
/*!40000 ALTER TABLE `jugadas` ENABLE KEYS */;
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
