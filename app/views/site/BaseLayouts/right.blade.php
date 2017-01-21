<div class="site-right col-lg-4 col-sm-4">
   <div class="section video-post">
      <div class="title-section">
         <i class="icon-title"></i>
         <a href="http://baritevietlao.com.vn/video-clips-19.html" class="pull-left">Video clips</a>
      </div>
      <div class="saperator">
         <iframe src="https://www.youtube.com/embed/4LtujnxxOic?rel=0" allowfullscreen="" height="300" frameborder="0" width="100%"></iframe>				
         <div class="title-active">
            <i class="icon-other icon-video"></i>
            <a href="http://baritevietlao.com.vn/video-clips/khai-thac-quang-dong-lo-thien-2.html" title="Khai thác quặng đồng lộ thiên ">
            Khai thác quặng đồng lộ thiên 					</a>
         </div>
      </div>
      <ul class="list-video-post">
         <li>
            <i class="icon-other icon-video"></i>
            <a href="http://baritevietlao.com.vn/video-clips/khai-thac-quang-quaczit-tren-song-chay-bao-nhai-bac-ha-lao-cai-1.html" title="Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai">
            Khai thác quặng Quaczit trên sông chảy - Bảo Nhai - Bắc Hà - Lào Cai			</a>
         </li>
      </ul>
   </div>
   <div class="section image-post">
      <div class="title-section">
         <i class="icon-title"></i>
         <a href="http://baritevietlao.com.vn/thu-vien-anh-5.html" class="pull-left" title="Thư viện ảnh">
            <p>Thư viện ảnh</p>
         </a>
      </div>
      <div class="saperator">
         <img src="http://baritevietlao.com.vn/uploads/thumbs/slide_image/12/500x500/12-05-10-11-09-2016-dsc1034.jpg" alt="Khu vực khai thác mỏ Barite">
         <div class="title-active">
            <i class="icon-other icon-image"></i>
            <a href="http://baritevietlao.com.vn/thu-vien-anh/khu-vuc-khai-thac-mo-barite-12.html" title="Khu vực khai thác mỏ Barite">Khu vực khai thác mỏ Barite			</a>
         </div>
      </div>
      <ul class="list-image-post">
         <li>
            <i class="icon-other icon-image"></i>
            <a href="http://baritevietlao.com.vn/thu-vien-anh/nha-may-barite-tai-cum-ban-noongma-11.html" title="Nhà máy Barite tại cụm bản Noongma">
            Nhà máy Barite tại cụm bản Noongma			</a>
         </li>
      </ul>
   </div>
	<div class="section business-post">
	   <div class="title-section">
		  <i class="icon-title"></i>
		  <a href="http://baritevietlao.com.vn/net-dep-trong-van-hoa-kinh-doanh-21.html" class="pull-left" title="Nét đẹp văn hóa kinh doanh">
			 <p>Nét đẹp văn hóa kinh doanh</p>
		  </a>
	   </div>
	   <ul class="list-business-post">
		  <li>
			 <img alt="Con đường phía trước luôn luôn rộng mở dù có những khúc quanh" src="http://baritevietlao.com.vn/uploads/thumbs/news/31/500x500/02-19-43-17-08-2016-1.jpg">
			 <a class="post-title" href="http://baritevietlao.com.vn/net-dep-trong-van-hoa-kinh-doanh/con-duong-phia-truoc-luon-luon-rong-mo-du-co-nhung-khuc-quanh-31.html" title="Con đường phía trước luôn luôn rộng mở dù có những khúc quanh">Con đường phía trước luôn luôn rộng mở dù có những khúc quanh</a>
		  </li>
		  <li>
			 <img alt="Sự êm đềm cho ta sức mạnh và niềm tin" src="http://baritevietlao.com.vn/uploads/thumbs/news/32/500x500/02-20-38-17-08-2016-2.jpg">
			 <a class="post-title" href="http://baritevietlao.com.vn/net-dep-trong-van-hoa-kinh-doanh/su-em-dem-cho-ta-suc-manh-va-niem-tin-32.html" title="Sự êm đềm cho ta sức mạnh và niềm tin">Sự êm đềm cho ta sức mạnh và niềm tin</a>
		  </li>
		  <li>
			 <img alt="Để thành công phải biết song hành cùng đối tác" src="http://baritevietlao.com.vn/uploads/thumbs/news/33/500x500/02-22-00-17-08-2016-3.jpg">
			 <a class="post-title" href="http://baritevietlao.com.vn/net-dep-trong-van-hoa-kinh-doanh/de-thanh-cong-phai-biet-song-hanh-cung-doi-tac-33.html" title="Để thành công phải biết song hành cùng đối tác">Để thành công phải biết song hành cùng đối tác</a>
		  </li>
	   </ul>
	</div>
	<div class="section cv-post">
	   @if(isset($arrBannerRight) && sizeof($arrBannerRight) > 0)
			@foreach($arrBannerRight as $bannerShowRight)
			@foreach($bannerShowRight as $k=>$sliderRight)
			<div class="item-ads-right">
			  <a @if($sliderRight->banner_is_rel == CGlobal::LINK_NOFOLLOW) rel="nofollow" @endif @if($sliderRight->banner_is_target == CGlobal::BANNER_TARGET_BLANK) target="_blank" @endif href="@if($sliderRight->banner_link != '') {{$sliderRight->banner_link}} @else javascript:void(0) @endif" title="{{$sliderRight->banner_name}}">
			      <img src="{{ThumbImg::thumbImageBannerNormal($sliderRight->banner_id,$sliderRight->banner_parent_id, $sliderRight->banner_image, CGlobal::sizeImage_1700,CGlobal::sizeImage_372, $sliderRight->banner_name,true,true)}}" alt="{{$sliderRight->banner_name}}" />
			  </a>
		    </div>
			@endforeach
			@endforeach
		@endif
	</div>
</div>