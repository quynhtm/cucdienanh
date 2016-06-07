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
define('SESSION_SHOP_TIME_OUT', 3600);


//Tables for website
define('TABLE_TYPE', 			'web_type');
define('TABLE_CATEGORY',       	'web_category');
define('TABLE_NEWS',           	'web_news');
define('TABLE_COMMENT',         'web_comment');

define('TABLE_CONFIG_INFO',    	'web_config_info');
define('TABLE_SUPPORT_ONLINE', 	'web_support_online');

define('TABLE_CONTACT',        	'web_contact');
define('TABLE_BANNER',         	'web_banner');
define('TABLE_VIDEO',			'web_video');
define('TABLE_DOCUMENT',		'web_document');
define('TABLE_IMAGE',		    'web_images');

//Folder images
define('FOLDER_DEFAULT', 'img_other');
define('FOLDER_BANNER', 'banner');
define('FOLDER_VIDEO', 'video');
define('FOLDER_NEWS', 'news');

//Common
define('STASTUS_HIDE', 0);
define('STASTUS_SHOW', 1);

define('CONTACT_NEW', 1);
define('CONTACT_OK', 2);

define('COMMENT_OK_REPLY', 0);//comment_is_reply
define('COMMENT_NOT_REPLY', 1);

define('BANNER_NOT_RUN_TIME', 0);
define('BANNER_IS_RUN_TIME', 1);
define('BANNER_NOT_TARGET_BLANK', 0);
define('BANNER_TARGET_BLANK', 1);
define('BANNER_NOT_SHOP', 0);
define('BANNER_IS_SHOP', 1);
define('BANNER_TYPE_HOME_BIG', 1);
define('BANNER_TYPE_HOME_SMALL', 2);
define('BANNER_TYPE_HOME_LEFT', 3);
define('BANNER_TYPE_HOME_RIGHT', 4);
define('BANNER_TYPE_HOME_LIST', 5);
define('BANNER_PAGE_HOME', 1);
define('BANNER_PAGE_LIST', 2);
define('BANNER_PAGE_DETAIL', 3);
define('BANNER_PAGE_CATEGORY', 4);


define('NEW_CATEGORY_CUSTOMER', 1);
define('NEW_CATEGORY_SHOP', 2);
define('NEW_CATEGORY_GIOI_THIEU', 3);
define('NEW_CATEGORY_GIAI_TRI', 4);
define('NEW_CATEGORY_THI_TRUONG', 5);
define('NEW_CATEGORY_GOC_GIA_DINH', 6);
define('NEW_CATEGORY_TIN_TUC_CHUNG', 7);
define('NEW_CATEGORY_QUANG_CAO', 8);
define('NEW_TYPE_DAC_BIET', 1);// di voi danh muc: 1,2,3
define('NEW_TYPE_NOI_BAT', 2);// di voi danh muc: 4,5,6,7
define('NEW_TYPE_TIN_TUC', 3);// di voi danh muc: 4,5,6,7
define('NEW_TYPE_QUANG_CAO', 4);// di voi danh muc: 8


//Link nofolow
define('LINK_NOFOLLOW', 0);
define('LINK_FOLLOW',1);

//Image
define('IMAGE_ERROR', 113); // dung sau quet cac item up anh nhung ko cap nhat DB
define('IMAGE_DEFAULT', $base_url.'/sites/all/modules/autoLoad/img/default.png');