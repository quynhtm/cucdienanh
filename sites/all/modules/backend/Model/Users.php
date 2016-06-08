<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2016
* @Version	 : 1.0
*/
class Users{
	static $table_action = TABLE_USERS;
	static $table_action_role = TABLE_ROLE;
	static $table_action_users_role = TABLE_USERS_ROLES;
	static $primary_key = 'uid';
	static $arrFields = array('uid', 'name', 'pass', 'mail', 'created', 'status', 'role');

	public static function getSearchListItems($dataSearch = array(), $limit = 30, $arrFields = array()){
		global $user;

		if(empty($arrFields))
			$arrFields = self::$arrFields;

        if(!empty($arrFields)){
            $sql = db_select(self::$table_action, 'i')->extend('PagerDefault');
            $sql->innerjoin('role', 'r', 'i.rid = r.rid');
           
            foreach($arrFields as $field){
                if($field == 'role'){
                	$sql->addField('r', 'name', $field);
            	}else{
            		 $sql->addField('i', $field, $field);
            	}
            }

            //Begin search
            $cond = '';
            $arrCond = array();
			
			if(!empty($dataSearch)){
				foreach($dataSearch as $field =>$value){
					if($field === 'uid' && $value > 0){
						$sql->condition('i.'.$field, $value, '=');
						array_push($arrCond, $field.' = '.$value);
					}

					if($field === 'status' && $value != -1){
						$sql->condition('i.'.$field, $value, '=');
						array_push($arrCond, $field.' = '.$value);
					}

					if($field === 'mail' && $value != ''){
						$db_or = db_or();
						$db_or->condition('i.'.$field, '%'.$value.'%', 'LIKE');
						$sql->condition($db_or);
						array_push($arrCond, "(".$field." LIKE '%". $value ."%')");
					}

					if($field === 'name' && $value != ''){
						$db_or = db_or();
						$db_or->condition('i.'.$field, '%'.$value.'%', 'LIKE');
						$sql->condition($db_or);
						array_push($arrCond, "(".$field." LIKE '%". $value ."%')");
					}

				}
				
				if(in_array('Administrator', $user->roles) || in_array('Manager', $user->roles)){
					$sql->condition('i.uid', 0, '>');
					array_push($arrCond, 'uid > 0');
				}else{
					$sql->condition('i.uid', $user->uid, '=');
					array_push($arrCond, "uid = $user->uid");
				}

				if(!empty($arrCond)){
					$cond = implode(' AND ', $arrCond);
				}
			}
            //End search

            $totalItem = DB::countItem(self::$table_action, self::$primary_key , $cond, '', self::$primary_key.' ASC');
            $result = $sql->limit($limit)->orderBy('i.'.self::$primary_key, 'ASC')->execute();
            $arrItem = (array)$result->fetchAll();

            $pager = array('#theme' => 'pager','#quantity' => 3);
            $data['data'] = $arrItem;
            $data['pager'] = $pager;
            $data['total'] = $totalItem;
			return $data;
        }
        return array('data' => array(),'total' => 0,'pager' => array(),);
    }

	public static function getItemById($arrFields = array(), $id = 0){
		$result = array();
		if($id > 0){
			$arrFields = !empty($arrFields)? $arrFields : self::$arrFields;
			$result = DB::getItemById(self::$table_action,self::$primary_key, $arrFields, $id);
		}
		return !empty($result)? $result[0]: array();
	}

	public static function getItemByCond($uid=0, $name=''){
		if($uid >0 && $name != ''){
			return DB:: getItembyCond(self::$table_action, '', '', self::$primary_key.' ASC', "name='".$name."' AND uid=$uid", 1);
		}
		if($uid == 0 && $name != ''){
			return DB:: getItembyCond(self::$table_action, '', '', self::$primary_key.' ASC', "name='".$name."'", 1);
		}
		return array();
	}

	public static function save($data=array(), $id = 0){
		global $user;
		$data_post = array();
		if(!empty($data)){
			foreach($data as $key=>$val){
				$data_post[$key] = $val['value'];
			}
		}
		
		if($id > 0){
			self::updateId($data_post, $id);
			//Update rid
			if(in_array('Administrator', $user->roles) || in_array('Manager', $user->roles)){
				DB::deleteOneItemByCond(self::$table_action_users_role, "uid=$id");
				$dataRole = array(
					'rid' => $data_post['rid'],
					'uid' => $id,
				);
				DB::insertOneItem(self::$table_action_users_role, $dataRole);
			}
			drupal_set_message('Cập nhật thành công.');
			return true;
		}else{
			$uid = db_next_id(db_query('SELECT MAX(uid) FROM {users}')->fetchField());
			$data_post['uid'] = $uid;
			$query = self::insert($data_post);
			//Add rid
			if(in_array('Administrator', $user->roles) || in_array('Manager', $user->roles)){
				$dataRole = array(
					'rid' => $data_post['rid'],
					'uid' => $uid,
				);
				DB::insertOneItem(self::$table_action_users_role, $dataRole);
			}
			if($query){
				drupal_set_message('Thêm mới thành công.');
				return true;
			}
		}
		return false;
	}

	public static function insert($dataInsert){
		if(!empty($dataInsert)){
			return DB::insertOneItem(self::$table_action, $dataInsert);
		}
		return false;
	}

	public static function updateId($dataUpdate, $id = 0){
		if($id > 0 && !empty($dataUpdate)){
			return DB::updateId(self::$table_action, self::$primary_key, $dataUpdate, $id);
		}
		return false;
	}

	public static function deleteId($id){
		if($id > 0){
			return DB::deleteId(self::$table_action, self::$primary_key, $id);
		}
		return false;
	}

	public static function getAllRole(){
		$arrRole = array();
		$arrItem = DB::getItembyCond(self::$table_action_role, 'rid, name', '', 'rid ASC', 'rid<>1 AND rid<>2', '');
		foreach ($arrItem as $v){
			$arrRole[$v->rid] = $v->name;
		}
		return $arrRole;
	}
}