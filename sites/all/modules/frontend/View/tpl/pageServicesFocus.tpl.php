<?php 
	global $base_url; 
?>
<div class="link-breadcrumb">
	<a href="<?php echo $base_url; ?>" title="Trang chủ">Trang chủ</a> › 
	<a href="<?php echo FunctionLib::buildLinkCategory($arrCategory->category_id, $arrCategory->category_name_alias) ?>" title="<?php echo $arrCategory->category_name ?>"><?php echo $arrCategory->category_name ?></a>
</div>
<div class="box-content-list-view">
	<h1 class="title-news show">DANH SÁCH CÁC DỊCH VỤ CÔNG TRỰC TUYẾN</h1>
	<div class="list-news-post-services">
		<table cellspacing="1">
			<?php foreach($listCategory as $key=>$cat){?>
			<tr>
				<td valign="top" align="left">
					<div class="cat-name"><span><?php echo $key+1 ?></span> <?php echo $cat['category_name']?></div>
					<table width="100%" cellspacing="3" cellpadding="0" border="0" class="tbldocument">
						<?php foreach($result as $item){
							if($item->document_category == $cat['category_id']){
						?>
						<tr>
							<td>
								<a href="<?php echo FunctionLib::buildLinkDetail($item->document_id, $item->document_category, $item->document_name_alias); ?>" title="<?php echo $item->document_name ?>" class="lnkdocument"><?php echo $item->document_name ?> <span>(Hướng dẫn chi tiết hồ sơ)</span></a>
							</td>
							<td width="10%">
								<a class="reg-button" href="<?php echo FunctionLib::buildLinkDetail($item->document_id, $item->document_category, $item->document_name_alias); ?>">Đăng ký</a>
							</td>
						</tr>
						<?php } ?>
						<?php } ?>
					</table>
					<hr>
				</td>
			</tr>
			<?php } ?>
		</table>
		<div class="show-box-paging" style="margin-top:20px; ">
			<div class="showListPage">
				<?php print render($pager); ?>
			</div>
		</div>
	</div>
</div>