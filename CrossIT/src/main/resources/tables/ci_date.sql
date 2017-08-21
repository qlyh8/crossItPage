CREATE TABLE IF NOT EXISTS `ci_date` (
  `dt_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `dt_term` int(11) DEFAULT NULL COMMENT '기수',
  `dt_date` varchar(45) DEFAULT NULL COMMENT '모임일시',
  PRIMARY KEY (`dt_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='날짜';


INSERT INTO `ci_date` VALUES (1,1,'2017-05-06'),
(2,1,'2017-05-13'),
(3,1,'2017-05-27'),
(4,1,'2017-05-29'),
(5,1,'2017-06-03'),
(6,1,'2017-06-10'),
(7,1,'2017-06-17'),
(8,1,'2017-06-24'),
(9,1,'2017-06-28'),
(10,1,'2017-07-01'),
(11,1,'2017-07-07'),
(12,1,'2017-07-08');