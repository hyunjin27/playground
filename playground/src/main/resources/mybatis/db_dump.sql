/*
SQLyog Professional v12.4.3 (64 bit)
MySQL - 5.5.37 : Database - playground
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`playground` /*!40100 DEFAULT CHARACTER SET euckr */;

USE `playground`;

/*Table structure for table `game_and_place` */

DROP TABLE IF EXISTS `game_and_place`;

CREATE TABLE `game_and_place` (
  `gnp_no` int(8) NOT NULL AUTO_INCREMENT COMMENT '게임 장소 일련 번호',
  `p_no` varchar(8) NOT NULL COMMENT '장소 일련번호',
  `g_no` varchar(8) NOT NULL COMMENT '게임장 일련번호',
  `gnp_price` varchar(8) DEFAULT NULL COMMENT '게임비용',
  `gnp_credit` varchar(8) DEFAULT NULL COMMENT '단위 게임비용당 크레딧',
  `gnp_detail` text COMMENT '게임기 설명',
  PRIMARY KEY (`gnp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=euckr;

/*Data for the table `game_and_place` */

insert  into `game_and_place`(`gnp_no`,`p_no`,`g_no`,`gnp_price`,`gnp_credit`,`gnp_detail`) values 
(2,'2','2','1000','1','tttt'),
(6,'2','2','2000','2','test2');

/*Table structure for table `game_info` */

DROP TABLE IF EXISTS `game_info`;

CREATE TABLE `game_info` (
  `g_no` int(8) NOT NULL AUTO_INCREMENT COMMENT '게임 일련 번호',
  `g_name` varchar(50) NOT NULL COMMENT '게임 이름',
  `g_genre` varchar(8) NOT NULL COMMENT '게임 장르코드',
  `g_company` varchar(50) NOT NULL COMMENT '게임 제조사',
  `g_release` date DEFAULT NULL COMMENT '게임 발매일',
  `g_photo` varchar(100) DEFAULT NULL COMMENT '게임 사진 경로',
  `g_detail` text COMMENT '게임 설명',
  `reguser` varchar(20) NOT NULL COMMENT '등록자',
  PRIMARY KEY (`g_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=euckr;

/*Data for the table `game_info` */

insert  into `game_info`(`g_no`,`g_name`,`g_genre`,`g_company`,`g_release`,`g_photo`,`g_detail`,`reguser`) values 
(2,'TEST GAME','1005','TEST COMPANY','2018-03-27','https://s3-us-west-1.amazonaws.com/shacknews/images/20130611/8963287663_a64d1275f7_o_26088.nphd.png','test data\r\ntest data3','test');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `userid` varchar(12) NOT NULL COMMENT '사용자 ID',
  `pwd` varchar(32) NOT NULL COMMENT '암호',
  `name` varchar(50) NOT NULL COMMENT '이름',
  `email` varchar(50) NOT NULL COMMENT '이메일',
  `birth` date DEFAULT NULL COMMENT '생년월일',
  `regdate` datetime NOT NULL COMMENT '가입일',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

/*Data for the table `member` */

insert  into `member`(`userid`,`pwd`,`name`,`email`,`birth`,`regdate`) values 
('test','098f6bcd4621d373cade4e832627b4f6','테스트','test@test.com',NULL,'2018-03-28 10:47:22');

/*Table structure for table `place_info` */

DROP TABLE IF EXISTS `place_info`;

CREATE TABLE `place_info` (
  `p_no` int(8) NOT NULL AUTO_INCREMENT COMMENT '가게일련번호',
  `p_name` varchar(50) NOT NULL COMMENT '가게이름',
  `p_addr` varchar(16) NOT NULL COMMENT '가게위치',
  `p_area` varchar(10) NOT NULL COMMENT '지역코드',
  `p_detail` text COMMENT '가게설명',
  `regdate` datetime DEFAULT NULL COMMENT '등록일자',
  `reguser` varchar(12) DEFAULT NULL COMMENT '등록자',
  PRIMARY KEY (`p_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;

/*Data for the table `place_info` */

insert  into `place_info`(`p_no`,`p_name`,`p_addr`,`p_area`,`p_detail`,`regdate`,`reguser`) values 
(2,'더 조은 컴퓨터 아트 게임장','8Q98FPH3+WW4','인천광역시','에라모르겠다','2018-03-28 14:41:53','test'),
(3,'테스트','8Q98FMCR+4MH','인천광역시','ㅅㄷㄴㅅ','2018-03-28 15:24:36','test'),
(4,'테스트2','8Q98GP2M+8CM','인천광역시','ㅋㅋㅋㅋㅋㅋ','2018-03-28 16:24:57','test');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
