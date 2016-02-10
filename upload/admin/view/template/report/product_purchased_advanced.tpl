<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_order_status_id" id="input-status" class="form-control">
                  <option value="0"><?php echo $text_all_status; ?></option>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
			    <?php if ($filter_product_id == "") { ?>
					<td class="text-left"><?php echo $column_name; ?></td>
					<td class="text-left"><?php echo $column_model; ?></td>
					<td class="text-right"><?php echo $column_quantity; ?></td>
					<td class="text-right"><?php echo $column_total; ?></td>
				<?php } else { ?>
					<td class="text-left">Customer Name</td>
					<td class="text-left">Customer Email</td>
					<td class="text-right">Country</td>
					<td class="text-right">Order Date</td>
					<td class="text-right">Quantity</td>
					<td class="text-right">Total</td>
				<?php } ?>
              </tr>
            </thead>
            <tbody>
              <?php if ($products) { ?>
			  <?php if ($filter_product_id != "") { ?>
			  <?php
				$back_url = "index.php?route=report/product_purchased_advanced&token=".$token;
				if ($filter_date_start != "")
					$back_url .= "&filter_date_start=".$filter_date_start;
				if ($filter_date_end != "")
					$back_url .= "&filter_date_end=".$filter_date_end;
				if ($filter_order_status_id != "")
					$back_url .= "&filter_order_status_id=".$filter_order_status_id;	
					
				?>
				    <tr><td class="text-left" colspan="6"><a class="btn btn-info" href="<?php echo $back_url; ?>"><i class="fa fa-arrow-left"></i> BACK</a></td></tr>
				  	<tr><td style="background-color:#f5f5f5; padding-top:15px; padding-left:15px;" class="text-left" colspan="6"><h3><i class="fa fa-cubes"></i> <?php echo $products[0]['name']; ?></h3></td>
              <?php }  ?>
              <?php foreach ($products as $product) { ?>
              <tr>
			    <?php if ($filter_product_id != "") { ?>
				
					<td class="text-left">
						<a href="index.php?route=sale/order/info&token=<?php echo $token; ?>&order_id=<?php echo $product['order_id']; ?>" data-toggle="tooltip" title="View" class="btn btn-info"><i class="fa fa-eye"></i></a> 
						<?php echo $product['customer']; ?>
					</td>
					<td class="text-left"><?php echo $product['email']; ?></td>
					<td class="text-right"><?php echo $product['country']; ?></td>
					<td class="text-right"><?php echo $product['order_date']; ?></td>
					<td class="text-right"><?php echo $product['quantity']; ?></td>
					<td class="text-right"><?php echo $product['total']; ?></td>
                <?php } else { ?>
					<?php
					$product_url = "index.php?route=report/product_purchased_advanced&token=".$token."&filter_product_id=".$product['product_id'];
					if ($filter_date_start != "")
						$product_url .= "&filter_date_start=".$filter_date_start;
					if ($filter_date_end != "")
						$product_url .= "&filter_date_end=".$filter_date_end;
					if ($filter_order_status_id != "")
						$product_url .= "&filter_order_status_id=".$filter_order_status_id;	
					?>
					<td class="text-left"><a href="<?php echo $product_url ?>"><?php echo $product['name']; ?></a></td></td>
                    <td class="text-left"><?php echo $product['model']; ?></td>
					<td class="text-right"><?php echo $product['quantity']; ?></td>
					<td class="text-right"><?php echo $product['total']; ?></td>
				<?php } ?>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	<?php if(isset($product['product_id'])) { ?>
		url = 'index.php?route=report/product_purchased_advanced&token=<?php echo $token; ?>&filter_product_id=<?php echo $product['product_id'] ?>';
	<?php }	else { ?>
		url = 'index.php?route=report/product_purchased_advanced&token=<?php echo $token; ?>';
	<?php } ?>
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
	
	var filter_order_status_id = $('select[name=\'filter_order_status_id\']').val();
	
	if (filter_order_status_id != 0) {
		url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	}

	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script> 
</div>
<?php echo $footer; ?>