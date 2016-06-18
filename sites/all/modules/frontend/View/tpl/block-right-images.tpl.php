<?php 
	global $base_url;
?>
<div class="item-box images">
	<div class="title-box"><a href="<?php echo strip_tags(Utility::keyword('SITE_LINK_IMAGES')) ?>" title="Thư viện ảnh">Thư viện ảnh</a></div>
	<div class="item-img">
		<?php 
			foreach($listImageHot as $k=>$v){
			if($k == 0){
		?>
			<div class="item-first">
				<a href="<?php echo FunctionLib::buildLinkDetail($v->image_id, $v->image_category, $v->image_title_alias) ?>" title="<?php echo $v->image_title ?>">
					<img src="<?php echo FunctionLib::getThumbImage($v->image_image, $v->image_id, FOLDER_IMAGE, 230, 0) ?>" alt="<?php echo $v->image_title ?>"/>
				</a>
			</div>
			<?php } ?>
		<?php } ?>
		<?php if(!empty($listImageHot)){ ?>
		<div class="jcarousel-wrapper">
            <div class="jcarousel">
                <ul>
                    <?php foreach($listImageHot as $k=>$v){?>
                    <li>
                    	<a href="<?php echo FunctionLib::buildLinkDetail($v->image_id, $v->image_category, $v->image_title_alias) ?>" title="<?php echo $v->image_title ?>">
							<img src="<?php echo FunctionLib::getThumbImage($v->image_image, $v->image_id, FOLDER_IMAGE, 230, 0) ?>" alt="<?php echo $v->image_title ?>"/>
						</a>
                    </li>
					<?php } ?>
                </ul>
            </div>
            <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
            <a href="#" class="jcarousel-control-next">&rsaquo;</a>
        </div>
        <?php } ?>
	</div>
</div>