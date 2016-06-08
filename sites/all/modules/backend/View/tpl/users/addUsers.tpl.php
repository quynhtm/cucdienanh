<div class="inner-box">
    <div class="page-title-box">
        <div class="wrapper">
            <h5 class="padding10"><?php echo (isset($uid) && $uid > 0) ? 'Sửa thông tin người dùng' : 'Thêm thông tin người dùng';?></h5>
        </div>
    </div>
    <div class="page-content-box paddingTop30">
         <form class="form-horizontal" name="txtForm" action="" method="post" enctype="multipart/form-data">
            
            <div class="control-group">
                <label class="control-label">Tên người dùng<span>*</span></label>
                <div class="controls">
                    <input type="text" class="form-control input-sm" name="name" value="<?php if(isset($arrItem->name)){ echo $arrItem->name; } ?>" <?php if(isset($arrItem->name) && $arrItem->name != ''){?> readonly="readonly" style="background:#ddd "<?php } ?>>
                </div>
            </div>

            <div class="control-group">
                <label class="control-label">Mật khẩu<span>*</span></label>
                <div class="controls">
                    <input type="password" class="form-control input-sm" name="pass">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Nhập lại mật khẩu<span>*</span></label>
                <div class="controls">
                    <input type="password" class="form-control input-sm" name="repass">
                </div>
            </div>

            <div class="control-group">
                 <label class="control-label">Mail</label>
                 <div class="controls">
                     <input type="text"class="form-control input-sm" name="mail" value="<?php if(isset($arrItem->mail)){ echo $arrItem->mail; } ?>">
                 </div>
             </div>
            <?php 
            if(in_array('Administrator', $user->roles) || in_array('Manager', $user->roles)){
            ?>
            <div class="control-group">
                <label class="control-label">Nhóm quyền</label>
                <div class="controls">
                    <select class="form-control input-sm" name="rid">
                        <?php echo $optionRid ?>
                    </select>
                </div>
            </div>
            <div class="control-group">
                 <label class="control-label">Trạng thái</label>
                 <div class="controls">
                     <select class="form-control input-sm" name="status">
                         <?php echo $optionStatus ?>
                     </select>
                 </div>
            </div>
            <?php } ?>
            <div class="form-actions">
                <input type="hidden" value="txt-form-post" name="txt-form-post">
                <button type="submit" name="txtSubmit" id="buttonSubmit" class="btn btn-primary">Lưu lại</button>
                <button type="reset" class="btn">Bỏ qua</button>
            </div>
         </form>
    </div>
</div>