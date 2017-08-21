CREATE TABLE IF NOT EXISTS `ci_portfolio` (
  `pf_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `pf_name` varchar(50) NOT NULL COMMENT '포트폴리오이름',
  `pf_partlist` varchar(400) NOT NULL COMMENT '참여명단',
  `pf_section` varchar(50) NOT NULL COMMENT '분야',  
  `pf_objv` varchar(100) NOT NULL COMMENT '목적',
  `pf_period` varchar(50) COMMENT '개발기간',
  `pf_explain` varchar(200) COMMENT '설명',
  `pf_link` varchar(400) COMMENT '링크주소',
  `reg_date` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`pf_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='문의';


INSERT INTO `ci_portfolio` VALUES (1,'모취모취','박재현,유인준,이동건,이승태,이현빈,한여경','web','포트폴리오 제작 사이트',NULL,NULL,NULL,'2017-07-20 18:35:39'),
(2,'자글자글','김재석,김진우,오혜윤,윤준일,이한솔,장철운','app','자취생을 위한 웹 사이트',NULL,NULL,NULL,'2017-07-22 18:35:39'),
(3,'모여라 미대생','김성재,김화영,유태양,최영준,한혜수','web','미대생을 위한 어플리케이션',NULL,NULL,NULL,'2017-07-23 18:35:39'),
(4,'크로스아이티','신윤희,유인준,이진용,최우영,허은녕','web','크로스아이티 동아리 웹사이트',NULL,NULL,NULL,'2017-07-24 18:35:39'),
(5,'픽플','구동림,권예슬,김동인,김지영','web','픽플 웹사이트',NULL,NULL,NULL,'2017-07-25 18:35:39');