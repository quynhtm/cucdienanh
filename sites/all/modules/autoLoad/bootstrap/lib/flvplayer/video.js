
function showVideo(VideoID, Filename, Lbl, Autostart){
	
  	var obj = new SWFObject(BASEPARAMS.base_url + '/sites/all/modules/autoLoad/bootstrap/lib/flvplayer/mediaplayer.swf','MediaPlayer','99%','186','8');
	
	obj.addParam('allowscriptaccess','always');
	obj.addParam('allowfullscreen','true');
	obj.addParam('wmode','transparent');
	obj.addVariable('autostart',Autostart);
	obj.addVariable('width','230');
	obj.addVariable('height','186');
	obj.addVariable('file', Filename);
	obj.write(Lbl);
}