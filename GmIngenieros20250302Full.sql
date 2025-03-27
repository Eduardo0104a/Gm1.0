CREATE DATABASE  IF NOT EXISTS `gmingenieros` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gmingenieros`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: gmingenieros
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `almacenes`
--

DROP TABLE IF EXISTS `almacenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenes` (
  `idalmacen` int NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idalmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenes`
--

LOCK TABLES `almacenes` WRITE;
/*!40000 ALTER TABLE `almacenes` DISABLE KEYS */;
INSERT INTO `almacenes` VALUES (1,'almacen oficina'),(2,'almacen tecnologico'),(3,'almacen campo');
/*!40000 ALTER TABLE `almacenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacenxarticulo`
--

DROP TABLE IF EXISTS `almacenxarticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacenxarticulo` (
  `idalmacen` int NOT NULL,
  `idarticulo` int NOT NULL,
  `anio` varchar(45) NOT NULL,
  `mes` varchar(45) NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `movimiento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idarticulo`,`anio`,`mes`,`idalmacen`),
  KEY `fk_idarticulo_idx` (`idarticulo`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_idarticulo_articulos` FOREIGN KEY (`idarticulo`) REFERENCES `articulos` (`IdArticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenxarticulo`
--

LOCK TABLES `almacenxarticulo` WRITE;
/*!40000 ALTER TABLE `almacenxarticulo` DISABLE KEYS */;
INSERT INTO `almacenxarticulo` VALUES (2,1,'2017','08',0.00,'E'),(2,1,'2023','06',0.00,'E'),(2,2,'2017','08',2.00,'E'),(2,2,'2023','06',0.00,'E'),(1,3,'2017','08',0.00,'E'),(1,3,'2023','06',2.00,'E'),(2,4,'2017','08',1.00,'E'),(2,4,'2023','06',0.00,'E'),(3,5,'2017','08',0.00,'E'),(3,5,'2023','06',2.00,'E'),(3,6,'2017','08',1.00,'E'),(3,6,'2023','06',1.00,'E'),(2,7,'2017','08',0.00,'E'),(2,7,'2023','06',1.00,'E'),(2,8,'2017','08',0.00,'E'),(2,8,'2023','06',1.00,'E'),(2,9,'2017','08',0.00,'E'),(2,9,'2023','06',1.00,'E'),(1,10,'2017','08',1.00,'E'),(1,10,'2023','06',0.00,'E'),(1,11,'2017','08',0.00,'E'),(1,11,'2023','06',1.00,'E'),(3,12,'2017','08',0.00,'E'),(3,12,'2023','06',1.00,'E'),(3,13,'2017','08',1.00,'E'),(3,13,'2023','06',0.00,'E'),(3,14,'2017','08',0.00,'E'),(3,14,'2023','06',2.00,'E'),(3,15,'2017','08',0.00,'E'),(3,15,'2023','06',2.00,'E'),(3,16,'2017','08',2.00,'E'),(3,16,'2023','06',0.00,'E'),(3,17,'2017','08',0.00,'E'),(3,17,'2023','06',2.00,'E'),(3,18,'2017','08',0.00,'E'),(3,18,'2023','06',1.00,'E'),(3,19,'2017','08',0.00,'E'),(3,19,'2023','06',1.00,'E'),(3,20,'2017','08',0.00,'E'),(3,20,'2023','06',2.00,'E'),(3,21,'2017','08',0.00,'E'),(3,21,'2023','06',4.00,'E'),(1,22,'2017','08',0.00,'E'),(1,22,'2023','06',2.00,'E'),(1,23,'2017','08',1.00,'E'),(1,23,'2023','06',0.00,'E'),(1,24,'2017','08',0.00,'E'),(1,24,'2023','06',2.00,'E'),(2,25,'2017','08',0.00,'E'),(2,25,'2023','06',0.00,'E'),(1,26,'2017','08',0.00,'E'),(1,26,'2023','06',1.00,'E'),(1,27,'2017','08',1.00,'E'),(1,27,'2023','06',0.00,'E'),(1,28,'2017','08',1.00,'E'),(1,28,'2023','06',1.00,'E'),(1,29,'2017','08',3.00,'E'),(1,29,'2023','06',0.00,'E'),(1,30,'2017','08',1.00,'E'),(1,30,'2023','06',1.00,'E'),(2,31,'2017','08',0.00,'E'),(2,31,'2023','06',2.00,'E'),(1,32,'2017','08',0.00,'E'),(1,32,'2023','06',3.00,'E'),(1,33,'2017','08',1.00,'E'),(1,33,'2023','06',0.00,'E'),(1,34,'2017','08',0.00,'E'),(1,34,'2023','06',4.00,'E'),(2,35,'2017','08',1.00,'E'),(2,35,'2023','06',0.00,'E'),(1,36,'2017','08',0.00,'E'),(1,36,'2023','06',3.00,'E'),(1,37,'2017','08',0.00,'E'),(1,37,'2023','06',3.00,'E'),(1,38,'2017','08',0.00,'E'),(1,38,'2023','06',1.00,'E'),(1,39,'2017','08',0.00,'E'),(1,39,'2023','06',1.00,'E'),(3,40,'2017','08',1.00,'E'),(3,40,'2023','06',0.00,'E'),(3,41,'2017','08',1.00,'E'),(3,41,'2023','06',0.00,'E'),(3,42,'2017','08',1.00,'E'),(3,42,'2023','06',0.00,'E'),(3,43,'2017','08',0.00,'E'),(3,43,'2023','06',1.00,'E'),(1,44,'2017','08',2.00,'E'),(1,44,'2023','06',0.00,'E'),(1,45,'2017','08',0.00,'E'),(1,45,'2023','06',2.00,'E'),(1,46,'2017','08',0.00,'E'),(1,46,'2023','06',4.00,'E'),(1,47,'2017','08',2.00,'E'),(1,47,'2023','06',0.00,'E'),(1,48,'2017','08',0.00,'E'),(1,48,'2023','06',2.00,'E'),(3,49,'2017','08',1.00,'E'),(3,49,'2023','06',0.00,'E'),(1,50,'2017','08',0.00,'E'),(1,50,'2023','06',2.00,'E'),(3,51,'2017','08',2.00,'E'),(3,51,'2023','06',0.00,'E'),(3,52,'2017','08',1.00,'E'),(3,52,'2023','06',0.00,'E'),(2,53,'2017','08',1.00,'E'),(2,53,'2023','06',0.00,'E'),(2,54,'2017','08',2.00,'E'),(2,54,'2023','06',0.00,'E'),(3,55,'2017','08',0.00,'E'),(3,55,'2023','06',1.00,'E'),(3,56,'2017','08',1.00,'E'),(3,56,'2023','06',0.00,'E'),(3,57,'2017','08',1.00,'E'),(3,57,'2023','06',0.00,'E'),(3,58,'2017','08',0.00,'E'),(3,58,'2023','06',3.00,'E'),(1,59,'2017','08',1.00,'E'),(1,59,'2023','06',0.00,'E'),(3,60,'2017','08',0.00,'E'),(3,60,'2023','06',5.00,'E'),(3,61,'2017','08',0.00,'E'),(3,61,'2023','06',7.00,'E'),(3,62,'2017','08',2.00,'E'),(3,62,'2023','06',0.00,'E'),(1,63,'2017','08',0.00,'E'),(1,63,'2023','06',1.00,'E'),(1,64,'2017','08',0.00,'E'),(1,64,'2023','06',2.00,'E'),(1,65,'2017','08',1.00,'E'),(1,65,'2023','06',0.00,'E'),(1,66,'2017','08',1.00,'E'),(1,66,'2023','06',0.00,'E'),(3,67,'2017','08',0.00,'E'),(3,67,'2023','06',3.00,'E'),(2,68,'2017','08',1.00,'E'),(2,68,'2023','06',0.00,'E'),(2,69,'2017','08',1.00,'E'),(2,69,'2023','06',0.00,'E'),(1,70,'2017','08',1.00,'E'),(1,70,'2023','06',0.00,'E'),(1,71,'2017','08',0.00,'E'),(1,71,'2023','06',4.00,'E'),(1,72,'2017','08',1.00,'E'),(1,72,'2023','06',0.00,'E'),(1,73,'2017','08',0.00,'E'),(1,73,'2023','06',4.00,'E'),(1,74,'2017','08',0.00,'E'),(1,74,'2023','06',41.00,'E'),(1,75,'2017','08',7.00,'E'),(1,75,'2023','06',0.00,'E'),(3,76,'2017','08',2.00,'E'),(3,76,'2023','06',0.00,'E'),(3,77,'2017','08',0.00,'E'),(3,77,'2023','06',2.00,'E'),(2,78,'2017','08',0.00,'E'),(2,78,'2023','06',0.00,'E'),(1,79,'2017','08',0.00,'E'),(1,79,'2023','06',3.00,'E'),(3,80,'2017','08',0.00,'E'),(3,80,'2023','06',1.00,'E'),(3,81,'2017','08',0.00,'E'),(3,81,'2023','06',2.00,'E');
/*!40000 ALTER TABLE `almacenxarticulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `IdArea` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdArea`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Por Definir...'),(2,'Administración'),(3,'Tecnico de Proyectos'),(4,'Contabilidad'),(5,'Gerencia'),(6,'Sistemas');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articuloconsolidado`
--

DROP TABLE IF EXISTS `articuloconsolidado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articuloconsolidado` (
  `idarticuloconsolidado` int NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idarticuloconsolidado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articuloconsolidado`
--

LOCK TABLES `articuloconsolidado` WRITE;
/*!40000 ALTER TABLE `articuloconsolidado` DISABLE KEYS */;
/*!40000 ALTER TABLE `articuloconsolidado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulos` (
  `IdArticulo` int NOT NULL AUTO_INCREMENT,
  `IdCategoria` int DEFAULT NULL,
  `IdMarca` int DEFAULT NULL,
  `caracteristicas` varchar(400) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `IdTipoUnidad` int DEFAULT NULL,
  `valorunidad` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdArticulo`),
  KEY `IdCategoria` (`IdCategoria`),
  KEY `IdMarca` (`IdMarca`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`),
  CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`IdMarca`) REFERENCES `marcas` (`IdMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (1,2,NULL,NULL,'ADAPTADOR DE DVI A HDMI',1.00,1,'NO DEFINIDO'),(2,2,NULL,NULL,'ADAPTADORES UNIVERSALES PARA ENCHUFES',2.00,1,'NO DEFINIDO'),(3,1,NULL,NULL,'AUTONUMBER',2.00,1,'NO DEFINIDO'),(4,2,NULL,NULL,'BATERIA PORTATIL PARA CELULAR',1.00,1,'NO DEFINIDO'),(5,3,NULL,NULL,'BOLSAS DE DORMIR',2.00,1,'NO DEFINIDO'),(6,3,NULL,NULL,'CABLE BLANCO PARA RECARGAR GPS',1.00,1,'NO DEFINIDO'),(7,2,NULL,NULL,'CABLE DE VIDEO HDMI',1.00,1,'NO DEFINIDO'),(8,2,NULL,NULL,'CABLE RED',1.00,1,'NO DEFINIDO'),(9,2,NULL,NULL,'CABLE VIDEO VGA',1.00,1,'NO DEFINIDO'),(10,1,NULL,NULL,'CAJA DE GRAPAS',5.00,1,'NO DEFINIDO'),(11,1,NULL,NULL,'CAJA DE TIZA',1.00,1,'NO DEFINIDO'),(12,3,NULL,NULL,'CAMARA FOTOGRAFICA PLATAEADA SONY + FUNDA NEGRA',1.00,1,'NO DEFINIDO'),(13,3,NULL,NULL,'CARGADOR (NUEVO) DE PILAS',2.00,1,'NO DEFINIDO'),(14,3,NULL,NULL,'CASACA AZUL',2.00,1,'NO DEFINIDO'),(15,3,NULL,NULL,'CASACA FOSFORECENTE VERDE',3.00,1,'NO DEFINIDO'),(16,3,NULL,NULL,'CASCOS BLANCOS',2.00,1,'NO DEFINIDO'),(17,3,NULL,NULL,'CHALECO FOSFORECENTE NARANJA',2.00,1,'NO DEFINIDO'),(18,3,NULL,NULL,'CHALECO FOSFORECENTE VERDE',1.00,1,'NO DEFINIDO'),(19,3,NULL,NULL,'CHALECO GRIS',1.00,1,'NO DEFINIDO'),(20,3,NULL,NULL,'CHALECO NARANJA DE MALLA',2.00,1,'NO DEFINIDO'),(21,3,NULL,NULL,'CHALECO NARANJA GENERICO',4.00,1,'NO DEFINIDO'),(22,1,NULL,NULL,'CHINCHES CAJA',2.00,1,'NO DEFINIDO'),(23,1,NULL,NULL,'CINTA DE EMBALAJE',1.00,1,'NO DEFINIDO'),(24,1,NULL,NULL,'COLCHONETA NEGRA',2.00,1,'NO DEFINIDO'),(25,2,NULL,NULL,'CONECTOR DE RED INAHALBRICO TP LINK',0.00,1,'NO DEFINIDO'),(26,1,NULL,NULL,'CORREA NEGRA',1.00,1,'NO DEFINIDO'),(27,1,NULL,NULL,'CORRECTOR DE CINTA',2.00,1,'NO DEFINIDO'),(28,1,NULL,NULL,'CORRECTOR LIQUIDO',3.00,1,'NO DEFINIDO'),(29,1,NULL,NULL,'CUADERNOS',3.00,1,'NO DEFINIDO'),(30,1,NULL,NULL,'CUCHILLA',1.00,1,'NO DEFINIDO'),(31,2,NULL,NULL,'DISCO DURO WESTERN DIGITAL',2.00,1,'NO DEFINIDO'),(32,1,NULL,NULL,'ENGRAMPADORA',3.00,1,'NO DEFINIDO'),(33,1,NULL,NULL,'ENGRAPADOR GRANDE CON SACA GRAPAS',1.00,1,'NO DEFINIDO'),(34,1,NULL,NULL,'ETIQUETAS PLANTILLA',4.00,1,'NO DEFINIDO'),(35,2,NULL,NULL,'EXTENSION DE 15 M CON 3 SALIDAS ELECTRICAS (NUEVO)',1.00,1,'NO DEFINIDO'),(36,1,NULL,NULL,'FASTENER CAJA',3.00,1,'NO DEFINIDO'),(37,1,NULL,NULL,'GANCHOS GRANDES',3.00,1,'NO DEFINIDO'),(38,1,NULL,NULL,'GANCHOS PEQUEÑOS',1.00,1,'NO DEFINIDO'),(39,1,NULL,NULL,'GOMA EN BOTELLA',1.00,1,'NO DEFINIDO'),(40,3,NULL,NULL,'GORRO DE LANA AZUL',1.00,1,'NO DEFINIDO'),(41,3,NULL,NULL,'GPX ETREX 20',1.00,1,'NO DEFINIDO'),(42,3,NULL,NULL,'GPX MOUNTAN 650',1.00,1,'NO DEFINIDO'),(43,3,NULL,NULL,'HILO DE PESCAR',1.00,1,'NO DEFINIDO'),(44,1,NULL,NULL,'HUELLEROS DIGITAL',2.00,1,'NO DEFINIDO'),(45,1,NULL,NULL,'HUMEDECEDOR DACTILAR',2.00,1,'NO DEFINIDO'),(46,1,NULL,NULL,'LAPICERO',55.00,1,'NO DEFINIDO'),(47,1,NULL,NULL,'LAPICEROS MAGICOS PILOT',2.00,1,'NO DEFINIDO'),(48,1,NULL,NULL,'LAPICES',9.00,1,'NO DEFINIDO'),(49,3,NULL,NULL,'LENTE DE SEGURIDAD OSCUROS',1.00,1,'NO DEFINIDO'),(50,1,NULL,NULL,'LIMPIATIPO',2.00,1,'NO DEFINIDO'),(51,3,NULL,NULL,'LINTERNAS',2.00,1,'NO DEFINIDO'),(52,3,NULL,NULL,'MAMELUCO BLANCO PARA MUESTREO DE AGUA',1.00,1,'NO DEFINIDO'),(53,2,NULL,NULL,'MEMORIA SONY 4GB',1.00,1,'NO DEFINIDO'),(54,2,NULL,NULL,'MICROCHIP MEMORIA KING 16GB',1.00,1,'NO DEFINIDO'),(55,3,NULL,NULL,'PAQUETE DE BOLSA DE VACIO',1.00,1,'NO DEFINIDO'),(56,3,NULL,NULL,'GUANTE AMARILLOS (PAR)',1.00,1,'NO DEFINIDO'),(57,3,NULL,NULL,'GUANTES QUIRURGICOS COLOR AZUL (PAR)',1.00,1,'NO DEFINIDO'),(58,3,NULL,NULL,'BOTAS (PAR)',3.00,1,'NO DEFINIDO'),(59,1,NULL,NULL,'PERFORADOR',4.00,1,'NO DEFINIDO'),(60,3,NULL,NULL,'PILA AA',5.00,1,'NO DEFINIDO'),(61,3,NULL,NULL,'PILA AAA',7.00,1,'NO DEFINIDO'),(62,3,NULL,NULL,'PILAS RECARGABLES AA',5.00,1,'NO DEFINIDO'),(63,1,NULL,NULL,'PISTOLA DE SILICONA',1.00,1,'NO DEFINIDO'),(64,1,NULL,NULL,'PLUMÓN DELGADO',2.00,1,'NO DEFINIDO'),(65,1,NULL,NULL,'PLUMÓN GRUESO',9.00,1,'NO DEFINIDO'),(66,1,NULL,NULL,'PORTAMINAS FABER CASTELL',1.00,1,'NO DEFINIDO'),(67,3,NULL,NULL,'PROTECTOR FACIAL',3.00,1,'NO DEFINIDO'),(68,2,NULL,NULL,'PROYECTOR EN CAJA COMPLETO, NUEVO',1.00,1,'NO DEFINIDO'),(69,2,NULL,NULL,'PUNTERO LAZER',1.00,1,'NO DEFINIDO'),(70,1,NULL,NULL,'RESALTADOR COLOR NARANJA',1.00,1,'NO DEFINIDO'),(71,1,NULL,NULL,'RESALTADORES',4.00,1,'NO DEFINIDO'),(72,1,NULL,NULL,'RESPIRADOR DE GASES',1.00,1,'NO DEFINIDO'),(73,1,NULL,NULL,'SACAGRAPAS',4.00,1,'NO DEFINIDO'),(74,1,NULL,NULL,'SELLO',41.00,1,'NO DEFINIDO'),(75,1,NULL,NULL,'SOBRE',8.00,1,'NO DEFINIDO'),(76,3,NULL,NULL,'TABLEROS DE MADERA',2.00,1,'NO DEFINIDO'),(77,3,NULL,NULL,'TAPASOL',2.00,1,'NO DEFINIDO'),(78,2,NULL,NULL,'TARJETA DE VIDEO RED INALAMBRICA',0.00,1,'NO DEFINIDO'),(79,1,NULL,NULL,'TINTE DE TAMPON',7.00,1,'NO DEFINIDO'),(80,3,NULL,NULL,'WINCHA 50M',2.00,1,'NO DEFINIDO'),(81,3,NULL,NULL,'WINCHA DE 100M',2.00,1,'NO DEFINIDO');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulosconsolidado`
--

DROP TABLE IF EXISTS `articulosconsolidado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulosconsolidado` (
  `descripcion` varchar(400) DEFAULT NULL,
  `Total` decimal(32,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulosconsolidado`
--

LOCK TABLES `articulosconsolidado` WRITE;
/*!40000 ALTER TABLE `articulosconsolidado` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulosconsolidado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
  `IdAsistencia` int NOT NULL AUTO_INCREMENT,
  `Dni` char(8) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Procesado` char(1) DEFAULT NULL,
  PRIMARY KEY (`IdAsistencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancos`
--

DROP TABLE IF EXISTS `bancos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancos` (
  `IdBanco` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancos`
--

LOCK TABLES `bancos` WRITE;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` VALUES (1,'BCP'),(2,'BBVA'),(3,'IBK'),(4,'BN'),(5,'OTRO');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bkproyectoxobjetoestudio`
--

DROP TABLE IF EXISTS `bkproyectoxobjetoestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bkproyectoxobjetoestudio` (
  `IdProyectoxObjectoEstudio` int NOT NULL DEFAULT '0',
  `IdProyecto` int NOT NULL,
  `IdObjetoEstudio` int NOT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bkproyectoxobjetoestudio`
--

LOCK TABLES `bkproyectoxobjetoestudio` WRITE;
/*!40000 ALTER TABLE `bkproyectoxobjetoestudio` DISABLE KEYS */;
INSERT INTO `bkproyectoxobjetoestudio` VALUES (1,1,1,'S'),(2,2,1,'S'),(3,3,1,'S'),(4,4,1,'S'),(5,5,1,'S'),(6,6,1,'S'),(7,7,1,'S'),(8,8,1,'S'),(9,8,2,'S'),(10,8,3,'S'),(11,9,1,'S'),(12,10,1,'S'),(13,11,1,'S'),(14,12,1,'S'),(15,13,1,'S'),(16,14,1,'S'),(17,15,1,'S'),(18,16,1,'S'),(19,17,1,'S'),(20,18,1,'S'),(21,19,4,'S'),(22,20,2,'S'),(23,21,2,'S'),(24,22,1,'S'),(25,22,2,'S'),(26,22,3,'S'),(27,23,1,'S'),(28,24,1,'S'),(29,25,2,'S'),(30,26,1,'S'),(31,27,1,'S'),(32,28,1,'S'),(33,29,1,'S'),(34,30,1,'S'),(35,2,2,'N'),(36,2,3,'N'),(37,2,4,'N'),(38,1,2,'N'),(39,1,3,'N'),(40,1,4,'N'),(41,3,2,'N'),(42,3,3,'N'),(43,3,4,'N'),(44,4,2,'N'),(45,4,3,'N'),(46,4,4,'N'),(47,5,2,'N'),(48,5,3,'N'),(49,5,4,'N'),(50,6,2,'N'),(51,6,3,'N'),(52,6,4,'N'),(53,7,2,'N'),(54,7,3,'N'),(55,7,4,'N'),(56,8,4,'N'),(57,9,2,'N'),(58,9,3,'N'),(59,9,4,'N'),(60,10,2,'N'),(61,10,3,'N'),(62,10,4,'N'),(63,11,2,'N'),(64,11,3,'N'),(65,11,4,'N'),(66,12,2,'N'),(67,12,3,'N'),(68,12,4,'N'),(69,13,2,'N'),(70,13,3,'N'),(71,13,4,'N'),(72,14,2,'N'),(73,14,3,'N'),(74,14,4,'N'),(75,15,2,'N'),(76,15,3,'N'),(77,15,4,'N'),(78,16,2,'N'),(79,16,3,'N'),(80,16,4,'N'),(81,17,2,'N'),(82,17,3,'N'),(83,17,4,'N'),(84,18,2,'N'),(85,18,3,'N'),(86,18,4,'N'),(87,19,1,'N'),(88,19,2,'N'),(89,19,3,'N'),(90,20,1,'N'),(91,20,3,'N'),(92,20,4,'N'),(93,21,1,'N'),(94,21,3,'N'),(95,21,4,'N'),(96,22,4,'N'),(97,23,2,'N'),(98,23,3,'N'),(99,23,4,'N'),(100,24,2,'N'),(101,24,3,'N'),(102,24,4,'N'),(103,25,1,'N'),(104,25,3,'N'),(105,25,4,'N'),(106,26,2,'N'),(107,26,3,'N'),(108,26,4,'N'),(109,27,2,'N'),(110,27,3,'N'),(111,27,4,'N'),(112,28,2,'N'),(113,28,3,'N'),(114,28,4,'N'),(115,29,2,'N'),(116,29,3,'N'),(117,29,4,'N'),(118,30,2,'N'),(119,30,3,'N'),(120,30,4,'N');
/*!40000 ALTER TABLE `bkproyectoxobjetoestudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabeceracomprobante`
--

DROP TABLE IF EXISTS `cabeceracomprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabeceracomprobante` (
  `IdCabeceraComprobante` int NOT NULL AUTO_INCREMENT,
  `IdProveedor` int DEFAULT NULL,
  `IdTipoDocumento` int DEFAULT NULL,
  `NumeroComprobante` varchar(20) DEFAULT NULL,
  `FechaEmision` varchar(10) DEFAULT NULL,
  `FechaVencimiento` varchar(10) DEFAULT NULL,
  `SubTotal` decimal(18,2) DEFAULT NULL,
  `Igv` decimal(18,2) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`IdCabeceraComprobante`),
  KEY `IdProveedor` (`IdProveedor`),
  KEY `IdTipoDocumento` (`IdTipoDocumento`),
  CONSTRAINT `cabeceracomprobante_ibfk_1` FOREIGN KEY (`IdProveedor`) REFERENCES `proveedores` (`IdProveedor`),
  CONSTRAINT `cabeceracomprobante_ibfk_2` FOREIGN KEY (`IdTipoDocumento`) REFERENCES `tiposdocumentos` (`IdTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabeceracomprobante`
--

LOCK TABLES `cabeceracomprobante` WRITE;
/*!40000 ALTER TABLE `cabeceracomprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `cabeceracomprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajachica`
--

DROP TABLE IF EXISTS `cajachica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajachica` (
  `IdCajaChica` int NOT NULL AUTO_INCREMENT,
  `IdTransferenciaBancaria` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Entrada` varchar(100) DEFAULT NULL,
  `Salida` varchar(100) DEFAULT NULL,
  `Saldo` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`IdCajaChica`),
  KEY `IdTransferenciaBancaria` (`IdTransferenciaBancaria`),
  CONSTRAINT `cajachica_ibfk_1` FOREIGN KEY (`IdTransferenciaBancaria`) REFERENCES `transferenciasbancarias` (`IdTransferenciaBancaria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajachica`
--

LOCK TABLES `cajachica` WRITE;
/*!40000 ALTER TABLE `cajachica` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajachica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `IdCargo` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Administracion');
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carreras`
--

DROP TABLE IF EXISTS `carreras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carreras` (
  `IdCarrera` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carreras`
--

LOCK TABLES `carreras` WRITE;
/*!40000 ALTER TABLE `carreras` DISABLE KEYS */;
/*!40000 ALTER TABLE `carreras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `IdCategoria` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'oficina'),(2,'tecnologico'),(3,'campo');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `NombreEmpresa` varchar(100) DEFAULT NULL,
  `proyecto` varchar(16000) DEFAULT NULL,
  `TipoCliente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'NAYLAMP INGENIEROS S.A.C','ESTUDIO DEFINITIVO DE LA VARIANTE DEL QAPAQ ÑAM AUTOPISTA PUNO-JULIACA, COMPONENTE PACRI','J'),(2,'CESEL S.A.','ELABORACION DEL ESTUDIO DE PERFIL , EVALUACION PRELIMINAR- EVAP Y LA INGENIERIA DE DETALLE DEL PROYECTO DEL CORREDOR VIAL APURIMAC-CUSCO  TRAMO 3','J'),(3,'NAYLAMP INGENIEROS S.A.C',' ESTUDIO DE PRE INVERSION A NIVEL DE FACTIBILIDAD DEL PROYECTO: MEJORAMIENTO A NIVEL DE AUTOPISTA Y/O PAR VIAL SECTOR 3 AREQUIPA-YURA','J'),(4,'NAYLAMP INGENIEROS S.A.C','ESTUDIO DE PRE INVERSION A NIVEL DE FACTIBILIDAD DEL PROYECTO: MEJORAMIENTO A NIVEL DE AUTOPISTA Y/O PAR VIAL SECTOR 4 YURA - PATAHUASI.','J'),(5,'NAYLAMP INGENIEROS S.A.C','ESTUDIO DEFINITIVO DE LA VARIANTE DE INGENIERIA DE LA SEGUNDA CALZADA DE LA AUTOPISTA PUNO JULIACA, AVANCE PACRI SEGUN PROPUESTA 0101020','J'),(6,'NAYLAMP INGENIEROS S.A.C','PROPUESTA TECNICA ECONOMICA DEL PROYECTO REHABILITACION DEL EJE VIAL NO. 1PIURA-GUAYAQUIL(06 OBRAS-14 PUENTES)','J'),(7,'NAYLAMP INGENIEROS S.A.C','PROPUESTA TECNICA ECONOMICA DEL PROYECTO CONSTRUCCION DE PUENTES POR REEMPLAZO EN LA ZONA NORTE DEL PAIS (02 OBRAS - 12 PUENTES)','J'),(8,'NAYLAMP INGENIEROS S.A.C','ESTUDIO DEFINITIVO DE LA VARIANTE DEINGENIERIA DE LA SEGUNDA CALZADA DE LA AUTOPISTA PUNO JULIACA - EXPEDIENTES INDIVIDUALES, CPE, ANALISIS SEGÚN DL 1192','J'),(9,'CONSORCIO HIDRO-NAYLAMP','REFORMULACION DEL ESTUDIO DE PREINVERSION A NIVEL DE PERFIL: CONSTRUCCION DE LAVIA DE EVITAMIENTO A LA CIUDAD DE JUANJUI','J'),(10,'CESEL S.A.','ELABORACIÓN DEL COMPONENTE DE AFECTACIONES SEGÚN DL 1192N Y MODIFICATORIAS DEL ESTUDIO DEFINITIVO PARA EL MEJORAMIENTO DEL CORREDOR VIAL APURÍMAC-CUSCO. TRAMO 3, SUBTRAMO 3','J'),(11,'PM PERU','ESTUDIO DE PREINVERSIÓN A NIVEL DE PERFIL DEL PROYECTO DE LA CARRETERA HUANCAVELICA – EMP. PE – 3S, TRAMO: LIRCAY – LAGUNILLAS – EMP. RUTA PE – 3S','J'),(12,'PM PERU','ESTUDIO DE PRE INVERSIÓN A NIVEL DE PERFIL DE LA CARRETERA PTE PALLAR – PTE CHAGUAL','J'),(13,'GEOCONSULT-PM PERU','ESTUDIO DE PREINVERSION A NIVEL DE PERFIL, CARRETERA LONGITUDINAL DE LA SIERRA, TRAMO IV, PROYECTO GE 006 – 17 HUANCAYO - IZCUCHACA','J'),(14,'EPCM - CONSULTING SAC','Elaboracion del estudio de interferencias para el proyecto del puente Pichari.','J'),(15,'CONSORCIO EPCM-GEOCONSULT','PAC estudio definitivo para la construccion y mejoramiento de la via evitamiento de Huancayo.','J'),(16,'ECOCEL SAC','Servicio de monitoreo ambiental en el paso a desnivel de cerro blanco.','J'),(17,'ECOCEL SAC','Servicio de monitoreo ambiental 8 puentes.','J'),(18,'SIGT','Mejoramiento del corredor vial Apurimac.','J'),(19,'CROVISA','Mejoramiento de los jirones Oyón, Iquitos, Víctor Andrés.','J'),(20,'GEOMETRICA','Estudio de afectaciones Prediales','J'),(21,'CONSORCIO PERUANO PUENTES PIURA','Estudio de plan de afectaciones y compensaciones prediales.','J'),(23,'GEOMETRICA','Proyecto cumbil chotano','J'),(24,'CONSORCIO PERUANO PUENTES PIURA','Construcción de 11 puentes de carretera en la red vial nacional, ruta PE-1NR en el tramo Tambogrande-Morropon-Chulucanas, departamento Piura.','J'),(25,'CONSORCIO PUENTES  Norte (Jack Lopez y Naylamp)','Construcción de Puentes por reemplazo en Ancash','J'),(26,'PM PERU','Estudio definitivo para la rehabilitación y mejoramiento de la carretera empalme ruta AN111-Huamnin-Progreso-Poque-Llata-Cochapata (Túnal Taytamayo)- Nuevas Flores-Quivilla-Tingo Chico  ','J'),(27,'PM PERU','Construcción de 11 puentes en la red víal nacional, ruta PE-1NR en el tramo Tambogrande hasta Puente la Peña km 60+000.','J'),(28,'NAYLAMP INGENIEROS S.A.C','Estudio definitivo de la variante de ingeniería de la segunda calzada de la autopista Puno Juliaca.','J'),(29,'PM PERU','Estudio de preinversion a nivel de perfil de la carretera PE-5NC, nuevo Siasme-Saramiriza','J');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunicaciones`
--

DROP TABLE IF EXISTS `comunicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunicaciones` (
  `IdComunicacion` int NOT NULL AUTO_INCREMENT,
  `IdPeriodo` int DEFAULT NULL,
  `NombreProyecto` varchar(100) DEFAULT NULL,
  `Tipo` int DEFAULT NULL,
  `CodDoc` varchar(100) DEFAULT NULL,
  `Origen` varchar(100) DEFAULT NULL,
  `Destino` varchar(100) DEFAULT NULL,
  `Flujo` int DEFAULT NULL,
  `Asunto` mediumtext,
  `Fecha` date DEFAULT NULL,
  `CodDocRespuesta` varchar(100) DEFAULT NULL,
  `estado` int DEFAULT NULL,
  `Enlace` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdComunicacion`),
  KEY `IdPeriodo` (`IdPeriodo`),
  CONSTRAINT `comunicaciones_ibfk_1` FOREIGN KEY (`IdPeriodo`) REFERENCES `periodos` (`IdPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunicaciones`
--

LOCK TABLES `comunicaciones` WRITE;
/*!40000 ALTER TABLE `comunicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `comunicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactos`
--

DROP TABLE IF EXISTS `contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactos` (
  `IdContacto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `FechaNacimiento` varchar(10) DEFAULT NULL,
  `PersonasRelacionadas` varchar(100) DEFAULT NULL,
  `Empresa` varchar(100) DEFAULT NULL,
  `Cuentas` varchar(100) DEFAULT NULL,
  `Clave` varchar(100) DEFAULT NULL,
  `Cargo` varchar(100) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono` char(9) DEFAULT NULL,
  `Departamento` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Notas` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdContacto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactos`
--

LOCK TABLES `contactos` WRITE;
/*!40000 ALTER TABLE `contactos` DISABLE KEYS */;
INSERT INTO `contactos` VALUES (1,'Ivan','','','GM Ingenieros','','','Tecnico','ivan.atanacio@gmail.com','923227609','Lima','Av. Venezuela 685 Of. 1012',''),(2,'Yuri César Atanacio Anchiraico','','','GM Ingenieros','','','Director General','yuri.atanacio@gmingenieros.com.pe','991231114','Lima','Av. Venezuela 685 Of. 1013',''),(3,'Raul Peña Olano','','','OHLA','','','Gerente Legal ','rpena@ohla-peru.pe','986670093','Lima','Av. 28 de Julio N°150 Planta 7','Proyecto Red Vial y Rio Lacramarca'),(4,'Milagros Gutierrez Mendoza','','','OHLA','','','null','mgutierrez@ohla-peru.pe',' null','Lima','Av. 28 de Julio N°150 Planta 7','Proyecto Red Vial y Rio Lacramarca'),(5,'Josseline Gianina Llerena Morales De Estrada','','','OHLA','','','null','JOSSELINE.LLERENA@ohla-peru.pe',' null','Lima','Av. 28 de Julio N°150 Planta 7','Proyecto Red Vial y Rio Lacramarca'),(6,'Cintya Escobar Masco','','','OHLA','','','Jefa de Administracion','cintya.escobar@ohla-peru.pe','516257200','Lima','Av. 28 de Julio N°150 Planta 8','Proyecto Red Vial y Rio Lacramarca'),(7,'Jose A. Mayoral Vicente','','','OHLA','','','Coordinador de Proyectos','jmayoral@ohla-peru.pe','949091367','Lima','Av. 28 de Julio N°150 Planta 7','Proyecto Red Vial y Rio Lacramarca'),(8,'Cary Vilchez Castañeda','','','FCISA','','','Gerente General','cary.vilchez@fcisa.com','987119201','Lima','Av.Tacna 685, oficinas 174 y 181','Proyecto Santa Rosa'),(9,'Eveling Baca Custodio','','','FCISA','','','Gestor Legal','eveling.baca@fcisa.com','984785709','Lima','Av.Tacna 685, oficinas 174,181 y 182','Proyecto Santa Rosa'),(10,'Jennifer Guadalupe Rowe','','','FCISA','','','Gerente de Operaciones ','jennifer.guadalupe@fcisa.com','943603594','Lima','Av.Tacna 685, oficinas 174,181 y 182','Proyecto Santa Rosa'),(11,'Wilder Casimir Manuelo ','','','FCISA','','','Gestor de Proyectos Ambientales','wilder.casimir@fcisa.com','987734508','Lima','Av.Tacna 685, oficinas 174,181 y 182','Proyecto Santa Rosa'),(12,'Jose Miguel Manco Allende','','','FCISA','','','Contabilidad','contabilidad@fcisa.com','978046942','Lima','Av.Tacna 685, oficinas 174,181 y 182','Proyecto Santa Rosa'),(13,'Heyssy Mendoza Campos ','','','FCISA','','','Asistente Ssoma','ssoma@fcisa.com','4286301','Lima','Av.Tacna 685, oficinas 174,181 y 182','Proyecto Santa Rosa'),(14,'Yvan Diaz Velasquez','','','FCISA','','','Administrador','administracion@fcisa.com','4286301','Lima','Av.Tacna 685, oficinas 174,181 y 182','Proyecto Santa Rosa'),(15,'Juan Flores Mango','','','GrupoTYPSA','','','Departamento de Obras Lineales','jpflores@typsa.es ','997502924','Lima','Av. 28 de Julio 1044, piso 5 ','Proyecto TYPSA'),(16,'Johanna Guevara De la Cruz','','','GrupoTYPSA','','','Asistente Administrativa','mjguevara@typsa.es ','979394568','Lima','Av. 28 de Julio 1044, piso 5 ','Proyecto TYPSA'),(17,'Rosario Hernández Cabrera','','','GrupoTYPSA','','','Coordinación de Proyectos','mhernandez@typsa.es','955971203','Lima','Av. 28 de Julio 1044, piso 5 ','Proyecto TYPSA'),(18,'Giannina Gonzales Martinez','','','GrupoTYPSA','','','Control Documentario','gpgonzales@typsa.es','936018303','Lima','Av. 28 de Julio 1044, piso 5 ','Proyecto TYPSA'),(19,'Luis Andres Vicente Luyo','','','GrupoTYPSA','','','Coordinador de diseño MT/BT','lavicente@typsa.es','953258438','Lima','Av. 28 de Julio 1044, piso 5 ','Proyecto TYPSA'),(20,'Maria Anabell Rodriguez Sueros','','','CONSORCIO NAYLAMP','','','Coordinadora de Administracion','administracion@naylampingenieros.pe','16975082','Lima','Jr. Luis Saenz N°150 Urb.Santa Catalina','PROYECTO 11 PUENTES'),(21,'Jorge Fernando Luna Huaman','','','PM PERU','','','Representante Legal','jluna@pmperu.com.pe','14400783','Lima','Av. Los Quechuas N°1336 of. 301- Ate','Proy Lircay, Pte Pallar, Saramiriza'),(22,'Nathy Alfaro Muñoz','','','Geometrica SAC','','','Coordinador de Proyectos','nathy.alfaro@geometrica.com','null','Lima','Av. Paz Soldan 170 INT. 207','Proyecto Quinua y Puente Cumbil'),(23,'Julissa Mejia Camacho','','','Geometrica SAC','','','Administrativa','julissa.camacho@geometrica.com.pe','2217719','Lima','Av. Paz Soldan 170 INT. 208','Proyecto Quinua y Puente Cumbil'),(24,'Marco Antonio Quispe Berrocal','','','GBO INGENIEROS SAC','','','null','gboingenieros@gmail.com','964765184','Callao','Otr. Los Angeles de Oquendo - Prov Callao','Proyecto San Marcos'),(25,'Miguel Yapuchura Cayllahua','','','HARIUS SAC','','','null','ing.mayapuchura@gmail.com','null','Lima','Cal. Santiago Crespo 100 Urb El Trebol','Proyecto Puquina y Anda'),(26,'Victor Salinas','','','FRESNILLO PERU SAC','','','Jefe de Exploraciones','null','null','Cajamarca','Av. Republica de Colombia N° 643 INT 901 B','Estudio de culminacion de carretara de la Sierra'),(27,'Jandy Sanchez','','','FRESNILLO PERU SAC','','','Area Legal','null','null','Cajamarca','Av. Republica de Colombia N° 643 INT 901 B','Estudio de culminacion de carretara de la Sierra'),(28,'Lexsy Vidal','','','null','','','null','lexsyvidal3@gmail.com','null','null','null','Proyecto Puente Ashaninca'),(29,'Andres Galan','','','CESEL SAC','','','Coordinador de Proyectos ','Agalan@cesel.com.pe','7055000','Lima','Av. Jose Galvez Barrenechea N° 6346 Urb. ','Revision sobre la gestion Socio Ambiental'),(30,'Julio Vildoso ','','','CONSORCIO EPCM ','','','null','jvildoso@epcm.pe','null','Lima','Av. Del Parque Norte 1174 Urb. Corpac Frente al Parque Familia','Estudio para la Construccion y Manten. de la Via Evt. Huancayo');
/*!40000 ALTER TABLE `contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratantes`
--

DROP TABLE IF EXISTS `contratantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratantes` (
  `IdContratante` int NOT NULL AUTO_INCREMENT,
  `NombreEmpresa` varchar(200) NOT NULL,
  `Tipo` varchar(10) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `NroDocumento` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratantes`
--

LOCK TABLES `contratantes` WRITE;
/*!40000 ALTER TABLE `contratantes` DISABLE KEYS */;
INSERT INTO `contratantes` VALUES (1,'CESEL S.A.',NULL,NULL,NULL),(2,'CONSORCIO EPCM-GEOCONSULT',NULL,NULL,NULL),(3,'CONSORCIO HIDRO-NAYLAMP',NULL,NULL,NULL),(4,'CONSORCIO PERUANO PUENTES PIURA',NULL,NULL,NULL),(5,'CONSORCIO PUENTES  Norte (Jack Lopez y Naylamp)',NULL,NULL,NULL),(6,'CROVISA',NULL,NULL,NULL),(7,'ECOCEL SAC',NULL,NULL,NULL),(8,'EPCM - CONSULTING SAC',NULL,NULL,NULL),(9,'GEOCONSULT-PM PERU',NULL,NULL,NULL),(10,'GEOMETRICA',NULL,NULL,NULL),(11,'NAYLAMP INGENIEROS S.A.C',NULL,NULL,NULL),(12,'PM PERU',NULL,NULL,NULL),(13,'SIGT',NULL,NULL,NULL),(14,'GESTOP SOL. INTERGALES SAC',NULL,NULL,NULL),(15,'CONSULTORES Y CONSTRUCTORES CARE SAC',NULL,NULL,NULL),(16,'PYUNGHWA ENGINEERING CONSULTANTS LTD. SUCURSAL DEL PER (PEC PERU)','','',''),(17,'CONSORCIO NIVAFESTSA ENVIROMENT','','',''),(18,'CONSORCIO VIAL QUEROCOTILLO','','',''),(19,'CONSORCIO PUENTE RIO ENE','','','');
/*!40000 ALTER TABLE `contratantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratos`
--

DROP TABLE IF EXISTS `contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratos` (
  `IdContrato` int NOT NULL AUTO_INCREMENT,
  `FechaInicio` date DEFAULT NULL,
  `DisponibilidadHorario` varchar(100) DEFAULT NULL,
  `DisponibilidadViaje` char(1) DEFAULT NULL,
  `Experiencia` char(1) DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `IdEmpleado` int DEFAULT NULL,
  PRIMARY KEY (`IdContrato`),
  KEY `IdEmpleado` (`IdEmpleado`),
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratos`
--

LOCK TABLES `contratos` WRITE;
/*!40000 ALTER TABLE `contratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratosdeproyectos`
--

DROP TABLE IF EXISTS `contratosdeproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratosdeproyectos` (
  `IdContratoProyecto` int NOT NULL,
  `IdProyecto` int NOT NULL,
  `NroDocumentoProyecto` varchar(100) DEFAULT NULL,
  `IdContratante1` int NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `ImporteTotal` decimal(18,2) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `Observacion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdContratoProyecto`),
  KEY `IdProyecto` (`IdProyecto`),
  KEY `IdContratante1` (`IdContratante1`),
  CONSTRAINT `contratosdeproyectos_ibfk_1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyectos` (`IdProyecto`),
  CONSTRAINT `contratosdeproyectos_ibfk_2` FOREIGN KEY (`IdContratante1`) REFERENCES `contratantes` (`IdContratante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratosdeproyectos`
--

LOCK TABLES `contratosdeproyectos` WRITE;
/*!40000 ALTER TABLE `contratosdeproyectos` DISABLE KEYS */;
INSERT INTO `contratosdeproyectos` VALUES (1,8,'11',1,'2022-11-01','2023-11-08',10000.00,'A','proyecto no terminado debido a pago no realizado por el contratante.');
/*!40000 ALTER TABLE `contratosdeproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credenciales`
--

DROP TABLE IF EXISTS `credenciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credenciales` (
  `IdCredencial` int NOT NULL AUTO_INCREMENT,
  `Correo` varchar(200) DEFAULT NULL,
  `Clave` varchar(200) DEFAULT NULL,
  `Alias` varchar(100) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `fechacreacion` date DEFAULT NULL,
  `fechaactualizacion` date DEFAULT NULL,
  PRIMARY KEY (`IdCredencial`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credenciales`
--

LOCK TABLES `credenciales` WRITE;
/*!40000 ALTER TABLE `credenciales` DISABLE KEYS */;
INSERT INTO `credenciales` VALUES (24,'comunicación@issoma.edu.pe','audiovisual2021','correo issoma','','2023-09-01',NULL),(25,'edgar54','M@nt@ro2022','Wifi hogar','','2023-09-01',NULL),(26,'GM_Ingenieros','gm2020@net','Wifi empresa','','2023-09-01',NULL),(27,'10682483','232354','cuenta banco nacion','Banco nacion cta cta. 00-012-026633','2023-09-01',NULL),(28,'info@gmingenieros.com.pe','53123674318411','Info correo','correo empresarial gm ingenieros','2023-09-01',NULL),(29,'GMINGENIEROSYCONSULTORES@GMAIL.COM','53123674318411','','','2023-09-01',NULL),(30,'GMINGENIEROSYCONSULTORES@GMAIL.COM','53123674318411','pagalo pe','https://pagalo.pe/usuarios/sessionTerminada.action','2023-09-01',NULL),(31,'GMINGENIEROSYCONSULTORES@GMAIL.COM','53123674318411','Correo empresa gmail','activo 14.12.2022','2023-09-01',NULL),(32,'','','certicat','Certificado digital de busqueda catastral , creado por yuri cesar  http://app.sbn.gob.pe/certicat/solicitud','2023-09-01',NULL),(33,'info@gmingenieros.com.pe','18112021','senace','Link acceso : https://enlinea.senace.gob.pe/mpd/','2023-09-01',NULL),(34,'Ingresar numero dni Eagard Atanacio','Adri2016','banco continental','Banco continental BBVA EAS Banca internet actualizacion 24-11-2021','2023-09-01',NULL),(35,'administracion@gmingenieros.com.pe','admin@2022','Correo empresarial gm ingenieros 04-02-2022','','2023-09-01',NULL),(36,'info@gmingenieros.com.pe','18112021','senace','senace plataforma  Link acceso : https://enlinea.senace.gob.pe/mpd/ actualizacion 18-11-2021','2023-09-01',NULL),(37,'info@gmingenieros.com.pe','53123674318411','Correo empresarial gm ingenieros','actualizacion enero 2022','2023-09-01',NULL),(38,'GM_Ingenieros','gm2020@net','wifi oficina breña','actualizacion 24-05-2022','2023-09-01',NULL),(39,'20555841095','GM5552022','RNP-OSCE','actualizacion 14-09-2022','2023-09-01',NULL),(40,'adm0001','AFP:01032016','AFPNET','cambio de clave eas - jul23, actualizacion 01-04-2023','2023-09-01',NULL),(41,'yuriatanacioa@gmail.com','43184115312367**','correo gmail YCA','actualizacion 19-04-2022','2023-09-01',NULL),(42,'','Gm5312367','sunat','actualizacion 01-04-2023','2023-09-01',NULL),(43,'10682483','GMiv4nser - GMiva4nser','reniec','actualizacion 29-03-2023','2023-09-01',NULL),(44,'1052928','GMEA2016','BBVA - gm ingenieros','actualizacion 19-05-2023','2023-09-01',NULL),(45,'ADMIN001','GMEA2016','BBVA - gm ingenieros','codigo usuario','2023-09-01',NULL),(46,'10682483','232354','banco de la nacion','CTA. CTE. 00-012-026633','2023-09-01',NULL),(47,'dni','Adri2016','BBVA','banca intern actualizacion 24-11-2021','2023-09-01',NULL),(48,'administracion@gmingenieros.com.pe','admin@2022','Gm ingenieros','creado 04-02-2022','2023-09-01',NULL),(49,'info@gmingenieros.com.pe','18112021','senace','Link acceso : https://enlinea.senace.gob.pe/mpd/','2023-09-01',NULL),(50,'yuriatanacioa@gmingenieros.com.pe','449259445312367**','correo gmingenieros','','2023-09-01',NULL),(51,'GMINGENIEROSYCONSULTORES@GMAIL.COM','53123674318411','pagalo pe','https://pagalo.pe/usuarios/sessionTerminada.action','2023-09-01',NULL),(52,'info@gmingenieros.com.pe','18112021','SENACE','Link acceso : https://enlinea.senace.gob.pe/mpd/','2023-09-01',NULL),(53,'yuriatanacioa@hotmail.com','449259441988**','correo personal Yuri Cesar hotmail','','2023-09-01',NULL),(54,'yuriatanacioa@gmail.com','449259441988**','correo perosnal yuri gmail','','2023-09-01',NULL),(55,'ycatanacio@typsa.es','tJ1aacio','correo personal yuri typsa','','2023-09-01',NULL),(56,'GMINGENIEROS001','123456789a','sunarp','cuenta sunarp asociado a yuriatanacioa@gmail.com','2023-09-01',NULL),(57,'GMICONSULTOR001','123456789a','sunarp','correo sunarp asociado yuriatanacioa@gmail.com, actual esta usando ev.hyo 25-05-2021','2023-09-01',NULL),(58,'GMACONSULTA01','123456789a','sunarp','correo sunarp asociado a ivan.atanacio@gmail.com, sunarp cuenta para terceros','2023-09-01',NULL),(59,'GMSUNARP01','123456789a','sunarp','correo sunarp asociado a tramites.gmingenieros@hotmail.com','2023-09-01',NULL),(60,'tramites.gmingenieros@gmail.com','55584109a','hotmail para sunarp','','2023-09-01',NULL),(61,'GMINGSUNARP02','20160301a','sunarp','correo sunarp asociado a tramites20212@gmail.com','2023-09-01',NULL),(62,'tramites20212@gmail.com','46631233a','hotmail para sunarp','','2023-09-01',NULL),(63,'ycatanacio@typsa.es','GrupoTypsa$2023$','Correo para uso de proyecto santa rosa callao','Correo yuri para uso de proyecto santa rosa callao',NULL,NULL);
/*!40000 ALTER TABLE `credenciales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentasbancarias`
--

DROP TABLE IF EXISTS `cuentasbancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentasbancarias` (
  `IdCuentaBancaria` int NOT NULL AUTO_INCREMENT,
  `IdBanco` int DEFAULT NULL,
  `TipoPropietario` char(7) DEFAULT NULL,
  `Nombres` varchar(50) DEFAULT NULL,
  `NroCuenta` varchar(50) DEFAULT NULL,
  `NroCuentaInterbancaria` varchar(50) DEFAULT NULL,
  `TipoMoneda` char(1) DEFAULT NULL,
  `FechaCreacion` date DEFAULT NULL,
  PRIMARY KEY (`IdCuentaBancaria`),
  KEY `IdBanco` (`IdBanco`),
  CONSTRAINT `cuentasbancarias_ibfk_1` FOREIGN KEY (`IdBanco`) REFERENCES `bancos` (`IdBanco`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentasbancarias`
--

LOCK TABLES `cuentasbancarias` WRITE;
/*!40000 ALTER TABLE `cuentasbancarias` DISABLE KEYS */;
INSERT INTO `cuentasbancarias` VALUES (1,1,'P','KENNY','191-92174478-0-31',NULL,'s','2023-09-06'),(2,1,'P','IVAN SERGIO','191-96524364-0-55',NULL,'s','2023-09-06'),(3,1,'P','YURI CESAR','191-71091888-0-86',NULL,'s','2023-09-06'),(4,2,'P','YURI CESAR','0011-0814-0231102006','011-814-000231102006-15','s','2023-09-06'),(5,1,'P','EDGARD SICINIO','191-40013271-0-44',NULL,'s','2023-09-06'),(6,2,'P','EDGARD SICINIO','0011-0140-0200488549',NULL,'s','2023-09-06'),(7,1,'e',NULL,'192-90715681-0-98',NULL,'s','2023-09-06'),(8,5,'e',NULL,'20304312271',NULL,'s','2023-09-06'),(9,1,'p',NULL,'191-33524530-0-60',NULL,'s','2023-09-06'),(10,5,'p',NULL,'355-93465904-0-40',NULL,'s','2023-09-06'),(11,5,'p',NULL,'475-38848209-0-72',NULL,'s','2023-09-06'),(12,1,'P','ERIKSSON','191-02519147-0-91',NULL,'s','2023-09-06'),(13,1,'P','Rosa Luz','191-90366763-0-56',NULL,'s','2023-09-06'),(14,1,'P','WILSON JOEL','191-95037200-0-70',NULL,'s','2023-09-06'),(15,1,'P','MARGARITA','191-93817876-0-28',NULL,'s','2023-09-06'),(16,1,'P','ABEL ISMAEL','191-24291248-0-13',NULL,'s','2023-09-06'),(17,2,'P','EMERSON ABRAHAM','0011-0137-0200164348',NULL,'s','2023-09-06'),(18,1,'P','CELINDA IRENE','191-16665821-0-61',NULL,'s','2023-09-06'),(19,1,'P','alex -Abog.','191-95379260-0-84',NULL,'s','2023-09-06'),(20,1,'P','DONATO ARMANDO','191-38434077-0-98',NULL,'s','2023-09-06'),(21,5,'p','JUAN VICTOR','445-93497163-0-05',NULL,'s','2023-09-06'),(22,1,'P','JORGE LUIS PAC','191-99761416-0-05',NULL,'s','2023-09-06'),(23,5,'P','Julio César','310-06891149-0-48',NULL,'s','2023-09-06'),(24,1,'e','JACKELINE MAGGY','191-17100728-0-62',NULL,'s','2023-09-06'),(25,1,'P','JORGE ANDRE','191-93338715-0-28',NULL,'s','2023-09-06'),(26,3,'P','ELMER','898-3204627012','389-801-3204627010-00','s','2023-09-06'),(27,1,'P','JOSE LUIS','191-93871919-0-18',NULL,'s','2023-09-06'),(28,1,'P','JUAN CARLOS','191-93046833-0-98',NULL,'s','2023-09-06'),(29,1,'P','JORGE LUIS','192-94866484-0-28',NULL,'s','2023-09-06'),(30,1,'P','JENNY ELIZABETH','191-37372975-0-78',NULL,'s','2023-09-06'),(31,1,'p','FRANCISCO JAVIER-cad','193-38425812-0-50',NULL,'s','2023-09-06'),(32,1,'P','GERSON','191-02840423-0-13','002-191-102840423013-58','s','2023-09-06'),(33,1,'P','JESUS ISAI','191-31852697-0-39',NULL,'s','2023-09-06'),(34,2,'P','AGUSTIN GILBERTO','0011-0130-0201011105',NULL,'s','2023-09-06'),(35,1,'P','ELENA','191-98705820-0-46',NULL,'s','2023-09-06'),(36,1,'P','Gherly Yadira','191-40406240-0-82',NULL,'s','2023-09-06'),(37,1,'P','CARLOS ITAMAR','191-36645783-0-40',NULL,'s','2023-09-06'),(38,1,'P','Luis Mauricio','191-39913636-0-02',NULL,'s','2023-09-06'),(39,1,'P','ALLISON','191-40041289-0-45',NULL,'s','2023-09-06'),(40,2,'P','ALEJANDRO EFRAIN','0011-0814-0200156264','011-814-000200156264-10','s','2023-09-06'),(41,1,'P','ROSARIO','191-94301153-0-88',NULL,'s','2023-09-06'),(42,1,'P','MERIANM MILAGROS','191-94658388-0-30',NULL,'s','2023-09-06'),(43,1,'p','VICTOR FERNANDO','193-31526905-0-57',NULL,'s','2023-09-06'),(44,1,'P','LILIANA SOLEDAD','191-36095227-0-24',NULL,'s','2023-09-06'),(45,1,'P','CHRISTIAN ALEXANDER','191-95889709-0-89',NULL,'s','2023-09-06'),(46,1,'p','Daniel Enrique-Biolog','194-33768693-0-88',NULL,'s','2023-09-06'),(47,5,'P','Augusto','220-96001868-0-84',NULL,'s','2023-09-06'),(48,3,'P','Freddy','440-3211062447',NULL,'s','2023-09-06'),(49,2,'P','TONY','0011-0352-0200341540','011-352-000200341540-29','s','2023-09-06'),(50,1,'p','ANDREA CAROLINA (CADISTA-TASADOR)','193-30008778-0-95',NULL,'s','2023-09-06'),(51,1,'P','OSCAR','191-00646636-0-66',NULL,'s','2023-09-06'),(52,1,'P','José Alfred','191-33603986-0-18',NULL,'s','2023-09-06'),(53,1,'P','MICHAEL JOHNATAN-cad','193-36541801-0-09',NULL,'s','2023-09-06'),(54,1,'p','YELA KARINA','191-37501129-0-27',NULL,'s','2023-09-06'),(55,1,'P','FELICIANO ISAIAS','191-99257638-0-38',NULL,'s','2023-09-06'),(56,1,'P','MIRSA ISABEL','191-94268578-0-83',NULL,'s','2023-09-06'),(57,1,'P','NATHALY MISHELL','191-04840102-0-91',NULL,'s','2023-09-06'),(58,1,'P','KEITH ALEJANDRO','191-37832178-0-19',NULL,'s','2023-09-06'),(59,1,'P','AARON RODRIGO','191-94530408-0-59',NULL,'s','2023-09-06'),(60,5,'p','JONATHAN MARTIN','535-00227748-0-67',NULL,'s','2023-09-06'),(61,1,'P','YERLI','194-24133097-0-64',NULL,'s','2023-09-06'),(62,1,'e',NULL,'191-2367489-0-28',NULL,'s','2023-09-06'),(63,2,'e',NULL,'0011-0396-0100021778',NULL,'s','2023-09-06'),(64,2,'e',NULL,'0011-0396-01000217',NULL,'s','2023-09-06'),(65,1,'P','Kevin German','192-35698537-0-26',NULL,'s','2023-09-06'),(66,1,'P','Patricia Irene','192-92389015-0-35',NULL,'s','2023-09-06'),(67,1,'e',NULL,'194-2572043-0-31',NULL,'s','2023-09-06'),(68,1,'e',NULL,'191-2065243-0-39',NULL,'s','2023-09-06'),(69,2,'p',NULL,'0011-0976-0200066461',NULL,'s','2023-09-06'),(70,1,'e','bussines divisas Lesli escalante cardenas','193-98674991-0-05',NULL,'s','2023-09-06'),(71,1,'p','edgard sicinio','191-38985237-1-25','002-191-1389852371-20','s','2023-09-06'),(72,1,'e','maquinarias jaamsa','191-0034128-1-36','002-191-000034128136-00','s','2023-09-06'),(73,1,'p','Anthony','191-79024488-0-1','002-191-7902448801-00','s','2023-09-06'),(74,1,'p','Celeste','191-76351873-0-02',NULL,'s','2023-09-06'),(75,1,'p','Erikson','191-02519147-0-91','002-191-102519147091-000','s','2023-09-06'),(76,2,'p','Junior','194-78420779-0-06',NULL,'s','2023-09-06'),(77,1,'p','kenny Roggers','310-98570395-0-46',NULL,'s','2023-09-06'),(78,1,'p','Gabriela Arias','193-05131203-0-33',NULL,'s','2023-09-06');
/*!40000 ALTER TABLE `cuentasbancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `IdDepartamento` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Amazonas'),(2,'Áncash'),(3,'Apurímac'),(4,'Arequipa'),(5,'Ayacucho'),(6,'Cajamarca'),(7,'Callao'),(8,'Cusco'),(9,'Huancavelica'),(10,'Huánuco'),(11,'Ica'),(12,'Junín'),(13,'La Libertad'),(14,'Lambayeque'),(15,'Lima'),(16,'Loreto'),(17,'Madre de Dios'),(18,'Moquegua'),(19,'Pasco'),(20,'Piura'),(21,'Puno'),(22,'San Martín'),(23,'Tacna'),(24,'Tumbes'),(25,'Ucayali');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_asistencia`
--

DROP TABLE IF EXISTS `detalles_asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_asistencia` (
  `IdDetalleAsistencia` int NOT NULL,
  `IdAsistencia` int DEFAULT NULL,
  `IdEmpleado` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora_Entrada` time DEFAULT NULL,
  `Hora_Salida` time DEFAULT NULL,
  `Duracion` time DEFAULT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IdDetalleAsistencia`),
  KEY `IdAsistencia` (`IdAsistencia`),
  KEY `IdEmpleado` (`IdEmpleado`),
  CONSTRAINT `detalles_asistencia_ibfk_1` FOREIGN KEY (`IdAsistencia`) REFERENCES `asistencias` (`IdAsistencia`),
  CONSTRAINT `detalles_asistencia_ibfk_2` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_asistencia`
--

LOCK TABLES `detalles_asistencia` WRITE;
/*!40000 ALTER TABLE `detalles_asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `IdEmpleado` int NOT NULL,
  `IdCarrera` int DEFAULT NULL,
  `IdInstitucionEducativa` int DEFAULT NULL,
  `IdArea` int DEFAULT NULL,
  `IdFacultad` int DEFAULT NULL,
  `IdTipoEmpleado` int DEFAULT NULL,
  `IdCargo` int DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Nombres` varchar(100) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Dni` char(8) DEFAULT NULL,
  `Celular` char(9) DEFAULT NULL,
  `Distrito` varchar(50) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `CodigoEstudiante` varchar(20) DEFAULT NULL,
  `Ciclo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdEmpleado`),
  KEY `IdCarrera` (`IdCarrera`),
  KEY `IdInstitucionEducativa` (`IdInstitucionEducativa`),
  KEY `IdArea` (`IdArea`),
  KEY `IdFacultad` (`IdFacultad`),
  KEY `IdTipoEmpleado` (`IdTipoEmpleado`),
  KEY `IdCargo` (`IdCargo`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`IdCarrera`) REFERENCES `carreras` (`IdCarrera`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`IdInstitucionEducativa`) REFERENCES `institucioneseducativas` (`IdInstitucionEducativa`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`IdArea`) REFERENCES `areas` (`IdArea`),
  CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`IdFacultad`) REFERENCES `facultades` (`IdFacultad`),
  CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`IdTipoEmpleado`) REFERENCES `tiposempleados` (`IdTipoEmpleado`),
  CONSTRAINT `empleados_ibfk_6` FOREIGN KEY (`IdCargo`) REFERENCES `cargos` (`IdCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencialaboral`
--

DROP TABLE IF EXISTS `experiencialaboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencialaboral` (
  `IdExperienciaLaboral` int NOT NULL AUTO_INCREMENT,
  `Empresa` varchar(100) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `CargoAnterior` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdExperienciaLaboral`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencialaboral`
--

LOCK TABLES `experiencialaboral` WRITE;
/*!40000 ALTER TABLE `experiencialaboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `experiencialaboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultades`
--

DROP TABLE IF EXISTS `facultades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultades` (
  `IdFacultad` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdFacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultades`
--

LOCK TABLES `facultades` WRITE;
/*!40000 ALTER TABLE `facultades` DISABLE KEYS */;
/*!40000 ALTER TABLE `facultades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucioneseducativas`
--

DROP TABLE IF EXISTS `institucioneseducativas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucioneseducativas` (
  `IdInstitucionEducativa` int NOT NULL AUTO_INCREMENT,
  `Ruc` char(20) DEFAULT NULL,
  `RazonSocial` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Sede` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdInstitucionEducativa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucioneseducativas`
--

LOCK TABLES `institucioneseducativas` WRITE;
/*!40000 ALTER TABLE `institucioneseducativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `institucioneseducativas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listar_vista_comunicaciones`
--

DROP TABLE IF EXISTS `listar_vista_comunicaciones`;
/*!50001 DROP VIEW IF EXISTS `listar_vista_comunicaciones`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `listar_vista_comunicaciones` AS SELECT 
 1 AS `Id`,
 1 AS `IdPeriodo`,
 1 AS `NombreProyecto`,
 1 AS `Tipo`,
 1 AS `TipoDesc`,
 1 AS `CodDoc`,
 1 AS `Origen`,
 1 AS `Destino`,
 1 AS `Flujo`,
 1 AS `FlujoDesc`,
 1 AS `Asunto`,
 1 AS `Fecha`,
 1 AS `CodDocRespuesta`,
 1 AS `Estado`,
 1 AS `EstadoDesc`,
 1 AS `Enlace`,
 1 AS `Dias`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `IdMarca` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'generico'),(2,'Faber castell'),(3,'Layconsa'),(4,'mixtro');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `IdMarca` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'GENERICO'),(2,'DURACELL'),(3,'ESTANDAR'),(4,'ARTESCO'),(5,'MIXTO'),(6,'WARRIOR'),(7,'VINIFAN'),(8,'FABERCASTELL'),(9,'UPN'),(10,'WEX'),(11,'OVE'),(12,'GENERICOS'),(13,'LAYCONZA'),(14,'DRAGÓN'),(15,'VIKINGO'),(16,'Pilot');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos` (
  `IdModulo` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES (1,'Recursos Humanos'),(2,'Proyectos'),(3,'Compras'),(4,'pruebas');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetosestudio`
--

DROP TABLE IF EXISTS `objetosestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetosestudio` (
  `IdObjetoEstudio` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdObjetoEstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetosestudio`
--

LOCK TABLES `objetosestudio` WRITE;
/*!40000 ALTER TABLE `objetosestudio` DISABLE KEYS */;
INSERT INTO `objetosestudio` VALUES (1,'predial'),(2,'ambiental'),(3,'social'),(4,'interferencia');
/*!40000 ALTER TABLE `objetosestudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodos` (
  `IdPeriodo` int NOT NULL AUTO_INCREMENT,
  `Mes` int DEFAULT NULL,
  `Anio` int DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `Alias` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`IdPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (1,1,2023,'Enero','012023'),(2,2,2023,'Febrero','022023'),(3,3,2023,'Marzo','032023'),(4,4,2023,'Abril','042023');
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `IdProveedor` int NOT NULL AUTO_INCREMENT,
  `IdDepartamento` int NOT NULL,
  `Nombres` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono` char(20) DEFAULT NULL,
  `Ruc` char(11) DEFAULT NULL,
  PRIMARY KEY (`IdProveedor`),
  KEY `IdDepartamento` (`IdDepartamento`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`IdDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `IdProyecto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(5000) DEFAULT NULL,
  `Alias` varchar(500) DEFAULT NULL,
  `Servicio` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`IdProyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,'PROYECTO AQP - YURA','','MEJORAMIENTO A NIVEL DE AUTOPISTA Y/O PAR VIAL SECTOR 3 AREQUIPA-YURA'),(2,'PROYECTO YURA-PATAHUASI','','ESTUDIO DE PRE INVERSION A NIVEL DE FACTIBILIDAD DEL\nPROYECTO: MEJORAMIENTO A NIVEL DE AUTOPISTA Y/O PAR VIAL SECTOR 4 YURA - PATAHUASI.'),(3,'PROY. 2da. CALZADA JULIACA-PUNO-AVANCE PACRI PTE 0101020','','ESTUDIO DEFINITIVO DE LA VARIANTE DE INGENIERIA DE LA SEGUNDA CALZADA DE LA\nAUTOPISTA PUNO JULIACA, AVANCE PACRI SEGUN PROPUESTA 0101020'),(4,'REHABILITACION DEL EJE VIAL N° 1 PIURA - GUAYAQUIL (06 OBRAS - 14 PUENTES)','','PROPUESTA TECNICA ECONOMICA DEL PROYECTO REHABILITACION DEL EJE VIAL NO. 1\nPIURA-GUAYAQUIL(06 OBRAS-14 PUENTES)'),(5,'CONSTRUCCION DE PUENTES POR REEMPLAZO EN LA ZONA NORTE DEL PAIS (02 OBRAS - 12 PUENTES)','','PROPUESTA TECNICA ECONOMICA DEL PROYECTO CONSTRUCCION DE PUENTES POR\nREEMPLAZO EN LA ZONA NORTE DEL PAIS (02 OBRAS - 12 PUENTES)'),(6,'ESTUDIO DEF. VARIANTE DE ING. DE LA 2DA. CALZADA AUTOPISTA VARIANTE QAPAQ ÑAM AUTOPISTA PUNO-JLC, EXP. INDIVIDUALES, CPE, ANALISIS SEGÚN DL 1192, PROPUESTA 01010021','','ESTUDIO DEFINITIVO DE LA VARIANTE DEINGENIERIA DE LA SEGUNDA CALZADA DE LA AUTOPISTA PUNO JULIACA - EXPEDIENTES INDIVIDUALES, CPE, ANALISIS SEGÚN DL 1192'),(7,'Estudio definitivo de la variante de ingeniería de la segunda calzada de la autopista Puno Juliaca.','','Servicio de arquitectura e ingenieria'),(8,'CORREDOR VIAL APURIMAC - CUSCO TRAMO 3 SUB-TRAMO 3','','ELABORACIÓN DEL COMPONENTE DE AFECTACIONES SEGÚN DL 1192N Y MODIFICATORIAS DEL ESTUDIO DEFINITIVO PARA EL MEJORAMIENTO DEL CORREDOR VIAL APURÍMAC-CUSCO. TRAMO 3, SUBTRAMO 3'),(9,'EV. HUANCAYO','','PAC estudio definitivo para la construccion y mejoramiento de la via evitamiento de Huancayo.'),(10,'Servicio de reformulacion del estudio de pre inversion a nivel de perfil; construccion de la via de evitamiento de la ciudad de juanjui','','REFORMULACION DEL ESTUDIO DE PREINVERSION A NIVEL DE PERFIL: CONSTRUCCION DE LAVIA DE EVITAMIENTO A LA CIUDAD DE JUANJUI'),(11,'Construcción de 11 puentes de carretera en la red vial nacional, ruta PE-1NR en el tramo Tambogrande-Morropon-Chulucanas, departamento Piura.','','Estudio de plan de afectaciones y compensaciones prediales.'),(12,'Construcción de Puentes por reemplazo en Ancash','',''),(13,'Estudio de perfil y definitvamente para la rehabilitación y mejoramiento de los caminos vecinales tramo1:EMP.5N (Naranjos)-el Diamante-San Agustín-Oriente Nuevo;Tramo2:EMP.5N(Angaiza)-Vista Alegre-Ricardo palma-Buenos Aires-EMP.SM-516;Tramo 3:EMP.5N(El Porvenir)-Ramiro Prialé -Nueva esperanza.','','Estudio de mejoramiento de caminos vecinal    '),(14,'Estudio definitivo del proyecto: Mejoramiento del servicio de transitabilidad desde el puente amarillo-Cruce Bayóvar-Distrito de Olmos-Provincia de Lambayeque-Departamento de Lambayeque.','','Mejoramiento del servicio de transitibilidad desde pte. Amarillo-Cruce Bayovar.'),(15,'PROYECTO LIRCAY - LAGUNILLAS','','ESTUDIO DE PREINVERSIÓN A NIVEL DE PERFIL DEL PROYECTO DE LA CARRETERA HUANCAVELICA – EMP. PE – 3S, TRAMO: LIRCAY – LAGUNILLAS – EMP. RUTA PE – 3S'),(16,'PROYECTO PTE PALLAR - PTE CHAGUAL','','ESTUDIO DE PRE INVERSIÓN A NIVEL DE PERFIL DE LA CARRETERA PTE PALLAR – PTE CHAGUAL'),(17,'PROYECTO HYO.-IZCUCHACA','','ESTUDIO DE PREINVERSION A NIVEL DE PERFIL, CARRETERA LONGITUDINAL DE LA SIERRA, TRAMO IV, PROYECTO GE 006 – 17 HUANCAYO - IZCUCHACA'),(18,'ESTUDIO DE IMPACTO VIAL CAMPOSANTO ANCON','','ESTUDIO DE IMPACTO VIAL CAMPOSANTO ANCON'),(19,'PROYECTO PUENTE PICHARI','','Elaboracion del estudio de interferencias para el proyecto del puente Pichari.'),(20,'SERVICIO DE MONITOREO AMBIENTAL EN EL PASO A DESNIVEL DE CERRO BLANCO','','Servicio de monitoreo ambiental en el paso a desnivel de cerro blanco.'),(21,'SERVICIO DE MONITOREO AMBIENTAL 8 PUENTES','','Servicio de monitoreo ambiental 8 puentes.'),(22,'CORREDOR VIAL APURIMAC - CUSCO TRAMO 1 Y 2','','Mejoramiento del corredor vial Apurimac.'),(23,'SAN MARTIN','','SERVICIO DE ELABORACION DE 26 EXPEDIENTES Y BUSQUEDA CATASTRAL PARA EL PROYECTO QUEBRADA LEON - P008-07-2021-BESALCO-05'),(24,'OLMOS','','COMPONENTE DE IMPACTO AMBIENTAL -MEJORAMIENTO DE SERVICIO DE TRANSITIBIDAD DESDE EL PTE AMARILLO-CRUCE BAYOVAR-DIST DE OLMOS PROVINCIA DE LAMBAYEQUE DPT DE LAMBAYEQUE'),(25,'Mejoramiento de los jirones Oyón, Iquitos, Víctor Andrés ','','Mejoramiento de los jirones Oyón, Iquitos, Víctor Andrés.'),(26,'ELABORACIÓN DEL EXPEDIENTE TÉCNICO PARA LA EVALUACIÓN Y TRATAMIENTO DE LOS SECTORES CRÍTICOS DE LA CARRETERA: QUINUA – SAN FRANCISCO, TRAMO 2: KM. 78+500 (CHALHUAMAYO) – KM. 172+420 (SAN FRANCISCO) ','','ESTUDIO DE IMPACTO Y MONITOREO AMBIENTAL PARA LOS SECTORES CRITICOS EN CARRETERA:QUINUA- SAN FRANCISCO '),(27,'PROYECTO CUMBIL - CHOTANO','','Estudio de afectaciones Prediales'),(28,'Estudio definitivo para la rehabilitación y mejoramiento de la carretera empalme ruta AN111-Huamnin-Progreso-Poque-Llata-Cochapata (Túnal Taytamayo)- Nuevas Flores-Quivilla-Tingo Chico  ','','Estudio para la rehabilitacion y mejora de carretera'),(29,'Estudio de preinversion a nivel de perfil de la carretera PE-5NC, nuevo Siasme-Saramiriza','','Estudio de afectaciones prediales para el proyecto; estudio de pre inversión a nivel  de perfil de la carretera nuevo Siasme-Saramiriza.'),(30,'Construcción de 11 puentes en la red víal nacional, ruta PE-1NR en el tramo Tambogrande hasta Puente la Peña km 60+000.','','Estudio de afectaciones prediales'),(32,'Construcción del Puente Nación ashánincas y Accesos, Ubicado sobre el Río Ene en la Red Vial Nacional, Ruta PE-28C, Provincia de Satipo, Región Junín.','','Puente Ashaninca'),(33,'Mejoramiento y construccion de la carretera Jenaro Herrera - Colonia Angamos (Frontera con Brasil) , distrito  de Jenaro Herrera-Provincia de Requeña - Region Loreto','','Proyecto Jenaro Herrera'),(34,'Creacion del puento Alto Chira y Accesos, distrito de Querocotillo - Provincia de Sullana- Piura','Proyecto Puente Alto chira',''),(35,'Estudio Definitivo para la culminación de las Obras de la Carretera Longitudinal de la Sierra (PE-3N), Tramos: San Marcos- Cajabamba, Cochabamba- Chota, Hualgayoc- DV. Yanacocha, en el Departamento de Cajamarca y el Sector: Huamachuco- Sacsacocha- Puente Pallar en el Departamento de La Libertad','','');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectoxcontratante`
--

DROP TABLE IF EXISTS `proyectoxcontratante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectoxcontratante` (
  `IdProyectoxContratante` int NOT NULL AUTO_INCREMENT,
  `IdProyecto` int NOT NULL,
  `IdContratante` int NOT NULL,
  PRIMARY KEY (`IdProyectoxContratante`),
  KEY `IdProyecto` (`IdProyecto`),
  KEY `IdContratante` (`IdContratante`),
  CONSTRAINT `proyectoxcontratante_ibfk_1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyectos` (`IdProyecto`),
  CONSTRAINT `proyectoxcontratante_ibfk_2` FOREIGN KEY (`IdContratante`) REFERENCES `contratantes` (`IdContratante`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectoxcontratante`
--

LOCK TABLES `proyectoxcontratante` WRITE;
/*!40000 ALTER TABLE `proyectoxcontratante` DISABLE KEYS */;
INSERT INTO `proyectoxcontratante` VALUES (1,1,11),(2,2,11),(3,3,11),(4,4,11),(5,5,11),(6,6,11),(7,7,11),(8,8,1),(9,9,2),(10,10,3),(11,11,4),(12,12,5),(13,13,15),(14,14,15),(15,15,12),(16,16,12),(17,17,9),(18,18,14),(19,19,8),(20,20,7),(21,21,7),(22,22,13),(23,23,15),(24,24,15),(25,25,6),(26,26,10),(27,27,10),(28,28,12),(29,29,12),(30,30,12),(31,35,16),(32,33,17),(33,34,18),(34,32,19);
/*!40000 ALTER TABLE `proyectoxcontratante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectoxobjetoestudio`
--

DROP TABLE IF EXISTS `proyectoxobjetoestudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectoxobjetoestudio` (
  `IdProyectoxObjectoEstudio` int NOT NULL AUTO_INCREMENT,
  `IdProyecto` int NOT NULL,
  `IdObjetoEstudio` int NOT NULL,
  `Estado` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`IdProyectoxObjectoEstudio`),
  KEY `IdProyecto` (`IdProyecto`),
  KEY `proyectoxobjetoestudio_ibfk_2` (`IdObjetoEstudio`),
  CONSTRAINT `proyectoxobjetoestudio_ibfk_1` FOREIGN KEY (`IdProyecto`) REFERENCES `proyectos` (`IdProyecto`),
  CONSTRAINT `proyectoxobjetoestudio_ibfk_2` FOREIGN KEY (`IdObjetoEstudio`) REFERENCES `objetosestudio` (`IdObjetoEstudio`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectoxobjetoestudio`
--

LOCK TABLES `proyectoxobjetoestudio` WRITE;
/*!40000 ALTER TABLE `proyectoxobjetoestudio` DISABLE KEYS */;
INSERT INTO `proyectoxobjetoestudio` VALUES (1,1,1,'S'),(2,2,1,'S'),(3,3,1,'S'),(4,4,1,'S'),(5,5,1,'S'),(6,6,1,'S'),(7,7,1,'S'),(8,8,1,'S'),(9,8,2,'S'),(10,8,3,'S'),(11,9,1,'S'),(12,10,1,'S'),(13,11,1,'S'),(14,12,1,'S'),(15,13,1,'S'),(16,14,1,'S'),(17,15,1,'S'),(18,16,1,'S'),(19,17,1,'S'),(20,18,1,'S'),(21,19,4,'S'),(22,20,2,'S'),(23,21,2,'S'),(24,22,1,'S'),(25,22,2,'S'),(26,22,3,'S'),(27,23,1,'S'),(28,24,1,'S'),(29,25,2,'S'),(30,26,1,'S'),(31,27,1,'S'),(32,28,1,'S'),(33,29,1,'S'),(34,30,1,'S'),(35,2,2,'N'),(36,2,3,'N'),(37,2,4,'N'),(38,1,2,'N'),(39,1,3,'N'),(40,1,4,'N'),(41,3,2,'N'),(42,3,3,'N'),(43,3,4,'N'),(44,4,2,'N'),(45,4,3,'N'),(46,4,4,'N'),(47,5,2,'N'),(48,5,3,'N'),(49,5,4,'N'),(50,6,2,'N'),(51,6,3,'N'),(52,6,4,'N'),(53,7,2,'N'),(54,7,3,'N'),(55,7,4,'N'),(56,8,4,'N'),(57,9,2,'N'),(58,9,3,'N'),(59,9,4,'N'),(60,10,2,'N'),(61,10,3,'N'),(62,10,4,'N'),(63,11,2,'N'),(64,11,3,'N'),(65,11,4,'N'),(66,12,2,'N'),(67,12,3,'N'),(68,12,4,'N'),(69,13,2,'N'),(70,13,3,'N'),(71,13,4,'N'),(72,14,2,'N'),(73,14,3,'N'),(74,14,4,'N'),(75,15,2,'N'),(76,15,3,'N'),(77,15,4,'N'),(78,16,2,'N'),(79,16,3,'N'),(80,16,4,'N'),(81,17,2,'N'),(82,17,3,'N'),(83,17,4,'N'),(84,18,2,'N'),(85,18,3,'N'),(86,18,4,'N'),(87,19,1,'N'),(88,19,2,'N'),(89,19,3,'N'),(90,20,1,'N'),(91,20,3,'N'),(92,20,4,'N'),(93,21,1,'N'),(94,21,3,'N'),(95,21,4,'N'),(96,22,4,'N'),(97,23,2,'N'),(98,23,3,'N'),(99,23,4,'N'),(100,24,2,'N'),(101,24,3,'N'),(102,24,4,'N'),(103,25,1,'N'),(104,25,3,'N'),(105,25,4,'N'),(106,26,2,'N'),(107,26,3,'N'),(108,26,4,'N'),(109,27,2,'N'),(110,27,3,'N'),(111,27,4,'N'),(112,28,2,'N'),(113,28,3,'N'),(114,28,4,'N'),(115,29,2,'N'),(116,29,3,'N'),(117,29,4,'N'),(118,30,2,'N'),(119,30,3,'N'),(120,30,4,'N');
/*!40000 ALTER TABLE `proyectoxobjetoestudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reciboshonorarios`
--

DROP TABLE IF EXISTS `reciboshonorarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reciboshonorarios` (
  `IdReciboHonorario` int NOT NULL AUTO_INCREMENT,
  `NroRecibo` varchar(20) DEFAULT NULL,
  `Ruc` char(11) DEFAULT NULL,
  `Nombres` varchar(100) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `Distrito` varchar(50) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `FormaPago` varchar(50) DEFAULT NULL,
  `Concepto` varchar(100) DEFAULT NULL,
  `ImporteNeto` decimal(18,2) DEFAULT NULL,
  `RetencionIr` decimal(18,2) DEFAULT NULL,
  `ImporteTotal` decimal(18,2) DEFAULT NULL,
  `FechaEmision` date DEFAULT NULL,
  PRIMARY KEY (`IdReciboHonorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reciboshonorarios`
--

LOCK TABLES `reciboshonorarios` WRITE;
/*!40000 ALTER TABLE `reciboshonorarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `reciboshonorarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdocumentos`
--

DROP TABLE IF EXISTS `tiposdocumentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdocumentos` (
  `IdTipoDocumento` int NOT NULL AUTO_INCREMENT,
  `IdModulo` int DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdTipoDocumento`),
  KEY `IdModulo` (`IdModulo`),
  CONSTRAINT `tiposdocumentos_ibfk_1` FOREIGN KEY (`IdModulo`) REFERENCES `modulos` (`IdModulo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdocumentos`
--

LOCK TABLES `tiposdocumentos` WRITE;
/*!40000 ALTER TABLE `tiposdocumentos` DISABLE KEYS */;
INSERT INTO `tiposdocumentos` VALUES (1,2,'Carta'),(2,2,'Correo'),(3,2,'Llamada'),(4,3,'Factura'),(5,3,'Boleta');
/*!40000 ALTER TABLE `tiposdocumentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposempleados`
--

DROP TABLE IF EXISTS `tiposempleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposempleados` (
  `IdTipoEmpleado` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdTipoEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposempleados`
--

LOCK TABLES `tiposempleados` WRITE;
/*!40000 ALTER TABLE `tiposempleados` DISABLE KEYS */;
INSERT INTO `tiposempleados` VALUES (1,'Por definir...'),(2,'Estable'),(3,'Practicante'),(4,'pruebas');
/*!40000 ALTER TABLE `tiposempleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transferenciasbancarias`
--

DROP TABLE IF EXISTS `transferenciasbancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transferenciasbancarias` (
  `IdTransferenciaBancaria` int NOT NULL AUTO_INCREMENT,
  `IdPeriodo` int DEFAULT NULL,
  `NroOperacion` varchar(20) DEFAULT NULL,
  `CuentaOrigen` char(7) DEFAULT NULL,
  `CuentaDestino` char(7) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`IdTransferenciaBancaria`),
  KEY `IdPeriodo` (`IdPeriodo`),
  CONSTRAINT `transferenciasbancarias_ibfk_1` FOREIGN KEY (`IdPeriodo`) REFERENCES `periodos` (`IdPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transferenciasbancarias`
--

LOCK TABLES `transferenciasbancarias` WRITE;
/*!40000 ALTER TABLE `transferenciasbancarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferenciasbancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidadmedida`
--

DROP TABLE IF EXISTS `unidadmedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidadmedida` (
  `idunidadmedida` int NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idunidadmedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidadmedida`
--

LOCK TABLES `unidadmedida` WRITE;
/*!40000 ALTER TABLE `unidadmedida` DISABLE KEYS */;
INSERT INTO `unidadmedida` VALUES (1,'talla'),(2,'peso');
/*!40000 ALTER TABLE `unidadmedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `IdUsuario` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Luis','123456789'),(2,'gmingenieros','123456789');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `verproductosxalmacen`
--

DROP TABLE IF EXISTS `verproductosxalmacen`;
/*!50001 DROP VIEW IF EXISTS `verproductosxalmacen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `verproductosxalmacen` AS SELECT 
 1 AS `IdArticulo`,
 1 AS `nombrearticulo`,
 1 AS `anio`,
 1 AS `mes`,
 1 AS `cantidad`,
 1 AS `idalmacen`,
 1 AS `nombrealmacen`,
 1 AS `movimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `viaticos`
--

DROP TABLE IF EXISTS `viaticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viaticos` (
  `IdViatico` int NOT NULL AUTO_INCREMENT,
  `IdEmpleado` int DEFAULT NULL,
  `IdPeriodo` int DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Pasaje` decimal(18,2) DEFAULT NULL,
  `Menu` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`IdViatico`),
  KEY `IdEmpleado` (`IdEmpleado`),
  KEY `IdPeriodo` (`IdPeriodo`),
  CONSTRAINT `viaticos_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleados` (`IdEmpleado`),
  CONSTRAINT `viaticos_ibfk_2` FOREIGN KEY (`IdPeriodo`) REFERENCES `periodos` (`IdPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viaticos`
--

LOCK TABLES `viaticos` WRITE;
/*!40000 ALTER TABLE `viaticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `viaticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gmingenieros'
--

--
-- Dumping routines for database 'gmingenieros'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_areas`(
	IN xId int, IN xDescripcion VARCHAR(100)
	)
BEGIN
	UPDATE areas SET Descripcion=xDescripcion
	where Id=xId;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_articulos`(
IN xId int,
IN xDescripcion VARCHAR(100),
IN xIdCategorias int,
in xidmarca int,
in xcaracteristicas varchar(100),
in xcantidad int
)
BEGIN
UPDATE articulos SET 
				descripcion = xDescripcion, 
                IdCategorias = xIdCategorias,
                IdMarca = xidmarca,
                caracteristicas = xcaracteristicas,
                cantidad = xcantidad
WHERE IdArticulo = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_asistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_asistencia`(
xId INT,
xHora CHAR(8)
)
BEGIN
	UPDATE asistencias SET Hora = xHora WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_cabeceracomprobante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cabeceracomprobante`(in xNumeroComprobante varchar(20), in xFechaEmision varchar (10), 
in xFechaVencimiento varchar (10), 
in xSubTotal decimal (18,2), 
in xIgv decimal(18,2),in xTotal decimal(18,2), 
in xIdProveedores int,in xIdTipoDocumento int)
BEGIN
update cabeceracomprobante set 
FechaEmision=STR_TO_DATE(xFechaEmision, '%d/%m/%Y'),
FechaVencimiento=STR_TO_DATE(xFechaVencimiento, '%d/%m/%Y'),
SubTotal=xSubTotal, 
Igv=xIgv,
Total=xTotal, 
IdProveedores=xIdProveedores, 
IdTipoDocumento=xIdTipoDocumento
where NumeroComprobante=xNumeroComprobante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_cargos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cargos`(
IN xId int, IN xDescripcion VARCHAR(100)
)
BEGIN
UPDATE cargos SET Descripcion=xDescripcion
where Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_carreras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_carreras`(
IN xId int, IN xDescripcion VARCHAR(100)
)
BEGIN
UPDATE carreras SET Descripcion=xDescripcion
where Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_categorias`(
IN xId int, IN xDescripcion VARCHAR(100)
)
BEGIN
UPDATE categorias SET descripcion=xDescripcion
where id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_comunicacion`(parId int , parIdPeriodo int, parNomProy varchar(100), parTipo int, parCodDoc varchar(100), parOrigen varchar(100), parDestino varchar(100), parFlujo int,
parAsunto varchar(100), parFecha date, parCodDocRespuesta varchar(100), parEstado int, parEnlace varchar(100))
BEGIN
update comunicaciones 
set Nombre = parNomProy, 
Tipo = parTipo, CodDoc = parCodDoc, Origen = parOrigen, Destino = parDestino, 
Flujo = parFlujo, Asunto = parAsunto, Fecha = parFecha, 
CodDocRespuesta = parCodDocRespuesta,  
Estado = parEstado, Enlace = parEnlace
where ID = parId 
and  IdPeriodo = parIdPeriodo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_contactos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_contactos`(IN `xId` int, IN `xNombre` VARCHAR(100), IN `xFechaNacimiento` VARCHAR(10), IN `xPersonasRelacionadas` VARCHAR(100), IN `xEmpresa` VARCHAR(100),IN `xCuentas` VARCHAR(100),IN `xClave` VARCHAR(100), IN `xCargo` VARCHAR(100), IN `xCorreo` VARCHAR(100), IN `xTelefono` CHAR(9), IN `xDepartamento` VARCHAR(100), IN `xDireccion` VARCHAR(100), IN `xNotas` VARCHAR(200))
BEGIN
update contactos set 
Nombre=xNombre, FechaNacimiento=xFechaNacimiento, 
PersonasRelacionadas=xPersonasRelacionadas,
Empresa=xEmpresa,Cuentas=xCuentas,Clave=xClave, Cargo=xCargo, 
Correo=xCorreo, Telefono=xTelefono, 
Departamento=xDepartamento, Direccion=xDireccion, Notas=xNotas
where IdContacto=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_contratoxproyectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_contratoxproyectos`(in xIdContratoProyecto int, 
in xIdProyecto int,
in xNroDocumentoProyecto varchar(100), 
in xIdContratante1 int, 
in xFechaInicio date, 
in xFechaFin date, 
in xImporteTotal decimal(18,2), 
in xEstado char(1), 
in xObservacion varchar(200))
BEGIN
update contratosdeproyectos
set IdProyecto = xIdProyecto,
NroDocumentoProyecto= xNroDocumentoProyecto,
IdContratante1= xIdContratante1,

FechaInicio = xFechaInicio,
FechaFin = xFechaFin,
ImporteTotal = xImporteTotal,

Estado = xEstado,
Observacion=xObservacion
where  IdContratoProyecto = xIdContratoProyecto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_credencial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_credencial`(in xidcredencial int,in xcorreo varchar(200), 
										   in xclave varchar(200), xalias varchar(100), 
                                           xdescripcion varchar(200))
BEGIN
	update credenciales 
    set correo = xcorreo, clave = xclave, alias = xalias, descripcion = xdescripcion
    where idcredencial = xidcredencial;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cuenta`(
IN xId int,
    IN xTipoPropietario CHAR(7),
    IN xNombres VARCHAR(50),
    IN xBanco INT,
	IN xCCC VARCHAR(50),
    IN xCCI VARCHAR(50),
    IN xTipoMoneda CHAR(1)
)
BEGIN
	update cuentasbancarias
    set  TipoPropietario=xTipoPropietario,
    IdBanco = xBanco,
    Nombres = xNombres,
    NroCuenta = xCCC,
    NroCuentaInterbancaria = xCCI,
    TipoMoneda = xTipoMoneda
    where IdCuentabancaria = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_datos_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_datos_empleado`(
IN xId int, IN xApellidos VARCHAR(100), IN xNombres VARCHAR(100), IN xFechaNacimiento VARCHAR(10), IN xCorreo VARCHAR(100), IN xDni CHAR(8), IN xCelular CHAR(9), IN xDistrito VARCHAR(50), IN xDireccion VARCHAR(100), IN xIdArea int, IN xIdCargo int, IN xIdTipoEmpleado int
)
BEGIN
UPDATE empleados SET Apellidos = xApellidos,
Nombres = xNombres,
FechaNacimiento = STR_TO_DATE(xFechaNacimiento, '%d/%m/%Y'),
Correo = xCorreo,
Dni = xDni,
Celular = xCelular,
Distrito = xDistrito,
Direccion = xDireccion,
IdArea = xIdArea,
IdCargo = xIdCargo,
IdTipoEmpleado = xIdTipoEmpleado
WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_detalle_asistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_detalle_asistencia`(
    IN xId_detalle INT,
    IN xHora CHAR(8)
)
BEGIN
    -- Declaramos las variables
    DECLARE v_hora_entrada TIME;
    DECLARE v_hora_salida TIME;
    DECLARE v_duracion TIME;

    -- Insertarmos los valores correspondientes
    -- en la variables creadas
    SELECT Hora_entrada, Hora_salida, v_duracion
    INTO v_hora_entrada, v_hora_salida, v_duracion
    FROM detalle_asistencia
    WHERE Id = xId_detalle;

    -- Convertir xHora a TIME
    SET xHora = STR_TO_DATE(xHora, '%H:%i:%s');

    IF v_hora_salida IS NULL THEN
        -- Actualizar la hora de salida
        IF xHora < v_hora_entrada THEN
            -- Cambiar posicion de hora de entrada y salida
            UPDATE detalle_asistencia
            SET Hora_entrada = xHora,
                Hora_salida = v_hora_entrada,
                Duracion = TIMEDIFF(v_hora_entrada, xHora)
            WHERE Id = xId_detalle;
        ELSE
            -- Actualizar hora de salida y calcular duracion
            UPDATE detalle_asistencia
            SET Hora_salida = xHora,
                Duracion = TIMEDIFF(xHora, v_hora_entrada)
            WHERE Id = xId_detalle;
        END IF;
    ELSE
        -- Actualizar hora de entrada y recalcular la duracion
        UPDATE detalle_asistencia
        SET Hora_entrada = xHora,
            Duracion = TIMEDIFF(v_hora_salida, xHora)
        WHERE Id = xId_detalle;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_empleados`(
IN xId int,
IN xApellidos VARCHAR(100),
IN xNombres VARCHAR(100),
IN xFechaNacimiento DATE,
IN xCorreo VARCHAR(100),
IN xDni CHAR(8),
IN xCelular CHAR(9),
IN xDireccion VARCHAR(100),
IN xCodigoEstudiante VARCHAR(100),
IN xIdCarrera int,
IN xIdCiclo int,
IN xIdInstitucionEducativa int,
IN xIdArea int,
IN xIdFacultad int,
IN xIdTipoEmpleado int,
IN xIdCargo int
)
BEGIN
UPDATE empleados SET Apellidos= xApellidos, Nombres=xNombres, Correo=xCorreo, Dni=xDni, Celular=xCelular, Direccion=xDireccion, IdCarrera=xIdCarrera, IdCiclo=xIdCiclo, IdInstitucionEducativa=xIdInstitucionEducativa, IdArea=xIdArea, IdFxultad=xIdFxultad, 
IdTipoEmpleado=xIdTipoEmpleado, IdCargo=xIdCargo
WHERE Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_facultades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_facultades`(
IN xId int,
IN xDescripcion VARCHAR(100)
)
BEGIN
UPDATE facultades SET Descripcion = xDescripcion
WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_instituciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_instituciones`(
IN xId int,
IN xRuc CHAR(20),
IN xRazonSocial VARCHAR(100),
IN xDireccion VARCHAR(100),
IN xSede VARCHAR(100)
)
BEGIN
UPDATE institucioneseducativas
SET Ruc = xRuc, RazonSocial = xRazonSocial, Direccion = xDireccion, Sede = xSede
WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_modulo`(IN `xId` int, IN `xDescripcion` VARCHAR(100))
BEGIN
UPDATE modulo SET Descripcion=xDescripcion
where Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_observacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_observacion`(
IN xId INT,
IN xObservacion VARCHAR(255)
)
BEGIN
	UPDATE detalle_asistencia
    SET Observaciones = xObservacion
    WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_periodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_periodos`(
IN xId int,
IN xDescripcion VARCHAR(100)
)
BEGIN
UPDATE periodos SET Descripcion = xDescripcion
WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_proveedores`(xId int, xNombres varchar (100), xDireccion varchar (100), 
xCorreo varchar(100), xTelefono char(9), xRuc char(11))
BEGIN
update proveedores set Nombres=xNombres
, Direccion=xDireccion,
Correo=xCorreo, 
Telefono=xTelefono, 
Ruc=xRuc
where Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_proyectoxobjetoestudio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_proyectoxobjetoestudio`(in xidproyecto int, 
in xidobjetoestudio int, in xestado varchar(1))
BEGIN
	update proyectoxobjetoestudio  
    set estado = xestado
    where idproyecto = xidproyecto
    and idobjetoestudio = xidobjetoestudio;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_recibo_honorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_recibo_honorario`(
    IN xId int,
    IN xNroRecibo VARCHAR(20),
    IN xRuc CHAR(11),
    IN xNombres VARCHAR(100),
    IN xApellidos VARCHAR(100),
    IN xDistrito VARCHAR(50),
    IN xDireccion VARCHAR(100),
    IN xFormaPago VARCHAR(50),
    IN xConcepto VARCHAR(100),
    IN xImporteNeto DECIMAL(18, 2),
    IN xRetencionIr DECIMAL(18, 2),
    IN xImporteTotal DECIMAL(18, 2),
    IN xFechaEmision CHAR(10)
)
BEGIN
    UPDATE reciboshonorarios
    SET 
        NroRecibo = xNroRecibo   ,
        Ruc = xRuc  , 
        Nombres = xNombres  ,
        Apellidos = xApellidos  ,
        Distrito = xDistrito  ,
        Direccion = xDireccion  ,
        FormaPago = xFormaPago  ,
        Concepto = xConcepto  ,
        ImporteNeto = xImporteNeto  ,
        RetencionIr = xRetencionIr  ,
        ImporteTotal = xImporteTotal  ,
        FechaEmision = STR_TO_DATE(xFechaEmision, '%d/%m/%Y')  
    WHERE
        Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_tipodocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_tipodocumento`(IN `xId` int, IN `xDescripcion` VARCHAR(100), IN `xIdModulo` int)
BEGIN
UPDATE tiposdocumentos SET  Descripcion = xDescripcion,
 IdModulo = xIdModulo
WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_tipoempleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_tipoempleado`(IN `xId` int, IN `xDescripcion` VARCHAR(100))
BEGIN
UPDATE tiposempleados SET 
Descripcion=xDescripcion
where IdTipoEmpleado=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_transferencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_transferencia`(
xId INT,
xIdPeriodo int,
xNroOperacion VARCHAR(20),
xCuentaOrigen CHAR(7),
xCuentaDestino CHAR(7),
xFecha CHAR(10)
)
BEGIN
    UPDATE transferenciasbancarias 
    SET 
        IdPeriodo = xIdPeriodo, 
        NroOperacion = xNroOperacion,
        CuentaOrigen = xCuentaOrigen,
        CuentaDestino = xCuentaDestino,
        Fecha = STR_TO_DATE(xFecha, '%d/%m/%Y')
    WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_viaticos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_viaticos`(
IN xId INT,
IN xDescripcion VARCHAR(100),
IN xPasaje DECIMAL(18, 2),
IN xMenu DECIMAL(18, 2),
IN xIdEmpleado int,
IN xIdPeriodo int
)
BEGIN
	UPDATE viaticos SET Descripcion = xDescripcion,
    Pasaje = xPasaje,
    Menu = xMenu,
    IdEmpleado = xIdEmpleado,
    IdPeriodo = xIdPeriodo
    WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consulta_areas_cargos_tipos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_areas_cargos_tipos`(
xArea VARCHAR(100),
xCargo VARCHAR(100),
xTipo VARCHAR(100)
)
BEGIN
	SELECT a.Id AS Id_area, c.Id AS Id_cargo, t.Id AS Id_tipo
    FROM areas a, cargos c, tiposempleados t
    WHERE a.Descripcion = xArea
    AND c.Descripcion = xCargo
    AND t.Descripcion = xTipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consulta_inst_facu_carr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_inst_facu_carr`(
xIns VARCHAR(100),
xFac VARCHAR(100),
xCar VARCHAR(100)
)
BEGIN
	SELECT i.Id AS Id_ins, f.Id AS Id_fac, c.Id AS Id_car
    FROM institucioneseducativas i, facultades f, carreras c
    WHERE i.RazonSocial = xIns
    AND f.Descripcion = xFac
    AND c.Descripcion = xCar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_areas`(
	IN xId int
	)
BEGIN
	DELETE FROM areas WHERE Id= xId;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_articulos`(
IN xId int
)
BEGIN
DELETE FROM articulos WHERE IdArticulo=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_cabeceracomprobante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cabeceracomprobante`(in xNumeroComprobante varchar (20))
BEGIN
delete from cabeceracomprobante 
where NumeroComprobante=xNumeroComprobante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_cargos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cargos`(
IN xId int
)
BEGIN
DELETE FROM cargos WHERE Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_carreras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_carreras`(
IN xId int
)
BEGIN
DELETE FROM carreras where Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_categorias`(
IN xId int
)
BEGIN
DELETE FROM categorias WHERE id= xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_comunicacion`(parId int, parIdPeriodo int)
BEGIN
delete from comunicaciones where Id = parId and IdPeriodo = parIdPeriodo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_contacto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_contacto`(IN `xId` int)
BEGIN
delete from contactos  where IdContacto=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_cuenta`(
	IN xId int
)
BEGIN
 DELETE FROM cuentasbancarias WHERE IdCuentaBancaria = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_empleados`(
IN xId int
)
BEGIN
DELETE FROM empleados WHERE Id= xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_facultades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_facultades`(
IN xId int
)
BEGIN
DELETE FROM facultades WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_instituciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_instituciones`(
IN xId int
)
BEGIN
DELETE FROM institucioneseducativas
WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_modulo`(IN `xId` int)
BEGIN
DELETE FROM modulo WHERE Id= xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_periodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_periodos`(
IN xId int
)
BEGIN
DELETE FROM periodos WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_proveedores`(xId int)
BEGIN
delete from proveedores where Id=xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_recibo_honorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_recibo_honorario`(
IN xId int
)
BEGIN
	DELETE FROM reciboshonorarios WHERE Id = xId  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_tipodocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_tipodocumento`(IN `xId` int)
BEGIN
DELETE FROM tiposdocumentos WHERE Id= xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_tipoempleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_tipoempleado`(IN `xId` int)
BEGIN
DELETE FROM tiposempleados WHERE IdTipoEmpleado= xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_transferencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_transferencia`(
xId INT
)
BEGIN
	DELETE FROM transferenciasbancarias
    WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_viaticos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_viaticos`(
IN xId INT
)
BEGIN
DELETE FROM viaticos WHERE Id = xId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_codigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_codigo`(
IN tabla VARCHAR(50),
IN prefijo VARCHAR(10),
IN longitud INT,
OUT codigo_generado VARCHAR(20)
)
BEGIN
	DECLARE ultimo_numero INT DEFAULT 0;
    SET @tabla = tabla;
    SET @sql = CONCAT('SELECT COUNT(*) INTO @ultimo_numero FROM ', @tabla);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    IF (@ultimo_numero = 0) THEN
        SET codigo_generado = CONCAT(prefijo, LPAD(1, longitud - LENGTH(prefijo), '0'));
    ELSE
        SET @sql = CONCAT('SELECT MAX(Id) INTO @ultimo_codigo FROM ', @tabla);
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET codigo_generado = CONCAT(prefijo, LPAD(RIGHT(@ultimo_codigo, LENGTH(@ultimo_codigo) - LENGTH(prefijo)) + 1, longitud - LENGTH(prefijo), '0'));
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_codigocomunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_codigocomunicacion`()
BEGIN
-- asignar el prefijo para el codigo
set @prefijo = 'CG';

-- obtener la cantidad de registro de la tabla
set  @cantidadRegistros = (select count(*) from comunicaciones limit 1);

-- se obtiene el ultimo, en caso de no tener registors en la tabla asignar CG0000, si no CG00001
set @ultimocodigo = ( case when @cantidadRegistros = 0 then  'CG0000' else (select Id from comunicaciones order by Id desc limit 1) end);
 
-- retirar el prefijo del codigo CF0001 obtenido a traves de a consulta
-- el ultimo codigo ingresado convertir a enter y sumar en 1 para obtener el siguiente codigo.
set @correlativo = convert( substring(@ultimocodigo,3,4), signed) + 1 ;
-- 1

-- completar con ceros segun la longitud del correlativo
set @ceros = repeat('0', 4-length(@correlativo)); -- 00
-- 000

-- concatenear las variables
--  A , 00, 11 => A0011
select concat(@prefijo,@ceros, @correlativo);
-- CG0001

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_codigoentero` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_codigoentero`(in tabla varchar(200),out codigo_generado int)
BEGIN

	
set @querydinamico = '';
    set @columnaId = '';
    set @querydinamico = concat('select column_name into @columnaId from information_schema.statistics  where table_schema = ',
    '"gmingenieros"', ' and table_name=', '"',tabla,'"', ' and index_name=', '"primary"');
    
    PREPARE stmt FROM @querydinamico;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    
    
    /*
	set @cantidadregistros = 0;
    set @querycantregistros = '';
    set @querycantregistros = concat('select count(', @columnaId, ') into  @cantidadregistros  from ', @tabla, ' limit 1');
    prepare stmt from  @querycantregistros;
    execute stmt;
    deallocate prepare stmt;
    select @cantidadregistros;
    */
    set @correlativo = 0;
    set @querycorrelativo = '';
    set @querysiguientecorrelativo = concat('select (ifnull(max(', @columnaId, '),0) + 1 ) into @correlativo  from ', tabla, ' limit 1');
    prepare stmt from  @querysiguientecorrelativo;
    execute stmt;
    deallocate prepare stmt;    
	
    
    
    set codigo_generado = @correlativo;
    /*set codigo_generado =  @correlativo;*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_codigoenterocontactos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_codigoenterocontactos`(out codigo_generado int  )
BEGIN
	set @cantidadregistros = 0;
    set @cantidadregistros = (select count(IdContacto) from contactos limit 1);
    set @correlativo = 0;
    if(@cantidadregistros  = 0) then
		set @correlativo = 1;
        else
        set @correlativo =  (select  isnull(max(IdContacto)) + 1 from contactos limit 1);
    End if;
    set codigo_generado =  @correlativo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generar_detalle_asistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `generar_detalle_asistencia`()
BEGIN
-- Generar el detalle a partir de las asistencias existentes
INSERT INTO detalles_asistencia (Id_asistencia, Id_empleado, Fecha, Hora_entrada, Hora_salida, Duracion)
	SELECT 
	  MIN(a.Id) AS Id_asistencia,
	  e.Id AS Id_empleado,
	  a.Fecha,
	  CASE 
		WHEN COUNT(*) > 1 THEN MIN(a.Hora) 
		ELSE MIN(a.Hora)
	  END AS Entrada,
	  CASE 
		WHEN COUNT(*) > 1 THEN MAX(a.Hora) 
		ELSE NULL
	  END AS Salida,
	  TIMEDIFF(
		CASE 
		  WHEN COUNT(*) > 1 THEN MAX(a.Hora) 
		  ELSE NULL
		END,
		CASE 
		  WHEN COUNT(*) > 1 THEN MIN(a.Hora) 
		  ELSE MIN(a.Hora)
		END
	  ) AS Duracion
	FROM asistencias a 
	INNER JOIN empleados e ON a.Dni = e.Dni
	WHERE a.Procesado = 'N'
	GROUP BY e.Id, a.Fecha;

	-- Actualiza los registros procesados
	UPDATE asistencias SET Procesado = 'S' WHERE Procesado = 'N';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_areas`(
IN xId int, IN xDescripcion VARCHAR(100)
)
BEGIN
INSERT INTO areas VALUES ( xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_articulos`(
IN xId int,
IN xDescripcion VARCHAR(100),
IN xIdCategorias int,
in xidmarca int,
in xcaracteristicas varchar(100),
in xcantidad int
)
BEGIN
INSERT INTO articulos(IdArticulo, IdCategoria, IdMarca, caracteristicas, descripcion, cantidad) 
VALUES (xId,  xIdCategorias,  xidmarca, xcaracteristicas, xDescripcion, xcantidad );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_asistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_asistencia`(
IN xDni CHAR(8),
IN xFecha CHAR(10),
IN xHora CHAR(8)
)
BEGIN
	INSERT INTO asistencias (Dni, Fecha, Hora) VALUES (xDni, STR_TO_DATE(xFecha, '%d/%m/%Y'), xHora);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cabeceracomprobante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cabeceracomprobante`(in xNumeroComprobante varchar(20), in xFechaEmision varchar (10), 
in xFechaVencimiento varchar (10),in xSubTotal decimal (18,2), 
in xIgv decimal(18,2), in xTotal decimal(18,2), 
in xIdProveedores int,in xIdTipoDocumento int)
BEGIN
insert into cabeceracomprobante (NumeroComprobante, FechaEmision, FechaVencimiento, SubTotal, Igv, Total, IdProveedores, IdTipoDocumento) 
 values (xNumeroComprobante,STR_TO_DATE(xFechaEmision, '%d/%m/%Y'),
 STR_TO_DATE(xFechaVencimiento, '%d/%m/%Y'), xSubTotal, xIgv, xTotal,xIdProveedores,
 xIdTipoDocumento);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cargos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cargos`(
IN xId int, IN xDescripcion VARCHAR(100)
)
BEGIN
INSERT INTO cargos VALUES ( xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_carreras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_carreras`(
IN xId int, IN xDescripcion VARCHAR(100)
)
BEGIN
INSERT INTO carreras VALUES (xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_categorias`(
IN xId int, IN xDescripcion VARCHAR(100)
)
BEGIN
INSERT INTO categorias VALUES ( xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_comunicacion`(in parId int , in parIdPeriodo int, in parNomProy varchar(100), in parTipo int, 
in parCodDoc varchar(100), in parOrigen varchar(100), in parDestino varchar(100), in parFlujo int,
in parAsunto varchar(100), in parFecha date, in parCodDocRespuesta varchar(100), in parEstado int, in parEnlace varchar(100) )
BEGIN
	insert into comunicaciones values(parId , parIdPeriodo, parNomProy, parTipo, parCodDoc, parOrigen, parDestino, parFlujo, parAsunto, parFecha, parCodDocRespuesta, parEstado, parEnlace);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_contactos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_contactos`(IN `xId` int, IN `xNombre` VARCHAR(100), IN `xFechaNacimiento` VARCHAR(10), IN `xPersonasRelacionadas` VARCHAR(100), IN `xEmpresa` VARCHAR(100),IN `xCuentas` VARCHAR(100),IN `xClave` VARCHAR(100), IN `xCargo` VARCHAR(100), IN `xCorreo` VARCHAR(100), IN `xTelefono` CHAR(9), IN `xDepartamento` VARCHAR(100), IN `xDireccion` VARCHAR(100), IN `xNotas` VARCHAR(200))
BEGIN
insert into contactos values (xId,  xNombre, xFechaNacimiento, xPersonasRelacionadas, xEmpresa,xCuentas,xClave, 
xCargo, xCorreo, xTelefono, xDepartamento, xDireccion, xNotas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_contratoxproyectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_contratoxproyectos`(in xIdContratoProyecto int, 
in xIdProyecto int,
in xNroDocumentoProyecto varchar(100), 
in xIdContratante1 int, 
in xFechaInicio date, 
in xFechaFin date, 
in xImporteTotal decimal(18,2), 
in xEstado char(1), 
in xObservacion varchar(200) )
BEGIN
insert into contratosdeproyectos(IdContratoProyecto,
IdProyecto, 
NroDocumentoProyecto, 
IdContratante1, 
FechaInicio, 
FechaFin, 
ImporteTotal, 
Estado, 
Observacion)
values (xIdContratoProyecto, 
xIdProyecto,  
xNroDocumentoProyecto, 
xIdContratante1, 
xFechaInicio, 
xFechaFin, 
xImporteTotal, 
xEstado, 
xObservacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_credencial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_credencial`( 
    in xCorreo varchar(200),
    in xClave varchar(200),
    in xAlias varchar(100),
    in xDescripcion varchar(200))
BEGIN
	
    insert into credenciales(correo,clave,alias, descripcion) values( xCorreo, xClave, xAlias, xDescripcion);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cuenta`(
	IN xId int,
    IN xTipoPropietario CHAR(7),
    IN xNombres VARCHAR(50),
    IN xBanco INT,
	IN xCCC VARCHAR(50),
    IN xCCI VARCHAR(50),
    IN xTipoMoneda CHAR(1)
)
BEGIN
	INSERT INTO cuentasbancarias (IdCuentaBancaria, TipoPropietario, Nombres, IdBanco, NroCuenta, NroCuentaInterbancaria, TipoMoneda)
    VALUES (xId, xTipoPropietario, xNombres, xBanco, xCCC, xCCI, xTipoMoneda);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_datos_academicos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_datos_academicos`(
In xDni CHAR(8),
IN xIdIns int,
IN xIdFac int,
IN xIdCar int,
IN xCic VARCHAR(20),
IN xCodEs VARCHAR(20)
)
BEGIN
	UPDATE empleados
    SET IdInstitucionEducativa = xIdIns, IdFacultad = xIdFac, IdCarrera = xIdCar, Ciclo = xCic, CodigoEstudiante = xCodEs
    WHERE Dni = xDni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_datos_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_datos_empleado`(
IN xId int, IN xApellidos VARCHAR(100), IN xNombres VARCHAR(100), IN xFechaNacimiento VARCHAR(10), IN xCorreo VARCHAR(100), IN xDni CHAR(8), IN xCelular CHAR(9), IN xDistrito VARCHAR(50), IN xDireccion VARCHAR(100), IN xIdArea int, IN xIdCargo int, IN xIdTipoEmpleado int
)
BEGIN
INSERT INTO empleados(Id, Apellidos, Nombres, FechaNacimiento, Correo, Dni, Celular, Distrito, Direccion, IdArea, IdCargo, IdTipoEmpleado)
VALUES (xId, xApellidos, xNombres, STR_TO_DATE(xFechaNacimiento, '%d/%m/%Y'), xCorreo, xDni, xCelular, xDistrito, xDireccion, xIdArea, xIdCargo, xIdTipoEmpleado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_empleado`(
IN xId int, IN xApellidos VARCHAR(100), IN xNombres VARCHAR(100), IN xFechaNacimiento DATE, IN xCorreo VARCHAR(100), IN xDni CHAR(8), IN xCelular CHAR(9), IN xDireccion VARCHAR(100), IN xCodigoEstudiante VARCHAR(100), IN xIdCarrera int, IN xIdCiclo int, IN xIdInstitucionEducativa int, IN xIdArea int, IN xIdFacultad int, IN xIdTipoEmpleado int, IN xIdCargo int
)
BEGIN
INSERT INTO empleados VALUES(xId, xApellidos, xNombres, xFechaNacimiento, xCorreo, xDni, xCelular, xDireccion, xCodigoEstudiante, xIdCarrera, xIdCiclo, xIdInstitucionEducativa, xIdArea, xIdFacultad, xIdTipoEmpleado, xIdCargo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_facultades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_facultades`(
IN xId int,
IN xDescripcion VARCHAR(100)
)
BEGIN
INSERT INTO facultades VALUES (xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_instituciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_instituciones`(
IN xId int,
IN xRuc CHAR(20),
IN xRazonSocial VARCHAR(100),
IN xDireccion VARCHAR(100),
IN xSede VARCHAR(100)
)
BEGIN
INSERT INTO institucioneseducativas
VALUES (xId, xRuc, xRazonSocial, xDireccion, xSede);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_modulo`(IN `xId` int, IN `xDescripcion` VARCHAR(100))
BEGIN
INSERT INTO modulo VALUES ( xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_periodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_periodos`(
IN xId int,
IN xDescripcion VARCHAR(100)
)
BEGIN
INSERT INTO periodos VALUES (xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_proveedores`(xId int, xNombres varchar (100), xDireccion varchar (100), 
xCorreo varchar(100), xTelefono char(9), xRuc char(11))
BEGIN
insert into proveedores (Id, Nombres, Direccion, Correo, Telefono, Ruc)values(xId, xNombres, xDireccion,
 xCorreo, xTelefono, xRuc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_proyectoxobjetoestudio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_proyectoxobjetoestudio`(in xidproyecto int, in xidobjetoestudio int, in xestado varchar(1))
BEGIN
	insert into proyectoxobjetoestudio (idproyecto, idobjetoestudio, estado) values (xidproyecto, xidproyecto, xestado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_recibo_honorario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_recibo_honorario`(
    IN xId int,
    IN xNroRecibo VARCHAR(20),
    IN xRuc CHAR(11),
    IN xNombres VARCHAR(100),
    IN xApellidos VARCHAR(100),
    IN xDistrito VARCHAR(50),
    IN xDireccion VARCHAR(100),
    IN xFormaPago VARCHAR(50),
    IN xConcepto VARCHAR(100),
    IN xImporteNeto DECIMAL(18, 2),
    IN xRetencionIr DECIMAL(18, 2),
    IN xImporteTotal DECIMAL(18, 2),
    IN xFechaEmision CHAR(10)
)
BEGIN
	INSERT INTO reciboshonorarios
    VALUES (
		xId,
		xNroRecibo,
		xRuc,
		xNombres,
		xApellidos,
		xDistrito,
		xDireccion,
		xFormaPago,
		xConcepto,
		xImporteNeto,
		xRetencionIr,
		xImporteTotal,
		STR_TO_DATE(xFechaEmision, '%d/%m/%Y')
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_tipodocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tipodocumento`(IN `xId` int, IN `xIdModulo` int,
IN `xDescripcion` VARCHAR(100))
BEGIN
INSERT INTO tiposdocumentos VALUES (xId, xIdModulo, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_tipoempleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_tipoempleado`(IN `xId` int, 
IN `xDescripcion` VARCHAR(100))
BEGIN
INSERT INTO tiposempleados VALUES ( xId, xDescripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_transferencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_transferencia`(
xIdPeriodo int,
xNroOperacion VARCHAR(20),
xCuentaOrigen CHAR(7),
xCuentaDestino CHAR(7),
xFecha CHAR(10)
)
BEGIN
INSERT INTO transferenciasbancarias(IdPeriodo, NroOperacion, CuentaOrigen, CuentaDestino, Fecha)
VALUES (xIdPeriodo, xNroOperacion, xCuentaOrigen, xCuentaDestino, STR_TO_DATE(xFecha, '%d/%m/%Y'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_viaticos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_viaticos`(
IN xDescripcion VARCHAR(100),
IN xPasaje DECIMAL(18, 2),
IN xMenu DECIMAL(18, 2),
IN xIdEmpleado int,
IN xIdPeriodo int
)
BEGIN
INSERT INTO viaticos (Descripcion, Pasaje, Menu, IdEmpleado, IdPeriodo)
VALUES (xDescripcion, xPasaje, xMenu, xIdEmpleado, xIdPeriodo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_areas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_areas`()
BEGIN
SELECT * FROM areas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_articulos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_articulos`()
BEGIN
	SELECT art.idarticulo, 
		   art.idcategoria, 
           cat.descripcion as categoriadescripcion, 
           art.idmarca, 
           mar.descripcion as marcadescripcion,
           caracteristicas, 
           art.descripcion, 
           cantidad
		   
           
			FROM articulos  art left join categorias cat 
			on art.idcategoria = cat.idcategoria
			left join marcas mar on art.idmarca = mar.idmarca
    ;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_cabeceracomprobante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_cabeceracomprobante`()
BEGIN
select C.NumeroComprobante as "Numero de Comprobante", 
DATE_FORMAT(C.FechaEmision, '%d/%m/%Y') as "Fecha de Emision",
DATE_FORMAT(C.FechaVencimiento, '%d/%m/%Y') as "Fecha de Vencimiento",
C.SubTotal as "Sub Total", C.Igv,
C.Total, P.Nombres as "Proveedores", T.Descripcion as "Tipo de Documento" from cabeceracomprobante C 
inner join proveedores P on C.IdProveedores= P.Id
inner join tiposdocumentos T on C.IdTipoDocumento= T.Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_cargos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_cargos`()
BEGIN
SELECT *FROM cargos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_carreras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_carreras`()
BEGIN
SELECT*FROM carreras;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_categorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_categorias`()
BEGIN
SELECT  IdCategoria as Id, Descripcion FROM categorias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_comunicacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_comunicacion`()
BEGIN
select * from listar_vista_comunicaciones limit 50;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_comunicacionesfiltrados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_comunicacionesfiltrados`(in parFiltro char(1),in parFechaInicio varchar(10), in parFechaFin varchar(10), 
in parEstadoCodigo int, 
in parFlujoCodigo int, in parOrigen varchar(100), in parDestino varchar(100)
 )
BEGIN


set @condicion = ' where ';
set @parametrosFiltros = '';
set @comillaSimple = '\'';
set @cadenaParFechas =  if(length(parFechaInicio)=10,concat(' fecha between ', 
															@comillaSimple , parFechaInicio , @comillaSimple,
															' and ' ,@comillaSimple, parFechaFin, @comillaSimple, ' ') , '');														
set @cadenaParEstado = if(length(parEstadoCodigo)> 0, concat(' and Estado = ',  parEstadoCodigo , ' '), '');
set @cadenaParFlujo = if(length(parFlujoCodigo)>0, concat(' and Flujo = ',parFlujoCodigo ,' '), '');
set @cadenaParOrigen = if(length(parOrigen)> 0, concat('  and origen=', @comillaSimple,parOrigen,@comillaSimple , ' '), '');
set @cadenaParDestino = if(length(parDestino)>0, concat(' and destino=',@comillaSimple,parDestino, @comillaSimple , ' '), '');
/*
  set @sqldinamico = concat('select * from listar_vista_comunicaciones ', @condicion,@cadenaParFechas, @cadenaParEstado, 
  @cadenaParFlujo, @cadenaParOrigen , @cadenaParDestino);
  
 
  prepare stmt from @sqldinamico;
 
  EXECUTE stmt;
 select stmt;
 */
 if parFiltro = 'S' then
 
 if length(parOrigen) > 0 then
    
	SELECT 
        `comunicaciones`.`Id` AS `Id`,
        `comunicaciones`.`IdPeriodo` AS `IdPeriodo`,
        `comunicaciones`.`NombreProyecto` AS `NombreProyecto`,
        `comunicaciones`.`Tipo` AS `Tipo`,
        (CASE `comunicaciones`.`Tipo`
            WHEN 0 THEN 'Carta'
            WHEN 1 THEN 'Correo'
            WHEN 2 THEN 'Llamada'
        END) AS `TipoDesc`,
        `comunicaciones`.`CodDoc` AS `CodDoc`,
        `comunicaciones`.`Origen` AS `Origen`,
        `comunicaciones`.`Destino` AS `Destino`,
        `comunicaciones`.`Flujo` AS `Flujo`,
        (CASE `comunicaciones`.`Flujo`
            WHEN 0 THEN 'Emision'
            ELSE 'Recepcion'
        END) AS `FlujoDesc`,
        `comunicaciones`.`Asunto` AS `Asunto`,
        DATE_FORMAT(`comunicaciones`.`Fecha`, '%d/%m/%Y') AS `Fecha`,
        `comunicaciones`.`CodDocRespuesta` AS `CodDocRespuesta`,
        `comunicaciones`.`Estado` AS `Estado`,
        (CASE `comunicaciones`.`Estado`
            WHEN 0 THEN 'Proceso'
            WHEN 1 THEN 'Resuelto'
            WHEN 2 THEN 'Archivado'
        END) AS `EstadoDesc`,
        `comunicaciones`.`Enlace` AS `Enlace`,
        (TO_DAYS(CAST(DATE_FORMAT(NOW(), '%Y-%m-%d') AS DATE)) - TO_DAYS(`comunicaciones`.`Fecha`)) AS `Dias`
    FROM
        `comunicaciones`     
        where fecha >=convert(parFechaInicio,date) and fecha<= convert(parFechaFin,date)        
        and estado = parEstadoCodigo and flujo = parFlujoCodigo
        and origen = parOrigen and destino = parDestino ;
	else
    SELECT 
        `comunicaciones`.`Id` AS `Id`,
        `comunicaciones`.`IdPeriodo` AS `IdPeriodo`,
        `comunicaciones`.`NombreProyecto` AS `NombreProyecto`,
        `comunicaciones`.`Tipo` AS `Tipo`,
        (CASE `comunicaciones`.`Tipo`
            WHEN 0 THEN 'Carta'
            WHEN 1 THEN 'Correo'
            WHEN 2 THEN 'Llamada'
        END) AS `TipoDesc`,
        `comunicaciones`.`CodDoc` AS `CodDoc`,
        `comunicaciones`.`Origen` AS `Origen`,
        `comunicaciones`.`Destino` AS `Destino`,
        `comunicaciones`.`Flujo` AS `Flujo`,
        (CASE `comunicaciones`.`Flujo`
            WHEN 0 THEN 'Emision'
            ELSE 'Recepcion'
        END) AS `FlujoDesc`,
        `comunicaciones`.`Asunto` AS `Asunto`,
        DATE_FORMAT(`comunicaciones`.`Fecha`, '%d/%m/%Y') AS `Fecha`,
        `comunicaciones`.`CodDocRespuesta` AS `CodDocRespuesta`,
        `comunicaciones`.`Estado` AS `Estado`,
        (CASE `comunicaciones`.`Estado`
            WHEN 0 THEN 'Proceso'
            WHEN 1 THEN 'Resuelto'
            WHEN 2 THEN 'Archivado'
        END) AS `EstadoDesc`,
        `comunicaciones`.`Enlace` AS `Enlace`,
        (TO_DAYS(CAST(DATE_FORMAT(NOW(), '%Y-%m-%d') AS DATE)) - TO_DAYS(`comunicaciones`.`Fecha`)) AS `Dias`
    FROM
        `comunicaciones`     
        where fecha >= convert(parFechaInicio,date) and fecha<=convert(parFechaFin,date) 
        and estado = parEstadoCodigo and flujo = parFlujoCodigo;
        
    End if;
    
 Else
 
 
   SELECT 
        `comunicaciones`.`Id` AS `Id`,
        `comunicaciones`.`IdPeriodo` AS `IdPeriodo`,
        `comunicaciones`.`NombreProyecto` AS `NombreProyecto`,
        `comunicaciones`.`Tipo` AS `Tipo`,
        (CASE `comunicaciones`.`Tipo`
            WHEN 0 THEN 'Carta'
            WHEN 1 THEN 'Correo'
            WHEN 2 THEN 'Llamada'
        END) AS `TipoDesc`,
        `comunicaciones`.`CodDoc` AS `CodDoc`,
        `comunicaciones`.`Origen` AS `Origen`,
        `comunicaciones`.`Destino` AS `Destino`,
        `comunicaciones`.`Flujo` AS `Flujo`,
        (CASE `comunicaciones`.`Flujo`
            WHEN 0 THEN 'Emision'
            ELSE 'Recepcion'
        END) AS `FlujoDesc`,
        `comunicaciones`.`Asunto` AS `Asunto`,
        DATE_FORMAT(`comunicaciones`.`Fecha`, '%d/%m/%Y') AS `Fecha`,
        `comunicaciones`.`CodDocRespuesta` AS `CodDocRespuesta`,
        `comunicaciones`.`Estado` AS `Estado`,
        (CASE `comunicaciones`.`Estado`
            WHEN 0 THEN 'Proceso'
            WHEN 1 THEN 'Resuelto'
            WHEN 2 THEN 'Archivado'
        END) AS `EstadoDesc`,
        `comunicaciones`.`Enlace` AS `Enlace`,
        (TO_DAYS(CAST(DATE_FORMAT(NOW(), '%Y-%m-%d') AS DATE)) - TO_DAYS(`comunicaciones`.`Fecha`)) AS `Dias`
    FROM
        `comunicaciones`   ;
        End if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_contactos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_contactos`()
BEGIN
select * from contactos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_contratosdeproyectos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_contratosdeproyectos`()
BEGIN
Select IdContratoProyecto, cdp.IdProyecto, p.Nombre as NombreProyecto, 
		NroDocumentoProyecto, cdp.IdContratante1, cte.NombreEmpresa,
    FechaInicio, FechaFin, ImporteTotal,  Estado,
    (case when Estado = 'A' then 'Activo' else 'Inactivo' end) as DescripcionEstado, Observacion 
	From contratosdeproyectos  cdp left join Proyectos p on  cdp.idproyecto = p.idproyecto 
    left join contratantes cte on cdp.IdContratante1 =  cte.IdContratante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_credencial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_credencial`()
BEGIN
	select * from credenciales;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_cuentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_cuentas`()
BEGIN
SELECT c.IdCuentaBancaria, c.TipoPropietario, c.Nombres, b.Descripcion AS 'Banco', 
c.NroCuenta AS 'CCC', c.NroCuentaInterbancaria AS 'CCI', c.TipoMoneda
FROM cuentasbancarias c INNER JOIN bancos b ON c.IdBanco = b.IdBanco;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_emple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_emple`()
BEGIN
SELECT E.IdEmpleado as Id, E.Apellidos, 
E.Nombres, DATE_FORMAT(E.FechaNacimiento, '%d/%m/%Y') AS FechaNacimiento, 
E.Correo, E.Dni, E.Celular, E.Distrito, E.Direccion, A.Descripcion AS Area, 
C.Descripcion AS Cargo, T.Descripcion AS "Tip. Empleado"
FROM empleados E INNER JOIN areas A ON E.IdArea = A.IdArea
INNER JOIN cargos C ON  E.IdCargo = C.IdCargo
INNER JOIN tiposempleados T ON E.IdTipoEmpleado = T.IdTipoEmpleado
ORDER BY E.IdEmpleado ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_empleados`()
BEGIN
SELECT * FROM empleados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_facultades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_facultades`()
BEGIN
SELECT * FROM facultades;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_instituciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_instituciones`()
BEGIN
SELECT * FROM institucioneseducativas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_modulo`()
BEGIN
SELECT * FROM modulo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_objetoestudio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_objetoestudio`()
BEGIN
	select * from objetosestudio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_objetoestudiosxproyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_objetoestudiosxproyecto`(in xidproyecto int )
BEGIN
	Select idproyecto, idobjetoestudio, Estado
		from proyectoxobjetoestudio where idproyecto = xidproyecto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_periodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_periodos`()
BEGIN
 SELECT  IdPeriodo as Id, Mes, Anio, Descripcion, Alias  FROM periodos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_proveedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_proveedores`()
BEGIN
select*from proveedores;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_proyectoxcontratante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_proyectoxcontratante`()
BEGIN
select pytxctt.IdProyecto, ctt.NombreEmpresa , pyt.Nombre, pyt.Servicio
	from proyectoxcontratante pytxctt inner join contratantes ctt  
	on ctt.IdContratante = pytxctt.IdContratante
    inner join proyectos pyt on pyt.IdProyecto = pytxctt.IdProyecto ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_recibos_honorarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_recibos_honorarios`()
BEGIN
    SELECT IdReciboHonorario as Id, NroRecibo, Ruc, Nombres, Apellidos, Distrito, Direccion, 
   FormaPago, Concepto, ImporteNeto, RetencionIr, 
   ImporteTotal, 
   DATE_FORMAT(FechaEmision, '%d/%m/%Y') AS FechaEmision
    FROM reciboshonorarios;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_tipodocumento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_tipodocumento`()
BEGIN
SELECT T.IdTipoDocumento, T.Descripcion,  
		M.Descripcion AS Modulo, M.IdModulo
FROM tiposdocumentos T INNER JOIN modulos M ON T.IdModulo = M.IdModulo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_tipoempleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_tipoempleado`()
BEGIN
SELECT * FROM tiposempleados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_transferencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_transferencias`()
BEGIN
SELECT t.IdTransferenciaBancaria as Id, 
		t.IdPeriodo AS 'Periodo', t.NroOperacion, 
        c1.Nombres AS 'CuentaOrigen', 
        c2.Nombres AS 'CuentaDestino', DATE_FORMAT(t.Fecha, '%d/%m/%Y') AS 'Fecha'
  FROM transferenciasbancarias t 
  INNER JOIN cuentasbancarias c1 ON t.CuentaOrigen = c1.IdCuentaBancaria
  INNER JOIN cuentasbancarias c2 ON t.CuentaDestino = c2.IdCuentaBancaria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listar_viaticos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listar_viaticos`()
BEGIN
SELECT v.IdViatico as Id , v.Descripcion, v.Pasaje, v.Menu, e.Nombres AS Empleado, v.IdPeriodo AS Periodo
FROM viaticos v INNER JOIN empleados e ON v.IdEmpleado = e.IdEmpleado
ORDER BY IdViatico ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`(in xIdCredencial int, in xCorreo varchar(200),
    in xClave varchar(200),
    in xAlias varchar(100),
    in xDescripcion varchar(200))
BEGIN
	update credencial 
    set Correo = xCorreo, Clave = xClave, Alias = xAlias, Descripcion = xDescripcion
    where IdCredecnail = xIdCredencial;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_cantidadobjetoestudioxproyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_cantidadobjetoestudioxproyecto`(in xidproyecto int, out cantidad int)
BEGIN
	set cantidad  =  (select count(*)  from proyectoxobjetoestudio where idproyecto = xidproyecto);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_cantidad_asistencias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_cantidad_asistencias`(
IN xDni CHAR(8),
IN xPeriodo int,
OUT xCantidad INT
)
BEGIN
	DECLARE mes INT;
    DECLARE anio INT;
    
    SET mes = substring(xPeriodo, 1, 2);
    SET anio = substring(xPeriodo, 3);
    
    SELECT COUNT(*) INTO xCantidad FROM detalle_asistencia de
	INNER JOIN empleados e ON de.Id_empleado = e.Id
	WHERE year(de.Fecha) = anio AND month(de.Fecha) = mes
	AND e.Dni = xDni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_datos_academicos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_datos_academicos`(
xDni CHAR(8)
)
BEGIN
SELECT i.RazonSocial AS Institucion, f.Descripcion AS Facultad, c.Descripcion AS Carrera, e.Ciclo AS Ciclo, e.CodigoEstudiante AS Codigo
FROM empleados e INNER JOIN institucioneseducativas i
ON e.IdInstitucionEducativa = i.Id
INNER JOIN facultades f ON e.IdFacultad = f.Id
INNER JOIN carreras c ON e.IdCarrera = c.Id
WHERE e.dni = xDni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_detalle_asistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_detalle_asistencia`(
IN xDni CHAR(8),
IN xFecha CHAR(10),
OUT xId INT
)
BEGIN
	SELECT de.Id INTO xId FROM detalle_asistencia AS de
    INNER JOIN empleados AS e ON de.Id_empleado = e.ID
    WHERE e.Dni = xDni AND de.Fecha = STR_TO_DATE(xFecha, '%d/%m/%Y');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_horario_empleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_horario_empleado`(
IN xDni CHAR(8),
IN xFecha CHAR(10)
)
BEGIN
SELECT de.Hora_entrada, de.Hora_salida, de.Duracion, de.Observaciones
FROM detalle_asistencia de INNER JOIN empleados e ON de.Id_empleado = e.Id
WHERE de.Fecha = STR_TO_DATE(xFecha, '%d/%m/%Y') AND e.DNI = xDni;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_id_asistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_id_asistencia`(
    IN xDni CHAR(8),
    IN xFecha CHAR(10),
    IN xHora CHAR(8),
    OUT xId INT
)
BEGIN
	SELECT Id INTO xId
    FROM asistencias
    WHERE Dni = xDni AND Fecha = STR_TO_DATE(xFecha, '%d/%m/%Y') AND Hora = xHora;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_id_detalle_asistencia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_id_detalle_asistencia`(
IN xDni CHAR(8),
IN xFecha CHAR(10),
IN xHoraEntrada CHAR(8),
OUT xId INT
)
BEGIN
	SELECT de.Id INTO xId FROM detalle_asistencia de
	INNER JOIN empleados e ON de.Id_empleado = e.Id
	WHERE e.Dni = xDni AND de.Fecha = str_to_date(xFecha, '%d/%m/%Y')
    AND de.Hora_entrada = xHoraEntrada;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_proyectosxcontratante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_proyectosxcontratante`(in idcontratante int )
BEGIN
select pytxctt.IdProyecto, ctt.NombreEmpresa , pyt.Nombre, pyt.Servicio
	from proyectoxcontratante pytxctt inner join contratantes ctt  
	on ctt.IdContratante = pytxctt.IdContratante
    inner join proyectos pyt on pyt.IdProyecto = pytxctt.IdProyecto 
    where pytxctt.IdContratante  = idcontratante;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `listar_vista_comunicaciones`
--

/*!50001 DROP VIEW IF EXISTS `listar_vista_comunicaciones`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_vista_comunicaciones` AS select `comunicaciones`.`IdComunicacion` AS `Id`,`comunicaciones`.`IdPeriodo` AS `IdPeriodo`,`comunicaciones`.`NombreProyecto` AS `NombreProyecto`,`comunicaciones`.`Tipo` AS `Tipo`,(case `comunicaciones`.`Tipo` when 0 then 'Carta' when 1 then 'Correo' when 2 then 'Llamada' end) AS `TipoDesc`,`comunicaciones`.`CodDoc` AS `CodDoc`,`comunicaciones`.`Origen` AS `Origen`,`comunicaciones`.`Destino` AS `Destino`,`comunicaciones`.`Flujo` AS `Flujo`,(case `comunicaciones`.`Flujo` when 0 then 'Emision' else 'Recepcion' end) AS `FlujoDesc`,`comunicaciones`.`Asunto` AS `Asunto`,date_format(`comunicaciones`.`Fecha`,'%d/%m/%Y') AS `Fecha`,`comunicaciones`.`CodDocRespuesta` AS `CodDocRespuesta`,`comunicaciones`.`estado` AS `Estado`,(case `comunicaciones`.`estado` when 0 then 'Proceso' when 1 then 'Resuelto' when 2 then 'Archivado' end) AS `EstadoDesc`,`comunicaciones`.`Enlace` AS `Enlace`,(to_days(cast(date_format(now(),'%Y-%m-%d') as date)) - to_days(`comunicaciones`.`Fecha`)) AS `Dias` from `comunicaciones` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `verproductosxalmacen`
--

/*!50001 DROP VIEW IF EXISTS `verproductosxalmacen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `verproductosxalmacen` AS select `art`.`IdArticulo` AS `IdArticulo`,`art`.`descripcion` AS `nombrearticulo`,`almxart`.`anio` AS `anio`,`almxart`.`mes` AS `mes`,`almxart`.`cantidad` AS `cantidad`,`alm`.`idalmacen` AS `idalmacen`,`alm`.`descripcion` AS `nombrealmacen`,`almxart`.`movimiento` AS `movimiento` from ((`almacenxarticulo` `almxart` join `articulos` `art` on((`almxart`.`idarticulo` = `art`.`IdArticulo`))) join `almacenes` `alm` on((`almxart`.`idalmacen` = `alm`.`idalmacen`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-02 18:49:00
