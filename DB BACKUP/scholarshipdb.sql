/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - scholarshipdb

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`scholarshipdb` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `scholarshipdb`;



/*Table structure for table `admin_tbl` */



DROP TABLE IF EXISTS `admin_tbl`;



CREATE TABLE `admin_tbl` (
  `adminname` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `admin_tbl` */



insert  into `admin_tbl`(`adminname`,`password`) values ('admin','admin');



/*Table structure for table `appdocument_tbl` */



DROP TABLE IF EXISTS `appdocument_tbl`;



CREATE TABLE `appdocument_tbl` (
  `documentid` int(11) NOT NULL AUTO_INCREMENT,
  `appid` int(11) DEFAULT NULL,
  `documentpath` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`documentid`),
  KEY `FK_appdocument_tblll` (`appid`),
  CONSTRAINT `FK_appdocument_tblll` FOREIGN KEY (`appid`) REFERENCES `application_tbl` (`appid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;



/*Data for the table `appdocument_tbl` */



insert  into `appdocument_tbl`(`documentid`,`appid`,`documentpath`,`status`) values (5,6,'steps.JPG','pending'),(6,7,'Introduction.JPG','pending'),(7,8,'steps.JPG','pending');



/*Table structure for table `application_tbl` */



DROP TABLE IF EXISTS `application_tbl`;



CREATE TABLE `application_tbl` (
  `appid` int(11) NOT NULL AUTO_INCREMENT,
  `provideid` int(50) DEFAULT NULL,
  `studentid` int(50) DEFAULT NULL,
  `yearpass` varchar(100) NOT NULL,
  `percentage` double DEFAULT NULL,
  `posteddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`appid`),
  KEY `FK_application_tbl` (`studentid`),
  KEY `FK_application_tbll` (`provideid`),
  CONSTRAINT `FK_application_tbl` FOREIGN KEY (`studentid`) REFERENCES `student_tbl` (`studentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_application_tbll` FOREIGN KEY (`provideid`) REFERENCES `provider_tbl` (`providerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;



/*Data for the table `application_tbl` */



insert  into `application_tbl`(`appid`,`provideid`,`studentid`,`yearpass`,`percentage`,`posteddate`,`status`) values (6,5,5,'2018',78,'2018-04-09 17:43:20','approved'),(7,6,6,'2018',95,'2018-04-09 17:52:21','approved'),(8,7,7,'2018',71,'2018-04-09 18:16:16','approved');



/*Table structure for table `category_tbl` */



DROP TABLE IF EXISTS `category_tbl`;



CREATE TABLE `category_tbl` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(80) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



/*Data for the table `category_tbl` */



insert  into `category_tbl`(`categoryid`,`categoryname`,`description`) values (6,'Lingayath','Lingayath Caste'),(7,'Bhramins','Bhramins Caste'),(8,'Bunts','Bunt Caste'),(9,'gowdas','kodava gowdas');



/*Table structure for table `course_tbl` */



DROP TABLE IF EXISTS `course_tbl`;



CREATE TABLE `course_tbl` (
  `courseid` int(50) NOT NULL AUTO_INCREMENT,
  `coursename` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



/*Data for the table `course_tbl` */



insert  into `course_tbl`(`courseid`,`coursename`,`description`) values (3,'BE','Bachelor Of Engineering'),(4,'BCA','Bachelor Of Computer Applications'),(5,'MCA','Master Of Computer Applications'),(6,'BBM','Bachelor of business management');



/*Table structure for table `mapcategorystaff_tbl` */



DROP TABLE IF EXISTS `mapcategorystaff_tbl`;



CREATE TABLE `mapcategorystaff_tbl` (
  `categorystaffid` int(50) NOT NULL AUTO_INCREMENT,
  `staffid` int(50) DEFAULT NULL,
  `categoryid` int(50) DEFAULT NULL,
  PRIMARY KEY (`categorystaffid`),
  KEY `FK_mapcategorystaff_tbl` (`categoryid`),
  KEY `FK_mapcategorystaff_tbl_a` (`staffid`),
  CONSTRAINT `FK_mapcategorystaff_tbl` FOREIGN KEY (`categoryid`) REFERENCES `category_tbl` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_mapcategorystaff_tbl_a` FOREIGN KEY (`staffid`) REFERENCES `staff_tbl` (`staffid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;



/*Data for the table `mapcategorystaff_tbl` */



insert  into `mapcategorystaff_tbl`(`categorystaffid`,`staffid`,`categoryid`) values (7,6,6),(8,7,7),(9,8,8),(10,9,9);



/*Table structure for table `organization_tbl` */



DROP TABLE IF EXISTS `organization_tbl`;



CREATE TABLE `organization_tbl` (
  `orgid` int(11) NOT NULL AUTO_INCREMENT,
  `orgname` varchar(500) DEFAULT NULL,
  `personname` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `mobileno` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`orgid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;



/*Data for the table `organization_tbl` */



insert  into `organization_tbl`(`orgid`,`orgname`,`personname`,`password`,`emailid`,`mobileno`,`address`) values (1,'organization',NULL,'organization','organization@gmail.com','8945612344','address'),(2,'Seva',NULL,'admin','admin','8904921022','address'),(3,'orgname','sathwk','sathwik','sathwik@gmail.com','8951375812','asdsasda'),(4,'manasvi','Manasa','manasvi','manasvi@gmail.com','8792495054','Mysuru'),(5,'Lionsclub','manu','manu','manu@gmail.com','8951375812','mysuru'),(6,'org1','person','person','person@gmail.com','9916281102','mysuru'),(7,'Mysore Heritage','shankar','shankar','shankar@gmail.com','9914321022','mysuru'),(8,'Mysore Sportsclub','hello','hello','hello@gmail.com','9916281102','mysuru');



/*Table structure for table `provider_tbl` */



DROP TABLE IF EXISTS `provider_tbl`;



CREATE TABLE `provider_tbl` (
  `providerid` int(50) NOT NULL AUTO_INCREMENT,
  `status` varchar(500) DEFAULT 'active',
  `orgid` int(50) DEFAULT NULL,
  `courseid` int(50) DEFAULT NULL,
  `categoryid` int(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `applylastdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`providerid`),
  KEY `FK_provider_tbl` (`categoryid`),
  KEY `FK_provider_tbla` (`courseid`),
  KEY `FK_provider_tblabn` (`orgid`),
  CONSTRAINT `FK_provider_tbl` FOREIGN KEY (`categoryid`) REFERENCES `category_tbl` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_provider_tbla` FOREIGN KEY (`courseid`) REFERENCES `course_tbl` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_provider_tblabn` FOREIGN KEY (`orgid`) REFERENCES `organization_tbl` (`orgid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



/*Data for the table `provider_tbl` */



insert  into `provider_tbl`(`providerid`,`status`,`orgid`,`courseid`,`categoryid`,`description`,`applylastdate`) values (5,'active',7,3,6,'Above 75%','2018-04-25 00:00:00'),(6,'active',7,4,7,'above 85%','2018-04-10 00:00:00'),(7,'active',7,5,8,'above 90%','2018-04-25 00:00:00'),(8,'active',8,6,9,'income below 2 lakhs per annum.','2018-04-25 00:00:00'),(9,'active',5,4,6,'above 90%','2018-04-10 00:00:00');



/*Table structure for table `staff_tbl` */



DROP TABLE IF EXISTS `staff_tbl`;



CREATE TABLE `staff_tbl` (
  `staffid` int(80) NOT NULL AUTO_INCREMENT,
  `staffname` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`staffid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



/*Data for the table `staff_tbl` */



insert  into `staff_tbl`(`staffid`,`staffname`,`password`) values (6,'staff1','staff1'),(7,'staff2','staff2'),(8,'staff3','staff3'),(9,'staff4','staff4');



/*Table structure for table `student_tbl` */



DROP TABLE IF EXISTS `student_tbl`;



CREATE TABLE `student_tbl` (
  `studentid` int(50) NOT NULL AUTO_INCREMENT,
  `courseid` int(50) DEFAULT NULL,
  `categoryid` int(50) DEFAULT NULL,
  `studentname` varchar(500) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `mobileno` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`studentid`),
  KEY `FK_student_tbl` (`courseid`),
  KEY `FK_student_tbla` (`categoryid`),
  CONSTRAINT `FK_student_tbl` FOREIGN KEY (`courseid`) REFERENCES `course_tbl` (`courseid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_student_tbla` FOREIGN KEY (`categoryid`) REFERENCES `category_tbl` (`categoryid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;



/*Data for the table `student_tbl` */



insert  into `student_tbl`(`studentid`,`courseid`,`categoryid`,`studentname`,`password`,`emailid`,`mobileno`,`address`,`status`) values (5,3,6,'student5','student5','student5@gmail.com','7712345678','mysuru',NULL),(6,4,7,'student6','student6','student6@gmail.com','7878965412','mysuru',NULL),(7,5,8,'student7','student7','student7@gmail.com','9916281102','mysuru',NULL);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

