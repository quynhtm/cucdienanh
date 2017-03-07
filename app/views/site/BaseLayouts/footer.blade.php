<div class="bottom-page container">
<div class="pull-left">
	@if(isset($arrBannerFooter) && sizeof($arrBannerFooter) > 0)
		@foreach($arrBannerFooter as $bannerShowRight)
		@foreach($bannerShowRight as $k=>$sliderRight)
		  <img src="{{ThumbImg::thumbImageBannerNormal($sliderRight->banner_id,$sliderRight->banner_parent_id, $sliderRight->banner_image, CGlobal::sizeImage_1700,0, $sliderRight->banner_name,true,true)}}" alt="{{$sliderRight->banner_name}}" />
		@endforeach
		@endforeach
	@else
		{{$address}}
	@endif
   </div>
</div>
<script type='text/javascript'>window._sbzq||function(e){e._sbzq=[];var t=e._sbzq;t.push(["_setAccount",58182]);var n=e.location.protocol=="https:"?"https:":"http:";var r=document.createElement("script");r.type="text/javascript";r.async=true;r.src=n+"//static.subiz.com/public/js/loader.js";var i=document.getElementsByTagName("script")[0];i.parentNode.insertBefore(r,i)}(window);</script>