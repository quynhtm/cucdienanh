/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : laostyle

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-01-21 19:15:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for w_language
-- ----------------------------
DROP TABLE IF EXISTS `w_language`;
CREATE TABLE `w_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_keyword` varchar(255) DEFAULT NULL,
  `language_content` text,
  `language_lang` tinyint(5) DEFAULT NULL,
  `language_status` tinyint(5) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_language
-- ----------------------------
INSERT INTO `w_language` VALUES ('87', 'text_search', 'Tìm kiếm', '1', '1');
INSERT INTO `w_language` VALUES ('88', 'text_search', 'ຄົ້ນຫາ', '2', '1');
INSERT INTO `w_language` VALUES ('89', 'text_search', 'Search', '3', '1');
INSERT INTO `w_language` VALUES ('90', 'text_lang', 'Tiếng Việt', '1', '1');
INSERT INTO `w_language` VALUES ('91', 'text_lang', 'ລາວ', '2', '1');
INSERT INTO `w_language` VALUES ('92', 'text_lang', 'English', '3', '1');
INSERT INTO `w_language` VALUES ('93', 'text_home', 'Trang chủ', '1', '1');
INSERT INTO `w_language` VALUES ('94', 'text_home', 'ຫນ້າທໍາອິດ', '2', '1');
INSERT INTO `w_language` VALUES ('95', 'text_home', 'Home', '3', '1');
INSERT INTO `w_language` VALUES ('96', 'text_contact', 'Liên hệ', '1', '1');
INSERT INTO `w_language` VALUES ('97', 'text_contact', 'ການເຊື່ອມຕໍ່', '2', '1');
INSERT INTO `w_language` VALUES ('98', 'text_contact', 'Contact', '3', '1');
