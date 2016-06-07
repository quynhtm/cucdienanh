<?php
/*
* QuynhTM
*/
class NewsController{
	private $arrStatus = array(-1 => 'Tất cả', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');
	private $arrCategoryNew = array();

	public function __construct(){
		
			$files = array(
				'bootstrap/lib/ckeditor/ckeditor.js',
				'bootstrap/lib/ckeditor/config.js',
				'bootstrap/lib/dragsort/jquery.dragsort.js',
		    );
		    Loader::loadJSExt('Core', $files);

	        $files = array(
	            'bootstrap/lib/upload/cssUpload.css',
	            'bootstrap/css/bootstrap.css',
	            'css/font-awesome.css',
	            'css/core.css',
	            
	            'bootstrap/js/bootstrap.min.js',
	            'bootstrap/lib/upload/jquery.uploadfile.js',
	            'js/common_admin.js',

	        );
	        Loader::load('Core', $files);

	        $files = array(
	        	'View/css/admin.css',
	            'View/js/admin.js',
	        );
	        Loader::load('Admin', $files);
		$aryCatergoryNews = DataCommon::getListCategoryNews();
		$this->arrCategoryNew = array(-1 => '--- Chọn danh mục tin tức ---') + $aryCatergoryNews;
	}

	function indexNews(){
		global $base_url;
		$limit = SITE_RECORD_PER_PAGE;
		//search
		$dataSearch['news_title'] = FunctionLib::getParam('news_title','');
		$dataSearch['news_status'] = FunctionLib::getParam('news_status', -1);
		$dataSearch['news_category'] = FunctionLib::getParam('news_category', -1);

		$result = News::getSearchListItems($dataSearch,$limit,array());
		if(isset($result['data']) && !empty($result['data'])){
			foreach($result['data'] as $k => &$value){
				if( isset($value->news_image) && trim($value->news_image) != ''){
					$value->url_image = FunctionLib::getThumbImage($value->news_image,$value->news_id,FOLDER_NEWS,60,60);
					$value->url_image_hover = FunctionLib::getThumbImage($value->news_image,$value->news_id,FOLDER_NEWS,300,150);
				}
				$value->news_category_alias = 'tin-tuc';
				if($value->news_category > 0){
					$value->news_category_alias = '';
				}
			}
		}

		//FunctionLib::Debug($result['data']);
		//build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['news_status']);
		$optionCategory = FunctionLib::getOption($this->arrCategoryNew, $dataSearch['news_category']);
		return $view = theme('indexNews',array(
									'title'=>'Tin tức',
									'result' => $result['data'],
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'optionCategory' => $optionCategory,
									'arrCategoryNew' => $this->arrCategoryNew,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));

	}

	function formNewsAction(){
		global $base_url;
	
		$param = arg();
		$arrItem = $arrImageOther = array();
		$item_id = 0;
		$errors = '';
		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$item_id = (int)$param[3];
			$arrItem = News::getItemById(array(), $item_id);

			//lấy mảng ảnh khách của item để chèn vào nội dung
			if(!empty($arrItem)){
				if(isset($arrItem->news_image_other) && trim($arrItem->news_image_other) != ''){
					$arrOther = unserialize($arrItem->news_image_other);
					foreach($arrOther as $k =>$val_other){
						$arrImageOther[] = array(
							'image_small'=> FunctionLib::getThumbImage($val_other,$arrItem->news_id,FOLDER_NEWS,80,80),
							'image_big'=> FunctionLib::getThumbImage($val_other,$arrItem->news_id,FOLDER_NEWS,700,700),
						);
					}
				}
			}
			//FunctionLib::Debug($arrImageOther);
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			$item_id = FunctionLib::getParam('id', 0);
			$news_category = FunctionLib::getIntParam('news_category',0);
			$news_type = 0;
			if($news_category > 0){
				$inforCategory = DataCommon::getCategoryById($news_category);
				$news_type = isset($inforCategory->type_id)? $inforCategory->type_id : $news_type;
			}
			$dataInput = array(
				'news_title'=>array('value'=>FunctionLib::getParam('news_title',''), 'require'=>1, 'messages'=>'Tiêu đề tin bài không được trống!'),
				'news_desc_sort'=>array('value'=>FunctionLib::getParam('news_desc_sort','')),
				'news_image'=>array('value'=>FunctionLib::getParam('image_primary','')),
				'news_content'=>array('value'=>FunctionLib::getParam('news_content','')),
				'news_meta_title'=>array('value'=>FunctionLib::getParam('news_meta_title','')),
				'news_meta_keyword'=>array('value'=>FunctionLib::getParam('news_meta_keyword','')),
				'news_meta_description'=>array('value'=>FunctionLib::getParam('news_meta_description','')),
				'news_status'=>array('value'=>FunctionLib::getIntParam('news_status',0)),
				'news_category'=>array('value'=> $news_category, 'require'=>1, 'messages'=>'Danh mục tin tức không được bỏ trống!'),
				'news_create'=>array('value'=>time()),
				'news_type'=>array('value'=>$news_type),
			);

			//lấy lại vị trí sắp xếp của ảnh khác
			$arrInputImgOther = array();
			$getImgOther = FunctionLib::getParam('img_other',array());

			if(!empty($getImgOther)){
				foreach($getImgOther as $k=>$val){
					if($val !=''){
						$arrInputImgOther[] = $val;
					}
				}
			}
			if (!empty($arrInputImgOther) && count($arrInputImgOther) > 0) {
				//nếu không chọn ảnh chính, lấy ảnh chính là cái đầu tiên
				if($dataInput['news_image']['value'] == ''){
					$dataInput['news_image']['value'] = $arrInputImgOther[0];
				}
				$dataInput['news_image_other']['value'] = serialize($arrInputImgOther);
			}

			$errors = ValidForm::validInputData($dataInput);
			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($item_id > 0){
					drupal_goto($base_url.'/admincp/news/edit/'.$item_id);
				}else{
					drupal_goto($base_url.'/admincp/news/add');
				}
			}else{
				//FunctionLib::Debug($dataInput);
				News::save($dataInput, $item_id);
				if(Cache::CACHE_ON) {
					$cache = new Cache();
					$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_NEWS_ID.$item_id);
				}
				drupal_goto($base_url.'/admincp/news');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->news_status) ? $arrItem->news_status: STASTUS_SHOW);
		$optionCategory = FunctionLib::getOption($this->arrCategoryNew, isset($arrItem->news_category) ? $arrItem->news_category: NEW_CATEGORY_TIN_TUC_CHUNG);
		return $view = theme('addNews',
			array('arrItem'=>$arrItem,
				'item_id'=>$item_id,
				'arrImageOther'=>$arrImageOther,
				'optionCategory'=>$optionCategory,
				'errors'=>$errors,
				'title'=>'tin tức',
				'optionStatus'=>$optionStatus));
	}

	function deleteNewsAction(){
		global $base_url;
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = FunctionLib::getParam('checkItem',array());
			if(!empty($listId)){
				foreach($listId as $id){
					if($id > 0){
						News::deleteOne($id);
						if(Cache::CACHE_ON) {
							$cache = new Cache();
							$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_NEWS_ID.$id);
						}
					}
				}
				drupal_set_message('Xóa bài viết thành công.');
			}
		}
		drupal_goto($base_url.'/admincp/news');
	}
}