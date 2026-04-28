/*
SQLyog Community v12.02 (32 bit)
MySQL - 5.5.29 : Database - enabling
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`enabling` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `enabling`;

/*Table structure for table `approval` */

DROP TABLE IF EXISTS `approval`;

CREATE TABLE `approval` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(200) DEFAULT NULL,
  `dname` varchar(200) DEFAULT NULL,
  `msg` varchar(200) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `amount` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT 'Waiting',
  `policynum` varchar(200) DEFAULT '-',
  `ins_msg` varchar(200) DEFAULT NULL,
  `bank_msg` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `approval` */

insert  into `approval`(`id`,`pname`,`dname`,`msg`,`file`,`amount`,`status`,`policynum`,`ins_msg`,`bank_msg`) values (3,'vivek','kumar','This is the Report for the Patient..','abc.txt','50000','sent','12345','You Pocliy Num Has been approved','You money will be CreDITED'),(4,'vivek','kumar','axasxa','abc.txt','50000','Waiting','-',NULL,NULL),(5,'vivek','kumar','axasxa','abc.txt','50000','Waiting','-',NULL,NULL),(6,'vivek','kumar','axasxa','abc.txt','50000','Waiting','-',NULL,NULL),(7,'vivek','kumar','wdwd','abc.txt','345566','Waiting','-',NULL,NULL),(8,'vivek','kumar','sxcs','abc.txt','50000','completed','12345','The to be send to the repective patient..','have a nice buddy'),(9,'shankar','Dr Hemkumar','You report has been check and the cost of operation will be','abc2.txt','84500','Waiting','-',NULL,NULL),(10,'shankar','Dr Hemkumar','This is the Report for the Patient..','abc2.txt','45600','completed','123456','This is the msg to banker for money approval','hello Shankar this canara bank your money request for operation will be creadited  with in one week thank you..'),(11,'sai','kaya','amount has been credited','f1.jpg','60000','completed','9876554','amount has been credited','Good Luck');

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `name` varchar(100) DEFAULT NULL,
  `bankname` varchar(100) DEFAULT NULL,
  `banktype` varchar(100) DEFAULT NULL,
  `accountnum` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

insert  into `bank`(`name`,`bankname`,`banktype`,`accountnum`,`address`) values ('vivek','Canara bank','savings ','1001010','vadapalani'),('vivek','Canara bank','savings ','1001010','perambur'),('shankar','Canara bank','savings ','1001010','vadapalani'),('sai','BOB','saving','89659001','Chennai'),('divya','SBI','saving','92345672','vadapalani'),('Abi','SBI','saving','89655432226','Vadpalani,chennai');

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `doctorid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `hospitalname` varchar(100) DEFAULT NULL,
  `specialist` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Waiting..',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `doctor` */

insert  into `doctor`(`id`,`doctorid`,`name`,`pass`,`mobile`,`email`,`address`,`hospitalname`,`specialist`,`status`) values (4,1234,'ram','1234','1234567890','1croreprojects.javateam@gmail.com','perambur','Fortis','heartspecialist','Authorized'),(5,456,'kumar','1234','1234567890','karthik@gmail.com','akshok nagar','SIMS','Physiatrist','Authorized'),(6,12345,'Dr Hemkumar','1234','1234567890','hemkumar@gmail.com','akshok nagar','Apollo','pediatrician','Authorized'),(7,56,'Dr Ram','123','7890625432','admin@gmail.com','vadapalani','SA','heartspecialist','Authorized'),(8,12,'kaya','123','8377287378','deepa@gmail.com','Vadpalani,chennai','SIM','Neurologist','Authorized');

/*Table structure for table `insurance` */

DROP TABLE IF EXISTS `insurance`;

CREATE TABLE `insurance` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `itype` varchar(200) DEFAULT NULL,
  `policynum` int(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `insurance` */

insert  into `insurance`(`id`,`name`,`itype`,`policynum`,`email`,`address`) values (6,'vivek','healthinsurance',12345,'1croreprojects.javateam@gmail.com','perambur'),(7,'cloud','healthinsurance',12345,'1croreprojects.javateam@gmail.com','perambur'),(8,'shankar','healthinsurance',123456,'1croreprojects.javateam@gmail.com','perambur'),(9,'sai','healthinsur',9876554,'sathya@gmail.com','Chennai'),(10,'divya','healthinsur',12145,'praba@gmail.com','Chennai'),(11,'Abi','healthinsur',9876554,'abi12@gmail.com','Vadpalani,chennai');

/*Table structure for table `personal` */

DROP TABLE IF EXISTS `personal`;

CREATE TABLE `personal` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `bloodgroup` varchar(100) DEFAULT NULL,
  `sugarlevel` varchar(100) DEFAULT NULL,
  `heartbeatrate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `personal` */

insert  into `personal`(`id`,`username`,`mobile`,`email`,`address`,`bloodgroup`,`sugarlevel`,`heartbeatrate`) values (6,'vivek','1234567890','1croreprojects.javateam@gmail.com','perambur','O Positive','Normal','120/min'),(7,'vivek','1234567890','1croreprojects.javateam@gmail.com','perambur','O Positive','Normal','120/min'),(8,'cloud','1234567890','1croreprojects.javateam@gmail.com','chennai','O Positive','Normal','120/min'),(9,'shankar','1234567890','1croreprojects.javateam@gmail.com','perambur','O Positive','Normal','120/min'),(10,'sai','9098575455','sathya@gmail.com','Chennai','O+ve','250','90'),(11,'divya','8907654321','praba@gmail.com','chennai','O+ve','340','120'),(12,'Abi','9768675643','abi@12gmail.com','Chennai','B+','80','120');

/*Table structure for table `upload` */

DROP TABLE IF EXISTS `upload`;

CREATE TABLE `upload` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Wating..',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `upload` */

insert  into `upload`(`id`,`filename`,`username`,`name`,`status`) values (1,'abc.txt','vivek','kumar','Wating..'),(2,'abc2.txt','shankar','Dr Hemkumar','Wating..'),(3,'f2.jpg','sai','Dr Hemkumar','Wating..'),(4,'f3.jpg','sai','ram','Wating..'),(5,'f2.jpg','divya','ram','Wating..'),(6,'f1.jpg','sai','kaya','Wating..'),(7,'READ ME.txt','Abi','Dr Hemkumar','Wating..');

/*Table structure for table `upload2` */

DROP TABLE IF EXISTS `upload2`;

CREATE TABLE `upload2` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uname` varchar(200) DEFAULT NULL,
  `dname` varchar(200) DEFAULT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `akey` varchar(200) DEFAULT '-',
  `status` varchar(100) DEFAULT 'waiting',
  `status2` varchar(100) DEFAULT 'not-verify',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `upload2` */

insert  into `upload2`(`id`,`uname`,`dname`,`filename`,`akey`,`status`,`status2`) values (11,'vivek','kumar','abc.txt','68446966','Active','verify'),(12,'vivek','kumar','abc.txt','68446966','Active','verify'),(13,'shankar','Dr Hemkumar','abc2.txt','23858822','Active','verify'),(14,'sai','kaya','f1.jpg','27502969','Active','verify'),(15,'sai','kaya','f1.jpg','27502969','Active','verify');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `mobile` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Waiting',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`uname`,`pass`,`mobile`,`email`,`address`,`status`) values (3,'vivek','1234','1234567890','1croreprojects.javateam@gmail.com','tamilnadu','Authorized'),(5,'karthik','1234','1234567890','1croreprojects.javateam@gmail.com','chennai','Authorized'),(6,'shankar','1234','1234567890','1croreprojects.javateam@gmail.com','perambur','Authorized'),(7,'sai','123','9098575455','admin@gmail.com','Chennai','Authorized'),(8,'Abi','1234','8473836389','abi12@gmail.com','Vadpalani,chennai','Authorized');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
