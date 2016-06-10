<?php 
	global $base_url;
?>
<div class="item-box">
	<?php foreach($rightBanner as $v){
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
		<div class="item-ads">
			<a <?php echo $rel ?> <?php echo $taget ?> href="<?php echo $v->banner_link ?>" title ="<?php echo $v->banner_name ?>">
				<img src="<?php echo FunctionLib::getThumbImage($v->banner_image, $v->banner_id, FOLDER_BANNER, 230, 0) ?>" alt="<?php echo $v->banner_name ?>"/>
			</a>
		</div>
		<?php } ?>
	<?php } ?>
</div>