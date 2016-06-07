<?php
/*
* QuynhTM
*/
class SlideImageController{
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

	function indexSlideImage(){
		global $base_url;
		$limit = SITE_RECORD_PER_PAGE;
		//search
		$dataSearch['image_title'] = FunctionLib::getParam('image_title','');
		$dataSearch['image_status'] = FunctionLib::getParam('image_status', -1);

		$result = SlideImage::getSearchListItems($dataSearch,$limit,array());
		if(isset($result['data']) && !empty($result['data'])){
			foreach($result['data'] as $k => &$value){
				if( isset($value->image_image) && trim($value->image_image) != ''){
					$value->url_image = FunctionLib::getThumbImage($value->image_image,$value->image_id,FOLDER_NEWS,60,60);
					$value->url_image_hover = FunctionLib::getThumbImage($value->image_image,$value->image_id,FOLDER_NEWS,300,150);
				}
			}
		}

		//FunctionLib::Debug($result['data']);
		//build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['image_status']);
		return $view = theme('indexSlideImage',array(
									'title'=>'Tin tức',
									'result' => $result['data'],
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));

	}

	function formSlideImageAction(){
		global $base_url;
	
		$param = arg();
		$arrItem = $arrImageOther = array();
		$item_id = 0;
		$errors = '';
		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$item_id = (int)$param[3];
			$arrItem = SlideImage::getItemById(array(), $item_id);

			//lấy mảng ảnh khách của item để chèn vào nội dung
			if(!empty($arrItem)){
				if(isset($arrItem->image_image_other) && trim($arrItem->image_image_other) != ''){
					$arrOther = unserialize($arrItem->image_image_other);
					foreach($arrOther as $k =>$val_other){
						$arrImageOther[] = array(
							'image_small'=> FunctionLib::getThumbImage($val_other,$arrItem->image_id,FOLDER_IMAGE,80,80),
							'image_big'=> FunctionLib::getThumbImage($val_other,$arrItem->image_id,FOLDER_IMAGE,700,700),
						);
					}
				}
			}
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			$item_id = FunctionLib::getParam('id', 0);
			$dataInput = array(
				'image_title'=>array('value'=>FunctionLib::getParam('image_title',''), 'require'=>1, 'messages'=>'Tiêu đề tin bài không được trống!'),
				'image_desc_sort'=>array('value'=>FunctionLib::getParam('image_desc_sort','')),
				'image_image'=>array('value'=>FunctionLib::getParam('image_primary','')),
				'image_meta_title'=>array('value'=>FunctionLib::getParam('image_meta_title','')),
				'image_meta_keyword'=>array('value'=>FunctionLib::getParam('image_meta_keyword','')),
				'image_meta_description'=>array('value'=>FunctionLib::getParam('image_meta_description','')),
				'image_status'=>array('value'=>FunctionLib::getIntParam('image_status',0)),
				'image_create'=>array('value'=>time()),
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
				if($dataInput['image_image']['value'] == ''){
					$dataInput['image_image']['value'] = $arrInputImgOther[0];
				}
				$dataInput['image_image_other']['value'] = serialize($arrInputImgOther);
			}

			$errors = ValidForm::validInputData($dataInput);
			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($item_id > 0){
					drupal_goto($base_url.'/admincp/slideimage/edit/'.$item_id);
				}else{
					drupal_goto($base_url.'/admincp/slideimage/add');
				}
			}else{
				//FunctionLib::Debug($dataInput);
				SlideImage::save($dataInput, $item_id);
				if(Cache::CACHE_ON) {
					$cache = new Cache();
					$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_NEWS_ID.$item_id);
				}
				drupal_goto($base_url.'/admincp/slideimage');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->image_status) ? $arrItem->image_status: STASTUS_SHOW);
		return $view = theme('addSlideImage',
			array('arrItem'=>$arrItem,
				'item_id'=>$item_id,
				'arrImageOther'=>$arrImageOther,
				'errors'=>$errors,
				'title'=>'tin tức',
				'optionStatus'=>$optionStatus));
	}

	function deleteSlideImageAction(){
		global $base_url;
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = FunctionLib::getParam('checkItem',array());
			if(!empty($listId)){
				foreach($listId as $id){
					if($id > 0){
						SlideImage::deleteOne($id);
						if(Cache::CACHE_ON) {
							$cache = new Cache();
							$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_NEWS_ID.$id);
						}
					}
				}
				drupal_set_message('Xóa bài viết thành công.');
			}
		}
		drupal_goto($base_url.'/admincp/slideimage');
	}
}