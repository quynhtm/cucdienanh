<?php 
	global $base_url; 
?>
<div class="link-breadcrumb">
	<a href="<?php echo $base_url; ?>" title="Trang chủ">Trang chủ</a> › 
	<a href="<?php echo FunctionLib::buildLinkCategory($arrCategory->category_id, $arrCategory->category_name_alias) ?>" title="<?php echo $arrCategory->category_name ?>"><?php echo $arrCategory->category_name ?></a>
</div>
<div class="box-content-list-view">
	<h1 class="title-news"><?php echo $arrCategory->category_name ?></h1>
	<div class="list-news-post">
		<?php 
		$total = count($result);
		foreach($result as $k => $item) {
		?>
		<div class="item-news item-<?php echo $k+1 ?> <?php if($total == $k+1){ echo 'not-border'; } ?>">
			<div class="post-img">
				<a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>">
					<?php if($item->news_image != ''){?>
					<img alt="<?php echo $item->news_title ?>"
					src="<?php echo FunctionLib::getThumbImage($item->news_image,$item->news_id,FOLDER_NEWS,400,400) ?>">
					<?php }else{ ?>
					<img src="<?php echo IMAGE_DEFAULT ?>"/>
					<?php } ?>
				</a>
				
			</div>
			<div class="post-data">
				<h2 class="post-title"><a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>"><?php echo $item->news_title ?></a></h2>
				<div class="post-content">
					<?php
						if($item->news_desc_sort != ''){
							echo Utility::substring($item->news_desc_sort, 400, '...');
						}else{
							echo Utility::substring(strip_tags($item->news_content), 400, '...');
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