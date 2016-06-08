<div class="search-box">
	<div class="wrapp-search-box">
		<div class="search-box-title">Thông tin tìm kiếm</div>
		<form action="" method="GET" id="frmSearch" class="frmSearch" name="frmSearch">
			<div class="col-lg-3">
				<label class="control-label">Tên người dùng</label>
				<div><input type="text" class="form-control input-sm" placeholder="Tên người dùng" class="keyword" name="name" value="<?php echo $dataSearch['name'] ?>"/></div>
			</div>
			<div class="col-lg-3">
				<label class="control-label">Mail</label>
				<div><input type="text" class="form-control input-sm" placeholder="Mail" class="keyword" name="mail" value="<?php echo $dataSearch['mail'] ?>"/></div>
			</div>
			<div class="col-lg-3">
				<label class="control-label">Trạng thái</label>
				<div><select class="form-control input-sm" name="status"><?php echo $optionStatus;?></select></div>
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
			<h5 class="padding10"><?php echo (isset($title)) ? $title: t('Quản lý người dùng');?></h5>
			<span class="menu_tools">
				<a href="<?php echo $base_url; ?>/admincp/users/add" title="Thêm mới" class="icon-plus icon-admin green"></a>
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
						<th width="30%" class="td_list">Tên người dùng</th>
						<th width="8%" class="td_list">Mail</th>
						<th width="8%" class="td_list">Nhóm quyền</th>
						<th width="8%" class="td_list">Ngày tạo</th>
						<th width="5%" class="td_list">Trạng thái</th>
						<th width="5%" class="td_list">Action</th>
					</tr>
					</thead>
					<tbody>
					<?php foreach ($result as $key => $item) {?>
					<tr>
						<td><?php echo $key+1 ?></td>
						<td><input type="checkbox" class="checkItem" name="checkItem[]" value="<?php echo $item->uid ?>" /></td>
						<td><?php echo ucfirst($item->name) ?></td>
						<td><?php echo $item->mail ?></td>
						<td><?php echo ucfirst($item->role) ?></td>
						<td><?php echo date('d-m-Y h:i:s',$item->created) ?></td>
						<td>
							<?php echo ($item->status== STASTUS_SHOW )? '<i class="icon-ok icon-admin green"></i>': '<i class="icon-remove icon-admin red"></i>'; ?>
						</td>
						<td>
							<?php $linkEdit = $base_url.'/admincp/users/edit/'.$item->uid; ?>
							<a href="<?php echo $linkEdit; ?>" title="Update Item"><i class="icon-edit icon-admin green "></i></a>
						</td>
					</tr>
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
		DELETE_ITEM.init('admincp/users');
	});
</script>
