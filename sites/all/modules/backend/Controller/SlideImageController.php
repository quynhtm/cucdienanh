<?php
/*
* QuynhTM
*/
class SlideImageController{
	private $arrStatus = array(-1 => 'Tất cả', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');
	private $arrHot = array(STASTUS_HIDE => 'Không', STASTUS_SHOW => 'Nổi bật');

	private $arrCategoryNew = array();

	public function __construct(){
		$files = array(
			'bootstrap/css/bootstrap.css',
            'css/font-awesome.css',
            'css/core.css',
            'js/jquery.alerts.js',
			'js/common_admin.js',
		);
		Loader::load('Core', $files);
		$files = array(
			'View/css/admin.css',
			'View/js/admin.js',
		);
		Loader::load('Admin', $files);

		$aryCatergoryNews = DataCommon::getListCategoryNews('group_images');
		$this->arrCategoryNew = array(-1 => '--- Chọn danh mục tin tức ---') + $aryCatergoryNews;
	}

	function indexSlideImage(){
		global $base_url;
		$limit = SITE_RECORD_PER_PAGE;
		//search
		$dataSearch['image_title'] = FunctionLib::getParam('image_title','');
		$dataSearch['image_status'] = FunctionLib::getParam('image_status', -1);
		$dataSearch['image_hot'] = FunctionLib::getParam('image_hot', -1);
		$dataSearch['image_category'] = FunctionLib::getParam('image_category', -1);

		$result = SlideImage::getSearchListItems($dataSearch,$limit,array());
		if(isset($result['data']) && !empty($result['data'])){
			foreach($result['data'] as $k => &$value){
				if( isset($value->image_image) && trim($value->image_image) != ''){
					$value->url_image = FunctionLib::getThumbImage($value->image_image,$value->image_id,FOLDER_IMAGE,60,60);
					$value->url_image_hover = FunctionLib::getThumbImage($value->image_image,$value->image_id,FOLDER_IMAGE,300,150);
				}
			}
		}

		//build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['image_status']);
		$optionHot = FunctionLib::getOption($this->arrHot, $dataSearch['image_hot']);
		$optionCategory = FunctionLib::getOption($this->arrCategoryNew, $dataSearch['image_category']);

		return $view = theme('indexSlideImage',array(
									'title'=>'Quản lý thư viện ảnh',
									'result' => $result['data'],
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'optionHot' => $optionHot,
									'optionCategory' => $optionCategory,
									'arrCategoryNew'=>$this->arrCategoryNew,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));

	}

	function formSlideImageAction(){
		global $base_url, $user;
		
		$files = array(
			'bootstrap/lib/dragsort/jquery.dragsort.js',
	    );
		Loader::loadJSExt('Core', $files);

		$files = array(
            'bootstrap/lib/upload/cssUpload.css',
            'bootstrap/js/bootstrap.min.js',
            'bootstrap/lib/upload/jquery.uploadfile.js',
        );
        Loader::load('Core', $files);

		$param = arg();
		$arrItem = $arrImageOther = array();
		$item_id = 0;
		$errors = '';
		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$item_id = (int)$param[3];
			$arrItem = SlideImage::getItemById(array(), $item_id);

			//lấy mảng ảnh khác của item để chèn vào nội dung
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
			$image_title = FunctionLib::getParam('image_title','');
			$image_category = FunctionLib::getIntParam('image_category',0);
			
			$dataInput = array(
				'image_title'=>array('value'=>FunctionLib::getParam('image_title',''), 'require'=>1, 'messages'=>'Tiêu đề tin bài không được trống!'),
				'image_title_alias'=>array('value'=>mb_strtolower(FunctionLib::safe_title($image_title)),'require'=>0),
				'image_desc_sort'=>array('value'=>FunctionLib::getParam('image_desc_sort','')),
				'image_content'=>array('value'=>FunctionLib::getParam('image_content',0)),
				'image_image'=>array('value'=>FunctionLib::getParam('image_primary','')),
				'image_status'=>array('value'=>FunctionLib::getIntParam('image_status',0)),
				'image_hot'=>array('value'=>FunctionLib::getIntParam('image_hot',0)),
				'image_create'=>array('value'=>time()),
				'image_category'=>array('value'=> $image_category, 'require'=>1, 'messages'=>'Danh mục ảnh không được bỏ trống!'),

				'language'=>array('value'=>FunctionLib::getParam('language',''),'require'=>0),
				'uid'=>array('value'=>$user->uid, 'require'=>0),

				'image_meta_title'=>array('value'=>FunctionLib::getParam('image_meta_title','')),
				'image_meta_keyword'=>array('value'=>FunctionLib::getParam('image_meta_keyword','')),
				'image_meta_description'=>array('value'=>FunctionLib::getParam('image_meta_description','')),
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
					$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_IMAGE_ID.$item_id);
					$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_IMAGE_HOT);
				}
				drupal_goto($base_url.'/admincp/slideimage');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->image_status) ? $arrItem->image_status: STASTUS_SHOW);
		$optionHot = FunctionLib::getOption($this->arrHot, isset($arrItem->image_hot) ? $arrItem->image_hot: 0);
		$optionCategory = FunctionLib::getOption($this->arrCategoryNew, isset($arrItem->image_category) ? $arrItem->image_category: -1);
		return $view = theme('addSlideImage',
			array('arrItem'=>$arrItem,
				'item_id'=>$item_id,
				'arrImageOther'=>$arrImageOther,
				'optionCategory'=>$optionCategory,
				'errors'=>$errors,
				'title'=>'tin tức',
				'optionStatus'=>$optionStatus,
				'optionHot'=>$optionHot));
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