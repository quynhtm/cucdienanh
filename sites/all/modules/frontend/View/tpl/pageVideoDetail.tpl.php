<?php 
	global $base_url;

	$video_id = $result->video_id;
	$video_category = $result->video_category;
	$video_name = $result->video_name;
	$video_name_alias = $result->video_name_alias;
	$video_sort_desc = $result->video_sort_desc;
	$video_content = $result->video_content;
	$video_time_creater = $result->video_time_creater;
	$video_file = $result->video_file;

	$video_meta_title = $result->video_meta_title;
	$video_meta_keyword = $result->video_meta_keyword;
	$video_meta_description = $result->video_meta_description;
	
	$video_img = '';
	if($result->video_img != ''){
		$video_img = FunctionLib::getThumbImage($result->video_img, $video_id, FOLDER_VIDEO,400,500);
	}
	if($video_meta_title == ''){
		$video_meta_title = $video_name;
	}
	SeoMeta::SEO($video_name.' - '.WEB_SITE, $video_img, $video_meta_title.' - '.WEB_SITE, $video_meta_keyword.' - '.WEB_SITE, $video_meta_description.' - '.WEB_SITE);
?>

<div class="link-breadcrumb">
	<a title="Trang chủ" href="<?php echo $base_url ?>">Trang chủ</a> › 
	<a href="<?php echo FunctionLib::buildLinkCategory($arrCat->category_id, $arrCat->category_name_alias); ?>" title="<?php echo $arrCat->category_name ?>"><?php echo $arrCat->category_name ?></a>
</div>
<div class="box-content-view">
	<div class="title"><a href="<?php echo FunctionLib::buildLinkDetail($video_id, $video_category, $video_name_alias); ?>" title="<?php echo $video_name ?>"><?php echo $video_name ?></a> <span></span></div>
	<div class="line-save">
		<div class="bookmark">Bookmark</div>
		<div class="date-created"><?php echo date('d/m/Y h:i', $video_time_creater)?></div>
	</div>
	<div class="line-intro-view"><?php echo $video_sort_desc ?></div>
	<div class="line-video-view">
		<?php
		$path_vieo = PATH_UPLOAD.'/'.FOLDER_VIDEO.'/'.$video_id.'/'.$video_file;
		$path_img = PATH_UPLOAD.'/'.FOLDER_VIDEO.'/'.$video_id.'/'.$video_img;
		if(is_file($path_vieo)){
			$url_video = $base_url.'/uploads/'.FOLDER_VIDEO.'/'.$video_id.'/'.$video_file;

			if(is_file($path_img)){
				$url_img = '&amp;image='.$base_url.'/uploads/'.FOLDER_VIDEO.'/'.$video_id.'/'.$video_img;
			}else{
				$url_img = '';
			}
		?>
		<div class="video" id="jwplayer_lblMedia">
			<embed id="MediaPlayer" height="453" width="560" type="application/x-shockwave-flash" 
			src="<?php echo $base_url ?>/sites/all/modules/autoLoad/bootstrap/lib/flvplayer/mediaplayer.swf" 
			style="" id="single" name="single" bgcolor="#ffffff" quality="high" allowfullscreen="true" allowscriptaccess="always" wmode="transparent" 
			flashvars="width=560&amp;height=453&amp;autostart=false&amp;showdigits=true&amp;showdownload=false&amp;file=<?php echo $url_video ?><?php echo $url_img ?>">
		</div>
		<?php } ?>
	</div>
	<div class="line-content-view"><?php echo $video_content ?></div>
	<div class="line-save ext">
		<div class="bookmark">Bookmark</div>
		<div class="view">Xem phản hồi</div>
		<div class="commment">Gửi phản hồi</div>
		<div class="back">Trở về</div>
	</div>
	<div class="title-same">Video khác<span></span></div>
	<div class="content-same-post">
		<ul class="same-vieo-list">
			<?php foreach($arrSame as $k=>$item){?>
			<li>
				<div class="item-news">
					<div class="post-img">
						<a href="<?php echo FunctionLib::buildLinkDetail($item->video_id, $item->video_category, $item->video_name_alias); ?>" title="<?php echo $item->video_name ?>">
							<?php if($item->video_img != ''){?>
							<img alt="<?php echo $item->video_name ?>"
							src="<?php echo FunctionLib::getThumbImage($item->video_img,$item->video_id,FOLDER_VIDEO,400,400) ?>">
							<?php }else{ ?>
							<img src="<?php echo IMAGE_DEFAULT ?>"/>
							<?php } ?>
							<div class="post-format">
								<i class="icon-play"></i>
							</div>
						</a>
						
					</div>
					<div class="post-data">
						<h2 class="post-title"><a href="<?php echo FunctionLib::buildLinkDetail($item->video_id, $item->video_category, $item->video_name_alias); ?>" title="<?php echo $item->video_name ?>"><?php echo $item->video_name ?></a></h2>
						<div class="post-content">
							<?php
								if($item->video_sort_desc != ''){
									echo Utility::substring($item->video_sort_desc, 200, '...');
								}else{
									echo Utility::substring(strip_tags($item->video_content), 200, '...');
								}
							?>
						</div>
					</div>
				</div>
			</li>
			<?php }
			?>
		</ul>
	</div>
</div>


