<?php global $base_url; ?>
<div class="box-slider">
	<div class="sliderPostHot">
		<?php foreach($arrSliderPost as $key => $item){?>
		<div class="slide item-slider">
			<div class="img">
				<a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>">
					<?php if($item->news_image != ''){?>
					<img alt="<?php echo $item->news_title ?>"
					src="<?php echo FunctionLib::getThumbImage($item->news_image,$item->news_id,FOLDER_NEWS,600,300) ?>">
					<?php }else{ ?>
					<img src="<?php echo IMAGE_DEFAULT ?>"/>
					<?php } ?>
				</a>
			</div>
			<div class="title-slider">
				<a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>"><?php echo $item->news_title ?></a>
			</div>
		</div>
		<?php } ?>
	</div>
	<div class="list-item-slider">
		<ul>
			<?php foreach($arrSliderPost as $key => $item){?>
			<li>
				<div class="thumb">
					<a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>">
						<?php if($item->news_image != ''){?>
						<img alt="<?php echo $item->news_title ?>"
						src="<?php echo FunctionLib::getThumbImage($item->news_image,$item->news_id,FOLDER_NEWS,300,300) ?>">
						<?php }else{ ?>
						<img src="<?php echo IMAGE_DEFAULT ?>"/>
						<?php } ?>
					</a>
				</div>
				<div class="title">
					<a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>"><?php echo $item->news_title ?></a>
				</div>
			</li>
			<?php } ?>
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


<script>
	jQuery(document).ready(function(){
		var bxSider = jQuery('.sliderPostHot').bxSlider({
			slideWidth: 750,
			minSlides: 1,
			maxSlides: 2,
			slideMargin: 10,
			mode: 'fade',
			pager: false,
			auto: true,
		});
	});
</script>