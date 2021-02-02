/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 10.4.11-MariaDB : Database - transportapp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`transportapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `transportapp`;

/*Table structure for table `cost` */

DROP TABLE IF EXISTS `cost`;

CREATE TABLE `cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voznja` int(11) NOT NULL,
  `costtype` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  PRIMARY KEY (`id`,`voznja`),
  KEY `costtype` (`costtype`),
  KEY `foreign` (`voznja`),
  CONSTRAINT `foreign` FOREIGN KEY (`voznja`) REFERENCES `drive` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

/*Data for the table `cost` */

insert  into `cost`(`id`,`voznja`,`costtype`,`amount`) values 
(29,4,'driverSallary',20),
(30,4,'fuel',40),
(31,4,'toll',80),
(32,4,'other',80),
(33,2,'driverSallary',40),
(34,2,'fuel',40),
(35,2,'toll',40),
(36,2,'other',40),
(37,13,'driverSallary',40),
(38,13,'fuel',40),
(39,13,'toll',40),
(40,13,'other',40),
(41,12,'driverSallary',200),
(42,12,'fuel',20),
(43,12,'toll',20),
(44,12,'other',20),
(45,111,'driverSallary',20),
(46,111,'fuel',0),
(47,111,'toll',11),
(48,111,'other',11),
(49,93,'driverSallary',20),
(50,93,'fuel',20),
(51,93,'toll',20),
(52,93,'other',20),
(53,88,'driverSallary',2),
(54,88,'fuel',2),
(55,88,'toll',2),
(56,88,'other',2),
(57,77,'driverSallary',2),
(58,77,'fuel',2),
(59,77,'toll',2),
(60,77,'other',2),
(61,66,'driverSallary',1),
(62,66,'fuel',1),
(63,66,'toll',1),
(64,66,'other',1),
(65,56,'driverSallary',20),
(66,56,'fuel',20),
(67,56,'toll',20),
(68,56,'other',20);

/*Table structure for table `drive` */

DROP TABLE IF EXISTS `drive`;

CREATE TABLE `drive` (
  `id` int(20) NOT NULL,
  `date` date DEFAULT NULL,
  `factureprice` double DEFAULT NULL,
  `truck` varchar(255) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `driver` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trailerforeign` (`truck`),
  KEY `truckforeign` (`trailer`),
  KEY `driverforeign` (`driver`),
  CONSTRAINT `driverforeign` FOREIGN KEY (`driver`) REFERENCES `driver` (`idcard`),
  CONSTRAINT `trailerforeign` FOREIGN KEY (`truck`) REFERENCES `vehicle` (`registrationMark`),
  CONSTRAINT `truckforeign` FOREIGN KEY (`trailer`) REFERENCES `vehicle` (`registrationMark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `drive` */

insert  into `drive`(`id`,`date`,`factureprice`,`truck`,`trailer`,`driver`) values 
(2,'2020-02-03',60,'RA013CD','AA447BG',12345678),
(4,'2020-01-01',1800,'RA013CD','AA447BG',12345678),
(12,'1985-02-20',2400,'RA013CD','AA447BG',999999999),
(13,'2021-03-20',400,'RA013CD','AA447BG',12345678),
(56,'2021-01-01',2020,'RA013CD','AA447BG',12345678),
(66,'2020-01-01',20,'RA013CD','AA447BG',12345678),
(77,'2020-01-01',20,'RA013CD','AA447BG',12345678),
(88,'2021-01-01',2,'RA013CD','AA447BG',12345678),
(93,'2020-02-02',2,'RA013CD','AA447BG',12345678),
(111,'2020-02-02',2020,'RA013CD','AA447BG',12345678);

/*Table structure for table `driver` */

DROP TABLE IF EXISTS `driver`;

CREATE TABLE `driver` (
  `idcard` int(25) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `surname` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idcard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `driver` */

insert  into `driver`(`idcard`,`name`,`surname`) values 
(12345678,'Vladimir','Lazic'),
(203023021,'Laza','Lazic'),
(203023022,'Vladimir','Lazic'),
(333333333,'Mika','Mikic'),
(999999999,'Baba','Babic');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `userID` decimal(10,0) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `surname` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`username`,`password`,`userID`,`name`,`surname`,`email`) values 
('vlado1203','bane1203',1,'Vladimir','Lazic','vladimir12934@gmail.com'),
('bane1203','bane1203',2,'Bratislav','Lazic','bratislav.2000@gmail.com');

/*Table structure for table `vehicle` */

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `registrationMark` varchar(25) NOT NULL,
  `brand` varchar(25) DEFAULT NULL,
  `productYear` int(20) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `transmission` varchar(20) DEFAULT NULL,
  `vehicletype` varchar(20) DEFAULT NULL,
  `loadcapacity` double DEFAULT NULL,
  `oznakavozila` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`registrationMark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `vehicle` */

insert  into `vehicle`(`registrationMark`,`brand`,`productYear`,`weight`,`transmission`,`vehicletype`,`loadcapacity`,`oznakavozila`) values 
('AA447BG','Smitz',2012,8880,NULL,'HLADNJACA',22000,'P'),
('AA447RA','Svarcmiler',2007,8350,NULL,'HLADNJACA',15000,'P'),
('AA644RA','Smitz',2020,8400,NULL,'HLADNJACA',22000,'P'),
('RA013CD','Daf',2007,8850,'AUTOMATIC',NULL,NULL,'K'),
('RA015CC','Daf',1995,222,'MANUAL',NULL,NULL,'K'),
('RA021CV','Daf',2008,9350,'MANUAL',NULL,NULL,'K');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
