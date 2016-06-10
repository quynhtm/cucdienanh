<?php 
	global $base_url;
?>
<div class="item-box">
	<div class="title-box">Thông tin điện ảnh</div>
	<div class="content-box">
		<ul>
			<?php
				foreach($listCategory as $k=>$v){
					if(!empty($v)){
						if($v['category_vertical'] == STASTUS_MENU_LEFT ){
							
			?>
			<li>
				<a href="<?php echo FunctionLib::buildLinkCategory($v['category_id'], $v['category_name_alias']); ?>" title="<?php echo $v['category_name'] ?>"><?php echo $v['category_name'] ?></a>
				<?php if( isset($v['sub']) ){?>
				<ul class="submenu">
					<?php foreach($v['sub'] as $s){ ?>
					<li><a href="<?php echo FunctionLib::buildLinkCategory($s['category_id'], $s['category_name_alias']); ?>" title="<?php echo $s['category_name'] ?>"><?php echo $s['category_name'] ?></a></li>
					<?php } ?>
				</ul>
				<?php } ?>
			</li>
			<?php 		
						} 
				 	}
				} 
			?>
		</ul>
	</div>
</div>