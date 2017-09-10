-- MySQL dump 10.13  Distrib 5.5.48, for Linux (x86_64)
--
-- Host: localhost    Database: hengju
-- ------------------------------------------------------
-- Server version	5.5.48-log

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
-- Table structure for table `bonus_details`
--

DROP TABLE IF EXISTS `bonus_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bonus_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bonus_amount` float NOT NULL DEFAULT '0' COMMENT '提成金额（根据rule_key，一手提成或者分红）',
  `employee_code` varchar(50) NOT NULL COMMENT '员工编号',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `is_cost` int(11) NOT NULL COMMENT '店铺成本:0-不作，1-作',
  `store_type` int(11) NOT NULL COMMENT '店铺类型',
  `update_code` varchar(50) NOT NULL COMMENT '表唯一标识',
  `bonus_rule_key` varchar(50) NOT NULL COMMENT '(提成，分红)',
  `store_code` varchar(50) NOT NULL,
  `cstore_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '子店铺编号，可为空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bonus_details`
--

LOCK TABLES `bonus_details` WRITE;
/*!40000 ALTER TABLE `bonus_details` DISABLE KEYS */;
INSERT INTO `bonus_details` VALUES (1,264,'hj003T4','2017-08-10 09:05:43',2017,8,1,2,'20178T1','1','hj003',NULL),(2,616,'hj003T3','2017-08-10 09:05:43',2017,8,1,2,'20178T1','1','hj003',NULL);
/*!40000 ALTER TABLE `bonus_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculate_log`
--

DROP TABLE IF EXISTS `calculate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculate_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_code` varchar(50) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `is_last` int(4) NOT NULL DEFAULT '1' COMMENT '每次更新数据，置为1表示最新数据，其他需要修改为0',
  `employee_code` varchar(50) NOT NULL DEFAULT '操作者',
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculate_log`
--

LOCK TABLES `calculate_log` WRITE;
/*!40000 ALTER TABLE `calculate_log` DISABLE KEYS */;
INSERT INTO `calculate_log` VALUES (1,'20178T1','2017-08-10 17:05:44',1,'hj001T2',8,2017);
/*!40000 ALTER TABLE `calculate_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculate_store`
--

DROP TABLE IF EXISTS `calculate_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculate_store` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `income` float NOT NULL COMMENT '总收入',
  `outcome` float NOT NULL COMMENT '总支出',
  `profit` float NOT NULL COMMENT '总利润',
  `store_code` varchar(50) NOT NULL COMMENT '店铺编号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_code` varchar(50) NOT NULL COMMENT '更新标志',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculate_store`
--

LOCK TABLES `calculate_store` WRITE;
/*!40000 ALTER TABLE `calculate_store` DISABLE KEYS */;
INSERT INTO `calculate_store` VALUES (1,0,1500,-1500,'hj002','2017-08-10 09:05:44','20178T1',2017,8),(2,2200,4380,-2180,'hj003','2017-08-10 09:05:44','20178T1',2017,8);
/*!40000 ALTER TABLE `calculate_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commission_details`
--

DROP TABLE IF EXISTS `commission_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commission_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(50) NOT NULL COMMENT '店铺编号',
  `employee_code` varchar(50) NOT NULL COMMENT '员工编号',
  `amount` float NOT NULL DEFAULT '0' COMMENT '佣金额度',
  `second_amount` float NOT NULL DEFAULT '0' COMMENT '二手房佣金',
  `rent_amount` float NOT NULL DEFAULT '0' COMMENT '租房佣金',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `update_code` varchar(50) NOT NULL COMMENT '表唯一标识',
  `contract_number` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commission_details`
--

LOCK TABLES `commission_details` WRITE;
/*!40000 ALTER TABLE `commission_details` DISABLE KEYS */;
INSERT INTO `commission_details` VALUES (1,'hj003','hj003T4',0,0,660,2017,8,'2017-08-10 09:05:43','20178T1','1'),(2,'hj003','hj003T3',0,0,1540,2017,8,'2017-08-10 09:05:43','20178T1','1');
/*!40000 ALTER TABLE `commission_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_images`
--

DROP TABLE IF EXISTS `contract_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` varchar(50) NOT NULL COMMENT '签单编号',
  `url` varchar(255) NOT NULL COMMENT '地址',
  `status_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_images`
--

LOCK TABLES `contract_images` WRITE;
/*!40000 ALTER TABLE `contract_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_process`
--

DROP TABLE IF EXISTS `contract_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_process` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contract_number` varchar(50) NOT NULL COMMENT '签单号',
  `type` int(10) unsigned NOT NULL COMMENT '1:网签，2：贷款，3：交税',
  `remark` text COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `status_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签单流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_process`
--

LOCK TABLES `contract_process` WRITE;
/*!40000 ALTER TABLE `contract_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_details`
--

DROP TABLE IF EXISTS `cost_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(128) NOT NULL COMMENT '类目',
  `amount` float NOT NULL COMMENT '金额',
  `store_code` varchar(50) NOT NULL COMMENT '店铺编码',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `update_code` varchar(50) NOT NULL COMMENT '表唯一标识',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_details`
--

LOCK TABLES `cost_details` WRITE;
/*!40000 ALTER TABLE `cost_details` DISABLE KEYS */;
INSERT INTO `cost_details` VALUES (1,'人员工资[总店分摊]',1500,'hj002',2017,8,'20178T1','2017-08-10 09:05:43'),(2,'人员工资[总店分摊]',1500,'hj003',2017,8,'20178T1','2017-08-10 09:05:43');
/*!40000 ALTER TABLE `cost_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_position`
--

DROP TABLE IF EXISTS `employee_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(50) NOT NULL COMMENT '员工编号',
  `position_code` varchar(50) NOT NULL COMMENT '职位编号',
  `store_code` varchar(50) NOT NULL COMMENT '店铺编号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_position`
--

LOCK TABLES `employee_position` WRITE;
/*!40000 ALTER TABLE `employee_position` DISABLE KEYS */;
INSERT INTO `employee_position` VALUES (14,'123132123123123123123','jl01','hj001'),(15,'hj001T2','cw01','hj001'),(16,'123123','gh01','hj001'),(74,'hj002T16','xs01','hj002'),(73,'hj002T15','xs01','hj002'),(72,'hj002T14','xs02','hj002'),(71,'hj002T13','xs02','hj002'),(70,'hj002T12','xs05','hj002'),(69,'hj002T11','xs05','hj002'),(68,'hj002T10','xs05','hj002'),(67,'hj002T9','xs05','hj002'),(66,'hj002T8','xs05','hj002'),(65,'hj002T7','xs02','hj002'),(64,'hj002T6','zl01','hj002'),(63,'hj002T5','dz01','hj002'),(62,'hj003T4','xs02','hj003'),(61,'hj003T3','xs05','hj003'),(75,'hj003T17','zl03','hj003'),(76,'hj003T18','xs04','hj003'),(77,'hj003T19','xs03','hj003'),(78,'hj003T20','xs05','hj003'),(79,'hj003T21','xs05','hj003'),(80,'hj003T22','xs05','hj003'),(81,'hj003T23','xs02','hj003'),(82,'hj003T24','xs02','hj003'),(83,'hj003T25','xs02','hj003'),(84,'hj003T26','xs02','hj003'),(85,'hj003T27','dz01','hj003'),(86,'hj004T28','dz01','hj004'),(87,'hj004T29','xs02','hj004'),(88,'hj004T30','xs02','hj004'),(89,'hj004T31','xs05','hj004'),(90,'hj004T32','xs02','hj004'),(91,'hj004T33','xs03','hj004');
/*!40000 ALTER TABLE `employee_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grant_log`
--

DROP TABLE IF EXISTS `grant_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grant_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(50) NOT NULL DEFAULT '' COMMENT '员工编号',
  `year` int(50) NOT NULL,
  `month` int(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `record_user` varchar(50) NOT NULL COMMENT '录入员',
  `update_code` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grant_log`
--

LOCK TABLES `grant_log` WRITE;
/*!40000 ALTER TABLE `grant_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `grant_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_adjustment_log`
--

DROP TABLE IF EXISTS `position_adjustment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_adjustment_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_position_code` varchar(50) NOT NULL COMMENT '旧职位编号',
  `new_position_code` varchar(50) NOT NULL COMMENT '新职位编号',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `employee_code` varchar(50) NOT NULL COMMENT '员工编号',
  `old_store_code` varchar(50) NOT NULL COMMENT '旧店铺编号',
  `new_store_code` varchar(50) NOT NULL COMMENT '新店铺编号',
  `year` int(10) unsigned NOT NULL COMMENT '年',
  `month` int(10) unsigned NOT NULL COMMENT '月',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_adjustment_log`
--

LOCK TABLES `position_adjustment_log` WRITE;
/*!40000 ALTER TABLE `position_adjustment_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_adjustment_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reduce_salary`
--

DROP TABLE IF EXISTS `reduce_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reduce_salary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(50) NOT NULL,
  `employee_code` varchar(50) NOT NULL,
  `record_user` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `amount` float NOT NULL DEFAULT '0',
  `category` text NOT NULL COMMENT '类目',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `day` int(11) NOT NULL,
  `is_port` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是端口费',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reduce_salary`
--

LOCK TABLES `reduce_salary` WRITE;
/*!40000 ALTER TABLE `reduce_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `reduce_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_details`
--

DROP TABLE IF EXISTS `salary_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_code` varchar(50) NOT NULL COMMENT '员工编号',
  `salary_amount` float NOT NULL COMMENT '基本工资',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `store_type` int(11) NOT NULL COMMENT '店铺类型 1-总店 2-分店;3:区域',
  `update_code` varchar(50) NOT NULL COMMENT '表唯一标识',
  `store_code` varchar(50) NOT NULL COMMENT '店铺code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_details`
--

LOCK TABLES `salary_details` WRITE;
/*!40000 ALTER TABLE `salary_details` DISABLE KEYS */;
INSERT INTO `salary_details` VALUES (1,'123132123123123123123',1000,2017,8,'2017-08-09 21:05:43',1,'20178T1','hj001'),(2,'hj001T2',1000,2017,8,'2017-08-09 21:05:43',1,'20178T1','hj001'),(3,'123123',1000,2017,8,'2017-08-09 21:05:43',1,'20178T1','hj001'),(4,'hj003T3',1000,2017,8,'2017-08-09 21:05:43',2,'20178T1','hj003'),(5,'hj003T4',1000,2017,8,'2017-08-09 21:05:43',2,'20178T1','hj003');
/*!40000 ALTER TABLE `salary_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_bonus_rule`
--

DROP TABLE IF EXISTS `staff_bonus_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_bonus_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_key` int(50) NOT NULL COMMENT '规则key:1:销售阶梯提成；2:助理分红；3:店长分红（本店）；4:区域经理分红；5:总经理；6:二级分店；7:一手分成比例；8:二手房房源分成比例；9:租售房源分成比例，10:销售等级评定，11:一手房提成；12:二租房提成，13:端口申报评定',
  `top` varchar(50) DEFAULT NULL COMMENT '范围上限',
  `bottom` int(11) DEFAULT NULL COMMENT '范围下限',
  `percentage` float NOT NULL COMMENT '百分比',
  `is_cost` int(11) NOT NULL COMMENT '店铺成本:0-不作，1-作',
  `status_del` int(11) NOT NULL DEFAULT '0' COMMENT '0--存在 ，1--不存在',
  `position_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_bonus_rule`
--

LOCK TABLES `staff_bonus_rule` WRITE;
/*!40000 ALTER TABLE `staff_bonus_rule` DISABLE KEYS */;
INSERT INTO `staff_bonus_rule` VALUES (8,3,NULL,NULL,0.04,0,1,NULL),(9,4,NULL,NULL,0.04,0,0,NULL),(10,5,NULL,NULL,0.05,0,0,NULL),(12,7,NULL,NULL,0.05,0,0,NULL),(68,2,NULL,NULL,0.05,0,0,NULL),(70,12,NULL,NULL,0.03,0,1,NULL),(81,8,NULL,NULL,0.7,0,0,NULL),(82,9,NULL,NULL,0.5,0,1,NULL),(83,11,NULL,NULL,0.01,0,1,NULL),(91,1,'3000',0,0.01,1,1,NULL),(92,1,'6000',3001,0.05,1,1,NULL),(93,1,'9000',6001,0.03,1,1,NULL),(94,1,'+00',9001,0.04,1,1,NULL),(104,13,NULL,10000,0.1,0,0,NULL),(105,13,NULL,15000,0.3,0,0,NULL),(106,13,NULL,20000,0.4,0,0,NULL),(122,10,NULL,0,0,0,1,'xs01'),(123,10,NULL,200,0,0,1,'xs02'),(124,10,NULL,1000,0,0,1,'xs03'),(125,10,NULL,14000,0,0,1,'xs04'),(126,10,NULL,15000,0,0,1,'xs05'),(129,6,'20',NULL,0.66,0,1,NULL),(130,10,NULL,0,0,0,1,'xs01'),(131,10,NULL,200,0,0,1,'xs02'),(132,10,NULL,1000,0,0,1,'xs03'),(133,10,NULL,1400,0,0,1,'xs04'),(134,10,NULL,15000,0,0,1,'xs05'),(135,6,'6',NULL,0.1,0,1,NULL),(136,6,'0',NULL,0.1,0,0,NULL),(137,11,NULL,NULL,0.4,0,0,NULL),(138,12,NULL,NULL,0.4,0,0,NULL),(139,10,NULL,0,0,0,0,'xs01'),(140,10,NULL,5000,0,0,0,'xs02'),(141,10,NULL,36000,0,0,0,'xs03'),(142,10,NULL,48000,0,0,0,'xs04'),(143,10,NULL,66000,0,0,0,'xs05'),(144,3,NULL,NULL,0.4,0,0,NULL),(145,9,NULL,NULL,0.7,0,0,NULL),(146,1,'10000',0,0.2,1,0,NULL),(147,1,'20000',10001,0.3,1,0,NULL),(148,1,'30000',20001,0.35,1,0,NULL),(149,1,'40000',30001,0.4,1,0,NULL),(150,1,'50000',40001,0.45,1,0,NULL),(151,1,'+00',50001,0.5,1,0,NULL);
/*!40000 ALTER TABLE `staff_bonus_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_contract`
--

DROP TABLE IF EXISTS `staff_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL COMMENT '单号',
  `employee_code` varchar(50) NOT NULL COMMENT '员工编号',
  `sign_amount` float NOT NULL COMMENT '签单额度',
  `real_amount` float NOT NULL DEFAULT '0' COMMENT '结单额度',
  `is_signed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否结佣：1-是，0-不是',
  `year` int(11) NOT NULL COMMENT '年',
  `month` int(11) NOT NULL COMMENT '月',
  `store_code` varchar(50) NOT NULL COMMENT '店铺编号',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `day` int(11) NOT NULL,
  `status_del` int(11) NOT NULL DEFAULT '0' COMMENT '0 未删除',
  `type` int(11) NOT NULL COMMENT '单子类型 1-一手， 2-二手， 3 -租单',
  `is_divide` int(11) NOT NULL DEFAULT '0' COMMENT '是否为有房源提供方，0-无，1-有 ',
  `source_employee` varchar(50) DEFAULT '0' COMMENT '房源提供方code',
  `remark` text COMMENT '备注',
  `contract_addr` text NOT NULL COMMENT '房源地址',
  `received_amount` float DEFAULT '0' COMMENT '已收金额',
  `source_store` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_contract`
--

LOCK TABLES `staff_contract` WRITE;
/*!40000 ALTER TABLE `staff_contract` DISABLE KEYS */;
INSERT INTO `staff_contract` VALUES (1,'20170804','hj003T3',2200,2200,1,2017,8,'hj003','2017-08-10 09:05:33','2017-08-10 09:02:37',4,0,3,1,'hj003T4','    结佣备注：1','报慈菜园村113幢2楼',2200,'hj003');
/*!40000 ALTER TABLE `staff_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_employee`
--

DROP TABLE IF EXISTS `staff_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '员工姓名',
  `sex` int(11) NOT NULL COMMENT '性别：0：男，1-女',
  `birth` varchar(128) DEFAULT NULL COMMENT '出生年月',
  `id_card` varchar(50) DEFAULT NULL COMMENT '身份证',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `addr` varchar(255) DEFAULT NULL COMMENT '住址',
  `entry_time` varchar(128) DEFAULT NULL COMMENT '入职时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1-存在，0-不存在',
  `position_code` varchar(10) NOT NULL COMMENT '所属职位',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(50) NOT NULL COMMENT '员工编号，唯一',
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_employee`
--

LOCK TABLES `staff_employee` WRITE;
/*!40000 ALTER TABLE `staff_employee` DISABLE KEYS */;
INSERT INTO `staff_employee` VALUES (37,'经理',0,'','2312312312312','13213123123','addr','2017-07-26',1,'','2017-08-10 08:35:24','123132123123123123123','2017-06-30 01:29:29'),(38,'财务',1,'2017-06','2356456','12312312312','aaa','2017-07-26',1,'','2017-08-10 08:35:29','hj001T2','2017-06-30 01:30:11'),(39,'过户',1,'2017-06','123123123123123123','12312312312','addr','2017-07-26',1,'','2017-08-10 08:35:33','123123','2017-06-30 01:30:38'),(98,'王芳',1,'1986-11-08','421022198611081529','13815284295','','2017-01-31',1,'',NULL,'hj003T3','2017-08-10 08:50:43'),(99,'陈鑫',0,'1994-06-15','321281199406151876','13915621905','','2017-02-01',1,'',NULL,'hj003T4','2017-08-10 09:01:35'),(100,'陶亚萍',1,'1982-06-24','320520198206242026','15995914411','','2014-12-24',1,'',NULL,'hj002T5','2017-08-11 02:11:57'),(101,'丁欢',0,'1985-12-10','320581198512102710','17751261817','','2016-03-04',1,'',NULL,'hj002T6','2017-08-11 02:13:37'),(102,'叶春龙',0,'1995-01-02','320581199501022517','18351776760','','2016-10-05',1,'',NULL,'hj002T7','2017-08-11 02:16:16'),(103,'闫佩佩',1,'1998-10-05','410725199810052420','15995946983','','2016-05-05',1,'',NULL,'hj002T8','2017-08-11 02:44:29'),(104,'冯春',0,'1990-03-18','320581199003181531','15501528988','','2016-10-05',1,'',NULL,'hj002T9','2017-08-11 02:53:34'),(105,'田克强',0,'1981-07-21','320520198107211718','15851559336','','2016-05-18',1,'',NULL,'hj002T10','2017-08-11 04:56:59'),(106,'袁国强',0,'','511524199103061413','18762977609','','2016-05-25',1,'',NULL,'hj002T11','2017-08-11 04:57:46'),(107,'郑雷振',0,'','410225199808184152','15051521750','','2016-11-22',1,'',NULL,'hj002T12','2017-08-11 04:58:37'),(108,'殷安利',1,'','320921198210022884','15050308616','','2017-02-04',1,'',NULL,'hj002T13','2017-08-11 04:59:30'),(109,'朱文宾',0,'','320581198812021613','13814960290','','2017-05-19',1,'',NULL,'hj002T14','2017-08-11 05:00:24'),(110,'王东',0,'','320921199508156791','15962624404','','2017-07-03',1,'',NULL,'hj002T15','2017-08-11 05:01:20'),(111,'张召',0,'','341224199305088253','13033079752','','2017-07-29',1,'',NULL,'hj002T16','2017-08-11 05:03:32'),(112,'冯波',0,'','320581198901193919','15501525598','','2015-12-14',1,'',NULL,'hj003T17','2017-08-11 08:25:54'),(113,'何李林',0,'','511028199309218031','13862331447','','2016-04-08',1,'',NULL,'hj003T18','2017-08-11 08:26:54'),(114,'刘亚凯',0,'','410482199310031739','15370180295','','2016-05-20',1,'',NULL,'hj003T19','2017-08-11 08:45:30'),(115,'王光耀',0,'','320581199708300211','13906246222','','2016-08-15',1,'',NULL,'hj003T20','2017-08-11 08:46:06'),(116,'翁奎奎',0,'','342401199610289673','13773066189','','2016-11-16',1,'',NULL,'hj003T21','2017-08-11 08:46:50'),(117,'沈兰',1,'','320581199003291925','13913653424','','2017-02-10',1,'',NULL,'hj003T22','2017-08-11 08:48:17'),(118,'陈晋国',0,'','320581199603220012','18106231109','','2017-03-01',1,'',NULL,'hj003T23','2017-08-11 08:48:57'),(119,'林森',0,'','342224199203030916','18550322437','','2017-04-01',1,'',NULL,'hj003T24','2017-08-11 08:50:00'),(120,'谭晓婷',1,'','320581199007271622','13913668695','','2017-05-23',1,'',NULL,'hj003T25','2017-08-11 08:50:43'),(121,'谢丽',1,'','342623198602096526','13914925282','','2017-03-02',1,'',NULL,'hj003T26','2017-08-11 08:51:39'),(122,'陆佳',0,'','320520198806020734','13913650258','','2014-03-02',1,'',NULL,'hj003T27','2017-08-11 08:52:40'),(123,'高荣',0,'','320581198904262510','13915664305','','2015-02-10',1,'',NULL,'hj004T28','2017-08-11 08:53:37'),(124,'梁佳雯',1,'','320581199711302322','13913643040','','2015-11-20',1,'',NULL,'hj004T29','2017-08-11 09:07:06'),(125,'石可为',0,'','320581199101250414','13962323126','','2016-03-03',1,'',NULL,'hj004T30','2017-08-11 09:07:37'),(126,'丁世锋',0,'','342401198702092275','18962329749','','2016-06-17',1,'',NULL,'hj004T31','2017-08-11 09:08:06'),(127,'郭志',0,'','142322199105043516','13862339321','','2016-12-02',1,'',NULL,'hj004T32','2017-08-11 09:11:30'),(128,'王铭科',1,'','320581199212092527','13814960835','','2017-02-06',1,'',NULL,'hj004T33','2017-08-11 09:12:09');
/*!40000 ALTER TABLE `staff_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_port`
--

DROP TABLE IF EXISTS `staff_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_port` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `port_name` varchar(255) NOT NULL COMMENT '端口名',
  `employee_code` varchar(50) NOT NULL,
  `store_code` varchar(50) NOT NULL,
  `remark` text,
  `amount` float NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `length` int(11) NOT NULL COMMENT '期数',
  `pay_month` text NOT NULL COMMENT '还款月份',
  `status` int(11) NOT NULL COMMENT '1-存在 0-不存在',
  `port_number` varchar(50) DEFAULT NULL,
  `unit` float DEFAULT NULL,
  `port_place` varchar(255) DEFAULT NULL,
  `start_year_month` int(10) unsigned NOT NULL COMMENT '开始还款年月',
  `end_year_month` int(10) unsigned NOT NULL COMMENT '结束还款年月',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_port`
--

LOCK TABLES `staff_port` WRITE;
/*!40000 ALTER TABLE `staff_port` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_position`
--

DROP TABLE IF EXISTS `staff_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(50) NOT NULL COMMENT '所属店铺',
  `code` varchar(50) NOT NULL COMMENT '职位代号',
  `name` varchar(255) NOT NULL COMMENT '职位名称',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '级别',
  `salary` float NOT NULL COMMENT '基本工资',
  `status_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-删除，0-未删除',
  `position_tag` varchar(255) NOT NULL COMMENT '头衔',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=368 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_position`
--

LOCK TABLES `staff_position` WRITE;
/*!40000 ALTER TABLE `staff_position` DISABLE KEYS */;
INSERT INTO `staff_position` VALUES (1,'hj001','jl01','总经理',1,1000,0,'总经理'),(2,'hj001','gh01','过户',1,1000,0,'过户专员'),(5,'hj001','cw01','财务',1,1000,0,'财务专员'),(303,'qy00T1','qy01','区域经理',1,1000,0,'区域经理'),(304,'qy00T2','qy01','区域经理',1,1000,0,'区域经理'),(305,'hj002','dz01','店长',1,2200,0,'店长'),(306,'hj002','zl01','店长助理',1,1800,0,'高级置业顾问'),(307,'hj002','zl02','店长助理',2,1000,0,'主任置业顾问'),(308,'hj002','zl03','店长助理',3,1000,0,'金牌置业顾问'),(309,'hj002','xs01','销售',1,1400,0,'见习置业顾问'),(310,'hj002','xs02','销售',2,1600,0,'置业顾问'),(311,'hj002','xs03','销售',3,1800,0,'高级置业顾问'),(312,'hj002','xs04','销售',4,2000,0,'主任置业顾问'),(313,'hj002','xs05','销售',5,2200,0,'金牌置业顾问'),(314,'hj003','dz01','店长',1,1000,0,'店长'),(315,'hj003','zl01','店长助理',1,1000,0,'高级置业顾问'),(316,'hj003','zl02','店长助理',2,1000,0,'主任置业顾问'),(317,'hj003','zl03','店长助理',3,1000,0,'金牌置业顾问'),(318,'hj003','xs01','销售',1,1000,0,'见习置业顾问'),(319,'hj003','xs02','销售',2,1000,0,'置业顾问'),(320,'hj003','xs03','销售',3,1000,0,'高级置业顾问'),(321,'hj003','xs04','销售',4,1000,0,'主任置业顾问'),(322,'hj003','xs05','销售',5,1000,0,'金牌置业顾问'),(323,'hj004','dz01','店长',1,1000,0,'店长'),(324,'hj004','zl01','店长助理',1,1000,0,'高级置业顾问'),(325,'hj004','zl02','店长助理',2,1000,0,'主任置业顾问'),(326,'hj004','zl03','店长助理',3,1000,0,'金牌置业顾问'),(327,'hj004','xs01','销售',1,1000,0,'见习置业顾问'),(328,'hj004','xs02','销售',2,1000,0,'置业顾问'),(329,'hj004','xs03','销售',3,1000,0,'高级置业顾问'),(330,'hj004','xs04','销售',4,1000,0,'主任置业顾问'),(331,'hj004','xs05','销售',5,1000,0,'金牌置业顾问'),(332,'hj005','dz01','店长',1,1000,0,'店长'),(333,'hj005','zl01','店长助理',1,1000,0,'高级置业顾问'),(334,'hj005','zl02','店长助理',2,1000,0,'主任置业顾问'),(335,'hj005','zl03','店长助理',3,1000,0,'金牌置业顾问'),(336,'hj005','xs01','销售',1,1000,0,'见习置业顾问'),(337,'hj005','xs02','销售',2,1000,0,'置业顾问'),(338,'hj005','xs03','销售',3,1000,0,'高级置业顾问'),(339,'hj005','xs04','销售',4,1000,0,'主任置业顾问'),(340,'hj005','xs05','销售',5,1000,0,'金牌置业顾问'),(341,'hj006','dz01','店长',1,1000,0,'店长'),(342,'hj006','zl01','店长助理',1,1000,0,'高级置业顾问'),(343,'hj006','zl02','店长助理',2,1000,0,'主任置业顾问'),(344,'hj006','zl03','店长助理',3,1000,0,'金牌置业顾问'),(345,'hj006','xs01','销售',1,1000,0,'见习置业顾问'),(346,'hj006','xs02','销售',2,1000,0,'置业顾问'),(347,'hj006','xs03','销售',3,1000,0,'高级置业顾问'),(348,'hj006','xs04','销售',4,1000,0,'主任置业顾问'),(349,'hj006','xs05','销售',5,1000,0,'金牌置业顾问'),(350,'hj007','dz01','店长',1,1000,0,'店长'),(351,'hj007','zl01','店长助理',1,1000,0,'高级置业顾问'),(352,'hj007','zl02','店长助理',2,1000,0,'主任置业顾问'),(353,'hj007','zl03','店长助理',3,1000,0,'金牌置业顾问'),(354,'hj007','xs01','销售',1,1000,0,'见习置业顾问'),(355,'hj007','xs02','销售',2,1000,0,'置业顾问'),(356,'hj007','xs03','销售',3,1000,0,'高级置业顾问'),(357,'hj007','xs04','销售',4,1000,0,'主任置业顾问'),(358,'hj007','xs05','销售',5,1000,0,'金牌置业顾问'),(359,'hj008','dz01','店长',1,1000,0,'店长'),(360,'hj008','zl01','店长助理',1,1000,0,'高级置业顾问'),(361,'hj008','zl02','店长助理',2,1000,0,'主任置业顾问'),(362,'hj008','zl03','店长助理',3,1000,0,'金牌置业顾问'),(363,'hj008','xs01','销售',1,1000,0,'见习置业顾问'),(364,'hj008','xs02','销售',2,1000,0,'置业顾问'),(365,'hj008','xs03','销售',3,1000,0,'高级置业顾问'),(366,'hj008','xs04','销售',4,1000,0,'主任置业顾问'),(367,'hj008','xs05','销售',5,1000,0,'金牌置业顾问');
/*!40000 ALTER TABLE `staff_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_position_level`
--

DROP TABLE IF EXISTS `staff_position_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_position_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `top` varchar(50) NOT NULL,
  `bottom` varchar(50) NOT NULL,
  `position_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_position_level`
--

LOCK TABLES `staff_position_level` WRITE;
/*!40000 ALTER TABLE `staff_position_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_position_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_transfer_record`
--

DROP TABLE IF EXISTS `staff_transfer_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_transfer_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_code` varchar(50) NOT NULL COMMENT '店铺编号',
  `employee_code` varchar(50) NOT NULL COMMENT '员工编号',
  `amount` float NOT NULL COMMENT '过户费用',
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `contract_number` varchar(50) NOT NULL COMMENT '签单号',
  `day` int(11) NOT NULL,
  `status_del` int(11) NOT NULL DEFAULT '0' COMMENT '0 未删除',
  `remark` text CHARACTER SET utf8 COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_transfer_record`
--

LOCK TABLES `staff_transfer_record` WRITE;
/*!40000 ALTER TABLE `staff_transfer_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_transfer_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_city`
--

DROP TABLE IF EXISTS `store_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '城市编号',
  `name` varchar(128) NOT NULL COMMENT '城市名称',
  `remark` text CHARACTER SET utf8,
  `status_del` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_city`
--

LOCK TABLES `store_city` WRITE;
/*!40000 ALTER TABLE `store_city` DISABLE KEYS */;
INSERT INTO `store_city` VALUES (1,'cs00T1','常熟地区','',0,'2017-07-31 09:23:25'),(3,'cs00T3','上海地区','上海',1,'2017-07-31 09:27:58');
/*!40000 ALTER TABLE `store_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_company`
--

DROP TABLE IF EXISTS `store_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '公司名',
  `addr` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1-存在，0-不存在',
  `reamrk` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_company`
--

LOCK TABLES `store_company` WRITE;
/*!40000 ALTER TABLE `store_company` DISABLE KEYS */;
INSERT INTO `store_company` VALUES (1,'江苏公司',NULL,1,NULL,NULL,'2017-05-28 22:32:16','888');
/*!40000 ALTER TABLE `store_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_cost`
--

DROP TABLE IF EXISTS `store_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_cost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL COMMENT '总额',
  `category` varchar(128) NOT NULL COMMENT '类目',
  `month` int(255) NOT NULL COMMENT '创建月份',
  `length` int(10) NOT NULL COMMENT '分期数',
  `owner_store_code` varchar(50) NOT NULL COMMENT '费用所属店铺',
  `pay_stores` varchar(255) NOT NULL COMMENT '还款店铺',
  `unit` float NOT NULL COMMENT '每期还款金额',
  `pay_month` text NOT NULL COMMENT '偿还月份',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `year` int(11) NOT NULL COMMENT '创建年份',
  `start_year_month` int(11) NOT NULL COMMENT '结束还款年份',
  `end_year_month` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_cost`
--

LOCK TABLES `store_cost` WRITE;
/*!40000 ALTER TABLE `store_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_income`
--

DROP TABLE IF EXISTS `store_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_income` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total` float NOT NULL COMMENT '总额',
  `category` varchar(128) NOT NULL COMMENT '类目',
  `month` int(255) NOT NULL COMMENT '创建月份',
  `year` int(11) NOT NULL COMMENT '创建年份',
  `store_code` varchar(50) NOT NULL COMMENT '店铺号',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remark` text CHARACTER SET utf8 COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_income`
--

LOCK TABLES `store_income` WRITE;
/*!40000 ALTER TABLE `store_income` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_store`
--

DROP TABLE IF EXISTS `store_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '店铺编号',
  `name` varchar(128) NOT NULL COMMENT '店铺名称',
  `addr` varchar(255) NOT NULL COMMENT '地址',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1-存在，0-不存在',
  `type` int(11) NOT NULL COMMENT '店铺类型：1-总店，2-分店',
  `city_code` varchar(50) DEFAULT NULL COMMENT '所属城市邮编',
  `parent_code` varchar(50) DEFAULT '0' COMMENT '父级店铺编号',
  `parent_start_time` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '父级店铺开始时间',
  `company_code` varchar(50) NOT NULL COMMENT '所属公司',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `status_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'del状态 1-删除，0-未删除',
  `zone_code` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '区域code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_store`
--

LOCK TABLES `store_store` WRITE;
/*!40000 ALTER TABLE `store_store` DISABLE KEYS */;
INSERT INTO `store_store` VALUES (19,'hj001','xxx总公司','addr',1,1,'cs00T1','0','','888','2017-08-09 02:23:23',NULL,0,''),(72,'hj002','珠江东路店','珠江东路',1,2,'cs00T1','0','','888',NULL,'2017-08-10 08:41:41',0,'qy00T2'),(73,'hj003','湘江西路店','湘江西路',1,2,'cs00T1','0','','888',NULL,'2017-08-10 08:41:56',0,'qy00T2'),(74,'hj004','湘江东路一店','湘江东路',1,2,'cs00T1','0','','888',NULL,'2017-08-11 01:57:35',0,'qy00T2'),(75,'hj005','湘江东路二店','湘江东路',1,2,'cs00T1','0','','888',NULL,'2017-08-11 01:57:45',0,'qy00T2'),(76,'hj006','华山路店','华山路',1,2,'cs00T1','0','','888',NULL,'2017-08-11 01:57:58',0,'qy00T2'),(77,'hj007','泰慈店','衡山路',1,2,'cs00T1','0','','888',NULL,'2017-08-11 01:58:23',0,'qy00T2'),(78,'hj008','新颜东路店','新颜东路',1,2,'cs00T1','0','','888',NULL,'2017-08-11 01:58:38',0,'qy00T2');
/*!40000 ALTER TABLE `store_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_zone`
--

DROP TABLE IF EXISTS `store_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '区域名',
  `code` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1 -- 存在 0 -- 不存在',
  `remark` text COMMENT '备注',
  `addr` text,
  `city_code` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '城市编号',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_zone`
--

LOCK TABLES `store_zone` WRITE;
/*!40000 ALTER TABLE `store_zone` DISABLE KEYS */;
INSERT INTO `store_zone` VALUES (1,'123','qy00T1',0,'','456','cs00T1','2017-08-10 08:38:20'),(2,'市区','qy00T2',1,'','1','cs00T1','2017-08-10 08:38:46');
/*!40000 ALTER TABLE `store_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `pwd` varchar(255) NOT NULL,
  `employee_code` varchar(50) NOT NULL COMMENT '所属员工编号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1-存在，0-不存在',
  `last_login_time` varchar(128) DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(128) DEFAULT NULL COMMENT '最后登陆ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'财务','e10adc3949ba59abbe56e057f20f883e','hj001T2',1,NULL,NULL),(7,'经理','e10adc3949ba59abbe56e057f20f883e','123132123123123123123',1,NULL,NULL),(8,'过户','e10adc3949ba59abbe56e057f20f883e','123123',1,NULL,NULL),(63,'王芳','e10adc3949ba59abbe56e057f20f883e','hj003T3',1,NULL,NULL),(64,'陈鑫','e10adc3949ba59abbe56e057f20f883e','hj003T4',1,NULL,NULL),(65,'陶亚萍','e10adc3949ba59abbe56e057f20f883e','hj002T5',1,NULL,NULL),(66,'丁欢','e10adc3949ba59abbe56e057f20f883e','hj002T6',1,NULL,NULL),(67,'叶春龙','e10adc3949ba59abbe56e057f20f883e','hj002T7',1,NULL,NULL),(68,'闫佩佩','e10adc3949ba59abbe56e057f20f883e','hj002T8',1,NULL,NULL),(69,'冯春','e10adc3949ba59abbe56e057f20f883e','hj002T9',1,NULL,NULL),(70,'田克强','e10adc3949ba59abbe56e057f20f883e','hj002T10',1,NULL,NULL),(71,'袁国强','e10adc3949ba59abbe56e057f20f883e','hj002T11',1,NULL,NULL),(72,'郑雷振','e10adc3949ba59abbe56e057f20f883e','hj002T12',1,NULL,NULL),(73,'殷安利','e10adc3949ba59abbe56e057f20f883e','hj002T13',1,NULL,NULL),(74,'朱文宾','e10adc3949ba59abbe56e057f20f883e','hj002T14',1,NULL,NULL),(75,'王东','e10adc3949ba59abbe56e057f20f883e','hj002T15',1,NULL,NULL),(76,'张召','e10adc3949ba59abbe56e057f20f883e','hj002T16',1,NULL,NULL),(77,'冯波','e10adc3949ba59abbe56e057f20f883e','hj003T17',1,NULL,NULL),(78,'何李林','e10adc3949ba59abbe56e057f20f883e','hj003T18',1,NULL,NULL),(79,'刘亚凯','e10adc3949ba59abbe56e057f20f883e','hj003T19',1,NULL,NULL),(80,'王光耀','e10adc3949ba59abbe56e057f20f883e','hj003T20',1,NULL,NULL),(81,'翁奎奎','e10adc3949ba59abbe56e057f20f883e','hj003T21',1,NULL,NULL),(82,'沈兰','e10adc3949ba59abbe56e057f20f883e','hj003T22',1,NULL,NULL),(83,'陈晋国','e10adc3949ba59abbe56e057f20f883e','hj003T23',1,NULL,NULL),(84,'林森','e10adc3949ba59abbe56e057f20f883e','hj003T24',1,NULL,NULL),(85,'谭晓婷','e10adc3949ba59abbe56e057f20f883e','hj003T25',1,NULL,NULL),(86,'谢丽','e10adc3949ba59abbe56e057f20f883e','hj003T26',1,NULL,NULL),(87,'陆佳','e10adc3949ba59abbe56e057f20f883e','hj003T27',1,NULL,NULL),(88,'高荣','e10adc3949ba59abbe56e057f20f883e','hj004T28',1,NULL,NULL),(89,'梁佳雯','e10adc3949ba59abbe56e057f20f883e','hj004T29',1,NULL,NULL),(90,'石可为','e10adc3949ba59abbe56e057f20f883e','hj004T30',1,NULL,NULL),(91,'丁世锋','e10adc3949ba59abbe56e057f20f883e','hj004T31',1,NULL,NULL),(92,'郭志','e10adc3949ba59abbe56e057f20f883e','hj004T32',1,NULL,NULL),(93,'王铭科','e10adc3949ba59abbe56e057f20f883e','hj004T33',1,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_perm`
--

DROP TABLE IF EXISTS `user_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_perm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '权限名',
  `code` varchar(128) NOT NULL COMMENT '权限代号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_perm`
--

LOCK TABLES `user_perm` WRITE;
/*!40000 ALTER TABLE `user_perm` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '角色名',
  `code` varchar(128) NOT NULL COMMENT '角色代号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态：1-存在，0-不存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_login_ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_time` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态：1-存在，0-不存在',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_note`
--

DROP TABLE IF EXISTS `work_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_note`
--

LOCK TABLES `work_note` WRITE;
/*!40000 ALTER TABLE `work_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_note` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-12  2:00:01
