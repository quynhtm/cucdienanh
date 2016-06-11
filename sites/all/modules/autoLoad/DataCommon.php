<?php 
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2014
* @Version	 : 1.0 
*/
class DataCommon{
	public static $table_category = TABLE_CATEGORY;
	public static $table_type = TABLE_TYPE;
	public static $table_news = TABLE_NEWS;
	public static $table_banner = TABLE_BANNER;
	public static $table_video = TABLE_VIDEO;
	public static $table_image = TABLE_IMAGE;

	public static $table_users = TABLE_ROLE;
	public static $table_users_role = TABLE_USERS_ROLES;

	public static function getListCategoryParent(){
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_LIST_CATEGORY_PARENT;
		$categoryParent = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$categoryParent = $cache->do_get($key_cache);
		}
		if($categoryParent == null || empty($categoryParent)) {
			$query = db_select(self::$table_category, 'c')
				->condition('c.category_parent_id', 0, '=')
				->condition('c.category_status', STASTUS_SHOW, '=')
				->fields('c', array('category_id', 'category_name'));
			$data = $query->execute();
			if (!empty($data)) {
				foreach ($data as $k => $cate) {
					$categoryParent[$cate->category_id] = $cate->category_name;
				}
				if (Cache::CACHE_ON) {
					$cache->do_put($key_cache, $categoryParent, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $categoryParent;
	}

	public static function getListCategoryFull(){
		
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_LIST_CATEGORY_FULL;

		$listCategory = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$listCategory = $cache->do_get($key_cache);
		}
		if($listCategory == null || empty($listCategory)) {
			$query = db_select(self::$table_category, 'c')
				->condition('c.category_status', STASTUS_SHOW, '=')
				->orderBy('category_order', 'ASC')
				->fields('c', array('category_id', 'category_name', 'category_parent_id', 'category_name_alias', 'category_order', 'category_content_front', 'category_content_front_order', 'category_horizontal', 'category_vertical', 'type_keyword', 'type_id', 'category_meta_title', 'category_meta_keywords', 'category_meta_description'));
			$data = $query->execute();
			if (!empty($data)) {
				foreach($data as $k=>$va){
					$listCategory[$k] = (array)$va;
				}

				//Sort data
				$arrParent = array();
				foreach($listCategory as $k=>$v){
					if($v['category_parent_id'] == 0){
						$arrParent[$k] = $listCategory[$k];
						unset($listCategory[$k]);
					}
				}
				foreach($arrParent as $key=>$val){
					foreach($listCategory as $k=>$v){
						if($val['category_id'] == $v['category_parent_id']){
							$arrParent[$key]['sub'][] = $listCategory[$k];
							unset($listCategory[$k]);
						}
					}
				}
				$listCategory = $arrParent;

				if (Cache::CACHE_ON) {
					$cache->do_put($key_cache, $listCategory, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $listCategory;
	}

	/*
	 * Build tree chuyen muc
	 * */
	public static function getListCategoryNews($type_keyword=''){
		if($type_keyword != ''){
			$key_cache = Cache::VERSION_CACHE.Cache::CACHE_LIST_CATEGORY_NEWS.$type_keyword;
		}else{
			$key_cache = Cache::VERSION_CACHE.Cache::CACHE_LIST_CATEGORY_NEWS;
		}
		$optionCategory = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$optionCategory = $cache->do_get($key_cache);
		}
		if($optionCategory == null || empty($optionCategory)) {
			$query = db_select(self::$table_category, 'c')
				->condition('c.category_status', STASTUS_SHOW, '=')
				->orderBy('category_order', 'ASC')
				->fields('c', array('category_id', 'category_name', 'category_parent_id'));
				if($type_keyword != ''){
					$query->condition('c.type_keyword', $type_keyword, '=');
				}
			$data = $query->execute();
			if (!empty($data)) {
				$treeCategory = self::getTreeCategory($data);
				if(!empty($treeCategory)){
					foreach($treeCategory as $k=>$va){
						$optionCategory[$va['category_id']] = $va['padding_left'].$va['category_name'];
					}
				}
				if (Cache::CACHE_ON) {
					$cache->do_put($key_cache, $optionCategory, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $optionCategory;
	}
	public static function getTreeCategory($data){
		$max = 0;
		$aryCategoryNews = $arrCategory = array();
		if(!empty($data)){
			foreach ($data as $k=>$value){
				$max = ($max < $value->category_parent_id)? $value->category_parent_id : $max;
				$arrCategory[$value->category_id] = array(
					'category_id'=>$value->category_id,
					'category_parent_id'=>$value->category_parent_id,
					'category_name'=>$value->category_name);
			}
		}

		if($max >= 0){
			$aryCategoryNews = self::showCategory($max, $arrCategory);
		}
		return $aryCategoryNews;
	}
	public static function showCategory($max, $aryDataInput) {
		$aryData = array();
		if(is_array($aryDataInput) && count($aryDataInput) > 0) {
			foreach ($aryDataInput as $k => $val) {
				if((int)$val['category_parent_id'] == 0) {
					$val['padding_left'] = '';
					$val['category_parent_name'] = '';
					$aryData[] = $val;
					self::showSubCategory($val['category_id'],$val['category_name'], $max, $aryDataInput, $aryData);
				}
			}
		}
		return $aryData;
	}
	public static function showSubCategory($cat_id,$cat_name, $max, $aryDataInput, &$aryData) {
		if($cat_id <= $max) {
			foreach ($aryDataInput as $chk => $chval) {
				if($chval['category_parent_id'] == $cat_id) {
					$chval['padding_left'] = '----';
					$chval['category_parent_name'] = $cat_name;
					$aryData[] = $chval;
					self::showSubCategory($chval['category_id'],$chval['category_name'], $max, $aryDataInput, $aryData);
				}
			}
		}
	}

	/*
	 * Kieu chuyen muc
	 * */
	public static function getListTypeCategory(){
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_LIST_TYPE_CATEGORY;
		$typeCategory = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$typeCategory = $cache->do_get($key_cache);
		}
		if($typeCategory == null || empty($typeCategory)) {
			$query = db_select(self::$table_type, 't')
				->condition('t.type_status', STASTUS_SHOW, '=')
				->fields('t', array('type_id', 'type_name'));
			$data = $query->execute();
			if (!empty($data)) {
				foreach ($data as $k => $cate) {
					$typeCategory[$cate->type_id] = $cate->type_name;
				}
				if (Cache::CACHE_ON) {
					$cache->do_put($key_cache, $typeCategory, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $typeCategory;
	}
	public static function getNewsById($news_id = 0){
		$news = array();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_NEWS_ID.$news_id;
		if($news_id <= 0) return $news;
		if(Cache::CACHE_ON) {
			$cache = new Cache();
			$news = $cache->do_get($key_cache);
		}
		if( $news == null || empty($news)){
			$query = db_select(self::$table_news, 'n')
				->condition('n.news_id', $news_id, '=')
				->fields('n');
			$data = $query->execute();
			if(!empty($data)){
				foreach($data as $k=> $new){
					$news = $new;
				}
				if(Cache::CACHE_ON) {
					$cache->do_put($key_cache, $news, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $news;
	}
	public static function getCategoryById($category_id = 0){
		$category = array();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_CATEGORY_ID;
		if($category_id <= 0) return $category;
		if(Cache::CACHE_ON) {
			$cache = new Cache();
			$category = $cache->do_get($key_cache. $category_id);
		}
		if( $category == null || empty($category)){
			$query = db_select(self::$table_category, 'c')
				->condition('c.category_id', $category_id, '=')
				->fields('c');
			$data = $query->execute();
			if(!empty($data)){
				foreach($data as $k=> $cate){
					$category = $cate;
				}
				if(Cache::CACHE_ON) {
					$cache->do_put($key_cache.$category_id, $category, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $category;
	}
	public static function getVideoById($video_id = 0){
		$video = array();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_VIDEO_ID.$video_id;
		if($video_id <= 0) return $video;
		if(Cache::CACHE_ON) {
			$cache = new Cache();
			$video = $cache->do_get($key_cache);
		}
		if( $video == null || empty($video)){
			$query = db_select(self::$table_video, 'n')
				->condition('n.video_id', $video_id, '=')
				->fields('n');
			$data = $query->execute();
			if(!empty($data)){
				foreach($data as $k=> $new){
					$video = $new;
				}
				if(Cache::CACHE_ON) {
					$cache->do_put($key_cache, $video, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $video;
	}
	public static function getTypeById($type_id = 0){
		$type = array();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_TYPE_ID;
		if($type_id <= 0) return $type;
		if(Cache::CACHE_ON) {
			$cache = new Cache();
			$type = $cache->do_get($key_cache. $type_id);
		}
		if( $type == null || empty($type)){
			$query = db_select(self::$table_type, 'c')
				->condition('c.type_id', $type_id, '=')
				->fields('c');
			$data = $query->execute();
			if(!empty($data)){
				foreach($data as $k=> $type){
					$type = $type;
				}
				if(Cache::CACHE_ON) {
					$cache->do_put($key_cache.$type_id, $type, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $type;
	}
	public static function getUsersById($uid = 0){
		$arrItem = array();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_UID.$uid;
		if($uid <= 0) return $arrItem;
		if(Cache::CACHE_ON) {
			$cache = new Cache();
			$arrItem = $cache->do_get($key_cache);
		}
		if( $arrItem == null || empty($arrItem)){
			$query = db_select(self::$table_users, 'n')
				->innerjoin(self::$table_users_role, 'r', 'n.rid = r.rid')
				->condition('n.uid', $uid, '=')
				->fields('n');
			$data = $query->execute();
			if(!empty($data)){
				foreach($data as $k=> $v){
					$arrItem = $v;
				}
				if(Cache::CACHE_ON) {
					$cache->do_put($key_cache, $arrItem, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $arrItem;
	}
	public static function getImageById($image_id = 0){
		$image = array();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_IMAGE_ID.$image_id;
		if($image_id <= 0) return $image;
		if(Cache::CACHE_ON) {
			$cache = new Cache();
			$image = $cache->do_get($key_cache);
		}
		if( $image == null || empty($image)){
			$query = db_select(self::$table_image, 'n')
				->condition('n.image_id', $image_id, '=')
				->fields('n');
			$data = $query->execute();
			if(!empty($data)){
				foreach($data as $k=> $new){
					$image = $new;
				}
				if(Cache::CACHE_ON) {
					$cache->do_put($key_cache, $image, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $image;
	}
	/**
	 * @param int $banner_type: 1:giua trang chu, 2:trai, 3:phai
	 * @return array
	 */
	public static function getBannerAds($banner_type = 0, $limit=0){
		$bannerAdvanced = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$bannerAdvanced = $cache->do_get(Cache::VERSION_CACHE.Cache::CACHE_BANNER_ADVANCED.'_'.$banner_type);
		}
		if($bannerAdvanced == null || empty($bannerAdvanced)) {
			$arrField = array('banner_id', 'banner_name', 'banner_image','banner_link', 'banner_order', 'banner_is_target','banner_type',
				'banner_status','banner_is_run_time', 'banner_start_time','banner_end_time', 'banner_is_rel');
			$query = db_select(self::$table_banner, 'c')
				->condition('c.banner_status', STASTUS_SHOW, '=')
				->condition('c.banner_type', $banner_type, '=')
				->orderBy('banner_order', 'ASC')
				->fields('c', $arrField);
				
				if($limit > 0){
					$query->range(0, $limit);
				}else{
					$query->range(0, 1);
				}
			$data = $query->execute();
			if (!empty($data)) {
				foreach ($data as $k => $banner) {
					$bannerAdvanced[] = $banner;
				}
				if (Cache::CACHE_ON) {
					$cache->do_put(Cache::VERSION_CACHE.Cache::CACHE_BANNER_ADVANCED.'_'.$banner_type, $bannerAdvanced, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $bannerAdvanced;
	}

	public static function getListVideoHot($limit=0){
		$videoHot = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$videoHot = $cache->do_get(Cache::VERSION_CACHE.Cache::CACHE_VIDEO_HOT);
		}
		if($videoHot == null || empty($videoHot)) {
			$arrFields = array('video_id', 'video_name', 'video_link', 'video_status', 'video_hot', 'video_category',
								'video_view', 'video_time_creater', 'video_time_update','video_sort_desc','video_content',
								'video_img','video_file','video_meta_title','video_meta_keyword','video_meta_description');

			$query = db_select(self::$table_video, 'c')
				->condition('c.video_status', STASTUS_SHOW, '=')
				->condition('c.video_hot', STASTUS_SHOW, '=')

				->condition('c.video_file', '', '<>')
				->condition('c.video_img', '', '<>')
				
				->orderBy('video_id', 'DESC')
				->fields('c', $arrFields);
				
				if($limit > 0){
					$query->range(0, $limit);
				}else{
					$query->range(0, 1);
				}
			$data = $query->execute();
			if (!empty($data)) {
				foreach ($data as $k => $video) {
					$videoHot[] = $video;
				}
				if (Cache::CACHE_ON) {
					$cache->do_put(Cache::VERSION_CACHE.Cache::CACHE_VIDEO_HOT, $videoHot, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $videoHot;
	}

	public static function getListImageHot($limit=0){
		$imageHot = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$imageHot = $cache->do_get(Cache::VERSION_CACHE.Cache::CACHE_IMAGE_HOT);
		}
		if($imageHot == null || empty($imageHot)) {
			static $arrFields = array('image_id', 'image_title', 'image_desc_sort', 'image_content', 'image_image', 'image_image_other', 'image_hot', 'image_title_alias', 'image_category',
		 							'image_create','image_meta_title','image_meta_keyword','image_meta_description', 'image_status');

			$query = db_select(self::$table_image, 'c')
				->condition('c.image_status', STASTUS_SHOW, '=')
				->condition('c.image_hot', STASTUS_SHOW, '=')

				->condition('c.image_image_other', '', '<>')
				
				->orderBy('image_id', 'DESC')
				->fields('c', $arrFields);
				
				if($limit > 0){
					$query->range(0, $limit);
				}else{
					$query->range(0, 1);
				}
			$data = $query->execute();
			if (!empty($data)) {
				foreach ($data as $k => $img) {
					$imageHot[] = $img;
				}
				if (Cache::CACHE_ON) {
					$cache->do_put(Cache::VERSION_CACHE.Cache::CACHE_IMAGE_HOT, $imageHot, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $imageHot;
	}

}
