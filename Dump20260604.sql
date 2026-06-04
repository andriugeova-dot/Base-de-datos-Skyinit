-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: skyinit
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `agendas`
--

DROP TABLE IF EXISTS `agendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendas` (
  `AgendaID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PropiedadID` int NOT NULL,
  `FechaVisita` datetime NOT NULL,
  `EstadoAgendaID` int NOT NULL,
  PRIMARY KEY (`AgendaID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `PropiedadID` (`PropiedadID`),
  KEY `EstadoAgendaID` (`EstadoAgendaID`),
  CONSTRAINT `agendas_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `agendas_ibfk_2` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE CASCADE,
  CONSTRAINT `agendas_ibfk_3` FOREIGN KEY (`EstadoAgendaID`) REFERENCES `estadosagenda` (`EstadoAgendaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendas`
--

LOCK TABLES `agendas` WRITE;
/*!40000 ALTER TABLE `agendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificaciones` (
  `CalificacionID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PropiedadID` int NOT NULL,
  `Puntaje` tinyint NOT NULL COMMENT 'Valor entre 1 y 5',
  `FechaCalificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CalificacionID`),
  UNIQUE KEY `uq_calificacion` (`UsuarioID`,`PropiedadID`),
  KEY `PropiedadID` (`PropiedadID`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE CASCADE,
  CONSTRAINT `chk_puntaje` CHECK ((`Puntaje` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `ComentarioID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PropiedadID` int NOT NULL,
  `Contenido` text NOT NULL,
  `FechaComentario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ComentarioID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `PropiedadID` (`PropiedadID`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constructoras`
--

DROP TABLE IF EXISTS `constructoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructoras` (
  `ConstructoraID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ConstructoraID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructoras`
--

LOCK TABLES `constructoras` WRITE;
/*!40000 ALTER TABLE `constructoras` DISABLE KEYS */;
INSERT INTO `constructoras` VALUES (1,'Casa Feliz','Instagram','310703090','constructoraskyinit@gmail.com');
/*!40000 ALTER TABLE `constructoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `ConsultaID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PropiedadID` int DEFAULT NULL,
  `AgenteID` int DEFAULT NULL,
  `Asunto` varchar(200) NOT NULL,
  `Estado` varchar(30) NOT NULL DEFAULT 'Abierta',
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ConsultaID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `PropiedadID` (`PropiedadID`),
  KEY `AgenteID` (`AgenteID`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE SET NULL,
  CONSTRAINT `consultas_ibfk_3` FOREIGN KEY (`AgenteID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE SET NULL,
  CONSTRAINT `chk_estado_consulta` CHECK ((`Estado` in (_utf8mb4'Abierta',_utf8mb4'En atención',_utf8mb4'Cerrada')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallereporte`
--

DROP TABLE IF EXISTS `detallereporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallereporte` (
  `DetalleID` int NOT NULL AUTO_INCREMENT,
  `ReporteID` int NOT NULL,
  `Descripcion` text NOT NULL,
  PRIMARY KEY (`DetalleID`),
  KEY `ReporteID` (`ReporteID`),
  CONSTRAINT `detallereporte_ibfk_1` FOREIGN KEY (`ReporteID`) REFERENCES `reportes` (`ReporteID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallereporte`
--

LOCK TABLES `detallereporte` WRITE;
/*!40000 ALTER TABLE `detallereporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallereporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas`
--

DROP TABLE IF EXISTS `estadisticas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas` (
  `EstadisticaID` int NOT NULL AUTO_INCREMENT,
  `PropiedadID` int DEFAULT NULL,
  `ProyectoID` int DEFAULT NULL,
  `Visitas` int DEFAULT '0',
  `Favoritos` int DEFAULT '0',
  `Comentarios` int DEFAULT '0',
  PRIMARY KEY (`EstadisticaID`),
  KEY `PropiedadID` (`PropiedadID`),
  KEY `ProyectoID` (`ProyectoID`),
  CONSTRAINT `estadisticas_ibfk_1` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE CASCADE,
  CONSTRAINT `estadisticas_ibfk_2` FOREIGN KEY (`ProyectoID`) REFERENCES `proyectos` (`ProyectoID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas`
--

LOCK TABLES `estadisticas` WRITE;
/*!40000 ALTER TABLE `estadisticas` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadisticas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosagenda`
--

DROP TABLE IF EXISTS `estadosagenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosagenda` (
  `EstadoAgendaID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`EstadoAgendaID`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosagenda`
--

LOCK TABLES `estadosagenda` WRITE;
/*!40000 ALTER TABLE `estadosagenda` DISABLE KEYS */;
INSERT INTO `estadosagenda` VALUES (3,'Cancelada'),(2,'Confirmada'),(1,'Pendiente');
/*!40000 ALTER TABLE `estadosagenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosproyecto`
--

DROP TABLE IF EXISTS `estadosproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosproyecto` (
  `EstadoProyectoID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`EstadoProyectoID`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosproyecto`
--

LOCK TABLES `estadosproyecto` WRITE;
/*!40000 ALTER TABLE `estadosproyecto` DISABLE KEYS */;
INSERT INTO `estadosproyecto` VALUES (2,'En construcción'),(3,'Finalizado'),(1,'Planificado');
/*!40000 ALTER TABLE `estadosproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadosreparacion`
--

DROP TABLE IF EXISTS `estadosreparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosreparacion` (
  `EstadoReparacionID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`EstadoReparacionID`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosreparacion`
--

LOCK TABLES `estadosreparacion` WRITE;
/*!40000 ALTER TABLE `estadosreparacion` DISABLE KEYS */;
INSERT INTO `estadosreparacion` VALUES (2,'En proceso'),(3,'Finalizada'),(1,'Pendiente');
/*!40000 ALTER TABLE `estadosreparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `FavoritoID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PropiedadID` int NOT NULL,
  `FechaAgregado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`FavoritoID`),
  UNIQUE KEY `uq_favorito` (`UsuarioID`,`PropiedadID`),
  KEY `PropiedadID` (`PropiedadID`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialpropiedades`
--

DROP TABLE IF EXISTS `historialpropiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialpropiedades` (
  `HistorialID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PropiedadID` int NOT NULL,
  `FechaAcceso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HistorialID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `PropiedadID` (`PropiedadID`),
  CONSTRAINT `historialpropiedades_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `historialpropiedades_ibfk_2` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialpropiedades`
--

LOCK TABLES `historialpropiedades` WRITE;
/*!40000 ALTER TABLE `historialpropiedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialpropiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialproyectos`
--

DROP TABLE IF EXISTS `historialproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialproyectos` (
  `HistorialID` int NOT NULL AUTO_INCREMENT,
  `ProyectoID` int NOT NULL,
  `UsuarioID` int NOT NULL,
  `Cambio` varchar(255) DEFAULT NULL,
  `FechaCambio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`HistorialID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `ProyectoID` (`ProyectoID`),
  CONSTRAINT `historialproyectos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `historialproyectos_ibfk_2` FOREIGN KEY (`ProyectoID`) REFERENCES `proyectos` (`ProyectoID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialproyectos`
--

LOCK TABLES `historialproyectos` WRITE;
/*!40000 ALTER TABLE `historialproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenesconstructora`
--

DROP TABLE IF EXISTS `imagenesconstructora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenesconstructora` (
  `ImagenID` int NOT NULL AUTO_INCREMENT,
  `ConstructoraID` int NOT NULL,
  `URL` varchar(255) NOT NULL,
  `EsLogo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ImagenID`),
  KEY `ConstructoraID` (`ConstructoraID`),
  CONSTRAINT `imagenesconstructora_ibfk_1` FOREIGN KEY (`ConstructoraID`) REFERENCES `constructoras` (`ConstructoraID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesconstructora`
--

LOCK TABLES `imagenesconstructora` WRITE;
/*!40000 ALTER TABLE `imagenesconstructora` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenesconstructora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenespropiedad`
--

DROP TABLE IF EXISTS `imagenespropiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenespropiedad` (
  `ImagenID` int NOT NULL AUTO_INCREMENT,
  `PropiedadID` int NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`ImagenID`),
  KEY `PropiedadID` (`PropiedadID`),
  CONSTRAINT `imagenespropiedad_ibfk_1` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenespropiedad`
--

LOCK TABLES `imagenespropiedad` WRITE;
/*!40000 ALTER TABLE `imagenespropiedad` DISABLE KEYS */;
INSERT INTO `imagenespropiedad` VALUES (2,2,'/img/propiedades/7b30d53d-9fe8-4d54-b528-6361cd14a42f.png'),(5,5,'/img/propiedades/4db15225-89de-49b0-93e5-4a46977a6d1a.webp');
/*!40000 ALTER TABLE `imagenespropiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenesproyecto`
--

DROP TABLE IF EXISTS `imagenesproyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenesproyecto` (
  `ImagenID` int NOT NULL AUTO_INCREMENT,
  `ProyectoID` int NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`ImagenID`),
  KEY `ProyectoID` (`ProyectoID`),
  CONSTRAINT `imagenesproyecto_ibfk_1` FOREIGN KEY (`ProyectoID`) REFERENCES `proyectos` (`ProyectoID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesproyecto`
--

LOCK TABLES `imagenesproyecto` WRITE;
/*!40000 ALTER TABLE `imagenesproyecto` DISABLE KEYS */;
INSERT INTO `imagenesproyecto` VALUES (1,2,'/img/proyectos/24ca116b-c750-441a-bd76-dcba09b65772.jpg');
/*!40000 ALTER TABLE `imagenesproyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajesconsulta`
--

DROP TABLE IF EXISTS `mensajesconsulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajesconsulta` (
  `MensajeID` int NOT NULL AUTO_INCREMENT,
  `ConsultaID` int NOT NULL,
  `RemitenteID` int NOT NULL,
  `Contenido` text NOT NULL,
  `FechaEnvio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Leido` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MensajeID`),
  KEY `ConsultaID` (`ConsultaID`),
  KEY `RemitenteID` (`RemitenteID`),
  CONSTRAINT `mensajesconsulta_ibfk_1` FOREIGN KEY (`ConsultaID`) REFERENCES `consultas` (`ConsultaID`) ON DELETE CASCADE,
  CONSTRAINT `mensajesconsulta_ibfk_2` FOREIGN KEY (`RemitenteID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajesconsulta`
--

LOCK TABLES `mensajesconsulta` WRITE;
/*!40000 ALTER TABLE `mensajesconsulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensajesconsulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passwordresettokens`
--

DROP TABLE IF EXISTS `passwordresettokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passwordresettokens` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NOT NULL,
  `Token` varchar(255) NOT NULL,
  `ExpirationDate` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_PasswordResetTokens_Usuarios` (`UserId`),
  CONSTRAINT `FK_PasswordResetTokens_Usuarios` FOREIGN KEY (`UserId`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwordresettokens`
--

LOCK TABLES `passwordresettokens` WRITE;
/*!40000 ALTER TABLE `passwordresettokens` DISABLE KEYS */;
INSERT INTO `passwordresettokens` VALUES (1,4,'cbef67d1-cd9f-4edc-ad42-299033664d2a','2026-05-08 22:34:11'),(2,4,'612b1742-2cd0-4842-8788-d9a8a81582fb','2026-05-09 00:56:01'),(3,4,'77819bbf-007c-4997-b2fa-3e4c5d07a88b','2026-05-11 17:51:54'),(4,4,'534c148c-1e61-4198-b8ed-13768d43ff04','2026-05-11 17:56:57'),(5,4,'2344d49f-cdce-4d9b-9398-b8a097d7f933','2026-05-11 17:58:32'),(8,4,'0fa1e87a-6389-412e-a6d4-d6fa609a3a68','2026-05-11 18:11:54'),(10,4,'ad673ac0-2d81-42d4-bf73-5d9228b6a84b','2026-05-11 18:48:53'),(11,4,'ba845982-157b-4bbe-a7a8-0faeb7214f28','2026-05-11 19:28:41'),(12,4,'825d2392-3a94-488d-9de1-c8eed645b0bc','2026-06-02 19:22:21'),(13,4,'2e5f2f2b-dda8-48f0-9cc0-fd559b1d55e6','2026-06-02 19:49:10'),(14,4,'88021648-43c2-493d-b953-65f7123406a1','2026-06-02 19:52:21'),(15,4,'04c2b650-dcfc-4c24-864e-dee0f0b58998','2026-06-02 20:03:33'),(16,9,'c7fffa3d-e175-4d9c-a76a-8296c6e1ab02','2026-06-02 20:05:34'),(17,9,'d40bb9e1-64fe-472f-a15d-8a607794a5ce','2026-06-02 20:13:05'),(18,9,'3b274277-d63d-46b1-9771-2d42c50ea32e','2026-06-02 21:09:58'),(19,9,'c0787e80-fb60-479e-bbe8-53b0bc7e713d','2026-06-02 21:10:21'),(20,9,'6314e671-b23a-48b6-9803-adc6f09ce742','2026-06-02 21:11:57'),(21,9,'e8f734d0-06cd-4eb1-a061-82ed46123e13','2026-06-02 21:13:17'),(22,9,'22f32c55-db65-4a22-a74a-b02e4aa4cb31','2026-06-02 21:16:06');
/*!40000 ALTER TABLE `passwordresettokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plataformas`
--

DROP TABLE IF EXISTS `plataformas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plataformas` (
  `PlataformaID` int NOT NULL AUTO_INCREMENT,
  `NombrePlataforma` varchar(50) NOT NULL,
  PRIMARY KEY (`PlataformaID`),
  UNIQUE KEY `NombrePlataforma` (`NombrePlataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plataformas`
--

LOCK TABLES `plataformas` WRITE;
/*!40000 ALTER TABLE `plataformas` DISABLE KEYS */;
INSERT INTO `plataformas` VALUES (1,'Facebook'),(2,'Instagram'),(3,'LinkedIn'),(5,'TikTok'),(4,'Twitter/X'),(6,'WhatsApp');
/*!40000 ALTER TABLE `plataformas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `PropiedadID` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(150) NOT NULL,
  `Descripcion` text,
  `Precio` decimal(12,2) NOT NULL,
  `TipoOperacionID` int NOT NULL,
  `Habitaciones` int DEFAULT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Ciudad` varchar(100) DEFAULT NULL,
  `ConstructoraID` int DEFAULT NULL,
  `AgenteID` int DEFAULT NULL,
  PRIMARY KEY (`PropiedadID`),
  KEY `TipoOperacionID` (`TipoOperacionID`),
  KEY `ConstructoraID` (`ConstructoraID`),
  KEY `AgenteID` (`AgenteID`),
  CONSTRAINT `propiedades_ibfk_1` FOREIGN KEY (`TipoOperacionID`) REFERENCES `tiposoperacion` (`TipoOperacionID`),
  CONSTRAINT `propiedades_ibfk_2` FOREIGN KEY (`ConstructoraID`) REFERENCES `constructoras` (`ConstructoraID`) ON DELETE SET NULL,
  CONSTRAINT `propiedades_ibfk_3` FOREIGN KEY (`AgenteID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (2,'Apartamento Miro','Casa con hermosas vistas y moderna',2000000.00,2,1,'Calle 14a #5-111','Sogamoso',1,7),(5,'Casa en el bosque','Casa con hermosas vistas hacia el bosque',2000000.00,2,2,'Calle #18 4-121','Duitama',1,7);
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `ProyectoID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `EstadoProyectoID` int NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `ConstructoraID` int DEFAULT NULL,
  `Descripcion` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ProyectoID`),
  KEY `EstadoProyectoID` (`EstadoProyectoID`),
  KEY `ConstructoraID` (`ConstructoraID`),
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`EstadoProyectoID`) REFERENCES `estadosproyecto` (`EstadoProyectoID`),
  CONSTRAINT `proyectos_ibfk_2` FOREIGN KEY (`ConstructoraID`) REFERENCES `constructoras` (`ConstructoraID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (2,'Apartamentos Alcalá',1,'2026-05-21','2026-05-29',1,NULL),(3,'Apartamentos Cho',2,'2026-05-08','2026-05-28',1,NULL);
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redessociales`
--

DROP TABLE IF EXISTS `redessociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redessociales` (
  `RedID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PlataformaID` int NOT NULL,
  `URL` varchar(255) NOT NULL,
  PRIMARY KEY (`RedID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `PlataformaID` (`PlataformaID`),
  CONSTRAINT `redessociales_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `redessociales_ibfk_2` FOREIGN KEY (`PlataformaID`) REFERENCES `plataformas` (`PlataformaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redessociales`
--

LOCK TABLES `redessociales` WRITE;
/*!40000 ALTER TABLE `redessociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `redessociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparaciones`
--

DROP TABLE IF EXISTS `reparaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparaciones` (
  `ReparacionID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `PropiedadID` int DEFAULT NULL,
  `Descripcion` text NOT NULL,
  `EstadoReparacionID` int NOT NULL,
  `FechaSolicitud` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReparacionID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `PropiedadID` (`PropiedadID`),
  KEY `EstadoReparacionID` (`EstadoReparacionID`),
  CONSTRAINT `reparaciones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  CONSTRAINT `reparaciones_ibfk_2` FOREIGN KEY (`PropiedadID`) REFERENCES `propiedades` (`PropiedadID`) ON DELETE SET NULL,
  CONSTRAINT `reparaciones_ibfk_3` FOREIGN KEY (`EstadoReparacionID`) REFERENCES `estadosreparacion` (`EstadoReparacionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparaciones`
--

LOCK TABLES `reparaciones` WRITE;
/*!40000 ALTER TABLE `reparaciones` DISABLE KEYS */;
INSERT INTO `reparaciones` VALUES (1,5,2,'Tapizado',1,'2026-05-25 16:17:10');
/*!40000 ALTER TABLE `reparaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportes` (
  `ReporteID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `FechaReporte` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReporteID`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportes`
--

LOCK TABLES `reportes` WRITE;
/*!40000 ALTER TABLE `reportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `RolID` int NOT NULL AUTO_INCREMENT,
  `NombreRol` varchar(50) NOT NULL,
  PRIMARY KEY (`RolID`),
  UNIQUE KEY `NombreRol` (`NombreRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Agente'),(3,'Usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesiones`
--

DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `SesionID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `FechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaFin` datetime DEFAULT NULL,
  `Token` varchar(255) NOT NULL,
  PRIMARY KEY (`SesionID`),
  UNIQUE KEY `Token` (`Token`),
  KEY `UsuarioID` (`UsuarioID`),
  CONSTRAINT `sesiones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesiones`
--

LOCK TABLES `sesiones` WRITE;
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposoperacion`
--

DROP TABLE IF EXISTS `tiposoperacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposoperacion` (
  `TipoOperacionID` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`TipoOperacionID`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposoperacion`
--

LOCK TABLES `tiposoperacion` WRITE;
/*!40000 ALTER TABLE `tiposoperacion` DISABLE KEYS */;
INSERT INTO `tiposoperacion` VALUES (2,'Arriendo'),(3,'Empeño'),(1,'Venta');
/*!40000 ALTER TABLE `tiposoperacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `UsuarioID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `ContraseñaHash` varchar(255) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `FechaRegistro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EstadoCuenta` varchar(20) NOT NULL DEFAULT 'Activa',
  `RolID` int NOT NULL,
  `FotoPerfil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UsuarioID`),
  UNIQUE KEY `Correo` (`Correo`),
  KEY `RolID` (`RolID`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (4,'Andres','andriu.geova@gmail.com','$2a$11$J7At8xptT9nDU7dyTofimuzPOkaI0m2fiTFrI8JFok7vl3MnVShI2','3113053046','2026-05-07 16:07:18','Activa',1,NULL),(5,'User','user@gmail.com','$2a$11$VgivnK.obdarsx1kc.wYIuCbsFJt5dhy61uYONJwYO831PvC6f3FS','3105103230','2026-05-21 19:48:02','Activa',3,NULL),(6,'SkyInit','skyinit2026@gmail.com','$2a$11$P.nC5eEMlu.3vylXIO7aDuPgLoQlTkTh1Pz.BiTFezsyjezuf609.','3124162370','2026-05-22 12:11:14','Activa',1,NULL),(7,'Agente','agente@gmail.com','$2a$11$GgRRr8esSvjaWNdKhTwup.80cc7p9qlmOtSKdfKAxTljdqoFJqsU.','3122100912','2026-05-25 16:35:30','Activa',2,NULL),(8,'felipe','aaa.@gmail.com','$2a$11$aucDsTyKq/V3A1RKjyDhWO8VI4FXE5JhdOJFw.HYJAquCYug9Zsu6','3124143860','2026-06-02 13:48:48','Activa',2,NULL),(9,'Andres Salamanca','andresmendoza6753@gmail.com','$2a$11$C099oZi/vIxOf..tDzznwucFr5bDR0ZpUMxPh1OmLdCt9RNmlJ4dO','320144568','2026-06-02 14:01:41','Activa',3,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'skyinit'
--

--
-- Dumping routines for database 'skyinit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-04 12:52:24
