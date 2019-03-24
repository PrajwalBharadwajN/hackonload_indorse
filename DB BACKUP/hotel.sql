/*

SQLyog Ultimate v8.55 
MySQL - 5.1.36-coadunity : Database - hotel

*********************************************************************

*/



/*!40101 SET NAMES utf8 */;



/*!40101 SET SQL_MODE=''*/;



/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel` /*!40100 DEFAULT CHARACTER SET latin1 */;



USE `hotel`;



/*Table structure for table `admintbl` */



DROP TABLE IF EXISTS `admintbl`;



CREATE TABLE `admintbl` (
  `user_name` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;



/*Data for the table `admintbl` */



INSERT  INTO `admintbl`(`user_name`,`password`) VALUES ('admin','admin');



/*Table structure for table `categorytbl` */



DROP TABLE IF EXISTS `categorytbl`;



CREATE TABLE `categorytbl` (
  `category_id` INT(10) NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(150) NOT NULL,
  `image` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Data for the table `categorytbl` */



INSERT  INTO `categorytbl`(`category_id`,`category`,`image`) VALUES (1,'Breakfast','breakfast.cms'),(2,'Lunch','lunch.jpg'),(3,'Snack','dinner.jpg');



/*Table structure for table `feedbacktbl` */



DROP TABLE IF EXISTS `feedbacktbl`;



CREATE TABLE `feedbacktbl` (
  `feedback_id` INT(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `feedback` VARCHAR(1000) NOT NULL,
  `feedback_date` DATE DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `FK_feedbacktbl` (`hotel_id`),
  KEY `FK_feedbacktbll` (`user_id`),
  CONSTRAINT `FK_feedbacktbl` FOREIGN KEY (`hotel_id`) REFERENCES `hoteltbl` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_feedbacktbll` FOREIGN KEY (`user_id`) REFERENCES `usertbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=latin1;



/*Data for the table `feedbacktbl` */



/*Table structure for table `hoteltbl` */



DROP TABLE IF EXISTS `hoteltbl`;



CREATE TABLE `hoteltbl` (
  `hotel_id` INT(10) NOT NULL AUTO_INCREMENT,
  `hotel_name` VARCHAR(150) NOT NULL,
  `hotel_address` VARCHAR(250) NOT NULL,
  `tax_type` INT(10) NOT NULL,
  `hotel_phone` VARCHAR(15) NOT NULL,
  `hotel_email` VARCHAR(66) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `registred_date` DATE NOT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `hoteltbl` */



INSERT  INTO `hoteltbl`(`hotel_id`,`hotel_name`,`hotel_address`,`tax_type`,`hotel_phone`,`hotel_email`,`password`,`registred_date`) VALUES (1,'Annapoorna Hotel','Srirampura',18,'08212436218','knaveen.mkumar@gmail.com','123456','2018-03-21'),(2,'dsfaf','asdfasdf',18,'24234234','naveen@gmail.com','5C3X1G','2018-03-23');



/*Table structure for table `itemtbl` */



DROP TABLE IF EXISTS `itemtbl`;



CREATE TABLE `itemtbl` (
  `item_id` INT(10) NOT NULL AUTO_INCREMENT,
  `category_id` INT(11) NOT NULL,
  `item` VARCHAR(250) NOT NULL,
  `category_image` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_itemtbl` (`category_id`),
  CONSTRAINT `FK_itemtbl` FOREIGN KEY (`category_id`) REFERENCES `categorytbl` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;



/*Data for the table `itemtbl` */



INSERT  INTO `itemtbl`(`item_id`,`category_id`,`item`,`category_image`) VALUES (1,1,'Idli ','idli_samba.jpg'),(2,1,'Dosa','dosa.jpg'),(3,1,'puri','puri.jpg'),(4,2,'South Indian Meals','south_indian_meal.jpg'),(5,2,'North Indian Meals','north_indian_meal.JPG'),(6,3,'Pani Puri','pani_puri.jpg'),(7,3,'Masala Puri','masala_puri.jpg'),(8,3,'Sev Puri','sev_puri.jpg');



/*Table structure for table `manage_itemtbl` */



DROP TABLE IF EXISTS `manage_itemtbl`;



CREATE TABLE `manage_itemtbl` (
  `manage_item_id` INT(10) NOT NULL AUTO_INCREMENT,
  `item_id` INT(11) NOT NULL,
  `price` INT(11) NOT NULL,
  `hotel_id` INT(11) NOT NULL,
  PRIMARY KEY (`manage_item_id`),
  KEY `FK_manage_itemtbl` (`item_id`),
  KEY `FK_manage_itemtblk` (`hotel_id`),
  CONSTRAINT `FK_manage_itemtbl` FOREIGN KEY (`item_id`) REFERENCES `itemtbl` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_manage_itemtblk` FOREIGN KEY (`hotel_id`) REFERENCES `hoteltbl` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;



/*Data for the table `manage_itemtbl` */



INSERT  INTO `manage_itemtbl`(`manage_item_id`,`item_id`,`price`,`hotel_id`) VALUES (1,1,30,1),(2,2,50,1),(3,3,35,1),(4,4,60,1),(5,5,55,1),(6,6,25,1),(7,7,25,1),(8,8,25,1),(9,1,1,2);



/*Table structure for table `oder_detailstbl` */



DROP TABLE IF EXISTS `oder_detailstbl`;



CREATE TABLE `oder_detailstbl` (
  `order_detail_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `manage_item_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FK_oder_detailstbl` (`order_id`),
  CONSTRAINT `FK_oder_detailstbl` FOREIGN KEY (`order_id`) REFERENCES `odertbl` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;



/*Data for the table `oder_detailstbl` */



INSERT  INTO `oder_detailstbl`(`order_detail_id`,`order_id`,`manage_item_id`,`quantity`) VALUES (1,1,1,1),(2,1,2,2),(3,2,1,1),(4,2,2,2),(5,3,1,1),(6,3,2,2),(7,4,1,1),(8,4,2,2),(9,5,1,1),(10,5,2,2),(11,6,1,1),(12,6,2,2),(13,7,1,1),(14,7,2,2),(15,8,1,1);



/*Table structure for table `odertbl` */



DROP TABLE IF EXISTS `odertbl`;



CREATE TABLE `odertbl` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `table_id` INT(11) NOT NULL,
  `order_date` DATE NOT NULL,
  `user_id` INT(11) NOT NULL,
  `total_amount` INT(11) NOT NULL,
  `status` VARCHAR(150) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  KEY `FK_odertbl` (`user_id`),
  CONSTRAINT `FK_odertbl` FOREIGN KEY (`user_id`) REFERENCES `usertbl` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;



/*Data for the table `odertbl` */



INSERT  INTO `odertbl`(`order_id`,`table_id`,`order_date`,`user_id`,`total_amount`,`status`) VALUES (1,1,'2018-03-23',1,80,'served'),(2,1,'2018-03-23',1,80,'served'),(3,1,'2018-03-23',1,80,'served'),(4,1,'2018-03-23',1,80,'served'),(5,1,'2018-03-23',1,80,'served'),(6,1,'2018-03-23',1,80,'served'),(7,1,'2018-03-23',1,80,'served'),(8,1,'2018-03-28',1,100,'served'),(9,1,'2018-03-28',1,100,'served'),(10,1,'2018-03-28',1,100,'pending');



/*Table structure for table `speacial_ordertbl` */



DROP TABLE IF EXISTS `speacial_ordertbl`;



CREATE TABLE `speacial_ordertbl` (
  `speacial_order_id` INT(10) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) NOT NULL,
  `today_specail_id` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`speacial_order_id`),
  KEY `FK_speacial_ordertbl` (`order_id`),
  CONSTRAINT `FK_speacial_ordertbl` FOREIGN KEY (`order_id`) REFERENCES `odertbl` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



/*Data for the table `speacial_ordertbl` */



INSERT  INTO `speacial_ordertbl`(`speacial_order_id`,`order_id`,`today_specail_id`,`quantity`) VALUES (1,9,1,1),(2,10,1,2);



/*Table structure for table `tabletbl` */



DROP TABLE IF EXISTS `tabletbl`;



CREATE TABLE `tabletbl` (
  `table_id` INT(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` INT(11) NOT NULL,
  `table_qr` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`table_id`),
  KEY `FK_tabletbl` (`hotel_id`),
  CONSTRAINT `FK_tabletbl` FOREIGN KEY (`hotel_id`) REFERENCES `hoteltbl` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;



/*Data for the table `tabletbl` */



INSERT  INTO `tabletbl`(`table_id`,`hotel_id`,`table_qr`) VALUES (1,1,'1:Table 1'),(2,1,'1:Table 2'),(3,1,'1:Table 3');



/*Table structure for table `today_specialtbl` */



DROP TABLE IF EXISTS `today_specialtbl`;



CREATE TABLE `today_specialtbl` (
  `today_specail_id` INT(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` INT(11) NOT NULL,
  `item_name` VARCHAR(150) NOT NULL,
  `item_price` INT(11) NOT NULL,
  `item_description` VARCHAR(500) NOT NULL,
  `date` DATE NOT NULL,
  `image` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`today_specail_id`),
  KEY `FK_today_speacialtbl` (`hotel_id`),
  CONSTRAINT `FK_today_speacialtbl` FOREIGN KEY (`hotel_id`) REFERENCES `hoteltbl` (`hotel_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



/*Data for the table `today_specialtbl` */



INSERT  INTO `today_specialtbl`(`today_specail_id`,`hotel_id`,`item_name`,`item_price`,`item_description`,`date`,`image`) VALUES (1,1,'Special Food1',100,'Special Description','2018-03-28','img1.jpg');



/*Table structure for table `usertbl` */



DROP TABLE IF EXISTS `usertbl`;



CREATE TABLE `usertbl` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(150) NOT NULL,
  `phone_no` VARCHAR(10) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `register_date` DATE NOT NULL,
  `fcm_token` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;



/*Data for the table `usertbl` */



INSERT  INTO `usertbl`(`user_id`,`user_name`,`phone_no`,`password`,`register_date`,`fcm_token`) VALUES (1,'knaveen.mkumar@gmail.com','8792495054','mahabali','2018-03-22','fmWs9Psw1sE:APA91bEZ5KKKqNryn0WdwTFH3W2DTzY_CZKAupPYlcJKjMGNJsD-LKLe4ZTt-78JWtR44D4dOSnFJzKnTfCh6XsCUp8SFdvBxozsE_TwJ8uYbo5ya8rX5X8RYsywjaoNUrmIXJofkFeZ');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

