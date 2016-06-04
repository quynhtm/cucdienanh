<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2016
* @Version	 : 1.0
*/
class TypeController{
	private $arrStatus = array(-1 => 'Tất cả', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');
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
	}

	public function indexType(){
		global $base_url;
		$limit = SITE_RECORD_PER_PAGE;
		//Search
		$dataSearch['type_name'] = FunctionLib::getParam('type_name', '');
		$dataSearch['type_status'] = FunctionLib::getParam('type_status', -1);

		$arrFields = array('type_id', 'type_name', 'type_keyword', 'type_created', 'type_order', 'type_status');
		$result = Type::getSearchListItems($dataSearch, $limit, $arrFields);

		//Build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['type_status']);
		return $view = theme('indexType',array(
									'title'=>'Kiểu dữ liệu',
									'result' => $result['data'],
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'arrStatus' => $this->arrStatus,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));
	}

	public function formTypeAction(){
		global $base_url, $user;

		$files = array(
	       'bootstrap/lib/ckeditor/ckeditor.js',
	       'bootstrap/lib/ckeditor/config.js',
	    );
	    Loader::loadJSExt('Core', $files);

		$param = arg();
		$id = 0;
		$arrItem = array();

		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$arrFields=array('type_id', 'type_name', 'type_keyword', 'type_created', 'type_order', 'type_status');
			$arrItem = Type::getItemById($arrFields, $param[3]);
			$id = $param[3];
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			$data = array(
						'type_name'=>array('value'=>FunctionLib::getParam('type_name',''), 'require'=>1, 'messages'=>'Kiểu dữ liệu không được trống!'),
						'type_keyword'=>array('value'=>FunctionLib::getParam('type_keyword',''), 'require'=>1, 'messages'=>'Từ khóa không được trống!'),
						'type_status'=>array('value'=>FunctionLib::getIntParam('type_status',''), 'require'=>0, 'messages'=>''),
						'type_order'=>array('value'=>FunctionLib::getIntParam('type_order',''), 'require'=>0,),
						'uid'=>array('value'=>$user->uid, 'require'=>0, 'messages'=>''),
						'type_created'=>array('value'=>time(), 'require'=>0, 'messages'=>''),
					);

			$errors = ValidForm::validInputData($data);
			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($id > 0){
					drupal_goto($base_url.'/admincp/type/edit/'.$id);
				}else{
					drupal_goto($base_url.'/admincp/type/add');
				}
			}else{
				Type::save($data, $id);
				drupal_goto($base_url.'/admincp/type');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, -1);
		return $view = theme('addType',array('arrItem'=>$arrItem, 'optionStatus' => $optionStatus));
	}

	public function deleteTypeAction(){
		global $base_url;
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = FunctionLib::getParam('checkItem',array());
			foreach($listId as $item){
				if($item > 0){
					Type::deleteId($item);
				}
			}
			drupal_set_message('Xóa bài viết thành công.');
		}
		drupal_goto($base_url.'/admincp/type');
	}
}