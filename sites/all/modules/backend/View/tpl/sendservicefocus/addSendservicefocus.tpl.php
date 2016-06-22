<?php global $base_url ?>
<div class="inner-box">
	<div class="page-title-box">
		<div class="wrapper">
			<h5 class="padding10"><?php echo (isset($item_id) && $item_id > 0) ? 'Sửa thông tin '.$title: t('Thêm thông tin '.$title);?></h5>
		</div>
	</div>
	<div class="page-content-box paddingTop30">
		 <form class="form-horizontal" name="txtForm" action="" method="post" enctype="multipart/form-data">
		 	<div class="control-group">
                 <label class="control-label">Danh mục</label>
                 <div class="controls">
                     <select class="form-control input-sm" name="service_category">
                         <?php echo $optionCategory;?>
                     </select>
                 </div>
            </div>
            <div class="control-group">
                <label class="control-label">Tên người gửi<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="service_name" value="<?php if(isset($arrItem->service_name)){ echo $arrItem->service_name; } ?>">
                </div>
             </div>
             <div class="control-group">
                <label class="control-label">Địa chỉ<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="service_address" value="<?php if(isset($arrItem->service_address)){ echo $arrItem->service_address; } ?>">
                </div>
             </div>
            <div class="control-group">
                <label class="control-label">Số CMND</label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="service_cmnd" value="<?php if(isset($arrItem->service_cmnd)){ echo $arrItem->service_cmnd; } ?>">
                </div>
             </div>

             <div class="control-group">
                <label class="control-label">Số điện thoại<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="service_phone" value="<?php if(isset($arrItem->service_phone)){ echo $arrItem->service_phone; } ?>">
                </div>
             </div>
             <div class="control-group">
                <label class="control-label">Email<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="service_mail" value="<?php if(isset($arrItem->service_mail)){ echo $arrItem->service_mail; } ?>">
                </div>
             </div>
            <div class="control-group">
                <label class="control-label">Tên dịch vụ công<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="service_title" value="<?php if(isset($arrItem->service_title)){ echo $arrItem->service_title; } ?>">
                </div>
             </div>
            <div class="control-group">
                <label class="control-label">Về việc</label>
                <div class="controls">
                    <textarea name="service_content_work"><?php if(isset($arrItem->service_content_work)){ echo $arrItem->service_content_work; } ?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Nội dung khác</label>
                <div class="controls">
                    <textarea name="service_content_other"><?php if(isset($arrItem->service_content_other)){ echo $arrItem->service_content_other; } ?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Trạng thái</label>
                <div class="controls">
                    <select class="form-control input-sm" name="news_status">
                        <?php echo $optionStatus;?>
                    </select>
                </div>
            </div>
            <div class="form-actions">
                <input type="hidden" id="id_hiden" name="id" value="<?php if(isset($arrItem->service_id)){ echo $arrItem->service_id; } ?>"/>
                <input type="hidden" value="txt-form-post" name="txt-form-post">
				<button type="submit" name="txtSubmit" id="buttonSubmit" class="btn btn-primary">Lưu lại</button>
                <button type="reset" class="btn">Bỏ qua</button>
            </div>
		 </form>
	</div>
</div>

<script>
    CKEDITOR.replace('service_content_work', {height:300});
    CKEDITOR.replace('service_content_other', {height:300});
</script>