/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : cucdienanhvn

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-06-07 14:46:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_type
-- ----------------------------
DROP TABLE IF EXISTS `web_type`;
CREATE TABLE `web_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '1',
  `type_name` varchar(255) DEFAULT NULL,
  `type_keyword` varchar(255) DEFAULT NULL,
  `type_order` int(10) DEFAULT '0',
  `type_created` int(11) DEFAULT '0',
  `type_status` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_type
-- ----------------------------
INSERT INTO `web_type` VALUES ('8', '1', 'Kiểu tin tức', 'group_news', '1', '1465271622', '1');
INSERT INTO `web_type` VALUES ('9', '1', 'Kiểu văn bản', 'group_document', '2', '1465263660', '1');
INSERT INTO `web_type` VALUES ('11', '1', 'Thư viện ảnh', 'group_images', '3', '1465265764', '1');
