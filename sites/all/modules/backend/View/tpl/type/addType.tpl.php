<div class="inner-box">
    <div class="page-title-box">
        <div class="wrapper">
            <h5 class="padding10"><?php echo (isset($item_id) && $item_id > 0) ? 'Sửa bài viết' : 'Thêm bài viết';?></h5>
        </div>
    </div>
    <div class="page-content-box paddingTop30">
         <form class="form-horizontal" name="txtForm" action="" method="post" enctype="multipart/form-data">
            
            <div class="control-group">
                <label class="control-label">Tên kiểu dữ liệu<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="type_name" value="<?php if(isset($arrItem->type_name)){ echo $arrItem->type_name; } ?>">
                </div>
            </div>
            <div class="control-group">
                 <label class="control-label">Từ khóa<span>*</span></label>
                 <div class="controls">
                     <input type="text"class="form-control input-sm" name="type_keyword" value="<?php if(isset($arrItem->type_keyword)){ echo $arrItem->type_keyword; } ?>">
                 </div>
             </div>
            <div class="control-group">
                 <label class="control-label">Thứ tự</label>
                 <div class="controls">
                     <input type="text"class="form-control input-sm" name="type_order" value="<?php if(isset($arrItem->type_order)){ echo $arrItem->type_order; } ?>">
                 </div>
            </div>
            <div class="control-group">
                 <label class="control-label">Trạng thái</label>
                 <div class="controls">
                     <select class="form-control input-sm" name="type_status">
                         <?php echo $optionStatus;?>
                     </select>
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