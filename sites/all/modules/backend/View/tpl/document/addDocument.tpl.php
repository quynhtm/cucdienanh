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
                     <select class="form-control input-sm" name="document_type">
                         <?php echo $optionCategory;?>
                     </select>
                 </div>
            </div>
            <div class="control-group">
                <label class="control-label">Tên văn bản<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="document_name" value="<?php if(isset($arrItem->document_name)){ echo $arrItem->document_name; } ?>">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Mô tả ngắn</label>
                <div class="controls">
                    <textarea name="document_desc_sort" class="form-control input-sm"><?php if(isset($arrItem->document_desc_sort)){ echo $arrItem->document_desc_sort; } ?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Nội dung</label>
                <div class="controls">
                    <textarea name="document_content" class="form-control input-sm"><?php if(isset($arrItem->document_content)){ echo $arrItem->document_content; } ?></textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
                    <a href="javascript:;"class="btn btn-primary" onclick="Common_admin.uploadDocumentAdvanced(5);">Upload file</a>
                    <div id="sys_show_document">
                         <?php 
                            if(isset($arrItem->document_file) && $arrItem->document_file !=''){
                            $path = DRUPAL_ROOT.'/uploads/document/'.$arrItem->document_id.'/'.$arrItem->document_file;
                            if(is_file($path)){
                        ?>
                        <a target="_blank" href="<?php echo $base_url.'/uploads/document/'.$arrItem->document_id.'/'.$arrItem->document_file ?>"><?php echo $arrItem->document_file ?></a> <span data="<?php echo $arrItem->document_file ?>" class="remove_file_document">X</span>
                        <input name="document_file" type="hidden" id="document_file" value="<?php if(isset($arrItem->document_file)){ echo $arrItem->document_file; } ?>">
                        <?php } }?>
                    </div>
                </div>
            </div>

             <div class="control-group">
                 <label class="control-label">Thứ tự</label>
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
                <label class="control-label">Meta description</label>
                <div class="controls">
                    <textarea name="document_meta_description" class="form-control input-sm"><?php if(isset($arrItem->document_meta_description)){ echo $arrItem->document_meta_description; } ?></textarea>
                </div>
            </div>

            <div class="form-actions">
                <input type="hidden" id="id_hiden" name="id" value="<?php if(isset($arrItem->document_id)){ echo $arrItem->document_id; } ?>"/>
                <input type="hidden" value="txt-form-post" name="txt-form-post">
                <button type="submit" name="txtSubmit" id="buttonSubmit" class="btn btn-primary">Lưu lại</button>
                <button type="reset" class="btn">Bỏ qua</button>
            </div>
         </form>
    </div>
</div>

<!--Popup upload file-->
<div class="modal fade" id="sys_PopupUploadDocumentOtherPro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelDocument">Upload Document</h4>
            </div>
            <div class="modal-body">
                <form name="uploadDocument" method="post" action="#" enctype="multipart/form-data">
                    <div class="form_group">
                        <div id="sys_show_button_upload_document">
                            <div id="sys_mulitplefileuploaderDocument" class="btn btn-primary">Upload Document</div>
                        </div>
                        <div id="statusDocument"></div>

                        <div class="clearfix"></div>
                        <div class="clearfix" style='margin: 5px 10px; width:100%;'>
                            <div id="div_document"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Popup upload file-->

<script>
    CKEDITOR.replace('document_content', {height:500});
</script>