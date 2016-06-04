<?php
	global $base_url;
	$param = arg();
	$dashboard = 'class="active"';
	if(count($param)>=2){
		$dashboard='';
	}else{
		$param[1] = '';
	}
?>
<div class="navigation">
	<ul>
        <li <?php echo $dashboard ?>>
        	<a title="<?php echo t('Bảng điều khiển')?>" href="<?php echo $base_url?>/admincp"><i class="icon-dashboard"></i>Trang chủ Admin</a>
        </li>
        
        <li <?php if($param[1]=='type' || $param[1]=='category' || $param[1]=='news' || $param[1]=='video'){?> class="active" <?php } ?>>
            <a title="" href="javascript:void(0)"><i class="icon-cogs"></i> Quản lý nội dung<i class="icon-arrow"></i></a>
            <ul class="sub">
                <li <?php if($param[1]=='type'){?> class="active" <?php } ?>><a class="" title="" href="<?php echo $base_url ?>/admincp/type"><i class="icon-minus"></i> Kiểu dữ liệu</a></li>
                <li <?php if($param[1]=='category'){?> class="active" <?php } ?>><a class="" title="" href="<?php echo $base_url ?>/admincp/category"><i class="icon-minus"></i> Chuyên mục</a></li>
                <li <?php if($param[1]=='news'){?> class="active" <?php } ?>><a class="" title="" href="<?php echo $base_url ?>/admincp/news"><i class="icon-minus"></i> Quản lý bài viết</a></li>
                <li <?php if($param[1]=='video'){?> class="active" <?php } ?>><a class="" title="" href="<?php echo $base_url ?>/admincp/video"><i class="icon-minus"></i> Quản lý Video</a></li>
            </ul>
        </li>

        <li <?php if($param[1]=='configinfo'|| $param[1]=='supportonline' || $param[1]=='banner'){?> class="active" <?php } ?>>
            <a title="" href="javascript:void(0)"><i class="icon-folder-open"></i> Quản lý Ứng dụng<i class="icon-arrow"></i></a>
            <ul class="sub">
                <li <?php if($param[1]=='configinfo'){?> class="active" <?php } ?>><a class="" title="" href="<?php echo $base_url ?>/admincp/configinfo"><i class="icon-minus"></i> Cấu hình chung</a></li>
                <li <?php if($param[1]=='supportonline'){?> class="active" <?php } ?>><a class="" title="" href="<?php echo $base_url ?>/admincp/supportonline"><i class="icon-minus"></i> Nick support</a></li>
                <li <?php if($param[1]=='banner'){?> class="active" <?php } ?>><a class="" title="" href="<?php echo $base_url ?>/admincp/banner"><i class="icon-minus"></i> Banner quảng cáo</a></li>
            </ul>
        </li>

    </ul>
</div>