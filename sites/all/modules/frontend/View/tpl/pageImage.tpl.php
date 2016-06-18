<?php 
	global $base_url; 
?>
<div class="link-breadcrumb">
	<a href="<?php echo $base_url; ?>" title="Trang chủ">Trang chủ</a> › 
	<a href="<?php echo FunctionLib::buildLinkCategory($arrCategory->category_id, $arrCategory->category_name_alias) ?>" title="<?php echo $arrCategory->category_name ?>"><?php echo $arrCategory->category_name ?></a>
</div>
<div class="box-content-list-view">
	<h1 class="title-news"><?php echo $arrCategory->category_name ?></h1>
	<div class="list-news-post image">
		<?php 
		$total = count($result);
		foreach($result as $k => $item) {
		?>
		<div class="item-news">
			<div class="post-img">
				<a href="<?php echo FunctionLib::buildLinkDetail($item->image_id, $item->image_category, $item->image_title_alias); ?>" title="<?php echo $item->image_title ?>">
					<?php if($item->image_image != ''){?>
					<img alt="<?php echo $item->image_title ?>"
					src="<?php echo FunctionLib::getThumbImage($item->image_image,$item->image_id,FOLDER_IMAGE,400,400) ?>">
					<?php }else{ ?>
					<img src="<?php echo IMAGE_DEFAULT ?>"/>
					<?php } ?>
					<div class="post-format">
						<i class="icon-picture"></i>
					</div>
				</a>
				
			</div>
			<div class="post-data">
				<h2 class="post-title"><a href="<?php echo FunctionLib::buildLinkDetail($item->image_id, $item->image_category, $item->image_title_alias); ?>" title="<?php echo $item->image_title ?>"><?php echo $item->image_title ?></a></h2>
				<div class="post-content">
					<?php
						if($item->image_desc_sort != ''){
							echo Utility::substring($item->image_desc_sort, 200, '...');
						}else{
							echo Utility::substring(strip_tags($item->image_content), 200, '...');
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