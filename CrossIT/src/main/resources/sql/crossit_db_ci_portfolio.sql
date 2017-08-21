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
-- Table structure for table `ci_portfolio`
--

DROP TABLE IF EXISTS `ci_portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_portfolio` (
  `pf_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `pf_name` varchar(50) NOT NULL COMMENT '포트폴리오이름',
  `pf_partlist` varchar(400) NOT NULL COMMENT '참여명단',
  `pf_section` varchar(50) NOT NULL COMMENT '분야',
  `pf_objv` varchar(100) NOT NULL COMMENT '목적',
  `pf_period` varchar(50) DEFAULT NULL COMMENT '개발기간',
  `pf_explain` varchar(200) DEFAULT NULL COMMENT '설명',
  `pf_link` varchar(400) DEFAULT NULL COMMENT '링크주소',
  `reg_date` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`pf_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='문의';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_portfolio`
--

LOCK TABLES `ci_portfolio` WRITE;
/*!40000 ALTER TABLE `ci_portfolio` DISABLE KEYS */;
INSERT INTO `ci_portfolio` VALUES (1,'모취모취','박재현,유인준,이동건,이승태,이현빈,한여경','web','포트폴리오 제작 사이트',NULL,NULL,NULL,'2017-07-20 18:35:39'),(2,'자글자글','김재석,김진우,오혜윤,윤준일,이한솔,장철운','app','자취생을 위한 웹 사이트',NULL,NULL,NULL,'2017-07-22 18:35:39'),(3,'모여라 미대생','김성재,김화영,유태양,최영준,한혜수','web','미대생을 위한 어플리케이션',NULL,NULL,NULL,'2017-07-23 18:35:39'),(4,'크로스아이티','신윤희,유인준,이진용,최우영,허은녕','web','크로스아이티 동아리 웹사이트',NULL,NULL,NULL,'2017-07-24 18:35:39'),(5,'픽플','구동림,권예슬,김동인,김지영','web','픽플 웹사이트',NULL,NULL,NULL,'2017-07-25 18:35:39');
/*!40000 ALTER TABLE `ci_portfolio` ENABLE KEYS */;
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
