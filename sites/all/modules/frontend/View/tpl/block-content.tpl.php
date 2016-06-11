<?php 
	global $base_url;
?>
<div class="content-post-cat">
	<ul>
		<?php
			foreach($listCategory as $k=>$v){
				if(!empty($v)){
					if($v['category_content_front'] == STASTUS_SHOW ){
						$arrItemPost = SiteController::getListPostInCategory($v['category_id']);
		?>
		<li>
			<div class="title-cat">
				<a href="<?php echo FunctionLib::buildLinkCategory($v['category_id'], $v['category_name_alias']); ?>" title="<?php echo $v['category_name'] ?>"><?php echo $v['category_name'] ?></a><span></span>
			</div>
			
			<?php if(!empty($arrItemPost)){?>
			<div class="wrapp-item-post">
				<?php foreach($arrItemPost as $key => $item){
					if($key == 0){
				?>
				<div class="content-cat">
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
				</div>
				<?php } ?>
				<?php } ?>
				<div class="list-content-cat">
					<ul>
						<?php foreach($arrItemPost as $key => $item){
							if($key > 0){
						?>
						<li><a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>"><?php echo $item->news_title ?></a></li>
						<?php } ?>
						<?php } ?>
					</ul>
				</div>
			</div>
			<?php } ?>
			
		</li>
		<?php 		
					} 
			 	}
			} 
		?>
	</ul>
</div>
