/*
SQLyog Community v11.52 (32 bit)
MySQL - 5.5.30 : Database - abkwsearch
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`abkwsearch` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `abkwsearch`;

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `qid` int(20) DEFAULT NULL,
  `puid` varchar(500) DEFAULT NULL,
  `data` longblob,
  `docnm` varchar(4000) DEFAULT NULL,
  `aces` varchar(1000) DEFAULT NULL,
  `kwrds` varchar(1000) DEFAULT NULL,
  `aeskey` varchar(1000) DEFAULT NULL,
  KEY `qid` (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `docid` int(100) NOT NULL AUTO_INCREMENT,
  `doctname` varchar(500) DEFAULT NULL,
  `doctuid` varchar(500) DEFAULT NULL,
  `doctpwd` varchar(500) DEFAULT NULL,
  `dochosp` varchar(500) DEFAULT NULL,
  `docprof` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `contact` varchar(500) DEFAULT NULL,
  `status` varchar(1000) DEFAULT NULL,
  `sk` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`docid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `pid` int(100) NOT NULL AUTO_INCREMENT,
  `pname` varchar(500) DEFAULT NULL,
  `uid` varchar(500) DEFAULT NULL,
  `pwd` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `mno` varchar(500) DEFAULT NULL,
  `gender` varchar(500) DEFAULT NULL,
  `age` varchar(500) DEFAULT NULL,
  `status` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `results` */

DROP TABLE IF EXISTS `results`;

CREATE TABLE `results` (
  `qids` varchar(500) DEFAULT NULL,
  `docuid` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `setup` */

DROP TABLE IF EXISTS `setup`;

CREATE TABLE `setup` (
  `pk` varchar(1000) DEFAULT NULL,
  `msk` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `temp` */

DROP TABLE IF EXISTS `temp`;

CREATE TABLE `temp` (
  `fnm` varchar(500) DEFAULT NULL,
  `fdata` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `trapdoor` */

DROP TABLE IF EXISTS `trapdoor`;

CREATE TABLE `trapdoor` (
  `doctuid` varchar(500) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
