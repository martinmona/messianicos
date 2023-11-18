-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: rds-mysql-messianicos.cmoevdxqs9bs.sa-east-1.rds.amazonaws.com    Database: dbmessianicos
-- ------------------------------------------------------
-- Server version	8.0.33

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Goles`
--

DROP TABLE IF EXISTS `Goles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Goles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `EquipoId` smallint NOT NULL,
  `RivalId` smallint NOT NULL,
  `EstadioId` smallint NOT NULL,
  `JugadaId` tinyint NOT NULL,
  `TecnicaId` tinyint NOT NULL,
  `CompeticionId` smallint NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_RivalId` (`EquipoId`),
  KEY `FK_JugadaId` (`JugadaId`),
  KEY `FK_EstadioId` (`EstadioId`),
  KEY `FK_CompeticionId` (`CompeticionId`),
  KEY `FK_TecnicaId` (`TecnicaId`),
  CONSTRAINT `FK_CompeticionId` FOREIGN KEY (`CompeticionId`) REFERENCES `Competiciones` (`Id`),
  CONSTRAINT `FK_EstadioId` FOREIGN KEY (`EstadioId`) REFERENCES `Estadios` (`Id`),
  CONSTRAINT `FK_JugadaId` FOREIGN KEY (`JugadaId`) REFERENCES `Jugadas` (`Id`),
  CONSTRAINT `FK_TecnicaId` FOREIGN KEY (`TecnicaId`) REFERENCES `Tecnicas` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goles`
--

LOCK TABLES `Goles` WRITE;
/*!40000 ALTER TABLE `Goles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Goles` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-13 14:00:40