jQuery(document).ready(function($){
	HISTORY_BACK.init();
	HIDDEN_MENU_ADMIN.init();
	HIDDEN_MENU_ADMIN.menu_left();
	ADD_TITLE_FILE_UPLOAD_SERVICE_FOCUS.add();
	ADD_TITLE_FILE_UPLOAD_SERVICE_FOCUS.del();
});

DELETE_ITEM={
	init:function(path_menu){
		jQuery('a#deleteMoreItem').click(function(){
			var total = jQuery( "input:checked" ).length;
			if(total==0){
				alert('Vui lòng chọn ít nhất 1 bản ghi để xóa!');
				return false;
			}else{
				if (confirm('Bạn muốn xóa [OK]:Đồng ý [Cancel]:Bỏ qua?)')){
					jQuery('form#formListItem').attr("action", BASEPARAMS.base_url+"/"+path_menu+"/delete");
					jQuery('form#formListItem').submit();
					return true;
				}
				return false;
			}
		});
	}
}

HISTORY_BACK = {
	init:function(){
		jQuery("button[type=reset]").click(function(){
	   		window.history.back();
	   });
	}
}

HIDDEN_MENU_ADMIN = {
	init:function(){
		jQuery("#box-menu-click").click(function(){
			jQuery('.pageWrapper').toggleClass('act');
		});
	},
	menu_left:function(){
		jQuery(".navigation>ul>li.active ul").slideDown();
		jQuery(".navigation>ul>li").click(function(event){
			jQuery('.navigation>ul>li').not(this).removeClass('active');
			if(jQuery(this).hasClass('active')){
				jQuery(this).removeClass('active');
				jQuery(".navigation>ul>li>ul").slideUp();
				jQuery(this).find('ul').slideUp();
			}else{
				jQuery(this).addClass('active');
				jQuery(".navigation>ul>li>ul").slideUp();
				jQuery(this).find('ul').slideDown();
			}
		});
	}
}

ADD_TITLE_FILE_UPLOAD_SERVICE_FOCUS = {
	add:function(){
		jQuery('#add_document_other').click(function(){
			var textarea = '<div class="item-document-other"><textarea name="document_text_file_other[]" cols="30" rows="3"></textarea><span class="remove-document-other">X</span></div>';
			jQuery('#sys_show_document_other').append(textarea);
			ADD_TITLE_FILE_UPLOAD_SERVICE_FOCUS.del();
		});
	},
	del:function(){
		jQuery(".remove-document-other").click(function(){
			if(confirm('Bạn muốn xóa [OK]:Đồng ý [Cancel]:Bỏ qua?)')){
               jQuery(this).parent('div.item-document-other').remove();
               return true;
            }
		});
	}
}