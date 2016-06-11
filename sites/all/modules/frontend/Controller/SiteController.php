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

	public static function blockRightImage(){
		$files = array(
            '/bootstrap/lib/jcarousel/jquery.jcarousel.min.js',
            '/bootstrap/lib/jcarousel/jcarousel.responsive.js',
			'/bootstrap/lib/jcarousel/jcarousel.responsive.css',
		);
		Loader::load('Core', $files);
		
		$result = DataCommon::getListImageHot(10);
		return $result;
	}

	public static function getListPostInCategory($category_id=0){
		$arrCatId = array();
		$arrPost = array();
		if($category_id > 0){
			$listCategory = DataCommon::getListCategoryFull('sort');
			foreach($listCategory as $k => $v){
				if(!empty($v)){
					if($category_id == $v['category_id']){
						array_push($arrCatId, $v['category_id']);

						if(isset($v['sub']) && !empty($v['sub'])){
							foreach($v['sub'] as $s){
								array_push($arrCatId, $s['category_id']);
							}
						}
					}
				}
			}
		}
		if(!empty($arrCatId)){
			$arrPost = Site::getListPostInCategory($arrCatId, 5, $arrFields=array());
		}
		return $arrPost;
	}

	public static function getListPostSlider(){

		$files = array(
            '/bootstrap/lib/bxslider/bxslider.min.js',
			'/bootstrap/lib/bxslider/bxslider.css',
		);
		Loader::load('Core', $files);

		$result = Site::getListPostSlider(10, array());
		return $result;
	}

	public static function getMenuLoad(){
		global $base_url;
		
		$param = arg();
		$listCategory = DataCommon::getListCategoryFull('notsort');

		if(count($param) == 1 && $param[0] != ''){
			$cat_alias = substr($param[0], 0, -5);
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
					}elseif($type_keyword == 'group_video' && $cat_alias == $category_name_alias){
						return self::get_list_item_video($type_id, $cat_id);
					}
				}
			}
			drupal_goto($base_url.'/page-404');
		}elseif(count($param) == 2 && $param[1] != ''){
			$cat_alias = $param[0];
			foreach($listCategory as $k=>$v){
		
				$type_keyword = $v['type_keyword'];
				$title_alias = $param[1];
				$category_name_alias = $v['category_name_alias'];
				
				if($type_keyword == 'group_news' && $cat_alias == $category_name_alias && $title_alias != ''){
					return self::get_item_view_news($title_alias, $cat_alias);
				}elseif($type_keyword == 'group_document' && $cat_alias == $category_name_alias && $title_alias != ''){
					return self::get_item_view_document($title_alias, $cat_alias);
				}elseif($type_keyword == 'group_images' && $cat_alias == $category_name_alias && $title_alias != ''){
					return self::get_item_view_images($title_alias, $cat_alias);
				}elseif($type_keyword == 'group_video' && $cat_alias == $category_name_alias && $title_alias != ''){
					return self::get_item_view_video($title_alias, $cat_alias);
				}
			}
			drupal_goto($base_url.'/page-404');
		}
	}

	public static function get_list_item_news(){
		//echo "News...";die;
		return '';
	}
	public static function get_list_item_document(){
		echo "Document";die;
	}
	public static function get_list_item_images(){
		echo "Images";die;
	}
	public static function get_list_item_video(){
		echo "Video";die;
	}

	public static function get_item_view_news($title_alias, $cat_id){

		return theme('pageNewsDetail');
	}
}