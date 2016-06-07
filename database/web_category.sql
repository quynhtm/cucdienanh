/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50625
Source Host           : 127.0.0.1:3306
Source Database       : cucdienanhvn

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2016-06-07 16:40:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for web_category
-- ----------------------------
DROP TABLE IF EXISTS `web_category`;
CREATE TABLE `web_category` (
  `category_id` int(12) NOT NULL AUTO_INCREMENT,
  `type_id` int(12) DEFAULT NULL,
  `type_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of web_category
-- ----------------------------
INSERT INTO `web_category` VALUES ('182', '8', 'group_news', '1', 'Thông tin hoạt động ngành', 'thong-tin-hoat-dong-nganh', '0', '0', '0', '1', '1', '1', '1', '1465264570', '', 'Thông tin hoạt động ngành', 'Thông tin hoạt động ngành', 'Thông tin hoạt động ngành');
INSERT INTO `web_category` VALUES ('183', '8', 'group_news', '1', 'Phát hành - phổ biến phim', 'phat-hanh-pho-bien-phim', '0', '1', '0', '1', '1', '2', '1', '1465264570', '', 'Phát hành - phổ biến phim', 'Phát hành - phổ biến phim', 'Phát hành - phổ biến phim');
INSERT INTO `web_category` VALUES ('186', '8', 'group_news', '1', 'Hợp tác quốc tế', 'hop-tac-quoc-te', '0', '0', '0', '1', '1', '3', '1', '1465264747', '', 'Hợp tác quốc tế', 'Hợp tác quốc tế', 'Hợp tác quốc tế');
INSERT INTO `web_category` VALUES ('187', '9', 'group_document', '1', 'Dịch vụ công', 'dich-vu-cong', '0', '0', '0', '1', '0', '4', '1', '1465264832', '', 'Dịch vụ công', 'Dịch vụ công', 'Dịch vụ công');
INSERT INTO `web_category` VALUES ('188', '8', 'group_news', '1', 'Tổ chức', 'to-chuc', '0', '0', '0', '0', '1', '5', '1', '1465264897', '', 'Tổ chức', 'Tổ chức', 'Tổ chức');
INSERT INTO `web_category` VALUES ('189', '8', 'group_news', '1', 'Lịch xử phát triển ngành', 'lich-xu-phat-trien-nganh', '0', '0', '0', '0', '1', '6', '1', '1465264935', '', 'Lịch xử phát triển ngành', 'Lịch xử phát triển ngành', 'Lịch xử phát triển ngành');
INSERT INTO `web_category` VALUES ('190', '9', 'group_document', '1', 'Chính sách - Văn bản', 'chinh-sach-van-ban', '0', '0', '0', '0', '1', '7', '1', '1465265044', '', 'Chính sách - Văn bản', 'Chính sách - Văn bản', 'Chính sách - Văn bản');
INSERT INTO `web_category` VALUES ('191', '9', 'group_document', '1', 'Luật điện ảnh', 'luat-dien-anh', '190', '0', '0', '0', '1', '1', '1', '1465265143', '', 'Luật điện ảnh', 'Luật điện ảnh', 'Luật điện ảnh');
INSERT INTO `web_category` VALUES ('192', '9', 'group_document', '1', 'Nghị định', 'nghi-dinh', '190', '0', '0', '0', '1', '2', '1', '1465265176', '', 'Nghị định', 'Nghị định', 'Nghị định');
INSERT INTO `web_category` VALUES ('193', '9', 'group_document', '1', 'Chiến lược phát triển điện ảnh', 'chien-luoc-phat-trien-dien-anh', '190', '0', '0', '0', '1', '3', '1', '1465265212', '', 'Chiến lược phát triển điện ảnh', 'Chiến lược phát triển điện ảnh', 'Chiến lược phát triển điện ảnh');
INSERT INTO `web_category` VALUES ('194', '9', 'group_document', '1', 'Quy hoạch', 'quy-hoach', '190', '0', '0', '0', '1', '4', '1', '1465265247', '', 'Quy hoạch', 'Quy hoạch', 'Quy hoạch');
INSERT INTO `web_category` VALUES ('195', '9', 'group_document', '1', 'Thông tư', 'thong-tu', '190', '0', '0', '0', '1', '5', '1', '1465265277', '', 'Thông tư', 'Thông tư', 'Thông tư');
INSERT INTO `web_category` VALUES ('196', '11', 'group_images', '1', 'Thư viện ảnh', 'thu-vien-anh', '0', '0', '0', '-1', '-1', '8', '1', '1465265844', '', 'Thư viện ảnh', 'Thư viện ảnh', 'Thư viện ảnh');
