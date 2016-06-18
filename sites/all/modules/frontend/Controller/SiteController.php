<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2014
* @Version	 : 1.0
*/

class SiteController{
	//Block
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
			$cat_alias = $param[0];
			$catId = FunctionLib::getIdItemInLink($cat_alias);

			foreach($listCategory as $k=>$v){
				if(!empty($v)){
					
					$type_keyword = $v['type_keyword'];
					$cat_id= $v['category_id'];

					if($type_keyword == 'group_news' && $cat_id == $catId){
						return self::get_list_item_news($cat_id);
					}elseif($type_keyword == 'group_document' && $cat_id == $catId){
						return self::get_list_item_document($cat_id);
					}elseif($type_keyword == 'group_images' && $cat_id == $catId){
						return self::get_list_item_images($cat_id);
					}elseif($type_keyword == 'group_video' && $cat_id == $catId){
						return self::get_list_item_video($cat_id);
					}
				}
			}
			drupal_goto($base_url.'/page-404');
		}elseif(count($param) == 2 && $param[1] != ''){
			
			$cat_alias = $param[0];
			$title_alias = $param[1];
			$id = FunctionLib::getIdItemInLink($title_alias);

			foreach($listCategory as $k=>$v){
		
				$type_keyword = $v['type_keyword'];
				$cat_id= $v['category_id'];
				$category_name_alias = $v['category_name_alias'];

				if($type_keyword == 'group_news' && $cat_alias == $category_name_alias && $id > 0){
					return self::get_item_view_news($id, $cat_id);
				}elseif($type_keyword == 'group_document' && $cat_alias == $category_name_alias && $id > 0){
					return self::get_item_view_document($id, $cat_id);
				}elseif($type_keyword == 'group_images' && $cat_alias == $category_name_alias && $id > 0){
					return self::get_item_view_images($id, $cat_id);
				}elseif($type_keyword == 'group_video' && $cat_alias == $category_name_alias && $id > 0){
					return self::get_item_view_video($id, $cat_id);
				}
			}
			drupal_goto($base_url.'/page-404');
		}
	}
	//List post
	public static function get_list_item_news($cat_id){
		global $base_url;

		$result = array();
		$arrCategory = array();

		$category_title = '';
		$category_meta_title = '';
		$category_meta_keywords = '';
		$category_meta_description = '';

		if($cat_id > 0){
			
			$arrCategory = DataCommon::getCategoryById($cat_id);
			if(!empty($arrCategory)){
				$category_title = $arrCategory->category_name;
				$category_meta_title = $arrCategory->category_meta_title;
				$category_meta_keywords = $arrCategory->category_meta_keywords;
				$category_meta_description = $arrCategory->category_meta_description;
			}

			$arrFields = array('news_id', 'news_title', 'news_title_alias', 'news_category','news_image', 'news_desc_sort', 'news_content');
	   		$result = Site::getPostNewsInCategory($cat_id, 20, $arrFields);
		}

	    SeoMeta::SEO($category_title.' - '.WEB_SITE, '', $category_meta_title.' - '.WEB_SITE, $category_meta_keywords.' - '.WEB_SITE, $category_meta_description.' - '.WEB_SITE);

		return theme('pageNews', array('result'=>$result['data'], 'pager' =>$result['pager'], 'arrCategory' =>$arrCategory));
	}
	public static function get_list_item_document($cat_id){
		echo "Document";die;
	}
	public static function get_list_item_video($cat_id){
		if($cat_id > 0){
			$files = array(
	            'css/font-awesome.css',
	        );
        	Loader::load('Core', $files);

			$arrCategory = DataCommon::getCategoryById($cat_id);
			if(!empty($arrCategory)){
				$category_title = $arrCategory->category_name;
				$category_meta_title = $arrCategory->category_meta_title;
				$category_meta_keywords = $arrCategory->category_meta_keywords;
				$category_meta_description = $arrCategory->category_meta_description;
			}

			$arrCat = array($cat_id);	
			DataCommon::makeArrCatID($cat_id, 0, $arrCat, 100);
			
			$result = Site::getListVideoInArrCategory($arrCat, 30, array());
			
			SeoMeta::SEO($category_title.' - '.WEB_SITE, '', $category_meta_title.' - '.WEB_SITE, $category_meta_keywords.' - '.WEB_SITE, $category_meta_description.' - '.WEB_SITE);
			return theme('pageVideo', array('result'=>$result['data'], 'pager' =>$result['pager'], 'arrCategory' =>$arrCategory));
			
		}else{
			drupal_goto($base_url.'/page-404');
		}
		
	}
	public static function get_list_item_images($cat_id){
		if($cat_id > 0){
			$files = array(
	            'css/font-awesome.css',
	        );
        	Loader::load('Core', $files);

			$arrCategory = DataCommon::getCategoryById($cat_id);
			if(!empty($arrCategory)){
				$category_title = $arrCategory->category_name;
				$category_meta_title = $arrCategory->category_meta_title;
				$category_meta_keywords = $arrCategory->category_meta_keywords;
				$category_meta_description = $arrCategory->category_meta_description;
			}

			$arrCat = array($cat_id);	
			DataCommon::makeArrCatID($cat_id, 0, $arrCat, 100);
			
			$result = Site::getListImagesInArrCategory($arrCat, 30, array());
			
			SeoMeta::SEO($category_title.' - '.WEB_SITE, '', $category_meta_title.' - '.WEB_SITE, $category_meta_keywords.' - '.WEB_SITE, $category_meta_description.' - '.WEB_SITE);
			return theme('pageImage', array('result'=>$result['data'], 'pager' =>$result['pager'], 'arrCategory' =>$arrCategory));
			
		}else{
			drupal_goto($base_url.'/page-404');
		}
		
	}
	//View post
	public static function get_item_view_news($id, $cat_id){
		global $base_url;

		$arrCat = array();
		$result = array();
		$arrSame = array();

		if($id > 0){
			$arrCat = DataCommon::getCategoryById($cat_id);
			if(empty($arrCat)){
				drupal_goto($base_url.'/page-404');
			}

			$result = DataCommon::getNewsById($id);
			if(empty($result)){
				drupal_goto($base_url.'/page-404');
			}

			$arrSame = Site::getListPostSameNewsInCategory($cat_id, $id, 10, array());
		}else{
			drupal_goto($base_url);
		}

		return theme('pageNewsDetail', array(
					'result'=>$result,
					'arrCat'=>$arrCat,
					'arrSame'=>$arrSame,
					));
	}
	public static function get_item_view_video($id, $cat_id){
		global $base_url;

		$arrCat = array();
		$result = array();
		$arrSame = array();

		if($id > 0){
			$files = array(
	            'css/font-awesome.css',
	        );
        	Loader::load('Core', $files);
        	
			$arrCat = DataCommon::getCategoryById($cat_id);
			if(empty($arrCat)){
				drupal_goto($base_url.'/page-404');
			}

			$result = DataCommon::getVideoById($id);

			if(empty($result)){
				drupal_goto($base_url.'/page-404');
			}

			$arrSame = Site::getListPostSameVideoInCategory($cat_id, $id, 20, array());

		}else{
			drupal_goto($base_url);
		}

		return theme('pageVideoDetail', array(
					'result'=>$result,
					'arrCat'=>$arrCat,
					'arrSame'=>$arrSame,
					));
	}
	public static function get_item_view_images($id, $cat_id){
		global $base_url;

		$arrCat = array();
		$result = array();
		$arrSame = array();

		if($id > 0){

        	$files = array(
	             'css/font-awesome.css',
	            '/bootstrap/lib/slider-magnific/magnific-popup.min.js',
				'/bootstrap/lib/slider-magnific/magnific-popup.css',
				
				'/bootstrap/lib/bxslider/bxslider.min.js',
				'/bootstrap/lib/bxslider/bxslider.css',
			);
			Loader::load('Core', $files);

			$arrCat = DataCommon::getCategoryById($cat_id);
			if(empty($arrCat)){
				drupal_goto($base_url.'/page-404');
			}

			$result = DataCommon::getImageById($id);

			if(empty($result)){
				drupal_goto($base_url.'/page-404');
			}

			$arrSame = Site::getListPostSameImageInCategory($cat_id, $id, 30, array());
		}else{
			drupal_goto($base_url);
		}

		return theme('pageImageDetail', array(
					'result'=>$result,
					'arrCat'=>$arrCat,
					'arrSame'=>$arrSame,
					));
	}
	//Print post
	public static function getItemPrint(){
		global $base_url;

		$param = arg();
		$cat_id = $param[1];
		$title_alias = $param[2];
		$result = array();
		$html = '';

		$id = FunctionLib::getIdItemInLink($title_alias);
		
		if($id > 0){
			$result = DataCommon::getNewsById($id);
			$html .='<link href="'.$base_url.'/sites/all/modules/frontend/View/css/print.css" type="text/css" rel="stylesheet">';
			$html .= '<script src="'.$base_url.'/misc/jquery.js" type="text/javascript"></script>';
			$html .= '<script src="'.$base_url.'/sites/all/modules/frontend/View/js/site.js" type="text/javascript"></script>';

			$html .= '<div id="print-page">';
					$html .= '<div class="header-page">';
						$html .= '<div class="logo"><a href="'.$base_url.'" title="Cục điện ảnh"></a></div>';
						$html .= '<div class="right-print"><span>In trang</span> (Ctr + P)</div>';
					$html .= '</div>';

					$html .= '<div class="detail-page">';
						$html .= '<div class="block-timer">'.date('d/m/Y | h:i', $result->news_create).' GMT+7</div>';
						$html .= '<div class="title-news"><h1>'.$result->news_title.'</h1></div>';
						$html .= '<div class="short-intro">'.$result->news_desc_sort.'</div>';
						$html .= '<div class="content-common">'.$result->news_content.'</div>';

					$html .= '</div>';
			$html .= '</div>';
		}

		
		echo $html;
	}
	//Search
	public static function getItemSearh(){
		//Search news
		$keyword = FunctionLib::getParam('keyword','');
		$result = Site::getItemSearh($keyword, array(), 30);

		return theme('pageNewsSearch', array('result'=>$result['data'], 'pager' =>$result['pager']));
	}
}