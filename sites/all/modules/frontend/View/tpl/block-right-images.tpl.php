<?php 
	global $base_url;
?>
<div class="item-box">
	<div class="title-box"><a href="<?php echo $base_url.'/thu-vien-anh.html' ?>" title="Thư viện ảnh">Thư viện ảnh</a></div>
	<div class="item-ads">
		<?php 
			foreach($listImageHot as $k=>$v){
			if($k == 0){
		?>
			<div class="item-first">
				<a href="<?php echo FunctionLib::buildLinkDetail($v->image_id, 'thu-vien-anh', $v->image_title_alias) ?>" title="<?php echo $v->image_title ?>">
					<img src="<?php echo FunctionLib::getThumbImage($v->image_image, $v->image_id, FOLDER_IMAGE, 230, 0) ?>" alt="<?php echo $v->image_title ?>"/>
				</a>
			</div>
			<?php }else{ ?>

			<?php } ?>
		<?php } ?>
	</div>
</div>