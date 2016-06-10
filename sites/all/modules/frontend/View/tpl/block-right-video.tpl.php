<?php 
	global $base_url;
?>
<div class="item-box">
	<?php 
	$i=0;
	foreach($listVideoHot as $k => $v){
		$path_vieo = PATH_UPLOAD.'/'.FOLDER_VIDEO.'/'.$v->video_id.'/'.$v->video_file;
		$path_img = PATH_UPLOAD.'/'.FOLDER_VIDEO.'/'.$v->video_id.'/'.$v->video_img;
		if(is_file($path_vieo)){
			$i++;
			$url_video = $base_url.'/uploads/'.FOLDER_VIDEO.'/'.$v->video_id.'/'.$v->video_file;

			if(is_file($path_img)){
				$url_img = '&amp;image='.$base_url.'/uploads/'.FOLDER_VIDEO.'/'.$v->video_id.'/'.$v->video_img;
			}else{
				$url_img = '';
			}
	?>
	<?php if($i == 1){?>
	<div class="video" id="jwplayer_lblMedia">
		<embed id="MediaPlayer" height="186" width="230" type="application/x-shockwave-flash" 
		src="<?php echo $base_url ?>/sites/all/modules/autoLoad/bootstrap/lib/flvplayer/mediaplayer.swf" 
		style="" id="single" name="single" bgcolor="#ffffff" quality="high" allowfullscreen="true" allowscriptaccess="always" wmode="transparent" 
		flashvars="width=230&amp;height=186&amp;autostart=false&amp;showdigits=true&amp;showdownload=false&amp;file=<?php echo $url_video ?><?php echo $url_img ?>">
	</div>
	<?php } ?>
	<?php }else{ unset($listVideoHot[$k]); } ?>
	<?php } ?>
	<div class="list-video-other" id="jwplayer_tblOther">
		<ul class="video-other">
			<?php foreach($listVideoHot as $v){
				$url_video = $base_url.'/uploads/'.FOLDER_VIDEO.'/'.$v->video_id.'/'.$v->video_file;
			?>
			<li><a href="javascript:showVideo(<?php echo $v->video_id ?>,'<?php echo $url_video ?>','jwplayer_lblMedia','false');"><?php echo $v->video_name ?></a></li>
			<?php } ?>
		</ul>
	</div>
</div>