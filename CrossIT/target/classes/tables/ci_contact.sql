CREATE TABLE IF NOT EXISTS `ci_contact` (
  `ct_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `ct_name` varchar(50) NOT NULL COMMENT '등록자이름',
  `ct_email` varchar(50) NOT NULL COMMENT '등록자이메일',
  `ct_content` text NOT NULL COMMENT '내용',
  `ct_status` varchar(50) DEFAULT '미완료' COMMENT '문의상태',
  `ct_cnt` int(10) DEFAULT '0' COMMENT '조회수',
  `reg_date` datetime DEFAULT NULL COMMENT '등록일시',
  PRIMARY KEY (`ct_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='문의';


INSERT INTO `ci_contact` VALUES (1,'김성규','infinite@google.com','안녕하세요.\r\n동아리 관련하여 질문사항이 있습니다.\r\n2기 모집은 시기가 언제인가요?','완료',8,'2017-05-20 17:13:52'),
(2,'도경수','exo@naver.com','문의 드립니다.\r\n각 분야 별로 뽑는 인원이 제한이 있나요?','완료',6,'2017-05-23 07:06:38'),
(3,'권지용','bigbang@daum.net','면접 장소가 어디인가요?','완료',5,'2017-05-29 20:20:45'),
(4,'배수지','missA@yahoo.com','동아리에 관심이 있습니다.\r\n포트폴리오가 더 있다면 볼 수 있을까요?','완료',7,'2017-06-10 11:01:05'),
(5,'소유','sista@google.com','안녕하세요!\r\n동아리를 하게 되면 주로 어디서 모이나요?','완료',4,'2017-06-15 09:10:05'),
(6,'송민호','winner@daum.net','문의드릴게 있습니다.\r\n프로젝트 진행 시 앱이나 웹 말고도\r\n다른 프로젝트도 가능한가요?','완료',4,'2017-06-26 22:12:25'),
(7,'바비','ikon@naver.com','동아리 홈페이지에 문제가 있어서 알려드립니다.\r\n포트폴리오 페이지에 오류가 발생하네요.\r\n','완료',2,'2017-06-27 13:22:01'),
(8,'정세운','starship@google.com','안녕하십니까.\r\n회비를 걷는지 궁금합니다.\r\n','미완료',1,'2017-07-05 15:15:52'),
(9,'아이린','redvelvet@daum.net','2기는 언제쯤 모집하나요','미완료',1,'2017-07-10 19:41:38'),
(10,'지코','blockB@naver.com','지금도 동아리원을 받나요?','미완료',0,'2017-07-13 08:29:43'),
(11,'문별','mamamoo@google.com','동아리에 관심있는 직장인입니다.\r\n1기 활동내용에 대해서 구체적으로 알고 싶습니다.\r\n','미완료',0,'2017-07-19 23:19:30'),
(12,'이지은','iu@naver.com','안녕하세요.\r\n동아리 운영에 관해서 알고싶습니다.\r\n','미완료',1,'2017-07-25 18:21:23');