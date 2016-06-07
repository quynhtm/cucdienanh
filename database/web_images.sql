/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cucdienanhvn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-06-07 14:34:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_images
-- ----------------------------
DROP TABLE IF EXISTS `web_images`;
CREATE TABLE `web_images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_title` varchar(255) DEFAULT NULL,
  `image_desc_sort` text,
  `image_image` varchar(255) DEFAULT NULL COMMENT 'ảnh đại diện của bài viết',
  `image_image_other` longtext COMMENT 'Lưu ảnh của bài viết',
  `image_status` tinyint(5) DEFAULT NULL,
  `image_meta_title` text,
  `image_meta_keyword` text,
  `image_meta_description` text,
  `image_create` int(11) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_images
-- ----------------------------
INSERT INTO `web_images` VALUES ('1', 'đang test tin tức', 'adada', '', null, '1', '', '', '', '1465206181');
INSERT INTO `web_images` VALUES ('2', 'list ảnh demo', 'list ảnh demo4', '', null, '0', 'list ảnh demo4', 'list ảnh demo4', 'list ảnh demo4', '1465283262');
