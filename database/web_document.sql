/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cucdienanhvn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-06-07 09:59:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_document
-- ----------------------------
DROP TABLE IF EXISTS `web_document`;
CREATE TABLE `web_document` (
  `document_id` int(12) NOT NULL AUTO_INCREMENT,
  `document_type` int(12) DEFAULT '1' COMMENT '1: file dowload',
  `document_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'file cần upload và dowload',
  `document_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_name_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_order` int(12) DEFAULT '0',
  `document_status` tinyint(1) DEFAULT '0',
  `document_created` int(12) DEFAULT NULL,
  `uid` int(12) DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_meta_keywords` text COLLATE utf8_unicode_ci,
  `document_meta_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`document_id`),
  KEY `status` (`document_status`) USING BTREE,
  KEY `id_parrent` (`document_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of web_document
-- ----------------------------
