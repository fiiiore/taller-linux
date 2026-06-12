/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: gestion_empresa
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0+deb12u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(1,'Juan Perez','2211234567','juan@gmail.com'),
(2,'Maria Gomez','2217654321','maria@gmail.com'),
(3,'Juan Perez','2211111111','juan.perez@gmail.com'),
(4,'Maria Gomez','2211111112','maria.gomez@gmail.com'),
(5,'Carlos Lopez','2211111113','carlos.lopez@gmail.com'),
(6,'Ana Martinez','2211111114','ana.martinez@gmail.com'),
(7,'Pedro Sanchez','2211111115','pedro.sanchez@gmail.com'),
(8,'Lucia Fernandez','2211111116','lucia.fernandez@gmail.com'),
(9,'Diego Romero','2211111117','diego.romero@gmail.com'),
(10,'Sofia Torres','2211111118','sofia.torres@gmail.com'),
(11,'Martin Diaz','2211111119','martin.diaz@gmail.com'),
(12,'Valentina Ruiz','2211111120','valentina.ruiz@gmail.com'),
(13,'Nicolas Castro','2211111121','nicolas.castro@gmail.com'),
(14,'Camila Silva','2211111122','camila.silva@gmail.com'),
(15,'Joaquin Herrera','2211111123','joaquin.herrera@gmail.com'),
(16,'Florencia Vega','2211111124','florencia.vega@gmail.com'),
(17,'Agustin Molina','2211111125','agustin.molina@gmail.com'),
(18,'Julieta Rios','2211111126','julieta.rios@gmail.com'),
(19,'Franco Medina','2211111127','franco.medina@gmail.com'),
(20,'Milagros Acosta','2211111128','milagros.acosta@gmail.com'),
(21,'Tomas Benitez','2211111129','tomas.benitez@gmail.com'),
(22,'Brenda Navarro','2211111130','brenda.navarro@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factura_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_id` (`factura_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`factura_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(100) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES
(1,'Internet',25000.00,'2026-06-01'),
(2,'Electricidad',18000.00,'2026-06-02'),
(3,'Internet',25000.00,'2026-05-01'),
(4,'Electricidad',32000.00,'2026-05-02'),
(5,'Agua',15000.00,'2026-05-03'),
(6,'Alquiler',180000.00,'2026-05-04'),
(7,'Papeleria',12000.00,'2026-05-05'),
(8,'Combustible',45000.00,'2026-05-06'),
(9,'Limpieza',18000.00,'2026-05-07'),
(10,'Telefonia',22000.00,'2026-05-08'),
(11,'Marketing',65000.00,'2026-05-09'),
(12,'Hosting',14000.00,'2026-05-10'),
(13,'Seguros',38000.00,'2026-05-11'),
(14,'Equipamiento',95000.00,'2026-05-12'),
(15,'Capacitacion',28000.00,'2026-05-13'),
(16,'Mantenimiento',31000.00,'2026-05-14'),
(17,'Software',42000.00,'2026-05-15'),
(18,'Impuestos',87000.00,'2026-05-16'),
(19,'Servicios Profesionales',56000.00,'2026-05-17'),
(20,'Movilidad',21000.00,'2026-05-18'),
(21,'Repuestos',34000.00,'2026-05-19'),
(22,'Publicidad',73000.00,'2026-05-20');
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES
(1,1,120000.00,'2026-05-01'),
(2,2,85000.00,'2026-05-02'),
(3,3,95000.00,'2026-05-03'),
(4,4,150000.00,'2026-05-04'),
(5,5,78000.00,'2026-05-05'),
(6,6,132000.00,'2026-05-06'),
(7,7,110000.00,'2026-05-07'),
(8,8,92000.00,'2026-05-08'),
(9,9,175000.00,'2026-05-09'),
(10,10,68000.00,'2026-05-10'),
(11,11,143000.00,'2026-05-11'),
(12,12,99000.00,'2026-05-12'),
(13,13,87000.00,'2026-05-13'),
(14,14,165000.00,'2026-05-14'),
(15,15,124000.00,'2026-05-15'),
(16,16,76000.00,'2026-05-16'),
(17,17,135000.00,'2026-05-17'),
(18,18,119000.00,'2026-05-18'),
(19,19,158000.00,'2026-05-19'),
(20,20,97000.00,'2026-05-20');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-07  6:29:37
