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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructoras`
--

LOCK TABLES `constructoras` WRITE;
/*!40000 ALTER TABLE `constructoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `constructoras` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenespropiedad`
--

LOCK TABLES `imagenespropiedad` WRITE;
/*!40000 ALTER TABLE `imagenespropiedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenespropiedad` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

LOCK TABLES `propiedades` WRITE;
/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
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
  PRIMARY KEY (`ProyectoID`),
  KEY `EstadoProyectoID` (`EstadoProyectoID`),
  KEY `ConstructoraID` (`ConstructoraID`),
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`EstadoProyectoID`) REFERENCES `estadosproyecto` (`EstadoProyectoID`),
  CONSTRAINT `proyectos_ibfk_2` FOREIGN KEY (`ConstructoraID`) REFERENCES `constructoras` (`ConstructoraID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparaciones`
--

LOCK TABLES `reparaciones` WRITE;
/*!40000 ALTER TABLE `reparaciones` DISABLE KEYS */;
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
  PRIMARY KEY (`UsuarioID`),
  UNIQUE KEY `Correo` (`Correo`),
  KEY `RolID` (`RolID`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`RolID`) REFERENCES `roles` (`RolID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
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

-- Dump completed on 2026-04-24 12:38:19
