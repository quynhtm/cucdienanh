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
	<div class="box-comment-post">
		<div class="form-comment-post">
			<div class="col-sm-8">
				<div class="row">
					<form name="form-comment" class="frmComment" method="POST" action="">
						<div class="form-comment-post">
							<div class="line-form">
								<div class="control-group">
									<label class="control-label">Họ tên <span>(*)</span></label>
									<div class="controls">
										<input type="text" class="form-control input-sm frmName" placeholder="Họ tên" name="name" maxlength="255">
									</div>
								</div>
					
								<div class="control-group">
									<label class="control-label">Email</label>
									<div class="controls">
										<input type="text" class="form-control input-sm frmMail" placeholder="Email" name="email" maxlength="255">
									</div>
								</div>
							</div>

							<div class="line-form">
								<div class="control-group">
									<label class="control-label">Tiêu đề <span>(*)</span></label>
									<div class="controls">
										<input type="text" class="form-control input-sm frmTitle" placeholder="Tiêu đề" name="title" maxlength="255">
									</div>
								</div>
								<div class="control-group">
									<div class="item-post-frm showCaptcha">
										<label class="control-label" for='message'>Mã an toàn: <span>(*)</span></label>
										<input id="security_code" name="captcha" type="text" maxlength="255" placeholder="Mã an toàn" class="form-control input-sm frmCaptcha"/>
										<img id="img_code" src="<?php echo $base_url?>/captcha?rand=<?php echo rand();?>" />
										<span id="refresh_code" onclick="refreshCaptcha();" title="Mã an toàn mới">Mã an toàn mới</span>
									</div>

								</div>
							</div>

							<div class="control-group textarea">
								<label class="control-label">Bình luận <span>(*)</span></label>
								<div class="controls">
									<textarea name="content" class="form-control input-sm frmContent" cols="30" rows="5" maxlength="2000"></textarea>
								</div>
							</div>
							<input type="hidden" name="itemid" value="<?php echo $news_id ?>"/>
							<input type="hidden" name="catid" value="<?php echo $news_category ?>"/>
							<button type="submit" name="submit" id="buttonFormCommentSubmit" class="btn btn-primary" value="1">Gửi nhận xét</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="item-comment">
			<div class="list-comment">
				<?php 
				if(isset($arrComment['data']) && !empty($arrComment['data'])){
				foreach($arrComment['data'] as $comment){ ?>
				<div class="item-rep">
					<div class="c-title">
						<span class="c-name"><?php echo $comment->comment_customer_name ?></span>
						<span class="c-time"> - <?php echo date('d/m/Y h:i', $comment->comment_create) ?></span>
					</div>
					<div class="c-comment"><?php echo $comment->comment_content ?></div>
				</div>
				<?php } } ?>
				

			</div>
		</div>
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

