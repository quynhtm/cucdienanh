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
    static $table_action_images = TABLE_IMAGE;
    static $table_action_comment = TABLE_COMMENT;
    static $table_action_document = TABLE_DOCUMENT;
    static $table_action_send_service_focus = TABLE_SEND_SERVICE_FOCUS;

	static $primary_key_news = 'news_id';
	static $primary_key_video = 'video_id';
    static $primary_key_image = 'image_id';
    static $primary_key_comment = 'comment_id';
    static $primary_key_document = 'document_id';

	static $arrFields = array('news_id', 'news_title', 'news_title_alias', 'news_desc_sort', 'news_content', 'news_image', 'news_image_other', 'news_hot',
		'news_type', 'news_create', 'news_category', 'news_status', 'news_meta_title', 'news_meta_keyword', 'news_meta_description');

	static $arrFieldsVideo = array('video_id', 'video_name', 'video_name_alias', 'video_sort_desc', 'video_content', 'video_file', 'video_img', 'video_time_creater', 'video_category');

    static $arrFieldsImages = array('image_id', 'image_title', 'image_title_alias', 'image_desc_sort', 'image_content', 'image_image', 'image_image_other', 'image_hot', 'image_category',
        'image_create','image_meta_title','image_meta_keyword','image_meta_description', 'image_status');

    static $arrFieldsComment = array('comment_id','comment_parent_id', 'comment_object_id', 'comment_object_name','comment_type',
        'comment_customer_name','comment_content','comment_is_reply', 'comment_create','comment_reply', 'comment_status', 'comment_link', 'comment_mail');

    static $arrFieldsDocument = array('document_id', 'document_name', 'document_name_alias', 'document_status',
        'document_order', 'uid','document_created','language','document_type', 'document_category', 'document_file', 'document_desc_sort', 'document_content',
        'document_meta_title','document_meta_keywords','document_meta_description');

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

            $result = $sql->range(0, $limit)->orderBy('i.news_hot', 'DESC')->execute();
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

    public static function getListImagesInArrCategory($arrCat=array(), $limit=30, $arrFields = array()){
        
        $data['data'] = array();
        $data['pager'] = array();
        
        if(empty($arrFields)){
            $arrFields = self::$arrFieldsImages;
        }

        if(!empty($arrCat) && !empty($arrFields) && $limit>0){

            $sql = db_select(self::$table_action_images, 'i')->extend('PagerDefault');
            foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.image_status', STASTUS_SHOW, '=');
            $sql->condition('i.image_category', $arrCat, 'IN');
            
            $result = $sql->limit($limit)->orderBy('i.image_create', 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();

            $pager = array('#theme' => 'pager','#quantity' => 3);
            $data['data'] = $arrItem;
            $data['pager'] = $pager;
        }
        return $data;
    }

    public static function getListPostSameImageInCategory($catId = 0, $id=0, $limit=10, $arrFields){
        if(empty($arrFields)){
            $arrFields = self::$arrFieldsImages;
        }
        $arrItem = array();
        if($catId > 0 && $id > 0 && $limit > 0){
            $sql = db_select(self::$table_action_images, 'i');
            foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.image_id', $id, '<>');
            $sql->condition('i.image_category', $catId, '=');
            $sql->condition('i.image_status', STASTUS_SHOW, '=');

            $result = $sql->range(0, $limit)->orderBy('i.'.self::$primary_key_image, 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();
        }
        return $arrItem;
    }

    public static function getItemSearh($keyword='', $arrFields= array(), $limit=30){
        
        $data['data'] = array();
        $data['pager'] = array();
        $data['total'] = 0;

        if(empty($arrFields)){
            $arrFields = self::$arrFields;
        }
        
        if($keyword != ''){

            $sql = db_select(self::$table_action_news, 'i')->extend('PagerDefault');
            foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.news_status', STASTUS_SHOW, '=');
            
            $db_or = db_or();
                $db_or->condition('i.news_title', '%'.$keyword.'%', 'LIKE');
                $db_or->condition('i.news_title_alias', '%'.$keyword.'%', 'LIKE');
                $db_or->condition('i.news_desc_sort', '%'.$keyword.'%', 'LIKE');
            $sql->condition($db_or);

            $result = $sql->limit($limit)->orderBy('i.news_create', 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();

            $pager = array('#theme' => 'pager','#quantity' => 3);
            $data['data'] = $arrItem;
            $data['pager'] = $pager;
        }

        return $data;
    }

    public static function insertComment($dataInsert){
        if(!empty($dataInsert)){
            return DB::insertOneItem(self::$table_action_comment, $dataInsert);
        }
        return false;
    }

    public static function getComment($id=0, $type=0, $arrFields = array(), $limit = 30){
        
        if(empty($arrFields))
            $arrFields = self::$arrFieldsComment;

        if(!empty($arrFields)){
            $sql = db_select(self::$table_action_comment, 'i')->extend('PagerDefault');
            foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }

            $sql->condition('i.comment_status', STASTUS_SHOW, '=');
            $sql->condition('i.comment_object_id', $id, '=');
            $sql->condition('i.comment_type', $type, '=');

            $result = $sql->limit($limit)->orderBy('i.'.self::$primary_key_comment, 'DESC')->execute();
            $arrItem = (array)$result->fetchAll();

            $pager = array('#theme' => 'pager','#quantity' => 3);
            $data['data'] = $arrItem;
            $data['pager'] = $pager;
            return $data;
        }
        return array('data' => array(),'total' => 0,'pager' => array(),);
    }

    public static function getListPostDocumentInCategory($arrCat= array(), $limit=10, $arrFields){
        
        $data['data'] = array();
        $data['pager'] = array();
        
        if(empty($arrFields)){
            $arrFields = self::$arrFieldsDocument;
        }

        if(!empty($arrCat) && !empty($arrFields) && $limit>0){

            $sql = db_select(self::$table_action_document, 'i')->extend('PagerDefault');
            foreach($arrFields as $field){
                $sql->addField('i', $field, $field);
            }
            $sql->condition('i.document_status', STASTUS_SHOW, '=');
            $sql->condition('i.document_category', $arrCat, 'IN');
            
            $result = $sql->limit($limit)->orderBy('i.document_created', 'ASC')->execute();
            $arrItem = (array)$result->fetchAll();

            $pager = array('#theme' => 'pager','#quantity' => 3);
            $data['data'] = $arrItem;
            $data['pager'] = $pager;
        }
        return $data;
    }

    public static function insertServiceFocus($dataInsert){
        if(!empty($dataInsert)){
            return DB::insertOneItem(self::$table_action_send_service_focus, $dataInsert);
        }
        return false;
    }
}