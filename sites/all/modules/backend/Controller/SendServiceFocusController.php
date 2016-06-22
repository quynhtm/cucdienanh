<?php
/*
* QuynhTM
*/
class SendServiceFocusController{
	private $arrStatus = array(-1 => 'Tất cả', 0 => 'Đã hủy', 1 => 'Chờ duyệt', 2 => 'Đã duyệt');
	private $aryCatergoryDocument = array();

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

		$aryCatergoryDocument = DataCommon::getListCategoryNews('group_document');
		$this->aryCatergoryDocument = array(-1 => '--- Chọn danh mục dịch vụ công ---') + $aryCatergoryDocument;
	}

	function indexSendservicefocus(){
		global $base_url;
		$limit = SITE_RECORD_PER_PAGE;
		//search
		$dataSearch['service_name'] = FunctionLib::getParam('service_name','');
		$dataSearch['service_status'] = FunctionLib::getParam('service_status', -1);
		$dataSearch['service_category'] = FunctionLib::getParam('service_category', -1);

		$result = SendServiceFocus::getSearchListItems($dataSearch,$limit,array());
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['service_status']);
		$optionCategory = FunctionLib::getOption($this->aryCatergoryDocument, $dataSearch['service_category']);

		return $view = theme('indexSendservicefocus',array(
									'title'=>'Quản lý gửi dịch vụ công',
									'result' => $result['data'],
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'optionCategory' => $optionCategory,
									'aryCatergoryDocument'=>$this->aryCatergoryDocument,
									'arrStatus' => $this->arrStatus,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));

	}

	function formSendservicefocusAction(){
		global $base_url,$user;
	
		$files = array(
			'bootstrap/lib/upload/cssUpload.css',
			'bootstrap/js/bootstrap.min.js',
			'bootstrap/lib/upload/jquery.uploadfile.js',
		);
		Loader::load('Core', $files);

		$param = arg();
		$arrItem = array();
		$item_id = 0;
		$errors = '';
		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$item_id = (int)$param[3];
			$arrItem = SendServiceFocus::getItemById(array(), $item_id);
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			$item_id = FunctionLib::getParam('id', 0);
			$service_name = FunctionLib::getParam('service_name','');
			$service_address = FunctionLib::getParam('service_address','');
			$service_cmnd = FunctionLib::getParam('service_cmnd','');
			$service_phone = FunctionLib::getParam('service_phone','');
			$service_mail = FunctionLib::getParam('service_mail','');
			$service_title = FunctionLib::getParam('service_title','');

			$dataInput = array(
				'service_category'=>array('value'=>FunctionLib::getIntParam('service_category',0)),
				'service_name'=>array('value'=>$service_name, 'require'=>1, 'messages'=>'Tên người gửi không được trống!'),
				'service_address'=>array('value'=>$service_address, 'require'=>1, 'messages'=>'Địa chỉ không được trống!'),
				'service_cmnd'=>array('value'=>$service_cmnd, 'require'=>0),
				'service_phone'=>array('value'=>$service_phone, 'require'=>1, 'messages'=>'Số điện thoại không được trống!'),
				'service_mail'=>array('value'=>$service_mail, 'require'=>1, 'messages'=>'Email không được trống!'),
				'service_title'=>array('value'=>$service_title, 'require'=>1, 'messages'=>'Tên dịch vụ công không được trống!'),

				'service_content_work'=>array('value'=>FunctionLib::getParam('service_content_work','')),
				'service_content_other'=>array('value'=>FunctionLib::getParam('service_content_other','')),

				'service_status'=>array('value'=>FunctionLib::getIntParam('service_status',0)),
				'service_create'=>array('value'=>time(), 'require'=>0),
			);

			$errors = ValidForm::validInputData($dataInput);
			
			if($service_mail != ''){
				$check_valid_mail = ValidForm::checkRegexEmail($service_mail);
				if(!$check_valid_mail){
					$errors .= 'Email không đúng định dạng!<br/>';
				}
			}

			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($item_id > 0){
					drupal_goto($base_url.'/admincp/sendservicefocus/edit/'.$item_id);
				}else{
					drupal_goto($base_url.'/admincp/sendservicefocus/add');
				}
			}else{
				SendServiceFocus::save($dataInput,$item_id);
				drupal_goto($base_url.'/admincp/sendservicefocus');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->service_status) ? $arrItem->service_status: STASTUS_SHOW);
		$optionCategory = FunctionLib::getOption($this->aryCatergoryDocument, isset($arrItem->service_category) ? $arrItem->service_category: -1);
		return $view = theme('addSendservicefocus',
							array('arrItem'=>$arrItem,
									'errors'=>$errors,
									'item_id'=>$item_id,
									'optionStatus'=>$optionStatus,
									'optionCategory'=>$optionCategory,
									'title'=>'Gửi file dịch vụ công',
							));
	}

	function deleteSendservicefocusAction(){
		global $base_url;
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = FunctionLib::getParam('checkItem',array());
			if(!empty($listId)){
				foreach($listId as $item_id){
					if($item_id > 0){
						SendServiceFocus::deleteId($item_id);
					}
				}
				drupal_set_message('Xóa bài viết thành công.');
			}
		}
		drupal_goto($base_url.'/admincp/sendservicefocus');
	}
}