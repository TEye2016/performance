/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.1.32-community : Database - performance
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`performance` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `performance`;

/*Table structure for table `announce` */

DROP TABLE IF EXISTS `announce`;

CREATE TABLE `announce` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务主键',
  `userid` int(11) NOT NULL COMMENT '发布人主键',
  `a_date` datetime NOT NULL COMMENT '发布时间',
  `a_end` datetime NOT NULL COMMENT '任务结束时间',
  `a_name` varchar(30) NOT NULL COMMENT '任务名称',
  `a_score` int(11) NOT NULL COMMENT '任务分值',
  `a_lab` int(11) NOT NULL COMMENT '是否已被领取，1，领取，0未领取',
  `a_detail` text COMMENT '任务描述',
  `a_term` varchar(30) NOT NULL COMMENT '所属学期',
  `a_schoolyear` varchar(30) NOT NULL COMMENT '所属学年',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `announce` */

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系主键',
  `d_name` varchar(30) NOT NULL COMMENT '系名称',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(30) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuname` varchar(30) NOT NULL COMMENT '菜单名称',
  `url` varchar(30) NOT NULL COMMENT '菜单所对应的url',
  `f_menu` int(11) DEFAULT NULL COMMENT '菜单所对应的父级菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`menuname`,`url`,`f_menu`) values (1,'子菜单添加','/',1),(2,'父菜单添加','/',1),(3,'添加用户','/',2),(4,'修改用户','/',2);

/*Table structure for table `performance` */

DROP TABLE IF EXISTS `performance`;

CREATE TABLE `performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '绩效主键',
  `p_name` varchar(100) NOT NULL COMMENT '绩效名称',
  `p_descrip` text COMMENT '绩效描述',
  `u_id` int(11) NOT NULL COMMENT '绩效申请人主键',
  `p_type` int(11) NOT NULL COMMENT '绩效类型主键',
  `p_date` datetime NOT NULL COMMENT '申请时间',
  `p_score` int(11) NOT NULL COMMENT '绩效分值',
  `p_depart` int(11) NOT NULL COMMENT '所属系别',
  `dep_advice` text COMMENT '系主任审核意见',
  `aca_advice` text COMMENT '院长审核意见',
  `dept_exam` int(11) DEFAULT NULL COMMENT '系审核人',
  `aca_exam` int(11) DEFAULT NULL COMMENT '院审核人',
  `schoolyear` varchar(30) DEFAULT NULL COMMENT '所属学年',
  `p_term` varchar(30) DEFAULT NULL COMMENT '所属学期',
  `p_lab` int(11) NOT NULL COMMENT '审核状态，0，系主任未审核，1系主任审核未通过，2系主任审核通过，3院长审核未通过，4，院长审核通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `performance` */

/*Table structure for table `resources` */

DROP TABLE IF EXISTS `resources`;

CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Data for the table `resources` */

insert  into `resources`(`id`,`name`,`parentId`,`resKey`,`type`,`resUrl`,`level`,`description`) values (1,'资源管理',1010,'sys_resc','0','resc',0,'资源管理'),(2,'用户管理',1010,'sys_user','0','user',0,'用户管理'),(3,'角色管理',1010,'sys_role','0','role',0,'角色管理'),(4,'添加资源',1,'sys_resc_add','1','resources/add.action',1,'天假资源'),(54,'添加角色',3,'sys_role_add','1','role/add.action',NULL,'系统管理员功能，用于系统角色的创建。'),(55,'角色列表',3,'sys_role_list','1','role/findAll.action',NULL,'系统管理员功能，用于查看系统角色'),(56,'添加用户',2,'sys_user_add','1','user/add.action',NULL,'系统管理员功能，用于添加用户。'),(57,'用户查看',2,'sys_user_list','1','user/findAll.action',NULL,'系统管理员功能。用于产看系统用户。');

/*Table structure for table `resources_role` */

DROP TABLE IF EXISTS `resources_role`;

CREATE TABLE `resources_role` (
  `resc_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`resc_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `resources_role` */

insert  into `resources_role`(`resc_id`,`role_id`) values (1,1),(3,1),(4,1),(54,1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`roleKey`,`description`,`enable`) values (1,'超级管理员','ADMIN','系统超级管理员',1);

/*Table structure for table `teacher_score` */

DROP TABLE IF EXISTS `teacher_score`;

CREATE TABLE `teacher_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t_id` int(11) NOT NULL COMMENT '用户主键',
  `score` int(11) NOT NULL COMMENT '用户得分',
  `term` varchar(30) NOT NULL COMMENT '所属学期',
  `syear` varchar(30) NOT NULL COMMENT '所属学年',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher_score` */

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `type` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `userPassword` varchar(40) DEFAULT NULL,
  `userNickname` varchar(20) DEFAULT NULL,
  `userRealname` varchar(20) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `userSex` varchar(10) DEFAULT NULL,
  `userAddress` varchar(100) DEFAULT NULL,
  `userPhone` varchar(30) DEFAULT NULL,
  `userMail` varchar(45) DEFAULT NULL,
  `userQQ` varchar(30) DEFAULT NULL,
  `regTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastLogintime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `level` int(11) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `bankName` varchar(100) DEFAULT NULL,
  `branchBank` varchar(100) DEFAULT NULL,
  `subbranchBank` varchar(100) DEFAULT NULL,
  `openBankName` varchar(100) DEFAULT NULL,
  `bankAccountName` varchar(100) DEFAULT NULL,
  `bankAccount` varchar(100) DEFAULT NULL,
  `accountType` varchar(20) DEFAULT NULL,
  `pay` varchar(20) DEFAULT NULL,
  `mark` varchar(200) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `parentNumber` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`userPassword`,`userNickname`,`userRealname`,`userAge`,`userSex`,`userAddress`,`userPhone`,`userMail`,`userQQ`,`regTime`,`lastLogintime`,`level`,`province`,`city`,`bankName`,`branchBank`,`subbranchBank`,`openBankName`,`bankAccountName`,`bankAccount`,`accountType`,`pay`,`mark`,`status`,`parentNumber`) values (1,'2012211314','1','阿萨德',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-10 20:18:35','0000-00-00 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `user_announce` */

DROP TABLE IF EXISTS `user_announce`;

CREATE TABLE `user_announce` (
  `u_id` int(11) NOT NULL COMMENT '用户主键',
  `a_id` int(11) NOT NULL COMMENT '任务主键',
  PRIMARY KEY (`u_id`,`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_announce` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `role_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_role` */

insert  into `user_role`(`user_id`,`role_id`) values (1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
