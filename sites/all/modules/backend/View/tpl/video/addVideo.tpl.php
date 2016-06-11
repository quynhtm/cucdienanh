<?php global $base_url ?>
<div class="inner-box">
	<div class="page-title-box">
		<div class="wrapper">
			<h5 class="padding10"><?php echo (isset($item_id) && $item_id > 0) ? 'Sửa thông tin '.$title: t('Thêm thông tin '.$title);?></h5>
		</div>
	</div>
	<div class="page-content-box paddingTop10">
		 <form class="form-horizontal" name="txtForm" action="" method="post" enctype="multipart/form-data">
                <div class="col-lg-6">
                    <div class="col-lg-12 paddingTop10">
                          <label class="control-label">Danh mục</label>
                         <div>
                             <select class="form-control input-sm" name="video_category">
                                 <?php echo $optionCategory;?>
                             </select>
                         </div>
                    </div>
                    <div class="col-lg-12 paddingTop10">
                         <label class="control-label">Tên video<span>*</span></label>
                         <div><input type="text" class="form-control input-sm" name="video_name" value="<?php if(isset($arrItem->video_name)){ echo $arrItem->video_name; } ?>"></div>
                    </div>
                    <div class="col-lg-12 paddingTop10">
                         <label class="control-label">Link view (Youtube)</label>
                         <div><input type="text" class="form-control input-sm" name="video_link" value="<?php if(isset($arrItem->video_link)){ echo $arrItem->video_link; } ?>"></div>
                    </div>
                    <div class="col-lg-12 paddingTop10">
                         <a href="javascript:;"class="btn btn-primary" onclick="Common_admin.uploadBannerAdvanced(4);">Upload ảnh đại diện</a>
                         <div id="sys_show_image_banner">
                             <?php if(isset($arrItem->video_img) && $arrItem->video_img !=''){?>
                                 <img height='300' width='400' src='<?php echo FunctionLib::getThumbImage($arrItem->video_img,$arrItem->video_id,FOLDER_VIDEO,400,300)?>'/>
                             <?php }?>
                         </div>
                         <input name="img" type="hidden" id="img" value="<?php if(isset($arrItem->video_img)){ echo $arrItem->video_img; } ?>">
                         <input name="img_old" type="hidden" id="img_old" value="<?php if(isset($arrItem->video_img)){ echo $arrItem->video_img; } ?>">
                    </div>
                    <div class="col-lg-12 paddingTop10">
                        <a href="javascript:;"class="btn btn-primary" onclick="Common_admin.uploadVideoAdvanced(4);">Upload video</a>
                        <div id="sys_show_video">
                             <?php 
                                if(isset($arrItem->video_file) && $arrItem->video_file !=''){
                                $path = DRUPAL_ROOT.'/uploads/video/'.$arrItem->video_id.'/'.$arrItem->video_file;
                                if(is_file($path)){
                            ?>
                            <a target="_blank" href="<?php echo $base_url.'/uploads/video/'.$arrItem->video_id.'/'.$arrItem->video_file ?>"><?php echo $arrItem->video_file ?></a> <span data="<?php echo $arrItem->video_file ?>" class="remove_file_video">X</span>
                            <input name="video_file" type="hidden" id="video_file" value="<?php if(isset($arrItem->video_file)){ echo $arrItem->video_file; } ?>">
                            <?php } }?>
                        </div>
                    </div>
                    <div class="col-lg-12 paddingTop10">
                     <label class="control-label">Meta title</label>
                     <div>
                         <input type="text" class="form-control input-sm" name="video_meta_title" value="<?php if(isset($arrItem->video_meta_title)){ echo $arrItem->video_meta_title; } ?>">
                     </div>
                 </div>
                 <div class="col-lg-12 paddingTop10">
                     <label class="control-label">Meta keyword</label>
                     <div>
                         <textarea name="video_meta_keyword" class="form-control input-sm"><?php if(isset($arrItem->video_meta_keyword)){ echo $arrItem->video_meta_keyword; } ?></textarea>
                     </div>
                 </div>
                 <div class="col-lg-12 paddingTop10">
                     <label class="control-label">Meta description</label>
                     <div>
                         <textarea name="video_meta_description" class="form-control input-sm"><?php if(isset($arrItem->video_meta_description)){ echo $arrItem->video_meta_description; } ?></textarea>
                     </div>
                 </div>
                </div>

                <div class="col-lg-6">
                     <div class="col-lg-12 paddingTop10">
                         <label class="control-label">Mô tả ngắn</label>
                         <div>
                             <textarea id="video_sort_desc" name="video_sort_desc" class="form-control input-sm" cols="30" rows="5"><?php if(isset($arrItem->video_sort_desc)) { echo $arrItem->video_sort_desc; } ?></textarea>
                         </div>
                     </div>
                     <div class="col-lg-12 paddingTop10">
                         <label class="control-label">Nội dung</label>
                         <div>
                             <textarea id="video_content" name="video_content" class="form-control input-sm" cols="30" rows="10"><?php if(isset($arrItem->video_content)) { echo $arrItem->video_content; } ?></textarea>
                         </div>
                     </div>
                    <div class="col-lg-12 paddingTop10">
                         <label class="control-label">Nổi bật</label>
                         <select class="form-control input-sm" name="video_hot">
                             <?php echo $optionHot;?>
                         </select>
                     </div> 
                    <div class="col-lg-12 paddingTop10">
                         <label class="control-label">Trạng thái</label>
                         <select class="form-control input-sm" name="video_status">
                             <?php echo $optionStatus;?>
                         </select>
                     </div>

                     <div class="col-lg-12 paddingTop10">
                         <input type="hidden" id="id_hiden" name="id" value="<?php if(isset($arrItem->video_id)){ echo $arrItem->video_id; } ?>"/>
                         <input type="hidden" value="txt-form-post" name="txt-form-post">
                         <button type="submit" name="txtSubmit" id="buttonSubmit" class="btn btn-primary">Lưu lại</button>
                         <button type="reset" class="btn">Bỏ qua</button>
                     </div>
                 </div>

		 </form>
	</div>
</div>

<!--Popup upload ảnh-->
<div class="modal fade" id="sys_PopupUploadImgOtherPro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Upload ảnh</h4>
            </div>
            <div class="modal-body">
                <form name="uploadImage" method="post" action="#" enctype="multipart/form-data">
                    <div class="form_group">
                        <div id="sys_show_button_upload">
                            <div id="sys_mulitplefileuploader" class="btn btn-primary">Upload ảnh</div>
                        </div>
                        <div id="status"></div>

                        <div class="clearfix"></div>
                        <div class="clearfix" style='margin: 5px 10px; width:100%;'>
                            <div id="div_image"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Popup upload ảnh-->

<!--Popup upload video-->
<div class="modal fade" id="sys_PopupUploadVideoOtherPro" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelVideo">Upload Video</h4>
            </div>
            <div class="modal-body">
                <form name="uploadVideo" method="post" action="#" enctype="multipart/form-data">
                    <div class="form_group">
                        <div id="sys_show_button_upload_video">
                            <div id="sys_mulitplefileuploaderVideo" class="btn btn-primary">Upload Video</div>
                        </div>
                        <div id="statusVideo"></div>

                        <div class="clearfix"></div>
                        <div class="clearfix" style='margin: 5px 10px; width:100%;'>
                            <div id="div_video"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--Popup upload video-->


<script>
    CKEDITOR.replace('video_content', {height:200});
</script>