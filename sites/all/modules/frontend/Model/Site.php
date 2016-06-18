<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2014
* @Version	 : 1.0
*/
class Site{
	static $table_action_news = TABLE_NEWS;
	static $table_action_video = TABLE_VIDEO;

	static $primary_key_news = 'news_id';
	static $primary_key_video = 'video_id';

	static $arrFields = array('news_id', 'news_title', 'news_title_alias', 'news_desc_sort', 'news_content', 'news_image', 'news_image_other', 'news_hot',
		'news_type', 'news_create', 'news_category', 'news_status', 'news_meta_title', 'news_meta_keyword', 'news_meta_description');

	static $arrFieldsVideo = array('video_id', 'video_name', 'video_name_alias', 'video_sort_desc', 'video_content', 'video_file', 'video_img', 'video_time_creater', 'video_category');

	public static function getListPostInCategory($arrCatId=array(), $limit=5, $arrFields){
		if(empty($arrFields)){
			$arrFields = self::$arrFields;
		}
		$arrItem = array();
		if(!empty($arrCatId) && $limit > 0){
			$sql = db_select(self::$table_action_news, 'i');
			foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.news_category', $arrCatId, 'IN');
             $sql->condition('i.news_status', STASTUS_SHOW, '=');
            $result = $sql->range(0, $limit)->orderBy('i.'.self::$primary_key_news, 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();
		}
		return $arrItem;
	}

	public static function getListPostSlider($limit=10, $arrFields){
		if(empty($arrFields)){
			$arrFields = self::$arrFields;
		}
		$arrItem = array();
		if($limit > 0){
			$sql = db_select(self::$table_action_news, 'i');
			foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            
            $sql->condition('i.news_status', STASTUS_SHOW, '=');
            $sql->condition('i.news_hot', STASTUS_SHOW, '=');

            $result = $sql->range(0, $limit)->orderBy('i.'.self::$primary_key_news, 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();
		}
		return $arrItem;
	}

	public static function getListPostSameNewsInCategory($catId = 0, $id=0, $limit=10, $arrFields){
		if(empty($arrFields)){
			$arrFields = self::$arrFields;
		}
		$arrItem = array();
		if($catId > 0 && $id > 0 && $limit > 0){
			$sql = db_select(self::$table_action_news, 'i');
			foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
             $sql->condition('i.news_id', $id, '<>');
            $sql->condition('i.news_category', $catId, '=');
            $sql->condition('i.news_status', STASTUS_SHOW, '=');

            $result = $sql->range(0, $limit)->orderBy('i.'.self::$primary_key_news, 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();
		}
		return $arrItem;
	}

	public static function getPostNewsInCategory($category_id = 0, $limit = 30, $arrFields = array()){
        global $base_url;
        
        if(!empty($arrFields) && $category_id > 0){
       
            $sql = db_select(self::$table_action_news, 'i')->extend('PagerDefault');
            foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.news_status', STASTUS_SHOW, '=');
            $sql->condition('i.news_category', $category_id, '=');
            
            $result = $sql->limit($limit)->orderBy('i.news_create', 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();

            $pager = array('#theme' => 'pager','#quantity' => 3);
            $data['data'] = $arrItem;
            $data['pager'] = $pager;
            
			return $data;

        }else{
            drupal_goto($base_url.'/page-404');
        }
        
        return array();
    }

    public static function getListVideoInArrCategory($arrCat=array(), $limit=30, $arrFields = array()){
    	
    	$data['data'] = array();
        $data['pager'] = array();
        
        if(empty($arrFields)){
			$arrFields = self::$arrFieldsVideo;
		}

    	if(!empty($arrCat) && !empty($arrFields) && $limit>0){

    		$sql = db_select(self::$table_action_video, 'i')->extend('PagerDefault');
            foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.video_status', STASTUS_SHOW, '=');
            $sql->condition('i.video_category', $arrCat, 'IN');
            
            $result = $sql->limit($limit)->orderBy('i.video_time_creater', 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();

            $pager = array('#theme' => 'pager','#quantity' => 3);
            $data['data'] = $arrItem;
            $data['pager'] = $pager;
    	}
    	return $data;
    }

    public static function getListPostSameVideoInCategory($catId = 0, $id=0, $limit=10, $arrFields){
		if(empty($arrFields)){
			$arrFields = self::$arrFieldsVideo;
		}
		$arrItem = array();
		if($catId > 0 && $id > 0 && $limit > 0){
			$sql = db_select(self::$table_action_video, 'i');
			foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.video_id', $id, '<>');
            $sql->condition('i.video_category', $catId, '=');
            $sql->condition('i.video_status', STASTUS_SHOW, '=');

            $result = $sql->range(0, $limit)->orderBy('i.'.self::$primary_key_video, 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();
		}
		return $arrItem;
	}
}