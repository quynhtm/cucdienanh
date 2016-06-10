<?php 
	global $base_url;
?>
<?php
	foreach($listCategory as $k=>$v){
		if(!empty($v)){
			if($v['category_vertical'] == STASTUS_MENU_RIGHT ){
?>
<div class="item-box ext">
	<div class="title-box"><a href="<?php echo FunctionLib::buildLinkCategory($v['category_id'], $v['category_name_alias']); ?>" title="<?php echo $v['category_name'] ?>"><?php echo $v['category_name'] ?></a></div>
	<div class="content-box">
		<?php if( isset($v['sub']) ){?>
		<ul>
			<?php foreach($v['sub'] as $s){ ?>
			<li><a href="<?php echo FunctionLib::buildLinkCategory($s['category_id'], $s['category_name_alias']); ?>" title="<?php echo $s['category_name'] ?>"><?php echo $s['category_name'] ?></a></li>
			<?php } ?>
		</ul>
		<?php } ?>
	</div>
</div>
<?php 		
			}
	 	}
	} 
?>