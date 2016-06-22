<?php 
	global $base_url;

	$document_id = $result->document_id;
	$document_category = $result->document_category;
	$document_name = $result->document_name;
	$document_name_alias = $result->document_name_alias;
	$document_desc_sort = $result->document_desc_sort;
	$document_content = $result->document_content;
	$document_created = $result->document_created;

	$document_meta_title = $result->document_meta_title;
	$document_meta_keywords = $result->document_meta_keywords;
	$document_meta_description = $result->document_meta_description;
	

	$path_file = '';
	if($result->document_file != ''){
		$path_file = PATH_UPLOAD.'/'.FOLDER_DOCUMENT.'/'.$document_id.'/'.$result->document_file;
	}

	$url_file = 'javascript:void(0)';
	if(is_file($path_file)){
		$url_file = $base_url.'/uploads/'.FOLDER_DOCUMENT.'/'.$document_id.'/'.$result->document_file;
	}

	if($document_meta_title == ''){
		$news_meta_title = $document_name;
	}
	SeoMeta::SEO($document_name.' - '.WEB_SITE, '', $document_meta_title.' - '.WEB_SITE, $document_meta_keywords.' - '.WEB_SITE, $document_meta_description.' - '.WEB_SITE);
?>
<div class="link-breadcrumb">
	<a title="Trang chủ" href="<?php echo $base_url ?>">Trang chủ</a> › 
	<a href="javascript:void(0)" title="<?php echo $arrCat->category_name ?>"><?php echo $arrCat->category_name ?></a>
</div>
<div class="box-content-list-view focus">
	<h1 class="title-news show">
		ĐĂNG KÝ TRỰC TUYẾN DỊCH VỤ CÔNG
		<br/>
		<span><?php echo $document_name ?></span>
	</h1>
	
	<div class="list-news-post-services-view">
		<div class="line-focus">
			<div class="left-info-focus">
				<span class="title-focus">THÔNG TIN YÊU CẦU</span><br>
        		Vui lòng hoàn thành các thông tin cần thiết bên dưới
			</div>
			<div class="link-dowload-file">
				<a href="<?php echo $url_file ?>" target="_blank">TẢI FILE PHIẾU ĐIỀN THÔNG TIN</a><br/>
				<span><?php echo $result->document_file ?></span>
			</div>
		</div>
		<form action="" method="POST" id="send-service-focus" name="send-service-focus">
			<div class="line-focus">
	            <label class="control-label">Theo yêu cầu của ông/bà (<span>*</span>):</label>
	            <div class="controls">
	                <input type="text" class="form-control input-sm txtname" name="txtname" maxlength="255">
	            </div>
			</div>
			<div class="line-focus">
	            <label class="control-label">Địa chỉ (<span>*</span>):</label>
	            <div class="controls">
	                <input type="text" class="form-control input-sm txtaddress" name="txtaddress" maxlength="255">
	            </div>
			</div>
			<div class="line-focus">
	            <label class="control-label">Về việc:</label>
	            <div class="controls">
	                <textarea name="txtcontent" class="form-control input-sm" maxlength="10000"></textarea>
	            </div>
			</div>
			<div class="line-focus">
	            <div class="line-item-focus">
	            	<label class="control-label">CMND:</label>
		            <div class="controls">
		                <input type="text" class="form-control input-sm" name="txtcmtnd" maxlength="255">
		            </div>
	            </div>
			</div>
			<div class="line-focus">
	            <div class="line-item-focus">
	            	<label class="control-label">Số điện thoại (<span>*</span>):</label>
		            <div class="controls">
		                <input type="text" class="form-control input-sm txtphone" name="txtphone" maxlength="255">
		            </div>
	            </div>
	            <div class="line-item-focus email">
	            	<label class="control-label">Email (<span>*</span>):</label>
		            <div class="controls">
		                <input type="text" class="form-control input-sm txtmail" name="txtmail" maxlength="255">
		            </div>
	            </div>
			</div>
			<div class="line-focus">
				<div class="item-post-frm showCaptcha">
					<label class="control-label" for='message'>Mã an toàn: <span>(*)</span></label>
					<input id="security_code" name="txtcaptcha" type="text" maxlength="255" placeholder="Mã an toàn" class="form-control input-sm txtcaptcha"/>
					<img id="img_code" src="<?php echo $base_url?>/captcha?rand=<?php echo rand();?>" />
					<span id="refresh_code" onclick="refreshCaptcha();" title="Mã an toàn mới">Mã an toàn mới</span>
				</div>
			</div>
			<div class="line-focus">
	            <label class="control-label">Nội dung khác:</label>
	            <div class="controls">
	                <textarea name="txtcontentother" class="form-control input-sm" maxlength="10000"></textarea>
	            </div>
			</div>
			<div class="line-focus">
				<input type="hidden" name="txtid" value="<?php if(isset($document_id)){ echo $document_id; } ?>"/>
				<input type="hidden" name="txtcatid" value="<?php if(isset($document_category)){ echo $document_category; } ?>"/>
				<input type="hidden" name="txttitle" value="<?php if(isset($document_name)){ echo $document_name; } ?>" maxlength="255"/>
				<button id="btn-send-service-focus" class="reg-button-submit" type="submit">Gửi thông tin yêu cầu</button>
			</div>
		</form>
	</div>
</div>