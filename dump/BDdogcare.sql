CREATE DATABASE  IF NOT EXISTS `BDdogcare` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `BDdogcare`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: BDdogcare
-- ------------------------------------------------------
-- Server version	8.0.41-0ubuntu0.24.04.1

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
-- Table structure for table `calendarioDisponibilidad`
--

DROP TABLE IF EXISTS `calendarioDisponibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendarioDisponibilidad` (
  `codDiaSemana` int NOT NULL,
  `codCuidador` int NOT NULL,
  `codTipoCuidado` int NOT NULL,
  `fechaIni` varchar(30) DEFAULT NULL,
  `fechaFin` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codDiaSemana`,`codCuidador`,`codTipoCuidado`),
  KEY `fk_calendarioDisponibilidad_cuidadores` (`codCuidador`),
  KEY `fk_calendarioDisponibilidad_tiposCuidados` (`codTipoCuidado`),
  CONSTRAINT `fk_calendarioDisponibilidad_cuidadores` FOREIGN KEY (`codCuidador`) REFERENCES `cuidadores` (`codCuidador`) ON DELETE CASCADE,
  CONSTRAINT `fk_calendarioDisponibilidad_diasSemanas` FOREIGN KEY (`codDiaSemana`) REFERENCES `diasSemana` (`codDiaSemana`) ON DELETE CASCADE,
  CONSTRAINT `fk_calendarioDisponibilidad_tiposCuidados` FOREIGN KEY (`codTipoCuidado`) REFERENCES `tiposCuidados` (`codTipoCuidado`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendarioDisponibilidad`
--

LOCK TABLES `calendarioDisponibilidad` WRITE;
/*!40000 ALTER TABLE `calendarioDisponibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendarioDisponibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `codCliente` int NOT NULL,
  `codCuidador` int NOT NULL,
  `texto` varchar(30) DEFAULT NULL,
  `ordenMensaje` int DEFAULT NULL,
  PRIMARY KEY (`codCliente`,`codCuidador`),
  KEY `fk_chats_cuidadores` (`codCuidador`),
  CONSTRAINT `fk_chats_clientes` FOREIGN KEY (`codCliente`) REFERENCES `clientes` (`codCliente`),
  CONSTRAINT `fk_chats_cuidadores` FOREIGN KEY (`codCuidador`) REFERENCES `cuidadores` (`codCuidador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codCliente` int NOT NULL DEFAULT '0',
  `codUsuario` int DEFAULT NULL,
  `valoracion` decimal(2,1) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`codCliente`),
  KEY `fk_clientes_usuarios` (`codUsuario`),
  CONSTRAINT `fk_clientes_usuarios` FOREIGN KEY (`codUsuario`) REFERENCES `usuarios` (`codUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,1,4.2,'123456789'),(2,2,4.6,'56757'),(3,3,4.8,'123543'),(4,4,4.5,'45456'),(5,5,3.2,'4565456'),(6,6,3.6,'35345'),(7,7,3.0,'3244'),(8,8,4.3,'123123');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuidadores`
--

DROP TABLE IF EXISTS `cuidadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidadores` (
  `codCuidador` int NOT NULL DEFAULT '0',
  `codUsuario` int DEFAULT NULL,
  `descripcionCasa` varchar(500) DEFAULT NULL,
  `descripcionCuid` varchar(500) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `pais` varchar(10) DEFAULT NULL,
  `codPostal` char(5) DEFAULT NULL,
  `fechaNacim` date DEFAULT NULL,
  `valoracion` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`codCuidador`),
  KEY `fk_cuidadores_usuarios` (`codUsuario`),
  CONSTRAINT `fk_cuidadores_usuarios` FOREIGN KEY (`codUsuario`) REFERENCES `usuarios` (`codUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidadores`
--

LOCK TABLES `cuidadores` WRITE;
/*!40000 ALTER TABLE `cuidadores` DISABLE KEYS */;
INSERT INTO `cuidadores` VALUES (1,2,'limpio','serio','Hacienda de Casares','123456789','España','29690','2005-05-27',4.7),(2,1,'acojedora','maduro','Hacienda de Casares','123456789','España','29690','2005-05-27',3.0),(3,3,'limpio','serio','Hacienda de Casares','123123','España','29690','2002-05-27',4.4),(4,4,'pequeña','serio','Hacienda de Casares','245345','España','29690','1972-05-27',3.8),(5,5,'grande','pulcro','Hacienda de Casares','3452234','España','29690','1983-05-27',4.9),(6,6,'limpio','responsable','Hacienda de Casares','678678765','España','29690','1089-05-27',4.6),(7,7,'limpio','serio','Hacienda de Casares','12345678','España','29690','2000-05-27',3.9),(8,8,'limpio','descuidado','Hacienda de Casares','123456789','España','29690','2006-05-27',4.1);
/*!40000 ALTER TABLE `cuidadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diasSemana`
--

DROP TABLE IF EXISTS `diasSemana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diasSemana` (
  `codDiaSemana` int NOT NULL DEFAULT '0',
  `desDia` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codDiaSemana`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diasSemana`
--

LOCK TABLES `diasSemana` WRITE;
/*!40000 ALTER TABLE `diasSemana` DISABLE KEYS */;
INSERT INTO `diasSemana` VALUES (1,'Lunes'),(2,'Martes'),(3,'Miercoles'),(4,'Jueves'),(5,'Viernes'),(6,'Sabado'),(7,'Domingo');
/*!40000 ALTER TABLE `diasSemana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos`
--

DROP TABLE IF EXISTS `fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos` (
  `codFoto` int NOT NULL DEFAULT '0',
  `codUsuario` int DEFAULT NULL,
  `nomFoto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codFoto`),
  KEY `fk_fotos_usuarios` (`codUsuario`),
  CONSTRAINT `fk_fotos_usuarios` FOREIGN KEY (`codUsuario`) REFERENCES `usuarios` (`codUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos`
--

LOCK TABLES `fotos` WRITE;
/*!40000 ALTER TABLE `fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `codMascota` int NOT NULL DEFAULT '0',
  `codCliente` int DEFAULT NULL,
  `tipoMascota` enum('perro','gato') DEFAULT NULL,
  `raza` varchar(20) DEFAULT NULL,
  `fechaNacimMascota` date DEFAULT NULL,
  `sexo` enum('macho','hembra') DEFAULT NULL,
  `tamaño` enum('pequeño','mediano','grande') DEFAULT NULL,
  `esterilizado` tinyint(1) DEFAULT NULL,
  `sociableGatos` tinyint(1) DEFAULT NULL,
  `sociableNiños` tinyint(1) DEFAULT NULL,
  `sociablePerros` tinyint(1) DEFAULT NULL,
  `Observaciones` varchar(300) DEFAULT NULL,
  `microchip` char(15) DEFAULT NULL,
  PRIMARY KEY (`codMascota`),
  KEY `fk_mascotas_clientes` (`codCliente`),
  CONSTRAINT `fk_mascotas_clientes` FOREIGN KEY (`codCliente`) REFERENCES `clientes` (`codCliente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,1,'perro','pitbull','2024-07-22','hembra','mediano',1,1,1,1,'cariñoso','1231231'),(2,2,'gato','siames','2024-01-22','hembra','pequeño',0,1,1,1,'cariñoso','1231231'),(3,3,'perro','agua','2023-09-22','hembra','mediano',0,0,1,1,'cariñoso','845632'),(4,4,'gato','egipcio','2023-11-22','hembra','pequeño',1,1,1,0,'cariñoso','74635'),(5,5,'perro','labrador','2024-03-22','hembra','grande',1,1,1,1,'cariñoso','345362'),(6,6,'gato','siames','2021-01-22','hembra','pequeño',0,1,1,1,'cariñoso','23423'),(7,7,'perro','agua','2024-06-22','hembra','mediano',1,1,0,1,'cariñoso','1231123'),(8,8,'perro','agua','2023-01-22','hembra','mediano',1,1,1,1,'cariñoso','3245223');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `codCliente` int NOT NULL,
  `codCuidador` int NOT NULL,
  `codTipoCuidado` int NOT NULL,
  `codDiaSemana` int NOT NULL,
  `fechaIni` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `codMascota` int DEFAULT NULL,
  PRIMARY KEY (`codCliente`,`codCuidador`,`codTipoCuidado`,`codDiaSemana`),
  KEY `fk_reservas_cuidadores` (`codCuidador`),
  KEY `fk_reservas_tiposCuidados` (`codTipoCuidado`),
  KEY `fk_reservas_codDiaSemana` (`codDiaSemana`),
  KEY `fk_reservas_mascotas` (`codMascota`),
  CONSTRAINT `fk_reservas_clientes` FOREIGN KEY (`codCliente`) REFERENCES `clientes` (`codCliente`),
  CONSTRAINT `fk_reservas_codDiaSemana` FOREIGN KEY (`codDiaSemana`) REFERENCES `diasSemana` (`codDiaSemana`),
  CONSTRAINT `fk_reservas_cuidadores` FOREIGN KEY (`codCuidador`) REFERENCES `cuidadores` (`codCuidador`),
  CONSTRAINT `fk_reservas_mascotas` FOREIGN KEY (`codMascota`) REFERENCES `mascotas` (`codMascota`),
  CONSTRAINT `fk_reservas_tiposCuidados` FOREIGN KEY (`codTipoCuidado`) REFERENCES `tiposCuidados` (`codTipoCuidado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,1,2,'2025-02-08','2025-02-11',1),(1,2,2,3,'2024-02-08','2024-02-11',2),(2,1,2,1,'2025-01-08','2025-01-11',1),(2,4,1,4,'2022-07-14','2022-07-20',4),(3,7,2,6,'2023-11-10','2023-11-29',7),(3,8,1,5,'2024-04-08','2025-04-16',8),(4,2,1,7,'2025-01-14','2025-01-30',2),(5,6,2,3,'2024-08-28','2024-09-03',6),(6,3,1,2,'2023-12-28','2024-01-08',3),(7,5,2,5,'2024-10-17','2024-10-30',5),(8,3,1,6,'2024-05-12','2024-05-28',3);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposCuidados`
--

DROP TABLE IF EXISTS `tiposCuidados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposCuidados` (
  `codTipoCuidado` int NOT NULL DEFAULT '0',
  `descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`codTipoCuidado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposCuidados`
--

LOCK TABLES `tiposCuidados` WRITE;
/*!40000 ALTER TABLE `tiposCuidados` DISABLE KEYS */;
INSERT INTO `tiposCuidados` VALUES (1,'Guarderia'),(2,'Paseo');
/*!40000 ALTER TABLE `tiposCuidados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `codUsuario` int NOT NULL DEFAULT '0',
  `nombre` varchar(15) DEFAULT NULL,
  `apellido1` varchar(20) DEFAULT NULL,
  `apellido2` varchar(20) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `verificado` enum('si','no') DEFAULT 'no',
  PRIMARY KEY (`codUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Alejandro','Luque','Maillo','alejandroluque@gmail.com','si'),(2,'Manuel','Lopez','Sanchez','manuel@gmail.com','si'),(3,'Pedro','Sanchez','Lopez','manuel@gmail.com','si'),(4,'Manolo','Maillo','Centeno','manuel@gmail.com','si'),(5,'Paco','Garcia','Luque','manuel@gmail.com','si'),(6,'Laura','Olmos','Isorna','manuel@gmail.com','si'),(7,'Marta','Gil','Garcia','manuel@gmail.com','si'),(8,'Noelia','Centeno','Gara','manuel@gmail.com','si');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'BDdogcare'
--
/*!50003 DROP PROCEDURE IF EXISTS `agendaCuidador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `agendaCuidador`(in fechInicio date, in fechFin date)
begin
	select reservas.fechaIni, reservas.fechaFin, reservas.codTipoCuidado, 
		   reservas.codCliente, reservas.codMascota
    from reservas
    where (reservas.fechaIni between fechInicio and fechFin) and
		  (reservas.fechaFin between fechInicio and fechFin);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrarCuidador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarCuidador`(in pkCuidador int)
begin
	delete from cuidadores
    where pkCuidador = cuidadores.codCuidador;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrarReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarReserva`(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int)
begin
	delete from reservas
    where reservas.CodCliente = pkCliente and reservas.codCuidador = pkCuidador and reservas.codTipoCuidado = pkTipoCuidado and reservas.codDiaSemana = pkDiaSemana;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrarTiposCuidados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarTiposCuidados`(in codTipoCuidado int)
begin
	delete from tiposCuidados
    where tiposCuidados = tiposCuidado.codTiposCuidados;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `borrarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarUsuario`(in codUsuario int)
begin
	delete from usuario
    where codUsuario = usuarios.codUsuario;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarCuidador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCuidador`(in pkUsuario int, in descripcionCasa varchar(200), in descripcionCuid varchar(200), in direccion varchar(40), in telefono char(9), in pais varchar(10), in codpostal char(5), in fechaNacim date, in valoracion decimal(2,1))
begin
	declare varpk int;
    declare exit handler for sqlexception
		rollback;
	start transaction;
    set varpk = (select ifnull(max(cuidadores.codCuidador), 0)+1 from tiposCuidados);
		insert into cuidadores
			(codCuidador, codUsuario, descripcionCasa, descripcionCuid, direccion, telefono, pais, codPostal, fechaNacim, valoracion)
		values
			(varpk, pkUsuario, descripcionCasa, descripcionCuid, direccion, telefono, pais, codPostal, fechaNacim, valoracion);
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarReserva`(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int, in fechIni date, in fechFin date)
begin
	declare exit handler for sqlexception
		rollback;
	start transaction;
		insert into reservas
			(codCliente, codCuidador, codTipoCuidado, codDiaSemana, fechaIni, fechaFin)
		values
			(pkCliente,pkCuidador, pkTipoCuidado, pkDiaSemana, fechIni, fechFin);
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarTiposCuidados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTiposCuidados`(in descripcion varchar(30))
begin
	declare varpk int;
   declare exit handler for sqlexception
	rollback;
	start transaction;
		set varpk = (select ifnull(max(codTipoCuidado), 0)+1 from tiposCuidados);
		insert into tiposCuidados
			(codTipoCuidado, descripcion)
		values
			(varpk, descripcion);
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(in nombre varchar(15), in apellido1 varchar(15), in apellido2 varchar(15), in correo varchar(50), in verificado enum('si', 'no'))
begin
	declare varPk int;
    declare exit handler for sqlexception
		rollback;
	start transaction;
	set varPK = (select ifnull(max(codUsuario),0)+1 from usuarios);
		insert into usuarios
			(codUsuario, nombre, apellido1, apellido2, correo, verificado)
		values
			(varPK, nombre, apellido1, apellido2, correo, verificado);
		commit;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerCuidador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerCuidador`(in pkCuidador int)
begin
	select codCuidador, codUsuario, descripcionCasa, descripcionCuid, direccion, telefono, pais, codPostal, fechaNacim, valoracion
    from cuidadores
    where pkCuidador = cuidadores.codCuidador;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerReserva`(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int)
begin
	select codCliente, codCuidador, codTipoCuidado, codDiaSemana, fechaIni, fechaFin
    from reservas
    where reservas.codCliente = pkCliente and reservas.codCuidador = pkCuidador and reservas.codTipoCuidado = pkTipoCuidado and reservas.codDiaSemana = pkDiaSemana;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerTiposCuidados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerTiposCuidados`(in codTipoCuidado int)
begin
	select codTipoCuidado, descripcion
    from tiposCuidados
    where codTipoCuidado = tiposCuidados.codTipoCuidado;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerTodasReservas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerTodasReservas`()
begin
	select reservas.*
    from reservas;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerTodosCuidadores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerTodosCuidadores`()
begin
	select cuidadores.*
    from cuidadores;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerTodosTiposCuidados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerTodosTiposCuidados`()
begin
	select tiposCuidados.*
    from tiposCuidados;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerTodosUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerTodosUsuarios`()
begin
	select usuarios.*
    from usuarios;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `leerUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `leerUsuario`(in pkUsuario int)
begin
	select nombre, apellido1, apellido2, correo, verificado
    from usuarios
    where codUsuario = pkUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modCuidador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modCuidador`(in pkCuidador int, in pkUsuario int, in descripcionCasa varchar(200), in descripcionCuid varchar(200), in direccion varchar(40), in telefono char(9), in pais varchar(10), in codpostal char(5), in fechaNacim date, in valoracion decimal(2,1))
begin
	update cuidadores
    set cuidadores.codUsuario = pkUsuario, cuidadores.descripcionCasa = descripcionCasa, cuidadores.descripcionCuid=descripcionCuid, cuidadores.dirreccion =direccion, cuidadores.telefono = telefono, cuidadores.pais = pais, cuidadores.codPostal= codPostal, cuidadores.fechaNacim=fechaNacim, cuidadores.valoracion=valoracion
	where cuidadores.codCuidador = pkCuidador;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modReserva` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modReserva`(in pkCliente int, in pkCuidador int, in pkTipoCuidado int, in pkDiaSemana int, in fechIni date, in fechFin date)
begin
	update reservas
    set reservas.fechaIni = fechIni, reservas.fechaFin = fechFin
    where reservas.CodCliente = pkCliente and reservas.codCuidador = pkCuidador and reservas.codTipoCuidado = pkTipoCuidado and reservas.codDiaSemana = pkDiaSemana;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modTiposCuidados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modTiposCuidados`(in codTiposCuidados int, in descripcion varchar(30))
begin
	update tiposCuidados
    set tiposCuidados.descripcion = descripcion
    where tiposCuidados.codTipoCuidado = codTiposCuidados;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modUsuario`(in codUsusario int, in nombre varchar(15), in apellido1 varchar(15), in apellido2 varchar(15), in correo varchar(20), in verificado enum('si', 'no'))
begin
		update usuarios
        set usuarios.nombre = nombre, usuarios.apellido1 = apellido1, usuarios.apellido2 = apellido2, usuarios.correo = correo, usuarios.verificacion = verificacion
        where usuarios.codUsuario = codUsuario;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18  9:34:18
