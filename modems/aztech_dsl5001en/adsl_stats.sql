-- MySQL dump 10.13  Distrib 5.6.17, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: adsl
-- ------------------------------------------------------
-- Server version	5.6.17-1~dotdeb.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `adsl`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `adsl` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `adsl`;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `processed` tinyint(1) DEFAULT '0',
  `datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `linestate` varchar(16) DEFAULT NULL,
  `opmode` varchar(32) DEFAULT NULL,
  `cellde` float DEFAULT NULL,
  `linkret` float DEFAULT NULL,
  `initerr` float DEFAULT NULL,
  `inittime` float DEFAULT NULL,
  `lossfram` float DEFAULT NULL,
  `errsecs` float DEFAULT NULL,
  `severr` float DEFAULT NULL,
  `snrdown` float DEFAULT NULL,
  `snrup` float DEFAULT NULL,
  `attdwn` float DEFAULT NULL,
  `attup` float DEFAULT NULL,
  `powdwn` float DEFAULT NULL,
  `powup` float DEFAULT NULL,
  `drdwn` float DEFAULT NULL,
  `drup` float DEFAULT NULL,
  `fecdwn` float DEFAULT NULL,
  `fecup` float DEFAULT NULL,
  `crcdwn` float DEFAULT NULL,
  `crcup` float DEFAULT NULL,
  `hecdwn` float DEFAULT NULL,
  `RID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`RID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-23 20:12:30
