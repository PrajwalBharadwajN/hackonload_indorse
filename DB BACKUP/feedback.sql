/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - feedback

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`feedback` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `feedback`;



/*Table structure for table `admintbl` */



DROP TABLE IF EXISTS `admintbl`;



CREATE TABLE `admintbl` (
  `adminname` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `admintbl` */



insert  into `admintbl`(`adminname`,`password`) values ('admin','admin');



/*Table structure for table `collegetbl` */



DROP TABLE IF EXISTS `collegetbl`;



CREATE TABLE `collegetbl` (
  `collegeid` int(11) NOT NULL AUTO_INCREMENT,
  `collegename` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`collegeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;



/*Data for the table `collegetbl` */



insert  into `collegetbl`(`collegeid`,`collegename`,`description`) values (3,'VVCE','VTU'),(4,'SJCE','autonomous'),(5,'VVIET','VTU'),(6,'PES MANDYA','autonomous');



/*Table structure for table `companytbl` */



DROP TABLE IF EXISTS `companytbl`;



CREATE TABLE `companytbl` (
  `companyid` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`companyid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;



/*Data for the table `companytbl` */



insert  into `companytbl`(`companyid`,`companyname`,`description`) values (2,'MindTree','IT Company'),(3,'Infosys','IT Company'),(4,'AEC Offshore','Handicrafts manufacturing'),(5,'Buildwell','Construction Company');



/*Table structure for table `juniortbl` */



DROP TABLE IF EXISTS `juniortbl`;



CREATE TABLE `juniortbl` (
  `juniorid` int(11) NOT NULL AUTO_INCREMENT,
  `collegeid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `usn` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`juniorid`),
  KEY `FK_juniortbl` (`collegeid`),
  CONSTRAINT `FK_juniortbl` FOREIGN KEY (`collegeid`) REFERENCES `collegetbl` (`collegeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `juniortbl` */



insert  into `juniortbl`(`juniorid`,`collegeid`,`name`,`emailid`,`usn`,`password`,`mobileno`,`address`) values (1,3,'agarwall','agarwall@gmail.com','4vv14is046','agarwall','9916281102','mysore'),(2,3,'surya','surya@gmail.com','2vv14cso50','surya','9916282204','mysuru');



/*Table structure for table `providertbl` */



DROP TABLE IF EXISTS `providertbl`;



CREATE TABLE `providertbl` (
  `providerid` int(11) NOT NULL AUTO_INCREMENT,
  `seniorid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `question` varchar(2000) DEFAULT NULL,
  `answer` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`providerid`),
  KEY `FK_providertbl3` (`companyid`),
  KEY `FK_providertbl5` (`seniorid`),
  CONSTRAINT `FK_providertbl3` FOREIGN KEY (`companyid`) REFERENCES `companytbl` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_providertbl5` FOREIGN KEY (`seniorid`) REFERENCES `seniortbl` (`seniorid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;



/*Data for the table `providertbl` */



insert  into `providertbl`(`providerid`,`seniorid`,`companyid`,`question`,`answer`) values (1,1,2,'Ceo Of Mindtree','Rostow Ravanan'),(2,1,3,'CEO of Infosys','salil parekh'),(3,1,4,'CEO OF AEC OFFSHORE','Anand'),(4,1,4,'About Us','Excellent company'),(5,1,3,'how are you','fine'),(6,1,5,'wat doin','nothing much'),(7,3,5,'BAI','Builders Assosciation of India');



/*Table structure for table `seniortbl` */



DROP TABLE IF EXISTS `seniortbl`;



CREATE TABLE `seniortbl` (
  `seniorid` int(11) NOT NULL AUTO_INCREMENT,
  `collegeid` int(11) DEFAULT NULL,
  `companyid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `usn` varchar(10) DEFAULT NULL,
  `mobileno` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seniorid`),
  KEY `FK_seniortbl` (`collegeid`),
  KEY `FK_seniortbl1` (`companyid`),
  CONSTRAINT `FK_seniortbl` FOREIGN KEY (`collegeid`) REFERENCES `collegetbl` (`collegeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_seniortbl1` FOREIGN KEY (`companyid`) REFERENCES `companytbl` (`companyid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Data for the table `seniortbl` */



insert  into `seniortbl`(`seniorid`,`collegeid`,`companyid`,`name`,`emailid`,`password`,`usn`,`mobileno`,`address`) values (1,3,2,'mahesh','mahesh@gmail.com','mahesh','4vv13cs050','8951375812','mysore'),(2,3,5,'arun','arun@gmail.com','arun','4vv12is023','9965412378','mysore'),(3,6,5,'harish','harish@gmail.com','harish','4nn12cs036','896547123','mysuru');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

