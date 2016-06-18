<?php 
	global $base_url; 
?>
<div class="link-breadcrumb">
	<a href="<?php echo $base_url; ?>" title="Trang chủ">Trang chủ</a> › 
	<a href="<?php echo FunctionLib::buildLinkCategory($arrCategory->category_id, $arrCategory->category_name_alias) ?>" title="<?php echo $arrCategory->category_name ?>"><?php echo $arrCategory->category_name ?></a>
</div>
<div class="box-content-list-view">
	<h1 class="title-news"><?php echo $arrCategory->category_name ?></h1>
	<div class="list-news-post video">
		<?php 
		$total = count($result);
		foreach($result as $k => $item) {
		?>
		<div class="item-news item-<?php echo $k+1 ?> <?php if($total == $k+1){ echo 'not-border'; } ?> <?php if($k+1 % 2 == 1){ echo 'right'; } ?>">
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
		<?php } ?>
		<div class="show-box-paging" style="margin-top:20px; ">
			<div class="showListPage">
				<?php print render($pager); ?>
			</div>
		</div>
	</div>
</div>