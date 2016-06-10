<?php global $base_url; ?>
<div class="box-slider">
	<div class="item-slider">
		<div class="img">
			<a href=""><img src="<?php echo $base_url.'/'.path_to_theme()?>/View/img/slider.png" alt=""></a>
		</div>
	</div>
	<div class="list-item-slider">
		<ul>
			<li>
				<div class="thumb">
					<a href=""><img src="<?php echo $base_url.'/'.path_to_theme()?>/View/img/item-1.jpg" alt=""></a>
				</div>
				<div class="title">
					<a href="">Những ngọn nến trong đêm phần 2 – Hé lộ hậu trường showbiz</a>
				</div>
			</li>
			<li>
				<div class="thumb">
					<a href=""><img src="<?php echo $base_url.'/'.path_to_theme()?>/View/img/item-2.jpg" alt=""></a>
				</div>
				<div class="title">
					<a href="">Người phụ nữ mạnh mẽ - Khi “tam đại đồng đường”</a>
				</div>
			</li>
			<li>
				<div class="thumb">
					<a href=""><img src="<?php echo $base_url.'/'.path_to_theme()?>/View/img/item-3.jpg" alt=""></a>
				</div>
				<div class="title">
					<a href="">Phim chiếu Tết - Lời nói dối ngọt ngào</a>
				</div>
			</li>
		</ul>
	</div>
</div>
<?php foreach($contentBanner as $v){
		if($v->banner_is_rel == 0){
			$rel = 'rel="nofollow"';
		}else{
			$rel = '';
		}
		if($v->banner_is_target == BANNER_TARGET_BLANK){
			$taget = 'target="_blank"';
		}else{
			$taget = '';
		}
		$banner_is_run_time = 1;
		if($v->banner_is_run_time == BANNER_NOT_RUN_TIME){
			$banner_is_run_time = 1;
		}else{
			$banner_start_time = $v->banner_start_time;
			$banner_end_time = $v->banner_end_time;
			$date_current = time();

			if($banner_start_time > 0 && $banner_end_time > 0 && $banner_start_time <= $banner_end_time){
				if($banner_start_time <= $date_current && $date_current <= $banner_end_time){
					$banner_is_run_time = 1;
				}
			}else{
				$banner_is_run_time = 0;
			}
		}
	?>
		<?php if($banner_is_run_time == 1){?>
		<div class="banner-center">
			<a <?php echo $rel ?> <?php echo $taget ?> href="<?php echo $v->banner_link ?>" title ="<?php echo $v->banner_name ?>">
				<img src="<?php echo FunctionLib::getThumbImage($v->banner_image, $v->banner_id, FOLDER_BANNER, 600, 0) ?>" alt="<?php echo $v->banner_name ?>"/>
			</a>
		</div>
		<?php } ?>
	<?php } ?>