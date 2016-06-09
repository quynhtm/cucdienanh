<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2014
* @Version	 : 1.0
*/

class SiteController{
	public static function getMenuLoad(){
		global $base_url;
		$param = arg();
		
		if(count($param) == 1 && $param[0] != ''){
			$listCategory = DataCommon::getListCategoryFull();
			foreach($listCategory as $k=>$v){
				if(!empty($v)){
					
					$type_id= $v['type_id'];
					$type_keyword = $v['type_keyword'];
					$cat_id= $v['category_id'];
					
					if($type_keyword == 'group_news'){
						return self::get_list_item_news($type_id, $cat_id);
					}elseif($type_keyword == '	group_document'){
						return self::get_list_item_document($type_id, $cat_id);
					}elseif($type_keyword == '	group_images'){
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
				$cat_id= $v['category_id'];
				$title_alias = $param[1];

				if($type_keyword == 'group_news'){
					return self::get_item_view_news($title_alias, $cat_id);
				}elseif($type_keyword == '	group_document'){
					return self::get_item_view_document($title_alias, $cat_id);
				}elseif($type_keyword == '	group_images'){
					return self::get_item_view_images($title_alias, $cat_id);
				}

			}
			drupal_goto($base_url);
		}
	}

	public static function get_list_item_news(){
		echo "testing...";
	}
}