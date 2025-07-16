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
            <td><span class="required">*</span>&nbsp;<label for="input-login"><?php echo $entry_login; ?></label></td>
            <td><?php if ($error_login) { ?>
              <input type="text" name="web_payment_software_merchant_name" id="input-login" value="<?php echo $web_payment_software_merchant_name; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_login; ?></span>
            <?php } else { ?>
              <input type="text" name="web_payment_software_merchant_name" id="input-login" value="<?php echo $web_payment_software_merchant_name; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-key"><?php echo $entry_key; ?></label></td>
            <td><?php if ($error_key) { ?>
              <input type="text" name="web_payment_software_merchant_key" id="input-key" value="<?php echo $web_payment_software_merchant_key; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_key; ?></span>
            <?php } else { ?>
              <input type="text" name="web_payment_software_merchant_key" id="input-key" value="<?php echo $web_payment_software_merchant_key; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><label for="input-mode"><?php echo $entry_mode; ?></label></td>
            <td><select name="web_payment_software_mode" id="input-mode">
              <?php if ($web_payment_software_mode == 'live') { ?>
                <option value="live" selected="selected"><?php echo $text_live; ?></option>
              <?php } else { ?>
                <option value="live"><?php echo $text_live; ?></option>
              <?php } ?>
              <?php if ($web_payment_software_mode == 'test') { ?>
                <option value="test" selected="selected"><?php echo $text_test; ?></option>
              <?php } else { ?>
                <option value="test"><?php echo $text_test; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-method"><?php echo $entry_method; ?></label></td>
            <td><select name="web_payment_software_method" id="input-method">
              <?php if ($web_payment_software_method == 'authorization') { ?>
                <option value="authorization" selected="selected"><?php echo $text_authorization; ?></option>
              <?php } else { ?>
                <option value="authorization"><?php echo $text_authorization; ?></option>
              <?php } ?>
              <?php if ($web_payment_software_method == 'capture') { ?>
                <option value="capture" selected="selected"><?php echo $text_capture; ?></option>
              <?php } else { ?>
                <option value="capture"><?php echo $text_capture; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-total"><?php echo $entry_total; ?><br /><span class="help"><?php echo $help_total; ?></span></label></td>
            <td><input type="text" name="web_payment_software_total" id="input-total" value="<?php echo !empty($web_payment_software_total) ? $web_payment_software_total : '0.00'; ?>" /></td>
          </tr>
          <tr>
            <td><label for="input-total-max"><?php echo $entry_total_max; ?><br /><span class="help"><?php echo $help_total_max; ?></span></label></td>
            <td><input type="text" name="web_payment_software_total_max" id="input-total-max" value="<?php echo !empty($web_payment_software_total_max) ? $web_payment_software_total_max : '0.00'; ?>" /></td>
          </tr>
          <tr>
            <td><label for="input-order-status"><?php echo $entry_order_status; ?></label></td>
            <td><select name="web_payment_software_order_status_id" id="input-order-status">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $web_payment_software_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-geo-zone"><?php echo $entry_geo_zone; ?></label></td>
            <td><select name="web_payment_software_geo_zone_id" id="input-geo-zone">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $web_payment_software_geo_zone_id) { ?>
                  <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-status"><?php echo $entry_status; ?></label></td>
            <td><select name="web_payment_software_status" id="input-status">
              <?php if ($web_payment_software_status) { ?>
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
            <td><input type="text" name="web_payment_software_sort_order" value="<?php echo $web_payment_software_sort_order; ?>" id="input-sort-order" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>