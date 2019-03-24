/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - aadhar

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`aadhar` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `aadhar`;



/*Table structure for table `aadhar` */



DROP TABLE IF EXISTS `aadhar`;



CREATE TABLE `aadhar` (
  `FirstName` varchar(80) DEFAULT NULL,
  `LastName` varchar(80) DEFAULT NULL,
  `Address` varchar(80) DEFAULT NULL,
  `Mobile` bigint(10) DEFAULT NULL,
  `E-Mail` varchar(80) DEFAULT NULL,
  `Password` varchar(80) DEFAULT NULL,
  `ConfirmPassword` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `aadhar` */



insert  into `aadhar`(`FirstName`,`LastName`,`Address`,`Mobile`,`E-Mail`,`Password`,`ConfirmPassword`) values ('Sathwik','Rai','#1946/A,2ndCross,3rd Stage,Srirampura,Mysore',9916281102,'sathwikr97@gmail.com','hello','hello'),('ms','dhoni','90,jharkhand',8951375812,'dhoni@gmail.com','hell','hell'),('rahul','dravid','25,mysore',8954612347,'saer@gmail.com','123','123');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

