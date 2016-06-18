jQuery(document).ready(function($){
	SITE.back_top();
	SITE.bookmark();
	SITE.history_back();
	SITE.print();
	SITE.search();
	SITE.comment();
});
SITE={
	back_top:function(){
		 jQuery(window).scroll(function() {
            if(jQuery(window).scrollTop() > 0) {
				jQuery("#back-to-top").fadeIn();
			} else {
				jQuery("#back-to-top").fadeOut();
			}
		});
		jQuery("#back-to-top").click(function(){
			jQuery("html, body").animate({scrollTop: 0}, 1000);
			return false;
		});
	},
	bookmark:function(){
		jQuery(".line-save .bookmark").click(function(e){
			jAlert( 'Nhấn CTRL+D và click link để bookmark!', 'Cảnh báo');
		});
	},
	history_back:function(){
		jQuery(".line-save .back").click(function(){
	   		window.history.back();
	   });
	},
	print:function(){
		jQuery(".line-save .print").click(function(){
			var w  = 600;
			var left = (window.screen.width / 2) - ((w / 2) + 10);
    		var data_cat_alias = jQuery(this).attr('data-cat');
    		var data_post = jQuery(this).attr('data-post');
    		window.open(BASEPARAMS.base_url+'/print/'+data_cat_alias+'/'+data_post, 'In bài viết', 'width='+w+', resizable=yes, scrollbars=yes, status=yes, screenX='+left);
		});
		jQuery(".right-print").click(function(){
			window.print();
		});
	},
	search:function(){
		jQuery('#btnSearch').click(function(){
			var keyword = jQuery('.keyword').val();
			if(keyword == ''){
				jAlert( 'Vui lòng nhập từ khóa để tìm kiếm!', 'Cảnh báo');
			}else{
				jQuery('form#frmSearch').submit();
			}
		});
	},
	comment:function(){
		jQuery('.line-save.ext .view').click(function(){
			jQuery('.box-comment-post .item-comment').toggleClass('act');
			jQuery('.box-comment-post .form-comment-post').removeClass('act');
		});
		jQuery('.line-save.ext .commment').click(function(){
			jQuery('.box-comment-post .item-comment').removeClass('act');
			jQuery('.box-comment-post .form-comment-post').toggleClass('act');
		});


		jQuery("#buttonFormCommentSubmit").click(function(){
			var name = jQuery(".form-comment-post input.frmName");
			var title = jQuery(".form-comment-post input.frmTitle");
			var captcha = jQuery(".form-comment-post input.frmCaptcha");
			var content = jQuery(".form-comment-post textarea.frmContent");

			if(name.val() == ''){
				jAlert('Họ tên không được trống!', 'Cảnh báo');
				name.addClass('error').focus();
				return false;
			}else{
				name.removeClass('error');
			}

			if(title.val() == ''){
				jAlert('Tiêu đề không được trống!', 'Cảnh báo');
				title.addClass('error').focus();
				return false;
			}else{
				title.removeClass('error');
			}

			if(captcha.val() == ''){
				jAlert('Mã an toàn không được trống!', 'Cảnh báo');
				captcha.addClass('error').focus();
				return false;
			}else{
				captcha.removeClass('error');
			}

			if(content.val() == ''){
				jAlert('Nội dung không được trống!', 'Cảnh báo');
				content.addClass('error').focus();
				return false;
			}else{
				content.removeClass('error');
			}
			
			jQuery("form.frmComment").submit();
		});
	}
}