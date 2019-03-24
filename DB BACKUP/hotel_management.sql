/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - hotel_management

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel_management` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `hotel_management`;



/*Table structure for table `admin` */



DROP TABLE IF EXISTS `admin`;



CREATE TABLE `admin` (
  `admin_email` varchar(200) DEFAULT NULL,
  `admin_password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



/*Data for the table `admin` */



insert  into `admin`(`admin_email`,`admin_password`) values ('knaveen.mkumar@gmail.com','admin');



/*Table structure for table `cab_book` */



DROP TABLE IF EXISTS `cab_book`;



CREATE TABLE `cab_book` (
  `bookcabid` int(11) NOT NULL AUTO_INCREMENT,
  `cab` varchar(100) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `bookedFrom` date DEFAULT NULL,
  `bookedTo` date DEFAULT NULL,
  `total_days` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'booked',
  PRIMARY KEY (`bookcabid`),
  KEY `FK_cab_book` (`userId`),
  CONSTRAINT `FK_cab_book` FOREIGN KEY (`userId`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;



/*Data for the table `cab_book` */



insert  into `cab_book`(`bookcabid`,`cab`,`userId`,`bookedFrom`,`bookedTo`,`total_days`,`status`) values (2,'cab1',2,'2018-03-19','2018-03-22',4,'paid'),(5,'cab1',2,'2018-03-22','2018-03-23',1,'paid'),(6,'cab1',2,'2018-03-29','2018-03-31',2,'paid'),(7,'cab1',2,'2018-03-30','2018-03-31',1,'paid');



/*Table structure for table `food_items` */



DROP TABLE IF EXISTS `food_items`;



CREATE TABLE `food_items` (
  `food_id` int(11) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(200) DEFAULT NULL,
  `food_price` int(11) DEFAULT NULL,
  `food_type` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;



/*Data for the table `food_items` */



insert  into `food_items`(`food_id`,`food_name`,`food_price`,`food_type`,`image`) values (1,'meals',500,'Lunch','page3-img4.jpg'),(2,'idli',30,'Breakfast','gallery-img1.jpg'),(3,'Dosa',50,'Breakfast','gallery-img2.jpg'),(4,'Roti',50,'Breakfast','gallery-img3.jpg'),(5,'Naan',45,'Breakfast','gallery-img4.jpg'),(6,'South Indian Meal',50,'Dinner','southmeal.jpg'),(7,'pulav',80,'Breakfast','null');



/*Table structure for table `order_table` */



DROP TABLE IF EXISTS `order_table`;



CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `food_price` double DEFAULT NULL,
  `food_quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `ordered_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  KEY `FK_order_table_user_id` (`user_id`),
  KEY `FK_order_table_foo_id` (`food_id`),
  CONSTRAINT `FK_order_table_foo_id` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_order_table_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;



/*Data for the table `order_table` */



insert  into `order_table`(`order_id`,`user_id`,`food_id`,`food_price`,`food_quantity`,`total_price`,`ordered_time`,`status`) values (1,2,1,500,1,500,'2018-03-14 07:45:31','paid'),(2,2,2,30,1,30,'2018-03-19 00:15:13','paid'),(3,2,2,30,1,30,'2018-03-30 10:52:07','paid'),(4,2,3,50,2,100,'2018-03-30 10:52:07','paid');



/*Table structure for table `room_booking` */



DROP TABLE IF EXISTS `room_booking`;



CREATE TABLE `room_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `total_days` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'checkedIn',
  PRIMARY KEY (`booking_id`),
  KEY `FK_room_booking_room_id` (`room_id`),
  KEY `FK_room_booking_user_id` (`user_id`),
  CONSTRAINT `FK_room_booking_room_id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_room_booking_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_details` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Data for the table `room_booking` */



insert  into `room_booking`(`booking_id`,`room_id`,`user_id`,`from_date`,`to_date`,`total_days`,`status`) values (2,1,2,'2018-03-23','2018-03-27',4,'checkedOut'),(3,1,2,'2018-03-30','2018-03-31',1,'checkedOut');



/*Table structure for table `rooms` */



DROP TABLE IF EXISTS `rooms`;



CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_description` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `room_status` varchar(20) DEFAULT 'unbooked',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `rooms` */



insert  into `rooms`(`room_id`,`room_description`,`price`,`room_status`) values (1,'Delux',500,'unbooked'),(2,'Luxury',1000,'unbooked');



/*Table structure for table `user_details` */



DROP TABLE IF EXISTS `user_details`;



CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) DEFAULT NULL,
  `user_email` varchar(200) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_mobile_number` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `user_details` */



insert  into `user_details`(`user_id`,`user_name`,`user_email`,`user_password`,`user_mobile_number`) values (1,'q','q@gmail.com','12','3'),(2,'naveen','knaveen.mkumar@gmail.com','mahabali','8792495054');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

