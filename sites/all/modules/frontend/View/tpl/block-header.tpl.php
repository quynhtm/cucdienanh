<?php 
	global $base_url;
	$keyword = FunctionLib::getParam('keyword','');
?>
<div class="header-top">
	<div class="wrapp">
		<div class="logo">
			<a href="<?php echo $base_url ?>" title="Cục Điện Ảnh">Cục Điện Ảnh</a>
		</div>
		<div class="right-header">
			<div class="list-lang">
				<a href="<?php echo $base_url.'?lang=vi' ?>" class="vi">Vi</a>
				<a href="<?php echo $base_url.'?lang=en' ?>" class="en">En</a>
			</div>
			<div class="search">
				<form action="<?php echo $base_url.'/tim-kiem.html' ?>" method="GET" id="frmSearch">
					<input type="text" placeholder="Tìm kiếm" name="keyword" class="keyword" value="<?php echo $keyword ?>"/>
					<span id="btnSearch" class="btnSearch">Tìm kiếm</span>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="bg-menu">
	<div class="wrapp">
		<ul>
			<li><a href="<?php echo $base_url ?>" title="Trang chủ">Trang chủ</a></li>
			<?php 
				$i=0;
				foreach($listCategory as $k=>$v){
					if(!empty($v)){
						if($v['category_horizontal'] == 1){
							$i++;
							if($i <= 6){
			?>
			<li>
				<a href="<?php echo FunctionLib::buildLinkCategory($v['category_id'], $v['category_name_alias']); ?>" title="<?php echo $v['category_name'] ?>"><?php echo $v['category_name'] ?></a>
				<?php if( isset($v['sub']) ){?>
				<ul class="submenu">
					<?php foreach($v['sub'] as $s){ 
						if($s['category_horizontal'] == 1){
					?>
					<li><a href="<?php echo FunctionLib::buildLinkCategory($s['category_id'], $s['category_name_alias']); ?>" title="<?php echo $s['category_name'] ?>"><?php echo $s['category_name'] ?></a></li>
					<?php } } ?>
				</ul>
				<?php } ?>
			</li>
			<?php 			}
						} 
				 	}
				} 
			?>
		</ul>
	</div>
</div>