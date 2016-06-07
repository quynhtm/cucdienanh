<div class="inner-box">
    <div class="page-title-box">
        <div class="wrapper">
            <h5 class="padding10"><?php echo (isset($item_id) && $item_id > 0) ? 'Sửa thông tin '.$title: t('Thêm thông tin '.$title);?></h5>
        </div>
    </div>
    <div class="page-content-box paddingTop30">
         <form class="form-horizontal" name="txtForm" action="" method="post" enctype="multipart/form-data">
            
            <div class="control-group">
                <label class="control-label">Tên document<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="document_name" value="<?php if(isset($arrItem->document_name)){ echo $arrItem->document_name; } ?>">
                </div>
            </div>

             <div class="control-group">
                 <label class="control-label">Upload file</label>
                 <div class="controls">
                     <input type="file" name="document_file">
                 </div>
             </div>

             <div class="control-group">
                 <label class="control-label">Thứ tự hiển thị</label>
                 <div class="controls">
                     <input type="text"class="form-control input-sm" name="document_order" value="<?php if(isset($arrItem->document_order)){ echo $arrItem->document_order; } ?>">
                 </div>
             </div>

             <div class="control-group">
                 <label class="control-label">Trạng thái</label>
                 <div class="controls">
                     <select class="form-control input-sm" name="document_status">
                         <?php echo $optionStatus;?>
                     </select>
                 </div>
             </div>

            <div class="control-group">
                <label class="control-label">Meta title</label>
                <div class="controls">
                    <input type="text"class="form-control input-sm" name="document_meta_title" value="<?php if(isset($arrItem->document_meta_title)){ echo $arrItem->document_meta_title; } ?>">
                </div>
            </div>
             <div class="control-group">
                <label class="control-label">Meta keyword</label>
                <div class="controls">
                    <textarea name="document_meta_keywords" class="form-control input-sm"><?php if(isset($arrItem->document_meta_keywords)){ echo $arrItem->document_meta_keywords; } ?></textarea>
                </div>
            </div>
             <div class="control-group">
                <label class="control-label">Meta miêu tả</label>
                <div class="controls">
                    <textarea name="document_meta_description" class="form-control input-sm"><?php if(isset($arrItem->document_meta_description)){ echo $arrItem->document_meta_description; } ?></textarea>
                </div>
            </div>

            <div class="form-actions">
                <input type="hidden" value="txt-form-post" name="txt-form-post">
                <button type="submit" name="txtSubmit" id="buttonSubmit" class="btn btn-primary">Lưu lại</button>
                <button type="reset" class="btn">Bỏ qua</button>
            </div>
         </form>
    </div>
</div>