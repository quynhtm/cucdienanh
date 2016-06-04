/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : cucdienanhvn

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-06-04 10:10:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_category
-- ----------------------------
DROP TABLE IF EXISTS `web_category`;
CREATE TABLE `web_category` (
  `category_id` int(12) NOT NULL AUTO_INCREMENT,
  `type_id` int(12) DEFAULT NULL,
  `uid` int(12) DEFAULT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_name_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_parent_id` smallint(5) unsigned DEFAULT NULL,
  `category_content_front` tinyint(2) DEFAULT '0',
  `category_content_front_order` int(12) DEFAULT NULL,
  `category_horizontal` tinyint(2) DEFAULT NULL,
  `category_vertical` tinyint(2) DEFAULT NULL,
  `category_order` int(12) DEFAULT '0',
  `category_status` tinyint(1) DEFAULT '0',
  `category_created` int(12) DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_meta_keywords` text COLLATE utf8_unicode_ci,
  `category_meta_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`category_id`),
  KEY `status` (`category_status`) USING BTREE,
  KEY `id_parrent` (`category_parent_id`,`category_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of web_category
-- ----------------------------
INSERT INTO `web_category` VALUES ('183', null, null, 'Phát hành - phổ biến phim', null, '0', '1', '1', null, null, '1', '1', null, null, null, null, null);
