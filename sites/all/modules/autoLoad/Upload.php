<?php
/*
* @Created by: HSS
* @Author	 : nguyenduypt86@gmail.com
* @Date 	 : 06/2014
* @Version	 : 1.0
*/

/*
<form name="frmUpload" method="post" enctype="multipart/form-data">
	<input type="file" name="image"/>
	<input type="submit" value="upload" />
</form>

if(isset($_POST)){
	$HSSUpload = new HSSUpload();
	echo $HSSUpload->upload($_name='image', $_file_ext='rar,flv,mp4', $_max_file_size=150*1024*1024, $_folder='news',  $type_json=1);
}
*/
class Upload{
	
	public static function uploadFile($_name='', $_file_ext='', $_max_file_size='50*1024*1024', $_folder='', $type_json=1){
		global $base_url;
		
		if($_file_ext != ''){
			$_file_ext = explode(',', $_file_ext);
		}else{
			$_file_ext=array("jpg","jpeg","png","gif");
		}
		
		if($_name!='' && isset($_FILES[$_name]) && count($_FILES[$_name])>0){
			if($_max_file_size){
				$max_file_size = $_max_file_size;
			}else{
				$max_file_size = 5 * 1024 * 1024;
			}
			$file_name = strtolower($_FILES[$_name]['name']);
			$file_tmp= $_FILES[$_name]["tmp_name"];
			$file_size = $_FILES[$_name]['size'];
			$file_type = $_FILES[$_name]['type'];
			$file_ext = @end(explode('.',$file_name));
			$ext=0;
			$name = date('h-i-s-d-m-Y',time()).'-'.self::preg_replace_string_upload($file_name);
			$link = $name ? $name : '';
			
			if(!in_array($file_ext, $_file_ext)){
				$ext = 0;
			}else{
				$ext = 1;
			}
			
			if($file_name!='' && $ext==1 && $file_size <= $max_file_size){
				if($_folder!=''){
				 	$folder_upload = PATH_UPLOAD.'/'.$_folder;
				}else{
				 	$folder_upload = PATH_UPLOAD;
				}

				if(!is_dir($folder_upload)){
			        @mkdir($folder_upload,0777,true);
			        chmod($folder_upload,0777);
			    }

				if(drupal_move_uploaded_file($file_tmp, $folder_upload.'/'.$name)){
					$data = array('status' => t('Ok'), 'src' => $link);
				}else{
					$data = array('status' => t('Fail'), 'src' => '');
				}
				if($type_json){
					echo json_encode($data);exit;
				}else{
					return $link;
				}
			}
		}
	}
	//Rename file upload
	public static function preg_replace_string_upload($str=''){
		if(!$str) return '';
		if($str !=''){
            $str = str_replace(array('^', '$', '\\', '/', '(', ')', '|', '?', '+', '_', '*', '[', ']', '{', '}', ',', '%', '<', '>', '=', '"', '“', '”', '!', ':', ';', '&', '~', '#', '`', "'", '@' ), array(''), trim($str));

            $unicode = array(
                'a'=>'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
                'd'=>'đ',
                'e'=>'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
                'i'=>'í|ì|ỉ|ĩ|ị',
                'o'=>'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
                'u'=>'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
                'y'=>'ý|ỳ|ỷ|ỹ|ỵ',
                'A'=>'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
                'D'=>'Đ',
                'E'=>'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
                'I'=>'Í|Ì|Ỉ|Ĩ|Ị',
                'O'=>'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
                'U'=>'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
                'Y'=>'Ý|Ỳ|Ỷ|Ỹ|Ỵ',
            );
            foreach($unicode as $nonUnicode=>$uni){
                $str = preg_replace("/($uni)/i", $nonUnicode, $str);
            }

            $str = preg_replace("/\s+/","-",$str);
            $str = preg_replace("/\-+/","-",$str);

            return strtolower($str);
        }
	}
	public static function uploadMutiFile($pos=0, $_name='', $_file_ext='', $_max_file_size='50*1024*1024', $_folder='', $type_json=1){
		global $base_url;
		
		if($_file_ext != ''){
			$_file_ext = explode(',', $_file_ext);
		}else{
			$_file_ext=array("jpg","jpeg","png","gif");
		}
		
		if($_name!=''){
			if($_max_file_size){
				$max_file_size = $_max_file_size;
			}else{
				$max_file_size = 5 * 1024 * 1024;
			}
			

			$file_name = strtolower($_FILES[$_name]['name'][$pos]);
			$file_tmp= $_FILES[$_name]["tmp_name"][$pos];
			$file_size = $_FILES[$_name]['size'][$pos];
			$file_type = $_FILES[$_name]['type'][$pos];
			$file_ext = @end(explode('.',$file_name));
			$ext=0;
			$name = date('h-i-s-d-m-Y',time()).'-'.self::preg_replace_string_upload($file_name);
			$link = $name ? $name : '';
			
			if(!in_array($file_ext, $_file_ext)){
				$ext = 0;
			}else{
				$ext = 1;
			}
	
			if($file_name!='' && $ext==1 && $file_size <= $max_file_size){
				if($_folder!=''){
				 	$folder_upload = PATH_UPLOAD.'/'.$_folder;
				}else{
				 	$folder_upload = PATH_UPLOAD;
				}

				if(!is_dir($folder_upload)){
			        @mkdir($folder_upload,0777,true);
			        chmod($folder_upload,0777);
			    }

				if(drupal_move_uploaded_file($file_tmp, $folder_upload.'/'.$name)){
					$data = array('status' => 'Ok', 'src' => $link);
				}else{
					$data = array('status' => 'Fail', 'src' => '');
				}
				if($type_json){
					echo json_encode($data);exit;
				}else{
					if($data['status'] == 'Ok'){
						return $link;
					}else{
						return '';
					}
				}
			}
		}
	}
}