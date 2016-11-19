-- MySQL dump 10.15  Distrib 10.0.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: farming_sys
-- ------------------------------------------------------
-- Server version	10.0.27-MariaDB-0ubuntu0.16.04.1

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
-- Table structure for table `fertilizer`
--

DROP TABLE IF EXISTS `fertilizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fertilizer` (
  `fertilizerid` int(4) NOT NULL AUTO_INCREMENT,
  `fertilizerbrand` varchar(20) DEFAULT NULL,
  `fertilizertype` varchar(20) DEFAULT NULL,
  `nitrogen` tinyint(2) DEFAULT NULL,
  `phosphorus` tinyint(2) DEFAULT NULL,
  `potassium` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`fertilizerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fertilizer`
--

LOCK TABLES `fertilizer` WRITE;
/*!40000 ALTER TABLE `fertilizer` DISABLE KEYS */;
/*!40000 ALTER TABLE `fertilizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plot`
--

DROP TABLE IF EXISTS `plot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plot` (
  `plotid` int(5) NOT NULL AUTO_INCREMENT,
  `zone` varchar(3) DEFAULT NULL,
  `row` int(3) DEFAULT NULL,
  `col` int(3) DEFAULT NULL,
  PRIMARY KEY (`plotid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plot`
--

LOCK TABLES `plot` WRITE;
/*!40000 ALTER TABLE `plot` DISABLE KEYS */;
/*!40000 ALTER TABLE `plot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `requestid` int(5) NOT NULL AUTO_INCREMENT,
  `planneddate` date DEFAULT NULL,
  `actualdate` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `userid` int(4) NOT NULL,
  `fertilizerid` int(4) DEFAULT NULL,
  PRIMARY KEY (`requestid`),
  KEY `request_userid_fk` (`userid`),
  KEY `request_fertilizerid_fk` (`fertilizerid`),
  CONSTRAINT `request_fertilizerid_fk` FOREIGN KEY (`fertilizerid`) REFERENCES `fertilizer` (`fertilizerid`),
  CONSTRAINT `request_userid_fk` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestplot`
--

DROP TABLE IF EXISTS `requestplot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requestplot` (
  `requestid` int(5) NOT NULL,
  `plotid` int(5) NOT NULL,
  KEY `requestplot_requestid_fk` (`requestid`),
  KEY `requestplot_plotid_fk` (`plotid`),
  CONSTRAINT `requestplot_plotid_fk` FOREIGN KEY (`plotid`) REFERENCES `plot` (`plotid`) ON DELETE CASCADE,
  CONSTRAINT `requestplot_requestid_fk` FOREIGN KEY (`requestid`) REFERENCES `request` (`requestid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestplot`
--

LOCK TABLES `requestplot` WRITE;
/*!40000 ALTER TABLE `requestplot` DISABLE KEYS */;
/*!40000 ALTER TABLE `requestplot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-14 22:11:56
