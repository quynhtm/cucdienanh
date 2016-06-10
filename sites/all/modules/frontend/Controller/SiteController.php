<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2014
* @Version	 : 1.0
*/

class SiteController{
	
	public static function blockLeftBanner(){
		$result = DataCommon::getBannerAds(BANNER_TYPE_LEFT, 100);
		return $result;
	}
	public static function blockContentHomeBanner(){
		$result = DataCommon::getBannerAds(BANNER_TYPE_CONTENT_HOME, 0);
		return $result;
	}
	public static function blockRightBanner(){
		$result = DataCommon::getBannerAds(BANNER_TYPE_RIGHT, 100);
		return $result;
	}
	public static function blockRightVideo(){
		$files = array(
            '/bootstrap/lib/flvplayer/swfobject.js',
			'/bootstrap/lib/flvplayer/video.js',
		);
		Loader::load('Core', $files);
		$result = DataCommon::getListVideoHot(10);
		return $result;
	}
	public static function getMenuLoad(){
		global $base_url;
		$param = arg();
		
		if(count($param) == 1 && $param[0] != ''){
			$cat_alias = substr($param[0], 0, -5);
			$listCategory = DataCommon::getListCategoryFull();
			foreach($listCategory as $k=>$v){
				if(!empty($v)){
					
					$type_id= $v['type_id'];
					$type_keyword = $v['type_keyword'];
					$category_name_alias = $v['category_name_alias'];
					$cat_id= $v['category_id'];
					
					if($type_keyword == 'group_news' && $cat_alias == $category_name_alias){
						return self::get_list_item_news($type_id, $cat_id);
					}elseif($type_keyword == 'group_document' && $cat_alias == $category_name_alias){
						return self::get_list_item_document($type_id, $cat_id);
					}elseif($type_keyword == 'group_images' && $cat_alias == $category_name_alias){
						return self::get_list_item_images($type_id, $cat_id);
					}
				}
			}
			drupal_goto($base_url);
		}elseif(count($param) == 2 && $param[1] != ''){
			$listCategory = DataCommon::getListCategoryFull();
			foreach($listCategory as $k=>$v){
				
				$type_id= $v['type_id'];
				$type_keyword = $v['type_keyword'];
				$category_name_alias = $v['category_name_alias'];
				$cat_id= $v['category_id'];
				$title_alias = $param[1];

				if($type_keyword == 'group_news' && $cat_alias == $category_name_alias){
					return self::get_item_view_news($title_alias, $cat_id);
				}elseif($type_keyword == 'group_document' && $cat_alias == $category_name_alias){
					return self::get_item_view_document($title_alias, $cat_id);
				}elseif($type_keyword == 'group_images' && $cat_alias == $category_name_alias){
					return self::get_item_view_images($title_alias, $cat_id);
				}
			}
			drupal_goto($base_url);
		}
	}

	public static function get_list_item_news(){
		echo "News...";die;
	}
	public static function get_list_item_document(){
		echo "Document";die;
	}
	public static function get_list_item_images(){
		echo "Images";die;
	}
}