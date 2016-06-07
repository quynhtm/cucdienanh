/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : cucdienanhvn

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-06-07 14:32:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_video
-- ----------------------------
DROP TABLE IF EXISTS `web_video`;
CREATE TABLE `web_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_sort_desc` text CHARACTER SET utf8,
  `video_content` text CHARACTER SET utf8,
  `video_link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_file` varchar(255) DEFAULT NULL,
  `video_img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_img_temp` varchar(255) DEFAULT NULL,
  `video_status` tinyint(5) DEFAULT NULL,
  `video_view` int(11) DEFAULT '0' COMMENT 'lượt view xem video tren site',
  `video_time_creater` int(11) DEFAULT '0',
  `video_time_update` int(11) DEFAULT '0',
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of web_video
-- ----------------------------
