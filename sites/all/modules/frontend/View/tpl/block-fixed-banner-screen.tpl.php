<?php global $base_url;?>
<?php if(!empty($leftBanner)){?>
<div id="floating_banner_left" style="text-align:right; position:fixed; top: 145px; left: 10px; width: 105px; border: 0px solid #000;">
	<?php 
		foreach($leftBanner as $v){
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
	<a <?php echo $rel ?> <?php echo $taget ?> href="<?php echo $v->banner_link ?>" title ="<?php echo $v->banner_name ?>">
		<img src="<?php echo FunctionLib::getThumbImage($v->banner_image, $v->banner_id, FOLDER_BANNER, 600, 0) ?>" alt="<?php echo $v->banner_name ?>"/>
	</a><br/>
	<?php } ?>
	<?php } ?>
</div>
<?php } ?>
<?php if(!empty($rightBanner)){?>
<div id="floating_banner_right" style="text-align:left; position:fixed; top: 145px; right: 10px; width: 105px; border: 0px solid #000;">
	<?php 
		foreach($rightBanner as $v){
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
	<a <?php echo $rel ?> <?php echo $taget ?> href="<?php echo $v->banner_link ?>" title ="<?php echo $v->banner_name ?>">
		<img src="<?php echo FunctionLib::getThumbImage($v->banner_image, $v->banner_id, FOLDER_BANNER, 600, 0) ?>" alt="<?php echo $v->banner_name ?>"/>
	</a><br/>
	<?php } ?>
	<?php } ?>
</div>
<?php } ?>

<script>
	jQuery(document).ready(function($){
		FIXED.fixed_ads();
	});
	FIXED = {
		fixed_ads:function(){
		  	var menu_site = jQuery('#block-site-block-fixed-banner-screen'),
				pos_menu  = menu_site.offset();
			var menu_site1 = jQuery('#footer'),
				pos_menu1  = menu_site1.offset();
			jQuery(window).scroll(function(){
				if(jQuery(this).scrollTop() >= 145){
					jQuery('#floating_banner_left, #floating_banner_right').addClass('fixed');
				}else if(jQuery(this).scrollTop() <= pos_menu.top){
					jQuery('#floating_banner_left, #floating_banner_right').removeClass('fixed');
				}
				if(jQuery(this).scrollTop() >= pos_menu1.top){
					jQuery('#floating_banner_left, #floating_banner_right').removeClass('fixed');
				}
			});
		}
	}
</script>