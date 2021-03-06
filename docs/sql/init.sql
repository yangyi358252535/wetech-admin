-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wetech_admin
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `ip` varchar(45) DEFAULT NULL COMMENT '用户ip',
  `req_method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `req_uri` text COMMENT '请求URL',
  `exec_method` varchar(200) DEFAULT NULL COMMENT '执行方法',
  `exec_time` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `args` text COMMENT '参数',
  `return_val` text COMMENT '返回值',
  `exec_desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `status` varchar(45) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7211 DEFAULT CHARSET=utf8 COMMENT='系统日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

--
-- Table structure for table `sys_organization`
--

DROP TABLE IF EXISTS `sys_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_organization_parent_id` (`parent_id`),
  KEY `idx_sys_organization_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_organization`
--

LOCK TABLES `sys_organization` WRITE;
/*!40000 ALTER TABLE `sys_organization` DISABLE KEYS */;
INSERT INTO `sys_organization` VALUES (1,'总公司',0,'0/',1,0),(2,'分公司1',1,'0/1/',1,1),(3,'分公司3',1,'0/1/',1,2),(4,'分公司10',2,'0/1/2/',1,221),(17,'一级节点',1,'0/1/',1,122),(18,'二级节点',17,'0/1/17/',1,NULL),(19,'三级节点',18,'0/1/17/18/',0,NULL),(24,'1212',2,'0/1/2/',1,121212);
/*!40000 ALTER TABLE `sys_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource`
--

DROP TABLE IF EXISTS `sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(100) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  `icon` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sys_resource_parent_id` (`parent_id`),
  KEY `idx_sys_resource_parent_ids` (`parent_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_resource`
--

LOCK TABLES `sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
INSERT INTO `sys_resource` VALUES (1,'资源','menu','#',0,'0/','',1,'',0),(11,'组织机构管理','menu','#',1,'0/1/','organization:*',1,'am-icon-sitemap',3),(12,'组织机构新增','button','',11,'0/1/11/','organization:create',1,NULL,NULL),(13,'组织机构修改','button','',11,'0/1/11/','organization:update',1,NULL,NULL),(14,'组织机构删除','button','',11,'0/1/11/','organization:delete',1,NULL,NULL),(15,'组织机构查看','button','',11,'0/1/11/','organization:view',1,NULL,NULL),(21,'用户管理','menu','#',1,'0/1/','user:*',1,'am-icon-user',1),(22,'用户新增','button','',46,'0/1/21/','user:create',1,NULL,NULL),(23,'用户修改','button','',46,'0/1/21/','user:update',1,'',NULL),(24,'用户删除','button','',46,'0/1/21/','user:delete',1,NULL,NULL),(25,'用户查看','button','',46,'0/1/21/','user:view',1,NULL,NULL),(31,'资源管理','menu','#',1,'0/1/','resource:*',1,'am-icon-cubes',2),(32,'资源新增','button','',31,'0/1/31/','resource:create',1,NULL,NULL),(33,'资源修改','button','',31,'0/1/31/','resource:update',1,'',NULL),(34,'资源删除','button','',31,'0/1/31/','resource:delete',1,NULL,NULL),(35,'资源查看','button','',31,'0/1/31/','resource:view',1,NULL,NULL),(41,'角色管理','menu','#role',21,'0/1/','role:*',1,'am-icon-child',2),(42,'角色新增','button','',41,'0/1/41/','role:create',1,NULL,NULL),(43,'角色修改','button','',41,'0/1/41/','role:update',1,NULL,NULL),(44,'角色删除','button','',41,'0/1/41/','role:delete',1,NULL,NULL),(45,'角色查看','button','',41,'0/1/41/','role:view',1,NULL,NULL),(46,'系统用户','menu','#user',21,'0/1/11/','user:*',1,'am-icon-wrench',1),(47,'组织机构','menu','#organization',11,'0/1/11/','user:*',1,'am-icon-suitcase',NULL),(50,'资源管理','menu','#resource',31,'0/1/','resource:*',1,'am-icon-desktop',NULL),(69,'系统管理','menu','#',1,'0/1/','system:*',1,'am-icon-wrench',4),(70,'系统日志','menu','#log',69,'0/1/69/','log:*',1,'am-icon-history',NULL),(71,'代码生成器','menu','#generator',69,'0/1/69/','',1,'am-icon-code',NULL);
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `resource_ids` varchar(100) DEFAULT NULL,
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sys_role_resource_ids` (`resource_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'admin','超级管理员','11,21,31,41,69,70',0),(2,'guest','访客','15,25,35,45',0),(4,'ceshi3','测试的角色','12,14,34,35,51',0),(5,'test','测试角色','12,13,14,43,47',0);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_id` bigint(20) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `role_ids` varchar(100) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sys_user_username` (`username`),
  KEY `idx_sys_user_organization_id` (`organization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,1,'admin','d3c59d25033dbf980d29554025c23a75','8d78869f470951332959580424d4bf4f','1',0),(2,2,'ceshi','c067bee5cf7f216f352011cb9064241e','2632e0a577dba732bbfb4b298ff0b6e5','4',0),(4,4,'ceshi22323','f0c6227912db35e27eaa82308be055cd','a2425da3d41a6ef79a1ec69a7d845767','1',0),(5,3,'ceshi222222','2861e51604088d7f32b0f54880cb96c9','e348ab0c766bddc4e578057ee3042944','1,2',0),(6,3,'cesss1222','4ccd3a1356c1ce22ba48cbecf5f58168','c88b2e8af007844105cc3e424441b924','1,2',0),(9,3,'guest22','6622b95a30cf730253550985718102bc','7de124e9822c092d56750969eebcf260','2',0),(10,3,'guest','fdd97263888fb3767d55ff084751c125','9f1bdc22981ae8730e89f94d241a73cc','2',0),(14,2,'1243556','f2987cc9071769190207f091a62a1527','7d44eb764a42ea338711fc4d4cff8349',NULL,0),(15,3,'adaddw','ee60b68d4b00d5495b7a88fdcbd73473','998c37b5435f3d48b010122180e1bdd2','2',0),(16,17,'12434','f17bf5e211de8a5cb611c4b6d83b728b','ffb57814a69d37ec1898282d4090cbfc','2',0),(17,3,'ewewe','a45d0145d26438bed47f16fe1f58865f','944f0820ec7fc51b1606726313b37a71','2',0),(19,3,'3333','d4ab86f43fa806bfd6e6029effeeb990','4f9b9497dd614222e91ef53aec9be414','2,4',0),(20,2,'111121211','066ec6b9b55778e3bc9da5425e60086d','13781fec738083ad86671069d0510f3b',NULL,0),(25,23,'admin212','f51764c4e21a7226f92ce79bef273a33','b184db3641404a412c28d0863f46054e','2,4',0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-18 10:17:35
