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
-- Table structure for table `ci_user`
--

DROP TABLE IF EXISTS `ci_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_user` (
  `user_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '사용자 시퀀스',
  `user_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '사용자 아이디',
  `user_pw` varchar(45) NOT NULL COMMENT '사용자 패스워드',
  `user_kind` char(1) NOT NULL DEFAULT 'N' COMMENT '회원 구분(관리자:A, 일반유저:U, 비회원:N)',
  `user_status` char(1) NOT NULL DEFAULT 'N' COMMENT '사용자상태(활성화:Y, 비활성화:N)',
  `user_term` int(11) NOT NULL DEFAULT '0' COMMENT '기수(default:0)',
  `user_name` varchar(45) NOT NULL COMMENT '사용자 이름',
  `user_birth` varchar(45) DEFAULT '' COMMENT '생년월일',
  `user_gender` varchar(45) DEFAULT '' COMMENT '성별',
  `user_phone` varchar(45) DEFAULT '' COMMENT '전화번호',
  `user_addr` varchar(255) DEFAULT '' COMMENT '집주소',
  `user_part` varchar(45) DEFAULT '' COMMENT '분야(기획/개발/ 디자인)',
  `user_letmein` text COMMENT '자기소개',
  `user_motive` text COMMENT '지원동기',
  `user_lastword` text COMMENT '하고싶은말',
  `user_univ` varchar(45) DEFAULT '' COMMENT '학교',
  `user_major` varchar(45) DEFAULT '' COMMENT '학과',
  `user_enter` varchar(45) DEFAULT '' COMMENT '입학년도',
  `user_stat` varchar(45) DEFAULT '' COMMENT '학적상태',
  `user_place` varchar(45) DEFAULT NULL COMMENT '직장명',
  `user_leave` varchar(45) DEFAULT '' COMMENT '연차',
  `user_overtime` varchar(45) DEFAULT '' COMMENT '야근빈도',
  `user_wendwork` varchar(45) DEFAULT '' COMMENT '주말출근',
  `org_file_nm` varchar(255) DEFAULT '' COMMENT '원본파일이름',
  `save_file_nm` varchar(255) DEFAULT '' COMMENT '저장파일이름',
  `file_path` varchar(255) DEFAULT '' COMMENT '파일경로',
  `reg_user_seq` int(11) DEFAULT NULL COMMENT '등록자 번호',
  `reg_date` datetime DEFAULT NULL COMMENT '등록일시',
  `upd_user_seq` int(11) DEFAULT NULL COMMENT '수정자 번호',
  `upd_date` datetime DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`user_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='회원 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_user`
--

LOCK TABLES `ci_user` WRITE;
/*!40000 ALTER TABLE `ci_user` DISABLE KEYS */;
INSERT INTO `ci_user` VALUES (1,'jrk816','*EEA97629300AC59695EEF3D2B308B2EADC5A4BED','A','Y',1,'신윤희','940816','여','01045014349','경기도 성남시 분당구 서현동','개발','','','','숭실대학교','컴퓨터학부','2014년','휴학','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-08 15:00:35',NULL,NULL),(2,'0101','*165D8E0C1E7CC33F459FD70B0DFE9B0C9AF82EBC','U','Y',1,'구동림','','남','','OO도 OO시 OO구 OO동','개발','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:31:05',NULL,NULL),(3,'0102','*43361F0DB30BAA9DD58DB584B3262FEC05984764','U','Y',1,'권예슬','','여','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:41:19',NULL,NULL),(4,'0103','*7ECE5C72BC9890862CD8CFF7B3090E5027EB0F70','U','Y',1,'김동인','','남','','OO도 OO시 OO구 OO동','개발','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:43:12',NULL,NULL),(5,'0104','*38CF59781EBF20DE205071931A76B593E001D35A','U','Y',1,'김성재','','남','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:43:51',NULL,NULL),(6,'0105','*0203DA19A4E2A8775C5B90D76BF0B3BE03C8B840','A','Y',1,'김재석','','남','','OO도 OO시 OO구 OO동','개발','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:45:25',NULL,NULL),(7,'0106','*565C4BA844E20826DCB84240869FCBC1072F08CE','U','Y',1,'김지영','','여','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:45:52',NULL,NULL),(8,'0107','*F124EF75B682BB261DE02BC5CFD9F2052D973CDE','A','Y',1,'김진우','','남','','OO도 OO시 OO구 OO동','기획','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:46:40',NULL,NULL),(9,'0108','*8D71C24D4DE6AC191EB4DAEDE5ED5F717FE75AA0','U','Y',1,'김화영','','여','','OO도 OO시 OO구 OO동','디자인','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:47:17',NULL,NULL),(10,'0109','*3A8A6D9E718FF8AE1D7C4D5B3BCBFE9550B7FC1C','A','Y',1,'박재현','','남','','OO도 OO시 OO구 OO동','기획','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:47:56',NULL,NULL),(11,'0111','*E41CD8EF98F2485367B3521F0302880CFDC2525C','U','Y',1,'오혜윤','','여','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:49:49',NULL,NULL),(12,'0112','*04FD47E37C9EC9575C56AABB7B58C38F8647DD63','A','Y',1,'유인준','','남','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:50:17',NULL,NULL),(13,'0113','*42E1D85CE6A49FA9A80C0124A1E059301997614E','U','Y',1,'유태양','','남','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:50:44',NULL,NULL),(14,'0114','*2AABC37D723F713DDA5E3A1DD3DE4EA8DDD387E0','U','Y',1,'윤준일','','남','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:51:09',NULL,NULL),(15,'0115','*480801D7E73046BD831902EBFC501D0DC94E873D','U','Y',1,'이동건','','남','','OO도 OO시 OO구 OO동','개발','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:51:36',NULL,NULL),(16,'0116','*D9756A95CB36461493EC44084BB86EB6D552640C','U','Y',1,'이승태','','남','','OO도 OO시 OO구 OO동','디자인','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:52:05',NULL,NULL),(17,'0117','*75EB1E0A8B69F9CA22FFF4535CC840EF1E8F3A67','U','Y',1,'이진용','','남','','OO도 OO시 OO구 OO동','디자인','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:52:32',NULL,NULL),(18,'0118','*5A4C12645F768B146E2E2EF8A360BFC78A2B3C50','U','Y',1,'이한솔','','여','','OO도 OO시 OO구 OO동','디자인','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:53:03',NULL,NULL),(19,'0119','*D5FF8BE619169C30F1D213569ED4B0F5D9CC8825','U','Y',1,'이현빈','','남','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:53:26',NULL,NULL),(20,'0120','*7234997D426CBB9E4F0FFD8C22AB0F307F81B869','U','Y',1,'장철운','','남','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:53:55',NULL,NULL),(21,'0121','*5C1A37B599723C4D61E544C28FE3049F4432D3D7','U','Y',1,'최영준','','남','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:54:25',NULL,NULL),(22,'0122','*F2D25DE7714B184673E2614C365E77020221D179','U','Y',1,'최우영','','남','','OO도 OO시 OO구 OO동','개발','','','','no_data','no_data','no_data','no_data','','','','','','','',NULL,'2017-07-28 06:54:52',NULL,NULL),(23,'0123','*FE1C2745E806B636F29EF399A36108BF0BF845CF','U','Y',1,'한여경','','여','','OO도 OO시 OO구 OO동','개발','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:55:20',NULL,NULL),(24,'0124','*FC2CCBCD673AAB68945831DC432962665F02A4CD','U','Y',1,'한혜수','','여','','OO도 OO시 OO구 OO동','기획','','','','','','','','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:55:54',NULL,NULL),(25,'0125','*147539D1C58BEC00B930DA2687D29E6082B91A3B','U','Y',1,'허은녕','930507','여','01082578509','OO도 OO시 OO구 OO동','개발','aaa','aaa','aaa','서울여대','정보보호','2013','재학','no_data','no_data','no_data','no_data','','','',NULL,'2017-07-28 06:56:21',NULL,NULL);
/*!40000 ALTER TABLE `ci_user` ENABLE KEYS */;
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
