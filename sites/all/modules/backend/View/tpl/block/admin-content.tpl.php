<?php 
/*
* @Created by:
* @Author	: pt.soleil@gmail.com
* @Date 	: 2013
* @Version	: 1.0 
*/
global $base_url;
?>
<div class="wrapper-admin-cpanel">
	<div class="notification-global">
		<div class="title-global"><h2>CMS Control panel </h2></div>
	</div>
	<div class="content-global">
		<div class="wrapp-content-global">
			<!--Dòng 1-->
			<div class="col-lg-2 align_center">
				<a class="a_control" target="_blank" title="Home Site" href="<?php echo $base_url ?>">
					<div class="boder_admin padding10">
						<i class="icon-home icon-4x"></i> <br/>Home Site
					</div>
				</a>
			</div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Danh sách Shop" href="<?php echo $base_url ?>/admincp/usershop">
					<div class="boder_admin padding10">
						<i class="icon-group icon-4x"></i> <br/>Users Shop
					</div>
				</a>
			</div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Cấu hình chung" href="<?php echo $base_url ?>/admincp/configinfo">
					<div class="boder_admin padding10">
					<i class="icon-cogs icon-4x"></i> <br/>Cấu hình chung
					</div>
				</a>
			</div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Nick hỗ trợ" href="<?php echo $base_url ?>/admincp/supportonline">
					<div class="boder_admin padding10">
					<i class="icon-skype icon-4x"></i> <br/>Nick hỗ trợ
					</div>
				</a>
			</div>


			<!--Dòng 2-->
			<div class="clear paddingTop30"></div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Kiểu dữ liệu" href="<?php echo $base_url ?>/admincp/type">
					<div class="boder_admin padding10">
					<i class="icon-reorder icon-4x"></i> <br/>Kiểu dữ liệu
					</div>
				</a>
			</div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Danh mục tin" href="<?php echo $base_url ?>/admincp/category">
					<div class="boder_admin padding10">
					<i class="icon-sitemap icon-4x"></i> <br/>Chuyên mục
					</div>
				</a>
			</div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Banner Quảng cáo" href="<?php echo $base_url ?>/admincp/banner">
					<div class="boder_admin padding10">
					<i class="icon-globe icon-4x"></i> <br/>Banner Quảng cáo
					</div>
				</a>
			</div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Quản lý Tin tức" href="<?php echo $base_url ?>/admincp/news">
					<div class="boder_admin padding10">
						<i class="icon-book icon-4x"></i> <br/>Quản lý bài viết
					</div>
				</a>
			</div>
			<div class="col-lg-2 align_center">
				<a class="a_control" title="Quản lý Video" href="<?php echo $base_url ?>/admincp/video">
					<div class="boder_admin padding10">
						<i class="icon-facetime-video icon-4x"></i> <br/>Quản lý video
					</div>
				</a>
			</div>

		</div>
	</div>
</div>

