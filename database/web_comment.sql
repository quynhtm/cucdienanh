/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cucdienanhvn

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-06-07 17:09:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_comment
-- ----------------------------
DROP TABLE IF EXISTS `web_comment`;
CREATE TABLE `web_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_parent_id` int(11) DEFAULT '0' COMMENT 'Comment cha, câu hỏi trước',
  `comment_object_id` int(11) DEFAULT '0' COMMENT 'ID đối tượng comment',
  `comment_object_name` varchar(255) DEFAULT NULL COMMENT 'tên đối tượng comment',
  `comment_type` int(11) DEFAULT '0' COMMENT 'Kiểu đối tượng: 1 tin tức, 2 video:3 ảnh,4: dowload file',
  `comment_customer_name` varchar(255) DEFAULT NULL COMMENT 'tên khách comment',
  `comment_content` tinytext COMMENT 'Nội dung conmetn',
  `comment_is_reply` tinyint(5) DEFAULT '0' COMMENT '0: chưa trả lời, 1: đã trả lời',
  `comment_create` int(11) DEFAULT NULL COMMENT 'tg hỏi',
  `comment_reply` int(11) DEFAULT '0' COMMENT 'Thời gian trả lời',
  `comment_status` tinyint(5) DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_comment
-- ----------------------------
