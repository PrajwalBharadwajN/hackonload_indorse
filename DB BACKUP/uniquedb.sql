/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - uniquedb

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`uniquedb` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `uniquedb`;



/*Table structure for table `admin_tbl` */



DROP TABLE IF EXISTS `admin_tbl`;



CREATE TABLE `admin_tbl` (
  `adminname` varchar(500) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `admin_tbl` */



insert  into `admin_tbl`(`adminname`,`password`) values ('admin','admin');



/*Table structure for table `license_tbl` */



DROP TABLE IF EXISTS `license_tbl`;



CREATE TABLE `license_tbl` (
  `lic_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_id` int(11) DEFAULT NULL,
  `vehicle_type` int(11) DEFAULT NULL,
  `do_issue` int(11) DEFAULT NULL,
  `expire` varchar(80) DEFAULT NULL,
  `status` varchar(80) DEFAULT NULL,
  `mn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lic_id`),
  KEY `FK_license_tbl` (`reg_id`),
  KEY `FK_license_tbl_mnid` (`mn_id`),
  CONSTRAINT `FK_license_tbl` FOREIGN KEY (`reg_id`) REFERENCES `user_tbl` (`reg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_license_tbl_mnid` FOREIGN KEY (`mn_id`) REFERENCES `monitor_tbl` (`mn_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `license_tbl` */



/*Table structure for table `monitor_tbl` */



DROP TABLE IF EXISTS `monitor_tbl`;



CREATE TABLE `monitor_tbl` (
  `mn_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`mn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



/*Data for the table `monitor_tbl` */



insert  into `monitor_tbl`(`mn_id`,`name`,`address`,`city`,`mobile`,`type`,`emailid`,`password`) values (1,'monitor',NULL,NULL,NULL,NULL,'monitor','monitor');



/*Table structure for table `passport_tbl` */



DROP TABLE IF EXISTS `passport_tbl`;



CREATE TABLE `passport_tbl` (
  `psp_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_id` int(11) DEFAULT NULL,
  `expire` varchar(80) DEFAULT NULL,
  `status` varchar(80) DEFAULT 'applied',
  `passport_id` int(11) DEFAULT NULL,
  `mn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`psp_id`),
  KEY `FK_passport_tbl` (`reg_id`),
  KEY `FK_passport_tbl_mnid` (`mn_id`),
  CONSTRAINT `FK_passport_tbl` FOREIGN KEY (`reg_id`) REFERENCES `user_tbl` (`reg_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_passport_tbl_mnid` FOREIGN KEY (`mn_id`) REFERENCES `monitor_tbl` (`mn_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `passport_tbl` */



/*Table structure for table `user_tbl` */



DROP TABLE IF EXISTS `user_tbl`;



CREATE TABLE `user_tbl` (
  `reg_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(500) DEFAULT NULL,
  `lname` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `pincode` varchar(500) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `maritalstatus` varchar(500) DEFAULT NULL,
  `registrationdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aadharno` varchar(16) DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `emailid` varchar(80) DEFAULT NULL,
  `status` varchar(80) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `uniquenumber` varchar(500) DEFAULT 'null',
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;



/*Data for the table `user_tbl` */



insert  into `user_tbl`(`reg_id`,`fname`,`lname`,`address`,`city`,`dob`,`pincode`,`mobile`,`maritalstatus`,`registrationdate`,`aadharno`,`otp`,`emailid`,`status`,`password`,`uniquenumber`) values (1,'Sathwik','Rai','Srirampura','mysore','2018-02-06','570023','2147483647','married','2018-02-08 14:02:35','2018','4023','123','sathwikr97@gmail.com',NULL,NULL),(2,'Sathwik','Rai','Srirampura','mysore','2018-02-05','570023','8951375812','married','2018-02-08 14:15:46','4023 8711 2365','123','sathwikr97@gmail.com',NULL,'password',NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-08 16:43:44',NULL,NULL,NULL,NULL,'password',NULL),(4,'Sathwik','Rai','Srirampura','mysore','2018-02-28','570023','8951375812','not married','2018-02-08 16:49:47','4023 8711 2365','123','sathwikr97@gmail.com',NULL,'messi',NULL),(5,'leo','Rai','23rd srirampura mysore karnataka','mysore','2018-02-12','570023','8951375812','married','2018-02-08 16:50:42','4023 8711 2365','123','sathwikr97@gmail.com',NULL,'password',NULL),(6,'Sathwik','Rai','Srirampura','mysore','2018-02-11','570023','8951375812','married','2018-02-08 18:26:49','4023 8711 2365','123','sathwikr97@gmail.com',NULL,'password',NULL),(7,'deepak','anjanappa','jpnagar mysore','mysore','2018-02-06','570023','8951375812','not married','2018-02-14 12:45:56','1236456889997412','444','deepak@gmail.com',NULL,'deepak123','56982333'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-14 12:51:38',NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-02-14 12:51:44',NULL,NULL,NULL,NULL,NULL,NULL),(10,'Sathwik','world','Srirampura','mysore','2018-02-09','570023','8951375812','married','2018-02-19 01:25:43','4023 8711 2365','123','hello@gmail.com',NULL,'hello','null');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

