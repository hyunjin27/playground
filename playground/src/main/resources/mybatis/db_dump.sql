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
('asdasd','7815696ecbf1c96e6894b779456d330e','asd','asd@asd','2014-01-01','2018-03-21 14:13:20'),
('test','098f6bcd4621d373cade4e832627b4f6','테스트','test@test.com',NULL,'2018-03-21 10:30:54');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
