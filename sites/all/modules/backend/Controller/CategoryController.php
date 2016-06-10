<?php
/*
* QuynhTM
*/
class CategoryController{

	private $arrStatus = array(-1 => '--Chọn trạng thái--', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');
	private $arrCategoryHorizontal = array(-1 => '--Chọn Menu ngang--', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');
	private $arrCategoryVertical = array(-1 => '--Chọn Menu dọc--', STASTUS_MENU_LEFT => 'Menu trái', STASTUS_MENU_RIGHT => 'Menu phải');
	private $arrCategoryContentHome = array(STASTUS_HIDE => 'Ẩn', STASTUS_SHOW => 'Hiển thị');

	private $arrCategoryParent = array();
	private $arrTypeCategory = array();

	public function __construct(){
		$this->arrCategoryParent = DataCommon::getListCategoryParent();
		$this->arrTypeCategory = DataCommon::getListTypeCategory();

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
	}
	function indexCategory(){
		global $base_url;

		$limit = 1000;
		$treeCategroy = array();
		//Search
		$dataSearch['category_name'] = FunctionLib::getParam('category_name','');
		$dataSearch['category_status'] = FunctionLib::getParam('category_status', -1);
		$dataSearch['category_horizontal'] = FunctionLib::getParam('category_horizontal', -1);
		$dataSearch['category_vertical'] = FunctionLib::getParam('category_vertical', -1);
		$dataSearch['type_id'] = FunctionLib::getParam('type_id', -1);
		$dataSearch['category_parent_id'] = FunctionLib::getParam('category_parent_id', -1);
		$dataSearch['category_content_front'] = FunctionLib::getParam('category_content_front', -1);

		$result = Category::getSearchListItems($dataSearch,$limit,array());
		$dataCate = $result['data'];
		$check_search = $result['check_search'];

		//FunctionLib::Debug($dataCate);
		if(!empty($dataCate)){
			if($check_search == 0){
				$treeCategroy = self::getTreeCategory($dataCate);
			}else{
				foreach($dataCate as $k=>$value){
					$treeCategroy[] = array('category_id'=>$value->category_id,
						'category_parent_id'=>$value->category_parent_id,
						'category_horizontal'=>$value->category_horizontal,
						'category_vertical'=>$value->category_vertical,
						'category_content_front'=>$value->category_content_front,
						'type_id'=>$value->type_id,
						'category_order'=>$value->category_order,
						'category_status'=>$value->category_status,
						'category_name'=>$value->category_name,
						'padding_left'=>'',
						'category_parent_name'=>$this->arrCategoryParent[$value->category_parent_id]);
				}
			}
		}
		
		//Build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['category_status']);
		$optionCategoryHorizontal = FunctionLib::getOption($this->arrCategoryHorizontal, $dataSearch['category_horizontal']);
		$optionCategoryVertical = FunctionLib::getOption($this->arrCategoryVertical, $dataSearch['category_vertical']);
		$optionCategoryParent = FunctionLib::getOption(array(-1 =>'--Chọn danh mục cha--')+$this->arrCategoryParent, $dataSearch['category_parent_id']);
		$optionTypeCategory = FunctionLib::getOption(array(-1 =>'--Chọn kiểu chuyên mục--')+$this->arrTypeCategory, $dataSearch['type_id']);
		$optionCategoryContentHome = FunctionLib::getOption($this->arrCategoryContentHome, $dataSearch['category_content_front']);

		return $view = theme('indexCategory',array(
									'title'=>'Quản lý chuyên mục',
									'result' => $treeCategroy,
									'dataSearch' => $dataSearch,
									'arrTypeCategory' => $this->arrTypeCategory,
									'optionStatus' => $optionStatus,
									'optionTypeCategory' => $optionTypeCategory,
									'optionCategoryHorizontal' => $optionCategoryHorizontal,
									'optionCategoryVertical' => $optionCategoryVertical,
									'optionTypeCategory' => $optionTypeCategory,
									'optionCategoryParent' => $optionCategoryParent,
									'optionCategoryContentHome' => $optionCategoryContentHome,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));

	}

	/**
	 * build cây danh mục
	 * @param $data
	 * @return array
	 */
	public function getTreeCategory($data){
		$max = 0;
		$aryCategoryProduct = $arrCategory = array();
		if(!empty($data)){
			foreach ($data as $k=>$value){
				$max = ($max < $value->category_parent_id)? $value->category_parent_id : $max;
				$arrCategory[$value->category_id] = array(
					'category_id'=>$value->category_id,
					'category_parent_id'=>$value->category_parent_id,
					'category_horizontal'=>$value->category_horizontal,
					'category_vertical'=>$value->category_vertical,
					'category_content_front'=>$value->category_content_front,
					'type_id'=>$value->type_id,
					'category_order'=>$value->category_order,
					'category_status'=>$value->category_status,
					'category_name'=>$value->category_name);
			}
		}

		if($max >= 0){
			$aryCategoryProduct = self::showCategory($max, $arrCategory);
		}
		return $aryCategoryProduct;
	}
	public function showCategory($max, $aryDataInput) {
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

	function formCategoryAction(){
		global $base_url,$user;
		$param = arg();
		$arrItem = array();
		$item_id = 0;
		$errors = '';
		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$item_id = (int)$param[3];
			$arrItem = Category::getItemById(array(), $item_id);
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			$category_name = FunctionLib::getParam('category_name','');
			$dataInput = array(
				'category_name'=>array('value'=>$category_name, 'require'=>1, 'messages'=>'Tên danh mục không được trống!'),
				'category_name_alias'=>array('value'=>mb_strtolower(FunctionLib::safe_title($category_name)),'require'=>0),
				'category_parent_id'=>array('value'=>FunctionLib::getParam('category_parent_id',''), 'require'=>1, 'messages'=>'Chưa chọn danh mục cha!'),
				'type_id'=>array('value'=>FunctionLib::getParam('type_id',''), 'require'=>1, 'messages'=>'Chưa chọn kiểu chuyên mục!'),
				'category_content_front_order'=>array('value'=>FunctionLib::getIntParam('category_content_front_order',0)),
				'category_status'=>array('value'=>FunctionLib::getParam('category_status',0)),
				'category_order'=>array('value'=>FunctionLib::getIntParam('category_order',0)),
				'category_horizontal'=>array('value'=>FunctionLib::getParam('category_horizontal',STASTUS_HIDE),'require'=>0),
				'category_vertical'=>array('value'=>FunctionLib::getParam('category_vertical',STASTUS_HIDE),'require'=>0),
				'category_content_front'=>array('value'=>FunctionLib::getParam('category_content_front',STASTUS_HIDE),'require'=>0),
				'category_created'=>array('value'=>time(), 'require'=>0),

				'language'=>array('value'=>FunctionLib::getParam('language',''),'require'=>0),
				'uid'=>array('value'=>$user->uid, 'require'=>0),
				
				'category_meta_title'=>array('value'=>FunctionLib::getParam('category_meta_title',''),'require'=>0),
				'category_meta_keywords'=>array('value'=>FunctionLib::getParam('category_meta_keywords',''),'require'=>0),
				'category_meta_description'=>array('value'=>FunctionLib::getParam('category_meta_description',''),'require'=>0),
			);

			$errors = ValidForm::validInputData($dataInput);
			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($item_id > 0){
					drupal_goto($base_url.'/admincp/category/edit/'.$item_id);
				}else{
					drupal_goto($base_url.'/admincp/category/add');
				}
			}else{
				if(isset($dataInput['type_id']['value']) && $dataInput['type_id']['value'] > 0){
					$arrType = DataCommon::getTypeById($dataInput['type_id']['value']);
					if(!empty($arrType)){
						$dataInput['type_keyword']['value'] = $arrType->type_keyword;
					}else{
						$dataInput['type_keyword']['value'] = '';
					}
				}
				Category::save($dataInput,$item_id);
				if(Cache::CACHE_ON){
					$this->removeCache($item_id);
				}
				drupal_goto($base_url.'/admincp/category');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->category_status) ? $arrItem->category_status: STASTUS_SHOW);
		$optionCategoryHorizontal = FunctionLib::getOption($this->arrCategoryHorizontal, isset($arrItem->category_horizontal) ? $arrItem->category_horizontal: STASTUS_HIDE);
		$optionCategoryVertical = FunctionLib::getOption($this->arrCategoryVertical, isset($arrItem->category_vertical) ? $arrItem->category_vertical: STASTUS_HIDE);
		$optionCategoryParent = FunctionLib::getOption(array(0 =>'--Chọn danh mục cha--')+$this->arrCategoryParent, isset($arrItem->category_parent_id) ? $arrItem->category_parent_id: 0);
		$optionTypeCategory = FunctionLib::getOption(array(0 =>'--Chọn kiểu chuyên mục--')+$this->arrTypeCategory, isset($arrItem->type_id) ? $arrItem->type_id: 0);
		
		$optionCategoryVertical = FunctionLib::getOption($this->arrCategoryVertical, isset($arrItem->category_vertical) ? $arrItem->category_vertical: STASTUS_HIDE);
		$optionCategoryContentHome = FunctionLib::getOption(array(-1 =>'--Chọn danh hiển thị--')+$this->arrCategoryContentHome, isset($arrItem->category_content_front) ? $arrItem->category_content_front: 0);
		
		return $view = theme('addCategory',
			array('arrItem'=>$arrItem,
				'errors'=>$errors,
				'item_id'=>$item_id,
				'title'=>'Thêm sửa xóa chuyên mục',
				'optionCategoryParent'=>$optionCategoryParent,
				'optionStatus'=>$optionStatus,
				'optionTypeCategory'=>$optionTypeCategory,
				'optionCategoryHorizontal'=>$optionCategoryHorizontal,
				'optionCategoryVertical'=>$optionCategoryVertical,
				'optionCategoryContentHome'=>$optionCategoryContentHome));
	}

	function deleteCategoryAction(){
		global $base_url;
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = FunctionLib::getParam('checkItem',array());
			if(!empty($listId)){
				foreach($listId as $item_id){
					if($item_id > 0){
						Category::deleteId($item_id);
						if(Cache::CACHE_ON){
							$this->removeCache($item_id);
						}
					}
				}
				drupal_set_message('Xóa bài viết thành công.');
			}
		}
		drupal_goto($base_url.'/admincp/category');
	}
	function removeCache($item_id){
		$cache = new Cache();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_CATEGORY_ID.$item_id;
		$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_LIST_CATEGORY_PARENT);
		$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_LIST_CATEGORY_NEWS);
		$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_LIST_CATEGORY_FULL);
		$cache->do_remove($key_cache);
	}
}