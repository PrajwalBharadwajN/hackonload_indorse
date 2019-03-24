/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - onlinefoodorderingsystem

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`onlinefoodorderingsystem` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `onlinefoodorderingsystem`;



/*Table structure for table `admin` */



DROP TABLE IF EXISTS `admin`;



CREATE TABLE `admin` (
  `adminid` VARCHAR(100) DEFAULT NULL,
  `password` VARCHAR(100) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;



/*Data for the table `admin` */



INSERT  INTO `admin`(`adminid`,`password`) VALUES ('admin','admin');



/*Table structure for table `city` */



DROP TABLE IF EXISTS `city`;



CREATE TABLE `city` (
  `cityid` INT(11) NOT NULL AUTO_INCREMENT,
  `cityname` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



/*Data for the table `city` */



INSERT  INTO `city`(`cityid`,`cityname`) VALUES (1,'Mysore'),(2,'Mandya'),(3,'Bangalore'),(4,'Hassan');



/*Table structure for table `feedback` */



DROP TABLE IF EXISTS `feedback`;



CREATE TABLE `feedback` (
  `feedbackid` INT(11) NOT NULL AUTO_INCREMENT,
  `userid` INT(11) DEFAULT NULL,
  `foodid` INT(11) DEFAULT NULL,
  `feedback` VARCHAR(200) DEFAULT NULL,
  `rating` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`feedbackid`),
  KEY `FK_feedback` (`userid`),
  KEY `FK_feedback1` (`foodid`),
  CONSTRAINT `FK_feedback` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_feedback1` FOREIGN KEY (`foodid`) REFERENCES `fooditems` (`foodid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `feedback` */



INSERT  INTO `feedback`(`feedbackid`,`userid`,`foodid`,`feedback`,`rating`) VALUES (1,1,2,'','3.0'),(2,1,3,'','2.0');



/*Table structure for table `foodcategory` */



DROP TABLE IF EXISTS `foodcategory`;



CREATE TABLE `foodcategory` (
  `categoryid` INT(11) NOT NULL AUTO_INCREMENT,
  `categoryname` TEXT,
  PRIMARY KEY (`categoryid`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Data for the table `foodcategory` */



INSERT  INTO `foodcategory`(`categoryid`,`categoryname`) VALUES (1,'North Indian'),(2,'South Indian'),(3,'Chinese');



/*Table structure for table `fooditems` */



DROP TABLE IF EXISTS `fooditems`;



CREATE TABLE `fooditems` (
  `foodid` INT(11) NOT NULL AUTO_INCREMENT,
  `hotelid` INT(11) DEFAULT NULL,
  `categoryid` INT(11) DEFAULT NULL,
  `foodname` VARCHAR(200) DEFAULT NULL,
  `details` VARCHAR(200) DEFAULT NULL,
  `cost` VARCHAR(200) DEFAULT NULL,
  `rating` VARCHAR(200) DEFAULT NULL,
  `img` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`foodid`),
  KEY `FK_fooditems` (`categoryid`),
  KEY `FK_fooditems1` (`hotelid`),
  CONSTRAINT `FK_fooditems` FOREIGN KEY (`categoryid`) REFERENCES `foodcategory` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_fooditems1` FOREIGN KEY (`hotelid`) REFERENCES `hotels` (`hotelid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Data for the table `fooditems` */



INSERT  INTO `fooditems`(`foodid`,`hotelid`,`categoryid`,`foodname`,`details`,`cost`,`rating`,`img`) VALUES (1,1,1,'Roti & Curry','Lunch','100',NULL,'roticurry.jpg'),(2,1,2,'Idli','Breakfast','25',NULL,'idli.jpg'),(3,1,2,'Masala Dosa','Breakfast','100',NULL,'masaladosa.jpg');



/*Table structure for table `hotels` */



DROP TABLE IF EXISTS `hotels`;



CREATE TABLE `hotels` (
  `hotelid` INT(11) NOT NULL AUTO_INCREMENT,
  `cityid` INT(11) DEFAULT NULL,
  `hotelname` VARCHAR(200) DEFAULT NULL,
  `ownername` VARCHAR(200) DEFAULT NULL,
  `password` VARCHAR(200) DEFAULT NULL,
  `address` VARCHAR(200) DEFAULT NULL,
  `mobileno` VARCHAR(200) DEFAULT NULL,
  `image` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`hotelid`),
  KEY `FK_hotels` (`cityid`),
  CONSTRAINT `FK_hotels` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `hotels` */



INSERT  INTO `hotels`(`hotelid`,`cityid`,`hotelname`,`ownername`,`password`,`address`,`mobileno`,`image`) VALUES (1,1,'Kumar Foods','Kumar','password','Kuvempunagar , Mysore','9856231478','paivista.png'),(2,1,'Mahesh Foods','Mahesh','password','Saraswathipuram , Mysore','9845126356','viceroy.jpg');



/*Table structure for table `orderdetails` */



DROP TABLE IF EXISTS `orderdetails`;



CREATE TABLE `orderdetails` (
  `orderid` INT(11) NOT NULL AUTO_INCREMENT,
  `orderdate` VARCHAR(200) DEFAULT NULL,
  `foodid` INT(11) DEFAULT NULL,
  `orderdetails` INT(11) DEFAULT NULL,
  `userid` INT(11) DEFAULT NULL,
  `cost` VARCHAR(200) DEFAULT NULL,
  `status` VARCHAR(200) DEFAULT 'pending',
  PRIMARY KEY (`orderid`),
  KEY `FK_orderdetails` (`foodid`),
  KEY `FK_orderdetails1` (`userid`),
  CONSTRAINT `FK_orderdetails` FOREIGN KEY (`foodid`) REFERENCES `fooditems` (`foodid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_orderdetails1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `orderdetails` */



INSERT  INTO `orderdetails`(`orderid`,`orderdate`,`foodid`,`orderdetails`,`userid`,`cost`,`status`) VALUES (1,'2018-03-27',2,2,1,'25','pending'),(2,'2018-03-27',3,2,1,'100','pending');



/*Table structure for table `user` */



DROP TABLE IF EXISTS `user`;



CREATE TABLE `user` (
  `userid` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) DEFAULT NULL,
  `password` VARCHAR(200) DEFAULT NULL,
  `address` VARCHAR(200) DEFAULT NULL,
  `mobileno` VARCHAR(200) DEFAULT NULL,
  `email` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



/*Data for the table `user` */



INSERT  INTO `user`(`userid`,`username`,`password`,`address`,`mobileno`,`email`) VALUES (1,'Jeevankumar.M','password','Kuvemupnagar, Mysore','9743033493','jeevankunar.m72@gmail.com');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

