CREATE DATABASE  IF NOT EXISTS `semiconductor_fab` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `semiconductor_fab`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: semiconductor_fab
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `defect_types`
--

DROP TABLE IF EXISTS `defect_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defect_types` (
  `defect_type_id` int NOT NULL AUTO_INCREMENT,
  `defect_code` varchar(20) NOT NULL,
  `defect_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `severity` varchar(20) DEFAULT NULL,
  `typical_cause` text,
  PRIMARY KEY (`defect_type_id`),
  UNIQUE KEY `defect_code` (`defect_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defect_types`
--

LOCK TABLES `defect_types` WRITE;
/*!40000 ALTER TABLE `defect_types` DISABLE KEYS */;
INSERT INTO `defect_types` VALUES (1,'PART-01','Particle Contamination','Particle','Major','Airborne particles'),(2,'PART-02','Metal Particle','Particle','Critical','Equipment wear'),(3,'SCRT-01','Wafer Edge Scratch','Scratch','Major','Handling damage'),(4,'SCRT-02','Surface Scratch','Scratch','Critical','CMP pad defect'),(5,'BRGE-01','Metal Bridge Short','Bridge','Critical','Over-exposure'),(6,'OPEN-01','Metal Line Open','Open','Critical','Under-etch'),(7,'VOID-01','Contact Void','Pattern','Major','Incomplete fill'),(8,'COMET-01','Comet Defect','Pattern','Minor','Post-CMP drag'),(9,'MSALIGN','Mask Misalignment','Pattern','Critical','Overlay error'),(10,'FILM-01','Film Non-Uniformity','Pattern','Major','CVD process drift');
/*!40000 ALTER TABLE `defect_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defects`
--

DROP TABLE IF EXISTS `defects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defects` (
  `defect_id` int NOT NULL AUTO_INCREMENT,
  `wafer_id` int DEFAULT NULL,
  `defect_type_id` int DEFAULT NULL,
  `x_coord` decimal(8,4) DEFAULT NULL,
  `y_coord` decimal(8,4) DEFAULT NULL,
  `size_um` decimal(8,4) DEFAULT NULL,
  `is_killer` tinyint(1) DEFAULT '0',
  `detected_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `equipment_id` int DEFAULT NULL,
  PRIMARY KEY (`defect_id`),
  KEY `wafer_id` (`wafer_id`),
  KEY `defect_type_id` (`defect_type_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `defects_ibfk_1` FOREIGN KEY (`wafer_id`) REFERENCES `wafers` (`wafer_id`),
  CONSTRAINT `defects_ibfk_2` FOREIGN KEY (`defect_type_id`) REFERENCES `defect_types` (`defect_type_id`),
  CONSTRAINT `defects_ibfk_3` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defects`
--

LOCK TABLES `defects` WRITE;
/*!40000 ALTER TABLE `defects` DISABLE KEYS */;
INSERT INTO `defects` VALUES (1,1,1,45.2000,-32.1000,0.3500,0,'2026-05-24 18:02:56',1),(2,1,1,-12.5000,89.3000,0.2800,0,'2026-05-24 18:02:56',1),(3,2,2,23.4000,-45.6000,0.8200,1,'2026-05-24 18:02:56',1),(4,3,3,-78.2000,12.4000,1.2000,0,'2026-05-24 18:02:56',4),(5,4,5,34.5000,-23.1000,0.4500,1,'2026-05-24 18:02:56',1),(6,5,1,-45.3000,67.8000,0.3100,0,'2026-05-24 18:02:56',1),(7,6,8,12.1000,-34.5000,0.2500,0,'2026-05-24 18:02:56',4),(8,17,5,23.4000,-45.6000,0.6500,1,'2026-05-24 18:02:56',5),(9,17,5,-34.5000,23.1000,0.7200,1,'2026-05-24 18:02:56',5),(10,17,9,-45.6000,-23.4000,0.8800,1,'2026-05-24 18:02:56',2),(11,18,5,34.5000,12.3000,0.6100,1,'2026-05-24 18:02:56',5),(12,19,5,23.1000,-34.5000,0.5500,1,'2026-05-24 18:02:56',4),(13,20,5,12.4000,45.3000,0.7100,1,'2026-05-24 18:02:56',5),(14,22,6,0.0000,0.0000,2.5000,1,'2026-05-24 18:02:56',5),(15,22,6,12.5000,-12.5000,2.3000,1,'2026-05-24 18:02:56',5),(16,23,6,5.5000,-5.5000,2.6000,1,'2026-05-24 18:02:56',5),(17,24,5,-15.0000,15.0000,1.7500,1,'2026-05-24 18:02:56',4);
/*!40000 ALTER TABLE `defects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engineers`
--

DROP TABLE IF EXISTS `engineers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `engineers` (
  `engineer_id` int NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(20) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `specialization` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`engineer_id`),
  UNIQUE KEY `emp_code` (`emp_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engineers`
--

LOCK TABLES `engineers` WRITE;
/*!40000 ALTER TABLE `engineers` DISABLE KEYS */;
INSERT INTO `engineers` VALUES (1,'ENG-001','Arjun Sharma','Process','Lithography','a.sharma@fab.com'),(2,'ENG-002','Priya Venkatesh','Yield','Defect Analysis','p.v@fab.com'),(3,'ENG-003','Rohan Mehta','Equipment','Etch Systems','r.mehta@fab.com'),(4,'ENG-004','Divya Krishnan','Process','Deposition','d.k@fab.com'),(5,'ENG-005','Karthik Rao','Yield','SPC','k.rao@fab.com'),(6,'ENG-006','Sneha Iyer','QA','Metrology','s.iyer@fab.com'),(7,'ENG-007','Vikram Patel','Process','Implant','v.patel@fab.com'),(8,'ENG-008','Ananya Reddy','Equipment','CMP','a.reddy@fab.com'),(9,'ENG-009','Suresh Nair','Yield','Failure Analysis','s.nair@fab.com'),(10,'ENG-010','Meera Joshi','QA','Electrical Test','m.joshi@fab.com');
/*!40000 ALTER TABLE `engineers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_id` int NOT NULL AUTO_INCREMENT,
  `eq_code` varchar(20) NOT NULL,
  `eq_name` varchar(100) NOT NULL,
  `install_date` date DEFAULT NULL,
  `last_pm_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'ACTIVE',
  `fab_area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`equipment_id`),
  UNIQUE KEY `eq_code` (`eq_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'ASML-3400A','ASML DUV Scanner A','2019-03-15','2024-10-01','ACTIVE','Litho Bay 1'),(2,'ASML-3400B','ASML DUV Scanner B','2019-03-15','2024-11-15','ACTIVE','Litho Bay 1'),(3,'ASML-EUV01','ASML EUV Scanner','2021-06-01','2024-09-20','ACTIVE','Litho Bay 2'),(4,'LAM-ETH01','Lam Dielectric Etcher','2018-07-10','2024-10-10','ACTIVE','Etch Bay A'),(5,'LAM-ETH02','Lam Dielectric Etcher2','2018-07-10','2024-08-05','ACTIVE','Etch Bay A'),(6,'AMAT-ETH03','AMAT Metal Etcher','2020-01-20','2024-11-01','ACTIVE','Etch Bay B'),(7,'TEL-CVD01','TEL CVD Furnace 1','2017-11-05','2024-07-15','ACTIVE','Dep Bay 1'),(8,'TEL-CVD02','TEL CVD Furnace 2','2017-11-05','2024-09-30','DOWN','Dep Bay 1'),(9,'AMAT-CMP01','AMAT CMP System 1','2019-05-14','2024-11-20','ACTIVE','CMP Bay'),(10,'KLA-INSP01','KLA Defect Inspector','2020-04-12','2024-11-05','ACTIVE','Inspection Bay');
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lots` (
  `lot_id` int NOT NULL AUTO_INCREMENT,
  `lot_number` varchar(30) NOT NULL,
  `product_id` int DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT NULL,
  `lot_status` varchar(20) DEFAULT 'IN_PROCESS',
  `priority` varchar(10) DEFAULT 'NORMAL',
  `engineer_id` int DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`lot_id`),
  UNIQUE KEY `lot_number` (`lot_number`),
  KEY `product_id` (`product_id`),
  KEY `engineer_id` (`engineer_id`),
  CONSTRAINT `lots_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `lots_ibfk_2` FOREIGN KEY (`engineer_id`) REFERENCES `engineers` (`engineer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lots`
--

LOCK TABLES `lots` WRITE;
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
INSERT INTO `lots` VALUES (1,'LOT-2024-001',1,'2024-01-05 02:30:00','2024-02-10 10:30:00','COMPLETED','NORMAL',1,'First lot of quarter'),(2,'LOT-2024-002',2,'2024-01-08 00:30:00','2024-01-28 08:30:00','COMPLETED','NORMAL',4,NULL),(3,'LOT-2024-003',4,'2024-01-10 08:30:00','2024-02-05 04:30:00','COMPLETED','HOT',2,'Customer expedite'),(4,'LOT-2024-004',1,'2024-01-15 02:30:00','2024-02-20 10:30:00','COMPLETED','NORMAL',1,NULL),(5,'LOT-2024-005',5,'2024-02-01 02:30:00','2024-03-20 10:30:00','COMPLETED','HOT',2,'GPU yield run'),(6,'LOT-2024-006',2,'2024-02-05 00:30:00','2024-02-25 08:30:00','COMPLETED','NORMAL',4,NULL),(7,'LOT-2024-007',1,'2024-02-15 02:30:00','2024-03-22 10:30:00','COMPLETED','NORMAL',1,NULL),(8,'LOT-2024-008',4,'2024-02-20 00:30:00','2024-03-18 06:30:00','COMPLETED','HOT',3,'RF qual lot'),(9,'LOT-2024-009',1,'2024-03-15 02:30:00','2024-04-22 10:30:00','COMPLETED','NORMAL',1,'Yield excursion observed'),(10,'LOT-2024-010',3,'2024-05-15 02:30:00','2024-06-05 08:30:00','SCRAPPED','NORMAL',7,'Gate etch excursion - scrapped'),(11,'LOT-2024-011',1,'2024-06-15 02:30:00',NULL,'IN_PROCESS','NORMAL',1,NULL),(12,'LOT-2024-012',5,'2024-06-20 00:30:00',NULL,'IN_PROCESS','HOT',2,'Engineering split lot');
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_steps`
--

DROP TABLE IF EXISTS `process_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_steps` (
  `step_id` int NOT NULL AUTO_INCREMENT,
  `step_code` varchar(20) NOT NULL,
  `step_name` varchar(100) NOT NULL,
  `step_type` varchar(50) NOT NULL,
  `sequence_order` int NOT NULL,
  `critical_step` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`step_id`),
  UNIQUE KEY `step_code` (`step_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_steps`
--

LOCK TABLES `process_steps` WRITE;
/*!40000 ALTER TABLE `process_steps` DISABLE KEYS */;
INSERT INTO `process_steps` VALUES (1,'STI-01','Shallow Trench Isolation','Etch',1,1),(2,'GATE-LTH','Gate Lithography','Lithography',2,1),(3,'GATE-ETH','Gate Etch','Etch',3,1),(4,'LDD-IMP','LDD Ion Implant','Implant',4,0),(5,'S/D-IMP','Source Drain Implant','Implant',5,1),(6,'PMD-CMP','PMD CMP Polish','CMP',6,0),(7,'CT-LTH','Contact Lithography','Lithography',7,1),(8,'CT-ETH','Contact Etch','Etch',8,1),(9,'M1-LTH','Metal 1 Lithography','Lithography',9,1),(10,'INSP-01','Final Inspection','Inspection',10,1);
/*!40000 ALTER TABLE `process_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_code` varchar(30) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `node_id` int DEFAULT NULL,
  `die_size_mm2` decimal(8,2) NOT NULL,
  `target_yield` decimal(5,2) NOT NULL,
  `wafer_size` int NOT NULL DEFAULT '300',
  `market_segment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_code` (`product_code`),
  KEY `node_id` (`node_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`node_id`) REFERENCES `technology_nodes` (`node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'QC-SD865','Mobile SoC',6,73.27,72.00,300,'Mobile'),(2,'IC-MCU32','32-bit MCU',2,12.50,91.00,200,'Embedded'),(3,'IC-PMIC01','Power Mgmt IC',1,18.40,94.00,200,'Power'),(4,'IC-RF5G','5G RF Module',4,22.80,85.00,300,'Wireless'),(5,'QC-GPU780','HPC GPU Die',5,520.00,55.00,300,'HPC'),(6,'IC-IMGSNSR','CMOS Image Sensor',4,65.00,78.00,300,'Imaging'),(7,'IC-FLASH','NOR Flash 256Mb',3,31.00,88.00,200,'Memory'),(8,'IC-IOT01','IoT SoC',4,8.20,93.00,200,'IoT');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_nodes`
--

DROP TABLE IF EXISTS `technology_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technology_nodes` (
  `node_id` int NOT NULL AUTO_INCREMENT,
  `node_name` varchar(20) NOT NULL,
  `feature_size` decimal(6,3) NOT NULL,
  `gen_year` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `node_name` (`node_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_nodes`
--

LOCK TABLES `technology_nodes` WRITE;
/*!40000 ALTER TABLE `technology_nodes` DISABLE KEYS */;
INSERT INTO `technology_nodes` VALUES (1,'180nm',180.000,1999,'Legacy node'),(2,'90nm',90.000,2004,'Mature node'),(3,'45nm',45.000,2007,'High performance'),(4,'28nm',28.000,2011,'Most used node'),(5,'14nm',14.000,2014,'FinFET node'),(6,'7nm',7.000,2018,'EUV partial'),(7,'5nm',5.000,2020,'EUV dominant');
/*!40000 ALTER TABLE `technology_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wafer_measurements`
--

DROP TABLE IF EXISTS `wafer_measurements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wafer_measurements` (
  `meas_id` int NOT NULL AUTO_INCREMENT,
  `wafer_id` int DEFAULT NULL,
  `measurement_type` varchar(50) DEFAULT NULL,
  `value` decimal(12,6) NOT NULL,
  `uom` varchar(20) DEFAULT NULL,
  `spec_min` decimal(12,6) DEFAULT NULL,
  `spec_max` decimal(12,6) DEFAULT NULL,
  `in_spec` tinyint(1) GENERATED ALWAYS AS ((`value` between `spec_min` and `spec_max`)) STORED,
  `measured_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `equipment_id` int DEFAULT NULL,
  PRIMARY KEY (`meas_id`),
  KEY `wafer_id` (`wafer_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `wafer_measurements_ibfk_1` FOREIGN KEY (`wafer_id`) REFERENCES `wafers` (`wafer_id`),
  CONSTRAINT `wafer_measurements_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wafer_measurements`
--

LOCK TABLES `wafer_measurements` WRITE;
/*!40000 ALTER TABLE `wafer_measurements` DISABLE KEYS */;
INSERT INTO `wafer_measurements` (`meas_id`, `wafer_id`, `measurement_type`, `value`, `uom`, `spec_min`, `spec_max`, `measured_at`, `equipment_id`) VALUES (1,1,'CD',14.200000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(2,2,'CD',14.500000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(3,3,'CD',13.800000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(4,4,'CD',14.100000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(5,1,'Overlay',1.800000,'nm',0.000000,2.500000,'2026-05-24 18:02:56',1),(6,2,'Overlay',2.100000,'nm',0.000000,2.500000,'2026-05-24 18:02:56',1),(7,3,'Overlay',1.500000,'nm',0.000000,2.500000,'2026-05-24 18:02:56',1),(8,17,'CD',16.800000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(9,18,'CD',17.200000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(10,19,'CD',16.500000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(11,20,'CD',14.200000,'nm',13.000000,15.000000,'2026-05-24 18:02:56',1),(12,9,'Thickness',48.200000,'nm',45.000000,52.000000,'2026-05-24 18:02:56',1),(13,10,'Thickness',49.100000,'nm',45.000000,52.000000,'2026-05-24 18:02:56',1);
/*!40000 ALTER TABLE `wafer_measurements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wafers`
--

DROP TABLE IF EXISTS `wafers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wafers` (
  `wafer_id` int NOT NULL AUTO_INCREMENT,
  `wafer_number` varchar(30) NOT NULL,
  `lot_id` int DEFAULT NULL,
  `slot_position` int NOT NULL,
  `wafer_status` varchar(20) DEFAULT 'ACTIVE',
  `total_dies` int DEFAULT NULL,
  `good_dies` int DEFAULT NULL,
  `yield_pct` decimal(5,2) GENERATED ALWAYS AS ((case when (`total_dies` > 0) then round(((`good_dies` / `total_dies`) * 100),2) else 0 end)) STORED,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wafer_id`),
  UNIQUE KEY `wafer_number` (`wafer_number`),
  KEY `lot_id` (`lot_id`),
  CONSTRAINT `wafers_ibfk_1` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`lot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wafers`
--

LOCK TABLES `wafers` WRITE;
/*!40000 ALTER TABLE `wafers` DISABLE KEYS */;
INSERT INTO `wafers` (`wafer_id`, `wafer_number`, `lot_id`, `slot_position`, `wafer_status`, `total_dies`, `good_dies`, `created_at`) VALUES (1,'W001-01',1,1,'ACTIVE',360,271,'2026-05-24 18:02:55'),(2,'W001-02',1,2,'ACTIVE',360,265,'2026-05-24 18:02:55'),(3,'W001-03',1,3,'ACTIVE',360,258,'2026-05-24 18:02:55'),(4,'W001-04',1,4,'ACTIVE',360,276,'2026-05-24 18:02:55'),(5,'W001-05',1,5,'ACTIVE',360,268,'2026-05-24 18:02:55'),(6,'W001-06',1,6,'ACTIVE',360,252,'2026-05-24 18:02:55'),(7,'W001-07',1,7,'ACTIVE',360,280,'2026-05-24 18:02:55'),(8,'W001-08',1,8,'SCRAPPED',360,0,'2026-05-24 18:02:55'),(9,'W002-01',2,1,'ACTIVE',2100,1960,'2026-05-24 18:02:55'),(10,'W002-02',2,2,'ACTIVE',2100,1945,'2026-05-24 18:02:55'),(11,'W002-03',2,3,'ACTIVE',2100,1975,'2026-05-24 18:02:55'),(12,'W002-04',2,4,'ACTIVE',2100,1955,'2026-05-24 18:02:55'),(13,'W005-01',5,1,'ACTIVE',42,24,'2026-05-24 18:02:55'),(14,'W005-02',5,2,'ACTIVE',42,23,'2026-05-24 18:02:55'),(15,'W005-03',5,3,'ACTIVE',42,19,'2026-05-24 18:02:55'),(16,'W005-04',5,4,'ACTIVE',42,26,'2026-05-24 18:02:55'),(17,'W009-01',9,1,'ACTIVE',360,210,'2026-05-24 18:02:55'),(18,'W009-02',9,2,'ACTIVE',360,198,'2026-05-24 18:02:55'),(19,'W009-03',9,3,'ACTIVE',360,225,'2026-05-24 18:02:55'),(20,'W009-04',9,4,'ACTIVE',360,165,'2026-05-24 18:02:55'),(21,'W009-05',9,5,'ACTIVE',360,145,'2026-05-24 18:02:55'),(22,'W010-01',10,1,'SCRAPPED',680,0,'2026-05-24 18:02:55'),(23,'W010-02',10,2,'SCRAPPED',680,0,'2026-05-24 18:02:55'),(24,'W010-03',10,3,'SCRAPPED',680,55,'2026-05-24 18:02:55'),(25,'W010-04',10,4,'SCRAPPED',680,0,'2026-05-24 18:02:55');
/*!40000 ALTER TABLE `wafers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'semiconductor_fab'
--
/*!50003 DROP PROCEDURE IF EXISTS `EquipmentDefectReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EquipmentDefectReport`(IN p_eq_code VARCHAR(20))
BEGIN
    SELECT
        e.eq_code,
        e.eq_name,
        e.status,
        e.last_pm_date,
        DATEDIFF(CURDATE(), e.last_pm_date) AS days_since_pm,
        COUNT(d.defect_id)                  AS total_defects,
        COUNT(CASE WHEN d.is_killer 
              THEN 1 END)                   AS killer_defects,
        COUNT(DISTINCT d.wafer_id)          AS wafers_affected,
        ROUND(AVG(d.size_um), 4)            AS avg_defect_size_um
    FROM equipment e
    LEFT JOIN defects d ON e.equipment_id = d.equipment_id
    WHERE e.eq_code = p_eq_code
    GROUP BY e.equipment_id, e.eq_code, e.eq_name,
             e.status, e.last_pm_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLotReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLotReport`(IN p_lot_number VARCHAR(30))
BEGIN
    -- Lot basic info
    SELECT
        l.lot_number,
        p.product_name,
        p.product_code,
        tn.node_name,
        l.lot_status,
        l.priority,
        e.full_name        AS responsible_engineer,
        l.start_date,
        l.end_date,
        DATEDIFF(l.end_date, l.start_date) AS cycle_time_days
    FROM lots l
    JOIN products p        ON l.product_id = p.product_id
    JOIN technology_nodes tn ON p.node_id = tn.node_id
    JOIN engineers e       ON l.engineer_id = e.engineer_id
    WHERE l.lot_number = p_lot_number;

    -- Wafer yield summary
    SELECT
        COUNT(w.wafer_id)          AS total_wafers,
        SUM(w.total_dies)          AS total_dies,
        SUM(w.good_dies)           AS good_dies,
        ROUND(AVG(w.yield_pct), 2) AS avg_yield,
        ROUND(MIN(w.yield_pct), 2) AS min_yield,
        ROUND(MAX(w.yield_pct), 2) AS max_yield,
        COUNT(CASE WHEN w.wafer_status 
              = 'SCRAPPED' THEN 1 END) AS scrapped_wafers
    FROM wafers w
    JOIN lots l ON w.lot_id = l.lot_id
    WHERE l.lot_number = p_lot_number;

    -- Defects found on this lot
    SELECT
        dt.defect_name,
        dt.severity,
        COUNT(d.defect_id)                      AS count,
        COUNT(CASE WHEN d.is_killer 
              THEN 1 END)                        AS killer_count
    FROM defects d
    JOIN defect_types dt ON d.defect_type_id = dt.defect_type_id
    JOIN wafers w        ON d.wafer_id = w.wafer_id
    JOIN lots l          ON w.lot_id = l.lot_id
    WHERE l.lot_number = p_lot_number
    GROUP BY dt.defect_type_id, dt.defect_name, dt.severity
    ORDER BY killer_count DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `YieldExcursionAlert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `YieldExcursionAlert`(IN p_threshold DECIMAL(5,2))
BEGIN
    SELECT
        l.lot_number,
        p.product_code,
        p.product_name,
        p.target_yield,
        ROUND(AVG(w.yield_pct), 2)   AS actual_yield,
        ROUND(AVG(w.yield_pct) - 
              p.target_yield, 2)      AS yield_gap,
        e.full_name                   AS engineer,
        e.email                       AS contact
    FROM lots l
    JOIN products p  ON l.product_id = p.product_id
    JOIN wafers w    ON l.lot_id = w.lot_id
    JOIN engineers e ON l.engineer_id = e.engineer_id
    WHERE l.lot_status != 'SCRAPPED'
    GROUP BY l.lot_id, l.lot_number, p.product_code,
             p.product_name, p.target_yield,
             e.full_name, e.email
    HAVING actual_yield < p_threshold
    ORDER BY actual_yield ASC;
END ;;
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

-- Dump completed on 2026-05-24 23:43:09
