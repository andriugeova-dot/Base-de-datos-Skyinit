CREATE DATABASE  IF NOT EXISTS `skyinit` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `skyinit`;
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
  `Estado` varchar(255) DEFAULT 'Activo',
  `Logo` varchar(255) DEFAULT NULL,
  `Descripcion` varchar(300) NOT NULL,
  `Ciudad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ConstructoraID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructoras`
--

LOCK TABLES `constructoras` WRITE;
/*!40000 ALTER TABLE `constructoras` DISABLE KEYS */;
INSERT INTO `constructoras` VALUES (7,'Constructora Jumper Cramp','Facebook','3124143860','constructorajumper@gmail.com','Activo',NULL,'Creamos futuro','Duitama'),(8,'Constructora BioCasa','Instagram','3124143860','constructorabiocasa@gmail.com','Activo',NULL,'Contribuimos en el crecimiento sin dañar al planeta','Duitama'),(9,'Constructora TecColme','Instagram','3124143860','constructorateccolme@gmail.com','Activo',NULL,'Modernidad y Avance','Duitama'),(10,'Constructora Renova','Facebook','3124143860','constructorarenova@gmail.com','Activo',NULL,'Renovando tu vivienda','Duitama');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (11,5,7,'2026-06-26 15:46:33'),(12,5,8,'2026-06-26 15:46:34'),(13,5,10,'2026-06-26 15:46:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesconstructora`
--

LOCK TABLES `imagenesconstructora` WRITE;
/*!40000 ALTER TABLE `imagenesconstructora` DISABLE KEYS */;
INSERT INTO `imagenesconstructora` VALUES (7,7,'1. Constructora Jumper Cramp.jpg',1),(8,8,'2. Constructora BioCasa.jpg',1),(9,9,'3. Constructora TecColme.jpg',1),(10,10,'4. Constructora Renova.jpg',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenespropiedad`
--

LOCK TABLES `imagenespropiedad` WRITE;
/*!40000 ALTER TABLE `imagenespropiedad` DISABLE KEYS */;
INSERT INTO `imagenespropiedad` VALUES (7,7,'/img/propiedades/93f56355-3a15-4cae-bb08-4180efd54097.jpeg'),(8,8,'/img/propiedades/aea6e10a-a4c9-4d5b-ac57-f0c8fc136573.jpg'),(9,9,'/img/propiedades/7c166b31-8b35-4714-95de-3fa0e78a71d0.jpg'),(10,10,'/img/propiedades/1abbdb28-d119-486a-b797-7e8b7423ea55.jpg'),(11,11,'/img/propiedades/31d646de-4a7a-4fe2-b038-1a3bef678a55.jpg'),(12,12,'/img/propiedades/cd6f7f81-ba2d-44a1-85f0-06fec9ac8288.jpg'),(13,13,'/img/propiedades/9b63701c-e56b-4f39-9738-43fde99a9a90.jpg'),(14,14,'/img/propiedades/93eccff5-591e-45e5-b76b-a052e7ada373.jpg'),(15,15,'/img/propiedades/2053932d-5500-4f6c-a30a-8b260fa4f114.jpg'),(16,16,'/img/propiedades/31a634f5-6a8c-4e3c-997f-55ecc22756a5.jpg');
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
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ImagenID`),
  KEY `ProyectoID` (`ProyectoID`),
  CONSTRAINT `imagenesproyecto_ibfk_1` FOREIGN KEY (`ProyectoID`) REFERENCES `proyectos` (`ProyectoID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenesproyecto`
--

LOCK TABLES `imagenesproyecto` WRITE;
/*!40000 ALTER TABLE `imagenesproyecto` DISABLE KEYS */;
INSERT INTO `imagenesproyecto` VALUES (4,5,'/img/proyectos/fb41c0d6-38ef-423b-806d-97a156790481.jpg'),(5,6,'/img/proyectos/145380ff-504d-4ce5-8418-9ba013a6a1da.jpg'),(6,7,'/img/proyectos/beeab6e8-cfe7-4b12-8905-c505d0849977.jpg'),(7,8,'/img/proyectos/45bdd618-9322-46df-90a5-d1bb77991b3d.jpg'),(8,9,'/img/proyectos/e56d3d67-bfc1-409e-ac96-66df7786d987.jpg'),(9,10,'/img/proyectos/e5890d48-10cb-4673-af76-d29b690369a2.jpg'),(10,11,'/img/proyectos/2ee587e3-6b61-46fd-b030-3d259ee57977.jpg'),(11,12,'/img/proyectos/4dc5ca97-157f-4641-815a-0cf6d30e2ea7.jpg'),(12,13,'/img/proyectos/9eeedc01-f8c3-4d58-9c07-e5ad8e44a3ce.jpg'),(13,14,'/img/proyectos/1aeeb207-f51c-4ce8-9623-5d5af748d231.jpg');
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
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `NotificacionID` int NOT NULL AUTO_INCREMENT,
  `UsuarioID` int NOT NULL,
  `Titulo` varchar(150) NOT NULL,
  `Mensaje` text NOT NULL,
  `Leida` tinyint(1) NOT NULL DEFAULT '0',
  `FechaCreacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TipoNotificacion` varchar(50) NOT NULL,
  `EntidadID` int DEFAULT NULL,
  `EntidadTipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NotificacionID`),
  KEY `UsuarioID` (`UsuarioID`),
  KEY `idx_leida` (`UsuarioID`,`Leida`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (7,'Apartamento Miro','Conjunto de apartamentos modernos con diseño funcional, excelente iluminación natural y cercanía a zonas comerciales y de transporte.',200000000.00,2,3,'Calle 14a #5-111','Duitama',9,7),(8,'Apartamentos Alcala','Residencial pensado para familias, con espacios amplios, áreas comunes seguras y acceso rápido a colegios y supermercados.',250000000.00,2,3,'Calle #18 4-121','Duitama',7,7),(9,'Casa Moderna','Propiedad contemporánea con arquitectura minimalista, ventanales de piso a techo y distribución inteligente para aprovechar cada espacio.',350000000.00,2,4,'Calle #18 4-122','Duitama',8,7),(10,'Casa en la colina','Residencia exclusiva con vistas panorámicas, rodeada de naturaleza, ideal para quienes buscan privacidad y tranquilidad.',150000000.00,1,5,'Calle #12 4-129','Duitama',10,7),(11,'Casa en Duitama','Hogar acogedor en una ubicación estratégica de Duitama, con fácil acceso a comercio, transporte y servicios esenciales.',400000000.00,3,4,'Calle #11 110-20','Duitama',7,7),(12,'Casa ubicada en el pueblito boyacense','Vivienda con encanto tradicional, rodeada de arquitectura típica y ambiente cultural único de Boyacá.\r\n\r\n',230000000.00,1,3,'Calle #11 111-21','Duitama',8,7),(13,'Apartamento con hermosas vistas','Espacio residencial con balcones y ventanales que ofrecen paisajes espectaculares, perfecto para disfrutar amaneceres y atardeceres.',235000000.00,2,2,'Calle #13 100-21','Duitama',10,7),(14,'Brisas del Rio','Residencial junto a zonas naturales, con aire fresco y ambiente relajante, ideal para familias que valoran la conexión con la naturaleza.',180000000.00,2,4,'Calle 45# 5-111','Duitama',9,7),(15,'Reservas del Roble','Conjunto exclusivo rodeado de árboles y áreas verdes, pensado para quienes buscan privacidad y contacto con el entorno natural.',330000000.00,1,5,'Calle #10 110-28','Duitama',8,7),(16,'Altamira','Residencial de alta categoría con diseño arquitectónico sofisticado, seguridad integral y amenidades premium.',2000000000.00,1,5,'Calle #15 10-12','Duitama',10,7);
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
  `Ubicacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProyectoID`),
  KEY `EstadoProyectoID` (`EstadoProyectoID`),
  KEY `ConstructoraID` (`ConstructoraID`),
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`EstadoProyectoID`) REFERENCES `estadosproyecto` (`EstadoProyectoID`),
  CONSTRAINT `proyectos_ibfk_2` FOREIGN KEY (`ConstructoraID`) REFERENCES `constructoras` (`ConstructoraID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (5,'Apartamento ubicado en Duitama ',1,'2026-06-09','2026-06-29',7,'Conjunto residencial en el corazón de Duitama, con diseño moderno, excelente iluminación y acceso inmediato a servicios urbanos.',NULL),(6,'Altos de la sabana',2,'2026-06-03','2026-07-11',8,'Proyecto exclusivo en zona elevada, con vistas privilegiadas y ambiente tranquilo, ideal para quienes buscan confort y naturaleza.',NULL),(7,'Torres en el bosque',2,'2026-06-02','2026-06-26',8,'Edificios rodeados de áreas verdes, con espacios amplios y diseño pensado para la vida familiar en contacto con el entorno natural.',NULL),(8,'Mirador de los andes',2,'2026-06-18','2026-07-11',10,'Residencial con panorámicas únicas hacia la cordillera, ofreciendo un estilo de vida relajado y lleno de aire puro.',NULL),(9,'Altos de San Lorenzo',2,'2026-05-25','2026-07-17',9,'Urbanización en zona estratégica, con arquitectura contemporánea y cercanía a vías principales y servicios esenciales.',NULL),(10,'Portal del sol',2,'2026-04-01','2026-09-08',10,'Proyecto residencial luminoso, con espacios abiertos y diseño que aprovecha la luz natural para crear ambientes cálidos y acogedores.',NULL),(11,'SkyLine',1,'2026-05-31','2026-07-01',10,'Edificio moderno de gran altura, con diseño urbano sofisticado y vistas panorámicas de la ciudad.',NULL),(12,'Nova',1,'2026-06-03','2026-07-11',7,'Residencial innovador con arquitectura vanguardista, pensado para quienes buscan estilo y funcionalidad en un mismo lugar.',NULL),(13,'Edificio Vortice',1,'2026-04-01','2026-08-11',8,'Proyecto de diseño dinámico y contemporáneo, con espacios versátiles y acabados de alta calidad.',NULL),(14,'Equipo Dinastia',2,'2026-06-03','2026-07-02',9,'Residencial de categoría premium, con seguridad integral, amenidades exclusivas y un diseño arquitectónico elegante.',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparaciones`
--

LOCK TABLES `reparaciones` WRITE;
/*!40000 ALTER TABLE `reparaciones` DISABLE KEYS */;
INSERT INTO `reparaciones` VALUES (3,5,NULL,'Solicitud de servicio: Revision de calentadores — Notas del usuario: Direccion : Calle 18a #10 - 12',1,'2026-06-26 15:45:52'),(4,5,NULL,'Solicitud de servicio: Plomeria — Notas del usuario: Entre 2 a 4 pueden venir. Direccion :Calle #10 120-10',1,'2026-06-26 15:46:24'),(5,10,NULL,'Solicitud de servicio: Electricidad — Notas del usuario: Se solicita inspección del sistema eléctrico por constantes apagones en la sala principal.',1,'2026-06-26 15:48:39'),(6,10,NULL,'Solicitud de servicio: Pintura — Notas del usuario: El residente solicita repintar las paredes del apartamento debido a desgaste y manchas visibles.',1,'2026-06-26 15:48:53'),(7,10,NULL,'Solicitud de servicio: Revision de calentadores — Notas del usuario: El cliente reporta fallas en el calentador de agua, indicando que no alcanza la temperatura adecuada.',1,'2026-06-26 15:49:01'),(8,10,NULL,'Solicitud de servicio: Plomeria — Notas del usuario: Se requiere reparación del sanitario por filtraciones en la base y problemas de descarga.',1,'2026-06-26 15:49:10'),(9,10,NULL,'Solicitud de servicio: Pintura — Notas del usuario: El propietario solicita limpieza y pintura de la fachada para mejorar la presentación del inmueble.',1,'2026-06-26 15:49:21'),(10,11,NULL,'Solicitud de servicio: Revision de calentadores — Notas del usuario: El residente solicita revisión general de instalaciones eléctricas, plomería y gas como medida preventiva.',1,'2026-06-26 15:50:19'),(11,11,NULL,'Solicitud de servicio: Electricidad — Notas del usuario: Se requiere inspección del tablero principal por ruidos y sobrecalentamiento en los interruptores.',1,'2026-06-26 15:50:49'),(12,11,NULL,'Solicitud de servicio: Revision de calentadores — Notas del usuario: El cliente reporta dificultad en el encendido del calentador y solicita revisión técnica.',1,'2026-06-26 15:50:58');
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
-- Table structure for table `serviciosmantenimiento`
--

DROP TABLE IF EXISTS `serviciosmantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serviciosmantenimiento` (
  `ServicioID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Precio` decimal(12,2) NOT NULL,
  `Estado` varchar(20) NOT NULL DEFAULT 'Activo',
  `Imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ServicioID`),
  CONSTRAINT `chk_estado_servicio` CHECK ((`Estado` in (_utf8mb4'Activo',_utf8mb4'Inactivo',_utf8mb4'Suspendido')))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviciosmantenimiento`
--

LOCK TABLES `serviciosmantenimiento` WRITE;
/*!40000 ALTER TABLE `serviciosmantenimiento` DISABLE KEYS */;
INSERT INTO `serviciosmantenimiento` VALUES (1,'Plomeria','Nuestro servicio de plomería garantiza soluciones rápidas y efectivas para mantener tus instalaciones en perfecto estado. Contamos con personal especializado que asegura trabajos seguros, duraderos y adaptados a las necesidades de cada cliente.',90000.00,'Activo','/img/Servicios/54e1b9f9-68b8-406e-a344-6cb611c933be.jpg'),(2,'Pintura','Nuestro servicio de pintura está diseñado para renovar y embellecer tus espacios, garantizando acabados profesionales y duraderos. Nos encargamos de cada detalle, desde la preparación de superficies hasta la aplicación final, utilizando materiales de alta calidad que aseguran resistencia y estética.',85000.00,'Activo','/img/Servicios/7ed484a6-abd7-4328-b121-993e5ab178fd.jpg'),(3,'Electricidad','Nuestro servicio de electricidad ofrece soluciones seguras y confiables para instalaciones, reparaciones y mantenimiento de sistemas eléctricos en hogares, oficinas y proyectos inmobiliarios. Trabajamos con técnicos certificados que garantizan cumplimiento de normas y máxima eficiencia energética.',120000.00,'Activo','/img/Servicios/5d3ff63f-a1b1-4a29-83f5-f587cc49064a.jpg'),(4,'Revision de calentadores','Nuestro servicio de revisión de calentadores asegura el correcto funcionamiento y la seguridad de tus equipos de agua caliente. Realizamos diagnósticos completos para prevenir fallas, optimizar el rendimiento y prolongar la vida útil de los sistemas.',200000.00,'Activo','/img/Servicios/532e7a83-56e9-49e8-8241-59b52262458c.jpg');
/*!40000 ALTER TABLE `serviciosmantenimiento` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (4,'Andres','andriu.geova@gmail.com','$2a$11$J7At8xptT9nDU7dyTofimuzPOkaI0m2fiTFrI8JFok7vl3MnVShI2','3113053046','2026-05-07 16:07:18','Activa',1,NULL),(5,'User','user@gmail.com','$2a$11$VgivnK.obdarsx1kc.wYIuCbsFJt5dhy61uYONJwYO831PvC6f3FS','3105103230','2026-05-21 19:48:02','Activa',3,'/img/Avatars/9a583233-f225-4f4d-8b7e-0ae181170a98.jpg'),(6,'SkyInit','skyinit2026@gmail.com','$2a$11$P.nC5eEMlu.3vylXIO7aDuPgLoQlTkTh1Pz.BiTFezsyjezuf609.','3124162370','2026-05-22 12:11:14','Activa',1,NULL),(7,'Agente','agente@gmail.com','$2a$11$GgRRr8esSvjaWNdKhTwup.80cc7p9qlmOtSKdfKAxTljdqoFJqsU.','3122100912','2026-05-25 16:35:30','Activa',2,NULL),(8,'felipe','aaa.@gmail.com','$2a$11$aucDsTyKq/V3A1RKjyDhWO8VI4FXE5JhdOJFw.HYJAquCYug9Zsu6','3124143860','2026-06-02 13:48:48','Activa',2,NULL),(9,'Andres Salamanca','andresmendoza6753@gmail.com','$2a$11$C099oZi/vIxOf..tDzznwucFr5bDR0ZpUMxPh1OmLdCt9RNmlJ4dO','320144568','2026-06-02 14:01:41','Activa',3,NULL),(10,'User2','user2@gmail.com','$2a$11$KPsZTLPeYqHDo/Pn2YjENuriPLgdnmf7wJnqXuE7mvTpsU9p1ew4W','317321200','2026-06-23 16:27:37','Activa',3,NULL),(11,'Jhoan Cotamo','jhoan.cotamo42@gmail.com','$2a$11$4au2zQXde5Pv7AcoWXkr5ejnm9ysZrKg6Gwin3aZo2ML8Aa2Y7eKG','3124143860','2026-06-26 14:44:58','Activa',3,NULL),(12,'Jeffry Alejandro','jeffryrodriguez117@gmail.com','$2a$11$zo4HKrZoUtuKuBF.pFrHueCU6.cZjDYVAQN55jtCQ/XeYwfjq5.ie','3124143860','2026-06-26 15:53:06','Activa',1,NULL);
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

-- Dump completed on 2026-06-26 15:58:56
