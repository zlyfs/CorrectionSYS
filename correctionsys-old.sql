/*
Navicat MySQL Data Transfer

Source Server         : home
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : correctionsys

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-03-11 17:06:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `email_info`
-- ----------------------------
DROP TABLE IF EXISTS `email_info`;
CREATE TABLE `email_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_info_id` int(11) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `email_account` varchar(255) NOT NULL,
  `email_password` varchar(255) NOT NULL,
  `pop` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `email_model` varchar(1000) NOT NULL,
  `email_tital` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_info_id` (`product_info_id`),
  CONSTRAINT `email_info_ibfk_1` FOREIGN KEY (`product_info_id`) REFERENCES `product_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of email_info
-- ----------------------------

-- ----------------------------
-- Table structure for `forecast_data`
-- ----------------------------
DROP TABLE IF EXISTS `forecast_data`;
CREATE TABLE `forecast_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `data1` varchar(1000) DEFAULT NULL,
  `data2` varchar(1000) DEFAULT NULL,
  `data3` varchar(1000) DEFAULT NULL,
  `data4` varchar(1000) DEFAULT NULL,
  `data5` varchar(1000) DEFAULT NULL,
  `data6` varchar(1000) DEFAULT NULL,
  `data7` varchar(1000) DEFAULT NULL,
  `data8` varchar(1000) DEFAULT NULL,
  `data9` varchar(1000) DEFAULT NULL,
  `data10` varchar(1000) DEFAULT NULL,
  `objdata1` varchar(1000) DEFAULT NULL,
  `objdata2` varchar(1000) DEFAULT NULL,
  `objdata3` varchar(1000) DEFAULT NULL,
  `objdata4` varchar(1000) DEFAULT NULL,
  `objdata5` varchar(1000) DEFAULT NULL,
  `objdata6` varchar(1000) DEFAULT NULL,
  `objdata7` varchar(1000) DEFAULT NULL,
  `objdata8` varchar(1000) DEFAULT NULL,
  `objdata9` varchar(1000) DEFAULT NULL,
  `objdata10` varchar(1000) DEFAULT NULL,
  `forecast_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  `isok` tinyint(1) DEFAULT NULL,
  `forecaster_id` int(11) DEFAULT NULL,
  `checker_id` int(11) DEFAULT NULL,
  `prescription` int(11) NOT NULL,
  `forecast_type_name` varchar(255) NOT NULL COMMENT '要素类型名称',
  `display_lables` varchar(255) NOT NULL COMMENT '列表显示时标题名称如“24小时;48小时;72小时;96小时;120小时”',
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `forecast_data_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forecast_data
-- ----------------------------

-- ----------------------------
-- Table structure for `forecast_info`
-- ----------------------------
DROP TABLE IF EXISTS `forecast_info`;
CREATE TABLE `forecast_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prescription` int(11) NOT NULL COMMENT '预报时效，1-10',
  `photo_path` varchar(255) DEFAULT NULL,
  `photo_head` varchar(255) DEFAULT NULL,
  `forecast_type_id` int(11) NOT NULL COMMENT '关联出预报要素的种类',
  PRIMARY KEY (`id`),
  KEY `forecast_type_id` (`forecast_type_id`),
  CONSTRAINT `forecast_info_ibfk_1` FOREIGN KEY (`forecast_type_id`) REFERENCES `forecast_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forecast_info
-- ----------------------------

-- ----------------------------
-- Table structure for `forecast_type`
-- ----------------------------
DROP TABLE IF EXISTS `forecast_type`;
CREATE TABLE `forecast_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forecast_type_name` varchar(255) NOT NULL,
  `meaning_transfer_lable` varchar(255) NOT NULL COMMENT '转义用的标签，如{fw}等',
  `display_lables` varchar(255) NOT NULL COMMENT '列表显示时标题名称如“24小时;48小时;72小时;96小时;120小时”',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of forecast_type
-- ----------------------------

-- ----------------------------
-- Table structure for `ftp_info`
-- ----------------------------
DROP TABLE IF EXISTS `ftp_info`;
CREATE TABLE `ftp_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_info_id` int(11) NOT NULL,
  `ftp_ip` varchar(255) NOT NULL,
  `ftp_port` varchar(255) NOT NULL DEFAULT '21',
  `ftp_path` varchar(255) NOT NULL DEFAULT '',
  `ftp_account` varchar(255) NOT NULL DEFAULT '',
  `ftp_password` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `product_info_id` (`product_info_id`),
  CONSTRAINT `ftp_info_ibfk_1` FOREIGN KEY (`product_info_id`) REFERENCES `product_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ftp_info
-- ----------------------------

-- ----------------------------
-- Table structure for `mission_info`
-- ----------------------------
DROP TABLE IF EXISTS `mission_info`;
CREATE TABLE `mission_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_name` varchar(255) NOT NULL,
  `mission_abbreviation` varchar(255) NOT NULL COMMENT '预报任务的缩写，用于分任务建立文件夹等，不可重复，对应forecastFilesHead',
  `creat_time` datetime NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `mission_type` int(11) NOT NULL COMMENT '用于分辨文本类和数据类型任务',
  `isdel` tinyint(1) NOT NULL DEFAULT '0',
  `department` int(11) NOT NULL COMMENT '关联负责该任务的部门,',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mission_info
-- ----------------------------

-- ----------------------------
-- Table structure for `post_info`
-- ----------------------------
DROP TABLE IF EXISTS `post_info`;
CREATE TABLE `post_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_info_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL DEFAULT '',
  `passoword` varchar(255) NOT NULL DEFAULT '',
  `str` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_info_id` (`product_info_id`),
  CONSTRAINT `post_info_ibfk_1` FOREIGN KEY (`product_info_id`) REFERENCES `product_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of post_info
-- ----------------------------

-- ----------------------------
-- Table structure for `product_info`
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_create_path` varchar(255) DEFAULT NULL COMMENT '产品文件生成路径',
  `product_model_path` varchar(255) DEFAULT NULL,
  `product_model_name` varchar(255) DEFAULT NULL,
  `product_model_type` int(11) DEFAULT NULL COMMENT '产品模型的文件类型',
  `ftp_path` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_model` varchar(255) DEFAULT NULL,
  `email_account` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of product_info
-- ----------------------------

-- ----------------------------
-- Table structure for `r_mission_product`
-- ----------------------------
DROP TABLE IF EXISTS `r_mission_product`;
CREATE TABLE `r_mission_product` (
  `mission_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`mission_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `r_mission_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of r_mission_product
-- ----------------------------

-- ----------------------------
-- Table structure for `r_mission_station`
-- ----------------------------
DROP TABLE IF EXISTS `r_mission_station`;
CREATE TABLE `r_mission_station` (
  `mission_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  PRIMARY KEY (`mission_id`,`station_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `r_mission_station_ibfk_1` FOREIGN KEY (`mission_id`) REFERENCES `mission_info` (`id`),
  CONSTRAINT `r_mission_station_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `station_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of r_mission_station
-- ----------------------------

-- ----------------------------
-- Table structure for `r_station_forecast`
-- ----------------------------
DROP TABLE IF EXISTS `r_station_forecast`;
CREATE TABLE `r_station_forecast` (
  `station_id` int(11) NOT NULL,
  `forecast_info_id` int(11) NOT NULL,
  PRIMARY KEY (`station_id`,`forecast_info_id`),
  KEY `forecast_info_id` (`forecast_info_id`),
  CONSTRAINT `r_station_forecast_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station_info` (`id`),
  CONSTRAINT `r_station_forecast_ibfk_2` FOREIGN KEY (`forecast_info_id`) REFERENCES `forecast_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of r_station_forecast
-- ----------------------------

-- ----------------------------
-- Table structure for `station_info`
-- ----------------------------
DROP TABLE IF EXISTS `station_info`;
CREATE TABLE `station_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(255) NOT NULL,
  `location` int(11) NOT NULL COMMENT '关联地理位置表',
  `creat_time` datetime NOT NULL,
  `modify_time` datetime DEFAULT NULL,
  `isdel` tinyint(1) NOT NULL DEFAULT '0',
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of station_info
-- ----------------------------

-- ----------------------------
-- Table structure for `warning_data`
-- ----------------------------
DROP TABLE IF EXISTS `warning_data`;
CREATE TABLE `warning_data` (
  `id` int(11) NOT NULL,
  `forecast_data` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of warning_data
-- ----------------------------
