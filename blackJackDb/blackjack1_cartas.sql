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
-- Table structure for table `cartas`
--

DROP TABLE IF EXISTS `cartas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(3) NOT NULL,
  `palo` varchar(12) NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas`
--

LOCK TABLES `cartas` WRITE;
/*!40000 ALTER TABLE `cartas` DISABLE KEYS */;
INSERT INTO `cartas` VALUES (1,'As','Corazon',11),(2,'2','Corazon',2),(3,'3','Corazon',3),(4,'4','Corazon',4),(5,'5','Corazon',5),(6,'6','Corazon',6),(7,'7','Corazon',7),(8,'8','Corazon',8),(9,'9','Corazon',9),(10,'10','Corazon',10),(11,'J','Corazon',10),(12,'Q','Corazon',10),(13,'K','Corazon',10),(14,'As','Trebol',11),(15,'2','Trebol',2),(16,'3','Trebol',3),(17,'4','Trebol',4),(18,'5','Trebol',5),(19,'6','Trebol',6),(20,'7','Trebol',7),(21,'8','Trebol',8),(22,'9','Trebol',9),(23,'10','Trebol',10),(24,'J','Trebol',10),(25,'Q','Trebol',10),(26,'K','Trebol',10),(27,'As','Diamante',11),(28,'2','Diamante',2),(29,'3','Diamante',3),(30,'4','Diamante',4),(31,'5','Diamante',5),(32,'6','Diamante',6),(33,'7','Diamante',7),(34,'8','Diamante',8),(35,'9','Diamante',9),(36,'10','Diamante',10),(37,'J','Diamante',10),(38,'Q','Diamante',10),(39,'K','Diamante',10),(40,'As','Pica',11),(41,'2','Pica',2),(42,'3','Pica',3),(43,'4','Pica',4),(44,'5','Pica',5),(45,'6','Pica',6),(46,'7','Pica',7),(47,'8','Pica',8),(48,'9','Pica',9),(49,'10','Pica',10),(50,'J','Pica',10),(51,'Q','Pica',10),(52,'K','Pica',10);
/*!40000 ALTER TABLE `cartas` ENABLE KEYS */;
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
