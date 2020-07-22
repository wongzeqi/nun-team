/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.28 : Database - nun-team
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nun-team` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `nun-team`;

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_user` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_user` varchar(64) NOT NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `ts` datetime NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`menu_type`,`visible`,`perms`,`icon`,`create_user`,`create_time`,`update_user`,`update_time`,`remark`,`ts`) values (2011,'系统管理',0,1,'#','','0',NULL,'#','wjq','2020-07-22 19:10:15','王嘉琪','2020-07-22 19:10:22','','2020-07-22 19:10:31'),(2012,'菜单管理',2011,1,'menu/menu','','0',NULL,'#','wjq','2020-07-22 19:13:09','wjq','2020-07-22 19:13:21','','2020-07-22 19:13:23');

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) NOT NULL COMMENT '权限',
  `name` varchar(64) NOT NULL COMMENT '地址',
  `create_time` datetime NOT NULL,
  `create_user` varchar(64) NOT NULL,
  `update_time` datetime NOT NULL,
  `update_user` varchar(64) NOT NULL,
  `ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`id`,`url`,`name`,`create_time`,`create_user`,`update_time`,`update_user`,`ts`) values (1,'/user','user:user','0000-00-00 00:00:00','','0000-00-00 00:00:00','','2020-07-22 16:47:59'),(2,'/user/add','user:add','0000-00-00 00:00:00','','0000-00-00 00:00:00','','2020-07-22 16:48:02'),(3,'/user/delete','user:delete','0000-00-00 00:00:00','','0000-00-00 00:00:00','','2020-07-22 16:48:14'),(4,'/menu/list','system:menu:list','2020-07-22 19:01:49','wjq','2020-07-22 19:01:55','wjq','2020-07-22 19:01:59'),(5,'/menu/menu','system:menu:view','2020-07-22 19:43:31','wjq','2020-07-22 19:43:35','wjq','2020-07-22 19:43:38');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `desc` varchar(64) NOT NULL COMMENT '角色描述',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user` varchar(64) NOT NULL,
  `update_user` varchar(64) NOT NULL,
  `ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`name`,`desc`,`create_time`,`update_time`,`create_user`,`update_user`,`ts`) values (1,'admin','管理员','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00'),(2,'test','测试人员','0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user` varchar(64) NOT NULL,
  `update_user` varchar(64) NOT NULL,
  `ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `rid` int(11) DEFAULT NULL COMMENT '角色ID',
  `pid` int(11) DEFAULT NULL COMMENT '权限ID',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user` varchar(64) NOT NULL,
  `update_user` varchar(64) NOT NULL,
  `ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`rid`,`pid`,`create_time`,`update_time`,`create_user`,`update_user`,`ts`) values (1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00'),(1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00'),(1,3,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00'),(1,4,'2020-07-22 19:02:12','2020-07-22 19:02:14','wjq','wjq','2020-07-22 19:02:22'),(1,5,'2020-07-22 19:43:59','2020-07-22 19:44:00','wjq','wjq','2020-07-22 19:44:08');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有效 1：有效  0：锁定',
  `update_time` datetime NOT NULL,
  `create_user` varchar(64) NOT NULL,
  `update_user` varchar(64) NOT NULL,
  `ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`username`,`password`,`create_time`,`status`,`update_time`,`create_user`,`update_user`,`ts`) values (1,'wangjiaqi','0fa3f3be43409f4924b5924e9b6c44d4','2020-07-22 14:23:19',1,'0000-00-00 00:00:00','','','0000-00-00 00:00:00');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user` varchar(64) NOT NULL,
  `update_user` varchar(64) NOT NULL,
  `ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`uid`,`rid`,`create_time`,`update_time`,`create_user`,`update_user`,`ts`) values (1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','','','0000-00-00 00:00:00');

/*Table structure for table `team` */

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_name` varchar(100) NOT NULL COMMENT '团队名称',
  `team_register_time` datetime NOT NULL COMMENT '注册时间',
  `team_description` varchar(2000) DEFAULT '""' COMMENT '团队描述',
  `team_logo` varchar(255) DEFAULT NULL COMMENT '团队logo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `team` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
