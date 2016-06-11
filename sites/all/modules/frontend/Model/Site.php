<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2014
* @Version	 : 1.0
*/
class Site{
	static $table_action_news = TABLE_NEWS;
	static $primary_key_news = 'news_id';
	static $arrFields = array('news_id', 'news_title', 'news_title_alias', 'news_desc_sort', 'news_content', 'news_image', 'news_image_other', 'news_hot',
		'news_type', 'news_create', 'news_category', 'news_status', 'news_meta_title', 'news_meta_keyword', 'news_meta_description');

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
}