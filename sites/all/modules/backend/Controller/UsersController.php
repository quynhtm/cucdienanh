<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2016
* @Version	 : 1.0
*/
class UsersController{
	private $arrStatus = array(-1 => '--Chọn trạng thái--', STASTUS_SHOW => 'Hiển thị', STASTUS_HIDE => 'Ẩn');

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

	}

	public function indexUsers(){
		global $base_url;
		$limit = SITE_RECORD_PER_PAGE;
		//Search
		$dataSearch['uid'] = FunctionLib::getIntParam('uid', 0);
		$dataSearch['name'] = FunctionLib::getParam('name', '');
		$dataSearch['mail'] = FunctionLib::getParam('mail', '');
		$dataSearch['status'] = FunctionLib::getParam('status', -1);

		$arrFields=array('uid', 'name', 'pass', 'mail', 'created', 'status', 'role');
		$result = Users::getSearchListItems($dataSearch, $limit, $arrFields);

		//Build option
		$optionStatus = FunctionLib::getOption($this->arrStatus, $dataSearch['status']);
		return $view = theme('indexUsers',array(
									'title'=>'Quản lý người dùng',
									'result' => $result['data'],
									'dataSearch' => $dataSearch,
									'optionStatus' => $optionStatus,
									'arrStatus' => $this->arrStatus,
									'base_url' => $base_url,
									'totalItem' =>$result['total'],
									'pager' =>$result['pager']));
	}

	public function formUsersAction(){
		global $base_url, $user;

		$param = arg();
		$id = 0;
		$arrItem = array();

		if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
			$arrFields=array('uid', 'name', 'pass', 'mail', 'created', 'status', 'rid');
			$arrItem = Users::getItemById($arrFields, $param[3]);
			$id = $param[3];
		}

		if(isset($param[2]) && $param[2]=='add'){
			if(!in_array('Administrator', $user->roles) && !in_array('Manager', $user->roles)){
				drupal_set_message('Bạn không có quyền thêm người dùng mới!', 'error');
				drupal_goto($base_url.'/admincp/users');
			}
		}

		if(!empty($_POST) && $_POST['txt-form-post']=='txt-form-post'){
			
			$name = FunctionLib::getParam('name','');
			$mail = FunctionLib::getParam('mail','');
			$pass = FunctionLib::getParam('pass','');
			$repass = FunctionLib::getParam('repass','');

			$data = array(
						'name'=>array('value'=>FunctionLib::getParam('name',''), 'require'=>1, 'messages'=>'Tên đăng nhập không được trống!'),
						'pass'=>array('value'=>FunctionLib::getParam('pass',''), 'require'=>1, 'messages'=>'Mật khẩu không được trống!'),
						'repass'=>array('value'=>FunctionLib::getParam('repass',''), 'require'=>1, 'messages'=>'Nhập lại mật khẩu không được trống!'),
						'mail'=>array('value'=>FunctionLib::getParam('mail',''), 'require'=>0),
						'rid'=>array('value'=>FunctionLib::getIntParam('rid',0), 'require'=>0),
						'status'=>array('value'=>FunctionLib::getIntParam('status', 0), 'require'=>0),
						'created'=>array('value'=>time()),
					);

			//Check pass
			if(isset($param[2]) && isset($param[3]) && $param[2]=='edit' && $param[3]>0){
				//Admin, Manager
				if(in_array('Administrator', $user->roles) || in_array('Manager', $user->roles)){
					if($pass == '' && $repass == ''){
						unset($data['pass']);
						unset($data['repass']);
					}
					if($pass == $repass && $pass != '' && $repass != ''){
						$check_valid_pass = ValidForm::checkRegexPass($pass, 6);
						if($check_valid_pass){
							require_once DRUPAL_ROOT . '/' . variable_get('password_inc', 'includes/password.inc');
							$hash_pass = user_hash_password(trim($pass));
							$data['pass']['value'] = $hash_pass;
							unset($data['repass']);
						}
					}
					$check = Users::getItemByCond($id, $name);
					if(empty($check)){
						drupal_set_message('Người dùng này ko tồn tại!', 'error');
						drupal_goto($base_url.'/admincp/users');
					}
				}else{//Other
					if($user->uid == $id && $user->uid == $name){
						unset($data['rid']);
						unset($data['status']);

						if($pass == '' && $repass == ''){
							unset($data['pass']);
							unset($data['repass']);
						}

						if($pass == $repass && $pass != '' && $repass != ''){
							$check_valid_pass = ValidForm::checkRegexPass($pass, 6);
							if($check_valid_pass){
								require_once DRUPAL_ROOT . '/' . variable_get('password_inc', 'includes/password.inc');
								$hash_pass = user_hash_password(trim($pass));
								$data['pass']['value'] = $hash_pass;
								unset($data['repass']);
							}
						}

						$check = Users::getItemByCond($id, $name);
						if(empty($check)){
							drupal_set_message('Thông tin của bạn không đúng!', 'error');
							drupal_goto($base_url.'/admincp/users');
						}
					}else{
						drupal_set_message('Bạn không có quyền thay đổi thông tin người dùng này!', 'error');
						drupal_goto($base_url.'/admincp/users');
					}
				}
				unset($data['created']);
			}

			if(isset($param[2]) && $param[2]=='add'){
				if(in_array('Administrator', $user->roles) || in_array('Manager', $user->roles)){
					if($pass == $repass && $pass != '' && $repass != ''){
						$check_valid_pass = ValidForm::checkRegexPass($pass, 6);
						if($check_valid_pass){
							require_once DRUPAL_ROOT . '/' . variable_get('password_inc', 'includes/password.inc');
							$hash_pass = user_hash_password(trim($pass));
							$data['pass']['value'] = $hash_pass;
							unset($data['repass']);
						}
					}
					//Check Name Exists
					$check = Users::getItemByCond(0, $name);
					if(!empty($check)){
						drupal_set_message('Người dùng này đã tồn tại tồn tại!', 'error');
						drupal_goto($base_url.'/admincp/users/add');
					}
				}else{
					drupal_set_message('Bạn ko có quyền thêm người dùng mới!', 'error');
					drupal_goto($base_url.'/admincp/users');
				}
			}

			$errors = ValidForm::validInputData($data);
			
			//Check name regex
			if($id > 0 && $user->uid == $id){
				unset($data['name']);
			}else{
				if($name != ''){
					$check_valid_name = ValidForm::checkRegexName($name);
					if(!$check_valid_name){
						$errors .= 'Tên đăng nhập không được có dấu!<br/>';
					}
				}
			}
			//Check mail regex
			if($mail != ''){
				$check_valid_mail = ValidForm::checkRegexEmail($mail);
				if(!$check_valid_mail){
					$errors .= 'Mail chưa đúng cấu trúc!<br/>';
				}
			}

			if($errors != ''){
				drupal_set_message($errors, 'error');
				if($id > 0){
					drupal_goto($base_url.'/admincp/users/edit/'.$id);
				}else{
					drupal_goto($base_url.'/admincp/users/add');
				}
			}else{
				Users::save($data, $id);
				if(Cache::CACHE_ON){
					$this->removeCache($id);
				}
				drupal_goto($base_url.'/admincp/users');
			}
		}
		$optionStatus = FunctionLib::getOption($this->arrStatus, isset($arrItem->status) ? $arrItem->status: STASTUS_SHOW);
		$arrRole = Users::getAllRole();
		$optionRid = FunctionLib::getOption($arrRole, isset($arrItem->rid) ? $arrItem->rid: 0);
		
		return $view = theme('addUsers',array('arrItem'=>$arrItem, 'optionStatus' => $optionStatus, 'optionRid'=>$optionRid));
	}

	public function deleteUsersAction(){
		global $base_url, $user;
		
		if(!in_array('Administrator', $user->roles) && !in_array('Manager', $user->roles)){
			drupal_set_message('Bạn không có quyền xóa người dùng!', 'error');
			drupal_goto($base_url.'/admincp/users');
		}
		
		if(isset($_POST) && $_POST['txtFormName']=='txtFormName'){
			$listId = FunctionLib::getParam('checkItem',array());
			foreach($listId as $item){
				if($item > 0){
					Users::deleteId($item);
				}
			}
			drupal_set_message('Xóa bài viết thành công.');
		}
		drupal_goto($base_url.'/admincp/users');
	}

	function removeCache($item_id){
		$cache = new Cache();
		$cache->do_remove(Cache::VERSION_CACHE.Cache::CACHE_UID.$item_id);
	}
}