<?php 
	global $base_url;
?>
<?php
	foreach($listCategory as $k=>$v){
		if(!empty($v)){
			if($v['category_vertical'] == STASTUS_MENU_RIGHT ){
				
?>
<div class="item-box ext">
	<div class="title-box">Chính sách - Văn bản</div>
	<div class="content-box">
		<ul>
			<li><a href="">Luật điện ảnh</a></li>
			<li><a href="">Nghị định</a></li>
			<li><a href="">Chiến lược phát triển điện ảnh</a></li>
			<li><a href="">quy hoạch</a></li>
			<li><a href="">Thông tư</a></li>
		</ul>
	</div>
</div>
<?php 		
			}
	 	}
	} 
?>