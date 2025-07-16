<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button-save ripple"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save ripple"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-merchant"><?php echo $entry_merchant; ?></label></td>
            <td><?php if ($error_merchant) { ?>
              <input type="text" name="liqpay_merchant" id="input-merchant" value="<?php echo $liqpay_merchant; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_merchant; ?></span>
            <?php } else { ?>
              <input type="text" name="liqpay_merchant" id="input-merchant" value="<?php echo $liqpay_merchant; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-signature"><?php echo $entry_signature; ?></label></td>
            <td><?php if ($error_signature) { ?>
              <input type="text" name="liqpay_signature" id="input-signature" value="<?php echo $liqpay_signature; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_signature; ?></span>
            <?php } else { ?>
              <input type="text" name="liqpay_signature" id="input-signature" value="<?php echo $liqpay_signature; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><label for="input-type"><?php echo $entry_type; ?></label></td>
            <td><select name="liqpay_type" id="input-type">
              <?php if ($liqpay_type == 'liqpay') { ?>
                <option value="liqpay" selected="selected"><?php echo $text_pay; ?></option>
              <?php } else { ?>
                <option value="liqpay"><?php echo $text_pay; ?></option>
              <?php } ?>
              <?php if ($liqpay_type == 'card') { ?>
                <option value="card" selected="selected"><?php echo $text_card; ?></option>
              <?php } else { ?>
                <option value="card"><?php echo $text_card; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-total"><?php echo $entry_total; ?><br /><span class="help"><?php echo $help_total; ?></span></label></td>
            <td><input type="text" name="liqpay_total" id="input-total" value="<?php echo !empty($liqpay_total) ? $liqpay_total : '0.00'; ?>" /></td>
          </tr>
          <tr>
            <td><label for="input-total-max"><?php echo $entry_total_max; ?><br /><span class="help"><?php echo $help_total_max; ?></span></label></td>
            <td><input type="text" name="liqpay_total_max" id="input-total-max" value="<?php echo !empty($liqpay_total_max) ? $liqpay_total_max : '0.00'; ?>" /></td>
          </tr>
          <tr>
            <td><label for="input-order-status"><?php echo $entry_order_status; ?></label></td>
            <td><select name="liqpay_order_status_id" id="input-order-status">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $liqpay_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-geo-zone"><?php echo $entry_geo_zone; ?></label></td>
            <td><select name="liqpay_geo_zone_id" id="input-geo-zone">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $liqpay_geo_zone_id) { ?>
                  <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-status"><?php echo $entry_status; ?></label></td>
            <td><select name="liqpay_status" id="input-status">
              <?php if ($liqpay_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-sort-order"><?php echo $entry_sort_order; ?></label></td>
            <td><input type="text" name="liqpay_sort_order" value="<?php echo $liqpay_sort_order; ?>" id="input-sort-order" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>