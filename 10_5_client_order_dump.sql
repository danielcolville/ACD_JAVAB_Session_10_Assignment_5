-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: client_db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idclient` int(11) DEFAULT NULL,
  `client_name` text,
  `address` text,
  `city` text,
  `Pin` int(11) DEFAULT NULL,
  `State` text,
  `total_bal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'ABCCORP','1hui2h11','Raleigh',11101,'NC',10000),(2,'XYZCORP','3155 North Springs Parkway','Atlanta',30303,'GA',50000),(3,'BASF','855 abc road','Tezpur',31101,'NY',200000),(4,'EvilCorp','867 Random Avenue','Ann Arbor',33333,'MI',10000),(5,'Eastman','8765 Chemical Road','Trenton',12355,'NJ',100000);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idorder` int(11) DEFAULT NULL,
  `order_date` text,
  `client_number` int(11) DEFAULT NULL,
  `salesman_number` int(11) DEFAULT NULL,
  `billed_whole_payment` int(11) DEFAULT NULL,
  `delivery_date` text,
  `prod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2019-01-01',1,1,0,'2019-01-05',1),(2,'2019-02-01',1,2,1,'2019-02-04',2),(4,'2018-11-11',2,2,1,'2018-11-12',4),(5,'2017-01-01',3,3,1,'2018-01-10',5),(6,'2016-01-01',3,4,0,'2018-01-01',3),(7,'2015-01-01',4,5,0,'2099-01-01',5),(8,'2016-01-11',5,4,0,'2016-02-11',2),(9,'2004',2,1,0,'2005',3);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idproduct` int(11) DEFAULT NULL,
  `prod_name` text,
  `selling_price` double DEFAULT NULL,
  `manufacturer` text,
  `new_price` double DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'widget1',100,'widgetCorp',0,'Product 1'),(2,'wiget2',50,'widgetCorp',0,'Product 2'),(3,'pricyWidget',2001,'luxuryWidgetCorp',0,'Pricy 1'),(4,'pricyWidget2',2000,'luxuryWidgetCorp',0,'Pricy 2'),(5,'NeedlesslyMarkedUpWidget',30000,'GlobalMegaCorp',0,'Too expensive');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesman` (
  `idsalesman` int(11) DEFAULT NULL,
  `name` text,
  `addresses` text,
  `city` text,
  `pin_code` int(11) DEFAULT NULL,
  `state` text,
  `salary` double DEFAULT NULL,
  `delivery_date` text,
  `total_qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO `salesman` VALUES (1,'Jane Doe','addr1','New YOrk',11111,'NY',1000,'2019-01-01',10),(2,'JOhn Smith','addr2','Philadelphia',12345,'PA',500,'2019-01-01',5),(3,'Willy Loman','Address','New York',55555,'NY',1,'1955-01-25',1000),(4,'Dwight','Addr3','Scranton',18015,'PA',1234,'1999-01-01',4000),(5,'Bob','Addr4','Megacity',99999,'CA',1500,'1876-01-01',500);
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-23  0:05:41
