<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2016
* @Version	 : 1.0
*/

global $base_url, $language;

//Redirect link
$q = $_GET['q'];
if($q == 'user/login' || $q =='user/register' || $q =='search' || $q =='comment' || $q =='comment/reply' || $q =='admin' || $q =='filter/tips'){
	drupal_goto($base_url);
	exit();
}

//Num record
define("SITE_RECORD_PER_PAGE", 	30);
define('SITE_SCROLL_PAGE', 		3);
define('SITE_SAME_RECORD', 		5);

define("PATH_UPLOAD", DRUPAL_ROOT.'/uploads');
define('base_url_lang', $base_url .'/'. ((!isset($language->language) || $language->language == 'und' || $language->language == 'vi') ? 'vi/' : $language->language.'/'));

define('AJAX_DOMAIN', '/cucdienanh.vn/');//check preg_match ajax
define('WEB_SITE', 'Cucdienanh.vn');//suffix link and alt

define('IS_DEV', 1);// 0:local, 1:web
define('NOT_POST', 'Chưa có bài viết nào...');

//Tables for website
define('TABLE_TYPE', 			'web_type');
define('TABLE_CATEGORY',       	'web_category');
define('TABLE_NEWS',           	'web_news');
define('TABLE_COMMENT',         'web_comment');
define('TABLE_CONTACT',        	'web_contact');

define('TABLE_BANNER',         	'web_banner');
define('TABLE_VIDEO',			'web_video');
define('TABLE_DOCUMENT',		'web_document');
define('TABLE_IMAGE',		    'web_images');

define('TABLE_USERS',		    'users');
define('TABLE_ROLE',		    'role');
define('TABLE_USERS_ROLES',		'users_roles');

define('TABLE_CONFIG_INFO',    	'web_config_info');
define('TABLE_SUPPORT_ONLINE', 	'web_support_online');

//Folder images
define('FOLDER_DEFAULT', 'img_other');
define('FOLDER_BANNER', 'banner');
define('FOLDER_VIDEO', 'video');
define('FOLDER_NEWS', 'news');
define('FOLDER_IMAGE', 'slide_image');
define('FOLDER_DOCUMENT', 'document');

//Common
define('STASTUS_MENU_LEFT', 1);
define('STASTUS_MENU_RIGHT', 2);

define('STASTUS_HIDE', 0);
define('STASTUS_SHOW', 1);

define('CONTACT_NEW', 1);
define('CONTACT_OK', 2);

define('COMMENT_OK_REPLY', 0);//comment is reply
define('COMMENT_NOT_REPLY', 1);

define('BANNER_TYPE_CONTENT_HOME', 1);
define('BANNER_TYPE_LEFT', 2);
define('BANNER_TYPE_RIGHT', 3);

define('BANNER_NOT_RUN_TIME', 0);
define('BANNER_IS_RUN_TIME', 1);

define('BANNER_NOT_TARGET_BLANK', 0);
define('BANNER_TARGET_BLANK', 1);

define('BANNER_PAGE_HOME', 1);
define('BANNER_PAGE_CATEGORY', 2);
define('BANNER_PAGE_DETAIL', 3);

//Link nofolow
define('LINK_NOFOLLOW', 0);
define('LINK_FOLLOW',1);

//Image
define('IMAGE_ERROR', 113); // dung sau quet cac item up anh nhung ko cap nhat DB
define('IMAGE_DEFAULT', $base_url.'/sites/all/modules/autoLoad/img/default.png');