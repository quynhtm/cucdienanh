<?php 
	global $base_url;
?>
<div class="content-post-cat">
	<ul>
		<?php
			foreach($listCategory as $k=>$v){
				if(!empty($v)){
					if($v['category_content_front'] == STASTUS_SHOW ){
						
		?>
		<li>
			<div class="title-cat">
				<a href="<?php echo FunctionLib::buildLinkCategory($v['category_id'], $v['category_name_alias']); ?>" title="<?php echo $v['category_name'] ?>"><?php echo $v['category_name'] ?></a><span></span>
			</div>
			<div class="content-cat">
				<div class="thumb">
					<a href=""><img src="<?php echo $base_url.'/'.path_to_theme()?>/View/img/cat1.jpg" alt=""></a>
				</div>
				<div class="title">
					<a href="">Thông gia đón Tết – Phim hài mang lại tiếng cười sâu sắc</a>
				</div>
			</div>
			<div class="list-content-cat">
				<ul>
					<li><a href="">Hồ Quang 8: “Không quá đao to búa lớn”</a></li>
					<li><a href="">Ariana Grande: Thành công bắt đầu từ đâu</a></li>
					<li><a href="">Danh ca Khánh Ly tâm sự cuộc đời trong lỗi</a></li>
					<li><a href="">Triệu Trang chào năm mới bằng sêri album</a></li>
					<li><a href="">Quảng bá sâu rộng cho nét tinh tế từ áo dài</a></li>
				</ul>
			</div>
		</li>
		<?php 		
					} 
			 	}
			} 
		?>
	</ul>
</div>
