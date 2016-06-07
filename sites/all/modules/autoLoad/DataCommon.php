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
					$chval['padding_left'] = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
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
	/**
	 * @param int $banner_type: 1:banner home to, 2: banner home nh?,3: banner tr�i, 4 banner ph?i,5: banner trong list s?n ph?m
	 * @param int $banner_page: 1: trang ch?, 2: trang list,3: trang detail, 4: trang list danh m?c
	 * @param int $banner_category_id
	 * @param int $banner_shop_id
	 * @return array
	 */
	public static function getBannerAdvanced($banner_type = 0, $banner_page = 0, $banner_category_id = 0, $banner_shop_id = 0){
		$bannerAdvanced = array();
		if(Cache::CACHE_ON){
			$cache = new Cache();
			$bannerAdvanced = $cache->do_get(Cache::VERSION_CACHE.Cache::CACHE_BANNER_ADVANCED.'_'.$banner_type.'_'.$banner_page.'_'.$banner_category_id.'_'.$banner_shop_id);
		}
		if($bannerAdvanced == null || empty($bannerAdvanced)) {
			$arrField = array('banner_id', 'banner_name', 'banner_image','banner_link', 'banner_order', 'banner_is_target','banner_type','banner_category_id',
				'banner_page', 'banner_status','banner_is_run_time', 'banner_start_time','banner_end_time', 'banner_is_shop','banner_shop_id', 'banner_is_rel');
			$query = db_select(self::$table_banner, 'c')
				->condition('c.banner_status', STASTUS_SHOW, '=')
				->condition('c.banner_type', $banner_type, '=')
				->condition('c.banner_page', $banner_page, '=')
				->condition('c.banner_category_id', $banner_category_id, '=')
				->condition('c.banner_shop_id', $banner_shop_id, '=')
				->orderBy('banner_order', 'ASC')//ORDER BY created
				->fields('c', $arrField);
			$data = $query->execute();
			if (!empty($data)) {
				foreach ($data as $k => $banner) {
					$bannerAdvanced[] = $banner;
				}
				if (Cache::CACHE_ON) {
					$cache->do_put(Cache::VERSION_CACHE.Cache::CACHE_BANNER_ADVANCED.'_'.$banner_type.'_'.$banner_page.'_'.$banner_category_id.'_'.$banner_shop_id, $bannerAdvanced, Cache::CACHE_TIME_TO_LIVE_ONE_MONTH);
				}
			}
		}
		return $bannerAdvanced;
	}

}
