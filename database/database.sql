/*
Navicat MySQL Data Transfer

Source Server         : LOCALHOST
Source Server Version : 50625
Source Host           : localhost:3306
Source Database       : laostyle

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2017-01-19 22:50:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for group_user
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `group_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id nhom nguoi dung',
  `group_user_name` varchar(50) NOT NULL COMMENT 'Ten nhom nguoi dung',
  `group_user_status` int(1) NOT NULL DEFAULT '1' COMMENT '1 : hiá»‡n , 0 : áº©n',
  `group_user_type` int(1) NOT NULL DEFAULT '1' COMMENT '1:admin;2:shop',
  PRIMARY KEY (`group_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user
-- ----------------------------
INSERT INTO `group_user` VALUES ('1', 'Root', '1', '1');
INSERT INTO `group_user` VALUES ('2', 'Quyền xem lượt Share', '1', '1');

-- ----------------------------
-- Table structure for group_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `group_user_permission`;
CREATE TABLE `group_user_permission` (
  `group_user_id` int(11) NOT NULL COMMENT 'id nhÃ³m',
  `permission_id` int(11) NOT NULL COMMENT 'id quyÃ¨n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user_permission
-- ----------------------------
INSERT INTO `group_user_permission` VALUES ('1', '1');
INSERT INTO `group_user_permission` VALUES ('2', '43');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_code` varchar(50) NOT NULL COMMENT 'MÃ£ quyá»n',
  `permission_name` varchar(50) NOT NULL COMMENT 'TÃªn quyá»n',
  `permission_status` int(1) NOT NULL DEFAULT '1' COMMENT '1:hiá»‡n , 0:áº©n',
  `permission_group_name` varchar(255) DEFAULT NULL COMMENT 'group ten controller',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'root', 'Root', '1', 'Root');
INSERT INTO `permission` VALUES ('2', 'user_view', 'Xem danh sách user Admin', '1', 'Tài khoản Admin');
INSERT INTO `permission` VALUES ('3', 'user_create', 'Tạo user Admin', '1', 'Tài khoản Admin');
INSERT INTO `permission` VALUES ('4', 'user_edit', 'Sửa user Admin', '1', 'Tài khoản Admin');
INSERT INTO `permission` VALUES ('5', 'user_change_pass', 'Thay đổi user Admin', '1', 'Tài khoản Admin');
INSERT INTO `permission` VALUES ('6', 'user_remove', 'Xóa user Admin', '1', 'Tài khoản Admin');
INSERT INTO `permission` VALUES ('7', 'group_user_view', 'Xem nhóm quyền', '1', 'Nhóm quyền');
INSERT INTO `permission` VALUES ('8', 'group_user_create', 'Tạo nhóm quyền', '1', 'Nhóm quyền');
INSERT INTO `permission` VALUES ('9', 'group_user_edit', 'Sửa nhóm quyền', '1', 'Nhóm quyền');
INSERT INTO `permission` VALUES ('10', 'permission_full', 'Full tạo quyền', '1', 'Tạo quyền');
INSERT INTO `permission` VALUES ('11', 'permission_create', 'Tạo tạo quyền', '1', 'Tạo quyền');
INSERT INTO `permission` VALUES ('12', 'permission_edit', 'Sửa tạo quyền', '1', 'Tạo quyền');
INSERT INTO `permission` VALUES ('13', 'banner_full', 'Full quảng cáo', '1', 'Quyền quảng cáo');
INSERT INTO `permission` VALUES ('14', 'banner_view', 'Xem quảng cáo', '1', 'Quyền quảng cáo');
INSERT INTO `permission` VALUES ('15', 'banner_delete', 'Xóa quảng cáo', '1', 'Quyền quảng cáo');
INSERT INTO `permission` VALUES ('16', 'banner_create', 'Tạo quảng cáo', '1', 'Quyền quảng cáo');
INSERT INTO `permission` VALUES ('17', 'banner_edit', 'Sửa quảng cáo', '1', 'Quyền quảng cáo');
INSERT INTO `permission` VALUES ('18', 'category_full', 'Full danh mục', '1', 'Quyền danh mục');
INSERT INTO `permission` VALUES ('19', 'category_view', 'Xem danh mục', '1', 'Quyền danh mục');
INSERT INTO `permission` VALUES ('20', 'category_delete', 'Xóa danh mục', '1', 'Quyền danh mục');
INSERT INTO `permission` VALUES ('21', 'category_create', 'Tạo danh mục', '1', 'Quyền danh mục');
INSERT INTO `permission` VALUES ('22', 'category_edit', 'Sửa danh mục', '1', 'Quyền danh mục');
INSERT INTO `permission` VALUES ('23', 'items_full', 'Full tin rao', '1', 'Quyền tin rao');
INSERT INTO `permission` VALUES ('24', 'items_view', 'Xem tin rao', '1', 'Quyền tin rao');
INSERT INTO `permission` VALUES ('25', 'items_delete', 'Xóa tin rao', '1', 'Quyền tin rao');
INSERT INTO `permission` VALUES ('26', 'items_create', 'Tạo tin rao', '1', 'Quyền tin rao');
INSERT INTO `permission` VALUES ('27', 'items_edit', 'Sửa tin rao', '1', 'Quyền tin rao');
INSERT INTO `permission` VALUES ('28', 'news_full', 'Full tin tức', '1', 'Quyền tin tức');
INSERT INTO `permission` VALUES ('29', 'news_view', 'Xem tin tức', '1', 'Quyền tin tức');
INSERT INTO `permission` VALUES ('30', 'news_delete', 'Xóa tin tức', '1', 'Quyền tin tức');
INSERT INTO `permission` VALUES ('31', 'news_create', 'Tạo tin tức', '1', 'Quyền tin tức');
INSERT INTO `permission` VALUES ('32', 'news_edit', 'Sửa tin tức', '1', 'Quyền tin tức');
INSERT INTO `permission` VALUES ('33', 'province_full', 'Full tỉnh thành', '1', 'Quyền tỉnh thành');
INSERT INTO `permission` VALUES ('34', 'province_view', 'Xem tỉnh thành', '1', 'Quyền tỉnh thành');
INSERT INTO `permission` VALUES ('35', 'province_delete', 'Xóa tỉnh thành', '1', 'Quyền tỉnh thành');
INSERT INTO `permission` VALUES ('36', 'province_create', 'Tạo tỉnh thành', '1', 'Quyền tỉnh thành');
INSERT INTO `permission` VALUES ('37', 'province_edit', 'Sửa tỉnh thành', '1', 'Quyền tỉnh thành');
INSERT INTO `permission` VALUES ('38', 'user_customer_full', 'Full khách hàng', '1', 'Quyền khách hàng');
INSERT INTO `permission` VALUES ('39', 'user_customer_view', 'Xem khách hàng', '1', 'Quyền khách hàng');
INSERT INTO `permission` VALUES ('40', 'user_customer_delete', 'Xóa khách hàng', '1', 'Quyền khách hàng');
INSERT INTO `permission` VALUES ('41', 'user_customer_create', 'Tạo khách hàng', '1', 'Quyền khách hàng');
INSERT INTO `permission` VALUES ('42', 'user_customer_edit', 'Sửa khách hàng', '1', 'Quyền khách hàng');
INSERT INTO `permission` VALUES ('43', 'toolsCommon_full', 'Full quyền', '1', 'Full quyền Share link');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_full_name` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_status` int(2) NOT NULL DEFAULT '1' COMMENT '-1: xÃ³a , 1: active',
  `user_group` varchar(255) DEFAULT NULL,
  `user_last_login` int(11) DEFAULT NULL,
  `user_last_ip` varchar(15) DEFAULT NULL,
  `user_create_id` int(11) DEFAULT NULL,
  `user_create_name` varchar(255) DEFAULT NULL,
  `user_edit_id` int(11) DEFAULT NULL,
  `user_edit_name` varchar(255) DEFAULT NULL,
  `user_created` int(11) DEFAULT NULL,
  `user_updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2', 'admin', 'eef828faf0754495136af05c051766cb', 'Root', '', null, '1', '1', '1483432816', '::1', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('19', 'tech_code', '7eb3b9aba1960c22aa9bc8d1f27ebfb9', 'Tech code 3555', '', '', '1', '2', '1481772767', '::1', null, null, '2', 'admin', null, '1481772561');
INSERT INTO `user` VALUES ('20', 'svquynhtm', 'a1f54bbcea29cf49935e0a5ead5a3dfa', 'Trương Mạnh Quỳnh', 'manhquynh1984@gmail.com', '0938413368', '1', '2', '1482826054', '::1', '2', 'admin', '2', 'admin', '1482823830', '1482824272');

-- ----------------------------
-- Table structure for w_banner
-- ----------------------------
DROP TABLE IF EXISTS `w_banner`;
CREATE TABLE `w_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(12) DEFAULT NULL,
  `banner_name` varchar(255) DEFAULT NULL,
  `banner_intro` text,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_link` varchar(255) DEFAULT NULL,
  `banner_order` tinyint(5) DEFAULT '1' COMMENT 'thứ tự hiển thị',
  `banner_total_click` int(11) DEFAULT '0' COMMENT 'lượt click banner theo id',
  `banner_time_click` int(11) DEFAULT '0' COMMENT 'Time click gần nhất',
  `banner_is_target` tinyint(5) DEFAULT '0' COMMENT '0: Không mở tab mới, 1: mở tab mới',
  `banner_is_rel` tinyint(5) DEFAULT '0' COMMENT '0:nofollow, 1:follow',
  `banner_type` tinyint(5) DEFAULT '0' COMMENT '1:banner home to, 2: banner home nhỏ,3: banner trái, 4 banner phải',
  `banner_page` tinyint(5) DEFAULT '0' COMMENT '1: trang chủ, 2: trang list,3: trang detail, 4: trang list danh mục',
  `banner_category_id` int(11) DEFAULT '0',
  `banner_status` tinyint(5) DEFAULT '0',
  `banner_is_run_time` tinyint(5) DEFAULT '0' COMMENT '0: không có time chay,1: có thời gian chạy quảng cáo',
  `banner_start_time` int(11) DEFAULT '0',
  `banner_end_time` int(11) DEFAULT '0',
  `banner_is_shop` tinyint(5) DEFAULT '0' COMMENT '0: Không phải banner shop,1: quảng cáo banner của shop',
  `banner_shop_id` int(11) DEFAULT '0',
  `banner_create_time` int(11) DEFAULT '0',
  `banner_update_time` int(11) DEFAULT '0',
  `banner_name_en` varchar(255) DEFAULT NULL,
  `banner_intro_en` text,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_banner
-- ----------------------------
INSERT INTO `w_banner` VALUES ('6', '1', 'Một góc phố Viêng Chăn', '<p>Từ trên đỉnh tòa tháp cao 7 tầng, chúng tôi phóng tầm mắt ngắm nhìn một góc thủ đô Viêng Chăn thanh bình. Phía xa xa, cổng chiến thắng Patuxay hiên ngang\r\n', '01-09-15-16-08-2016-b2.jpg', 'http://baritevietlao.com.vn', '1', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1471284555', '1471382658', 'A street corner Vientiane', 'From atop the tower 7 floor, our panoramic view angle peaceful Vientiane. In the distance, winning port stalked Patuxay\r\n');
INSERT INTO `w_banner` VALUES ('7', '1', 'Một góc phố Viêng Chăn', 'Từ trên đỉnh tòa tháp cao 7 tầng, chúng tôi phóng tầm mắt ngắm nhìn một góc thủ đô Viêng Chăn thanh bình. Phía xa xa, cổng chiến thắng Patuxay hiên ngang', '01-12-26-16-08-2016-b3.jpg', 'http://baritevietlao.com.vn', '2', '0', '0', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1471284746', '1471382663', 'A street corner Vientiane', 'From atop the tower 7 floor, our panoramic view angle peaceful Vientiane. In the distance, winning port stalked Patuxay');
INSERT INTO `w_banner` VALUES ('8', '1', 'Banner tuyển dụng bên phải', '', '01-37-59-16-08-2016-tuyendung.jpg', 'http://baritevietlao.com.vn/tuyen-dung-28.html', '1', '0', '0', '1', '1', '3', '0', '0', '1', '0', '0', '0', '0', '0', '1471286279', '1471460705', 'Banner recruitment right', '');
INSERT INTO `w_banner` VALUES ('9', '1', 'Lễ ký kết hợp đồng giữa công ty và chính phủ nước CHDCND Lào', 'Hợp đồng cho ra đời một nhà máy chế biến bột Barite và khu mỏ khai thác quặng Barite đầy tiềm năng và giàu triển vọng để khẳng định thương hiệu bột Barite Lào trên thị trường thế giới.', '04-25-43-17-08-2016-1kyhd.png', 'http://baritevietlao.com.vn', '1', '0', '0', '1', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1471382743', '1471489718', 'Contract signing ceremony between the company and the government of Lao PDR', 'Contracts give birth to a powder processing plant and mine Barite Barite ore rich potential and prospects for rebranding Laos Barite powder on the world market.');
INSERT INTO `w_banner` VALUES ('10', '1', 'Quá trình tìm kiếm và thăm dò', 'Sẵn sàng vượt qua mọi khó khăn và vất vả để có cơ sở đem lại sự thành công của dự án.', '04-32-25-17-08-2016-2.jpg', 'http://baritevietlao.com.vn', '2', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1471383145', '1471489738', 'The process of search and exploration', 'We are ready to overcome all difficulties and hardship to satisfy grassroots success of the project.');
INSERT INTO `w_banner` VALUES ('11', '1', 'Báo cáo dự án', 'Hãy tranh luận trên cơ sở trân trọng tính khoa học để cùng tìm được mục đích chung.', '04-38-37-17-08-2016-3.jpg', 'http://baritevietlao.com.vn', '3', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1471383517', '1471489758', 'Project Report', 'Let\'s debate on the basis of scientific honor to work together to find common purpose.');
INSERT INTO `w_banner` VALUES ('12', '1', 'Quá trình xây dựng nhà máy', 'Hiện đại nhưng xanh - sạch - đẹp để đảm bảo sự bền vững cho tương lai', '04-43-07-17-08-2016-4.jpg', 'http://baritevietlao.com.vn', '4', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1471383787', '1471489781', 'The process plant building', 'Modern - green - clean - beautiful to ensure sustainability for the future');
INSERT INTO `w_banner` VALUES ('13', '1', 'Gặp gỡ đối tác', 'Tôn trọng quyền lợi nhưng phải biết đặt niềm tin vào nhau để  thành công là của tất cả chúng ta.', '04-47-21-17-08-2016-5.jpg', 'http://baritevietlao.com.vn', '5', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1471384041', '1471489803', 'Meet partners', 'We respect the rights of the parties, but we always want to cooperate for the success');
INSERT INTO `w_banner` VALUES ('14', '1', 'Tham quan và hoạt động cộng đồng', 'Hãy luôn nhớ rằng trong cộng đồng bao giờ cũng có chính chúng ta', '04-50-24-17-08-2016-6.jpg', 'http://baritevietlao.com.vn', '6', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '1471384224', '1471489821', 'Visiting and community activities', 'Always remember that in the community there is always ourselves');
INSERT INTO `w_banner` VALUES ('15', '1', 'Liên hệ quảng cáo bên phải', '', '09-04-08-18-08-2016-lienhequangcao.png', 'http://baritevietlao.com.vn', '2', '0', '0', '0', '0', '3', '0', '0', '1', '0', '0', '0', '0', '0', '1471460652', '1471485852', 'Liên hệ quảng cáo bên phải', '');

-- ----------------------------
-- Table structure for w_category
-- ----------------------------
DROP TABLE IF EXISTS `w_category`;
CREATE TABLE `w_category` (
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
  `category_meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_meta_keywords` text COLLATE utf8_unicode_ci,
  `category_meta_description` text COLLATE utf8_unicode_ci,
  `category_num` int(11) DEFAULT NULL,
  `category_name_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_meta_title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_meta_keywords_en` text COLLATE utf8_unicode_ci,
  `category_meta_description_en` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`category_id`),
  KEY `status` (`category_status`) USING BTREE,
  KEY `id_parrent` (`category_parent_id`,`category_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of w_category
-- ----------------------------
INSERT INTO `w_category` VALUES ('1', '17', 'group_news', '1', 'Giới thiệu', 'gioi-thieu', '0', '0', null, '1', '0', '1', '1', '1470461855', 'Giới thiệu', 'Giới thiệu', 'Giới thiệu', null, 'General introduction', 'General introduction', 'General introduction', 'General introduction');
INSERT INTO `w_category` VALUES ('2', '17', 'group_news', '1', 'Cơ cấu sở hữu', 'co-cau-so-huu', '0', '0', null, '1', '0', '2', '1', '1470461960', 'Cơ cấu sở hữu', 'Cơ cấu sở hữu', 'Cơ cấu sở hữu', null, 'Ownership structure', 'Ownership structure', 'Ownership structure', 'Ownership structure');
INSERT INTO `w_category` VALUES ('3', '17', 'group_news', '1', 'Hình ảnh hoạt động', 'hinh-anh-hoat-dong', '0', '0', null, '1', '0', '3', '1', '1470462010', 'Hình ảnh hoạt động', 'Hình ảnh hoạt động', 'Hình ảnh hoạt động', null, 'Photos activity', 'Photos activity', 'Photos activity', 'Photos activity');
INSERT INTO `w_category` VALUES ('4', '22', 'group_product', '1', 'Sản phẩm', 'san-pham', '0', '0', null, '1', '0', '4', '1', '1470462062', 'Sản phẩm', 'Sản phẩm', 'Sản phẩm', null, 'Product', 'Product', 'Product', 'Product');
INSERT INTO `w_category` VALUES ('5', '19', 'group_images', '1', 'Thư viện ảnh', 'thu-vien-anh', '0', '0', null, '0', '0', '5', '1', '1470462105', 'Thư viện ảnh', 'Thư viện ảnh', 'Thư viện ảnh', null, 'Photo library', 'Photo library', 'Photo library', 'Photo library');
INSERT INTO `w_category` VALUES ('10', '18', 'group_document', '1', 'Một số văn bản liên quan tới dự án', 'mot-so-van-ban-lien-quan-toi-du-an', '0', '0', null, '0', '0', '6', '1', '1470762372', 'Một số văn bản liên quan tới dự án', 'Một số văn bản liên quan tới dự án', 'Một số văn bản liên quan tới dự án', null, 'Some document related to the project', 'Some document related to the project', 'Some document related to the project', 'Some document related to the project');
INSERT INTO `w_category` VALUES ('11', '17', 'group_news', '1', 'Nghiên cứu dự án', 'nghien-cuu-du-an', '3', '0', null, '1', '0', '1', '1', '1471151569', 'Nghiên cứu dự án', 'Nghiên cứu dự án', 'Nghiên cứu dự án', null, 'Research project', 'Research project', 'Research project', 'Research project');
INSERT INTO `w_category` VALUES ('12', '17', 'group_news', '1', 'Tìm kiếm thăm dò', 'tim-kiem-tham-do', '3', '0', null, '1', '0', '2', '1', '1471151654', 'Tìm kiếm thăm dò', 'Tìm kiếm thăm dò', 'Tìm kiếm thăm dò', null, 'Exploration', 'Exploration', 'Exploration', 'Exploration');
INSERT INTO `w_category` VALUES ('13', '17', 'group_news', '1', 'Báo cáo dự án và kiểm tra thực địa', 'bao-cao-du-an-va-kiem-tra-thuc-dia', '3', '0', null, '1', '0', '3', '1', '1471151820', 'Báo cáo dự án và kiểm tra thực địa', 'Báo cáo dự án và kiểm tra thực địa', 'Báo cáo dự án và kiểm tra thực địa', null, 'Project reports and field checks', 'Project reports and field checks', 'Project reports and field checks', 'Project reports and field checks');
INSERT INTO `w_category` VALUES ('14', '17', 'group_news', '1', 'Xây dựng mỏ và nhà máy', 'xay-dung-mo-va-nha-may', '3', '0', null, '1', '0', '4', '1', '1471152076', 'Xây dựng mỏ và nhà máy', 'Xây dựng mỏ và nhà máy', 'Xây dựng mỏ và nhà máy', null, 'Construction and plant mines', 'Construction and plant mines', 'Construction and plant mines', 'Construction and plant mines');
INSERT INTO `w_category` VALUES ('15', '17', 'group_news', '1', 'Ký kết hợp đồng và gặp gỡ đối tác', 'ky-ket-hop-dong-va-gap-go-doi-tac', '3', '0', null, '1', '0', '5', '1', '1471152213', 'Ký kết hợp đồng và gặp gỡ đối tác', 'Ký kết hợp đồng và gặp gỡ đối tác', 'Ký kết hợp đồng và gặp gỡ đối tác', null, 'Signing contracts and meet partners', 'Signing contracts and meet partners', 'Signing contracts and meet partners', 'Signing contracts and meet partners');
INSERT INTO `w_category` VALUES ('16', '17', 'group_news', '1', 'Các hoạt động khác', 'cac-hoat-dong-khac', '3', '0', null, '1', '0', '7', '1', '1471152303', 'Các hoạt động khác', 'Các hoạt động khác', 'Các hoạt động khác', null, 'Other activities', 'Other activities', 'Other activities', 'Other activities');
INSERT INTO `w_category` VALUES ('17', '22', 'group_product', '1', 'Giới thiệu chung', 'gioi-thieu-chung', '4', '0', null, '1', '0', '1', '1', '1471152514', 'Giới thiệu chung', 'Giới thiệu chung', 'Giới thiệu chung', null, 'General introduction', 'General introduction', 'General introduction', 'General introduction');
INSERT INTO `w_category` VALUES ('18', '22', 'group_product', '1', 'Các sản phẩm chính', 'cac-san-pham-chinh', '4', '0', null, '1', '0', '2', '1', '1471152551', 'Các sản phẩm chính', 'Các sản phẩm chính', 'Các sản phẩm chính', null, 'Main products', 'Main products', 'Main products', 'Main products');
INSERT INTO `w_category` VALUES ('19', '20', 'group_video', '1', 'Video clips', 'video-clips', '0', '0', null, '-1', '0', '5', '1', '1471152670', 'Video clips', 'Video clips', 'Video clips', null, 'Video clips', 'Video clips', 'Video clips', 'Video clips');
INSERT INTO `w_category` VALUES ('21', '17', 'group_news', '1', 'Nét đẹp trong văn hóa kinh doanh', 'net-dep-trong-van-hoa-kinh-doanh', '0', '0', null, '0', '0', '7', '1', '1471152835', 'Nét đẹp trong văn hóa kinh doanh', 'Nét đẹp trong văn hóa kinh doanh', 'Nét đẹp trong văn hóa kinh doanh', null, 'The beauty of business culture', 'The beauty of business culture', 'The beauty of business culture', 'The beauty of business culture');
INSERT INTO `w_category` VALUES ('22', '23', 'groupt_recruitment', '1', 'Tuyển dụng', 'tuyen-dung', '0', '0', null, '0', '0', '8', '1', '1471153005', 'Tuyển dụng', 'Tuyển dụng', 'Tuyển dụng', null, 'Recruitment', 'Recruitment', 'Recruitment', 'Recruitment');
INSERT INTO `w_category` VALUES ('23', '17', 'group_news', '1', 'Quan hệ với chính quyền và nhân dân địa phương', 'quan-he-voi-chinh-quyen-va-nhan-dan-dia-phuong', '0', '0', null, '0', '0', '9', '1', '1471153115', 'Quan hệ với chính quyền và nhân dân địa phương', 'Quan hệ với chính quyền và nhân dân địa phương', 'Quan hệ với chính quyền và nhân dân địa phương', null, 'Relations with the authorities and the local population', 'Relations with the authorities and the local population', 'Relations with the authorities and the local population', 'Relations with the authorities and the local population');
INSERT INTO `w_category` VALUES ('24', '17', 'group_news', '1', 'Bản tin chào hàng', 'ban-tin-chao-hang', '0', '0', null, '0', '0', '10', '1', '1471153181', 'Bản tin chào hàng', 'Bản tin chào hàng', 'Bản tin chào hàng', null, 'Newsletter Offer', 'Newsletter Offer', 'Newsletter Offer', 'Newsletter Offer');
INSERT INTO `w_category` VALUES ('25', '17', 'group_news', '1', 'Đơn vị trực thuộc và lĩnh vực hoạt động', 'don-vi-truc-thuoc-va-linh-vuc-hoat-dong', '0', '0', null, '0', '0', '11', '1', '1471153265', 'Đơn vị trực thuộc và lĩnh vực hoạt động', 'Đơn vị trực thuộc và lĩnh vực hoạt động', 'Đơn vị trực thuộc và lĩnh vực hoạt động', null, 'Subordinate units and field operations', 'Subordinate units and field operations', 'Subordinate units and field operations', 'Subordinate units and field operations');
INSERT INTO `w_category` VALUES ('26', '17', 'group_news', '1', 'Hình ảnh hoạt động tiêu biểu', 'hinh-anh-hoat-dong-tieu-bieu', '0', '0', null, '0', '0', '12', '1', '1471153340', 'Hình ảnh hoạt động tiêu biểu', 'Hình ảnh hoạt động tiêu biểu', 'Hình ảnh hoạt động tiêu biểu', null, 'Photos typical activities', 'Photos typical activities', 'Photos typical activities', 'Photos typical activities');
INSERT INTO `w_category` VALUES ('28', '17', 'group_news', '1', 'Tuyển dụng', 'tuyen-dung', '0', '0', null, '0', '0', '13', '1', '1471378841', 'Tuyển dụng', 'Tuyển dụng', 'Tuyển dụng', null, 'Recruitment', 'Recruitment', 'Recruitment', 'Recruitment');
INSERT INTO `w_category` VALUES ('29', '17', 'group_news', '1', 'Bản tin chào hàng', 'ban-tin-chao-hang', '0', '0', null, '0', '0', '14', '1', '1471388334', '', 'Bản tin chào hàng', 'Bản tin chào hàng', null, 'Newsletter Offer', 'Newsletter Offer', 'Newsletter Offer', 'Newsletter Offer');
INSERT INTO `w_category` VALUES ('30', '17', 'group_news', '1', 'Công ty chào bán', 'cong-ty-chao-ban', '29', '0', null, '0', '0', '1', '1', '1471388416', 'Công ty chào bán', 'Công ty chào bán', 'Công ty chào bán', null, 'The company offer', 'The company offer', 'The company offer', 'The company offer');
INSERT INTO `w_category` VALUES ('31', '17', 'group_news', '1', 'Công ty chào mua', 'cong-ty-chao-mua', '29', '0', null, '0', '0', '2', '1', '1471388488', 'Công ty chào mua', 'Công ty chào mua', 'Công ty chào mua', null, 'The company buy', 'The company buy', 'The company buy', 'The company buy');

-- ----------------------------
-- Table structure for w_config_info
-- ----------------------------
DROP TABLE IF EXISTS `w_config_info`;
CREATE TABLE `w_config_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL COMMENT 'keyword',
  `intro` longtext,
  `content` longtext,
  `img` varchar(255) DEFAULT NULL,
  `img_other` longtext,
  `created` varchar(15) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT 'Item enabled status (1 = enabled, 0 = disabled)',
  `meta_title` text COMMENT 'Meta title',
  `meta_keywords` text COMMENT 'Meta keywords',
  `meta_description` text COMMENT 'Meta description',
  `title_en` varchar(255) DEFAULT NULL,
  `intro_en` text,
  `content_en` text,
  `meta_title_en` varchar(255) DEFAULT NULL,
  `meta_keywords_en` text,
  `meta_description_en` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Stores news content.';

-- ----------------------------
-- Records of w_config_info
-- ----------------------------
INSERT INTO `w_config_info` VALUES ('9', '1', 'Nội dung meta SEO trang chủ', 'SITE_SEO_HOME', 'Không cần để nội dung...', '<p>Kh&ocirc;ng cần để nội dung...</p>\r\n', '', null, '1437450080', '1', 'Công ty trách nhiệm hữu hạn Đầu tư Quang Trung', 'Công ty trách nhiệm hữu hạn Đầu tư Quang Trung', 'Công ty trách nhiệm hữu hạn Đầu tư Quang Trung', ' SEO meta content Homepage', '', '', 'Quang Trung investment company limited', 'Quang Trung investment company limited', 'Quang Trung investment company limited');

-- ----------------------------
-- Table structure for w_contact
-- ----------------------------
DROP TABLE IF EXISTS `w_contact`;
CREATE TABLE `w_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_title` varchar(255) DEFAULT NULL COMMENT 'tên liên hệ',
  `contact_content` mediumtext,
  `contact_content_reply` mediumtext,
  `contact_user_id_send` int(11) DEFAULT '0' COMMENT '0: khách vãng lai gửi, > 0 shop gửi liên hệ',
  `contact_user_name_send` varchar(255) DEFAULT NULL,
  `contact_phone_send` varchar(255) DEFAULT NULL,
  `contact_email_send` varchar(255) DEFAULT NULL,
  `contact_type` tinyint(5) DEFAULT '1' COMMENT '1:loại gửi , 2: loại nhận',
  `contact_reason` tinyint(5) DEFAULT '1' COMMENT 'Lý do gửi liên hệ: 1: liên hệ ở ngoài site, 2: shop liên hệ với quản trị',
  `contact_status` tinyint(5) DEFAULT '1' COMMENT '1: liên hệ mới, 2: đã xác nhận,3: đã xử lý',
  `contact_time_creater` int(11) DEFAULT NULL,
  `contact_user_id_update` int(11) DEFAULT NULL COMMENT 'Người xử lý liên hệ',
  `contact_user_name_update` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `contact_time_update` int(11) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_contact
-- ----------------------------

-- ----------------------------
-- Table structure for w_document
-- ----------------------------
DROP TABLE IF EXISTS `w_document`;
CREATE TABLE `w_document` (
  `document_id` int(12) NOT NULL AUTO_INCREMENT,
  `document_type` int(12) DEFAULT '1' COMMENT '1: file dowload',
  `document_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'file cần upload và dowload',
  `document_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_name_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_date_public` int(12) DEFAULT NULL,
  `document_desc_sort` text COLLATE utf8_unicode_ci,
  `document_content` longtext COLLATE utf8_unicode_ci,
  `document_order` int(12) DEFAULT '0',
  `document_category` int(10) DEFAULT NULL,
  `document_text_file_other` longtext COLLATE utf8_unicode_ci,
  `document_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_image_other` longtext COLLATE utf8_unicode_ci,
  `document_status` tinyint(1) DEFAULT '0',
  `document_created` int(12) DEFAULT NULL,
  `uid` int(12) DEFAULT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_meta_keywords` text COLLATE utf8_unicode_ci,
  `document_meta_description` text COLLATE utf8_unicode_ci,
  `document_name_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_desc_sort_en` text COLLATE utf8_unicode_ci,
  `document_content_en` text COLLATE utf8_unicode_ci,
  `document_meta_title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `document_meta_keywords_en` text COLLATE utf8_unicode_ci,
  `document_meta_description_en` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`document_id`),
  KEY `status` (`document_status`) USING BTREE,
  KEY `id_parrent` (`document_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of w_document
-- ----------------------------
INSERT INTO `w_document` VALUES ('3', '1', '', 'Giấy chứng nhận đầu tư do chính phủ Lào cấp', 'giay-chung-nhan-dau-tu-do-chinh-phu-lao-cap', null, null, '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/3/700x700/10-23-41-17-08-2016-1giay-chung-nhan-dau-tu-do-cp-lao-cap.jpg\" /></p>\r\n', '1', '10', null, '10-23-41-17-08-2016-1giay-chung-nhan-dau-tu-do-cp-lao-cap.jpg', 'a:1:{i:0;s:61:\"10-23-41-17-08-2016-1giay-chung-nhan-dau-tu-do-cp-lao-cap.jpg\";}', '1', '1471403269', '1', null, '', '', '', 'Giấy chứng nhận đầu tư do chính phủ Lào cấp', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/3/700x700/10-23-41-17-08-2016-1giay-chung-nhan-dau-tu-do-cp-lao-cap.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_document` VALUES ('4', '1', null, 'Giấy phép của bộ tài nguyên môi trường - CHDCND Lào', 'giay-phep-cua-bo-tai-nguyen-moi-truong-chdcnd-lao', null, null, '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/4/700x700/10-25-22-17-08-2016-2giay-phep-cua-bo-tai-nguyen-moi-truong-chdcnd-lao.jpg\" /></p>\r\n', '2', '10', null, '10-25-22-17-08-2016-2giay-phep-cua-bo-tai-nguyen-moi-truong-chdcnd-lao.jpg', 'a:1:{i:0;s:74:\"10-25-22-17-08-2016-2giay-phep-cua-bo-tai-nguyen-moi-truong-chdcnd-lao.jpg\";}', '1', '1471404322', null, null, '', '', '', 'Giấy phép của bộ tài nguyên môi trường - CHDCND Lào', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/4/700x700/10-25-22-17-08-2016-2giay-phep-cua-bo-tai-nguyen-moi-truong-chdcnd-lao.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_document` VALUES ('5', '1', null, 'Giấy phép Xây Dựng do bộ xây dựng cấp cho công ty đầu tư Quang Trung', 'giay-phep-xay-dung-do-bo-xay-dung-cap-cho-cong-ty-dau-tu-quang-trung', null, null, '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/5/700x700/10-27-04-17-08-2016-3giay-phep-xay-dung-do-bo-xay-dung-cap-cho-cty-tnhh-dau-tua-quang-trung.jpg\" /></p>\r\n', '3', '10', null, '10-27-04-17-08-2016-3giay-phep-xay-dung-do-bo-xay-dung-cap-cho-cty-tnhh-dau-tua-quang-trung.jpg', 'a:1:{i:0;s:95:\"10-27-04-17-08-2016-3giay-phep-xay-dung-do-bo-xay-dung-cap-cho-cty-tnhh-dau-tua-quang-trung.jpg\";}', '1', '1471404424', null, null, '', '', '', 'Giấy phép Xây Dựng do bộ xây dựng cấp cho công ty đầu tư Quang Trung', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/5/700x700/10-27-04-17-08-2016-3giay-phep-xay-dung-do-bo-xay-dung-cap-cho-cty-tnhh-dau-tua-quang-trung.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_document` VALUES ('6', '1', null, 'Hợp đồng khai thác - ché biến Barite giữa công ty và chính phủ nước CHDCND Lào', 'hop-dong-khai-thac-che-bien-barite-giua-cong-ty-va-chinh-phu-nuoc-chdcnd-lao', null, null, '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/6/700x700/10-28-45-17-08-2016-4hop-dong-khai-thac-che-bien-barite-giua-cty-va-cp-nuoc-chdcnd-lao.jpg\" /></p>\r\n', '4', '10', null, '10-28-45-17-08-2016-4hop-dong-khai-thac-che-bien-barite-giua-cty-va-cp-nuoc-chdcnd-lao.jpg', 'a:1:{i:0;s:90:\"10-28-45-17-08-2016-4hop-dong-khai-thac-che-bien-barite-giua-cty-va-cp-nuoc-chdcnd-lao.jpg\";}', '1', '1471404525', null, null, '', '', '', 'Hợp đồng khai thác - ché biến Barite giữa công ty và chính phủ nước CHDCND Lào', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/document/6/700x700/10-28-45-17-08-2016-4hop-dong-khai-thac-che-bien-barite-giua-cty-va-cp-nuoc-chdcnd-lao.jpg\" /></p>\r\n', '', '', '');

-- ----------------------------
-- Table structure for w_images
-- ----------------------------
DROP TABLE IF EXISTS `w_images`;
CREATE TABLE `w_images` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `image_title_alias` varchar(255) DEFAULT NULL,
  `image_desc_sort` text,
  `image_content` longtext,
  `image_image` varchar(255) DEFAULT NULL COMMENT 'ảnh đại diện của bài viết',
  `image_image_other` longtext COMMENT 'Lưu ảnh của bài viết',
  `image_category` int(10) DEFAULT NULL,
  `image_status` tinyint(5) DEFAULT NULL,
  `image_hot` tinyint(5) DEFAULT NULL,
  `image_create` int(11) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `image_meta_title` text,
  `image_meta_keyword` text,
  `image_meta_description` text,
  `image_title_en` varchar(255) DEFAULT NULL,
  `image_desc_sort_en` text,
  `image_content_en` text,
  `image_meta_title_en` varchar(255) DEFAULT NULL,
  `image_meta_keyword_en` text,
  `image_meta_description_en` text,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_images
-- ----------------------------
INSERT INTO `w_images` VALUES ('11', '1', 'Vùng mỏ hôm nay', 'vung-mo-hom-nay', '', '', '01-10-23-17-08-2016-3.jpg', 'a:4:{i:0;s:25:\"01-10-23-17-08-2016-3.jpg\";i:1;s:25:\"01-10-24-17-08-2016-1.jpg\";i:2;s:25:\"01-10-27-17-08-2016-2.jpg\";i:3;s:25:\"01-10-28-17-08-2016-4.jpg\";}', '5', '1', '1', '1471370871', '', '', '', '', 'Vùng mỏ hôm nay', '', '', '', '', '');
INSERT INTO `w_images` VALUES ('12', '1', ' Trên khai trường sản xuất than', 'tren-khai-truong-san-xuat-than', '', '', '01-25-21-17-08-2016-4.jpg', 'a:2:{i:0;s:25:\"01-25-05-17-08-2016-3.jpg\";i:1;s:25:\"01-25-21-17-08-2016-4.jpg\";}', '5', '1', '1', '1471371905', '', '', '', '', ' Trên khai trường sản xuất than', '', '', '', '', '');

-- ----------------------------
-- Table structure for w_language
-- ----------------------------
DROP TABLE IF EXISTS `w_language`;
CREATE TABLE `w_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_keyword` varchar(255) DEFAULT NULL,
  `language_vi` text,
  `language_en` text,
  `language_status` tinyint(5) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_language
-- ----------------------------
INSERT INTO `w_language` VALUES ('51', 'address_footer', '<p><strong>C&ocirc;ng ty tr&aacute;ch nhiệm hữu hạn Đầu tư Quang Trung</strong><strong> </strong><br />\r\n<strong>Địa chỉ:</strong> Địa chỉ: Số 11/670/32 đường H&agrave; Huy Tập - TT.Y&ecirc;n Vi&ecirc;n -&nbsp;Gia L&acirc;m - H&agrave; Nội<br />\r\n<strong>Email:</strong> quangtrung.investment@gmail.com<br />\r\nĐiện thoại: <span style=\"color:#FF0000\">+84-988.554.301</span></p>\r\n', '<p><strong>Quang Trung investment company limited</strong><strong> </strong><br />\r\n<strong>Address</strong>: Ha Huy Tap Street 11/670/32 - Yen Vien town -&nbsp;Gia Lam - H&agrave; Nội<br />\r\n<strong>Email:</strong> quangtrung.investment@gmail.com<br />\r\nPhone: <span style=\"color:#FF0000\">+84-988.554.301</span></p>\r\n', '1');
INSERT INTO `w_language` VALUES ('52', 'login', 'Đăng nhập', '<p>Login</p>\r\n', '1');
INSERT INTO `w_language` VALUES ('53', 'contact', 'Liên hệ', 'Contact', '1');
INSERT INTO `w_language` VALUES ('54', 'developed', 'Website phát triển bởi Sys', 'Developed by Sys\r\n', '1');
INSERT INTO `w_language` VALUES ('55', 'home', '<p>Trang chủ</p>\r\n', '<p>Home</p>\r\n', '1');
INSERT INTO `w_language` VALUES ('56', 'search', '<p>T&igrave;m kiếm</p>\r\n', '<p>Search</p>\r\n', '1');
INSERT INTO `w_language` VALUES ('59', 'photo_library', '<p>Thư viện ảnh</p>\r\n', 'Photo library', '1');
INSERT INTO `w_language` VALUES ('60', 'view_more', '<p>Xem tiếp</p>\r\n', '<p>View more</p>\r\n', '1');
INSERT INTO `w_language` VALUES ('61', 'post_other', 'Bài viết khác', 'Post other', '1');
INSERT INTO `w_language` VALUES ('62', 'print', 'In bài viết', 'Print', '1');
INSERT INTO `w_language` VALUES ('63', 'print_page', 'In trang', 'Print page', '1');
INSERT INTO `w_language` VALUES ('64', 'post_other_images', 'Thư viện ảnh khác', 'Post other images', '1');
INSERT INTO `w_language` VALUES ('65', 'detail_not_load_image', 'Không thể tải được ảnh này', 'Detail not load image', '1');
INSERT INTO `w_language` VALUES ('66', 'click_zoom', 'Nhấn vào ảnh để phóng to', 'Click image to zoom', '1');
INSERT INTO `w_language` VALUES ('67', 'result_search', 'Kết quả tìm kiếm', 'Result search', '1');
INSERT INTO `w_language` VALUES ('72', 'address_header', '<p>Địa chỉ: Số 11/670/32 đường H&agrave; Huy Tập - TT.Y&ecirc;n Vi&ecirc;n - Gia L&acirc;m - H&agrave; Nội</p>\r\n', '<p>Address: no 11/670/32 street Ha Huy Tap - town.Yen Vien - Gia Lam - H&agrave; Nội</p>\r\n', '1');
INSERT INTO `w_language` VALUES ('73', 'email_header', 'Email: quangtrung.investment@gmail.com', 'Email: quangtrung.investment@gmail.com', '1');
INSERT INTO `w_language` VALUES ('74', 'hotline_header', 'Holine: +84-988.554.301', 'Holine: +84-988.554.301', '1');
INSERT INTO `w_language` VALUES ('76', 'name_company', '<h1>Công ty trách nhiệm hữu hạn Đầu tư Quang Trung</h1><br>\r\n<span>Quang Trung investment company limited</span>', '<h1>Công ty trách nhiệm hữu hạn Đầu tư Quang Trung</h1><br>\r\n<span>Quang Trung investment company limited</span>', '1');
INSERT INTO `w_language` VALUES ('77', 'thanks_visit_site', 'Xin trân trọng cảm ơn và hẹn gặp lại!', 'Sincere thanks and see you again!\r\n', '1');
INSERT INTO `w_language` VALUES ('78', 'news_hot', 'Tin tức nổi bật', 'News highlights', '1');
INSERT INTO `w_language` VALUES ('79', 'video_clips', 'Video clips', 'Video clips', '1');
INSERT INTO `w_language` VALUES ('80', 'day', 'Ngày', 'Day', '1');
INSERT INTO `w_language` VALUES ('81', 'cultural_beauty_business', '<p>N&eacute;t đẹp văn h&oacute;a kinh doanh</p>\r\n', 'Beauty culture in business', '1');
INSERT INTO `w_language` VALUES ('82', 'contact_text', '<p>Ch&uacute;ng t&ocirc;i lu&ocirc;n sẵn s&agrave;ng để trao đổi, lắng nghe những y&ecirc;u cầu v&agrave; đ&oacute;ng g&oacute;p của Qu&yacute; kh&aacute;ch h&agrave;ng. H&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i!</p>\r\n', '<p>We are always ready to discuss, listen to the requests and contributions from customers. Please contact us!</p>\r\n', '1');
INSERT INTO `w_language` VALUES ('83', 'address_office', '<p><strong>+ C&ocirc;ng ty TNHH Đầu Tư Quang Trung</strong><br />\r\n<strong>Địa chỉ:</strong> số 11/670/32 đường H&agrave; Huy Tập - thị trấn Y&ecirc;n Vi&ecirc;n &ndash; Gia L&acirc;m &ndash; H&agrave; Nội<br />\r\n<strong>Điện thoại: </strong>+84-988.554.301<br />\r\n<strong>Email:</strong> quangtrung.investment@gmail.com</p>\r\n\r\n<p><strong>+ C&ocirc;ng ty TNHH MTV Barite Quang Trung L&agrave;o</strong><br />\r\n<strong>Địa chỉ:</strong> Bản Thakheckang, mường ThaKhec, tỉnh Khăm Muộn, nước CHDCND L&agrave;o<br />\r\n<strong>Điện thoại: </strong><br />\r\n<strong>Email:</strong></p>\r\n', '<p><strong>+ Co. Investment Quang Trung</strong><br />\r\n<strong>Address:</strong> No. 11/670/32 Ha Huy Tap Street - Yen Vien Town - Gia Lam - Hanoi<br />\r\n<strong>Phone: </strong>+84-988.554.301<br />\r\n<strong>Email:</strong> quangtrung.investment@gmail.com</p>\r\n\r\n<p><strong>+ Company Limited Quang Trung Lao Barite</strong><br />\r\n<strong>Address:</strong> The Thakheckang, visualizing ThaKhec, Kham Muon province, Laos<br />\r\n<strong>Phone:</strong><br />\r\n<strong>E-mail:</strong></p>\r\n', '1');
INSERT INTO `w_language` VALUES ('84', 'address_factory', '<p><strong>Địa chỉ:</strong> cụm bản NoongMa, mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o.</p>\r\n', '<p><strong>Address:</strong> clusters of Noong, visualizing Boualapha District, Kham Muon province, Laos.</p>\r\n', '1');
INSERT INTO `w_language` VALUES ('85', 'text_factory', 'Nhà máy', 'Factory', '1');
INSERT INTO `w_language` VALUES ('86', 'text_office', 'Văn phòng', 'Office', '1');

-- ----------------------------
-- Table structure for w_link
-- ----------------------------
DROP TABLE IF EXISTS `w_link`;
CREATE TABLE `w_link` (
  `link_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `link_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `link_name_alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `link_link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `link_status` tinyint(5) DEFAULT NULL,
  `link_order` int(11) DEFAULT NULL,
  `link_created` int(11) DEFAULT '0',
  `link_name_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of w_link
-- ----------------------------
INSERT INTO `w_link` VALUES ('3', null, 'Điện ảnh Việt Nam', null, 'http://dienanhvietnam.com.vn', '1', '1', '1470701709', 'Demo');

-- ----------------------------
-- Table structure for w_news
-- ----------------------------
DROP TABLE IF EXISTS `w_news`;
CREATE TABLE `w_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `news_title` varchar(255) DEFAULT NULL,
  `news_title_alias` varchar(255) DEFAULT '',
  `news_desc_sort` text,
  `news_content` text,
  `news_image` varchar(255) DEFAULT NULL COMMENT 'ảnh đại diện của bài viết',
  `news_image_other` longtext COMMENT 'Lưu ảnh của bài viết',
  `news_type` tinyint(5) DEFAULT '1' COMMENT 'Kiểu tin',
  `news_category` int(11) DEFAULT NULL,
  `news_hot` int(11) DEFAULT NULL,
  `news_status` tinyint(5) DEFAULT NULL,
  `news_num` int(11) DEFAULT '0',
  `news_link` varchar(255) DEFAULT NULL,
  `news_create` int(11) DEFAULT NULL,
  `news_meta_title` varchar(255) DEFAULT NULL,
  `news_meta_keyword` text,
  `news_meta_description` text,
  `news_order` int(11) DEFAULT NULL,
  `news_title_en` varchar(255) DEFAULT NULL,
  `news_desc_sort_en` text,
  `news_content_en` longtext,
  `news_meta_title_en` varchar(255) DEFAULT NULL,
  `news_meta_keyword_en` text,
  `news_meta_description_en` text,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_news
-- ----------------------------
INSERT INTO `w_news` VALUES ('24', '1', 'Giới thiệu chung', 'gioi-thieu-chung', '', '<p><strong>Giới thiệu chung:</strong><br />\r\nC&ocirc;ng ty tnhh Đầu tư Quang Trung (Quang Trung Investment Co.,Ltd) được th&agrave;nh lập lần đầu ng&agrave;y 23 th&aacute;ng 08 năm 2001 đ&atilde; tiến h&agrave;nh hoạt động sản xuất kinh doanh qua c&aacute;c lĩnh vực bu&ocirc;n b&aacute;n ho&aacute; chất, vận chuyển h&agrave;ng ho&aacute;, khai th&aacute;c v&agrave; chế biến kho&aacute;ng sản,&hellip;<br />\r\nTừ năm 2010, sau khi bắt tay v&agrave;o triển khai dự &aacute;n khai th&aacute;c v&agrave; chế biến bột Barite tại nước CHDCND L&agrave;o. C&ocirc;ng ty tập trung to&agrave;n bộ tiềm lực về nh&acirc;n sự, t&agrave;i ch&iacute;nh v&agrave; cơ sở vật chất cho qu&aacute; tr&igrave;nh t&igrave;m kiếm, thăm d&ograve; rồi tiến tới khai th&aacute;c v&agrave; x&acirc;y dựng nh&agrave; m&aacute;y chế biến bột Barite tại mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o.&nbsp;<br />\r\nC&ocirc;ng ty đ&atilde; sẵn s&agrave;ng cho ra thị trường bột v&agrave; quặng Barite c&oacute; chất lượng cao nhằm đ&aacute;p ứng nhu cầu về dung dịch khoan dầu kh&iacute; v&agrave; phụ gia trong lĩnh vực sản xuất c&ocirc;ng nghiệp tr&ecirc;n to&agrave;n cầu.</p>\r\n\r\n<p><br />\r\n<strong>Tầm nh&igrave;n:</strong><br />\r\nC&ocirc;ng ty nhận định thị trường Barite l&agrave; thị trường gi&agrave;u tiềm năng, đem lại hiệu quả cao v&agrave; bền vững cho hoạt động sản xuất kinh doanh của c&ocirc;ng ty. V&igrave; vậy, c&ocirc;ng ty tập trung to&agrave;n bộ khả năng để đạt được một kết quả tốt nhất cho hoạt động sản xuất kinh doanh của nh&agrave; m&aacute;y chế biến Barite tại CHDCND L&agrave;o.<br />\r\nTh&agrave;nh c&ocirc;ng trong lĩnh vực n&agrave;y sẽ l&agrave; nền tảng để c&ocirc;ng ty c&oacute; đủ khả năng tiếp tục triển khai một số dự &aacute;n m&agrave; c&ocirc;ng ty đang tiến h&agrave;nh nghi&ecirc;n cứu v&agrave; bắt tay v&agrave;o c&aacute;c c&ocirc;ng t&aacute;c chuẩn bị, để th&agrave;nh c&ocirc;ng nối tiếp th&agrave;nh c&ocirc;ng.</p>\r\n\r\n<p><br />\r\n<strong>Sứ mệnh:</strong><br />\r\nHướng tới th&agrave;nh c&ocirc;ng &nbsp;để c&oacute; thể mang lại hạnh ph&uacute;c cho to&agrave;n thể c&aacute;n bộ c&ocirc;ng nh&acirc;n vi&ecirc;n c&ocirc;ng ty. V&agrave; c&ocirc;ng ty trở th&agrave;nh một thực thể hữu &iacute;ch, đ&oacute;ng g&oacute;p v&agrave;o sự ph&aacute;t triển v&agrave; phồn vinh của x&atilde; hội.</p>\r\n\r\n<p><br />\r\n<strong>Gi&aacute; trị cốt l&otilde;i:</strong><br />\r\nCon người l&agrave; cốt l&otilde;i của th&agrave;nh c&ocirc;ng v&agrave; thương hiệu lu&ocirc;n lu&ocirc;n &nbsp;song h&agrave;nh c&ugrave;ng chất lượng sản phẩm.<br />\r\nỞ đ&acirc;y, tr&iacute; tuệ s&aacute;ng tạo v&agrave; nh&acirc;n c&aacute;ch con người c&ugrave;ng tất cả c&aacute;c gi&aacute; trị đ&iacute;ch thực đều được tr&acirc;n trọng v&agrave; n&acirc;ng đỡ.<br />\r\nNiềm tin của ch&uacute;ng ta đem lại th&agrave;nh c&ocirc;ng cho tất cả ch&uacute;ng ta.</p>\r\n', '', null, '17', '1', '0', '1', '0', null, '1471299434', 'Giới thiệu chung', 'Giới thiệu chung', 'Giới thiệu chung', '1', 'General introduction', '', '<p>Investment ltd Quang Trung (Quang Trung Investment Co., Ltd.) was established for the first time on May 23, 2001 has conducted 08 operations and business through the field of chemical trafficking, transportation of goods, mining and mineral processing,...<br />\r\nSince 2010, after embarking on the project mining and processing Barite powder in Laos. The company focuses on the full potential of personnel, finance and facilities for the search process, then proceed to exploratory mining and processing plant construction in Muong Boualapha District Barite powder, Kham Muon province, country Lao PDR.<br />\r\nThe company is ready for the market Barite powder and high-quality ore to meet the demand for oil and gas drilling fluids and additives in industrial production worldwide.<br />\r\n<strong>Vision:</strong><br />\r\nCompany Market Comments Barite is a potential market, providing high efficiency and sustainable production and business operations of the company. So the entire company focused ability to achieve the best result for production and business activities of Barite processing plant in Lao PDR.<br />\r\nSuccess in this field will be the foundation for the company to afford to continue to implement a number of projects that the company is conducting studies and embarked on the preparatory work, to success after success .<br />\r\n<strong>Mission:</strong><br />\r\nTowards success to be able to bring happiness to all officers and employees of the company. And the company became a useful entity, contributing to the development and prosperity of society .<br />\r\n<strong>Core values:</strong><br />\r\nPeople are the core of the success and the brand has always been the quality of products.<br />\r\nwe always respect and support the intellectual and human dignity<br />\r\n&nbsp;Our beliefs bring success for all of us .</p>\r\n', 'General introduction', 'General introduction', 'General introduction');
INSERT INTO `w_news` VALUES ('25', '1', 'Cơ cấu sở hữu', 'co-cau-so-huu', '', '<p>C&ocirc;ng ty c&oacute; trụ sở văn ph&ograve;ng tại Tp. H&agrave; Nội sở hữu 100% 2 dự &aacute;n:<br />\r\n<strong>1. Dự &aacute;n khai th&aacute;c C&aacute;t b&atilde;i bồi với diện t&iacute;ch 58ha tại X&atilde; T&acirc;n Hưng, huyện Ti&ecirc;n Lữ, tỉnh Hưng Y&ecirc;n, nước CHXHCN Việt Nam.</strong><br />\r\n<strong>2. Dự &aacute;n khai th&aacute;c v&agrave; chế biến bột Barite tại mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o:</strong><br />\r\n+ Hợp đồng t&igrave;m kiếm v&agrave; thăm d&ograve; quặng Barite k&yacute; giữa c&ocirc;ng ty v&agrave; Ch&iacute;nh phủ nước CHDCND L&agrave;o ng&agrave;y 14 th&aacute;ng 01 năm 2010.<br />\r\n+ Hợp đồng khai th&aacute;c v&agrave; chế biến bột Barite k&yacute; giữa c&ocirc;ng ty v&agrave; Ch&iacute;nh phủ nước CHDCND L&agrave;o ng&agrave;y 16 th&aacute;ng 01 năm 2014.<br />\r\nC&ocirc;ng ty đ&atilde; x&acirc;y dựng một nh&agrave; m&aacute;y chế biến bột Barite &nbsp;hiện đại tr&ecirc;n diện t&iacute;ch 2,5 ha tại mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o.<br />\r\nNh&agrave; m&aacute;y c&oacute; năng lực sản xuất tối đa l&agrave; 100.000 tấn bột Barite/ năm.<br />\r\nĐội ngũ c&aacute;n bộ kỹ sư v&agrave; c&ocirc;ng nh&acirc;n được tuyển chọn giữa lao động c&oacute; kinh nghiệm sản xuất bột Barite tại Việt Nam với lực lượng lao động nh&acirc;n c&ocirc;ng tại nước CHDCND L&agrave;o.<br />\r\nDiện t&iacute;ch khu mỏ được cấp l&agrave;m v&ugrave;ng nguy&ecirc;n liệu cho nh&agrave; m&aacute;y l&agrave; 17,48 Km2 , c&oacute; trữ lượng quặng Barite dồi d&agrave;o v&agrave; chất lượng cao.</p>\r\n', '', null, '17', '2', '0', '1', '0', null, '1471299744', 'Cơ cấu sở hữu', 'Cơ cấu sở hữu', 'Cơ cấu sở hữu', '2', 'Ownership structure', '', '<p>The company has offices in the city. Hanoi owns 100% of two projects:<br />\r\n1. Project Cat alluvial mining area of 58ha in Tan Hung Commune, Tien Lu District, Hung Yen Province, Republic of Vietnam.<br />\r\n2. Projects for mining and processing in Muong Boualapha District Barite powder, Kham Muon province, Laos:<br />\r\n+ Contract search and exploration Barite ore signed between the company and the Government of the Lao PDR on 14 May 01, 2010.<br />\r\n+ Contract mining and processing Barite powder signed between the company and the Government of the Lao People&#39;s Democratic Republic on 16 May 01, 2014.<br />\r\nThe company has built a processing plant Barite powder modern on a 2.5 hectare in Muong Boualapha District, Kham Muon province, Laos.<br />\r\nThe plant has a production capacity of 100,000 tonnes a maximum of Barite powder/year.<br />\r\nStaff engineers and workers were recruited among experienced workers Barite powder production in Vietnam with labor workforce in Laos.<br />\r\nMining area granted as the raw materials for the plant is 17.48 km2, Barite ore reserves abundant and high quality.</p>\r\n', 'Ownership structure', 'Ownership structure', 'Ownership structure');
INSERT INTO `w_news` VALUES ('26', '1', 'Quá trình nghiên cứu dự án', 'qua-trinh-nghien-cuu-du-an', '', '<p>Ng&agrave;y đặt ch&acirc;n tới cửa khẩu của L&agrave;o để khởi đầu cho một dự &aacute;n tiềm năng. Với mục đ&iacute;ch ph&aacute;t triển hoạt động của c&ocirc;ng ty v&agrave; t&igrave;m kiếm lợi nhuận nhưng kh&ocirc;ng bao giờ l&atilde;ng qu&ecirc;n &yacute; định t&igrave;m kiếm những người bạn L&agrave;o từ thủa sinh vi&ecirc;n v&agrave; những dấu ch&acirc;n cha anh để lại. Hy vọng c&oacute; thể g&oacute;p một phần nhỏ v&agrave;o qu&aacute; tr&igrave;nh x&acirc;y dựng t&igrave;nh hữu nghị hai nước Việt &ndash; L&agrave;o anh em.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/08-22-14-18-08-2016-1ngay.jpg\" /></p>\r\n\r\n<p>C&ugrave;ng đo&agrave;n c&aacute;n bộ c&ocirc;ng ty đi khảo s&aacute;t thực địa để nghi&ecirc;n cứu dự &aacute;n. Ch&uacute;ng t&ocirc;i đứng tr&ecirc;n đỉnh đ&egrave;o Bolonhit, tại mường Bualapha, tỉnh Khăm Muộn ngắm ph&iacute;a Đ&ocirc;ng Trường Sơn v&agrave; ph&iacute;a T&acirc;y Trường Sơn, nghĩ về gian khổ ng&agrave;y h&ocirc;m nay v&agrave; giản khổ ng&agrave;y h&ocirc;m qua để cảm thấy sức mạnh v&agrave; &yacute; ch&iacute; vẫn nằm trong tr&aacute;i tim t&ocirc;i.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-30-47-16-08-2016-2.jpg\" style=\"height:394px; width:700px\" /></p>\r\n\r\n<p>Đo&agrave;n c&aacute;n bộ c&ocirc;ng ty đi khảo s&aacute;t thực địa đ&aacute;nh gi&aacute; t&aacute;c động m&ocirc;i trường tại mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o. Chuyến đi đem lại cho đo&agrave;n rất nhiều niềm vui v&agrave; sự phấn khởi. Tương lai đang ở ph&iacute;a trước v&agrave; niềm tin rạng ngời tr&ecirc;n khu&ocirc;n mặt ch&uacute;ng t&ocirc;i. C&oacute; đi l&agrave; c&oacute; đến &ndash; xin tất cả c&ugrave;ng đồng h&agrave;nh để c&ugrave;ng c&oacute; mặt trong ng&agrave;y vui thắng lợi.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-31-21-16-08-2016-3.jpg\" /></p>\r\n\r\n<p>C&aacute;n bộ c&ocirc;ng ty v&agrave; nh&acirc;n d&acirc;n địa phương c&ugrave;ng tham gia lộ tr&igrave;nh t&igrave;m kiếm quặng Barite tại cụm bản NoongMa, mường Bualapha, tỉnh Khăm Muộn. Hy vọng kết quả th&agrave;nh c&ocirc;ng của dự &aacute;n xứng đ&aacute;ng với những vất vả v&agrave; gian khổ của chuyến đi n&agrave;y. Xin đừng qu&ecirc;n khu&ocirc;n mặt của những người đ&atilde; đồng h&agrave;nh c&ugrave;ng ch&uacute;ng t&ocirc;i.&nbsp;</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-31-21-16-08-2016-4.jpg\" /></p>\r\n\r\n<p>C&ugrave;ng gi&aacute;o sư, tiến sỹ khoa học B&ugrave;i Học tham quan t&igrave;m hiểu v&agrave; lấy số liệu từ trạm kh&iacute; tượng thuỷ văn tại tỉnh Khăm Muộn. Nh&igrave;n biểu tượng của hai l&aacute; cờ L&agrave;o - Nhật m&agrave; nghĩ đến t&iacute;nh nh&acirc;n văn v&agrave; t&igrave;nh hữu nghị tr&ecirc;n to&agrave;n thế giới</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-31-28-16-08-2016-5.jpg\" /></p>\r\n', '08-22-14-18-08-2016-1ngay.jpg', 'a:5:{i:0;s:25:\"05-30-47-16-08-2016-2.jpg\";i:1;s:25:\"05-31-21-16-08-2016-3.jpg\";i:2;s:25:\"05-31-21-16-08-2016-4.jpg\";i:3;s:25:\"05-31-28-16-08-2016-5.jpg\";i:4;s:29:\"08-22-14-18-08-2016-1ngay.jpg\";}', '17', '11', '1', '1', '0', null, '1471300247', '', '', '', '2', 'Research project', '', '<p>From the early days to start of a potential project on Laos. With the aim of developing the company&#39;s operations and look for profit but never forgotten the intention of finding my friend from students. We hope that we can make a small contribution to the process of building bilateral friendship Vietnam - Laos brothers.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/08-22-14-18-08-2016-1ngay.jpg\" /></p>\r\n\r\n<p>The same company delegation to survey the field to study the project. We stand on the top of the pass Bolonhit, in Muong Boualapha District, watch eastern Kham Muon province west of Truong Son and Truong Son, think about today and arduous hardships yesterday to feel the power and the will to remain in my heart.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-30-47-16-08-2016-2.jpg\" style=\"height:394px; width:700px\" /></p>\r\n\r\n<p>Survey group of Company the field of environmental impact assessment in Muong Boualapha District, Kham Muon province, Laos. The trip gave the delegation a lot of joy and excitement. The future is in front and radiant faith on our faces. There are going to have to - ask all to accompany the presence of the big day victory.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-31-21-16-08-2016-3.jpg\" /></p>\r\n\r\n<p>It should set the company and local people joined the search route in terms of Barite ore NoongMa, visualizing Boualapha District, Kham Muon province. Hopefully successful outcome of the project worth the strenuous and arduous trip. Please do not forget the faces of those who have been with us.&nbsp;</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-31-21-16-08-2016-4.jpg\" /></p>\r\n\r\n<p>Group and professor, Dr. Bui Hoc Learning science sightseeing learn and retrieve data from the meteorology station in Kham Muon province. Looking at the two flag icon Laos - Japan but think of humanity and friendship worldwide.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/26/700x700/05-31-28-16-08-2016-5.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('27', '1', 'Quá trình tìm kiếm và thăm dò', 'qua-trinh-tim-kiem-va-tham-do', '', '<p>Tập kết m&aacute;y m&oacute;c thiết bị để chuẩn bị cho c&ocirc;ng t&aacute;c thăm d&ograve; quặng Barite tại khe suối Nậm Lưm, cụm bản NoongMa, mường Bualapha, tỉnh Khăm Muộn. D&ugrave; biết rằng c&ocirc;ng việc sẽ c&oacute; rất nhiều kh&oacute; khăn vất vả ph&iacute;a trước nhưng cũng biết rằng th&agrave;nh c&ocirc;ng của dự &aacute;n phụ thuộc ch&iacute;nh v&agrave;o sự ch&iacute;nh x&aacute;c trong kết quả của c&ocirc;ng t&aacute;c thăm d&ograve; ng&agrave;y h&ocirc;m nay.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-03-39-16-08-2016-1.jpg\" style=\"line-height:20.8px\" /></p>\r\n\r\n<p>Tiến h&agrave;nh mở rộng điểm lộ để c&oacute; cơ sở đ&aacute;nh gi&aacute; tiềm năng trữ lượng quặng Barite trong khu vực.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-04-20-16-08-2016-2.jpg\" /></p>\r\n\r\n<p>C&ocirc;ng t&aacute;c khoan thăm d&ograve; được triển khai một c&aacute;ch chu đ&aacute;o nhằm lấy kết quả ch&iacute;nh x&aacute;c về vỉa quặng, phục vụ cho c&ocirc;ng t&aacute;c đ&aacute;nh gi&aacute; trữ lượng Barite trong khu mỏ.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-04-59-16-08-2016-5.jpg\" /></p>\r\n\r\n<p>Đ&agrave;o h&agrave;o thăm d&ograve; l&agrave; một c&ocirc;ng việc cần thiết được triển khai theo c&aacute;c vỉa quặng. Niềm vui mừng tr&agrave;o d&acirc;ng khi thấy vỉa quặng Barite hiện ra b&aacute;o hiệu tiềm năng của dự &aacute;n.Xin được chia sẻ những gi&aacute; trị n&agrave;y tới tất cả cộng đồng.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-04-59-16-08-2016-4.jpg\" /></p>\r\n\r\n<p>Khoan thăm d&ograve; rồi lại khoan tiếp ! D&ugrave; mỗi lần di chuyển l&agrave; lại c&oacute; th&ecirc;m bao nhi&ecirc;u vất vả kh&oacute; khăn. Nhưng để đảm bảo được t&iacute;nh ch&iacute;nh x&aacute;c cần thiết cho th&agrave;nh c&ocirc;ng của dự &aacute;n th&igrave; c&oacute; kh&oacute; khăn n&agrave;o cũng phải vượt qua.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-05-00-16-08-2016-3.jpg\" /></p>\r\n', '06-03-39-16-08-2016-1.jpg', 'a:5:{i:0;s:25:\"06-03-39-16-08-2016-1.jpg\";i:1;s:25:\"06-04-20-16-08-2016-2.jpg\";i:2;s:25:\"06-04-59-16-08-2016-4.jpg\";i:3;s:25:\"06-04-59-16-08-2016-5.jpg\";i:4;s:25:\"06-05-00-16-08-2016-3.jpg\";}', '17', '12', '1', '1', '0', null, '1471302219', 'Quá trình tìm kiếm và thăm dò', 'Quá trình tìm kiếm và thăm dò', 'Quá trình tìm kiếm và thăm dò', '3', 'The research and exploration', '', '<p>The machinery to prepare for Barite ore exploration work at Nam Lum streams, clusters of NoongMa, visualizing Boualapha District, Kham Muon province. Despite knowing that the job will be a lot of difficult struggle ahead, but also know that the success of the project depends on the accuracy of the results of the exploration work today.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-03-39-16-08-2016-1.jpg\" style=\"line-height:20.8px\" /></p>\r\n\r\n<p>Finding the points to reveal potential assessment Barite ore reserves in the region.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-04-20-16-08-2016-2.jpg\" /></p>\r\n\r\n<p>The drilling is implemented to obtain the results carefully precise ore deposits, serving for the evaluation of reserves at the mine Barite.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-04-59-16-08-2016-5.jpg\" /></p>\r\n\r\n<p>The exploration trench is a necessary work was conducted to evaluate ore deposits. Barite ore deposits to find out potential signals of the project. Are pleased to share these values to all communities.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-04-59-16-08-2016-4.jpg\" /></p>\r\n\r\n<p>The exploration and drilling again! Although each move is the much more difficult struggle. But to ensure the accuracy needed for the success of the project, we&#39;re always looking for ways to overcome difficulties.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/27/700x700/06-05-00-16-08-2016-3.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('28', '1', 'Hoạt động báo cáo dự án và kiểm tra thực địa', 'hoat-dong-bao-cao-du-an-va-kiem-tra-thuc-dia', '', '<p>Gi&aacute;o sư, tiến sỹ khoa học B&ugrave;i Học b&aacute;o c&aacute;o về nghi&ecirc;n cứu đ&aacute;nh gi&aacute; t&aacute;c động m&ocirc;i trường (DTM) tại thủ đ&ocirc; Vi&ecirc;ng Chăn, nước CHDCND L&agrave;o. B&aacute;o c&aacute;o sau phần phản biện đ&atilde; nhận được sự đ&aacute;nh gi&aacute; t&iacute;ch cực từ c&aacute;c cơ quan chuy&ecirc;n m&ocirc;n của ch&iacute;nh phủ L&agrave;o.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-12-38-16-08-2016-1.jpg\" /></p>\r\n\r\n<p>C&ocirc;ng ty thực hiện việc b&aacute;o c&aacute;o về luận chứng kinh tế kỹ thuật chi tiết tại Cục Mỏ - Bộ Mỏ Năng Lượng, nước CHDCND L&agrave;o. C&aacute;c c&aacute;n bộ của c&aacute;c cơ quan chức năng c&oacute; phần ngạc nhi&ecirc;n khi thấy người b&aacute;o cacos lại l&agrave; gi&aacute;m đốc c&ocirc;ng ty. Đ&acirc;y c&oacute; lẽ l&agrave; một sự ngạc nhi&ecirc;n th&uacute; vị.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-12-51-16-08-2016-2.jpg\" /><br />\r\n&nbsp;<br />\r\nĐo&agrave;n nghi&ecirc;n cứu b&aacute;o c&aacute;o DTM c&oacute; buổi l&agrave;m việc trực tiếp với đ&agrave;i kh&iacute; tượng thuỷ văn tỉnh Khăm Muộn. Hiểu biết về kh&iacute; tượng thuỷ văn l&agrave; điều cần thiết cho qu&aacute; tr&igrave;nh triển khai dự &aacute;n cũng như hoạt động sản xuất kinh doanh sau n&agrave;y. Xin cảm ơn sự hợp t&aacute;c th&acirc;n thiện v&agrave; đầy tr&aacute;ch nhiệm của c&aacute;c bạn L&agrave;o.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-04-16-08-2016-3.jpg\" /></p>\r\n\r\n<p>Một buổi l&agrave;m việc cật lực với c&aacute;c c&aacute;n bộ của bộ t&agrave;i nguy&ecirc;n m&ocirc;i trường c&ugrave;ng c&aacute;n bộ v&agrave; nh&acirc;n d&acirc;n địa phương tại cụm bản Noong Ma, mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o để cung cấp th&ocirc;ng tin v&agrave; t&igrave;m kiếm sự đồng thuận trong việc triển khai dự &aacute;n. C&oacute; được như vậy mới c&oacute; thể được n&oacute;i rằng &ldquo; th&agrave;nh c&ocirc;ng n&agrave;y l&agrave; của tất cả ch&uacute;ng ta&rdquo;.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-15-16-08-2016-4.jpg\" /></p>\r\n\r\n<p>Đo&agrave;n kiểm tra bao gồm c&aacute;c cơ quan chức năng của ch&iacute;nh phủ, địa phương v&agrave; c&ocirc;ng ty đ&atilde; tiến h&agrave;nh khảo s&aacute;t tổng thể khu vực dự &aacute;n. C&oacute; qu&aacute; nhiều &yacute; kiến nhưng tất cả đều thừa nhận t&iacute;nh khả thi của dự &aacute;n về mặt kinh tế, m&ocirc;i trường v&agrave; x&atilde; hội. Xin ghi nhớ tất cả c&aacute;c &yacute; kiến đ&oacute;ng g&oacute;p ch&acirc;n th&agrave;nh của c&aacute;c bạn.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-25-16-08-2016-5.jpg\" /></p>\r\n\r\n<p>Khảo s&aacute;t tại thực địa để t&igrave;m kiếm vị tr&iacute; đặt nh&agrave; m&aacute;y. Đo&agrave;n khảo s&aacute;t hỗn hợp t&igrave;m kiếm vị tr&iacute; đặt nh&agrave; m&aacute;y Barite tại cụm bản NoongMa, mường Bualapha, tỉnh Khăm Muộn. Xin h&atilde;y ghi nhớ rằng quyết định hợp l&yacute; của ng&agrave;y h&ocirc;m nay sẽ c&oacute; t&aacute;c dụng t&iacute;ch cực l&acirc;u d&agrave;i trong suốt qu&aacute; tr&igrave;nh sản xuất kinh doanh của nh&agrave; m&aacute;y. V&igrave; vậy, mọi &yacute; kiến đ&oacute;ng g&oacute;p đều được tr&acirc;n trọng lắng nghe.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-45-16-08-2016-6.jpg\" /></p>\r\n\r\n<p>Chụp ảnh lưu niệm c&ugrave;ng Chủ tịch tỉnh Khăm Muộn sau buổi b&aacute;o c&aacute;o tổng kết về dự &aacute;n tại địa phương. Thật hạnh ph&uacute;c khi được nghe những lời khen ngợi nhưng cũng hiểu rằng tr&aacute;ch nhiệm nặng nề của c&ocirc;ng ty đối với qu&aacute; tr&igrave;nh ph&aacute;t triển kinh tế x&atilde; hội của địa phương. Kết quả nhất định sẽ tốt đẹp khi ch&uacute;ng ta đ&atilde; biết đặt niềm tin v&agrave;o nhau.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-30-15-16-08-2016-7.jpg\" /></p>\r\n', '06-12-38-16-08-2016-1.jpg', 'a:7:{i:0;s:25:\"06-12-38-16-08-2016-1.jpg\";i:1;s:25:\"06-12-51-16-08-2016-2.jpg\";i:2;s:25:\"06-13-04-16-08-2016-3.jpg\";i:3;s:25:\"06-13-15-16-08-2016-4.jpg\";i:4;s:25:\"06-13-25-16-08-2016-5.jpg\";i:5;s:25:\"06-13-45-16-08-2016-6.jpg\";i:6;s:25:\"06-30-15-16-08-2016-7.jpg\";}', '17', '13', '0', '1', '0', null, '1471302758', 'Hoạt động báo cáo dự án và kiểm tra thực địa', 'Hoạt động báo cáo dự án và kiểm tra thực địa', 'Hoạt động báo cáo dự án và kiểm tra thực địa', '0', 'project Activities report and field inspection', '', '<p>Professor Dr.Bui Hoc Learning science research report on environmental impact assessment (DTM) in Vientiane, Laos. After the critical report has received positive reviews from the specialized agencies of the government of Laos.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-12-38-16-08-2016-1.jpg\" /></p>\r\n\r\n<p>Company implemented the report of the technical and economic feasibility study detailed in the Bureau of Mines - Ministry of Mining and Energy, Republic of Laos. The staff of the authorities is somewhat surprising to see who is the director cacos newspaper company. This may be a pleasant surprise.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-12-51-16-08-2016-2.jpg\" /><br />\r\n&nbsp;<br />\r\nThe research teams reported DTM a meeting directly with the hydro-meteorological stations Kham Muon province. Understanding of meteorology is essential for the process of project implementation as well as production and business activities in the future. Thank you to the friendly cooperation and full responsibility of Laos.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-04-16-08-2016-3.jpg\" /></p>\r\n\r\n<p>Shaking hands and give each other confidence with responsibilities and obligations. This moment regardless strenuous labor of many people have been with us.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-15-16-08-2016-4.jpg\" /></p>\r\n\r\n<p>Indian experts to survey the field and the mine to the plant-based contracting goods consumption. After the trip, the Indian professionals to thank for having a successful trip. To seeing each other to take care of the next section.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-25-16-08-2016-5.jpg\" /></p>\r\n\r\n<p>We had a meeting, working and having lunch with him Roffie Fernandes - Director&#39;s supply company Halliburton Baroid. Halliburton are very good professionals but also quite interesting. The two sides signed a memorandum easy Investment Company Limited Quang Trung to become a partner of Halliburton.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-13-45-16-08-2016-6.jpg\" /></p>\r\n\r\n<p>Take photo with Indian experts at the company&#39;s floor. Our Plant Green - Clean - Nice and potential ore deposits have not you?</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/28/700x700/06-30-15-16-08-2016-7.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('29', '1', 'Ký kết hợp đồng và gặp gỡ đối tác', 'ky-ket-hop-dong-va-gap-go-doi-tac', '', '<p>Lễ k&yacute; kết hợp đồng khai th&aacute;c v&agrave; chế biến Barite tại cụm bản Noongma, mường Bualapha, tỉnh Khăm Muộn giữa ch&iacute;nh phủ nước CHDCND L&agrave;o v&agrave; C&ocirc;ng ty TNHH Đầu tư Quang Trung ng&agrave;y 16 th&aacute;ng 01 năm 2014. Hợp đồng mở ra một cơ hội đầy triển vọng cho hoạt động sản xuất kinh doanh của c&ocirc;ng ty nhưng những tr&aacute;ch nhiệm v&agrave; nghĩa vụ đối với nh&acirc;n d&acirc;n nước L&agrave;o c&ocirc;ng ty kh&ocirc;ng bao giờ xao nh&atilde;ng.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-32-35-16-08-2016-1kyhd.jpg\" /></p>\r\n\r\n<p><br />\r\nGi&aacute;m đốc c&ocirc;ng ty, &Ocirc;ng Trần Quang Tuấn ph&aacute;t biểu trong lễ k&yacute; hợp đồng. Sự thẳng thắn, ch&acirc;n th&agrave;nh l&agrave; quan điểm xuy&ecirc;n suốt trong b&agrave;i diễn văn cũng như phương thức điều h&agrave;nh hoạt động triển khai dự &aacute;n.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-32-46-16-08-2016-2.jpg\" /></p>\r\n\r\n<p><br />\r\nLễ k&yacute; kết hợp đồng diễn ra với sự tham gia của c&aacute;c cơ quan chức năng, đại diện cho ch&iacute;nh phủ L&agrave;o v&agrave; c&aacute;n bộ của Đại sứ qu&aacute;n Việt Nam tại L&agrave;o c&ugrave;ng với bạn b&egrave;, đối t&aacute;c th&acirc;n thiết của c&ocirc;ng ty. Xin cảm ơn khi niềm vui n&agrave;y đ&atilde; được nh&acirc;n l&ecirc;n rất nhiều lần c&ugrave;ng c&aacute;c bạn.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-02-16-08-2016-3.jpg\" /></p>\r\n\r\n<p><br />\r\n&nbsp;Bắt tay v&agrave; trao cho nhau niềm tin c&ugrave;ng với tr&aacute;ch nhiệm v&agrave; nghĩa vụ. Ph&uacute;t gi&acirc;y n&agrave;y kh&ocirc;ng phụ c&ocirc;ng lao vất vả của rất nhiều người đ&atilde; đồng h&agrave;nh c&ugrave;ng ch&uacute;ng t&ocirc;i.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-13-16-08-2016-4.jpg\" /></p>\r\n\r\n<p><br />\r\nĐưa chuy&ecirc;n gia Ấn Độ đi khảo s&aacute;t thực địa nh&agrave; m&aacute;y v&agrave; khu mỏ để c&oacute; cơ sở k&yacute; kết hợp đồng ti&ecirc;u thụ h&agrave;ng ho&aacute;. Sau chuyến đi, chuy&ecirc;n gia Ấn Độ đ&atilde; gửi lời cảm ơn v&igrave; đ&atilde; c&oacute; một chuyến đi th&agrave;nh c&ocirc;ng. Xin hẹn gặp lại nhau để l&agrave;m nốt những phần việc kế tiếp.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-27-16-08-2016-5.jpg\" /></p>\r\n\r\n<p><br />\r\nGặp gỡ, l&agrave;m việc v&agrave; ăn trưa c&ugrave;ng với ng&agrave;i Roffie Fernandes &ndash; Gi&aacute;m đốc cung ứng của c&ocirc;ng ty Baroid- Halliburton. Chuy&ecirc;n gia của Halliburton rất giỏi nhưng cũng kh&aacute; th&uacute; vị. Hai b&ecirc;n k&yacute; bi&ecirc;n bản ghi nhớ dể c&ocirc;ng ty TNHH Đầu tư Quang Trung được trở th&agrave;nh một đối t&aacute;c của Halliburton.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-39-16-08-2016-6.jpg\" /></p>\r\n\r\n<p><br />\r\nChụp ảnh lưu niệm c&ugrave;ng với chuy&ecirc;n gia Ấn Độ tại nh&agrave; s&agrave;n của c&ocirc;ng ty. Nh&agrave; m&aacute;y của ch&uacute;ng t&ocirc;i Xanh - Sạch - Đẹp v&agrave; mỏ quặng gi&agrave;u tiềm năng phải kh&ocirc;ng Bạn?</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-51-16-08-2016-7.jpg\" /></p>\r\n', '06-32-46-16-08-2016-2.jpg', 'a:7:{i:0;s:29:\"06-32-35-16-08-2016-1kyhd.jpg\";i:1;s:25:\"06-32-46-16-08-2016-2.jpg\";i:2;s:25:\"06-36-02-16-08-2016-3.jpg\";i:3;s:25:\"06-36-13-16-08-2016-4.jpg\";i:4;s:25:\"06-36-27-16-08-2016-5.jpg\";i:5;s:25:\"06-36-39-16-08-2016-6.jpg\";i:6;s:25:\"06-36-51-16-08-2016-7.jpg\";}', '17', '15', '0', '1', '0', null, '1471303955', 'Ký kết hợp đồng và gặp gỡ đối tác', 'Ký kết hợp đồng và gặp gỡ đối tác', 'Ký kết hợp đồng và gặp gỡ đối tác', '3', ' Signing contracts and meet partners', '', '<p>The signing ceremony of the contract mining and processing in terms of Noongma Barite, visualizing Boualapha District, Kham Muon province between the government of Lao PDR and Co. Investment Quang Trung May 16 01, 2014. The contract opens an opportunity promising for production and business activities of the company, but the responsibility and obligation to the people of Laos companies never neglect.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-32-35-16-08-2016-1kyhd.jpg\" /></p>\r\n\r\n<p><br />\r\nCompany Director, Mr. Tran Quang Tuan said during the contract signing ceremony. Frankness, sincerity is the view throughout the speech, as well as the mode of execution of the project activities.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-32-46-16-08-2016-2.jpg\" /></p>\r\n\r\n<p><br />\r\nContract signing ceremony took place with the participation of the authorities, representing the Lao government and officials of the Embassy of Vietnam in Laos along with a friend, a close partner of the company. Thank when joy was multiplied many times with friends.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-02-16-08-2016-3.jpg\" /></p>\r\n\r\n<p><br />\r\nShaking hands and give each other confidence with responsibilities and obligations. This moment regardless strenuous labor of many people have been with us.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-13-16-08-2016-4.jpg\" /></p>\r\n\r\n<p><br />\r\nIndian experts put away a field survey and mine plant to sign a contract basis goods consumption. After the trip, the Indian professionals to thank for having a successful trip. To seeing each other to take care of the next section.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-27-16-08-2016-5.jpg\" /></p>\r\n\r\n<p>Meet, work and eat lunch with him Roffie Fernandes - Director&#39;s supply company Halliburton Baroid-. Halliburton are very good professionals but also quite interesting. The two sides signed a memorandum easy Investment Company Limited Quang Trung to become a partner of Halliburton.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-39-16-08-2016-6.jpg\" /></p>\r\n\r\n<p><br />\r\nSouvenir photograph with Indian experts at the company&#39;s floor. Our Plant Green - Clean - Nice and potential ore deposits have not you?</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/29/700x700/06-36-51-16-08-2016-7.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('30', '1', 'Quá trình xây dựng mỏ và nhà máy chế biến', 'qua-trinh-xay-dung-mo-va-nha-may-che-bien', '', '<p>Vận chuyển m&aacute;y m&oacute;c thiết bị qua x&ocirc;ng XeeBangPhai để x&acirc;y dựng nh&agrave; m&aacute;y. Qu&aacute; vất vả cho một chuyến đi nhưng cũng thật h&agrave;nh ph&uacute;c khi to&agrave;n bộ vật tư thiết bị đ&atilde; tập kết an to&agrave;n tại khu x&acirc;y dựng nh&agrave; m&aacute;y.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-40-46-16-08-2016-1.jpg\" /></p>\r\n\r\n<p><br />\r\nDựng khung xưởng sản xuất của nh&agrave; m&aacute;y chế biến Barite tại cụm bản Noongma, mường Bualapha, tỉnh Khăm Muộn. Giữa nơi hoang sơ v&agrave; ngh&egrave;o kh&oacute; n&agrave;y rồi sẽ mọc l&ecirc;n một nh&agrave; m&aacute;y hiện đại đem lại sự thịnh vượng v&agrave; văn minh cho nh&acirc;n d&acirc;n địa phương.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-16-16-08-2016-2.jpg\" /></p>\r\n\r\n<p><br />\r\nC&aacute;c chuy&ecirc;n gia đang hướng dẫn lắp đặt hệ thống m&aacute;y m&oacute;c thiết bị. Chất lượng bột Barite sau n&agrave;y đang được h&igrave;nh th&agrave;nh từ ch&iacute;nh những đ&ocirc;i b&agrave;n tay v&agrave; tr&iacute; &oacute;c của c&aacute;c bạn đấy. Xin ghi nhớ c&ocirc;ng lao của c&aacute;c bạn.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-20-16-08-2016-3.jpg\" /></p>\r\n\r\n<p><br />\r\nHệ thống m&aacute;y Zenith MTW138 đ&atilde; được lắp đặt xong. Ch&uacute;ng t&ocirc;i đ&atilde; sẵn s&agrave;ng cung cấp cho thị trường thế giới sản phẩm bột Barite API mang thương hiệu Cộng ho&agrave; d&acirc;n chủ nh&acirc;n d&acirc;n (CHDCND) L&agrave;o. Ch&uacute;ng t&ocirc;i khẳng định sản phẩm của m&igrave;nh c&oacute; chất lượng thoả m&atilde;n c&aacute;c y&ecirc;u cầu khắt khe của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-20-16-08-2016-4.jpg\" /></p>\r\n\r\n<p><br />\r\nChụp ảnh lưu niệm với c&aacute;c c&aacute;n bộ cục mỏ - Bộ Mỏ Năng Lượng, nước CHDCND L&agrave;o về kiểm tra tiến độ x&acirc;y dựng nh&agrave; m&aacute;y.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-19-16-08-2016-5.jpg\" /></p>\r\n\r\n<p><br />\r\nQuang cảnh nh&agrave; m&aacute;y đang trong qu&aacute; tr&igrave;nh x&acirc;y dựng. Chỉ v&agrave;i th&aacute;ng nữa th&ocirc;i bạn sẽ ngạc nhi&ecirc;n khi thấy n&oacute; Xanh - Sạch &ndash; Đẹp. Ch&uacute;ng t&ocirc;i đ&atilde; nhận được rất nhiều lời khen ngợi của c&aacute;c đo&agrave;n kiểm tra. C&ocirc;ng ty sẽ cố gắng x&acirc;y dựng một m&ocirc; h&igrave;nh kiểu mẫu như lời dặn d&ograve; v&agrave; trao tr&aacute;ch nhiệm của ph&oacute; tỉnh trưởng tỉnh Khăm Muộn trong cuộc họp ng&agrave;y 20 th&aacute;ng 05 năm 2016</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-18-16-08-2016-6.jpg\" /></p>\r\n\r\n<p><br />\r\nNh&agrave; chỉ huy khu vực khai th&aacute;c quặng Bartie tại cụm bản Noong Ma, mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o. D&ugrave; ở v&ugrave;ng s&acirc;u nhưng c&ocirc;ng ty cũng cố gắng đảm bảo việc ăn uống sinh hoạt tốt nhất c&oacute; thể cho c&aacute;n bộ c&ocirc;ng nh&acirc;n vi&ecirc;n. V&igrave; l&agrave; khởi đầu n&ecirc;n mong rằng mọi người h&atilde;y th&ocirc;ng cảm cho những kh&oacute; khăn của c&ocirc;ng ty.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-19-16-08-2016-7.jpg\" /></p>\r\n\r\n<p><br />\r\nNhững vi&ecirc;n quặng đầu ti&ecirc;n mở ra một giai đoạn đ&aacute;ng tự h&agrave;o của c&ocirc;ng ty. Chi em c&ocirc;ng nh&acirc;n địa phương khẳng định vừa l&ograve;ng với điều kiện l&agrave;m việc v&agrave; chế độ đ&atilde;i ngộ của c&ocirc;ng ty. Mọi người mong được gắn b&oacute; l&acirc;u d&agrave;i với c&ocirc;ng việc n&agrave;y.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-26-16-08-2016-8.jpg\" /></p>\r\n', '06-41-16-16-08-2016-2.jpg', 'a:8:{i:0;s:25:\"06-40-46-16-08-2016-1.jpg\";i:1;s:25:\"06-41-16-16-08-2016-2.jpg\";i:2;s:25:\"06-41-20-16-08-2016-3.jpg\";i:3;s:25:\"06-41-20-16-08-2016-4.jpg\";i:4;s:25:\"06-41-19-16-08-2016-5.jpg\";i:5;s:25:\"06-41-19-16-08-2016-7.jpg\";i:6;s:25:\"06-41-18-16-08-2016-6.jpg\";i:7;s:25:\"06-41-26-16-08-2016-8.jpg\";}', '17', '14', '1', '1', '0', null, '1471304446', '', '', '', '4', 'Construction process of mining and processing plant', '', '<p>&nbsp;We are moving machinery through XeeBangPhai rushed to build the plant. Too hard for a trip, but also very happy when the whole material and equipment were safely gathered in the factory building.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-40-46-16-08-2016-1.jpg\" /></p>\r\n\r\n<p><br />\r\nThe factory frame of Barite processing plant in terms of Noongma, visualizing Boualapha District, Kham Muon province. Between wild places and impoverished and will grow a modern factory to bring prosperity and civilization to the local population.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-16-16-08-2016-2.jpg\" /></p>\r\n\r\n<p><br />\r\nThe experts are guided installation of machinery and equipment. Barite powder latter quality being formed from the hands and the minds of you. Please remember your merits.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-20-16-08-2016-3.jpg\" /></p>\r\n\r\n<p><br />\r\nSystem MTW138 has been installed. We&#39;re ready to give world markets API Barite powder products branded People&#39;s Democratic Republic (PDR) PDR. We reaffirmed our product quality meets the demanding requirements of our customers.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-20-16-08-2016-4.jpg\" /></p>\r\n\r\n<p>Take photo with mine personnel department - Ministry of Mining and Energy, Laos check progress on construction of the plant.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-19-16-08-2016-5.jpg\" /></p>\r\n\r\n<p><br />\r\nThe scenery is in the process plant building. Only a few months left you will be surprised to see it Green - Clean - Nice. We have received a lot of praise of the inspection team. The company will try to build such a model a thoughtful notes and given the responsibility of vice governor Kham Muon province in the meeting of 20 May 05, 2016</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-18-16-08-2016-6.jpg\" /></p>\r\n\r\n<p>Center rooms Bartie ore mining area in terms of Noong Ma, Muong Boualapha District, Kham Muon province, Laos. Whether in deep but the company also tried to ensure that the best diet possible activities for the workers and employees. Since the beginning so let&#39;s hope that people sympathize with the difficulties of the company.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-19-16-08-2016-7.jpg\" /></p>\r\n\r\n<p><br />\r\nThe first ore park opened a proud stage of the company. The women confirmed local workers satisfied with the working conditions and remuneration of the company. People look forward to long-term commitment to this work.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/30/700x700/06-41-26-16-08-2016-8.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('31', '1', 'Con đường phía trước luôn luôn rộng mở dù có những khúc quanh', 'con-duong-phia-truoc-luon-luon-rong-mo-du-co-nhung-khuc-quanh', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/31/700x700/02-19-43-17-08-2016-1.jpg\" /></p>\r\n', '02-19-43-17-08-2016-1.jpg', 'a:1:{i:0;s:25:\"02-19-43-17-08-2016-1.jpg\";}', '17', '21', '0', '1', '0', null, '1471375183', '', '', '', '1', 'The way forward is always open despite the windings', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/31/700x700/02-19-43-17-08-2016-1.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('32', '1', 'Sự êm đềm cho ta sức mạnh và niềm tin', 'su-em-dem-cho-ta-suc-manh-va-niem-tin', '', '<!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>EN-US</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n  <m:mathPr>\r\n   <m:mathFont m:val=\"Cambria Math\"/>\r\n   <m:brkBin m:val=\"before\"/>\r\n   <m:brkBinSub m:val=\"--\"/>\r\n   <m:smallFrac m:val=\"off\"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val=\"0\"/>\r\n   <m:rMargin m:val=\"0\"/>\r\n   <m:defJc m:val=\"centerGroup\"/>\r\n   <m:wrapIndent m:val=\"1440\"/>\r\n   <m:intLim m:val=\"subSup\"/>\r\n   <m:naryLim m:val=\"undOvr\"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState=\"false\" DefUnhideWhenUsed=\"true\"\r\n  DefSemiHidden=\"true\" DefQFormat=\"false\" DefPriority=\"99\"\r\n  LatentStyleCount=\"267\">\r\n  <w:LsdException Locked=\"false\" Priority=\"0\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Normal\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"heading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"9\" QFormat=\"true\" Name=\"heading 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 7\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 8\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" Name=\"toc 9\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"35\" QFormat=\"true\" Name=\"caption\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"10\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" Name=\"Default Paragraph Font\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"11\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtitle\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"22\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Strong\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"20\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"59\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Table Grid\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Placeholder Text\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"1\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"No Spacing\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" UnhideWhenUsed=\"false\" Name=\"Revision\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"34\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"List Paragraph\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"29\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"30\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Quote\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 1\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 2\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 3\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 4\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 5\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"60\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"61\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"62\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Light Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"63\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"64\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Shading 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"65\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"66\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium List 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"67\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 1 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"68\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 2 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"69\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Medium Grid 3 Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"70\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Dark List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"71\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Shading Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"72\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful List Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"73\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" Name=\"Colorful Grid Accent 6\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"19\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"21\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Emphasis\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"31\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Subtle Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"32\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Intense Reference\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"33\" SemiHidden=\"false\"\r\n   UnhideWhenUsed=\"false\" QFormat=\"true\" Name=\"Book Title\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"37\" Name=\"Bibliography\"/>\r\n  <w:LsdException Locked=\"false\" Priority=\"39\" QFormat=\"true\" Name=\"TOC Heading\"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:\"Table Normal\";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:\"\";\r\n	mso-padding-alt:0in 5.4pt 0in 5.4pt;\r\n	mso-para-margin:0in;\r\n	mso-para-margin-bottom:.0001pt;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:\"Calibri\",\"sans-serif\";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-fareast-font-family:\"Times New Roman\";\r\n	mso-fareast-theme-font:minor-fareast;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;\r\n	mso-bidi-font-family:\"Times New Roman\";\r\n	mso-bidi-theme-font:minor-bidi;}\r\n</style>\r\n<![endif]-->\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/32/700x700/02-20-38-17-08-2016-2.jpg\" /></p>\r\n', '02-20-38-17-08-2016-2.jpg', 'a:1:{i:0;s:25:\"02-20-38-17-08-2016-2.jpg\";}', '17', '21', '0', '1', '0', null, '1471375238', '', '', '', '2', 'The peaceful for us strength and confidence', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/32/700x700/02-20-38-17-08-2016-2.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('33', '1', 'Để thành công phải biết song hành cùng đối tác', 'de-thanh-cong-phai-biet-song-hanh-cung-doi-tac', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/33/700x700/02-22-00-17-08-2016-3.jpg\" /></p>\r\n', '02-22-00-17-08-2016-3.jpg', 'a:1:{i:0;s:25:\"02-22-00-17-08-2016-3.jpg\";}', '17', '21', '0', '1', '0', null, '1471375292', '', '', '', '3', 'To successfully to accompany partner know', '', '<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/33/700x700/02-22-00-17-08-2016-3.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('34', '1', 'Lễ ký kết hợp đồng khai thác chế biến quặng Barite với chính phủ Lào', 'le-ky-ket-hop-dong-khai-thac-che-bien-quang-barite-voi-chinh-phu-lao', '', '<p>Ng&agrave;y 16 th&aacute;ng 01 năm 2014, C&ocirc;ng ty TNHH Đầu tư Quang Trung đ&atilde; k&yacute; kết hợp đồng khai th&aacute;c v&agrave; chế biến kho&aacute;ng sản Barite với ch&iacute;nh phủ nước CHDCND L&agrave;o.<br />\r\nTheo nội dung hợp đồng, c&ocirc;ng ty TNHH Đầu tư Quang Trung đầu tư cho dự &aacute;n mức vốn l&agrave; 3.500.000 USD (tương đương 28 tỷ Kip) để x&acirc;y dựng&nbsp; một nh&agrave; m&aacute;y chế biến bột Barite rộng 2,5 ha v&agrave; khai th&aacute;c quặng Barite trong v&ugrave;ng mỏ nguy&ecirc;n liệu rộng 17,48km2.<br />\r\nDự &aacute;n c&oacute; khả năng cung cấp cho thị trường thế giới nguồn quặng v&agrave; bột Barite với sản lượng b&igrave;nh qu&acirc;n từ 60.000 đến 80.000 tấn/năm trong thời hạn 12 năm.<br />\r\nDưới đ&acirc;y l&agrave; một số h&igrave;nh ảnh trong buổi lễ k&yacute; kết hợp đồng:</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/11-54-25-17-08-2016-1kyhd.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/11-55-04-17-08-2016-2.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/11-55-21-17-08-2016-3.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/05-45-51-17-08-2016-4.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/05-46-01-17-08-2016-5.jpg\" /></p>\r\n', '05-45-51-17-08-2016-4.jpg', 'a:5:{i:0;s:29:\"11-54-25-17-08-2016-1kyhd.jpg\";i:1;s:25:\"11-55-04-17-08-2016-2.jpg\";i:2;s:25:\"11-55-21-17-08-2016-3.jpg\";i:3;s:25:\"05-46-01-17-08-2016-5.jpg\";i:4;s:25:\"05-45-51-17-08-2016-4.jpg\";}', '17', '26', '1', '1', '0', null, '1471387551', '', '', '', '1', 'The contract signing ceremony exploitation Barite ore processing with the Lao government', '', '<p>01 May 16, 2014, Investment Company Limited Quang Trung signed contract mining and processing of minerals Barite with Laos government.<br />\r\nAccording to the contents of the contract , the Investment Company Limited Quang Trung investment for the project is $ 3,500,000 capital (equivalent to 28 billion Kip ) to build a processing plant Barite powder measuring 2.5 hectares and exploitation Barite ore in the mine area broad 17,48km2 materials .<br />\r\nThe project has the ability to provide the world market with ores and Barite powder yields an average of 60,000 to 80,000 tons/year within 12 years .<br />\r\nHere are some photos of the contract signing ceremony:</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/11-54-25-17-08-2016-1kyhd.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/11-55-04-17-08-2016-2.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/11-55-21-17-08-2016-3.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/05-45-51-17-08-2016-4.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/34/700x700/05-46-01-17-08-2016-5.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('35', '1', 'Đại diện pháp nhân của công ty', 'dai-dien-phap-nhan-cua-cong-ty', '', '<p>Họ v&agrave; t&ecirc;n : &Ocirc;ng. TRẦN QUANG TUẤN<br />\r\nChức danh: Gi&aacute;m đốc, ki&ecirc;m chủ tịch hội đồng th&agrave;nh vi&ecirc;n<br />\r\nSinh ng&agrave;y 20/08/1962&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Quốc tịch: Việt nam</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/35/700x700/05-48-25-17-08-2016-1.jpg\" /></p>\r\n', '05-48-25-17-08-2016-1.jpg', 'a:1:{i:0;s:25:\"05-48-25-17-08-2016-1.jpg\";}', '17', '25', '0', '1', '0', null, '1471387705', '', '', '', '0', 'The legal representative of the company', '', '<p>Name: Mr. TRAN QUANG TUAN<br />\r\nTitle: Chairman of members concurrently Director<br />\r\nBorn: 08/20/1962 &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Nationality: Vietnamese</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/35/700x700/05-48-25-17-08-2016-1.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('36', '1', 'Các đơn vị trực thuộc', 'cac-don-vi-truc-thuoc', '', '<p>C&ocirc;ng ty c&oacute; trụ sở tại thị trấn y&ecirc;n vi&ecirc;n - huyện gia l&acirc;m &ndash; tp h&agrave; nội, nước chxhcn việt nam. Sở hữu 100% 2 đơn vị trực thuộc :<br />\r\n+ C&ocirc;ng ty TNHH MTV Barite quang trung L&agrave;o ( c&oacute; trụ sở tại bản Thakheckang, mường Thakhec, tỉnh Khăm Muộn).</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/36/700x700/12-12-31-18-08-2016-2.jpg\" /></p>\r\n\r\n<p>C&ocirc;ng ty TNHH MTV Barite Quang Trung L&agrave;o l&agrave; chủ sở hữu 100 % nh&agrave; m&aacute;y chế biến Barite v&agrave; khu mỏ quặng Bartie nguy&ecirc;n liệu (rộng 17,48 km2)&nbsp; tại cụm bản Noong Ma, mường Bualapha, tỉnh Khăm muộn.</p>\r\n\r\n<p><br />\r\n+ Chi nh&aacute;nh tại tỉnh Hưng Y&ecirc;n - Việt nam; phụ tr&aacute;ch dự &aacute;n khai th&aacute;c c&aacute;t x&acirc;y dựng v&agrave; c&aacute;t san lấp tại x&atilde; T&acirc;n Hưng, huyện Ti&ecirc;n Lữ, tỉnh Hưng Y&ecirc;n.</p>\r\n', '12-12-31-18-08-2016-2.jpg', 'a:2:{i:0;s:31:\"05-50-18-17-08-2016-anh-cty.jpg\";i:1;s:25:\"12-12-31-18-08-2016-2.jpg\";}', '17', '25', '0', '1', '0', null, '1471387818', '', '', '', '0', 'The attached units', '', '<p>The headquarter company is located in the Yen Vien town - Gia Lam District - Hanoi, Socialist Republic of Vietnam with 100% owned and two subsidiary units:<br />\r\n+ Optical Company Limited Barite central Laos (based in the Thakheckang, visualizing Thakhec, Kham Muon province)</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/36/700x700/12-12-31-18-08-2016-2.jpg\" /></p>\r\n\r\n<p>Company Limited Quang Trung Lao Barite is 100% owner of the processing plant and mine ore Barite material Bartie (width 17.48 km2) in terms of Noong Ma, Muong Boualapha District, Kham province late.</p>\r\n\r\n<p><br />\r\n+ Branch in Hung Yen - Vietnam; in charge of the project construction sand mining and sand reclamation Tan Hung commune, Tien Lu District, Hung Yen Province.</p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('37', '1', 'Lĩnh vực hoạt động', 'linh-vuc-hoat-dong', '', '<p>+ Bu&ocirc;n b&aacute;n, khai th&aacute;c, chế biến, tận thu kho&aacute;ng sản.<br />\r\n+ Thi c&ocirc;ng, x&acirc;y dựng c&aacute;c c&ocirc;ng tr&igrave;nh d&acirc;n dụng, c&ocirc;ng nghiệp, giao th&ocirc;ng, thuỷ lợi, thuỷ điện v&agrave; san lấp mặt bằng.<br />\r\n+ Dịch vụ t&igrave;m kiếm thăm d&ograve; kho&aacute;ng sản.<br />\r\n+ Tư vấn mua b&aacute;n, lắp đặt c&aacute;c sản phẩm viễn th&ocirc;ng v&agrave; tự động ho&aacute;.<br />\r\n+ Dịch vụ vận tải v&agrave; bốc xếp h&agrave;ng ho&aacute;.<br />\r\n+ Dịch vụ nghi&ecirc;n cứu v&agrave; bu&ocirc;n b&aacute;n vật tư thiết bị về c&ocirc;ng nghệ m&ocirc;i trường<br />\r\n+ Bu&ocirc;n b&aacute;n m&aacute;y m&oacute;c, vật tư thiết bị, phụ t&ugrave;ng, nguy&ecirc;n liệu trong lĩnh vực c&ocirc;ng nghiệp, n&ocirc;ng nghiệp, x&acirc;y dựng.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/37/700x700/12-15-26-18-08-2016-khai-thc-dat-3.jpg\" /></p>\r\n', '05-52-48-17-08-2016-ca2-500x280.png', 'a:2:{i:0;s:35:\"05-52-48-17-08-2016-ca2-500x280.png\";i:1;s:38:\"12-15-26-18-08-2016-khai-thc-dat-3.jpg\";}', '17', '25', '0', '1', '0', null, '1471387968', '', '', '', '0', 'Scope of work', '', '<p>+ Trade, mining, processing, artisanal.<br />\r\n+ Construction, the construction of residential, industrial, transportation, irrigation, hydropower and leveling.<br />\r\n+ Service for mineral exploration.<br />\r\n+ Consulting purchase and installation of telecommunications products and automation.<br />\r\n+ Transport services and cargo handling.<br />\r\n+ Services Research and trafficking of materials and equipment for environmental technology<br />\r\n+ Trading in machinery, materials, equipment, spare parts and raw materials in the fields of industry, agriculture and construction.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/37/700x700/12-15-26-18-08-2016-khai-thc-dat-3.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('38', '1', 'Quan hệ với chính quyền và nhân dân địa phương', 'quan-he-voi-chinh-quyen-va-nhan-dan-dia-phuong', '', '<p>Gi&aacute;m đốc c&ocirc;ng ty c&ugrave;ng c&aacute;c chuy&ecirc;n gia kinh tế khảo s&aacute;t cửa khẩu v&agrave; tuyến đường vận chuyển h&agrave;ng ho&aacute; để đảm bảo t&iacute;nh khả thi v&agrave; hiệu quả kinh tế của dự &aacute;n.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-23-17-08-2016-1.jpg\" /></p>\r\n\r\n<p>Buổi l&agrave;m việc giới thiệu v&agrave; lấy &yacute; kiến về dự &aacute;n Barite với c&aacute;n bộ v&agrave; nh&acirc;n d&acirc;n địa phương tại cụm bản Noong Ma, mường Bualapha, tỉnh Khăm Muộn để đảm bảo t&iacute;nh đồng thuận trong việc triển khai dự &aacute;n.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-33-17-08-2016-2.jpg\" /></p>\r\n\r\n<p>cuộc họp giữa c&ocirc;ng ty với l&atilde;nh đạo v&agrave; c&aacute;c cơ quan chức năng tỉnh Khăm Muộn, nước CHDCND L&agrave;o về chương tr&igrave;nh triển khai dự &aacute;n.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-43-17-08-2016-3.jpg\" /></p>\r\n\r\n<p>Tham dự một đ&aacute;m cưới L&agrave;o - Việt tại tỉnh Xi&ecirc;ng Khoảng, nước CHDCND L&agrave;o.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-53-17-08-2016-4.jpg\" /></p>\r\n', '05-54-23-17-08-2016-1.jpg', 'a:4:{i:0;s:25:\"05-54-23-17-08-2016-1.jpg\";i:1;s:25:\"05-54-33-17-08-2016-2.jpg\";i:2;s:25:\"05-54-43-17-08-2016-3.jpg\";i:3;s:25:\"05-54-53-17-08-2016-4.jpg\";}', '17', '23', '0', '1', '0', null, '1471388063', '', '', '', '1', 'Relations with governments and local people', '', '<p>Director of the company with economic experts surveyed gate and road transport of goods to ensure the feasibility and economic efficiency of the project.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-23-17-08-2016-1.jpg\" /></p>\r\n\r\n<p>The introduced and consulted on projects Barite with staff and local residents in terms of Noong Ma, Muong Boualapha District, Kham Muon province to ensure consensus in the implementation of the project.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-33-17-08-2016-2.jpg\" /></p>\r\n\r\n<p>The meetings between company leaders and authorities Kham Muon province, Laos on the project program.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-43-17-08-2016-3.jpg\" /></p>\r\n\r\n<p>Attend a wedding Laos - Vietnam in Xieng Khouang Province, Laos.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/38/700x700/05-54-53-17-08-2016-4.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('39', '1', 'Công ty chào bán', 'cong-ty-chao-ban', '', '<p>C&ocirc;ng ty xin tr&acirc;n trọng c&aacute;m ơn sự quan t&acirc;m của qu&yacute; kh&aacute;ch h&agrave;ng đối với c&aacute;c sản phẩm ch&iacute;nh của c&ocirc;ng ty. C&ocirc;ng ty xin khẳng định sẽ đ&aacute;p ứng một c&aacute;ch tốt nhất trong khả năng c&oacute; thể để l&agrave;m vừa l&ograve;ng kh&aacute;ch h&agrave;ng.<br />\r\nC&ocirc;ng ty rất mong c&oacute; được sự li&ecirc;n hệ của qu&yacute; kh&aacute;ch h&agrave;ng để hai b&ecirc;n tiến h&agrave;nh b&agrave;n bạc, trao đổi thống nhất rồi đi đến hợp t&aacute;c, k&yacute; kết hợp đồng.</p>\r\n', '', null, '17', '30', '0', '1', '0', null, '1471388601', '', '', '', '0', 'The company would like to offer', '', '<p>The Company would like to thank the customers&rsquo; attention to the company&#39;s main products. The company would assert to meet customer&rsquo;s requirement in our best efforts.<br />\r\nThe company would expect to obtain customers&rsquo;s contact so that two parties are able to discuss, exchange and collaborate then sign the contract ultimately.</p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('40', '1', 'Công ty TNHH MTV Barite Quang Trung Lào trực thuộc công ty TNHH Đầu tư Quang Trung có nhu cầu tiêu thụ vỏ bao Big Bag', 'cong-ty-tnhh-mtv-barite-quang-trung-lao-truc-thuoc-cong-ty-tnhh-dau-tu-quang-trung-co-nhu-cau-tieu-thu-vo-bao-big-bag', '', '<p>C&ocirc;ng ty TNHH MTV Barite Quang Trung L&agrave;o trực thuộc c&ocirc;ng ty TNHH Đầu tư Quang Trung c&oacute; nhu cầu ti&ecirc;u thụ vỏ bao Big Bag loại 1,5 tấn/bao với số lượng b&igrave;nh quần khoảng 4.000 vỏ bao/th&aacute;ng để chứa bột Barite.<br />\r\nVỏ bao c&oacute; chất lượng v&agrave; mẫu m&atilde; theo ti&ecirc;u chuẩn của c&ocirc;ng ty để sử dụng trong qu&aacute; tr&igrave;nh sản xuất bột Barite. Ngo&agrave;i ra c&ocirc;ng ty cũng đặt những đơn h&agrave;ng kh&aacute;ch nhằm đ&aacute;p ứng y&ecirc;u cầu trong c&aacute;c đơn đặt h&agrave;ng.<br />\r\nC&ocirc;ng ty tr&acirc;n trọng k&iacute;nh mời c&aacute;c đơn vị c&oacute; khả năng đ&aacute;p ứng v&agrave; nhu cầu cung cấp li&ecirc;n hệ với c&ocirc;ng ty để 2 b&ecirc;n thương thảo k&yacute; kết hợp đồng mua b&aacute;n.</p>\r\n', '', null, '17', '31', '0', '1', '0', null, '1471389086', '', '', '', '1', 'Barite Company Limited Quang Trung Lao operating under the Investment Company Limited Quang Trung would like to consume Big Bag', '', '<p>Barite Company Limited Quang Trung Lao operating under the Investment Company Limited Quang Trung would like to consume Big Bag packs (size 1.5 ton / a bag) with average consumption packs per month as 4,000 packs / month to contain Barite powder .<br />\r\nQuality and design&rsquo;s sacks is relevant to the company standards for use in the manufacturing process of Barite powder. Additionally, the company placed customized orders to meet distinctive/specific requirements.<br />\r\nOur company would like to invite partners who have the ability to response to our request. Partners are kindly required to provide your contact for our convenient colaberation.</p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('41', '1', 'Công ty TNHH Đầu tư Quang Trung có nhu cầu về vận tải đường biển', 'cong-ty-tnhh-dau-tu-quang-trung-co-nhu-cau-ve-van-tai-duong-bien', '', '<p>C&ocirc;ng ty TNHH Đầu tư Quang Trung c&oacute; nhu cầu về vận tải đường biển đối với mặt h&agrave;ng quặng v&agrave; bột Barite. Điểm giao h&agrave;ng nằm trong khu vực địa phận cảng H&ograve;n La, tỉnh Quảng B&igrave;nh.<br />\r\nC&ocirc;ng ty tr&acirc;n trọng k&iacute;nh mời c&aacute;c đơn vị c&oacute; nhu cầu v&agrave; khả năng đ&aacute;p ứng li&ecirc;n hệ với c&ocirc;ng ty để 2 b&ecirc;n c&oacute; thể trở th&agrave;nh đối t&aacute;c tin cậy v&agrave; l&acirc;u d&agrave;i.</p>\r\n', '', null, '17', '31', '0', '1', '0', null, '1471389202', '', '', '', '0', 'Investment Company Limited Quang Trung would like to demands maritime transportation service for goods Barite ore and powder', '', '<p>Investment Company Limited Quang Trung would like to demands maritime transportation service for goods Barite ore and powder. Delivery points are located in the territory of Hon La, Quang Binh province.<br />\r\nCompany invites partners who have needs and ability to respond to contact the company to build up a long-term business relationship.</p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('44', '1', 'Các hoạt động khác', 'cac-hoat-dong-khac', '', '<p>Đất nước L&agrave;o xinh đẹp</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-23-17-08-2016-1dat-nuoc-lao-xinh-dep.jpg\" /></p>\r\n\r\n<p>Đ&ecirc;m mekong tại đất nước L&agrave;o</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-45-17-08-2016-2dem-mekong-tai-nuoc-lao-xinh-dep.jpg\" /></p>\r\n\r\n<p>Tham dự một đ&aacute;m cưới truyền thống tại L&agrave;o.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-46-17-08-2016-3du-dam-cuoi-lao.jpg\" /></p>\r\n\r\n<p>Giữa c&aacute;nh đồng chum</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-48-17-08-2016-4giua-canh-dong-chum.jpg\" /></p>\r\n\r\n<p>M&uacute;a Năm v&ocirc;ng</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-50-17-08-2016-5mua-namvong.jpg\" /></p>\r\n\r\n<p>Quảng trường suvanuvong - cố đ&ocirc; Luangpabang</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-43-17-08-2016-6quang-truong-suvanuvong-co-do-luongprabang.jpg\" /></p>\r\n\r\n<p>Tặng qu&agrave; cho cục mỏ - bộ mỏ năng lượng nước CHDCND L&agrave;o.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-45-17-08-2016-7tang-qua-cho-cuc-mo-bo-mo-nang-luong-nuoc-chdcnd-lao.jpg\" /></p>\r\n\r\n<p>Thăm c&aacute;nh đồng chum &ndash; xi&ecirc;ng khoảng.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-44-17-08-2016-8tham-canh-dong-chum-xiengkhoang.jpg\" /></p>\r\n\r\n<p>Thăm đồn bi&ecirc;n ph&ograve;ng cửa khầu L&agrave;o.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-48-40-17-08-2016-9tham-don-bien-phong-cua-khau-lao.jpg\" /></p>\r\n\r\n<p>Thăm mỏ Barite Tuy&ecirc;n Quang.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-49-16-17-08-2016-10tham-mo-barite-tuyen-quang.jpg\" /></p>\r\n\r\n<p>Thăm xưởng sản xuất Barite tại Tuy&ecirc;n Quang - Việt Nam.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-49-21-17-08-2016-11tham-xuong-san-xuat-barite.jpg\" /></p>\r\n', '10-45-23-17-08-2016-1dat-nuoc-lao-xinh-dep.jpg', 'a:11:{i:0;s:46:\"10-45-23-17-08-2016-1dat-nuoc-lao-xinh-dep.jpg\";i:1;s:57:\"10-45-45-17-08-2016-2dem-mekong-tai-nuoc-lao-xinh-dep.jpg\";i:2;s:40:\"10-45-46-17-08-2016-3du-dam-cuoi-lao.jpg\";i:3;s:44:\"10-45-48-17-08-2016-4giua-canh-dong-chum.jpg\";i:4;s:36:\"10-45-50-17-08-2016-5mua-namvong.jpg\";i:5;s:67:\"10-45-43-17-08-2016-6quang-truong-suvanuvong-co-do-luongprabang.jpg\";i:6;s:77:\"10-45-45-17-08-2016-7tang-qua-cho-cuc-mo-bo-mo-nang-luong-nuoc-chdcnd-lao.jpg\";i:7;s:56:\"10-45-44-17-08-2016-8tham-canh-dong-chum-xiengkhoang.jpg\";i:8;s:57:\"10-48-40-17-08-2016-9tham-don-bien-phong-cua-khau-lao.jpg\";i:9;s:52:\"10-49-16-17-08-2016-10tham-mo-barite-tuyen-quang.jpg\";i:10;s:52:\"10-49-21-17-08-2016-11tham-xuong-san-xuat-barite.jpg\";}', '17', '16', '0', '1', '0', null, '1471448723', '', '', '', '0', 'Other activities', '', '<p>Laos beautiful</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-23-17-08-2016-1dat-nuoc-lao-xinh-dep.jpg\" /></p>\r\n\r\n<p>Mekong night in Laos</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-45-17-08-2016-2dem-mekong-tai-nuoc-lao-xinh-dep.jpg\" /></p>\r\n\r\n<p>Attend a traditional wedding in Laos.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-46-17-08-2016-3du-dam-cuoi-lao.jpg\" /></p>\r\n\r\n<p>Between fields chum</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-48-17-08-2016-4giua-canh-dong-chum.jpg\" /></p>\r\n\r\n<p>Dance In Hura</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-50-17-08-2016-5mua-namvong.jpg\" /></p>\r\n\r\n<p>Suvanuvong Square - the ancient capital of Luangpabang</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-43-17-08-2016-6quang-truong-suvanuvong-co-do-luongprabang.jpg\" /></p>\r\n\r\n<p>Giving gifts to local mining - the mining and energy Laos.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-45-17-08-2016-7tang-qua-cho-cuc-mo-bo-mo-nang-luong-nuoc-chdcnd-lao.jpg\" /></p>\r\n\r\n<p>Visit chum field - diagonal approx.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-45-44-17-08-2016-8tham-canh-dong-chum-xiengkhoang.jpg\" /></p>\r\n\r\n<p>Visit Laos border guard station.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-48-40-17-08-2016-9tham-don-bien-phong-cua-khau-lao.jpg\" /></p>\r\n\r\n<p>Visit Barite mines in Tuyen Quang.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-49-16-17-08-2016-10tham-mo-barite-tuyen-quang.jpg\" /></p>\r\n\r\n<p>Barite visit our factory in Tuyen Quang - Vietnam.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/44/700x700/10-49-21-17-08-2016-11tham-xuong-san-xuat-barite.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('45', '1', 'Xây dựng nhà máy', 'xay-dung-nha-may', '', '<p>Căn cứ v&agrave;o hợp đồng đ&atilde; k&yacute; kết giữa c&ocirc;ng ty v&agrave; Ch&iacute;nh phủ nước CHDCND L&agrave;o ng&agrave;y 16 th&aacute;ng 01 năm 2014. C&ocirc;ng ty đ&atilde; tiến h&agrave;nh x&acirc;y dựng một nh&agrave; m&aacute;y chế biến bột Barite tr&ecirc;n diện t&iacute;ch 2,5ha tại cụm bản Noong Ma, mường Bualapha tỉnh khăm muộn.<br />\r\nNh&agrave; m&aacute;y c&oacute; khả năng sản xuất từ 60.000 đến 80.000 tấn bột Barite API/ năm. Ngo&agrave;i ra, nh&agrave; m&aacute;y sẵn s&agrave;ng đ&aacute;p ứng c&aacute;c đơn h&agrave;ng ri&ecirc;ng lẻ sản xuất bột Barite trắng, h&agrave;m lượng cao để l&agrave;m phụ gia c&ocirc;ng nghiệp trong lĩnh vực sản xuất sơn, nhựa&hellip;<br />\r\nĐể c&oacute; đủ nguy&ecirc;n liệu sản xuất, nh&agrave; m&aacute;y c&oacute; một ph&acirc;n xưởng khai th&aacute;c quặng Barite trong khu mỏ Barite của c&ocirc;ng ty (diện t&iacute;ch 17,48&nbsp; km2) được c&aacute;c chuy&ecirc;n gia v&agrave; kh&aacute;ch h&agrave;ng đ&aacute;nh gi&aacute; gi&agrave;u tiềm năng.<br />\r\nTrong qu&aacute; tr&igrave;nh x&acirc;y dựng nh&agrave; m&aacute;y cũng như hoạt động sản xuất sau n&agrave;y, c&ocirc;ng ty lu&ocirc;n lu&ocirc;n ch&uacute; trọng ti&ecirc;u ch&iacute; xanh - sạch - đẹp v&agrave; an sinh x&atilde; hội.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/45/700x700/12-01-47-18-08-2016-6.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/45/700x700/12-01-47-18-08-2016-8.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/45/700x700/12-01-47-18-08-2016-7.jpg\" /></p>\r\n', '12-01-47-18-08-2016-8.jpg', 'a:3:{i:0;s:25:\"12-01-47-18-08-2016-8.jpg\";i:1;s:25:\"12-01-47-18-08-2016-6.jpg\";i:2;s:25:\"12-01-47-18-08-2016-7.jpg\";}', '17', '26', '0', '1', '0', null, '1471453245', '', '', '', '0', 'Process Build factories', '', '<p>Based on the contract signed between the company and the Government of the Lao People&#39;s Democratic Republic on 16 May 01, 2014. The company undertook to build a processing plant on an area of 2.5 ha Barite powder in terms of Noong Ma, Boualapha District Muong Kham Muon province.<br />\r\nThe plant has capacity to produce 60,000 to 80,000 tonnes from API Barite powder/ year. In addition, the plant is ready to meet the individual production line Barite powder white, high levels for industrial additives in the manufacture of paints, plastics...<br />\r\nTo have enough materials for production, the factory has a workshop Barite ore Barite mine in the company (17.48 km2 area) are professionals and clients assess potential.<br />\r\nIn the process plant construction as well as manufacturing operations later, the company has always focused on the criteria of green - clean - nice and social security.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/45/700x700/12-01-47-18-08-2016-6.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/45/700x700/12-01-47-18-08-2016-8.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/45/700x700/12-01-47-18-08-2016-7.jpg\" /></p>\r\n', '', '', '');
INSERT INTO `w_news` VALUES ('46', '1', 'Vận chuyển thiết bị và xây dựng cơ sở hạ tầng', 'van-chuyen-thiet-bi-va-xay-dung-co-so-ha-tang', '', '<p>Mặc d&ugrave; dự &aacute;n được triển khai ở v&ugrave;ng s&acirc;u nhưng c&ocirc;ng ty đ&atilde; triển khai th&agrave;nh c&ocirc;ng việc vận chuyển v&agrave; x&acirc;y dựng một nh&agrave; m&aacute;y hiện đại c&oacute; quy m&ocirc; tương đối lớn.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-05-05-18-08-2016-9.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-05-05-18-08-2016-10.jpg\" /></p>\r\n\r\n<p>Hạ tầng cơ sở phục vụ cho dự &aacute;n v&agrave; d&acirc;n sinh đ&atilde; được c&ocirc;ng ty&nbsp; sửa chữa, n&acirc;ng cấp l&agrave;m mới nhằm đảm bảo t&iacute;nh khả thi v&agrave; hiệu quả của dự &aacute;n cũng như g&oacute;p phần tham gia v&agrave;o việc ph&aacute;t triển kinh tế x&atilde; hội của địa phương.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-05-05-18-08-2016-11.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-04-49-18-08-2016-12.jpg\" /></p>\r\n', '12-05-05-18-08-2016-10.jpg', 'a:4:{i:0;s:26:\"12-04-49-18-08-2016-12.jpg\";i:1;s:26:\"12-05-05-18-08-2016-11.jpg\";i:2;s:25:\"12-05-05-18-08-2016-9.jpg\";i:3;s:26:\"12-05-05-18-08-2016-10.jpg\";}', '17', '26', '0', '1', '0', null, '1471453489', '', '', '', '0', 'Transporting equipment and building infrastructure', '', '<p>Although the project is implemented in the remote areas, but the company has successfully implemented the transport and building a modern factory with a relatively large scale.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-05-05-18-08-2016-9.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-05-05-18-08-2016-10.jpg\" /></p>\r\n\r\n<p>Infrastructure to serve the project and the people&#39;s welfare was the company repair and upgrade refresh to ensure the feasibility and effectiveness of the project as well as the participation in the socio-economic development of the local.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-05-05-18-08-2016-11.jpg\" /><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/46/700x700/12-04-49-18-08-2016-12.jpg\" /></p>\r\n', '', '', '');

-- ----------------------------
-- Table structure for w_product
-- ----------------------------
DROP TABLE IF EXISTS `w_product`;
CREATE TABLE `w_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `product_title` varchar(255) DEFAULT NULL,
  `product_title_alias` varchar(255) DEFAULT '',
  `product_desc_sort` text,
  `product_content` text,
  `product_image` varchar(255) DEFAULT NULL COMMENT 'ảnh đại diện của bài viết',
  `product_image_other` longtext COMMENT 'Lưu ảnh của bài viết',
  `product_type` tinyint(5) DEFAULT '1' COMMENT 'Kiểu tin',
  `product_category` int(11) DEFAULT NULL,
  `product_hot` int(11) DEFAULT NULL,
  `product_status` tinyint(5) DEFAULT NULL,
  `product_num` int(11) DEFAULT '0',
  `product_link` varchar(255) DEFAULT NULL,
  `product_create` int(11) DEFAULT NULL,
  `product_meta_title` varchar(255) DEFAULT NULL,
  `product_meta_keyword` text,
  `product_meta_description` text,
  `product_order` int(11) DEFAULT NULL,
  `product_title_en` varchar(255) DEFAULT NULL,
  `product_desc_sort_en` text,
  `product_content_en` longtext,
  `product_meta_title_en` varchar(255) DEFAULT NULL,
  `product_meta_keyword_en` text,
  `product_meta_description_en` text,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_product
-- ----------------------------
INSERT INTO `w_product` VALUES ('32', '1', 'Giới thiệu chung', 'gioi-thieu-chung', '', '<p>C&ocirc;ng ty đ&atilde; k&yacute; hợp đồng với ch&iacute;nh phủ L&agrave;o hợp đồng khai th&aacute;c v&agrave; chế biến bột Barite tại mường Bualapha, tỉnh Khăm Muộn, bao gồm :<br />\r\n+ Một nh&agrave; m&aacute;y chế biến Barite được x&acirc;y dựng tr&ecirc;n diện t&iacute;ch 2,5ha :</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/11-03-57-17-08-2016-1.jpg\" /></p>\r\n\r\n<p><br />\r\n+ Khu mỏ với diện t&iacute;ch 17,48 km2. Tổng trữ lượng địa chất &nbsp;được đ&aacute;nh gi&aacute; &nbsp;như bảng sau :&nbsp;</p>\r\n\r\n<p>Trữ lượng địa chất thăm d&ograve; to&agrave;n khu mỏ<br />\r\n1&nbsp;&nbsp; &nbsp;Tổng trữ lượng cấp 121&nbsp;&nbsp; &nbsp;572.969&nbsp;&nbsp; &nbsp;Tấn<br />\r\n2&nbsp;&nbsp; &nbsp;Tổng trữ lượng cấp 122&nbsp;&nbsp; &nbsp;384.756&nbsp;&nbsp; &nbsp;Tấn<br />\r\n3&nbsp;&nbsp; &nbsp;Tổng trữ lượng cấp t&agrave;i nguy&ecirc;n 333&nbsp;&nbsp; &nbsp;448.074&nbsp;&nbsp; &nbsp;Tấn<br />\r\nTổng trữ lượng địa chất to&agrave;n khu mỏ&nbsp;&nbsp; &nbsp;1.405.799&nbsp;&nbsp; &nbsp;Tấn</p>\r\n\r\n<p><em>Qu&aacute; tr&igrave;nh khai th&aacute;c tại khu mỏ</em></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/02-00-01-16-08-2016-2.jpg\" /></p>\r\n\r\n<p>V&agrave; chất lượng quặng đ&atilde; được ph&acirc;n t&iacute;ch c&oacute; kết quả như sau :</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/11-05-22-17-08-2016-4.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/11-05-22-17-08-2016-4.jpg\" /></p>\r\n\r\n<p>C&ocirc;ng ty c&oacute; khả năng đ&aacute;p ứng được c&aacute;c đơn h&agrave;ng c&oacute; tổng số lượng từ 60.000 đến 80.000 tấn bột v&agrave; quặng Barite /năm.</p>\r\n', '11-03-57-17-08-2016-1.jpg', 'a:4:{i:0;s:25:\"11-03-57-17-08-2016-1.jpg\";i:1;s:25:\"02-00-01-16-08-2016-2.jpg\";i:2;s:25:\"11-05-16-17-08-2016-3.jpg\";i:3;s:25:\"11-05-22-17-08-2016-4.jpg\";}', '22', '17', '0', '1', '0', null, '1471330663', 'Giới thiệu chung', 'Giới thiệu chung', 'Giới thiệu chung', '1', 'General introduction', '', '<p>The company has signed a contract with the Lao government mining and processing in Muong Boualapha District Barite powder , Kham Muon province , including :<br />\r\n+ A Barite processing plant was built on an area of 2.5 ha</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/11-03-57-17-08-2016-1.jpg\" /></p>\r\n\r\n<p>+ The mine with an area of 17.48 km2 . The total geological reserves are evaluated as the following table :</p>\r\n\r\n<p>Geological reserves of the entire mine exploration<br />\r\n1&nbsp;&nbsp; &nbsp;The total reserve of 121&nbsp;&nbsp;&nbsp; 572.969&nbsp;&nbsp; Ton<br />\r\n2&nbsp;&nbsp; &nbsp;The total reserve of 122&nbsp;&nbsp; &nbsp;384.756&nbsp;&nbsp; &nbsp;Ton<br />\r\n3&nbsp;&nbsp; &nbsp;The total reserve of resources 333&nbsp;&nbsp; &nbsp;448.074&nbsp;&nbsp; &nbsp;Ton<br />\r\nThe total geological reserves of the entire mine&nbsp;&nbsp; &nbsp;1.405.799&nbsp;&nbsp; &nbsp;Ton</p>\r\n\r\n<p><em>The process of extraction at the mine</em></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/02-00-01-16-08-2016-2.jpg\" /></p>\r\n\r\n<p>And quality of ore were analyzed with the following results :</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/11-05-22-17-08-2016-4.jpg\" /></p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/product/32/700x700/11-05-22-17-08-2016-4.jpg\" /></p>\r\n\r\n<p>The company has the ability to meet orders with a total volume of 60,000 to 80,000 tonnes and ore Barite powder/year.</p>\r\n', '', '', '');
INSERT INTO `w_product` VALUES ('33', '1', 'Barite không tuyển chọn (dùng để sản xuất dung dịch khoan dầu khí)', 'barite-khong-tuyen-chon-dung-de-san-xuat-dung-dich-khoan-dau-khi', '', '<p>+ K&iacute;ch cỡ của cục quặng Barite : &lt;25cm (hoặc theo đơn h&agrave;ng)<br />\r\n+ H&agrave;m lượng BaSO4 &ge; 95% , tỉ trọng : &ge; 4,3g/cm3.&nbsp;<br />\r\n+ Quặng c&oacute; c&aacute;c th&ocirc;ng số đạt về ti&ecirc;u chuẩn m&ocirc;i trường như bảng ph&acirc;n t&iacute;ch<br />\r\n+ Cảng xuất h&agrave;ng : Cảng H&ograve;n La</p>\r\n', '02-19-15-16-08-2016-5.jpg', 'a:1:{i:0;s:25:\"02-19-15-16-08-2016-5.jpg\";}', '22', '18', '0', '1', '0', null, '1471331955', 'Barite không tuyển chọn (dùng để sản xuất dung dịch khoan dầu khí)', 'Barite không tuyển chọn (dùng để sản xuất dung dịch khoan dầu khí)', 'Barite không tuyển chọn (dùng để sản xuất dung dịch khoan dầu khí)', '1', 'Barite ore not selected (used to produce oil and gas drilling mud', '', '<p>+ Size of Barite ore Department: &lt; 25cm (or orders )<br />\r\n+ BaSO4 content &ge; 95 % , density: &ge; 4,3g /cm3 .<br />\r\n+ Ores parameters have reached the environmental standards as a breakdown<br />\r\n+ Shipping port : Hon La Port</p>\r\n', 'Barite ore not selected (used to produce oil and gas drilling mud', 'Barite ore not selected (used to produce oil and gas drilling mud', 'Barite ore not selected (used to produce oil and gas drilling mud');
INSERT INTO `w_product` VALUES ('34', '1', 'Quặng Barite được tuyển chọn để sản xuất bột BaSO4 phục vụ cho các ngành sản xuất công nghiệp', 'quang-barite-duoc-tuyen-chon-de-san-xuat-bot-baso4-phuc-vu-cho-cac-nganh-san-xuat-cong-nghiep', '', '<p>+ K&iacute;ch cỡ : theo đơn h&agrave;ng.<br />\r\n+ H&agrave;m lượng BaSO4 &gt; 97%.<br />\r\n+ Độ trắng v&agrave; c&aacute;c ti&ecirc;u chuẩn kh&aacute;c : do kh&aacute;ch h&agrave;ng y&ecirc;u cầu.<br />\r\n+ Cảng xuất h&agrave;ng : cảng H&ograve;n La</p>\r\n', '02-20-43-16-08-2016-6.jpg', 'a:1:{i:0;s:25:\"02-20-43-16-08-2016-6.jpg\";}', '22', '18', '0', '1', '0', null, '1471332043', 'Quặng Barite được tuyển chọn để sản xuất bột BaSO4 phục vụ cho các ngành sản xuất công nghiệp', 'Quặng Barite được tuyển chọn để sản xuất bột BaSO4 phục vụ cho các ngành sản xuất công nghiệp', 'Quặng Barite được tuyển chọn để sản xuất bột BaSO4 phục vụ cho các ngành sản xuất công nghiệp', '2', 'Barite ore producers selected to serve BaSO4 powder manufacturing industry sectors', '', '<p>+ Dimensions: follow orders.<br />\r\n+ BaSO4 content of &gt; 97 % .<br />\r\n+ Whiteness and other criteria: by customer request.<br />\r\n+ Shipping port: Hon La port</p>\r\n', 'Barite ore producers selected to serve BaSO4 powder manufacturing industry sectors', 'Barite ore producers selected to serve BaSO4 powder manufacturing industry sectors', 'Barite ore producers selected to serve BaSO4 powder manufacturing industry sectors');
INSERT INTO `w_product` VALUES ('35', '1', 'Bột Barite dùng trong công nghệ khoan dầu khí ', 'bot-barite-dung-trong-cong-nghe-khoan-dau-khi', '', '<p>a. Bột Bartie tỷ trọng cao.&nbsp;<br />\r\n+ Tỷ trọng : &ge; 4,3g/cm3.<br />\r\n+ C&aacute;c th&ocirc;ng số c&ograve;n lại đạt ti&ecirc;u chuẩn API v&agrave; ti&ecirc;u chuẩn về m&ocirc;i trường<br />\r\nb. Bột Barite ti&ecirc;u chuẩn API<br />\r\n+ Tỷ trọng &ge; 4,2g/cm3.<br />\r\n+ C&aacute;c th&ocirc;ng số c&ograve;n lại đạt ti&ecirc;u chuẩn API v&agrave; ti&ecirc;u chuẩn về m&ocirc;i trường<br />\r\nH&agrave;ng được đ&oacute;ng bao 1,5 tấn/bao hoặc theo đơn h&agrave;ng.<br />\r\nCảng xuất h&agrave;ng : Cảng H&ograve;n La.</p>\r\n', '02-22-24-16-08-2016-7.jpg', 'a:1:{i:0;s:25:\"02-22-24-16-08-2016-7.jpg\";}', '22', '18', '0', '1', '0', null, '1471332144', 'Bột Barite dùng trong công nghệ khoan dầu khí ', 'Bột Barite dùng trong công nghệ khoan dầu khí ', 'Bột Barite dùng trong công nghệ khoan dầu khí ', '3', 'Powder Barite used in drilling technology', '', '<p>Asian. Bartie high density powder .<br />\r\n+ Gravity: &ge; 4,3g /cm3 .<br />\r\n+ The remaining parameters API standards and environmental standards<br />\r\nBarite powder API standards<br />\r\n+ Density &ge; 4,2g/cm3 .<br />\r\n+ The remaining parameters API standards and environmental standards<br />\r\nGoods are packed 1.5 tonnes/bag or according to the order.<br />\r\nPort of shipment: Hon La Port</p>\r\n', 'Powder Barite used in drilling technology', 'Powder Barite used in drilling technology', 'Powder Barite used in drilling technology');
INSERT INTO `w_product` VALUES ('36', '1', 'Bột Barite chất lượng cao dùng làm phụ gia công nghiệp', 'bot-barite-chat-luong-cao-dung-lam-phu-gia-cong-nghiep', '', '<p>C&ocirc;ng ty tuyển chọn quặng Barite để sản xuất bột Barite l&agrave;m phụ gia c&ocirc;ng nghiệp theo đơn h&agrave;ng.&nbsp;<br />\r\nTi&ecirc;u chuẩn chất lượng căn cứ theo y&ecirc;u cầu về chất lượng của kh&aacute;ch h&agrave;ng (h&agrave;m lượng, độ trắng, cỡ hạt&hellip;).<br />\r\nCảng xuất h&agrave;ng : Cảng H&ograve;n La hoặc tại nh&agrave; m&aacute;y (mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o)</p>\r\n', '02-23-18-16-08-2016-8.jpg', 'a:1:{i:0;s:25:\"02-23-18-16-08-2016-8.jpg\";}', '22', '18', '0', '1', '0', null, '1471332198', '', '', '', '4', 'High Quality Barite powder used as additives industry', '', '<p>Barite ore companies selected to produce Barite powder as additives industrial orders.<br />\r\nQuality standards based on the quality requirements of customers ( content, whiteness, particle size ...) .<br />\r\nPort of shipment : Hon La port or at the factory (pictured Boualapha District, Kham Muon province , Lao People&#39;s Democratic Republic )</p>\r\n', '', '', '');
INSERT INTO `w_product` VALUES ('37', '1', 'Cát xây dựng và cát san lấp', 'cat-xay-dung-va-cat-san-lap', '', '<p>Được cung cấp từ b&atilde;i c&aacute;t của c&ocirc;ng ty tại x&atilde; T&acirc;n Hưng, huyện Ti&ecirc;n Lữ, tỉnh Hưng Y&ecirc;n.</p>\r\n', '11-15-17-17-08-2016-catdemi.jpg', 'a:1:{i:0;s:31:\"11-15-17-17-08-2016-catdemi.jpg\";}', '22', '4', '0', '1', '0', null, '1471332288', '', '', '', '5', 'Sand for building and leveling', '', '<p>Sand is supplied from the sands of the company in Tan Hung commune, Tien Lu District, Hung Yen Province.</p>\r\n', '', '', '');
INSERT INTO `w_product` VALUES ('38', '1', 'Sản phẩm dịch vụ', 'san-pham-dich-vu', '', '<p>+ Dịch vụ t&igrave;m kiếm thăm d&ograve; kho&aacute;ng sản.<br />\r\n+ Tư vấn mua b&aacute;n, lắp đặt c&aacute;c sản phẩm viễn th&ocirc;ng v&agrave; tự động ho&aacute;.<br />\r\n+ Dịch vụ vận tải v&agrave; bốc xếp h&agrave;ng ho&aacute;.<br />\r\n+ Dịch vụ nghi&ecirc;n cứu v&agrave; bu&ocirc;n b&aacute;n vật tư thiết bị về c&ocirc;ng nghệ m&ocirc;i trường</p>\r\n', '', null, '22', '4', '0', '1', '0', null, '1471332349', '', '', '', '6', 'Products and Services', '', '<p>+ Service for mineral exploration .<br />\r\n+ Consulting purchase and installation of telecommunications products and automation .<br />\r\n+ Transport services and cargo handling .<br />\r\n+ Services Research and trafficking of materials and equipment for environmental technology</p>\r\n', '', '', '');

-- ----------------------------
-- Table structure for w_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `w_recycle_bin`;
CREATE TABLE `w_recycle_bin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `content` longtext,
  `img` varchar(255) DEFAULT NULL,
  `img_other` longtext,
  `folder` varchar(255) DEFAULT NULL,
  `created` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_recycle_bin
-- ----------------------------
INSERT INTO `w_recycle_bin` VALUES ('41', '1', '1', 'a', 'Contact', 'a:15:{s:10:\"contact_id\";s:1:\"1\";s:13:\"contact_title\";s:1:\"a\";s:15:\"contact_content\";s:1:\"a\";s:21:\"contact_content_reply\";s:1:\"a\";s:18:\"contact_phone_send\";s:1:\"a\";s:18:\"contact_email_send\";s:13:\"abc@gmail.com\";s:12:\"contact_type\";s:1:\"1\";s:14:\"contact_reason\";s:1:\"1\";s:14:\"contact_status\";s:1:\"1\";s:20:\"contact_user_id_send\";s:1:\"0\";s:22:\"contact_user_name_send\";s:1:\"a\";s:20:\"contact_time_creater\";N;s:19:\"contact_time_update\";N;s:22:\"contact_user_id_update\";N;s:24:\"contact_user_name_update\";s:0:\"\";}', '', 'a:0:{}', '', '1471382632');
INSERT INTO `w_recycle_bin` VALUES ('42', '1', '43', 'Vận chuyển thiết bị và xây dựng cơ sở hạ tầng', 'News', 'a:22:{s:7:\"news_id\";s:2:\"43\";s:10:\"news_title\";s:64:\"Vận chuyển thiết bị và xây dựng cơ sở hạ tầng\";s:16:\"news_title_alias\";s:45:\"van-chuyen-thiet-bi-va-xay-dung-co-so-ha-tang\";s:14:\"news_desc_sort\";s:0:\"\";s:12:\"news_content\";s:675:\"<p>Mặc d&ugrave; dự &aacute;n được triển khai ở v&ugrave;ng s&acirc;u nhưng c&ocirc;ng ty đ&atilde; triển khai th&agrave;nh c&ocirc;ng việc vận chuyển v&agrave; x&acirc;y dựng một nh&agrave; m&aacute;y hiện đại c&oacute; quy m&ocirc; tương đối lớn.<br />\r\nHạ tầng cơ sở phục vụ cho dự &aacute;n v&agrave; d&acirc;n sinh đ&atilde; được c&ocirc;ng ty&nbsp; sửa chữa, n&acirc;ng cấp l&agrave;m mới nhằm đảm bảo t&iacute;nh khả thi v&agrave; hiệu quả của dự &aacute;n cũng như g&oacute;p phần tham gia v&agrave;o việc ph&aacute;t triển kinh tế x&atilde; hội của địa phương.</p>\r\n\";s:10:\"news_image\";s:25:\"06-18-24-17-08-2016-9.jpg\";s:16:\"news_image_other\";s:43:\"a:1:{i:0;s:25:\"06-18-24-17-08-2016-9.jpg\";}\";s:8:\"news_hot\";s:1:\"0\";s:9:\"news_type\";s:2:\"17\";s:11:\"news_create\";s:10:\"1471389504\";s:13:\"news_category\";s:2:\"26\";s:11:\"news_status\";s:1:\"1\";s:15:\"news_meta_title\";s:0:\"\";s:17:\"news_meta_keyword\";s:0:\"\";s:21:\"news_meta_description\";s:0:\"\";s:10:\"news_order\";s:1:\"0\";s:13:\"news_title_en\";s:64:\"Vận chuyển thiết bị và xây dựng cơ sở hạ tầng\";s:17:\"news_desc_sort_en\";s:0:\"\";s:15:\"news_content_en\";s:675:\"<p>Mặc d&ugrave; dự &aacute;n được triển khai ở v&ugrave;ng s&acirc;u nhưng c&ocirc;ng ty đ&atilde; triển khai th&agrave;nh c&ocirc;ng việc vận chuyển v&agrave; x&acirc;y dựng một nh&agrave; m&aacute;y hiện đại c&oacute; quy m&ocirc; tương đối lớn.<br />\r\nHạ tầng cơ sở phục vụ cho dự &aacute;n v&agrave; d&acirc;n sinh đ&atilde; được c&ocirc;ng ty&nbsp; sửa chữa, n&acirc;ng cấp l&agrave;m mới nhằm đảm bảo t&iacute;nh khả thi v&agrave; hiệu quả của dự &aacute;n cũng như g&oacute;p phần tham gia v&agrave;o việc ph&aacute;t triển kinh tế x&atilde; hội của địa phương.</p>\r\n\";s:18:\"news_meta_title_en\";s:0:\"\";s:20:\"news_meta_keyword_en\";s:0:\"\";s:24:\"news_meta_description_en\";s:0:\"\";}', '06-18-24-17-08-2016-9.jpg', 'a:1:{i:0;s:25:\"06-18-24-17-08-2016-9.jpg\";}', 'news', '1471449504');
INSERT INTO `w_recycle_bin` VALUES ('43', '1', '42', 'Quá trình xây dựng mỏ và nhà máy chế biến', 'News', 'a:22:{s:7:\"news_id\";s:2:\"42\";s:10:\"news_title\";s:55:\"Quá trình xây dựng mỏ và nhà máy chế biến\";s:16:\"news_title_alias\";s:41:\"qua-trinh-xay-dung-mo-va-nha-may-che-bien\";s:14:\"news_desc_sort\";s:0:\"\";s:12:\"news_content\";s:3468:\"<p>Vận chuyển m&aacute;y m&oacute;c thiết bị qua x&ocirc;ng XeeBangPhai để x&acirc;y dựng nh&agrave; m&aacute;y. Qu&aacute; vất vả cho một chuyến đi nhưng cũng thật h&agrave;nh ph&uacute;c khi to&agrave;n bộ vật tư thiết bị đ&atilde; tập kết an to&agrave;n tại khu x&acirc;y dựng nh&agrave; m&aacute;y.</p>\r\n\r\n<p>Dựng khung xưởng sản xuất của nh&agrave; m&aacute;y chế biến Barite tại cụm bản Noongma, mường Bualapha, tỉnh Khăm Muộn. Giữa nơi hoang sơ v&agrave; ngh&egrave;o kh&oacute; n&agrave;y rồi sẽ mọc l&ecirc;n một nh&agrave; m&aacute;y hiện đại đem lại sự thịnh vượng v&agrave; văn minh cho nh&acirc;n d&acirc;n địa phương.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/42/700x700/02-09-03-18-08-2016-6.jpg\" /></p>\r\n\r\n<p>C&aacute;c chuy&ecirc;n gia đang hướng dẫn lắp đặt hệ thống m&aacute;y m&oacute;c thiết bị. Chất lượng bột Barite sau n&agrave;y đang được h&igrave;nh th&agrave;nh từ ch&iacute;nh những đ&ocirc;i b&agrave;n tay v&agrave; tr&iacute; &oacute;c của c&aacute;c bạn đấy. Xin ghi nhớ c&ocirc;ng lao của c&aacute;c bạn.</p>\r\n\r\n<p>Hệ thống m&aacute;y Zenith MTW138 đ&atilde; được lắp đặt xong. Ch&uacute;ng t&ocirc;i đ&atilde; sẵn s&agrave;ng cung cấp cho thị trường thế giới sản phẩm bột Barite API mang thương hiệu Cộng ho&agrave; d&acirc;n chủ nh&acirc;n d&acirc;n (CHDCND) L&agrave;o. Ch&uacute;ng t&ocirc;i khẳng định sản phẩm của m&igrave;nh c&oacute; chất lượng thoả m&atilde;n c&aacute;c y&ecirc;u cầu khắt khe của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>Chụp ảnh lưu niệm với c&aacute;c c&aacute;n bộ cục mỏ - Bộ Mỏ Năng Lượng, nước CHDCND L&agrave;o về kiểm tra tiến độ x&acirc;y dựng nh&agrave; m&aacute;y.</p>\r\n\r\n<p>Quang cảnh nh&agrave; m&aacute;y đang trong qu&aacute; tr&igrave;nh x&acirc;y dựng. Chỉ v&agrave;i th&aacute;ng nữa th&ocirc;i bạn sẽ ngạc nhi&ecirc;n khi thấy n&oacute; Xanh - Sạch &ndash; Đẹp. Ch&uacute;ng t&ocirc;i đ&atilde; nhận được rất nhiều lời khen ngợi của c&aacute;c đo&agrave;n kiểm tra. C&ocirc;ng ty sẽ cố gắng x&acirc;y dựng một m&ocirc; h&igrave;nh kiểu mẫu như lời dặn d&ograve; v&agrave; trao tr&aacute;ch nhiệm của ph&oacute; tỉnh trưởng tỉnh Khăm Muộn trong cuộc họp ng&agrave;y 20 th&aacute;ng 05 năm 2016</p>\r\n\r\n<p>Nh&agrave; chỉ huy khu vực khai th&aacute;c quặng Bartie tại cụm bản Noong Ma, mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o. D&ugrave; ở v&ugrave;ng s&acirc;u nhưng c&ocirc;ng ty cũng cố gắng đảm bảo việc ăn uống sinh hoạt tốt nhất c&oacute; thể cho c&aacute;n bộ c&ocirc;ng nh&acirc;n vi&ecirc;n. V&igrave; l&agrave; khởi đầu n&ecirc;n mong rằng mọi người h&atilde;y th&ocirc;ng cảm cho những kh&oacute; khăn của c&ocirc;ng ty.</p>\r\n\r\n<p>Những vi&ecirc;n quặng đầu ti&ecirc;n mở ra một giai đoạn đ&aacute;ng tự h&agrave;o của c&ocirc;ng ty. Chi em c&ocirc;ng nh&acirc;n địa phương khẳng định vừa l&ograve;ng với điều kiện l&agrave;m việc v&agrave; chế độ đ&atilde;i ngộ của c&ocirc;ng ty. Mọi người mong được gắn b&oacute; l&acirc;u d&agrave;i với c&ocirc;ng việc n&agrave;y.</p>\r\n\";s:10:\"news_image\";s:25:\"02-09-03-18-08-2016-6.jpg\";s:16:\"news_image_other\";s:43:\"a:1:{i:0;s:25:\"02-09-03-18-08-2016-6.jpg\";}\";s:8:\"news_hot\";s:1:\"1\";s:9:\"news_type\";s:2:\"17\";s:11:\"news_create\";s:10:\"1471389435\";s:13:\"news_category\";s:2:\"26\";s:11:\"news_status\";s:1:\"1\";s:15:\"news_meta_title\";s:0:\"\";s:17:\"news_meta_keyword\";s:0:\"\";s:21:\"news_meta_description\";s:0:\"\";s:10:\"news_order\";s:1:\"3\";s:13:\"news_title_en\";s:55:\"Quá trình xây dựng mỏ và nhà máy chế biến\";s:17:\"news_desc_sort_en\";s:0:\"\";s:15:\"news_content_en\";s:3468:\"<p>Vận chuyển m&aacute;y m&oacute;c thiết bị qua x&ocirc;ng XeeBangPhai để x&acirc;y dựng nh&agrave; m&aacute;y. Qu&aacute; vất vả cho một chuyến đi nhưng cũng thật h&agrave;nh ph&uacute;c khi to&agrave;n bộ vật tư thiết bị đ&atilde; tập kết an to&agrave;n tại khu x&acirc;y dựng nh&agrave; m&aacute;y.</p>\r\n\r\n<p>Dựng khung xưởng sản xuất của nh&agrave; m&aacute;y chế biến Barite tại cụm bản Noongma, mường Bualapha, tỉnh Khăm Muộn. Giữa nơi hoang sơ v&agrave; ngh&egrave;o kh&oacute; n&agrave;y rồi sẽ mọc l&ecirc;n một nh&agrave; m&aacute;y hiện đại đem lại sự thịnh vượng v&agrave; văn minh cho nh&acirc;n d&acirc;n địa phương.</p>\r\n\r\n<p><img src=\"http://baritevietlao.com.vn/uploads/thumbs/news/42/700x700/02-09-03-18-08-2016-6.jpg\" /></p>\r\n\r\n<p>C&aacute;c chuy&ecirc;n gia đang hướng dẫn lắp đặt hệ thống m&aacute;y m&oacute;c thiết bị. Chất lượng bột Barite sau n&agrave;y đang được h&igrave;nh th&agrave;nh từ ch&iacute;nh những đ&ocirc;i b&agrave;n tay v&agrave; tr&iacute; &oacute;c của c&aacute;c bạn đấy. Xin ghi nhớ c&ocirc;ng lao của c&aacute;c bạn.</p>\r\n\r\n<p>Hệ thống m&aacute;y Zenith MTW138 đ&atilde; được lắp đặt xong. Ch&uacute;ng t&ocirc;i đ&atilde; sẵn s&agrave;ng cung cấp cho thị trường thế giới sản phẩm bột Barite API mang thương hiệu Cộng ho&agrave; d&acirc;n chủ nh&acirc;n d&acirc;n (CHDCND) L&agrave;o. Ch&uacute;ng t&ocirc;i khẳng định sản phẩm của m&igrave;nh c&oacute; chất lượng thoả m&atilde;n c&aacute;c y&ecirc;u cầu khắt khe của kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>Chụp ảnh lưu niệm với c&aacute;c c&aacute;n bộ cục mỏ - Bộ Mỏ Năng Lượng, nước CHDCND L&agrave;o về kiểm tra tiến độ x&acirc;y dựng nh&agrave; m&aacute;y.</p>\r\n\r\n<p>Quang cảnh nh&agrave; m&aacute;y đang trong qu&aacute; tr&igrave;nh x&acirc;y dựng. Chỉ v&agrave;i th&aacute;ng nữa th&ocirc;i bạn sẽ ngạc nhi&ecirc;n khi thấy n&oacute; Xanh - Sạch &ndash; Đẹp. Ch&uacute;ng t&ocirc;i đ&atilde; nhận được rất nhiều lời khen ngợi của c&aacute;c đo&agrave;n kiểm tra. C&ocirc;ng ty sẽ cố gắng x&acirc;y dựng một m&ocirc; h&igrave;nh kiểu mẫu như lời dặn d&ograve; v&agrave; trao tr&aacute;ch nhiệm của ph&oacute; tỉnh trưởng tỉnh Khăm Muộn trong cuộc họp ng&agrave;y 20 th&aacute;ng 05 năm 2016</p>\r\n\r\n<p>Nh&agrave; chỉ huy khu vực khai th&aacute;c quặng Bartie tại cụm bản Noong Ma, mường Bualapha, tỉnh Khăm Muộn, nước CHDCND L&agrave;o. D&ugrave; ở v&ugrave;ng s&acirc;u nhưng c&ocirc;ng ty cũng cố gắng đảm bảo việc ăn uống sinh hoạt tốt nhất c&oacute; thể cho c&aacute;n bộ c&ocirc;ng nh&acirc;n vi&ecirc;n. V&igrave; l&agrave; khởi đầu n&ecirc;n mong rằng mọi người h&atilde;y th&ocirc;ng cảm cho những kh&oacute; khăn của c&ocirc;ng ty.</p>\r\n\r\n<p>Những vi&ecirc;n quặng đầu ti&ecirc;n mở ra một giai đoạn đ&aacute;ng tự h&agrave;o của c&ocirc;ng ty. Chi em c&ocirc;ng nh&acirc;n địa phương khẳng định vừa l&ograve;ng với điều kiện l&agrave;m việc v&agrave; chế độ đ&atilde;i ngộ của c&ocirc;ng ty. Mọi người mong được gắn b&oacute; l&acirc;u d&agrave;i với c&ocirc;ng việc n&agrave;y.</p>\r\n\";s:18:\"news_meta_title_en\";s:0:\"\";s:20:\"news_meta_keyword_en\";s:0:\"\";s:24:\"news_meta_description_en\";s:0:\"\";}', '02-09-03-18-08-2016-6.jpg', 'a:1:{i:0;s:25:\"02-09-03-18-08-2016-6.jpg\";}', 'news', '1471449629');
INSERT INTO `w_recycle_bin` VALUES ('44', '1', '32', 'Quá trình xây dựng mỏ và nhà máy chế biến', 'Category', 'a:20:{s:11:\"category_id\";s:2:\"32\";s:13:\"category_name\";s:55:\"Quá trình xây dựng mỏ và nhà máy chế biến\";s:19:\"category_name_alias\";s:41:\"qua-trinh-xay-dung-mo-va-nha-may-che-bien\";s:18:\"category_parent_id\";s:1:\"3\";s:15:\"category_status\";s:1:\"1\";s:14:\"category_order\";s:1:\"6\";s:22:\"category_content_front\";s:1:\"0\";s:28:\"category_content_front_order\";N;s:7:\"type_id\";s:2:\"17\";s:3:\"uid\";s:1:\"1\";s:19:\"category_horizontal\";s:1:\"0\";s:17:\"category_vertical\";s:1:\"0\";s:16:\"category_created\";s:10:\"1471419832\";s:19:\"category_meta_title\";s:55:\"Quá trình xây dựng mỏ và nhà máy chế biến\";s:22:\"category_meta_keywords\";s:55:\"Quá trình xây dựng mỏ và nhà máy chế biến\";s:25:\"category_meta_description\";s:55:\"Quá trình xây dựng mỏ và nhà máy chế biến\";s:16:\"category_name_en\";s:54:\"The process of developing and processing plant opening\";s:22:\"category_meta_title_en\";s:54:\"The process of developing and processing plant opening\";s:25:\"category_meta_keywords_en\";s:54:\"The process of developing and processing plant opening\";s:28:\"category_meta_description_en\";s:54:\"The process of developing and processing plant opening\";}', '', 'a:0:{}', '', '1471453804');

-- ----------------------------
-- Table structure for w_type
-- ----------------------------
DROP TABLE IF EXISTS `w_type`;
CREATE TABLE `w_type` (
  `type_id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT '1',
  `type_name` varchar(255) DEFAULT NULL,
  `type_keyword` varchar(255) DEFAULT NULL,
  `type_order` int(10) DEFAULT '0',
  `type_created` int(11) DEFAULT '0',
  `type_status` tinyint(2) DEFAULT '0',
  `type_name_en` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of w_type
-- ----------------------------
INSERT INTO `w_type` VALUES ('17', '1', 'Kiểu tin bài', 'group_news', '1', '1470722926', '1', 'Type news');
INSERT INTO `w_type` VALUES ('18', '1', 'Kiểu văn bản', 'group_document', '2', '1470762254', '1', 'Type document');
INSERT INTO `w_type` VALUES ('19', '1', 'Kiểu thư viện ảnh', 'group_images', '3', '1470763637', '1', 'Type images');
INSERT INTO `w_type` VALUES ('20', '2', 'Kiểu video', 'group_video', '4', '1465614479', '1', 'Type video');
INSERT INTO `w_type` VALUES ('22', '1', 'Kiểu sản phẩm', 'group_product', '5', '1471327785', '1', 'Type product');
INSERT INTO `w_type` VALUES ('23', '1', 'Kiểu tuyển dụng', 'groupt_recruitment', '6', '1471387127', '0', '');

-- ----------------------------
-- Table structure for w_video
-- ----------------------------
DROP TABLE IF EXISTS `w_video`;
CREATE TABLE `w_video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `video_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_name_alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_sort_desc` text CHARACTER SET utf8,
  `video_content` text CHARACTER SET utf8,
  `video_link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_file` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_img_temp` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_status` tinyint(5) DEFAULT NULL,
  `video_view` int(11) DEFAULT '0' COMMENT 'lượt view xem video tren site',
  `video_time_creater` int(11) DEFAULT '0',
  `video_hot` tinyint(4) DEFAULT NULL,
  `video_category` int(10) DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_time_update` int(11) DEFAULT '0',
  `video_meta_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_meta_keyword` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_meta_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_name_en` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_sort_desc_en` text CHARACTER SET utf8,
  `video_content_en` text CHARACTER SET utf8,
  `video_meta_title_en` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_meta_keyword_en` text CHARACTER SET utf8,
  `video_meta_description_en` text CHARACTER SET utf8,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of w_video
-- ----------------------------
INSERT INTO `w_video` VALUES ('1', '1', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', 'khai-thac-quang-quaczit-tren-song-chay-bao-nhai-bac-ha-lao-cai', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', '<p>Khai th&aacute;c quặng Quaczit tr&ecirc;n s&ocirc;ng chảy - Bảo Nhai - Bắc H&agrave; - L&agrave;o Cai</p>\r\n', 'https://www.youtube.com/watch?v=5eRaOPJqklg', '', '10-54-44-16-08-2016-426631.jpg', null, '1', '0', '1470872365', '1', '19', '', '1471363174', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', '<p>Khai th&aacute;c quặng Quaczit tr&ecirc;n s&ocirc;ng chảy - Bảo Nhai - Bắc H&agrave; - L&agrave;o Cai</p>\r\n', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai', 'Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai');
INSERT INTO `w_video` VALUES ('2', '1', 'Khai thác quặng đồng lộ thiên ', 'khai-thac-quang-dong-lo-thien', 'Khai thác quặng đồng lộ thiên ', '<p>Khai th&aacute;c quặng đồng lộ thi&ecirc;n</p>\r\n', 'https://www.youtube.com/watch?v=4LtujnxxOic', '11-51-17-16-08-2016-khai-thac-quang-dong-lo-thien.mp4', '11-02-14-16-08-2016-2.jpg', null, '1', '0', '1471363334', '1', '19', '', '1471369027', 'Khai thác quặng đồng lộ thiên ', 'Khai thác quặng đồng lộ thiên ', 'Khai thác quặng đồng lộ thiên ', 'Khai thác quặng đồng lộ thiên ', 'Khai thác quặng đồng lộ thiên ', '<p>Khai th&aacute;c quặng đồng lộ thi&ecirc;n</p>\r\n', 'Khai thác quặng đồng lộ thiên ', 'Khai thác quặng đồng lộ thiên ', 'Khai thác quặng đồng lộ thiên ');

-- ----------------------------
-- Table structure for web_banner
-- ----------------------------
DROP TABLE IF EXISTS `web_banner`;
CREATE TABLE `web_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_link` varchar(255) DEFAULT NULL,
  `banner_page` tinyint(5) DEFAULT '0' COMMENT '1: trang chủ, 2: trang list,3: trang detail, 4: trang list danh mục',
  `banner_type` tinyint(5) DEFAULT '0' COMMENT '1:banner home to, 2: banner home nhỏ,3: banner trái, 4 banner phải',
  `banner_province_id` int(11) DEFAULT '0' COMMENT 'tỉnh thành hiển thị',
  `banner_category_id` int(11) DEFAULT '0',
  `banner_order` tinyint(5) DEFAULT '1' COMMENT 'thứ tự hiển thị',
  `banner_position` tinyint(2) DEFAULT '1' COMMENT 'Vị trí hiển thị banner 1;top, 2:center,3Bottom',
  `banner_parent_id` int(11) DEFAULT '0' COMMENT 'Lưu id banner cha để lấy ảnh của banner cha hiển thị',
  `banner_is_target` tinyint(5) DEFAULT '0' COMMENT '0: Không mở tab mới, 1: mở tab mới',
  `banner_is_rel` tinyint(5) DEFAULT '0' COMMENT '0:nofollow, 1:follow',
  `banner_status` tinyint(5) DEFAULT '0',
  `banner_is_run_time` tinyint(5) DEFAULT '0' COMMENT '0: không có time chay,1: có thời gian chạy quảng cáo',
  `banner_start_time` int(11) DEFAULT '0',
  `banner_end_time` int(11) DEFAULT '0',
  `banner_total_click` int(11) DEFAULT '0' COMMENT 'lượt click banner theo id',
  `banner_create_time` int(11) DEFAULT '0',
  `banner_time_click` int(11) DEFAULT '0' COMMENT 'Time click gần nhất',
  `banner_update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_banner
-- ----------------------------
INSERT INTO `web_banner` VALUES ('3', 'test banner quảng cáo', '', 'http://localhost/goingay/admin/banner/edit/3', '0', '4', '0', '0', '12', '4', '14', '1', '0', '1', '0', '0', '0', '0', '1478768319', '0', '1482998823');
INSERT INTO `web_banner` VALUES ('4', 'hiển thị banner không có ảnh', '', 'http://localhost/goingay/admin/banner/edit/3', '0', '3', '0', '0', '1', '3', '3', '1', '0', '1', '0', '0', '0', '0', '1482380269', '0', '1482998790');
INSERT INTO `web_banner` VALUES ('5', 'hiển thị banner không có ảnh', '', 'http://localhost/goingay/admin/banner/edit/3', '0', '5', '0', '0', '1', '7', '13', '1', '0', '1', '0', '0', '0', '0', '1482998971', '0', '0');
INSERT INTO `web_banner` VALUES ('6', 'hiển thị banner không có ảnh', '1482998992-573cb4258e810763aa000001.jpg', 'http://localhost/goingay/admin/banner/edit/3', '0', '5', '0', '0', '1', '6', '0', '1', '0', '1', '0', '0', '0', '0', '1482998991', '0', '1482999333');

-- ----------------------------
-- Table structure for web_category
-- ----------------------------
DROP TABLE IF EXISTS `web_category`;
CREATE TABLE `web_category` (
  `category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_parent_id` smallint(5) unsigned DEFAULT '0',
  `category_content_front` tinyint(2) DEFAULT '0',
  `category_content_front_order` tinyint(5) DEFAULT '0' COMMENT 'vị trí hiển thị ngoài trang chủ',
  `category_status` tinyint(1) DEFAULT '0',
  `category_image_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_icons` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_order` tinyint(5) DEFAULT '0',
  PRIMARY KEY (`category_id`),
  KEY `status` (`category_status`) USING BTREE,
  KEY `id_parrent` (`category_parent_id`,`category_status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of web_category
-- ----------------------------
INSERT INTO `web_category` VALUES ('253', 'Mua bán nhà đất', '0', '1', '1', '1', null, 'fa fa-building', '1');
INSERT INTO `web_category` VALUES ('254', 'Thuê nhà đất', '0', '1', '2', '1', null, 'fa fa-building-o', '2');
INSERT INTO `web_category` VALUES ('255', 'Ôtô', '0', '1', '3', '1', null, 'fa fa-car', '3');
INSERT INTO `web_category` VALUES ('256', 'Xe máy - Xe đạp', '0', '1', '4', '1', null, 'fa fa-bicycle', '4');
INSERT INTO `web_category` VALUES ('257', 'Tuyển sinh - Tuyển dụng', '0', '0', '5', '1', null, 'fa fa-mortar-board', '5');
INSERT INTO `web_category` VALUES ('258', 'Điện thoại - Sim', '0', '1', '6', '1', null, 'fa fa-mobile-phone', '6');
INSERT INTO `web_category` VALUES ('259', 'PC - Laptop', '0', '1', '7', '1', null, 'fa fa-laptop', '7');
INSERT INTO `web_category` VALUES ('260', 'Điện tử - Kỹ thuật số', '0', '1', '8', '1', '576568_579794885409422_1412382588_n.jpg', 'fa fa-desktop', '8');
INSERT INTO `web_category` VALUES ('261', 'Thời trang - Làm đẹp', '0', '1', '9', '1', null, 'fa fa-child', '9');
INSERT INTO `web_category` VALUES ('262', 'Ẩm thực - Du lịch', '0', '0', '10', '1', null, 'fa fa-cutlery', '10');
INSERT INTO `web_category` VALUES ('263', 'Dịch vụ', '0', '0', '11', '1', null, 'fa fa-dropbox', '11');
INSERT INTO `web_category` VALUES ('264', 'Khác', '0', '1', '12', '1', '573cb4258e810763aa000001.jpg', 'fa fa-asterisk', '12');

-- ----------------------------
-- Table structure for web_click_share
-- ----------------------------
DROP TABLE IF EXISTS `web_click_share`;
CREATE TABLE `web_click_share` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT 'banner id được click',
  `object_name` varchar(255) DEFAULT NULL,
  `share_ip` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ IP click',
  `share_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_click_share
-- ----------------------------
INSERT INTO `web_click_share` VALUES ('1', '20', 'svquynhtm', '::1', '1482826370');
INSERT INTO `web_click_share` VALUES ('2', '20', 'svquynhtm', '::1', '1482826399');
INSERT INTO `web_click_share` VALUES ('3', '20', 'svquynhtm', '::1', '1482826433');

-- ----------------------------
-- Table structure for web_contact
-- ----------------------------
DROP TABLE IF EXISTS `web_contact`;
CREATE TABLE `web_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_title` varchar(255) DEFAULT NULL COMMENT 'tên liên hệ',
  `contact_content` mediumtext,
  `contact_content_reply` mediumtext,
  `contact_user_id_send` int(11) DEFAULT '0' COMMENT '0: khách vãng lai gửi, > 0 shop gửi liên hệ',
  `contact_user_name_send` varchar(255) DEFAULT NULL,
  `contact_phone_send` varchar(255) DEFAULT NULL,
  `contact_email_send` varchar(255) DEFAULT NULL,
  `contact_type` tinyint(5) DEFAULT '1' COMMENT '1:loại gửi , 2: loại nhận',
  `contact_reason` tinyint(5) DEFAULT '1' COMMENT 'Lý do gửi liên hệ: 1: liên hệ ở ngoài site, 2: shop liên hệ với quản trị',
  `contact_status` tinyint(5) DEFAULT '1' COMMENT '1: liên hệ mới, 2: đã xác nhận,3: đã xử lý',
  `contact_time_creater` int(11) DEFAULT NULL,
  `contact_user_id_update` int(11) DEFAULT NULL COMMENT 'Người xử lý liên hệ',
  `contact_user_name_update` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `contact_time_update` int(11) DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_contact
-- ----------------------------

-- ----------------------------
-- Table structure for web_customer
-- ----------------------------
DROP TABLE IF EXISTS `web_customer`;
CREATE TABLE `web_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(250) DEFAULT NULL COMMENT 'Tên shop, cửa hàng hiển thị',
  `customer_password` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `customer_email` longtext,
  `customer_show_email` tinyint(2) DEFAULT '0' COMMENT '0: không hiển thị email, 1: có hiển thị',
  `customer_gender` tinyint(2) DEFAULT '0' COMMENT '0:nữ:1nam',
  `customer_birthday` varchar(50) DEFAULT NULL,
  `customer_province_id` int(10) DEFAULT NULL COMMENT 'tinh thanh',
  `customer_district_id` int(11) DEFAULT NULL,
  `customer_about` text COMMENT 'gioi thieu shop',
  `customer_status` tinyint(1) DEFAULT '0' COMMENT '0-an, 1-hoat dong, 2-khoa',
  `customer_time_login` int(12) DEFAULT NULL,
  `customer_time_logout` int(12) DEFAULT NULL,
  `customer_time_created` int(12) DEFAULT NULL COMMENT 'Ngày tạo',
  `customer_time_active` int(12) DEFAULT '0' COMMENT 'Ngày active',
  `is_customer` tinyint(1) DEFAULT '0' COMMENT '0-thuong, 1-vip',
  `is_login` tinyint(1) DEFAULT '0' COMMENT '0:not login, 1:login',
  `customer_id_facebook` varchar(255) DEFAULT NULL,
  `customer_id_google` varchar(255) DEFAULT NULL,
  `customer_up_item` int(11) DEFAULT '0' COMMENT 'số lượt dang tin',
  `customer_number_ontop_in_day` int(6) DEFAULT '0' COMMENT 'Số lượng ontop tin trong 1 ngày',
  `customer_number_share` int(12) DEFAULT '0' COMMENT 'lươt share',
  `customer_date_ontop` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Ngày ontop tin đăng',
  `time_start_vip` int(12) DEFAULT NULL COMMENT 'Ngày bắt đầu vip',
  `time_end_vip` int(12) DEFAULT NULL COMMENT 'Ngày hết hạn vip',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_customer
-- ----------------------------
INSERT INTO `web_customer` VALUES ('1', 'Trương Mạnh Quỳnh', '99afcc19f7ced142819fb2d355ff7b63', '0938413368', 'Việt Hưng - Long Biên - Hà Nội', 'manhquynh1984@gmail.com', '0', '0', '', '22', '2', '', '1', '1480063953', '1480069302', '1478594509', '1', '1', '0', null, null, '4', '1', '0', '25-11-2016', '0', '0');

-- ----------------------------
-- Table structure for web_districts
-- ----------------------------
DROP TABLE IF EXISTS `web_districts`;
CREATE TABLE `web_districts` (
  `district_id` int(3) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `district_province_id` int(10) NOT NULL DEFAULT '0',
  `district_status` tinyint(1) NOT NULL DEFAULT '1',
  `district_position` tinyint(2) DEFAULT '50',
  PRIMARY KEY (`district_id`),
  KEY `id_citiesfather` (`district_province_id`),
  KEY `Idx_id_citiesfather_orders_name` (`district_province_id`,`district_name`)
) ENGINE=InnoDB AUTO_INCREMENT=860 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_districts
-- ----------------------------
INSERT INTO `web_districts` VALUES ('1', 'Ba Đình', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('2', 'Long Biên', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('3', 'Sóc Sơn', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('4', 'Đông Anh', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('5', 'TP Thủ Dầu Một', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('7', 'Thị xã Đồng Xoài', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('10', 'Bến Cát', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('12', 'Tân Uyên', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('16', 'Thuận An', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('18', 'TP Dĩ An', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('20', 'Phú Giáo', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('22', 'Dầu Tiếng', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('28', 'Đồng Xoài', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('31', 'Đồng Phú', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('33', 'Chơn Thành', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('35', 'Bình Long', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('36', 'Lộc Ninh', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('39', 'Bù Đốp', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('40', 'Thành phố Phan Rang - Tháp Chàm', '41', '1', '50');
INSERT INTO `web_districts` VALUES ('42', 'Việt Trì', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('43', 'Phước Long', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('44', 'Huyện Ninh Sơn', '41', '1', '50');
INSERT INTO `web_districts` VALUES ('45', 'Huyện Ninh Hải', '41', '1', '50');
INSERT INTO `web_districts` VALUES ('46', 'Bù Đăng', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('47', 'Huyện Ninh Phước', '41', '1', '50');
INSERT INTO `web_districts` VALUES ('48', 'Hớn Quản', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('49', 'Bác Ái', '41', '1', '50');
INSERT INTO `web_districts` VALUES ('50', 'Bù Gia Mập', '10', '1', '50');
INSERT INTO `web_districts` VALUES ('51', 'Hoàn Kiếm', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('52', 'Huyện Thuận Bắc', '41', '1', '50');
INSERT INTO `web_districts` VALUES ('53', 'Hai Bà Trưng', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('54', 'Huyện Thuận Nam', '41', '1', '50');
INSERT INTO `web_districts` VALUES ('55', 'Đống Đa', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('57', 'Tây Hồ', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('58', 'Đà Lạt', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('60', 'Cầu Giấy', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('61', 'Bảo Lộc', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('62', 'Thị xã Tây Ninh', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('63', 'Thanh Xuân', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('64', 'Huyện Tân Biên', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('65', 'Đức Trọng', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('66', 'Huyện Tân Châu', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('67', 'Huyện Dương Minh Châu', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('68', 'Di Linh', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('69', 'Huyện Châu Thành', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('70', 'Hoàng Mai', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('71', 'Đơn Dương', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('72', 'Huyện Hoà Thành', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('73', 'Huyện Bến Cầu', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('74', 'Lạc Dương', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('75', 'Đoan Hùng', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('76', 'Đạ Huoai', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('77', 'Huyện Gò Dầu', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('78', 'Huyện Trảng Bàng', '51', '1', '50');
INSERT INTO `web_districts` VALUES ('79', 'Đạ Tẻh', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('80', 'Thanh Ba', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('81', 'Cát Tiên', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('83', 'Lâm Hà', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('84', 'Thành phố Phan Thiết', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('85', 'Huyện Tuy Phong', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('86', 'Bảo Lâm', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('87', 'Nam Từ Liêm', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('88', 'Huyện Bắc Bình', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('89', 'Đam Rông', '36', '1', '50');
INSERT INTO `web_districts` VALUES ('91', 'Thanh Trì', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('92', 'Hàm Thuận Bắc', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('93', 'Gia Lâm', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('95', 'Hàm Thuận Nam', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('96', 'Nha Trang', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('97', 'Tuyên Quang', '58', '1', '50');
INSERT INTO `web_districts` VALUES ('98', 'Huyện Hàm Tân', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('99', 'Vạn Ninh', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('100', 'Huyện Đức Linh', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('101', 'Na Hang', '58', '1', '50');
INSERT INTO `web_districts` VALUES ('102', 'Huyện Tánh Linh', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('103', 'Ninh Hoà', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('104', 'Huyện đảo Phú Quý', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('105', 'Chiêm Hoá', '58', '1', '50');
INSERT INTO `web_districts` VALUES ('106', 'Thị xã La Gi', '11', '1', '50');
INSERT INTO `web_districts` VALUES ('107', 'Diên Khánh', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('108', 'Hàm Yên', '58', '1', '50');
INSERT INTO `web_districts` VALUES ('109', 'Yên Sơn', '58', '1', '50');
INSERT INTO `web_districts` VALUES ('110', 'Khánh Vĩnh', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('111', 'Cam Ranh', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('112', 'Sơn Dương', '58', '1', '50');
INSERT INTO `web_districts` VALUES ('113', 'Hà Đông', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('115', 'Khánh Sơn', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('116', 'Sơn Tây', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('117', 'Ba Vì', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('118', 'Trường Sa', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('119', 'Thành phố Biên Hoà', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('120', 'Phúc Thọ', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('121', 'Huyện Vĩnh Cửu', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('122', 'Cam Lâm', '30', '1', '50');
INSERT INTO `web_districts` VALUES ('123', 'Thạch Thất', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('124', 'Quốc Oai', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('127', 'Chương Mỹ', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('128', 'Lạng Sơn', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('129', 'Buôn Ma Thuột', '16', '1', '50');
INSERT INTO `web_districts` VALUES ('130', 'Đan Phượng', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('131', 'Tràng Định', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('132', 'Hoài Đức', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('133', 'Ea H Leo', '16', '1', '50');
INSERT INTO `web_districts` VALUES ('134', 'Bình Gia', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('135', 'Krông Buk', '16', '1', '50');
INSERT INTO `web_districts` VALUES ('136', 'Thanh Oai', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('137', 'Huyện Định Quán', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('138', 'Văn Lãng', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('139', 'Mỹ Đức', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('140', 'Krông Năng', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('141', 'Bắc Sơn', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('142', 'Ứng Hoà', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('143', 'Ea Súp', '16', '1', '50');
INSERT INTO `web_districts` VALUES ('144', 'Thống Nhất', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('145', 'Thường Tín', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('148', 'Phú Xuyên', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('149', 'Văn Quan', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('150', 'Mê Linh', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('151', 'Thị xã Long Khánh', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('152', 'Krông Pắc', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('153', 'Huyện Long Thành', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('154', 'Ea Kar', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('155', 'Huyện Nhơn Trạch', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('156', 'M&#39;Đrăk', '16', '1', '50');
INSERT INTO `web_districts` VALUES ('157', 'Huyện Trảng Bom', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('158', 'Krông Ana', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('160', 'Krông Bông', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('161', 'Quận 1', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('162', 'Cao Lộc', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('163', 'Quận 2', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('164', 'Lăk', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('165', 'Quận 3', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('166', 'Quận 4', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('167', 'Quận 5', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('168', 'Quận 6', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('169', 'Lộc Bình', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('170', 'Quận 7', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('171', 'Chi Lăng', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('172', 'Quận 8', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('173', 'Đình Lập', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('174', 'Quận 9', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('175', 'Hữu Lũng', '34', '1', '50');
INSERT INTO `web_districts` VALUES ('176', 'Quận 10', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('177', 'Quận 11', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('178', 'Quận 12', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('179', 'Huyện Tân Phú', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('180', 'Gò Vấp', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('181', 'Buôn Đôn', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('182', 'Tân Bình', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('183', 'Xuân Lộc', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('185', 'Tân Phú', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('186', 'Cẩm Mỹ', '17', '1', '50');
INSERT INTO `web_districts` VALUES ('187', 'Buôn Hồ', '16', '1', '50');
INSERT INTO `web_districts` VALUES ('188', 'Bình Thạnh', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('189', 'Phú Nhuận', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('191', 'Tân An', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('192', 'Vĩnh Hưng', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('194', 'Mộc Hoá', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('195', 'Tuy Hoà', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('196', 'Đồng Xuân', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('197', 'Sông Cầu', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('198', 'Tuy An', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('199', 'Sơn Hoà', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('200', 'Tân Thạnh', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('201', 'Sông Hinh', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('202', 'Đông Hoà', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('203', 'Phú Hoà', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('204', 'Đức Huệ', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('205', 'Tây Hoà', '43', '1', '50');
INSERT INTO `web_districts` VALUES ('206', 'Đức Hoà', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('207', 'Bến Lức', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('208', 'Thủ Thừa', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('209', 'Châu Thành', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('212', 'Tân Trụ', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('213', 'Thái Nguyên', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('214', 'Sông Công', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('215', 'Cần Đước', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('216', 'Định Hoá', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('217', 'Cần Giuộc', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('218', 'Phú Lương', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('219', 'Tân Hưng', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('220', 'Võ Nhai', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('222', 'Đại Từ', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('223', 'TP Cao Lãnh', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('224', 'Đồng Hỷ', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('225', 'Sa Đéc', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('226', 'Phú Bình', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('227', 'Tân Hồng', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('228', 'Phổ Yên', '53', '1', '50');
INSERT INTO `web_districts` VALUES ('229', 'Hồng Ngự', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('230', 'Tam Nông', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('231', 'Thanh Bình', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('233', 'Yên Bái', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('234', 'Lấp Vò', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('235', 'Nghĩa Lộ', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('236', 'Tháp Mười', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('237', 'Văn Yên', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('238', 'Lai Vung', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('239', 'Pleiku', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('240', 'Yên Bình', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('241', 'Châu Thành', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('242', 'Mù Cang Chải', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('243', 'Chư Păh', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('244', 'Văn Chấn', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('245', 'Mang Yang', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('246', 'Trấn Yên', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('247', 'Kông Chro', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('249', 'Đức Cơ', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('250', 'Long Xuyên', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('251', 'Châu Đốc', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('252', 'Chư Prông', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('253', 'Trạm Tấu', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('254', 'An Phú', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('255', 'Chư Sê', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('256', 'Tân Châu', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('257', 'Ia Grai', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('258', 'Phú Tân', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('259', 'Tịnh Biên', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('260', 'Đăk Đoa', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('261', 'Tri Tôn', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('262', 'Ia Pa', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('263', 'Châu Phú', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('264', 'Đăk Pơ', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('265', 'Chợ Mới', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('266', 'K’Bang', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('267', 'An Khê', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('268', 'Ayun Pa', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('269', 'Châu Thành', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('270', 'Krông Pa', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('271', 'Thủ Đức', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('272', 'Phú Thiện', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('273', 'Thoại Sơn', '66', '1', '50');
INSERT INTO `web_districts` VALUES ('274', 'Bình Tân', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('275', 'Lục Yên', '61', '1', '50');
INSERT INTO `web_districts` VALUES ('276', 'Chư Pưh', '19', '1', '50');
INSERT INTO `web_districts` VALUES ('277', 'Bình Chánh', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('278', 'Củ Chi', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('280', 'Quy Nhơn', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('281', 'Hóc Môn', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('282', 'Nhà Bè', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('283', 'An Lão', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('285', 'Cần Giờ', '29', '1', '50');
INSERT INTO `web_districts` VALUES ('286', 'Hoài Ân', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('287', 'Vũng Tàu', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('288', 'Bà Rịa', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('289', 'Hoài Nhơn', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('290', 'Xuyên Mộc', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('291', 'Long Điền', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('292', 'Phù Mỹ', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('293', 'Phù Cát', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('294', 'Côn Đảo', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('295', 'Vĩnh Thạnh', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('296', 'Tân Thành', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('297', 'Châu Đức', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('298', 'Tây Sơn', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('300', 'Đất Đỏ', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('301', 'Sơn La', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('302', 'Vân Canh', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('303', 'Quỳnh Nhai', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('305', 'Mường La', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('306', 'An Nhơn', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('307', 'Mỹ Tho', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('308', 'Thuận Châu', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('309', 'Tuy Phước', '9', '1', '50');
INSERT INTO `web_districts` VALUES ('310', 'Bắc Yên', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('311', 'Gò Công', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('313', 'Cái Bè', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('314', 'Phù Yên', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('315', 'KonTum', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('316', 'Mai Sơn', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('317', 'Cai Lậy', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('318', 'Đăk Glei', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('319', 'Yên Châu', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('320', 'Châu Thành', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('321', 'Ngọc Hồi', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('322', 'Sông Mã', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('323', 'Mộc Châu', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('324', 'Đăk Tô', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('325', 'Chợ Gạo', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('326', 'Sa Thầy', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('327', 'Sốp Cộp', '50', '1', '50');
INSERT INTO `web_districts` VALUES ('328', 'Gò Công Tây', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('329', 'Kon Plong', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('330', 'Đăk Hà', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('331', 'Gò Công Đông', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('332', 'Kon Rẫy', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('333', 'Tu Mơ Rông', '32', '1', '50');
INSERT INTO `web_districts` VALUES ('335', 'Tân Phước', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('337', 'Bắc Kạn', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('339', 'Quảng Ngãi', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('340', 'Chợ Đồn', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('341', 'Lý Sơn', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('342', 'Bạch Thông', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('343', 'Bình Sơn', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('344', 'Trà Bồng', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('345', 'Sơn Tịnh', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('346', 'Na Rì', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('347', 'Sơn Hà', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('348', 'Tân Phú Đông', '56', '1', '50');
INSERT INTO `web_districts` VALUES ('349', 'Tư Nghĩa', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('350', 'Nghĩa Hành', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('351', 'Ngân Sơn', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('353', 'Minh Long', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('354', 'Ba Bể', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('355', 'Rạch Giá', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('356', 'Chợ Mới', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('357', 'Mộ Đức', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('358', 'Hà Tiên', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('359', 'Pác Nặm', '4', '1', '50');
INSERT INTO `web_districts` VALUES ('360', 'Đức Phổ', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('361', 'Kiên Lương', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('362', 'Hòn Đất', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('363', 'Ba Tơ', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('364', 'Phú Thọ', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('365', 'Tân Hiệp', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('366', 'Sơn Tây', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('367', 'Châu Thành', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('368', 'Tây Trà', '46', '1', '50');
INSERT INTO `web_districts` VALUES ('369', 'Giồng Riềng', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('370', 'Hạ Hoà', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('371', 'Gò Quao', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('372', 'Cẩm Khê', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('374', 'An Biên', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('375', 'Yên Lập', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('376', 'An Minh', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('377', 'Thanh Sơn', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('378', 'Vĩnh Thuận', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('379', 'Tam Kỳ', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('380', 'Phù Ninh', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('381', 'Phú Quốc', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('382', 'Hội An', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('383', 'Lâm Thao', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('384', 'Kiên Hải', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('385', 'Tam Nông', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('386', 'U Minh Thượng', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('387', 'Duy Xuyên', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('388', 'Thanh Thủy', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('389', 'Điện Bàn', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('390', 'Tân Sơn', '42', '1', '50');
INSERT INTO `web_districts` VALUES ('391', 'Giang Thành', '31', '1', '50');
INSERT INTO `web_districts` VALUES ('392', 'Đại Lộc', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('394', 'Quế Sơn', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('395', 'Ninh Kiều', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('396', 'Hiệp Đức', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('397', 'Bình Thuỷ', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('398', 'Thăng Bình', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('399', 'Cái Răng', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('400', 'Ô Môn', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('401', 'Núi Thành', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('402', 'Phong Điền', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('403', 'Tiên Phước', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('404', 'Cờ Đỏ', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('405', 'Bắc Trà My', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('406', 'Vĩnh Thạnh', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('407', 'Thốt Nốt', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('408', 'Đông Giang', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('409', 'Thới Lai', '14', '1', '50');
INSERT INTO `web_districts` VALUES ('410', 'Nam Giang', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('412', 'Phước Sơn', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('413', 'Nam Trà My', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('414', 'Bến Tre', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('415', 'Tây Giang', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('416', 'Phú Ninh', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('417', 'Nông Sơn', '45', '1', '50');
INSERT INTO `web_districts` VALUES ('418', 'Châu Thành', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('420', 'Chợ Lách', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('421', 'Mỏ Cày Bắc', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('423', 'Giồng Trôm', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('424', 'Huế', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('425', 'Hồng Bàng', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('426', 'Bình Đại', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('427', 'Phong Điền', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('428', 'Quảng Điền', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('429', 'Ba Tri', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('430', 'Thạnh Phú', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('431', 'Hương Trà', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('432', 'Mỏ Cày Nam', '7', '1', '50');
INSERT INTO `web_districts` VALUES ('433', 'Lê Chân', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('434', 'Phú Vang', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('435', 'Ngô Quyền', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('436', 'Hương Thuỷ', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('438', 'Kiến An', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('439', 'Phú Lộc', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('440', 'Vĩnh Long', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('442', 'Long Hồ', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('443', 'Nam Đông', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('444', 'Hải An', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('445', 'Mang Thít', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('446', 'A Lưới', '55', '1', '50');
INSERT INTO `web_districts` VALUES ('447', 'Đồ Sơn', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('448', 'Bình Minh', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('449', 'An Lão', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('450', 'Tam Bình', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('452', 'Kiến Thụy', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('453', 'Trà Ôn', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('454', 'Đông Hà', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('455', 'Thủy Nguyên', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('456', 'An Dương', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('458', 'Tiên Lãng', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('459', 'Vĩnh Linh', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('460', 'Vĩnh Bảo', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('461', 'Gio Linh', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('462', 'Cam Lộ', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('463', 'Triệu Phong', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('464', 'Hải Lăng', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('465', 'Hướng Hoá', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('466', 'Đăk Rông', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('467', 'Cồn Cỏ', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('469', 'Đồng Hới', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('470', 'Vũng Liêm', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('471', 'Tuyên Hoá', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('472', 'Bình Tân', '59', '1', '50');
INSERT INTO `web_districts` VALUES ('473', 'Minh Hoá', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('474', 'Quảng Trạch', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('476', 'Trà Vinh', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('477', 'Bố Trạch', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('478', 'Càng Long', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('479', 'Cầu Kè', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('480', 'Quảng Ninh', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('481', 'Tiểu Cần', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('482', 'Lệ Thuỷ', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('483', 'Châu Thành', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('484', 'Trà Cú', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('485', 'Cầu Ngang', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('487', 'Duyên Hải', '57', '1', '50');
INSERT INTO `web_districts` VALUES ('488', 'Hà Tĩnh', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('489', 'Hồng Lĩnh', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('490', 'Cát Hải', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('492', 'Hương Sơn', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('493', 'Sóc Trăng', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('494', 'Bạch Long Vĩ', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('495', 'Đức Thọ', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('496', 'Mỹ Xuyên', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('497', 'Dương Kinh', '26', '1', '50');
INSERT INTO `web_districts` VALUES ('498', 'Thạnh Trị', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('499', 'Nghi Xuân', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('500', 'Can Lộc', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('501', 'Cù Lao Dung', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('502', 'Ngã Năm', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('503', 'Hương Khê', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('505', 'Thạch Hà', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('506', 'Kế Sách', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('507', 'Cẩm Xuyên', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('508', 'Mỹ Tú', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('509', 'Thị Xã Kỳ Anh', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('510', 'Hải Châu', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('511', 'Long Phú', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('512', 'Vũ Quang', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('513', 'Vĩnh Châu', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('514', 'Thanh Khê', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('515', 'Lộc Hà', '24', '1', '50');
INSERT INTO `web_districts` VALUES ('516', 'Châu Thành', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('517', 'Sơn Trà', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('518', 'Trần Đề', '49', '1', '50');
INSERT INTO `web_districts` VALUES ('519', 'Ngũ Hành Sơn', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('521', 'Liên Chiểu', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('522', 'Vinh', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('524', 'Hoà Vang', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('525', 'Cửa Lò', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('526', 'Bạc Liêu', '3', '1', '50');
INSERT INTO `web_districts` VALUES ('527', 'Vĩnh Lợi', '3', '1', '50');
INSERT INTO `web_districts` VALUES ('528', 'Quỳ Châu', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('529', 'Hồng Dân', '3', '1', '50');
INSERT INTO `web_districts` VALUES ('530', 'Quỳ Hợp', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('531', 'Giá Rai', '3', '1', '50');
INSERT INTO `web_districts` VALUES ('532', 'Nghĩa Đàn', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('533', 'Cẩm Lệ', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('534', 'Phước Long', '3', '1', '50');
INSERT INTO `web_districts` VALUES ('535', 'Quỳnh Lưu', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('536', 'Đông Hải', '3', '1', '50');
INSERT INTO `web_districts` VALUES ('537', 'Kỳ Sơn', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('538', 'Hoà Bình', '3', '1', '50');
INSERT INTO `web_districts` VALUES ('539', 'Tương Dương', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('540', 'Con Cuông', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('542', 'Tân Kỳ', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('543', 'Yên Thành', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('544', 'Diễn Châu', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('545', 'Anh Sơn', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('546', 'Đô Lương', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('547', 'Thanh Chương', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('548', 'Nghi Lộc', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('549', 'Đồng Văn', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('550', 'Mèo Vạc', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('551', 'Nam Đàn', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('553', 'Yên Minh', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('554', 'Hưng Nguyên', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('555', 'Quản Bạ', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('556', 'Vị Xuyên', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('557', 'Quế Phong', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('558', 'Bắc Mê', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('559', 'Thị xã Thái Hòa', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('560', 'Hoàng Su Phì', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('561', 'Cà Mau', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('563', 'Xín Mần', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('564', 'Thới Bình', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('565', 'Thanh Hoá', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('566', 'U Minh', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('567', 'Bắc Quang', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('568', 'Bỉm Sơn', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('569', 'Trần Văn Thời', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('570', 'Sầm Sơn', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('571', 'Quang Bình', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('572', 'Cái Nước', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('573', 'Quan Hoá', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('574', 'Quan Sơn', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('575', 'Mường Lát', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('577', 'Bá Thước', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('578', 'Cao Bằng', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('579', 'Thường Xuân', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('580', 'Bảo Lạc', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('581', 'Thông Nông', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('582', 'Như Xuân', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('583', 'Như Thanh', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('584', 'Lang Chánh', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('585', 'Ngọc Lặc', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('586', 'Thạch Thành', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('587', 'Cẩm Thủy', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('588', 'Hà Quảng', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('589', 'Thọ Xuân', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('590', 'Trà Lĩnh', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('591', 'Vĩnh Lộc', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('592', 'Thiệu Hoá', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('593', 'Triệu Sơn', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('594', 'Đầm Dơi', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('595', 'Nông Cống', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('596', 'Ngọc Hiển', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('597', 'Đông Sơn', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('598', 'Năm Căn', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('599', 'Hà Trung', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('600', 'Phú Tân', '12', '1', '50');
INSERT INTO `web_districts` VALUES ('601', 'Hoằng Hoá', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('603', 'Nga Sơn', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('604', 'Điện Biên Phủ', '69', '1', '1');
INSERT INTO `web_districts` VALUES ('605', 'Hậu Lộc', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('606', 'Mường Lay', '69', '1', '2');
INSERT INTO `web_districts` VALUES ('607', 'Quảng Xương', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('608', 'Điện Biên', '69', '1', '50');
INSERT INTO `web_districts` VALUES ('609', 'Tĩnh Gia', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('610', 'Tuần Giáo', '69', '1', '50');
INSERT INTO `web_districts` VALUES ('611', 'Yên Định', '54', '1', '50');
INSERT INTO `web_districts` VALUES ('612', 'Trùng Khánh', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('613', 'Mường Chà', '69', '1', '50');
INSERT INTO `web_districts` VALUES ('614', 'Tủa Chùa', '69', '1', '50');
INSERT INTO `web_districts` VALUES ('615', 'Nguyên Bình', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('616', 'Điện Biên Đông', '69', '1', '50');
INSERT INTO `web_districts` VALUES ('618', 'Mường Nhé', '69', '1', '50');
INSERT INTO `web_districts` VALUES ('619', 'Thành phố Ninh Bình', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('620', 'Mường Ảng', '69', '1', '50');
INSERT INTO `web_districts` VALUES ('622', 'Tam Điệp', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('623', 'Nho Quan', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('624', 'Gia Viễn', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('625', 'Hoa Lư', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('626', 'Yên Mô', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('628', 'Kim Sơn', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('629', 'Gia Nghĩa', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('630', 'Yên Khánh', '40', '1', '50');
INSERT INTO `web_districts` VALUES ('631', 'Dăk RLấp', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('632', 'Dăk Mil', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('633', 'Cư Jút', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('635', 'Hoà An', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('636', 'Dăk Song', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('637', 'Thái Bình', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('638', 'Quảng Uyên', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('639', 'Krông Nô', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('640', 'Thạch An', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('641', 'Quỳnh Phụ', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('642', 'Dăk GLong', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('643', 'Hạ Lang', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('644', 'Hưng Hà', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('645', 'Tuy Đức', '71', '1', '50');
INSERT INTO `web_districts` VALUES ('646', 'Bảo Lâm', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('647', 'Đông Hưng', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('648', 'Phục Hoà', '13', '1', '50');
INSERT INTO `web_districts` VALUES ('649', 'Vũ Thư', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('651', 'Kiến Xương', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('652', 'Vị Thanh', '70', '1', '50');
INSERT INTO `web_districts` VALUES ('654', 'Vị Thuỷ', '70', '1', '50');
INSERT INTO `web_districts` VALUES ('655', 'Tiền Hải', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('656', 'Lai Châu', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('657', 'Long Mỹ', '70', '1', '50');
INSERT INTO `web_districts` VALUES ('658', 'Thái Thuỵ', '52', '1', '50');
INSERT INTO `web_districts` VALUES ('659', 'Phụng Hiệp', '70', '1', '50');
INSERT INTO `web_districts` VALUES ('660', 'Tam Đường', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('661', 'Châu Thành', '70', '1', '50');
INSERT INTO `web_districts` VALUES ('662', 'Phong Thổ', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('663', 'Châu Thành A', '70', '1', '50');
INSERT INTO `web_districts` VALUES ('665', 'Sìn Hồ', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('666', 'Ngã Bảy', '70', '1', '50');
INSERT INTO `web_districts` VALUES ('667', 'Nam Định', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('668', 'Mường Tè', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('669', 'Mỹ Lộc', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('670', 'Than Uyên', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('671', 'Xuân Trường', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('672', 'Tân Uyên', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('673', 'Giao Thủy', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('674', 'Ý Yên', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('676', 'Vụ Bản', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('677', 'Lào Cai', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('678', 'Nam Trực', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('679', 'Xi Ma Cai', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('680', 'Trực Ninh', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('681', 'Bát Xát', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('682', 'Nghĩa Hưng', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('683', 'Bảo Thắng', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('684', 'Hải Hậu', '38', '1', '50');
INSERT INTO `web_districts` VALUES ('685', 'Sa Pa', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('686', 'Văn Bàn', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('688', 'Phủ Lý', '21', '1', '50');
INSERT INTO `web_districts` VALUES ('689', 'Duy Tiên', '21', '1', '50');
INSERT INTO `web_districts` VALUES ('690', 'Bảo Yên', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('691', 'Kim Bảng', '21', '1', '50');
INSERT INTO `web_districts` VALUES ('692', 'Bắc Hà', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('693', 'Lý Nhân', '21', '1', '50');
INSERT INTO `web_districts` VALUES ('694', 'Mường Khương', '35', '1', '50');
INSERT INTO `web_districts` VALUES ('695', 'Thanh Liêm', '21', '1', '50');
INSERT INTO `web_districts` VALUES ('696', 'Bình Lục', '21', '1', '50');
INSERT INTO `web_districts` VALUES ('698', 'Hoà Bình', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('699', 'Đà Bắc', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('700', 'Mai Châu', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('701', 'Tân Lạc', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('702', 'Lạc Sơn', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('703', 'Kỳ Sơn', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('704', 'Lương Sơn', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('705', 'Kim Bôi', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('706', 'Lạc Thuỷ', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('707', 'Yên Thuỷ', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('708', 'Cao Phong', '27', '1', '50');
INSERT INTO `web_districts` VALUES ('710', 'Hưng Yên', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('711', 'Kim Động', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('712', 'Ân Thi', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('713', 'Khoái Châu', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('714', 'Yên Mỹ', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('715', 'Tiên Lữ', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('716', 'Phù Cừ', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('717', 'Mỹ Hào', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('718', 'Văn Lâm', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('719', 'Văn Giang', '28', '1', '50');
INSERT INTO `web_districts` VALUES ('721', 'Hải Dương', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('722', 'Chí Linh', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('723', 'Nam Sách', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('724', 'Kinh Môn', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('725', 'Gia Lộc', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('726', 'Tứ Kỳ', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('727', 'Thanh Miện', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('728', 'Ninh Giang', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('729', 'Cẩm Giàng', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('730', 'Thanh Hà', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('731', 'Kim Thành', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('732', 'Bình Giang', '25', '1', '50');
INSERT INTO `web_districts` VALUES ('734', 'Bắc Ninh', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('735', 'Yên Phong', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('736', 'Quế Võ', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('737', 'Tiên Du', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('738', 'Từ  Sơn', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('739', 'Thuận Thành', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('740', 'Gia Bình', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('741', 'Lương Tài', '6', '1', '50');
INSERT INTO `web_districts` VALUES ('743', 'Bắc Giang', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('744', 'Yên Thế', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('745', 'Lục Ngạn', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('746', 'Sơn Động', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('747', 'Lục Nam', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('748', 'Tân Yên', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('749', 'Hiệp Hoà', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('750', 'Lạng Giang', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('751', 'Việt Yên', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('752', 'Yên Dũng', '5', '1', '50');
INSERT INTO `web_districts` VALUES ('754', 'Hạ Long', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('755', 'Cẩm Phả', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('756', 'Uông Bí', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('757', 'Móng Cái', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('758', 'Bình Liêu', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('759', 'Đầm Hà', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('760', 'Hải Hà', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('761', 'Tiên Yên', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('762', 'Ba Chẽ', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('763', 'Đông Triều', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('764', 'Yên Hưng', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('765', 'Hoành Bồ', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('766', 'Vân Đồn', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('767', 'Cô Tô', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('769', 'Vĩnh Yên', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('770', 'Tam Dương', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('771', 'Lập Thạch', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('772', 'Vĩnh Tường', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('773', 'Yên Lạc', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('774', 'Bình Xuyên', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('775', 'Sông Lô', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('776', 'Phúc Yên', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('777', 'Tam Đảo', '60', '1', '50');
INSERT INTO `web_districts` VALUES ('778', 'Thành phố Nha Trang', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('779', 'Huyện Vạn Ninh', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('780', 'Huyện Ninh Hoà', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('781', 'Huyện Diên Khánh', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('782', 'Huyện Khánh Vĩnh', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('783', 'Thị xã Cam Ranh', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('784', 'Huyện Khánh Sơn', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('785', 'Huyện đảo Trường Sa', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('786', 'Huyện Cam Lâm', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('787', 'Hoàng Sa', '15', '1', '50');
INSERT INTO `web_districts` VALUES ('789', 'Ban Mê Thuột', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('790', 'Lạc Thiện', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('791', 'Đắk Song', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('792', 'Buôn Hồ', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('793', 'M&#39;Đrak', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('794', 'Phường Vĩnh Hải', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('795', 'Phường Vĩnh Phước', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('796', 'Phường Vĩnh Thọ', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('797', 'Phường Xương Huân', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('798', 'Phường Vạn Thắng', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('799', 'Phường Vạn Thạnh', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('800', 'Phường Phương Sài', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('801', 'Phường Phương Sơn', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('802', 'Phường Ngọc Hiệp', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('803', 'Phường Phước Hoà', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('804', 'Phường Phước Tân', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('805', 'Phường Phước Tiến', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('806', 'Phường Phước Hải', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('807', 'Phường Lộc Thọ', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('808', 'Phường Tân Lập', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('809', 'Phường Vĩnh Nguyên', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('810', 'Phường Vĩnh Trường', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('811', 'Phường Phước Long', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('812', 'Phường Vĩnh Hoà', '68', '1', '50');
INSERT INTO `web_districts` VALUES ('813', 'Phường 1', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('814', 'Phường 2', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('815', 'Phường 3', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('816', 'Phường 4', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('817', 'Phường 5', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('818', 'Phường 6', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('819', 'Phường 7', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('820', 'Phường 8', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('821', 'Phường 9', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('822', 'Phường 10', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('823', 'Phường 11', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('824', 'Phường 12', '67', '1', '50');
INSERT INTO `web_districts` VALUES ('827', 'Bắc Từ Liêm', '22', '1', '50');
INSERT INTO `web_districts` VALUES ('829', 'Bàu Bàng', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('831', 'Bắc Tân Uyên', '8', '1', '50');
INSERT INTO `web_districts` VALUES ('833', 'Cư M&#39;gaR', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('835', 'Cư Kuin', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('837', 'Ea H&#39;leo', '72', '1', '50');
INSERT INTO `web_districts` VALUES ('839', 'Thạch Hóa', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('841', 'Kiến Tường', '37', '1', '50');
INSERT INTO `web_districts` VALUES ('843', 'Thị xã Ba Đồn', '44', '1', '50');
INSERT INTO `web_districts` VALUES ('845', 'Thành phố Hà Giang', '20', '1', '50');
INSERT INTO `web_districts` VALUES ('847', 'Nậm Nhùm', '33', '1', '50');
INSERT INTO `web_districts` VALUES ('849', 'Huyện Cao Lãnh', '18', '1', '50');
INSERT INTO `web_districts` VALUES ('851', 'Thị xã Quảng Trị', '48', '1', '50');
INSERT INTO `web_districts` VALUES ('853', 'Thị xã Hoàng Mai', '39', '1', '50');
INSERT INTO `web_districts` VALUES ('855', 'Thị xã Quảng Yên', '47', '1', '50');
INSERT INTO `web_districts` VALUES ('857', 'Lâm Bình', '58', '1', '50');
INSERT INTO `web_districts` VALUES ('859', 'Huyện Kỳ Anh', '24', '1', '50');

-- ----------------------------
-- Table structure for web_info
-- ----------------------------
DROP TABLE IF EXISTS `web_info`;
CREATE TABLE `web_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `info_title` varchar(255) DEFAULT NULL,
  `info_keyword` varchar(255) DEFAULT NULL COMMENT 'keyword',
  `info_intro` longtext,
  `info_content` longtext,
  `info_img` varchar(255) DEFAULT NULL,
  `info_created` varchar(15) DEFAULT NULL,
  `info_order_no` int(11) DEFAULT '0',
  `info_status` tinyint(4) DEFAULT '0' COMMENT 'Item enabled status (1 = enabled, 0 = disabled)',
  `meta_title` text COMMENT 'Meta title',
  `meta_keywords` text COMMENT 'Meta keywords',
  `meta_description` text COMMENT 'Meta description',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores news content.';

-- ----------------------------
-- Records of web_info
-- ----------------------------
INSERT INTO `web_info` VALUES ('1', null, 'Thông tin chân trang bên trái', 'SITE_FOOTER_LEFT', '', '<p><strong>T&ecirc;n đăng k&yacute;: </strong>C&ocirc;ng ty Cổ truyền th&ocirc;ng raovat30s</p>\r\n\r\n<p><strong>T&ecirc;n giao dịch: </strong>Raovat30s Online JSC</p>\r\n\r\n<p><strong>Địa chỉ trụ sở: </strong>Tầng 2, T&ograve;a nh&agrave; CT2A - KĐT Nghĩa Đ&ocirc;, Ho&agrave;ng Quốc Việt, Cầu Giấy, H&agrave; Nội.</p>\r\n\r\n<p><strong>Điện thoại: </strong>0913.922.986</p>\r\n\r\n<p><strong>Email: </strong>raovat@raovat30s.vn</p>\r\n\r\n<p><strong>Giấy chứng nhận đăng k&yacute; kinh doanh số 0305056245 do Sở Kế hoạch v&agrave; Đầu tư Th&agrave;nh phố H&agrave; Nội cấp ng&agrave;y 22/12/2016</strong></p>\r\n', '1481877283-573cb4258e810763aa000001.jpg', '1447794727', '1', '1', '', '', '');

-- ----------------------------
-- Table structure for web_items
-- ----------------------------
DROP TABLE IF EXISTS `web_items`;
CREATE TABLE `web_items` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `item_type_action` tinyint(1) DEFAULT '1' COMMENT '1: Cần bán/ Tuyển sinh, 2:Cần mua/ Tuyển dụng',
  `item_type_price` tinyint(2) DEFAULT '0' COMMENT '0:liên hệ, 1:có giá bán',
  `item_price_sell` int(11) DEFAULT '0' COMMENT 'Giá bán',
  `item_area_price` int(11) DEFAULT '0' COMMENT 'Khoảng giá của tin đăng',
  `item_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'nội dung sản phẩm',
  `item_image` varchar(255) DEFAULT NULL COMMENT 'ảnh SP chính ',
  `item_image_other` longtext COMMENT 'danh sach ảnh khác',
  `item_category_id` int(11) DEFAULT NULL COMMENT 'danh mục tin',
  `item_category_name` varchar(255) DEFAULT NULL,
  `item_category_parent_id` int(11) DEFAULT '100' COMMENT 'danh mục cha',
  `item_category_parent_name` varchar(255) DEFAULT '0',
  `item_number_view` int(11) DEFAULT '0' COMMENT 'Lượt xem',
  `item_status` tinyint(5) DEFAULT '1' COMMENT '0:ẩn, 1:hiện,',
  `item_is_hot` tinyint(5) DEFAULT '0' COMMENT '0: tin thường, 1: tin nổi bật, 2',
  `item_block` tinyint(5) DEFAULT '1' COMMENT '0: bị khóa, 1: không bị khóa',
  `item_province_id` int(10) DEFAULT '0' COMMENT 'tỉnh thành đăng tin',
  `item_province_name` varchar(50) DEFAULT NULL,
  `item_district_id` int(10) DEFAULT '0' COMMENT 'Quân./huyện',
  `item_district_name` varchar(50) DEFAULT NULL,
  `customer_id` int(11) DEFAULT '0' COMMENT 'id khách đăng tin',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Tên khách đăng tin',
  `is_customer` tinyint(5) DEFAULT '0' COMMENT '0:tin thường, 1: tin vip',
  `time_ontop` int(11) DEFAULT '0' COMMENT 'thời gian để ontop tin',
  `time_created` int(11) DEFAULT '0',
  `time_update` int(11) DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_items
-- ----------------------------
INSERT INTO `web_items` VALUES ('1', 'tin thứ 1', '1', '1', '3234324', '0', '<p>&aacute;dasdasd<br />\r\n&nbsp;</p>\r\n', '1480492436-1401002910598828940672831075709428n.jpg', 'a:1:{i:0;s:50:\"1480492436-1401002910598828940672831075709428n.jpg\";}', '253', 'Mua bán nhà đất', '100', '0', '0', '1', '0', '1', '22', null, '2', null, '1', 'Trương Mạnh Quỳnh', '1', '1480063979', '1480061746', '1480492477');
INSERT INTO `web_items` VALUES ('2', 'tin thứ 2', '1', '1', '250000', '0', '', '1480998156-573cb4258e810763aa000001.jpg', 'a:1:{i:0;s:39:\"1480998156-573cb4258e810763aa000001.jpg\";}', '254', 'Thuê nhà đất', '100', '0', '0', '1', '0', '1', '22', null, '2', null, '1', 'Trương Mạnh Quỳnh', '1', '1480063979', '1480063979', '1480998160');
INSERT INTO `web_items` VALUES ('3', 'tin thứ 3', '1', '1', '320000', '0', '', '1480998169-57355c1302b01f7898000001.jpg', 'a:1:{i:0;s:39:\"1480998169-57355c1302b01f7898000001.jpg\";}', '255', 'Ôtô', '100', '0', '0', '1', '0', '1', '22', null, '2', null, '1', 'Trương Mạnh Quỳnh', '1', '1480063979', '1480063979', '1480998171');
INSERT INTO `web_items` VALUES ('4', 'mỹ phẩm làm đẹp', '1', '1', '0', '0', '', '1480998189-957158d02c3c80.jpg', 'a:1:{i:0;s:29:\"1480998189-957158d02c3c80.jpg\";}', '254', 'Thuê nhà đất', '100', '0', '0', '1', '0', '1', '22', null, '2', null, '1', 'Trương Mạnh Quỳnh', '1', '0', '1480998189', '1480998200');
INSERT INTO `web_items` VALUES ('5', 'sdaasd', '1', '2', '0', '0', '<p>Tho&aacute;ng!</p>\r\n\r\n<p>Thu đ&atilde; qua rồi, em cũng xa,<br />\r\nChỉ c&oacute; m&ugrave;a đ&ocirc;ng bước v&agrave;o nh&agrave;,<br />\r\nVới ch&uacute;t nắng phai c&ograve;n ngơ ngẩn,<br />\r\nLạc lối l&agrave;m xanh ngắt l&ograve;ng tr&agrave;!</p>\r\n', '1480999210-c6cf7704ba9e447d51a3fc60ef8e66f9cropnorth.jpg', 'a:1:{i:0;s:56:\"1480999210-c6cf7704ba9e447d51a3fc60ef8e66f9cropnorth.jpg\";}', '254', 'Thuê nhà đất', '100', '0', '0', '1', '0', '1', '22', null, '2', null, '1', 'Trương Mạnh Quỳnh', '1', '1480999194', '1480999194', '1480999213');
INSERT INTO `web_items` VALUES ('6', 'làm đẹp', '1', '1', '0', '0', '<p>Tho&aacute;ng!</p>\r\n\r\n<p>Thu đ&atilde; qua rồi, em cũng xa,<br />\r\nChỉ c&oacute; m&ugrave;a đ&ocirc;ng bước v&agrave;o nh&agrave;,<br />\r\nVới ch&uacute;t nắng phai c&ograve;n ngơ ngẩn,<br />\r\nLạc lối l&agrave;m xanh ngắt l&ograve;ng tr&agrave;!<img alt=\"undefined\" src=\"http://localhost/goingay/uploads/thumbs/product/6/600x600/1480999231-9572042c1a3f27.jpg\" /></p>\r\n', '1480999231-9572042c1a3f27.jpg', 'a:1:{i:0;s:29:\"1480999231-9572042c1a3f27.jpg\";}', '255', 'Ôtô', '100', '0', '0', '1', '0', '1', '22', null, '2', null, '1', 'Trương Mạnh Quỳnh', '1', '1480999231', '1480999231', '1480999242');
INSERT INTO `web_items` VALUES ('7', 'tin đăng ko có ảnh', '1', '2', '0', '0', '<p>xem c&oacute; hiển thị ảnh ko</p>\r\n', '', null, '260', 'Điện tử - Kỹ thuật số', '100', '0', '0', '1', '0', '1', '22', 'Hà Nội', '2', null, '1', 'Trương Mạnh Quỳnh', '1', '1483438739', '1483438739', '1483438739');

-- ----------------------------
-- Table structure for web_news
-- ----------------------------
DROP TABLE IF EXISTS `web_news`;
CREATE TABLE `web_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(255) DEFAULT NULL,
  `news_desc_sort` text,
  `news_content` text,
  `news_image` varchar(255) DEFAULT NULL COMMENT 'ảnh đại diện của bài viết',
  `news_image_other` varchar(255) DEFAULT NULL COMMENT 'Lưu ảnh của bài viết',
  `news_type` tinyint(5) DEFAULT '1' COMMENT 'Kiểu tin',
  `news_category` int(11) DEFAULT NULL,
  `news_status` tinyint(5) DEFAULT NULL,
  `news_create` int(11) DEFAULT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_news
-- ----------------------------
INSERT INTO `web_news` VALUES ('1', 'tin tức hàng ngày', 'Hôm nay (5/12) sẽ là thời điểm điều chỉnh giá xăng dầu của chu kỳ mới. Theo dữ liệu giá thành phẩm trên thị trường Singapore được Bộ Công Thương công bố, bình quân giá xăng RON 92 ở mức 58 USD một thùng, tăng 5,4% so với chu kỳ trước (55 USD một thùng). Đáng chú ý, những ngày gần đây giá xăng tăng lên gần 60 USD một thùng.', '<p>H&ocirc;m nay (5/12) sẽ l&agrave; thời điểm điều chỉnh gi&aacute; xăng dầu của chu kỳ mới.&nbsp;Theo dữ liệu gi&aacute; th&agrave;nh phẩm tr&ecirc;n thị trường Singapore được Bộ C&ocirc;ng&nbsp;Thương c&ocirc;ng bố, b&igrave;nh qu&acirc;n gi&aacute; xăng RON 92 ở mức 58 USD một th&ugrave;ng, tăng 5,4% so với chu kỳ trước (55 USD một th&ugrave;ng). Đ&aacute;ng ch&uacute; &yacute;, những ng&agrave;y gần đ&acirc;y gi&aacute; xăng tăng l&ecirc;n gần 60 USD một th&ugrave;ng.</p>\r\n\r\n<p>Chia sẻ với <em>VnExpress</em>, nhiều doanh nghiệp đầu mối ở TP HCM cho biết, những ng&agrave;y qua gi&aacute; xăng thế giới lại tiếp tục tăng, do vậy tại chu kỳ điều chỉnh mới xăng sẽ đứng trước &aacute;p lực tăng gi&aacute; mạnh.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"xang-co-the-tang-gia-manh-hom-nay\" src=\"http://img.f25.kinhdoanh.vnecdn.net/2016/12/04/xang-6751-1480822899.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Gi&aacute; xăng c&oacute; thể tăng mạnh ng&agrave;y mai theo gi&aacute; thế giới.&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>L&atilde;nh đạo 2 doanh nghiệp đầu mối ở TP HCM cho biết, cơ quan quản l&yacute; c&oacute; thể kết hợp song song biện ph&aacute;p vừa sử dụng quỹ b&igrave;nh ổn vừa tăng gi&aacute;. Đối với trường hợp n&agrave;y, gi&aacute; xăng c&oacute; thể chỉ tăng quanh mức 200-400 đồng một l&iacute;t v&agrave; gi&aacute; dầu cũng được điều chỉnh tăng ở mức tương tự.</p>\r\n\r\n<p>&ldquo;B&ecirc;n cạnh đ&oacute;, nếu cơ quan quản l&yacute; kh&ocirc;ng sử dụng quỹ b&igrave;nh ổn th&igrave; gi&aacute; xăng c&oacute; thể tăng 500-600 đồng một l&iacute;t. Đ&acirc;y cũng l&agrave; kỳ điều chỉnh khiến gi&aacute; b&aacute;n lẻ c&oacute; thể quay về mốc của kỳ điều chỉnh đầu th&aacute;ng 11&rdquo;, l&atilde;nh đạo doanh nghiệp đầu mối ở Thủ Đức n&oacute;i.</p>\r\n\r\n<p>Tại kỳ điều chỉnh trước, gi&aacute; cơ sở mỗi l&iacute;t xăng RON 92 được y&ecirc;u cầu giảm 521 đồng, khiến gi&aacute; b&aacute;n lẻ kh&ocirc;ng được cao hơn 16.371 đồng. Xăng E5 giảm 355 đồng, xuống mức tối đa l&agrave; 16.221 đồng một l&iacute;t. Gi&aacute; dầu diesel cũng giảm 514 đồng, trong khi dầu hỏa v&agrave; mad&uacute;t lần lượt giảm 578 v&agrave; 373 đồng một l&iacute;t, kg.</p>\r\n\r\n<p>Từ đầu năm đến nay, mặt h&agrave;ng n&agrave;y trải qua 21 lần điều chỉnh, với 11 lần tăng v&agrave; 10 lần giảm.</p>\r\n', '1480910791-573cb4258e810763aa000001.jpg', 'a:1:{i:0;s:39:\"1480910791-573cb4258e810763aa000001.jpg\";}', '3', '7', '1', '1480910791');
INSERT INTO `web_news` VALUES ('2', 'dang test 333', 'Trong thời gian hồ thủy lợi Phú Ninh (Quảng Nam) xả lũ, nhiều người dùng lưới chắn phía trên cống đón cá mè chui vào lồng và bắt được 2-3 tấn/ngày.', '<p>Ng&agrave;y 23/11, với tr&ecirc;n 95% đại biểu t&aacute;n th&agrave;nh, Quốc hội đ&atilde; th&ocirc;ng qua Nghị quyết về chất vấn v&agrave; trả lời chất vấn tại kỳ họp thứ 2, Quốc hội kh&oacute;a 14.</p>\r\n\r\n<p>Theo đ&oacute;, Quốc hội ph&ecirc; ph&aacute;n nghi&ecirc;m khắc &ocirc;ng Vũ Huy Ho&agrave;ng, Bộ trưởng C&ocirc;ng Thương nhiệm kỳ 2011-2016, do đ&atilde; c&oacute; những vi phạm về c&ocirc;ng t&aacute;c c&aacute;n bộ trong thời gian đảm nhiệm chức vụ n&ecirc;u tr&ecirc;n, g&acirc;y hậu quả nghi&ecirc;m trọng, ảnh hưởng xấu đến uy t&iacute;n của Đảng, Nh&agrave; nước, Bộ C&ocirc;ng Thương, g&acirc;y bức x&uacute;c trong x&atilde; hội.</p>\r\n\r\n<p>Quốc hội giao Ủy ban Thường vụ Quốc hội, Ch&iacute;nh phủ, c&aacute;c cơ quan bảo vệ ph&aacute;p luật tiếp tục l&agrave;m r&otilde; v&agrave; xử l&yacute; theo quy định của ph&aacute;p luật những vi phạm của cựu Bộ trưởng Vũ Huy Ho&agrave;ng. Đồng thời, tăng cường c&ocirc;ng t&aacute;c gi&aacute;m s&aacute;t, quản l&yacute; c&aacute;n bộ; tạo cơ sở ph&aacute;p l&yacute; đồng bộ để xử l&yacute; c&ocirc;ng bằng v&agrave; nghi&ecirc;m minh c&aacute;c h&agrave;nh vi vi phạm của c&aacute;n bộ, c&ocirc;ng chức, vi&ecirc;n chức, kể cả khi đ&atilde; chuyển c&ocirc;ng t&aacute;c hoặc nghỉ hưu.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"quoc-hoi-yeu-cau-lam-ro-vi-pham-cua-ong-vu-huy-hoang\" src=\"http://img.f29.vnecdn.net/2016/11/23/ky-thu-2-quoc-hoi-4930-1479103-5305-4580-1479869719.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Quốc hội ph&ecirc; ph&aacute;n cựu Bộ trưởng C&ocirc;ng Thương Vũ Huy Ho&agrave;ng. Ảnh minh họa: <em>Giang Huy</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Quốc hội cũng y&ecirc;u cầu rà soát, đánh giá t&ocirc;̉ng th&ecirc;̉ về thực trạng, mức đ&ocirc;̣ thi&ecirc;̣t hại, khẩn trương xử lý dứt điểm đ&ocirc;́i với các dự án thua lỗ, kém hi&ecirc;̣u quả, kh&ocirc;ng đ&ecirc;̉ tiếp tục kéo dài g&acirc;y thi&ecirc;̣t hại cho Nhà nước. Đồng thời, xác định rõ trách nhi&ecirc;̣m v&agrave; xử l&yacute; nghi&ecirc;m đối với c&aacute;c cơ quan, tổ chức, c&aacute; nh&acirc;n có sai phạm trong qu&aacute; tr&igrave;nh đầu tư.</p>\r\n\r\n<p>Trước đ&oacute;, nhiều đại biểu đ&atilde; chất vấn Bộ trưởng C&ocirc;ng Thương Trần Tuấn Anh về 5 dự &aacute;n ngh&igrave;n tỷ thua lỗ, nguy cơ ph&aacute; sản, gồm: Nh&agrave; m&aacute;y sản xuất xơ sợi Đ&igrave;nh Vũ; nh&agrave; m&aacute;y Nhi&ecirc;n liệu sinh học Bio-Ethanol Dung Quất; nh&agrave; m&aacute;y gang th&eacute;p Th&aacute;i Nguy&ecirc;n giai đoạn 2; nh&agrave; m&aacute;y bột giấy Phương Nam, tỉnh Long An; nh&agrave; m&aacute;y Đạm Ninh B&igrave;nh.</p>\r\n\r\n<p>Trong lĩnh vực t&agrave;i nguy&ecirc;n m&ocirc;i trường, Quốc hội y&ecirc;u cầu gi&aacute;m s&aacute;t chặt chẽ c&aacute;c t&aacute;c nh&acirc;n g&acirc;y &ocirc; nhiễm m&ocirc;i trường của dự &aacute;n Formosa H&agrave; Tĩnh, theo d&otilde;i v&agrave; c&oacute; biện ph&aacute;p phục hồi m&ocirc;i trường biển, thực hiện c&oacute; hiệu quả c&ocirc;ng t&aacute;c bồi thường, sớm ổn định sản xuất v&agrave; đời sống của người d&acirc;n trong v&ugrave;ng bị thiệt hại ở c&aacute;c tỉnh miền Trung.</p>\r\n\r\n<p>&quot;Bảo đảm thực hiện đầy đủ c&aacute;c cam kết của chủ dự &aacute;n trước khi đi v&agrave;o sản xuất&quot;, Nghị quyết n&ecirc;u r&otilde;.</p>\r\n\r\n<p>Phi&ecirc;n chất vấn của kỳ họp thứ 2, Quốc hội kh&oacute;a 14 diễn ra trong 2,5 ng&agrave;y (từ 15 đến s&aacute;ng 17/11), với 4 Bộ trưởng: C&ocirc;ng Thương; T&agrave;i nguy&ecirc;n M&ocirc;i trường; Gi&aacute;o dục Đ&agrave;o tạo; Nội vụ v&agrave; Thủ tướng đ&atilde; đăng đ&agrave;n.</p>\r\n', '1480921480-57355c1302b01f7898000001.jpg', 'a:1:{i:0;s:39:\"1480921480-57355c1302b01f7898000001.jpg\";}', '3', '7', '1', '1480921480');

-- ----------------------------
-- Table structure for web_province
-- ----------------------------
DROP TABLE IF EXISTS `web_province`;
CREATE TABLE `web_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(255) NOT NULL,
  `province_position` tinyint(4) NOT NULL,
  `province_status` varchar(20) NOT NULL,
  `province_area` tinyint(4) NOT NULL COMMENT 'Vùng miền của tỉnh thành',
  PRIMARY KEY (`province_id`),
  KEY `position` (`province_position`),
  KEY `status` (`province_status`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_province
-- ----------------------------
INSERT INTO `web_province` VALUES ('3', 'Bạc Liêu', '6', '1', '3');
INSERT INTO `web_province` VALUES ('4', 'Bắc Cạn', '7', '1', '1');
INSERT INTO `web_province` VALUES ('5', 'Bắc Giang', '6', '1', '1');
INSERT INTO `web_province` VALUES ('6', 'Bắc Ninh', '7', '1', '1');
INSERT INTO `web_province` VALUES ('7', 'Bến Tre', '8', '1', '3');
INSERT INTO `web_province` VALUES ('8', 'Bình Dương', '9', '1', '3');
INSERT INTO `web_province` VALUES ('9', 'Bình Định', '10', '1', '2');
INSERT INTO `web_province` VALUES ('10', 'Bình Phước', '11', '1', '2');
INSERT INTO `web_province` VALUES ('11', 'Bình Thuận', '12', '1', '2');
INSERT INTO `web_province` VALUES ('12', 'Cà Mau', '13', '1', '3');
INSERT INTO `web_province` VALUES ('13', 'Cao Bằng', '14', '1', '1');
INSERT INTO `web_province` VALUES ('14', 'Cần Thơ', '8', '1', '3');
INSERT INTO `web_province` VALUES ('15', 'Đà Nẵng', '3', '1', '2');
INSERT INTO `web_province` VALUES ('17', 'Đồng Nai', '18', '1', '3');
INSERT INTO `web_province` VALUES ('18', 'Đồng Tháp', '19', '1', '3');
INSERT INTO `web_province` VALUES ('19', 'Gia Lai', '20', '1', '2');
INSERT INTO `web_province` VALUES ('20', 'Hà Giang', '21', '1', '1');
INSERT INTO `web_province` VALUES ('21', 'Hà Nam', '22', '1', '1');
INSERT INTO `web_province` VALUES ('22', 'Hà Nội', '1', '1', '1');
INSERT INTO `web_province` VALUES ('23', 'Hà Tây', '24', '1', '1');
INSERT INTO `web_province` VALUES ('24', 'Hà Tĩnh', '25', '1', '2');
INSERT INTO `web_province` VALUES ('25', 'Hải Dương', '26', '1', '1');
INSERT INTO `web_province` VALUES ('26', 'Hải Phòng', '5', '1', '1');
INSERT INTO `web_province` VALUES ('27', 'Hòa Bình', '28', '1', '1');
INSERT INTO `web_province` VALUES ('28', 'Hưng Yên', '29', '1', '1');
INSERT INTO `web_province` VALUES ('29', 'TP Hồ Chí Minh', '2', '1', '3');
INSERT INTO `web_province` VALUES ('30', 'Khánh Hòa', '31', '1', '2');
INSERT INTO `web_province` VALUES ('31', 'Kiên Giang', '32', '1', '3');
INSERT INTO `web_province` VALUES ('32', 'Kon Tum', '33', '1', '2');
INSERT INTO `web_province` VALUES ('33', 'Lai Châu', '34', '1', '1');
INSERT INTO `web_province` VALUES ('34', 'Lạng Sơn', '35', '1', '1');
INSERT INTO `web_province` VALUES ('35', 'Lào Cai', '36', '1', '1');
INSERT INTO `web_province` VALUES ('36', 'Lâm Đồng', '37', '1', '2');
INSERT INTO `web_province` VALUES ('37', 'Long An', '38', '1', '3');
INSERT INTO `web_province` VALUES ('38', 'Nam Định', '39', '1', '1');
INSERT INTO `web_province` VALUES ('39', 'Nghệ An', '40', '1', '2');
INSERT INTO `web_province` VALUES ('40', 'Ninh Bình', '41', '1', '1');
INSERT INTO `web_province` VALUES ('41', 'Ninh Thuận', '42', '1', '2');
INSERT INTO `web_province` VALUES ('42', 'Phú Thọ', '43', '1', '1');
INSERT INTO `web_province` VALUES ('43', 'Phú Yên', '44', '1', '2');
INSERT INTO `web_province` VALUES ('44', 'Quảng Bình', '45', '1', '2');
INSERT INTO `web_province` VALUES ('45', 'Quảng Nam', '46', '1', '2');
INSERT INTO `web_province` VALUES ('46', 'Quảng Ngãi', '47', '1', '2');
INSERT INTO `web_province` VALUES ('47', 'Quảng Ninh', '7', '1', '1');
INSERT INTO `web_province` VALUES ('48', 'Quảng Trị', '49', '1', '2');
INSERT INTO `web_province` VALUES ('49', 'Sóc Trăng', '50', '1', '3');
INSERT INTO `web_province` VALUES ('50', 'Sơn La', '51', '1', '1');
INSERT INTO `web_province` VALUES ('51', 'Tây Ninh', '52', '1', '3');
INSERT INTO `web_province` VALUES ('52', 'Thái Bình', '53', '1', '1');
INSERT INTO `web_province` VALUES ('53', 'Thái Nguyên', '54', '1', '1');
INSERT INTO `web_province` VALUES ('54', 'Thanh Hóa', '55', '1', '1');
INSERT INTO `web_province` VALUES ('55', 'Thừa Thiên Huế', '56', '1', '2');
INSERT INTO `web_province` VALUES ('56', 'Tiền Giang', '57', '1', '3');
INSERT INTO `web_province` VALUES ('57', 'Trà Vinh', '58', '1', '3');
INSERT INTO `web_province` VALUES ('58', 'Tuyên Quang', '59', '1', '1');
INSERT INTO `web_province` VALUES ('59', 'Vĩnh Long', '60', '1', '3');
INSERT INTO `web_province` VALUES ('60', 'Vĩnh Phúc', '61', '1', '1');
INSERT INTO `web_province` VALUES ('61', 'Yên Bái', '62', '1', '1');
INSERT INTO `web_province` VALUES ('66', 'An giang', '62', '1', '3');
INSERT INTO `web_province` VALUES ('67', 'Vũng Tàu', '6', '1', '3');
INSERT INTO `web_province` VALUES ('68', 'Nha Trang', '4', '1', '0');
INSERT INTO `web_province` VALUES ('69', 'Điện Biên', '0', '0', '0');
INSERT INTO `web_province` VALUES ('70', 'Hậu Giang', '15', '1', '0');

-- ----------------------------
-- Table structure for web_trash
-- ----------------------------
DROP TABLE IF EXISTS `web_trash`;
CREATE TABLE `web_trash` (
  `trash_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `trash_obj_id` int(11) DEFAULT NULL,
  `trash_title` varchar(255) DEFAULT NULL,
  `trash_class` varchar(255) DEFAULT NULL,
  `trash_content` longtext,
  `trash_image` longtext,
  `trash_image_other` longtext,
  `trash_folder` varchar(255) DEFAULT NULL,
  `trash_created` int(12) DEFAULT NULL,
  PRIMARY KEY (`trash_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of web_trash
-- ----------------------------
INSERT INTO `web_trash` VALUES ('1', null, '4', 'Thông tin liên hệ', 'Info', 'a:12:{s:7:\"info_id\";i:4;s:10:\"info_title\";s:21:\"Thông tin liên hệ\";s:12:\"info_keyword\";s:12:\"SITE_CONTACT\";s:10:\"info_intro\";N;s:12:\"info_content\";s:557:\"<p>X&atilde; hội ng&agrave;y c&agrave;ng ph&aacute;t triển, cuộc sống ng&agrave;y c&agrave;ng được n&acirc;ng cao, v&agrave; những nhu cầu tiện nghi cho cuộc sống con người cũng v&igrave; thế m&agrave; n&acirc;ng l&ecirc;n, k&egrave;m theo đ&oacute; l&agrave; những th&uacute; vui sưu tầm v&agrave; sở hữu những sản phẩm phục vụ cho cuộc sống ng&agrave;y c&agrave;ng lớn. SanPhamReDep.COM l&agrave; nơi cung cấp v&agrave; phục vụ tốt nhất về c&aacute;c loại sản phẩm n&agrave;y.</p>\r\n\";s:8:\"info_img\";N;s:12:\"info_created\";s:10:\"1441430633\";s:13:\"info_order_no\";i:1;s:11:\"info_status\";i:1;s:10:\"meta_title\";s:21:\"Thông tin liên hệ\";s:13:\"meta_keywords\";s:21:\"Thông tin liên hệ\";s:16:\"meta_description\";s:21:\"Thông tin liên hệ\";}', '', 'a:0:{}', '', '1478450941');