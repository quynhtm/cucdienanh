<?php 
	global $base_url;

	$image_id = $result->image_id;
	$image_category = $result->image_category;
	$image_title = $result->image_title;
	$image_title_alias = $result->image_title_alias;
	$image_desc_sort = $result->image_desc_sort;
	$image_content = $result->image_content;
	$image_create = $result->image_create;
	$image_image_other = $result->image_image_other;

	$image_meta_title = $result->image_meta_title;
	$image_meta_keyword = $result->image_meta_keyword;
	$image_meta_description = $result->image_meta_description;
	
	$image_image = '';
	if($result->image_image != ''){
		$image_image = FunctionLib::getThumbImage($result->image_image, $image_id, FOLDER_IMAGE,400,500);
	}
	if($image_meta_title == ''){
		$image_meta_title = $image_title;
	}
	SeoMeta::SEO($image_title.' - '.WEB_SITE, $image_image, $image_meta_title.' - '.WEB_SITE, $image_meta_keyword.' - '.WEB_SITE, $image_meta_description.' - '.WEB_SITE);
?>

<div class="link-breadcrumb">
	<a title="Trang chủ" href="<?php echo $base_url ?>">Trang chủ</a> › 
	<a href="<?php echo FunctionLib::buildLinkCategory($arrCat->category_id, $arrCat->category_name_alias); ?>" title="<?php echo $arrCat->category_name ?>"><?php echo $arrCat->category_name ?></a>
</div>
<div class="box-content-view">
	<div class="title"><a href="<?php echo FunctionLib::buildLinkDetail($image_id, $image_category, $image_title_alias); ?>" title="<?php echo $image_title ?>"><?php echo $image_title ?></a> <span></span></div>
	<div class="line-save">
		<div class="bookmark">Bookmark</div>
		<div class="date-created"><?php echo date('d/m/Y h:i', $image_create)?></div>
	</div>
	<div class="line-intro-view"><?php echo $image_desc_sort ?></div>
	
	<div class="line-slider-img-view" id="gallery">
		
		<div class="bxSliderViewImage">
			<?php 
				if($image_image_other != ''){
					$image_image_other = unserialize($image_image_other);
				}
				else{
					$image_image_other = array();
				}
				foreach($image_image_other as $v){
			?>
			<div class="slide item-slider">
				<div class="img">
					<i href="<?php echo FunctionLib::getThumbImage($v,$image_id,FOLDER_IMAGE,800,800) ?>" title="<?php echo $image_title ?>">
						<img alt="<?php echo $image_title ?>"
							src="<?php echo FunctionLib::getThumbImage($v, $image_id,FOLDER_IMAGE,800,0) ?>">
					</i>
				</div>
			</div>
			<?php } ?>
		</div>
	
		<div class="view-img-slider">
			<?php foreach($image_image_other as $v){?>
			<i href="<?php echo FunctionLib::getThumbImage($v,$image_id,FOLDER_IMAGE,800,800) ?>" title="<?php echo $image_title ?>">
				<img alt="<?php echo $image_title ?>"
						src="<?php echo FunctionLib::getThumbImage($v, $image_id,FOLDER_IMAGE,400,400) ?>">
			</i>
			<?php } ?>
		</div>
	</div>

	<div class="line-content-view"><?php echo $image_content ?></div>
	<div class="line-save ext">
		<div class="bookmark">Bookmark</div>
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
							<input type="hidden" name="itemid" value="<?php echo $image_id ?>"/>
							<input type="hidden" name="catid" value="<?php echo $image_category ?>"/>
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
				<?php 
					} 
				}else{ 
				?>
				<div class="note-empty"><?php echo NOT_COMMENT ?></div>
				<?php } ?>
			</div>
		</div>
	</div>

	<div class="title-same">Thư viện ảnh khác<span></span></div>
	<div class="content-same-post">
		<ul class="same-vieo-list">
			<?php foreach($arrSame as $k=>$item){?>
			<li>
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
			</li>
			<?php }
			?>
		</ul>
	</div>
</div>


<script>
	jQuery(document).ready(function() {
		jQuery('#gallery').magnificPopup({
			delegate: 'i',
			type: 'image',
			tLoading: 'Loading image...',
			mainClass: 'mfp-img-mobile',
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1],
			},
			image: {
				tError: '<a href="%url%">Đây là ảnh</a> không thể tải được.',
				titleSrc: function(item) {
					return item.el.attr('title');
				}
			}
		});
	});
</script>

<script>
	jQuery(document).ready(function(){
		var bxSider = jQuery('.bxSliderViewImage').bxSlider({
			slideWidth: 800,
			minSlides: 1,
			maxSlides: 2,
			slideMargin: 10,
			mode: 'fade',
			pager: false,
			auto: true,
		});
	});
</script>