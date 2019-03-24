/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - practice

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`practice` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `practice`;



/*Table structure for table `practable` */



DROP TABLE IF EXISTS `practable`;



CREATE TABLE `practable` (
  `name_id` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `practable` */



/*Table structure for table `practable1` */



DROP TABLE IF EXISTS `practable1`;



CREATE TABLE `practable1` (
  `username` varchar(80) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mobno` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `practable1` */



insert  into `practable1`(`username`,`password`,`mobno`) values ('Sathwik','root','9916281102'),('rai','root1','8951375812'),('sathwik','456','89546');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

