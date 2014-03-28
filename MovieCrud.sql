/*
SQLyog Community v11.0 Beta1 (32 bit)
MySQL - 5.0.91-community-nt : Database - moviecrud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`moviecrud` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `moviecrud`;

/*Table structure for table `movie_details` */

CREATE TABLE `movie_details` (
  `movie_id` int(11) NOT NULL auto_increment,
  `movie_name` varchar(500) default NULL,
  `actor_name` varchar(500) default NULL,
  `actress_name` varchar(500) default NULL,
  `director_name` varchar(500) default NULL,
  PRIMARY KEY  (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
