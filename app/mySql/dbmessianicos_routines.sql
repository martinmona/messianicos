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
-- Dumping routines for database 'dbmessianicos'
--
/*!50003 DROP PROCEDURE IF EXISTS `Competiciones_SelectAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lionel`@`%` PROCEDURE `Competiciones_SelectAll`()
BEGIN
    SELECT * FROM dbmessianicos.Competiciones;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Equipos_SelectAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lionel`@`%` PROCEDURE `Equipos_SelectAll`()
BEGIN
    SELECT * FROM dbmessianicos.Equipos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Estadios_SelectAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lionel`@`%` PROCEDURE `Estadios_SelectAll`()
BEGIN
    SELECT * FROM dbmessianicos.Estadios;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Goles_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lionel`@`%` PROCEDURE `Goles_Insert`(
    IN p_EquipoNombre VARCHAR(50),
    IN p_EquipoEsSeleccion bit(1),
    IN p_RivalNombre VARCHAR(50),
	IN p_RivalEsSeleccion bit(1),
    IN p_CompeticionNombre VARCHAR(50),
    IN p_EstadioNombre VARCHAR(50),
    IN p_TecnicaNombre VARCHAR(50),
    IN p_JugadaNombre VARCHAR(50)
)
BEGIN
    DECLARE v_EquipoID INT;
    DECLARE v_RivalID INT;
    DECLARE v_CompeticionID INT;
    DECLARE v_EstadioID INT;
    DECLARE v_TecnicaID INT;
    DECLARE v_JugadaID INT;
    DECLARE v_Id INT;

    SELECT ID INTO v_EquipoID FROM Equipos WHERE Nombre = p_EquipoNombre;
    IF v_EquipoID IS NULL THEN
        INSERT INTO Equipos (Nombre, JugoMessi, EsSeleccion) VALUES (p_EquipoNombre, 1 , p_EquipoEsSeleccion);
       SET v_EquipoID = LAST_INSERT_ID();
    END IF;

    SELECT ID INTO v_RivalID FROM Equipos WHERE Nombre = p_RivalNombre;
    IF v_RivalID IS NULL THEN
        INSERT INTO Equipos (Nombre, JugoMessi, EsSeleccion) VALUES (p_RivalNombre,0 , p_RivalEsSeleccion);
        SET v_RivalID = LAST_INSERT_ID();
    END IF;

    SELECT ID INTO v_CompeticionID FROM Competiciones WHERE Nombre = p_CompeticionNombre;
    IF v_CompeticionID IS NULL THEN
        INSERT INTO Competiciones (Nombre) VALUES (p_CompeticionNombre);
        SET v_CompeticionID = LAST_INSERT_ID();
    END IF;

    SELECT ID INTO v_EstadioID FROM Estadios WHERE Nombre = p_EstadioNombre;
    IF v_EstadioID IS NULL THEN
        INSERT INTO Estadios (Nombre) VALUES (p_EstadioNombre);
        SET v_EstadioID = LAST_INSERT_ID();
    END IF;

    SELECT ID INTO v_TecnicaID FROM Tecnicas WHERE Nombre = p_TecnicaNombre;
    IF v_TecnicaID IS NULL THEN
        INSERT INTO Tecnicas (Nombre) VALUES (p_TecnicaNombre);
        SET v_TecnicaID = LAST_INSERT_ID();
    END IF;

    SELECT ID INTO v_JugadaID FROM Jugadas WHERE Nombre = p_JugadaNombre;
    IF v_JugadaID IS NULL THEN
        INSERT INTO Jugadas (Nombre) VALUES (p_JugadaNombre);
        SET v_JugadaID = LAST_INSERT_ID();
    END IF;
     
    INSERT INTO Goles (EquipoId, RivalId, CompeticionId, EstadioId, TecnicaId, JugadaId)
VALUES (v_EquipoID, v_RivalID, v_CompeticionID, v_EstadioID, v_TecnicaID, v_JugadaID); 

SET v_Id = LAST_INSERT_ID();

SELECT v_Id AS Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Goles_SelectAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lionel`@`%` PROCEDURE `Goles_SelectAll`()
BEGIN
    SELECT 
	  go.Id
	  ,eq.Nombre as Equipo
	  ,ri.Nombre as Rival
	  ,c.Nombre as Competicion
	  ,es.Nombre as Estadio
	  ,t.Nombre as Tecnica
	  ,j.Nombre as Jugada
FROM dbmessianicos.Goles as go
INNER JOIN Equipos as eq
ON EquipoId = eq.Id
INNER JOIN Equipos as ri
ON RivalId = ri.Id
INNER JOIN Competiciones as c
ON CompeticionId = c.Id
INNER JOIN Estadios as es
ON CompeticionId = es.Id
INNER JOIN Tecnicas as t
ON TecnicaId = t.Id
INNER JOIN Jugadas as j
ON TecnicaId = j.Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Jugadas_SelectAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lionel`@`%` PROCEDURE `Jugadas_SelectAll`()
BEGIN
    SELECT * FROM dbmessianicos.Jugadas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Tecnicas_SelectAll` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Lionel`@`%` PROCEDURE `Tecnicas_SelectAll`()
BEGIN
    SELECT * FROM dbmessianicos.Tecnicas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-13 14:00:49
