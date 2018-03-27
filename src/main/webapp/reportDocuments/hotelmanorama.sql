/*
SQLyog Community Edition- MySQL GUI v8.02 
MySQL - 5.5.27 : Database - hotelmanorama
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotelmanorama` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hotelmanorama`;

/*Table structure for table `hotel_capacity_master` */

DROP TABLE IF EXISTS `hotel_capacity_master`;

CREATE TABLE `hotel_capacity_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  `numberOfAdult` varchar(200) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `hotel_capacity_master` */

insert  into `hotel_capacity_master`(`id`,`created_time`,`updated_time`,`name`,`numberOfAdult`,`status`) values (4,'2018-02-20 13:25:03','2018-02-20 17:33:10','sdfgdfs','512432345','0'),(5,'2018-02-20 13:29:51','2018-02-20 16:05:43','dfgsd','dfgsdf','0'),(6,'2018-02-20 16:00:49','2018-02-20 17:33:14','hjgk','0.322','1');

/*Table structure for table `hotel_room_master` */

DROP TABLE IF EXISTS `hotel_room_master`;

CREATE TABLE `hotel_room_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `room_number` varchar(200) DEFAULT NULL,
  `room_type_id` varchar(200) DEFAULT NULL,
  `capacity_id` varchar(200) DEFAULT NULL,
  `max_chaild` varchar(200) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `hotel_room_master` */

insert  into `hotel_room_master`(`id`,`created_time`,`updated_time`,`room_number`,`room_type_id`,`capacity_id`,`max_chaild`,`status`) values (1,'2018-02-22 12:50:44','2018-02-22 12:50:44','fgdgdsgfds','4','6','43543','1');

/*Table structure for table `hotel_room_photos` */

DROP TABLE IF EXISTS `hotel_room_photos`;

CREATE TABLE `hotel_room_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `room_type_id` varchar(200) DEFAULT NULL,
  `capacityId` varchar(10) DEFAULT NULL,
  `image1` text,
  `image2` text,
  `image3` text,
  `image4` text,
  `image5` text,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `hotel_room_photos` */

insert  into `hotel_room_photos`(`id`,`created_time`,`updated_time`,`room_type_id`,`capacityId`,`image1`,`image2`,`image3`,`image4`,`image5`,`status`) values (1,'2018-02-23 16:04:46','2018-02-23 16:33:34','5','6','C:\\Users\\CIPL-4\\Downloads\\sts-bundle\\pivotal-tc-server-developer-3.2.8.RELEASE\\tomcat-8.5.23.A.RELEASE\\tmpFiles\\53f589da8b384eaeaae500a9e7771f27.jpg','837ae49e6d6f49fcaad21621262903b6.jpg','C:\\Users\\CIPL-4\\Downloads\\sts-bundle\\pivotal-tc-server-developer-3.2.8.RELEASE\\tomcat-8.5.23.A.RELEASE\\tmpFiles\\332c7049195543698f3e469005d396f9.jpg','C:\\Users\\CIPL-4\\Downloads\\sts-bundle\\pivotal-tc-server-developer-3.2.8.RELEASE\\tomcat-8.5.23.A.RELEASE\\tmpFiles\\fb995b085ee74b1dba5ada88bd0692f8.jpg','C:\\Users\\CIPL-4\\Downloads\\sts-bundle\\pivotal-tc-server-developer-3.2.8.RELEASE\\tomcat-8.5.23.A.RELEASE\\tmpFiles\\5578ac38d6e24ee1b40df2ef7cf93837.jpg','1');

/*Table structure for table `hotel_room_price` */

DROP TABLE IF EXISTS `hotel_room_price`;

CREATE TABLE `hotel_room_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `room_type_id` varchar(200) DEFAULT NULL,
  `capacity_id` varchar(200) DEFAULT NULL,
  `sun` varchar(20) DEFAULT '0',
  `mon` varchar(20) DEFAULT '0',
  `tue` varchar(20) DEFAULT '0',
  `wed` varchar(20) DEFAULT '0',
  `thu` varchar(20) DEFAULT '0',
  `fri` varchar(20) DEFAULT '0',
  `sat` varchar(20) DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `hotel_room_price` */

insert  into `hotel_room_price`(`id`,`created_time`,`updated_time`,`room_type_id`,`capacity_id`,`sun`,`mon`,`tue`,`wed`,`thu`,`fri`,`sat`,`status`) values (1,'2018-02-22 12:51:16','2018-02-22 13:35:01','4','6','30','fds','s','fvdfs','dfasd','dfsdsa','fds','1');

/*Table structure for table `hotel_room_type` */

DROP TABLE IF EXISTS `hotel_room_type`;

CREATE TABLE `hotel_room_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(200) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `hotel_room_type` */

insert  into `hotel_room_type`(`id`,`created_time`,`updated_time`,`name`,`status`) values (4,'2018-02-20 12:12:11','2018-02-22 12:50:10','dxfgrd','1'),(5,'2018-02-20 12:24:58','2018-02-22 12:50:13','dfrgsdf','1');

/*Table structure for table `hotel_users` */

DROP TABLE IF EXISTS `hotel_users`;

CREATE TABLE `hotel_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_time` timestamp NULL DEFAULT NULL,
  `updated_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roleId` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `hotel_users` */

insert  into `hotel_users`(`id`,`created_time`,`updated_time`,`userName`,`password`,`roleId`,`status`) values (1,NULL,'2017-11-24 17:18:09','admin','admin','1','1'),(2,NULL,'2017-12-28 17:31:53','user','user','2','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
