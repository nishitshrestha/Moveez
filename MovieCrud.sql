/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.21 : Database - moviecrud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `movie_details` */
create database moviecrud;
use database moviecrud;

CREATE TABLE `movie_details` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(500) DEFAULT NULL,
  `stars_name` varchar(500) DEFAULT NULL,
  `director_name` varchar(500) DEFAULT NULL,
  `released_year` varchar(500) DEFAULT NULL,
  `movie_detail` longtext,
  `movie_img` varchar(500) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `movie_details` */

insert  into `movie_details`(`movie_id`,`movie_name`,`stars_name`,`director_name`,`released_year`,`movie_detail`,`movie_img`,`added_date`) values (17,'Dark Knight',' Christian Bale, Heath Ledger, Aaron Eckhart ','Christopher Nolan','2008','When Batman, Gordon and Harvey Dent launch an assault on the mob, they let the clown out of the box, the Joker, bent on turning Gotham on itself and bringing any heroes down to his level.','no-img.png','2014-03-26 17:26:42');
insert  into `movie_details`(`movie_id`,`movie_name`,`stars_name`,`director_name`,`released_year`,`movie_detail`,`movie_img`,`added_date`) values (18,'Dark Knight Rises','Christian Bale, Tom Hardy, Anne Hathaway','Christopher Nolan','2012','Eight years on, a new evil rises from where the Batman and Commissioner Gordon tried to bury it, causing the Batman to resurface and fight to protect Gotham City... the very city which brands him an enemy.','no-img.png','2014-03-26 17:26:46');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
