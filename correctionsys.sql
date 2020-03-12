/*
Navicat MySQL Data Transfer

Source Server         : home
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : correctionsys

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-03-12 15:44:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `data`
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `data_info_id` int(11) NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  `prescription_num` int(11) NOT NULL,
  KEY `data_info_id` (`data_info_id`),
  CONSTRAINT `data_ibfk_1` FOREIGN KEY (`data_info_id`) REFERENCES `data_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of data
-- ----------------------------

-- ----------------------------
-- Table structure for `data_info`
-- ----------------------------
DROP TABLE IF EXISTS `data_info`;
CREATE TABLE `data_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT '关系表id',
  `r_version` int(11) NOT NULL COMMENT '关系表版本',
  `date` date NOT NULL COMMENT '记录制作预报的日期',
  `creat_time` datetime NOT NULL COMMENT '记录生成时间，可统计数据到位时间',
  `modify_time` datetime NOT NULL COMMENT '记录修改时间',
  `isok` tinyint(4) NOT NULL DEFAULT '0',
  `forecaster` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `checker` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prescription` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `r_version` (`r_version`),
  CONSTRAINT `data_info_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `relationship` (`rid`),
  CONSTRAINT `data_info_ibfk_2` FOREIGN KEY (`r_version`) REFERENCES `relationship` (`r_version`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of data_info
-- ----------------------------

-- ----------------------------
-- Table structure for `element_info`
-- ----------------------------
DROP TABLE IF EXISTS `element_info`;
CREATE TABLE `element_info` (
  `eid` int(11) NOT NULL,
  `e_version` int(11) NOT NULL,
  `creat_time` datetime NOT NULL,
  `isdel` tinyint(4) NOT NULL DEFAULT '0',
  `forecast_element_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '新预报要素' COMMENT '预报要素名称',
  `display_lables` varchar(255) CHARACTER SET utf8 DEFAULT '24小时;48小时;72小时;96小时;120小时' COMMENT '列表显示时标题名称如“24小时;48小时;72小时;96小时;120小时”',
  PRIMARY KEY (`eid`,`e_version`),
  KEY `fid` (`eid`),
  KEY `f_version` (`e_version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of element_info
-- ----------------------------
INSERT INTO `element_info` VALUES ('1', '1', '0000-00-00 00:00:00', '0', '', '');
INSERT INTO `element_info` VALUES ('2', '1', '0000-00-00 00:00:00', '0', 'd', '');

-- ----------------------------
-- Table structure for `hi_data`
-- ----------------------------
DROP TABLE IF EXISTS `hi_data`;
CREATE TABLE `hi_data` (
  `data_info_id` int(11) NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '',
  `prescription_num` int(11) NOT NULL,
  KEY `data_info_id` (`data_info_id`),
  CONSTRAINT `hi_data_ibfk_1` FOREIGN KEY (`data_info_id`) REFERENCES `hi_data_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hi_data
-- ----------------------------

-- ----------------------------
-- Table structure for `hi_data_info`
-- ----------------------------
DROP TABLE IF EXISTS `hi_data_info`;
CREATE TABLE `hi_data_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL COMMENT '关系表id',
  `r_version` int(11) NOT NULL COMMENT '关系表版本',
  `date` date NOT NULL COMMENT '记录制作预报的日期',
  `creat_time` datetime NOT NULL COMMENT '记录生成时间，可统计数据到位时间',
  `modify_time` datetime NOT NULL COMMENT '记录修改时间',
  `forecaster` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `checker` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prescription` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `r_version` (`r_version`),
  CONSTRAINT `hi_data_info_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `relationship` (`rid`),
  CONSTRAINT `hi_data_info_ibfk_2` FOREIGN KEY (`r_version`) REFERENCES `relationship` (`r_version`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hi_data_info
-- ----------------------------

-- ----------------------------
-- Table structure for `mission_info`
-- ----------------------------
DROP TABLE IF EXISTS `mission_info`;
CREATE TABLE `mission_info` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `m_version` int(11) NOT NULL,
  `creat_time` datetime NOT NULL,
  `isdel` tinyint(4) NOT NULL DEFAULT '0',
  `m_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '新的预报任务' COMMENT '任务名称',
  `m_abbreviation` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '预报任务英文简称，不可重复，将用于文件前缀和路径',
  `department` int(11) NOT NULL COMMENT '所属部门（暂时不用)',
  PRIMARY KEY (`mid`,`m_version`),
  KEY `mid` (`mid`),
  KEY `m_version` (`m_version`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mission_info
-- ----------------------------

-- ----------------------------
-- Table structure for `obj_suggest`
-- ----------------------------
DROP TABLE IF EXISTS `obj_suggest`;
CREATE TABLE `obj_suggest` (
  `date` date NOT NULL,
  `sug1` text CHARACTER SET utf8,
  `sug2` text CHARACTER SET utf8,
  `sug3` text CHARACTER SET utf8,
  `sug4` text CHARACTER SET utf8,
  `sug5` text CHARACTER SET utf8,
  `sug6` text CHARACTER SET utf8,
  `sug7` text CHARACTER SET utf8,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of obj_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for `relationship`
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship` (
  `rid` int(11) NOT NULL,
  `r_version` int(11) NOT NULL,
  `creat_time` datetime NOT NULL,
  `isdel` tinyint(4) NOT NULL DEFAULT '0',
  `mid` int(11) NOT NULL,
  `m_version` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `s_version` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `e_version` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`r_version`),
  KEY `mid` (`mid`),
  KEY `m_version` (`m_version`),
  KEY `sid` (`sid`),
  KEY `s_version` (`s_version`),
  KEY `eid` (`eid`),
  KEY `e_version` (`e_version`),
  KEY `rid` (`rid`),
  KEY `r_version` (`r_version`),
  CONSTRAINT `relationship_ibfk_6` FOREIGN KEY (`e_version`) REFERENCES `element_info` (`e_version`),
  CONSTRAINT `relationship_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `mission_info` (`mid`),
  CONSTRAINT `relationship_ibfk_2` FOREIGN KEY (`m_version`) REFERENCES `mission_info` (`m_version`),
  CONSTRAINT `relationship_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `station_info` (`sid`),
  CONSTRAINT `relationship_ibfk_4` FOREIGN KEY (`s_version`) REFERENCES `station_info` (`s_version`),
  CONSTRAINT `relationship_ibfk_5` FOREIGN KEY (`eid`) REFERENCES `element_info` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of relationship
-- ----------------------------

-- ----------------------------
-- Table structure for `station_info`
-- ----------------------------
DROP TABLE IF EXISTS `station_info`;
CREATE TABLE `station_info` (
  `sid` int(11) NOT NULL,
  `s_version` int(11) NOT NULL,
  `creat_time` datetime NOT NULL,
  `isdel` tinyint(4) NOT NULL DEFAULT '0',
  `s_name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '新的站点' COMMENT '站名',
  `s_abbreviation` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '站点简称，用于找文件路径、制定文件名称等（不可重复）',
  `location` int(11) DEFAULT NULL COMMENT '所属区域（暂留，待扩展）',
  `longitude` double NOT NULL COMMENT '经度',
  `latitude` double NOT NULL COMMENT '纬度',
  `photo_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片路径（如有则用）',
  `obj_fore_path` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '客观数据文件位置（如有则用）',
  PRIMARY KEY (`sid`,`s_version`),
  KEY `sid` (`sid`),
  KEY `s_version` (`s_version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of station_info
-- ----------------------------
INSERT INTO `station_info` VALUES ('1', '1', '0000-00-00 00:00:00', '0', '', null, null, '0', '0', null, null);
INSERT INTO `station_info` VALUES ('1', '2', '0000-00-00 00:00:00', '0', '', null, null, '0', '0', null, null);
INSERT INTO `station_info` VALUES ('2', '1', '0000-00-00 00:00:00', '0', '', null, null, '0', '0', null, null);
INSERT INTO `station_info` VALUES ('3', '1', '0000-00-00 00:00:00', '0', '', null, null, '0', '0', null, null);

-- ----------------------------
-- Table structure for `sub_suggest`
-- ----------------------------
DROP TABLE IF EXISTS `sub_suggest`;
CREATE TABLE `sub_suggest` (
  `date` date NOT NULL,
  `sug1` text CHARACTER SET utf8,
  `sug2` text CHARACTER SET utf8,
  `sug3` text CHARACTER SET utf8,
  `sug4` text CHARACTER SET utf8,
  `sug5` text CHARACTER SET utf8,
  `sug6` text CHARACTER SET utf8,
  `sug7` text CHARACTER SET utf8,
  `forescater` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sub_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for `text_data`
-- ----------------------------
DROP TABLE IF EXISTS `text_data`;
CREATE TABLE `text_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) DEFAULT NULL,
  `t_version` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `creat_time` datetime DEFAULT NULL,
  `isok` tinyint(4) DEFAULT NULL,
  `forecaster` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `checker` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `t_data` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `t_version` (`t_version`),
  CONSTRAINT `text_data_ibfk_2` FOREIGN KEY (`t_version`) REFERENCES `text_info` (`t_version`),
  CONSTRAINT `text_data_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `text_info` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of text_data
-- ----------------------------

-- ----------------------------
-- Table structure for `text_info`
-- ----------------------------
DROP TABLE IF EXISTS `text_info`;
CREATE TABLE `text_info` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `t_version` int(11) NOT NULL,
  `creat_date` datetime DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `t_name` varchar(255) CHARACTER SET utf8 DEFAULT '新的文字任务' COMMENT '文字任务名称',
  `t_abbreviation` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`,`t_version`),
  KEY `t_version` (`t_version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of text_info
-- ----------------------------

-- ----------------------------
-- Table structure for `warning_data`
-- ----------------------------
DROP TABLE IF EXISTS `warning_data`;
CREATE TABLE `warning_data` (
  `id` int(11) NOT NULL COMMENT '警报发布日期',
  `warning_date` date NOT NULL,
  `warning_name` varchar(255) NOT NULL COMMENT '警报名称',
  `warning_num` varchar(255) NOT NULL COMMENT '警报编号',
  `warning_level` int(11) NOT NULL COMMENT '警报级别',
  `warning_type` int(11) NOT NULL,
  `forecaster` varchar(255) NOT NULL,
  `checker` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of warning_data
-- ----------------------------
