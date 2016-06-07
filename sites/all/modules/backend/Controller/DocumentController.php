<?php
/*
* QuynhTM
*/
class DocumentController{

	private $arrStatus = array(-1 => '--Chọn trạng thái--', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');

	public function __construct(){

        $files = array(
            'bootstrap/css/bootstrap.css',
            'css/font-awesome.css',
            'css/core.css',
            'js/common_admin.js',
        );
        Loader::load('Core', $files);

        $files = array(
        	'View/css/admin.css',
            'View/js/admin.js',
        );
        Loader::load('Admin', $files);

        $aryCatergoryDocument = DataCommon::getListCategoryNews('group_document');
		$this->aryCatergoryDocument = array(-1 => '--- Chọn danh mục văn bản ---') + $aryCatergoryDocument;
	}
	function indexDocument(){
		global $base_url;

		$limit = 1000;
		$treeCategroy = array();
		//Search
		$dataSearch['document_name'] = FunctionLib::getParam('document_name','');
		$dataSearch['document_status'] = FunctionLib::getParam('document_status', -1);
		$dataSearch['document_type'] = FunctionLib::getParam('document_type', -1);

		$result = Document::getSearchListItems($dataSearch,$limit,array());
		$data = $result['data'];

		//FunctionLib::Debug($treeCategroy);
		//Build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['document_status']);
		$optionCategory = FunctionLib::getOption($this->aryCatergoryDocument, $dataSearch['document_type']);

		return $view = theme('indexDocument',array(
									'title'=>'Danh sách Document dowload',
									'result' => $data,
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'optionCategory' => $optionCategory,
									'aryCatergoryDocument' => $this->aryCatergoryDocument,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));

	}

	function formDocumentAction(){
		global $base_url,$user;
		$param = arg();
		$arrItem = array();
		$item_id = 0;
		$errors = '';
		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$item_id = (int)$param[3];
			$arrItem = Document::getItemById(array(), $item_id);
			//FunctionLib::Debug($arrItem);
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			$document_name = FunctionLib::getParam('document_name','');
			$dataInput = array(
				'document_name'=>array('value'=>$document_name, 'require'=>1, 'messages'=>'Tên danh mục không được trống!'),
				'document_name_alias'=>array('value'=>mb_strtolower(FunctionLib::safe_title($document_name)),'require'=>0),
				'document_status'=>array('value'=>FunctionLib::getIntParam('document_status',0)),
				'document_order'=>array('value'=>FunctionLib::getIntParam('document_order',0)),
				'document_type'=>array('value'=>FunctionLib::getIntParam('document_type',0)),

				'language'=>array('value'=>FunctionLib::getParam('language',''),'require'=>0),
				'document_meta_title'=>array('value'=>FunctionLib::getParam('document_meta_title',''),'require'=>0),
				'document_meta_keywords'=>array('value'=>FunctionLib::getParam('document_meta_keywords',''),'require'=>0),
				'document_meta_description'=>array('value'=>FunctionLib::getParam('document_meta_description',''),'require'=>0),
				'uid'=>array('value'=>$user->uid, 'require'=>0),
				'document_created'=>array('value'=>time(), 'require'=>0),
			);

			$errors = ValidForm::validInputData($dataInput);
			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($item_id > 0){
					drupal_goto($base_url.'/admincp/document/edit/'.$item_id);
				}else{
					drupal_goto($base_url.'/admincp/document/add');
				}
			}else{
				Document::save($dataInput,$item_id);
				if(Cache::CACHE_ON){
					$this->removeCache($item_id);
				}
				drupal_goto($base_url.'/admincp/document');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->document_status) ? $arrItem->document_status: STASTUS_SHOW);
		$optionCategory = FunctionLib::getOption($this->aryCatergoryDocument, isset($arrItem->document_type) ? $arrItem->document_type: -1);
		return $view = theme('addDocument',
			array('arrItem'=>$arrItem,
				'errors'=>$errors,
				'item_id'=>$item_id,
				'optionStatus'=>$optionStatus,
				'optionCategory'=>$optionCategory,
				'title'=>'dowload file'));
	}

	function deleteDocumentAction(){
		global $base_url;
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = FunctionLib::getParam('checkItem',array());
			if(!empty($listId)){
				foreach($listId as $item_id){
					if($item_id > 0){
						Document::deleteId($item_id);
						if(Cache::CACHE_ON){
							$this->removeCache($item_id);
						}
					}
				}
				drupal_set_message('Xóa bài viết thành công.');
			}
		}
		drupal_goto($base_url.'/admincp/document');
	}
	function removeCache($item_id){
		$cache = new Cache();
		$key_cache = Cache::VERSION_CACHE.Cache::CACHE_DOCUMENT_ID.$item_id;
		$cache->do_remove($key_cache);
	}
}