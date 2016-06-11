<?php 
	global $base_url;

	$news_id = $result->news_id;
	$news_category = $result->news_category;
	$news_title = $result->news_title;
	$news_title_alias = $result->news_title_alias;
	$news_desc_sort = $result->news_desc_sort;
	$news_content = $result->news_content;
	$news_create = $result->news_create;

	$news_meta_title = $result->news_meta_title;
	$news_meta_keyword = $result->news_meta_keyword;
	$news_meta_description = $result->news_meta_description;
	
	$news_image = $result->news_image;
	if($result->news_image != ''){
		$news_image = FunctionLib::getThumbImage($result->news_image, $news_id, FOLDER_NEWS,400,500);
	}
	if($news_meta_title == ''){
		$news_meta_title = $news_title;
	}
	SeoMeta::SEO($news_title.' - '.WEB_SITE, $news_image, $news_meta_title.' - '.WEB_SITE, $news_meta_keyword.' - '.WEB_SITE, $news_meta_description.' - '.WEB_SITE);
?>

<div class="link-breadcrumb">
	<a title="Trang chủ" href="<?php echo $base_url ?>">Trang chủ</a> › 
	<a href="<?php echo FunctionLib::buildLinkCategory($arrCat->category_id, $arrCat->category_name_alias); ?>" title="<?php echo $arrCat->category_name ?>"><?php echo $arrCat->category_name ?></a>
</div>
<div class="box-content-view">
	<div class="title"><a href="<?php echo FunctionLib::buildLinkDetail($news_id, $news_category, $news_title_alias); ?>" title="<?php echo $news_title ?>"><?php echo $news_title ?></a> <span></span></div>
	<div class="line-save">
		<div class="bookmark">Bookmark</div>
		<div class="print" data-cat='<?php echo $news_category ?>' data-post="<?php echo $news_title_alias.'-'.$news_id.'.html' ?>">In bài viết</div>
		<div class="date-created"><?php echo date('d/m/Y h:i', $news_create)?></div>
	</div>
	<div class="line-intro-view"><?php echo $news_desc_sort ?></div>
	<div class="line-content-view"><?php echo $news_content ?></div>
	<div class="line-save ext">
		<div class="bookmark">Bookmark</div>
		<div class="print" data-cat='<?php echo $news_category ?>' data-post="<?php echo $news_title_alias.'-'.$news_id.'.html' ?>">In bài viết</div>
		<div class="view">Xem phản hồi</div>
		<div class="commment">Gửi phản hồi</div>
		<div class="back">Trở về</div>
	</div>
	<div class="title-same">Tin khác<span></span></div>
	<div class="content-same-post">
		<ul>
			<?php foreach($arrSame as $k=>$item){
				if($k<5){
			?>
			<li><a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>"><?php echo $item->news_title ?></a></li>
			<?php 
				} 
			}
			?>
		</ul>
		<ul>
			<?php foreach($arrSame as $k=>$item){
				if($k>=5){
			?>
			<li><a href="<?php echo FunctionLib::buildLinkDetail($item->news_id, $item->news_category, $item->news_title_alias); ?>" title="<?php echo $item->news_title ?>"><?php echo $item->news_title ?></a></li>
			<?php 
				} 
			}
			?>
		</ul>
	</div>
</div>


