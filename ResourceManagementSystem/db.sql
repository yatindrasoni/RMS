/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.7-rc-log : Database - rms_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rms_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rms_db`;

/*Table structure for table `assignPrograms` */

DROP TABLE IF EXISTS `assignPrograms`;

CREATE TABLE `assignPrograms` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `DISCOUNT` varchar(50) DEFAULT NULL,
  `DUE` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FEE` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `PAID` varchar(50) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assignPrograms` */

/*Table structure for table `candidate` */

DROP TABLE IF EXISTS `candidate`;

CREATE TABLE `candidate` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `Aadhar_NO` varchar(50) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `BRANCH_NAME` varchar(50) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `COLLEGE_NAME` varchar(50) DEFAULT NULL,
  `CONTACT_NO` varchar(50) DEFAULT NULL,
  `COUNTRY` varchar(50) DEFAULT NULL,
  `DATE_OF_BIRTH` datetime DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `SEMESTER` varchar(50) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  `YEAR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `candidate` */

/*Table structure for table `marksheet` */

DROP TABLE IF EXISTS `marksheet`;

CREATE TABLE `marksheet` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `CANDIDATE_ID` bigint(20) DEFAULT NULL,
  `CANDIDATE_NAME` varchar(50) DEFAULT NULL,
  `CHEMISTRY` int(11) DEFAULT NULL,
  `COLLEGE_ID` bigint(20) DEFAULT NULL,
  `COLLEGE_NAME` varchar(50) DEFAULT NULL,
  `MATHS` int(11) DEFAULT NULL,
  `PHYSICS` int(11) DEFAULT NULL,
  `ROLL_NO` varchar(50) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marksheet` */

/*Table structure for table `program` */

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  `DURATION` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `program` */

/*Table structure for table `st_college` */

DROP TABLE IF EXISTS `st_college`;

CREATE TABLE `st_college` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `PHONE_NO` varchar(50) DEFAULT NULL,
  `STATE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_college` */

/*Table structure for table `st_role` */

DROP TABLE IF EXISTS `st_role`;

CREATE TABLE `st_role` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `st_role` */

insert  into `st_role`(`ID`,`CREATED_BY`,`CREATED_DATETIME`,`MODIFIED_BY`,`MODIFIED_DATETIME`,`DESCRIPTION`,`NAME`) values (1,'root','2019-10-05 14:12:50','root','2019-10-05 14:12:58','ADMIN_ROLE','ADMIN'),(2,'root','2019-10-05 17:12:49','root','2019-10-05 17:12:57','CANDIDATE_ROLE','CANDIDATE'),(4,'root','2019-10-05 15:19:10','root','2019-10-05 15:19:17','AGENT_ROLE','AGENT'),(5,'root','2019-10-05 15:19:32','root','2019-10-05 15:19:37','TRAINER_ROLE','TRAINER');

/*Table structure for table `st_user` */

DROP TABLE IF EXISTS `st_user`;

CREATE TABLE `st_user` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `CONFIRM_PASSWORD` varchar(50) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
  `LASTLOGIN` datetime DEFAULT NULL,
  `LAST_LOGIN_IP` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `USER_LOCK` varchar(50) DEFAULT NULL,
  `LOGIN` varchar(50) DEFAULT NULL,
  `MOBILE_NO` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `REGISTERED_IP` varchar(50) DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  `ROLE_NAME` varchar(50) DEFAULT NULL,
  `UNSUCCESSFUL_LOGIN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `st_user` */

insert  into `st_user`(`ID`,`CREATED_BY`,`CREATED_DATETIME`,`MODIFIED_BY`,`MODIFIED_DATETIME`,`CONFIRM_PASSWORD`,`DOB`,`FIRST_NAME`,`GENDER`,`LASTLOGIN`,`LAST_LOGIN_IP`,`LAST_NAME`,`USER_LOCK`,`LOGIN`,`MOBILE_NO`,`PASSWORD`,`REGISTERED_IP`,`ROLE_ID`,`ROLE_NAME`,`UNSUCCESSFUL_LOGIN`) values (1,NULL,NULL,NULL,NULL,NULL,'2020-02-03 00:00:00','Shreyansh','Male','1970-01-01 05:30:00',NULL,'Soni','Inactive','admin@gmail.com','9999999999','123456',NULL,1,'ADMIN',0),(2,NULL,NULL,NULL,NULL,NULL,'2020-02-09 00:00:00','Shrey','Male','1970-01-01 05:30:00',NULL,'Soni','Inactive','candidate@gmail.com','9999999999','123456',NULL,2,'CANDIDATE',0);

/*Table structure for table `timetable` */

DROP TABLE IF EXISTS `timetable`;

CREATE TABLE `timetable` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_NAME` varchar(50) DEFAULT NULL,
  `TIME` varchar(50) DEFAULT NULL,
  `TRAINER_ID` bigint(20) DEFAULT NULL,
  `TRAINER_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `timetable` */

/*Table structure for table `trainer` */

DROP TABLE IF EXISTS `trainer`;

CREATE TABLE `trainer` (
  `ID` bigint(20) NOT NULL,
  `CREATED_BY` varchar(50) DEFAULT NULL,
  `CREATED_DATETIME` datetime DEFAULT NULL,
  `MODIFIED_BY` varchar(50) DEFAULT NULL,
  `MODIFIED_DATETIME` datetime DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `MOBILE_NO` varchar(50) DEFAULT NULL,
  `PROGRAM_ID` bigint(20) DEFAULT NULL,
  `PROGRAM_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `trainer` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
