CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Temporary view structure for view `AccountBalance`
--

DROP TABLE IF EXISTS `AccountBalance`;
/*!50001 DROP VIEW IF EXISTS `AccountBalance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AccountBalance` AS SELECT 
 1 AS `AccountID`,
 1 AS `Balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AccountInfo`
--

DROP TABLE IF EXISTS `AccountInfo`;
/*!50001 DROP VIEW IF EXISTS `AccountInfo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AccountInfo` AS SELECT 
 1 AS `AccountId`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `DateCreate`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AccountOrderSummary`
--

DROP TABLE IF EXISTS `AccountOrderSummary`;
/*!50001 DROP VIEW IF EXISTS `AccountOrderSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AccountOrderSummary` AS SELECT 
 1 AS `AccountID`,
 1 AS `Paid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `AccountTransactionSummary`
--

DROP TABLE IF EXISTS `AccountTransactionSummary`;
/*!50001 DROP VIEW IF EXISTS `AccountTransactionSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `AccountTransactionSummary` AS SELECT 
 1 AS `AccountID`,
 1 AS `Value_`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Account_`
--

DROP TABLE IF EXISTS `Account_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account_` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastName` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DateCreate` datetime NOT NULL,
  `Photo` blob,
  `PassHash` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`AccountID`),
  CONSTRAINT `Account__chk_1` CHECK ((`Email` like _utf8mb4'%_@__%.__%'))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account_`
--

LOCK TABLES `Account_` WRITE;
/*!40000 ALTER TABLE `Account_` DISABLE KEYS */;
INSERT INTO `Account_` VALUES (1,'Admin','Admin','2022-02-07 17:54:29',NULL,0,'admin@gmail.com'),(2,'Navid','Eslami','2022-02-07 17:54:29',NULL,0,'n3slami@gmail.com');
/*!40000 ALTER TABLE `Account_` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_account` BEFORE INSERT ON `Account_` FOR EACH ROW SET NEW.DateCreate = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_account` AFTER UPDATE ON `Account_` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Account_ SET DateCreate = OLD.DateCreate WHERE AccountID = NEW.AccountID;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `AddressID` int NOT NULL AUTO_INCREMENT,
  `City` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Street` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Floor` int DEFAULT NULL,
  `BuildingNumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `AddressID_UNIQUE` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'Tehran','Sabounchi',1,'7'),(2,'Tehran','Khorram-shahr',-1,'2');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `AccountID` int NOT NULL,
  `AccessLimit` smallint NOT NULL,
  PRIMARY KEY (`AccountID`),
  CONSTRAINT `fk_Admin_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `Account_` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Admin_chk_1` CHECK (((1 <= `AccessLimit`) and (`AccessLimit` <= 3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,3);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Att_Numerical`
--

DROP TABLE IF EXISTS `Att_Numerical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Att_Numerical` (
  `AttributeID` int NOT NULL,
  `Start` decimal(10,0) NOT NULL DEFAULT '0',
  `Finish` decimal(10,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`AttributeID`),
  CONSTRAINT `fk_Att_Numerical_AttributeID` FOREIGN KEY (`AttributeID`) REFERENCES `Attribute` (`AttributeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_Att_Numerical_Valid_Range` CHECK ((`Start` <= `Finish`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Att_Numerical`
--

LOCK TABLES `Att_Numerical` WRITE;
/*!40000 ALTER TABLE `Att_Numerical` DISABLE KEYS */;
INSERT INTO `Att_Numerical` VALUES (2,0,10);
/*!40000 ALTER TABLE `Att_Numerical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Att_Qualitative`
--

DROP TABLE IF EXISTS `Att_Qualitative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Att_Qualitative` (
  `AttributeID` int NOT NULL,
  PRIMARY KEY (`AttributeID`),
  CONSTRAINT `fk_Att_Qualitative_AttributeID` FOREIGN KEY (`AttributeID`) REFERENCES `Attribute` (`AttributeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Att_Qualitative`
--

LOCK TABLES `Att_Qualitative` WRITE;
/*!40000 ALTER TABLE `Att_Qualitative` DISABLE KEYS */;
INSERT INTO `Att_Qualitative` VALUES (3);
/*!40000 ALTER TABLE `Att_Qualitative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Att_String`
--

DROP TABLE IF EXISTS `Att_String`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Att_String` (
  `AttributeID` int NOT NULL,
  PRIMARY KEY (`AttributeID`),
  CONSTRAINT `fk_Att_String_AttributeID` FOREIGN KEY (`AttributeID`) REFERENCES `Attribute` (`AttributeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Att_String`
--

LOCK TABLES `Att_String` WRITE;
/*!40000 ALTER TABLE `Att_String` DISABLE KEYS */;
INSERT INTO `Att_String` VALUES (1);
/*!40000 ALTER TABLE `Att_String` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attribute`
--

DROP TABLE IF EXISTS `Attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attribute` (
  `AttributeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DateCreate` datetime NOT NULL,
  PRIMARY KEY (`AttributeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attribute`
--

LOCK TABLES `Attribute` WRITE;
/*!40000 ALTER TABLE `Attribute` DISABLE KEYS */;
INSERT INTO `Attribute` VALUES (1,'Khoshmaze','2022-02-07 17:54:30'),(2,'Tool','2022-02-07 17:54:30'),(3,'Mizan Zardi','2022-02-07 17:54:30');
/*!40000 ALTER TABLE `Attribute` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_attribute` BEFORE INSERT ON `Attribute` FOR EACH ROW SET NEW.DateCreate = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_attribute` AFTER UPDATE ON `Attribute` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Attribute SET DateCreate = OLD.DateCreate WHERE AttributeID = NEW.AttributeID;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CanStore`
--

DROP TABLE IF EXISTS `CanStore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CanStore` (
  `StorageID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `SubCategoryID` int NOT NULL,
  PRIMARY KEY (`StorageID`,`CategoryID`,`SubCategoryID`),
  KEY `fk_CanStore_SubCategoryID_idx` (`SubCategoryID`),
  KEY `fk_CanStore_SubCategoryID` (`CategoryID`,`SubCategoryID`),
  CONSTRAINT `fk_CanStore_StorageID` FOREIGN KEY (`StorageID`) REFERENCES `Storage` (`StorageID`),
  CONSTRAINT `fk_CanStore_SubCategoryID` FOREIGN KEY (`CategoryID`, `SubCategoryID`) REFERENCES `SubCategory` (`CategoryID`, `SubCategoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CanStore`
--

LOCK TABLES `CanStore` WRITE;
/*!40000 ALTER TABLE `CanStore` DISABLE KEYS */;
INSERT INTO `CanStore` VALUES (1,1,1);
/*!40000 ALTER TABLE `CanStore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cart`
--

DROP TABLE IF EXISTS `Cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cart` (
  `CustomerID` int NOT NULL,
  `DateLastEdit` datetime NOT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `fk_Cart_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cart`
--

LOCK TABLES `Cart` WRITE;
/*!40000 ALTER TABLE `Cart` DISABLE KEYS */;
INSERT INTO `Cart` VALUES (2,'2022-02-07 17:54:32');
/*!40000 ALTER TABLE `Cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_cart` BEFORE UPDATE ON `Cart` FOR EACH ROW SET NEW.DateLastEdit = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CartContainsProduct`
--

DROP TABLE IF EXISTS `CartContainsProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CartContainsProduct` (
  `CartID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`CartID`,`ProductID`),
  KEY `fk_CartContainsProduct_ProductID_idx` (`ProductID`),
  CONSTRAINT `fk_CartContainsProduct_CartID` FOREIGN KEY (`CartID`) REFERENCES `Cart` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CartContainsProduct_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CartContainsProduct_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartContainsProduct`
--

LOCK TABLES `CartContainsProduct` WRITE;
/*!40000 ALTER TABLE `CartContainsProduct` DISABLE KEYS */;
INSERT INTO `CartContainsProduct` VALUES (2,1,5);
/*!40000 ALTER TABLE `CartContainsProduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_cart_from_contents_insert` AFTER INSERT ON `CartContainsProduct` FOR EACH ROW UPDATE Cart SET DateLastEdit = SYSDATE() WHERE CustomerID = NEW.CartID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_cart_contains_product_quantity_insert` AFTER INSERT ON `CartContainsProduct` FOR EACH ROW IF ((SELECT Quantity FROM Product WHERE ProductID = NEW.ProductID) < NEW.Quantity) THEN
			SIGNAL SQLSTATE '45001'
				SET MESSAGE_TEXT = 'Cannot add to cart, insufficient quantity of product.';
		END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_cart_from_contents_update` AFTER UPDATE ON `CartContainsProduct` FOR EACH ROW UPDATE Cart SET DateLastEdit = SYSDATE() WHERE CustomerID = NEW.CartID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_cart_contains_product_quantity_update` AFTER UPDATE ON `CartContainsProduct` FOR EACH ROW IF ((SELECT Quantity FROM Product WHERE ProductID = NEW.ProductID) < NEW.Quantity) THEN
			SIGNAL SQLSTATE '45002'
				SET MESSAGE_TEXT = 'Cannot update cart, insufficient quantity of product.';
		END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_cart_from_contents_delete` AFTER DELETE ON `CartContainsProduct` FOR EACH ROW UPDATE Cart SET DateLastEdit = SYSDATE() WHERE CustomerID = OLD.CartID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `CartSummary`
--

DROP TABLE IF EXISTS `CartSummary`;
/*!50001 DROP VIEW IF EXISTS `CartSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CartSummary` AS SELECT 
 1 AS `CustomerID`,
 1 AS `DateLastEdit`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DateCreate` datetime NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Fruits','Healthy ma dude!','2022-02-07 17:54:30');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_category` BEFORE INSERT ON `Category` FOR EACH ROW SET NEW.DateCreate = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_category` AFTER UPDATE ON `Category` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Category SET DateCreate = OLD.DateCreate WHERE CategoryID = NEW.CategoryID;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CategoryHasAtt`
--

DROP TABLE IF EXISTS `CategoryHasAtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoryHasAtt` (
  `AttributeID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `AttributeNumValue` decimal(10,0) DEFAULT NULL,
  `AttributeQualValue` int DEFAULT NULL,
  PRIMARY KEY (`AttributeID`,`CategoryID`),
  KEY `fk_CategoryHasAtt_CategoryID_idx` (`CategoryID`),
  CONSTRAINT `fk_CategoryHasAtt_AttributeID` FOREIGN KEY (`AttributeID`) REFERENCES `Attribute` (`AttributeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_CategoryHasAtt_CategoryID` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_category_att_value_valid` CHECK (((`AttributeNumValue` is null) or (`AttributeQualValue` is null)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoryHasAtt`
--

LOCK TABLES `CategoryHasAtt` WRITE;
/*!40000 ALTER TABLE `CategoryHasAtt` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoryHasAtt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_category_handle_attribute_value_insert` BEFORE INSERT ON `CategoryHasAtt` FOR EACH ROW BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_category_handle_attribute_value_update` BEFORE UPDATE ON `CategoryHasAtt` FOR EACH ROW BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `AccountID` int NOT NULL,
  PRIMARY KEY (`AccountID`),
  CONSTRAINT `fk_Customer_AccountID` FOREIGN KEY (`AccountID`) REFERENCES `Account_` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (2);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_make_cart` AFTER INSERT ON `Customer` FOR EACH ROW INSERT INTO `mydb`.`Cart` VALUES (NEW.AccountID, SYSDATE()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `CustomerDiscount`
--

DROP TABLE IF EXISTS `CustomerDiscount`;
/*!50001 DROP VIEW IF EXISTS `CustomerDiscount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `CustomerDiscount` AS SELECT 
 1 AS `CustomerID`,
 1 AS `DiscountID`,
 1 AS `Code_`,
 1 AS `DateCreate`,
 1 AS `DateEnd`,
 1 AS `MaxDisAmount`,
 1 AS `MaxDisPercent`,
 1 AS `MaxUsage`,
 1 AS `CurrentUsageCount`,
 1 AS `RemainingUsage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `CustomerHasAddress`
--

DROP TABLE IF EXISTS `CustomerHasAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerHasAddress` (
  `CustomerID` int NOT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`AddressID`),
  KEY `fk_CustomerHasAddress_AddressID_idx` (`AddressID`),
  CONSTRAINT `fk_CustomerHasAddress_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_CustomerHasAddress_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerHasAddress`
--

LOCK TABLES `CustomerHasAddress` WRITE;
/*!40000 ALTER TABLE `CustomerHasAddress` DISABLE KEYS */;
INSERT INTO `CustomerHasAddress` VALUES (2,1);
/*!40000 ALTER TABLE `CustomerHasAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Delivery`
--

DROP TABLE IF EXISTS `Delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Delivery` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(45) NOT NULL,
  `DateAdded` datetime NOT NULL,
  `VehicleTypeID` int DEFAULT NULL,
  PRIMARY KEY (`DeliveryID`),
  UNIQUE KEY `DeliveryID_UNIQUE` (`DeliveryID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Delivery`
--

LOCK TABLES `Delivery` WRITE;
/*!40000 ALTER TABLE `Delivery` DISABLE KEYS */;
INSERT INTO `Delivery` VALUES (1,'Hammal Co.','2022-02-07 17:54:32',1);
/*!40000 ALTER TABLE `Delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_delivery` BEFORE INSERT ON `Delivery` FOR EACH ROW SET NEW.DateAdded = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_delivery` AFTER UPDATE ON `Delivery` FOR EACH ROW BEGIN
		IF (NEW.DateAdded != OLD.DateAdded) THEN
			UPDATE Delivery SET DateAdded = OLD.DateAdded WHERE DeliveryID = NEW.DeliveryID;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DiscountCode`
--

DROP TABLE IF EXISTS `DiscountCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DiscountCode` (
  `DiscountID` int NOT NULL AUTO_INCREMENT,
  `Code_` varchar(45) NOT NULL,
  `DateCreate` datetime NOT NULL,
  `DateEnd` datetime NOT NULL,
  `MaxDisAmount` int NOT NULL,
  `MaxDisPercent` int NOT NULL,
  `MaxUsage` int NOT NULL,
  `CurrentUsageCount` int NOT NULL,
  `AdminID` int DEFAULT NULL,
  PRIMARY KEY (`DiscountID`),
  KEY `fk_DiscountCode_AdminID_idx` (`AdminID`),
  CONSTRAINT `fk_DiscountCode_AdminID` FOREIGN KEY (`AdminID`) REFERENCES `Admin` (`AccountID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `c_DiscountCode_Valid_Range` CHECK ((`DateEnd` >= `DateCreate`)),
  CONSTRAINT `DiscountCode_chk_1` CHECK ((`MaxDisAmount` > 0)),
  CONSTRAINT `DiscountCode_chk_2` CHECK (((0 <= `MaxDisPercent`) and (`MaxDisPercent` < 100))),
  CONSTRAINT `DiscountCode_chk_3` CHECK ((0 < `MaxUsage`))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DiscountCode`
--

LOCK TABLES `DiscountCode` WRITE;
/*!40000 ALTER TABLE `DiscountCode` DISABLE KEYS */;
INSERT INTO `DiscountCode` VALUES (1,'AsGhAr','2022-02-07 17:54:33','2023-01-01 00:00:00',10,10,1,1,1),(2,'AkbAr','2022-02-07 17:54:33','2022-02-07 17:54:33',10,10,1,1,1);
/*!40000 ALTER TABLE `DiscountCode` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_discount_code` BEFORE INSERT ON `DiscountCode` FOR EACH ROW BEGIN
		IF (EXISTS (SELECT * FROM DiscountCode WHERE Code_ = NEW.Code_ AND SYSDATE() <= DateEnd)) THEN
			SIGNAL SQLSTATE '45006'
					SET MESSAGE_TEXT = 'Cannot create discount code, duplicate code.';
        END IF;
		SET NEW.DateCreate = SYSDATE();
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_discount_code` AFTER UPDATE ON `DiscountCode` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE DiscountCode SET DateCreate = OLD.DateCreate WHERE DiscountID = NEW.DiscountID;
		END IF;
        IF ((SELECT COUNT(*) FROM DiscountCode WHERE Code_ = NEW.Code_ AND SYSDATE() <= DateEnd) > 1) THEN
			SIGNAL SQLSTATE '45006'
					SET MESSAGE_TEXT = 'Cannot create discount code, duplicate code.';
        END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `OrderSummary`
--

DROP TABLE IF EXISTS `OrderSummary`;
/*!50001 DROP VIEW IF EXISTS `OrderSummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `OrderSummary` AS SELECT 
 1 AS `CustomerID`,
 1 AS `OrderID`,
 1 AS `ProductID`,
 1 AS `DiscountCodeID`,
 1 AS `Quantity`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `OrderSummaryByProduct`
--

DROP TABLE IF EXISTS `OrderSummaryByProduct`;
/*!50001 DROP VIEW IF EXISTS `OrderSummaryByProduct`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `OrderSummaryByProduct` AS SELECT 
 1 AS `CustomerID`,
 1 AS `OrderID`,
 1 AS `ProductID`,
 1 AS `DiscountCodeID`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `OrderTransfers`
--

DROP TABLE IF EXISTS `OrderTransfers`;
/*!50001 DROP VIEW IF EXISTS `OrderTransfers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `OrderTransfers` AS SELECT 
 1 AS `TransferID`,
 1 AS `CustomerID`,
 1 AS `Fee`,
 1 AS `Date`,
 1 AS `DeliveryID`,
 1 AS `FromStorageID`,
 1 AS `TOAddressID`,
 1 AS `OrderID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Order_`
--

DROP TABLE IF EXISTS `Order_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `IsComplete` tinyint NOT NULL,
  `DateCreate` datetime NOT NULL,
  `CurrentState` int NOT NULL,
  `FullDeliveryFee` int NOT NULL,
  `AddressID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `DiscountCodeID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Order_AddressID_idx` (`AddressID`),
  KEY `fk_Order_CustomerID_idx` (`CustomerID`),
  KEY `fk_Order_DiscountCodeID_idx` (`DiscountCodeID`),
  CONSTRAINT `fk_Order_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`AccountID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_DiscountCodeID` FOREIGN KEY (`DiscountCodeID`) REFERENCES `DiscountCode` (`DiscountID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Order__chk_1` CHECK (((0 <= `IsComplete`) and (`IsComplete` <= 1))),
  CONSTRAINT `Order__chk_2` CHECK (((1 <= `CurrentState`) and (`CurrentState` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_`
--

LOCK TABLES `Order_` WRITE;
/*!40000 ALTER TABLE `Order_` DISABLE KEYS */;
INSERT INTO `Order_` VALUES (1,0,'2022-02-07 17:54:33',3,0,1,2,1),(2,0,'2022-02-07 17:54:33',3,0,1,2,2);
/*!40000 ALTER TABLE `Order_` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_order` BEFORE INSERT ON `Order_` FOR EACH ROW SET NEW.DateCreate = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_discount_usage_count_insert` AFTER INSERT ON `Order_` FOR EACH ROW BEGIN
		IF (NEW.DiscountCodeID IS NOT NULL) THEN
			IF ((SELECT MaxUsage FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID) = 
					(SELECT CurrentUsageCount FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID)) THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Max usage of discount code reached, cannot use code.';
			ELSE 
				UPDATE DiscountCode SET CurrentUsageCount = CurrentUsageCount + 1 WHERE DiscountID = NEW.DiscountCodeID;
			END IF;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_valid_discount_code_usage_insert` AFTER INSERT ON `Order_` FOR EACH ROW IF ((NEW.DiscountCodeID IS NOT NULL)
			AND NOT EXISTS (SELECT * FROM Uses WHERE CustomerID = NEW.CustomerID AND DiscountCodeID = NEW.DiscountCodeID
				AND SYSDATE() <= (SELECT DateEnd FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID))) THEN
			SIGNAL SQLSTATE '45003'
				SET MESSAGE_TEXT = 'Customer cannot use discount code, no permission.';
		END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_order` AFTER UPDATE ON `Order_` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Order_ SET DateCreate = OLD.DateCreate WHERE OrderID = NEW.OrderID;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_discount_usage_count_update` AFTER UPDATE ON `Order_` FOR EACH ROW BEGIN
		IF (OLD.DiscountCodeID IS NOT NULL) THEN
			UPDATE DiscountCode SET CurrentUsageCount = CurrentUsageCount - 1 WHERE DiscountID = OLD.DiscountCodeID;
        END IF;
        IF (NEW.DiscountCodeID IS NOT NULL) THEN
			IF ((SELECT MaxUsage FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID) = 
					(SELECT CurrentUsageCount FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID)) THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Max usage of discount code reached, cannot use code.';
			ELSE 
				UPDATE DiscountCode SET CurrentUsageCount = CurrentUsageCount + 1 WHERE DiscountID = NEW.DiscountCodeID;
			END IF;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_valid_discount_code_usage_update` AFTER UPDATE ON `Order_` FOR EACH ROW IF ((NEW.DiscountCodeID IS NOT NULL)
			AND NOT EXISTS (SELECT * FROM Uses WHERE CustomerID = NEW.CustomerID AND DiscountCodeID = NEW.DiscountCodeID
				AND SYSDATE() <= (SELECT DateEnd FROM DiscountCode WHERE DiscountID = NEW.DiscountCodeID))) THEN
			SIGNAL SQLSTATE '45003'
				SET MESSAGE_TEXT = 'Customer cannot use new discount code, no permission.';
		END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PaymentMethod`
--

DROP TABLE IF EXISTS `PaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentMethod` (
  `PaymentMethodID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`PaymentMethodID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentMethod`
--

LOCK TABLES `PaymentMethod` WRITE;
/*!40000 ALTER TABLE `PaymentMethod` DISABLE KEYS */;
INSERT INTO `PaymentMethod` VALUES (1,'Capitalism Co.','copium.it');
/*!40000 ALTER TABLE `PaymentMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Picture`
--

DROP TABLE IF EXISTS `Picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Picture` (
  `ProductID` int NOT NULL,
  `ID` int NOT NULL,
  `PictureValue` blob NOT NULL,
  PRIMARY KEY (`ProductID`,`ID`),
  CONSTRAINT `fk_Picture_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Picture`
--

LOCK TABLES `Picture` WRITE;
/*!40000 ALTER TABLE `Picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `Picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_auto_partial_key_picture` BEFORE INSERT ON `Picture` FOR EACH ROW SET NEW.ID = (SELECT COUNT(*) FROM Picture WHERE ProductID = NEW.ProductID) + 1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Price` int NOT NULL,
  `Brand` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `DateCreate` datetime NOT NULL,
  `TotalPurchases` int NOT NULL,
  `Quantity` int NOT NULL,
  `CategoryID` int NOT NULL,
  `SubCategoryID` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductID_UNIQUE` (`ProductID`),
  KEY `fk_Product_SubCategoryID_idx` (`CategoryID`,`SubCategoryID`),
  CONSTRAINT `fk_Product_SubCategoryID` FOREIGN KEY (`CategoryID`, `SubCategoryID`) REFERENCES `SubCategory` (`CategoryID`, `SubCategoryID`) ON UPDATE CASCADE,
  CONSTRAINT `Product_chk_1` CHECK ((`Price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Moz',10,'Bayati Co.','Bayati?','2022-02-07 17:54:30',0,10,1,1);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_product` BEFORE INSERT ON `Product` FOR EACH ROW SET NEW.DateCreate = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_product` AFTER UPDATE ON `Product` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			UPDATE Product SET DateCreate = OLD.DateCreate WHERE ProductID = NEW.ProductID;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ProductHasAtt`
--

DROP TABLE IF EXISTS `ProductHasAtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductHasAtt` (
  `AttributeID` int NOT NULL,
  `ProductID` int NOT NULL,
  `AttributeNumValue` decimal(10,0) DEFAULT NULL,
  `AttributeQualValue` int DEFAULT NULL,
  PRIMARY KEY (`AttributeID`,`ProductID`),
  KEY `fk_ProductHasAtt_ProductID_idx` (`ProductID`),
  CONSTRAINT `fk_ProductHasAtt_AttributeID` FOREIGN KEY (`AttributeID`) REFERENCES `Attribute` (`AttributeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ProductHasAtt_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_product_att_value_valid` CHECK (((`AttributeNumValue` is null) or (`AttributeQualValue` is null)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductHasAtt`
--

LOCK TABLES `ProductHasAtt` WRITE;
/*!40000 ALTER TABLE `ProductHasAtt` DISABLE KEYS */;
INSERT INTO `ProductHasAtt` VALUES (3,1,NULL,2);
/*!40000 ALTER TABLE `ProductHasAtt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_product_handle_attribute_value_insert` BEFORE INSERT ON `ProductHasAtt` FOR EACH ROW BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_product_handle_attribute_value_update` BEFORE UPDATE ON `ProductHasAtt` FOR EACH ROW BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ProductRate`
--

DROP TABLE IF EXISTS `ProductRate`;
/*!50001 DROP VIEW IF EXISTS `ProductRate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ProductRate` AS SELECT 
 1 AS `ProductID`,
 1 AS `AVG(Rate)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `PurchaseAmount`
--

DROP TABLE IF EXISTS `PurchaseAmount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PurchaseAmount` (
  `ProductID` int NOT NULL,
  `PusrchaseAmountValue` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `PusrchaseAmountValue` (`PusrchaseAmountValue`),
  CONSTRAINT `fk_PurchaseAmount_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PurchaseAmount_chk_1` CHECK ((`PusrchaseAmountValue` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PurchaseAmount`
--

LOCK TABLES `PurchaseAmount` WRITE;
/*!40000 ALTER TABLE `PurchaseAmount` DISABLE KEYS */;
/*!40000 ALTER TABLE `PurchaseAmount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Quality`
--

DROP TABLE IF EXISTS `Quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Quality` (
  `AttQualitativeID` int NOT NULL,
  `ID` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`AttQualitativeID`,`ID`),
  CONSTRAINT `fk_Quality_Att_QualitativeID` FOREIGN KEY (`AttQualitativeID`) REFERENCES `Att_Qualitative` (`AttributeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quality`
--

LOCK TABLES `Quality` WRITE;
/*!40000 ALTER TABLE `Quality` DISABLE KEYS */;
INSERT INTO `Quality` VALUES (3,1,'Kam'),(3,2,'Motevasset'),(3,3,'Ziad');
/*!40000 ALTER TABLE `Quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `ProductID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `Date` datetime NOT NULL,
  `Comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Rate` int DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`CustomerID`),
  KEY `fk_Review_CustomerID_idx` (`CustomerID`),
  CONSTRAINT `fk_Review_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Review_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Review_chk_1` CHECK (((0 <= `Rate`) and (`Rate` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (1,2,'2022-02-07 17:54:32','Chera bayatie?!',99);
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_review` BEFORE INSERT ON `Review` FOR EACH ROW SET NEW.`Date` = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_review` BEFORE UPDATE ON `Review` FOR EACH ROW SET NEW.`Date` = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Storage`
--

DROP TABLE IF EXISTS `Storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Storage` (
  `StorageID` int NOT NULL AUTO_INCREMENT,
  `DateAddition` datetime NOT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`StorageID`),
  UNIQUE KEY `StorageID_UNIQUE` (`StorageID`),
  KEY `fk_Storage_AddressID_idx` (`AddressID`),
  CONSTRAINT `fk_Storage_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Storage`
--

LOCK TABLES `Storage` WRITE;
/*!40000 ALTER TABLE `Storage` DISABLE KEYS */;
INSERT INTO `Storage` VALUES (1,'2022-02-07 17:54:31',2);
/*!40000 ALTER TABLE `Storage` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_storage` BEFORE INSERT ON `Storage` FOR EACH ROW SET NEW.DateAddition = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_storage` AFTER UPDATE ON `Storage` FOR EACH ROW BEGIN
		IF (NEW.DateAddition != OLD.DateAddition) THEN
			UPDATE `Storage` SET DateAddition = OLD.DateAddition WHERE StorageID = NEW.StorageID;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Stores`
--

DROP TABLE IF EXISTS `Stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stores` (
  `StorageID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`StorageID`,`ProductID`),
  KEY `fk_Stores_ProductID_idx` (`ProductID`),
  CONSTRAINT `fk_Stores_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Stores_StorageID` FOREIGN KEY (`StorageID`) REFERENCES `Storage` (`StorageID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Stores_chk_1` CHECK ((0 <= `Quantity`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stores`
--

LOCK TABLES `Stores` WRITE;
/*!40000 ALTER TABLE `Stores` DISABLE KEYS */;
INSERT INTO `Stores` VALUES (1,1,10);
/*!40000 ALTER TABLE `Stores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_product_quantity_insert` AFTER INSERT ON `Stores` FOR EACH ROW UPDATE Product SET Quantity = Quantity + NEW.Quantity WHERE ProductID = NEW.ProductID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_valid_storage_insert` AFTER INSERT ON `Stores` FOR EACH ROW IF (NOT EXISTS (SELECT * FROM CanStore WHERE StorageID = NEW.StorageID
				AND SubCategoryID = (SELECT SubCategoryID FROM Product WHERE ProductID = NEW.ProductID))) THEN
			SIGNAL SQLSTATE '45004'
				SET MESSAGE_TEXT = 'Storage cannot store this product.';
		END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_product_quantity_update` AFTER UPDATE ON `Stores` FOR EACH ROW BEGIN
		UPDATE Product SET Quantity = Quantity - OLD.Quantity WHERE ProductID = OLD.ProductID;
		UPDATE Product SET Quantity = Quantity + NEW.Quantity WHERE ProductID = NEW.ProductID;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SubCategory`
--

DROP TABLE IF EXISTS `SubCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubCategory` (
  `CategoryID` int NOT NULL,
  `SubCategoryID` int NOT NULL,
  `Name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Description` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DateCreate` datetime NOT NULL,
  PRIMARY KEY (`CategoryID`,`SubCategoryID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  CONSTRAINT `fk_SubCategory_CateegoryID` FOREIGN KEY (`CategoryID`) REFERENCES `Category` (`CategoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubCategory`
--

LOCK TABLES `SubCategory` WRITE;
/*!40000 ALTER TABLE `SubCategory` DISABLE KEYS */;
INSERT INTO `SubCategory` VALUES (1,1,'Zard','Hm?','2022-02-07 17:54:30');
/*!40000 ALTER TABLE `SubCategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_subcategory` BEFORE INSERT ON `SubCategory` FOR EACH ROW SET NEW.DateCreate = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_auto_partial_key_subcategory` BEFORE INSERT ON `SubCategory` FOR EACH ROW SET NEW.SubCategoryID = (SELECT COUNT(*) FROM SubCategory WHERE CategoryID = NEW.CategoryID) + 1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_subcategory` BEFORE UPDATE ON `SubCategory` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			SET NEW.DateCreate = OLD.DateCreate;
		END IF;
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SubCategoryHasAtt`
--

DROP TABLE IF EXISTS `SubCategoryHasAtt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubCategoryHasAtt` (
  `AttributeID` int NOT NULL,
  `CategoryID` int NOT NULL,
  `SubCategoryID` int NOT NULL,
  `AttributeNumValue` decimal(10,0) DEFAULT NULL,
  `AttributeQualValue` int DEFAULT NULL,
  PRIMARY KEY (`AttributeID`,`SubCategoryID`,`CategoryID`),
  KEY `fk_SubCategoryHasAtt_SubCategoryID_idx` (`CategoryID`,`SubCategoryID`),
  CONSTRAINT `fk_SubCategoryHasAtt_AttributeID` FOREIGN KEY (`AttributeID`) REFERENCES `Attribute` (`AttributeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SubCategoryHasAtt_SubCategoryID` FOREIGN KEY (`CategoryID`, `SubCategoryID`) REFERENCES `SubCategory` (`CategoryID`, `SubCategoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `c_subcategory_att_value_valid` CHECK (((`AttributeNumValue` is null) or (`AttributeQualValue` is null)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubCategoryHasAtt`
--

LOCK TABLES `SubCategoryHasAtt` WRITE;
/*!40000 ALTER TABLE `SubCategoryHasAtt` DISABLE KEYS */;
INSERT INTO `SubCategoryHasAtt` VALUES (3,1,1,NULL,1);
/*!40000 ALTER TABLE `SubCategoryHasAtt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_subcategory_handle_attribute_value_insert` BEFORE INSERT ON `SubCategoryHasAtt` FOR EACH ROW BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_subcategory_handle_attribute_value_update` BEFORE UPDATE ON `SubCategoryHasAtt` FOR EACH ROW BEGIN
		IF (NEW.AttributeID IN (SELECT AttributeID FROM Att_String)) THEN
        BEGIN
			SET NEW.AttributeQualValue = NULL;
            SET NEW.AttributeNumValue = NULL;
		END;
        ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Numerical)) THEN
        BEGIN
			IF ((NEW.AttributeNumValue < (SELECT `Start` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))
				OR (NEW.AttributeNumValue > (SELECT `Finish` FROM Att_Numerical WHERE AttributeID = NEW.AttributeID))) THEN
					SIGNAL SQLSTATE '45005'
						SET MESSAGE_TEXT = 'Invalid value for numerical attribute, out of range.';
			END IF;
            SET NEW.AttributeQualValue = NULL;
		END;
		ELSEIF (NEW.AttributeID IN (SELECT AttributeID FROM Att_Qualitative)) THEN
        BEGIN
			IF (NEW.AttributeQualValue NOT IN (SELECT ID FROM Quality WHERE AttQualitativeID = NEW.AttributeID)) THEN
				SIGNAL SQLSTATE '45005'
					SET MESSAGE_TEXT = 'Invalid value for qualitative attribute, invalid quality.';
			END IF;
            SET NEW.AttributeNumValue = NULL;
		END;
		END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SubOrder`
--

DROP TABLE IF EXISTS `SubOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubOrder` (
  `OrderID` int NOT NULL,
  `SubOrderID` int NOT NULL,
  `CurrentState` int unsigned NOT NULL,
  `DateDelivery` datetime NOT NULL,
  `DateCreate` datetime NOT NULL,
  `DateLastEdit` datetime NOT NULL,
  `StorageID` int DEFAULT NULL,
  `AddressID` int NOT NULL,
  PRIMARY KEY (`OrderID`,`SubOrderID`),
  KEY `fk_SubOrder_StorageID_idx` (`StorageID`),
  KEY `fk_SubOrder_AddressID_idx` (`AddressID`),
  CONSTRAINT `fk_SubOrder_AddressID` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_SubOrder_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `Order_` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SubOrder_StorageID` FOREIGN KEY (`StorageID`) REFERENCES `Storage` (`StorageID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `c_SubOrder_Valid_Range` CHECK (((`DateCreate` <= `DateLastEdit`) and (`DateLastEdit` <= `DateDelivery`))),
  CONSTRAINT `SubOrder_chk_1` CHECK (((1 <= `CurrentState`) and (`CurrentState` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubOrder`
--

LOCK TABLES `SubOrder` WRITE;
/*!40000 ALTER TABLE `SubOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubOrder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_suborder` BEFORE INSERT ON `SubOrder` FOR EACH ROW BEGIN
		SET NEW.DateCreate = SYSDATE();
        SET NEW.DateLastEdit = SYSDATE();
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_auto_partial_key_suborder` BEFORE INSERT ON `SubOrder` FOR EACH ROW SET NEW.SubOrderID = (SELECT COUNT(*) FROM SubOrder WHERE OrderID = NEW.OrderID) + 1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_order_is_complete_and_state_insert` AFTER INSERT ON `SubOrder` FOR EACH ROW IF (NOT EXISTS (SELECT * FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID AND CurrentState != 1)) THEN
			UPDATE Order_ SET IsComplete = 1 WHERE OrderID = NEW.OrderID;
            UPDATE Order_ SET CurrentState = 1 WHERE OrderID = NEW.OrderID;
		END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_update_suborder` BEFORE UPDATE ON `SubOrder` FOR EACH ROW BEGIN
		IF (NEW.DateCreate != OLD.DateCreate) THEN
			SET NEW.DateCreate = OLD.DateCreate;
		END IF;
        SET NEW.DateLastEdit = SYSDATE();
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_product_total_purchases_update_of_suborder` AFTER UPDATE ON `SubOrder` FOR EACH ROW BEGIN
		IF (NEW.CurrentState = 1) THEN
			SET SQL_SAFE_UPDATES = 0;
			UPDATE Product SET TotalPurchases = TotalPurchases + 
				(SELECT SUM(Quantity) FROM SubOrderHasProduct WHERE ProductID = Product.ProductID 
					AND OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID);
			SET SQL_SAFE_UPDATES = 1;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_order_is_complete_and_state_update` AFTER UPDATE ON `SubOrder` FOR EACH ROW IF (NOT EXISTS (SELECT * FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID AND CurrentState != 1)) THEN
			UPDATE Order_ SET IsComplete = 1 WHERE OrderID = NEW.OrderID;
            UPDATE Order_ SET CurrentState = 1 WHERE OrderID = NEW.OrderID;
		END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SubOrderHasProduct`
--

DROP TABLE IF EXISTS `SubOrderHasProduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SubOrderHasProduct` (
  `ProductID` int NOT NULL,
  `OrderID` int NOT NULL,
  `SubOrderID` int NOT NULL,
  `Quantity` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`SubOrderID`,`OrderID`),
  KEY `SubOrderId_idx` (`SubOrderID`,`OrderID`),
  KEY `fk_SubOrderHasProduct_SubOrderId` (`OrderID`,`SubOrderID`),
  CONSTRAINT `fk_SubOrderHasProduct_ProductId` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_SubOrderHasProduct_SubOrderId` FOREIGN KEY (`OrderID`, `SubOrderID`) REFERENCES `SubOrder` (`OrderID`, `SubOrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `SubOrderHasProduct_chk_1` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubOrderHasProduct`
--

LOCK TABLES `SubOrderHasProduct` WRITE;
/*!40000 ALTER TABLE `SubOrderHasProduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubOrderHasProduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_product_total_purchases_insert` AFTER INSERT ON `SubOrderHasProduct` FOR EACH ROW BEGIN
		IF ((SELECT CurrentState FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID) = 1) THEN
			UPDATE Product SET TotalPurchases = TotalPurchases + NEW.Quantity WHERE ProductID = NEW.ProductID;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_product_total_purchases_update` AFTER UPDATE ON `SubOrderHasProduct` FOR EACH ROW BEGIN
		IF ((SELECT CurrentState FROM SubOrder WHERE OrderID = OLD.OrderID AND SubOrderID = OLD.SubOrderID) = 1) THEN
			UPDATE Product SET TotalPurchases = TotalPurchases - OLD.Quantity WHERE ProductID = OLD.ProductID;
        END IF;
		IF ((SELECT CurrentState FROM SubOrder WHERE OrderID = NEW.OrderID AND SubOrderID = NEW.SubOrderID) = 1) THEN
			UPDATE Product SET TotalPurchases = TotalPurchases + NEW.Quantity WHERE ProductID = NEW.ProductID;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `SubOrderTransfers`
--

DROP TABLE IF EXISTS `SubOrderTransfers`;
/*!50001 DROP VIEW IF EXISTS `SubOrderTransfers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `SubOrderTransfers` AS SELECT 
 1 AS `TransferID`,
 1 AS `StorageID`,
 1 AS `Fee`,
 1 AS `Date`,
 1 AS `DeliveryID`,
 1 AS `FromStorageID`,
 1 AS `TOAddressID`,
 1 AS `SubOrderID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Transaction_`
--

DROP TABLE IF EXISTS `Transaction_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction_` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `Value_` int NOT NULL DEFAULT '0',
  `CurrentState` int NOT NULL,
  `Date` datetime NOT NULL,
  `AccountID` int DEFAULT NULL,
  `PaymentMethodID` int DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `fk_Transaction_AccountID_idx` (`AccountID`),
  KEY `fk_Transaction_PaymentMethodID_idx` (`PaymentMethodID`),
  CONSTRAINT `fk_Transaction_AccountID0` FOREIGN KEY (`AccountID`) REFERENCES `Account_` (`AccountID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Transaction_PaymentMethodID0` FOREIGN KEY (`PaymentMethodID`) REFERENCES `PaymentMethod` (`PaymentMethodID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Transaction__chk_1` CHECK ((`Value_` >= 0)),
  CONSTRAINT `Transaction__chk_2` CHECK (((1 <= `CurrentState`) and (`CurrentState` <= 3)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction_`
--

LOCK TABLES `Transaction_` WRITE;
/*!40000 ALTER TABLE `Transaction_` DISABLE KEYS */;
INSERT INTO `Transaction_` VALUES (1,10,1,'2022-02-07 17:54:32',1,1);
/*!40000 ALTER TABLE `Transaction_` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_transaction` BEFORE INSERT ON `Transaction_` FOR EACH ROW SET NEW.`Date` = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Transfer`
--

DROP TABLE IF EXISTS `Transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transfer` (
  `TransferID` int NOT NULL AUTO_INCREMENT,
  `Fee` int unsigned NOT NULL DEFAULT '0',
  `Date` datetime NOT NULL,
  `DeliveryID` int DEFAULT NULL,
  `FromStorageID` int DEFAULT NULL,
  `ToAddressID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `SubOrderID` int DEFAULT NULL,
  PRIMARY KEY (`TransferID`),
  KEY `fk_Transfer_DeliveryID_idx` (`DeliveryID`),
  KEY `fk_Transfer_AddressID_idx` (`ToAddressID`),
  KEY `fk_Transfer_StorageID_idx` (`FromStorageID`),
  KEY `fk_Transfer_OrderID_idx` (`OrderID`),
  KEY `fk_Transfer_SubOrderID_idx` (`SubOrderID`),
  KEY `fk_Transfer_SubOrderID` (`OrderID`,`SubOrderID`),
  CONSTRAINT `fk_Transfer_AddressID` FOREIGN KEY (`ToAddressID`) REFERENCES `Address` (`AddressID`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Transfer_DeliveryID` FOREIGN KEY (`DeliveryID`) REFERENCES `Delivery` (`DeliveryID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Transfer_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `Order_` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Transfer_StorageID` FOREIGN KEY (`FromStorageID`) REFERENCES `Storage` (`StorageID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_Transfer_SubOrderID` FOREIGN KEY (`OrderID`, `SubOrderID`) REFERENCES `SubOrder` (`OrderID`, `SubOrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Transfer_chk_1` CHECK ((`Fee` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transfer`
--

LOCK TABLES `Transfer` WRITE;
/*!40000 ALTER TABLE `Transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transfer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_insert_transfer` BEFORE INSERT ON `Transfer` FOR EACH ROW SET NEW.`Date` = SYSDATE() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_full_delivery_fee_insert` AFTER INSERT ON `Transfer` FOR EACH ROW BEGIN
		IF (NEW.OrderID IS NOT NULL) THEN
			UPDATE Order_ SET FullDeliveryFee = FullDeliveryFee + NEW.Fee WHERE OrderID = NEW.OrderID;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_full_delivery_fee_update` AFTER UPDATE ON `Transfer` FOR EACH ROW BEGIN
		IF (OLD.OrderID IS NOT NULL) THEN
			UPDATE Order_ SET FullDeliveryFee = FullDeliveryFee - OLD.Fee WHERE OrderID = OLD.OrderID;
        END IF;
		IF (NEW.OrderID IS NOT NULL) THEN
			UPDATE Order_ SET FullDeliveryFee = FullDeliveryFee + NEW.Fee WHERE OrderID = NEW.OrderID;
        END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Uses`
--

DROP TABLE IF EXISTS `Uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Uses` (
  `CustomerID` int NOT NULL,
  `DiscountCodeID` int NOT NULL,
  PRIMARY KEY (`CustomerID`,`DiscountCodeID`),
  KEY `fk_Uses_DiscountCodeID_idx` (`DiscountCodeID`),
  CONSTRAINT `fk_Uses_CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `Customer` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Uses_DiscountCodeID` FOREIGN KEY (`DiscountCodeID`) REFERENCES `DiscountCode` (`DiscountID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Uses`
--

LOCK TABLES `Uses` WRITE;
/*!40000 ALTER TABLE `Uses` DISABLE KEYS */;
INSERT INTO `Uses` VALUES (2,1),(2,2);
/*!40000 ALTER TABLE `Uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VehicleType`
--

DROP TABLE IF EXISTS `VehicleType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VehicleType` (
  `DeliveryID` int NOT NULL,
  `VehicleTypeValue` varchar(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`,`VehicleTypeValue`),
  CONSTRAINT `fk_VehicleType_DeliveryID` FOREIGN KEY (`DeliveryID`) REFERENCES `Delivery` (`DeliveryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VehicleType`
--

LOCK TABLES `VehicleType` WRITE;
/*!40000 ALTER TABLE `VehicleType` DISABLE KEYS */;
INSERT INTO `VehicleType` VALUES (1,'Truck');
/*!40000 ALTER TABLE `VehicleType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Video`
--

DROP TABLE IF EXISTS `Video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Video` (
  `ProductID` int NOT NULL,
  `ID` int NOT NULL,
  `VideoValue` blob NOT NULL,
  PRIMARY KEY (`ProductID`,`ID`),
  CONSTRAINT `fk_Video_ProductID` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Video`
--

LOCK TABLES `Video` WRITE;
/*!40000 ALTER TABLE `Video` DISABLE KEYS */;
/*!40000 ALTER TABLE `Video` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trig_handle_auto_partial_key_video` BEFORE INSERT ON `Video` FOR EACH ROW SET NEW.ID = (SELECT COUNT(*) FROM Video WHERE ProductID = NEW.ProductID) + 1 */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `WorksOrManages`
--

DROP TABLE IF EXISTS `WorksOrManages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorksOrManages` (
  `StorageID` int NOT NULL,
  `AdminID` int NOT NULL,
  PRIMARY KEY (`StorageID`,`AdminID`),
  KEY `fk_WorksOrManages_AdminID_idx` (`AdminID`),
  CONSTRAINT `fk_WorksOrManages_AdminID` FOREIGN KEY (`AdminID`) REFERENCES `Admin` (`AccountID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_WorksOrManages_StorageID` FOREIGN KEY (`StorageID`) REFERENCES `Storage` (`StorageID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorksOrManages`
--

LOCK TABLES `WorksOrManages` WRITE;
/*!40000 ALTER TABLE `WorksOrManages` DISABLE KEYS */;
INSERT INTO `WorksOrManages` VALUES (1,1);
/*!40000 ALTER TABLE `WorksOrManages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--

--
-- Final view structure for view `AccountBalance`
--

/*!50001 DROP VIEW IF EXISTS `AccountBalance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AccountBalance` AS select `Account_`.`AccountID` AS `AccountID`,(`AccountTransactionSummary`.`Value_` - `AccountOrderSummary`.`Paid`) AS `Balance` from ((`Account_` join `AccountTransactionSummary` on((`Account_`.`AccountID` = `AccountTransactionSummary`.`AccountID`))) join `AccountOrderSummary` on((`Account_`.`AccountID` = `AccountOrderSummary`.`AccountID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AccountInfo`
--

/*!50001 DROP VIEW IF EXISTS `AccountInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AccountInfo` AS select `Account_`.`AccountID` AS `AccountId`,`Account_`.`FirstName` AS `FirstName`,`Account_`.`LastName` AS `LastName`,`Account_`.`DateCreate` AS `DateCreate`,`Account_`.`Email` AS `Email` from `Account_` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AccountOrderSummary`
--

/*!50001 DROP VIEW IF EXISTS `AccountOrderSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AccountOrderSummary` AS select `Account_`.`AccountID` AS `AccountID`,sum(`OrderSummary`.`Price`) AS `Paid` from (`Account_` join `OrderSummary` on((`Account_`.`AccountID` = `OrderSummary`.`CustomerID`))) group by `OrderSummary`.`CustomerID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `AccountTransactionSummary`
--

/*!50001 DROP VIEW IF EXISTS `AccountTransactionSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `AccountTransactionSummary` AS select `Account_`.`AccountID` AS `AccountID`,sum(`Transaction_`.`Value_`) AS `Value_` from (`Account_` join `Transaction_` on((`Transaction_`.`AccountID` = `Account_`.`AccountID`))) group by `Transaction_`.`AccountID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CartSummary`
--

/*!50001 DROP VIEW IF EXISTS `CartSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CartSummary` AS select `Cart`.`CustomerID` AS `CustomerID`,`Cart`.`DateLastEdit` AS `DateLastEdit`,sum((`Product`.`Price` * `CartContainsProduct`.`Quantity`)) AS `Price` from ((`Cart` join `CartContainsProduct` on((`Cart`.`CustomerID` = `CartContainsProduct`.`CartID`))) join `Product` on((`Product`.`ProductID` = `CartContainsProduct`.`ProductID`))) group by `Cart`.`CustomerID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CustomerDiscount`
--

/*!50001 DROP VIEW IF EXISTS `CustomerDiscount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `CustomerDiscount` AS select `Uses`.`CustomerID` AS `CustomerID`,`DiscountCode`.`DiscountID` AS `DiscountID`,`DiscountCode`.`Code_` AS `Code_`,`DiscountCode`.`DateCreate` AS `DateCreate`,`DiscountCode`.`DateEnd` AS `DateEnd`,`DiscountCode`.`MaxDisAmount` AS `MaxDisAmount`,`DiscountCode`.`MaxDisPercent` AS `MaxDisPercent`,`DiscountCode`.`MaxUsage` AS `MaxUsage`,`DiscountCode`.`CurrentUsageCount` AS `CurrentUsageCount`,(`DiscountCode`.`MaxUsage` - `DiscountCode`.`CurrentUsageCount`) AS `RemainingUsage` from (`DiscountCode` join `Uses` on((`DiscountCode`.`DiscountID` = `Uses`.`DiscountCodeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OrderSummary`
--

/*!50001 DROP VIEW IF EXISTS `OrderSummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `OrderSummary` AS select `OrderSummaryByProduct`.`CustomerID` AS `CustomerID`,`OrderSummaryByProduct`.`OrderID` AS `OrderID`,`OrderSummaryByProduct`.`ProductID` AS `ProductID`,`OrderSummaryByProduct`.`DiscountCodeID` AS `DiscountCodeID`,`OrderSummaryByProduct`.`Quantity` AS `Quantity`,(select max(`AllPrices`.`Price_`) from (values row((sum((`Product`.`Price` * `OrderSummaryByProduct`.`Quantity`)) * `DiscountCode`.`MaxDisPercent`)),row((sum((`Product`.`Price` * `OrderSummaryByProduct`.`Quantity`)) - `DiscountCode`.`MaxDisAmount`))) `AllPrices` (`Price_`)) AS `Price` from (`DiscountCode` left join (`OrderSummaryByProduct` join `Product` on((`Product`.`ProductID` = `OrderSummaryByProduct`.`ProductID`))) on((`DiscountCode`.`DiscountID` = `OrderSummaryByProduct`.`DiscountCodeID`))) group by `OrderSummaryByProduct`.`OrderID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OrderSummaryByProduct`
--

/*!50001 DROP VIEW IF EXISTS `OrderSummaryByProduct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `OrderSummaryByProduct` AS select `Order_`.`CustomerID` AS `CustomerID`,`Order_`.`OrderID` AS `OrderID`,`SubOrderHasProduct`.`ProductID` AS `ProductID`,`Order_`.`DiscountCodeID` AS `DiscountCodeID`,sum(`SubOrderHasProduct`.`Quantity`) AS `Quantity` from ((`Order_` join `SubOrder` on((`Order_`.`OrderID` = `SubOrder`.`OrderID`))) join `SubOrderHasProduct` on((`SubOrderHasProduct`.`SubOrderID` = `SubOrder`.`SubOrderID`))) group by `SubOrderHasProduct`.`ProductID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `OrderTransfers`
--

/*!50001 DROP VIEW IF EXISTS `OrderTransfers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `OrderTransfers` AS select `Transfer`.`TransferID` AS `TransferID`,`Order_`.`CustomerID` AS `CustomerID`,`Transfer`.`Fee` AS `Fee`,`Transfer`.`Date` AS `Date`,`Transfer`.`DeliveryID` AS `DeliveryID`,`Transfer`.`FromStorageID` AS `FromStorageID`,`Transfer`.`ToAddressID` AS `TOAddressID`,`Order_`.`OrderID` AS `OrderID` from (`Transfer` join `Order_` on((`Transfer`.`OrderID` = `Order_`.`OrderID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ProductRate`
--

/*!50001 DROP VIEW IF EXISTS `ProductRate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ProductRate` AS select `Product`.`ProductID` AS `ProductID`,avg(`Review`.`Rate`) AS `AVG(Rate)` from (`Product` join `Review` on((`Product`.`ProductID` = `Review`.`ProductID`))) group by `Product`.`ProductID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SubOrderTransfers`
--

/*!50001 DROP VIEW IF EXISTS `SubOrderTransfers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SubOrderTransfers` AS select `Transfer`.`TransferID` AS `TransferID`,`SubOrder`.`StorageID` AS `StorageID`,`Transfer`.`Fee` AS `Fee`,`Transfer`.`Date` AS `Date`,`Transfer`.`DeliveryID` AS `DeliveryID`,`Transfer`.`FromStorageID` AS `FromStorageID`,`Transfer`.`ToAddressID` AS `TOAddressID`,`SubOrder`.`SubOrderID` AS `SubOrderID` from (`Transfer` join `SubOrder` on((`Transfer`.`SubOrderID` = `SubOrder`.`SubOrderID`))) */;
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

-- Dump completed on 2022-02-07 17:58:43
