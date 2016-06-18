<?php
/*
* QuynhTM
*/
class CommentsController{
	private $arrStatus = array(-1 => 'Tất cả', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');
	private $arrReply = array(-1 => 'Tất cả', COMMENT_OK_REPLY => 'Đã trả lời', COMMENT_NOT_REPLY => 'Chưa trả lời');
	private $arrCommentType = array();
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
		$this->arrCommentType = CGlobal::$arrCommentType;
	}

	function indexComments(){
		global $base_url;
		$limit = SITE_RECORD_PER_PAGE;
		//search
		$dataSearch['comment_object_name'] = FunctionLib::getParam('comment_object_name','');
		$dataSearch['comment_customer_name'] = FunctionLib::getParam('comment_customer_name','');
		$dataSearch['comment_status'] = FunctionLib::getIntParam('comment_status', -1);
		$dataSearch['comment_type'] = FunctionLib::getIntParam('comment_type', -1);
		$dataSearch['comment_is_reply'] = FunctionLib::getIntParam('comment_is_reply', -1);

		$getFields = array();
		$result = Comments::getSearchListItems($dataSearch,$limit,$getFields);

		//build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['comment_status']);
		$optionReply = FunctionLib::getOption($this->arrReply, $dataSearch['comment_is_reply']);
		$optionCommentType = FunctionLib::getOption(array(-1=>'-- Chọn kiểu đối tượng --')+$this->arrCommentType, $dataSearch['comment_type']);

		return $view = theme('indexComments',array(
									'title'=>'Quản lý danh sách comment',
									'result' => $result['data'],
									'arrCommentType' => $this->arrCommentType,
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'optionReply' => $optionReply,
									'optionCommentType' => $optionCommentType,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));

	}
	function formCommentsAction(){
		global $base_url, $user;

		$param = arg();
		$arrItem = array();
		$item_id = 0;
		$errors = '';
		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$item_id = (int)$param[3];
			$arrItem = Comments::getItemById(array(), $item_id);
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			$item_id = FunctionLib::getParam('id', 0);
			
			$dataInput = array(
				'comment_status'=>array('value'=> FunctionLib::getIntParam('comment_status',0)),
			);

			$errors = ValidForm::validInputData($dataInput);
			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($item_id > 0){
					drupal_goto($base_url.'/admincp/comments/edit/'.$item_id);
				}else{
					drupal_goto($base_url.'/admincp/comments/add');
				}
			}else{
				Comments::save($dataInput, $item_id);
				drupal_goto($base_url.'/admincp/comments');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->news_status) ? $arrItem->news_status: STASTUS_SHOW);
	
		return $view = theme('addComments',
				array(
					'title'=>'bình luận',
					'arrItem'=>$arrItem,
					'item_id'=>$item_id,
					'optionStatus'=>$optionStatus,
				));

	}
	function deleteCommentsAction(){
		global $base_url;
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = isset($_POST['checkItem'])? $_POST['checkItem'] : array();
			if(!empty($listId)){
				foreach($listId as $item_id){
					if($item_id > 0){
						Comments::deleteId($item_id);
					}
				}
				drupal_set_message('Xóa bài viết thành công.');
			}
		}
		drupal_goto($base_url.'/admincp/comments');
	}
}