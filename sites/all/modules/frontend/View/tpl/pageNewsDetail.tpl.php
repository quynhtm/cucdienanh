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
					<div class="form-comment-post">
						<div class="line-form">
							<div class="control-group">
								<label class="control-label">Họ tên</label>
								<div class="controls">
									<input type="text" class="form-control input-sm" placeholder="Họ tên" name="name">
								</div>
							</div>
				
							<div class="control-group">
								<label class="control-label">Email</label>
								<div class="controls">
									<input type="text" class="form-control input-sm" placeholder="Email" name="email">
								</div>
							</div>
						</div>

						<div class="line-form">
							<div class="control-group">
								<label class="control-label">Tiêu đề</label>
								<div class="controls">
									<input type="text" class="form-control input-sm" placeholder="Tiêu đề" name="title">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Mã an toàn</label>
								<div class="controls">
									<input type="text" class="form-control input-sm" placeholder="Mã an toàn" name="captcha">
								</div>
							</div>
						</div>

						<div class="control-group textarea">
							<label class="control-label">Bình luận</label>
							<div class="controls">
								<textarea name="product_content" id="product_content" class="form-control input-sm" cols="30" rows="5"></textarea>
							</div>
						</div>
						<button type="submit" name="submit" id="buttonFormCommentSubmit" class="btn btn-primary" value="1">Gửi nhận xét</button>
					</div>
				</div>
			</div>
		</div>
		<div class="item-comment">
			<div class="c-title">
				<span class="c-name">Duy Nguyen</span>
				<span class="c-time">- 8 giờ trước</span>
			</div>
			<div class="c-comment">
				Mình mới mua sp này ,rất tiện lợi ,dùng rất ok
			</div>
			<div class="rep-comment">Trả lời</div>
			<div class="list-comment">
				<div class="item-rep">
					<div class="c-title">
						<span class="c-name">Duy Nguyen</span>
						<span class="c-time">- 8 giờ trước</span>
					</div>
					<div class="c-comment">
						Chào bạn Phạm Văn Khoa, Bộ phận CSKH của chúng tôi sẽ liên hệ để hỗ trợ bạn đặt đơn hàng. 
						Bạn vui lòng giữ liên lạc nhé. Cảm ơn bạn đã quan tâm đến các sản phẩm do chúng tôi cung cấp!
					</div>
					<div class="rep-comment">Trả lời</div>
				</div>
				<div class="item-rep">
					<div class="c-title">
						<span class="c-name">Duy Nguyen</span>
						<span class="c-time">- 8 giờ trước</span>
					</div>
					<div class="c-comment">
						Chào bạn Phạm Văn Khoa, Bộ phận CSKH của chúng tôi sẽ liên hệ để hỗ trợ bạn đặt đơn hàng. 
						Bạn vui lòng giữ liên lạc nhé. Cảm ơn bạn đã quan tâm đến các sản phẩm do chúng tôi cung cấp!
					</div>
					<div class="rep-comment">Trả lời</div>
				</div>
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

