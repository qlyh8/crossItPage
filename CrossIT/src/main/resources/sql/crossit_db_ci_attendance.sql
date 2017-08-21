-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: crossit_db
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `ci_attendance`
--

DROP TABLE IF EXISTS `ci_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_attendance` (
  `at_seq` int(11) NOT NULL COMMENT '출석 시퀀스',
  `at_rest` float NOT NULL DEFAULT '3' COMMENT '잔여',
  `at_present` int(11) NOT NULL DEFAULT '0' COMMENT '출석',
  `at_late` int(11) NOT NULL DEFAULT '0' COMMENT '지각',
  `at_absent` int(11) NOT NULL DEFAULT '0' COMMENT '결석',
  `at_plus` int(11) NOT NULL DEFAULT '0' COMMENT '가산',
  `2017_05_06` varchar(45) DEFAULT '',
  `2017_05_13` varchar(45) DEFAULT '',
  `2017_05_27` varchar(45) DEFAULT '',
  `2017_05_29` varchar(45) DEFAULT '',
  `2017_06_03` varchar(45) DEFAULT '',
  `2017_06_10` varchar(45) DEFAULT '',
  `AT_DATE` varchar(50) DEFAULT '',
  PRIMARY KEY (`at_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='출석 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_attendance`
--

LOCK TABLES `ci_attendance` WRITE;
/*!40000 ALTER TABLE `ci_attendance` DISABLE KEYS */;
INSERT INTO `ci_attendance` VALUES (1,0.5,2,1,2,0,'출석','결석','출석','','결석','지각',''),(2,3,5,0,0,0,'출석','출석','출석','','출석','출석',''),(3,1,3,0,2,0,'출석','결석','결석','','출석','출석',''),(4,2.5,2,1,0,0,'','','출석','','지각','출석',''),(5,1,3,0,2,0,'출석','출석','출석','','결석','결석',''),(6,2,3,2,0,0,'출석','출석','지각','','출석','지각',''),(7,2,3,2,0,0,'출석','출석','지각','','지각','출석',''),(8,1.5,3,1,1,0,'출석','출석','지각','','출석','결석',''),(9,1.5,3,1,1,0,'출석','출석','출석','','지각','결석',''),(10,1,5,0,2,0,'출석','출석','출석','','결석','결석',''),(11,4,5,1,0,1,'출석','출석','출석','가산','출석','출석',''),(12,1.5,3,1,1,0,'출석','결석','출석','','지각','출석',''),(13,3,4,0,1,1,'출석','출석','출석','가산','출석','결석',''),(14,2.5,4,1,0,0,'출석','지각','출석','','출석','출석',''),(15,1.5,3,1,1,0,'출석','출석','출석','','지각','결석',''),(16,1,4,2,1,0,'출석','지각','결석','','지각','출석',''),(17,2.5,4,1,0,0,'출석','출석','출석','','출석','지각',''),(18,1.5,2,1,1,0,'','출석','출석','','지각','결석',''),(19,0.5,2,1,2,0,'출석','결석','출석','','결석','지각',''),(20,0.5,2,1,2,0,'결석','지각','출석','','출석','결석',''),(21,2,4,0,1,0,'출석','결석','출석','','출석','출석',''),(22,3,5,0,0,0,'출석','출석','출석','','출석','출석',''),(23,2,4,0,1,0,'출석','결석','출석','','출석','출석',''),(24,1,3,0,2,0,'결석','출석','출석','','출석','결석',''),(25,3,5,0,0,0,'출석','출석','출석','','출석','출석','');
/*!40000 ALTER TABLE `ci_attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-21  4:55:13
