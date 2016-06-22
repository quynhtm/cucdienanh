<div class="search-box">
	<div class="wrapp-search-box">
		<div class="search-box-title">Thông tin tìm kiếm</div>
		<form action="" method="GET" id="frmSearch" class="frmSearch" name="frmSearch">
			<div class="col-lg-3">
				<label class="control-label">Tiêu đề bài viết</label>
				<div><input type="text" class="form-control input-sm" placeholder ="Tiêu đề bài viết" id="service_name" class="keyword" name="service_name" value="<?php echo $dataSearch['service_name'] ?>"/></div>
			</div>
			<div class="col-lg-3">
				<label class="control-label">Danh mục</label>
				<div><select class="form-control input-sm" name="service_category"><?php echo $optionCategory;?></select></div>
			</div>
			<div class="col-lg-3">
				<label class="control-label">Trạng thái</label>
				<div><select class="form-control input-sm" name="news_status"><?php echo $optionStatus;?></select></div>
			</div>

			<div class="col-lg-3">
				<label class="control-label">&nbsp;</label>
				<div><button class="btn btn-primary" name="submit" value="1">Tìm kiếm</button></div>
			</div>
		</form>
	</div>
</div>

<div class="inner-box">
	<div class="page-title-box">
		<div class="wrapper">
			<h5 class="padding10"><?php echo (isset($title)) ? $title: t('Quản lý bài viết');?></h5>
			<span class="menu_tools">
				<a href="<?php echo $base_url; ?>/admincp/sendservicefocus/add" title="Thêm mới" class="icon-plus icon-admin green"></a>
                <a href="javascript:void(0)" title="Xóa item" id="deleteMoreItem" class="icon-trash icon-admin red"></a>
           </span>
		</div>
	</div>
	<div class="page-content-box">
		<div class="show-bottom-info">
			<div class="total-rows"><b><?php echo t('Tổng số: ')?> <?php echo $totalItem ?></b></div>
			<div class="list-item-page">
				<div class="showListPage">
					<?php print render($pager); ?>
				</div>
			</div>
		</div>
		<form id="formListItem"  name="txtForm" action="" method="post">
			<div class="showListItem">
				<table class="table taicon-adminble-bordered table-hover table-striped" width="100%" cellpadding="5" cellspacing="1" border="1">
					<thead>
					<tr>
						<th width="2%"class="td_list">STT</th>
						<th width="1%" class="td_list"><input type="checkbox" id="checkAll"/></th>
						<th width="20%" class="td_list">Thông tin người gửi</th>
						<th width="20%" class="td_list">Tên dịch vụ công</th>
						<th width="20%" class="td_list">Thuộc danh mục</th>
						<th width="20%" class="td_list">Ngày tạo</th>
						<th width="10%" class="td_list align_center">Trạng thái</th>
						<th width="5%" class="td_list align_center">Action</th>
					</tr>
					</thead>
					<tbody>
					<?php if(!empty($result)) {?>
						<?php foreach ($result as $key => $item) {?>
						<tr>
							<td><?php echo $key+1 ?></td>
							<td><input type="checkbox" class="checkItem" name="checkItem[]" value="<?php echo $item->service_id ?>" /></td>
							<td>
								Ông/bà: <b><?php echo $item->service_name ?></b><br/>
								Địa chỉ: <b><?php echo $item->service_address ?></b><br/>
								Số ĐT: <b><?php echo $item->service_phone ?></b><br/>
								Mail: <b><?php echo $item->service_mail ?></b><br/>
							</td>
							<td><?php echo $item->service_title ?></td>
							<td><?php echo isset($aryCatergoryDocument[$item->service_category])?$aryCatergoryDocument[$item->service_category]:'Chưa rõ'; ?></td>
							<td>
								<?php
									if($item->service_create > 0){
										echo date('d-m-Y h:i:s',$item->service_create);
									}
								?>
							</td>
							<td class="align_center">
								<?php 
									if(isset($arrStatus)){
										echo $arrStatus[$item->service_status];
									}else{
										echo "Chưa rõ";
									}
								?>
							</td>
							<td class="align_center">
								<?php $linkEdit = $base_url.'/admincp/sendservicefocus/edit/'.$item->service_id; ?>
								<a href="<?php echo $linkEdit; ?>" title="Update Item"><i class="icon-edit icon-admin green "></i></a>
							</td>
						</tr>
						<?php }?>
					<?php }?>
					</tbody>
				</table>
				<input  type="hidden" name="txtFormName" value="txtFormName"/>
			</div>
		</form>
		<div class="show-bottom-info">
			<div class="total-rows"><b><?php echo t('Tổng số: ')?> <?php echo $totalItem ?></b></div>
			<div class="list-item-page">
				<div class="showListPage">
					<?php print render($pager); ?>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	jQuery(document).ready(function(){
		DELETE_ITEM.init('admincp/sendservicefocus');
	});
</script>
