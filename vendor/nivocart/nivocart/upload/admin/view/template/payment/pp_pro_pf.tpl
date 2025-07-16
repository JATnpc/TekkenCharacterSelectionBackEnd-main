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
        <a onclick="location = '<?php echo $cancel; ?>';" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-vendor"><?php echo $entry_vendor; ?><br /><span class="help"><?php echo $help_vendor; ?></span></label></td>
            <td><?php if ($error_vendor) { ?>
              <input type="text" name="pp_pro_pf_vendor" id="input-vendor" value="<?php echo $pp_pro_pf_vendor; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_vendor; ?></span>
            <?php } else { ?>
              <input type="text" name="pp_pro_pf_vendor" id="input-vendor" value="<?php echo $pp_pro_pf_vendor; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-user"><?php echo $entry_user; ?><br /><span class="help"><?php echo $help_user; ?></span></label></td>
            <td><?php if ($error_user) { ?>
              <input type="text" name="pp_pro_pf_user" id="input-user" value="<?php echo $pp_pro_pf_user; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_user; ?></span>
            <?php } else { ?>
              <input type="text" name="pp_pro_pf_user" id="input-user" value="<?php echo $pp_pro_pf_user; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-password"><?php echo $entry_password; ?><br /><span class="help"><?php echo $help_password; ?></span></label></td>
            <td><?php if ($error_password) { ?>
              <input type="text" name="pp_pro_pf_password" id="input-password" value="<?php echo $pp_pro_pf_password; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_password; ?></span>
            <?php } else { ?>
              <input type="text" name="pp_pro_pf_password" id="input-password" value="<?php echo $pp_pro_pf_password; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-partner"><?php echo $entry_partner; ?><br /><span class="help"><?php echo $help_partner; ?></span></label></td>
            <td><?php if ($error_partner) { ?>
              <input type="text" name="pp_pro_pf_partner" id="input-partner" value="<?php echo $pp_pro_pf_partner; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_partner; ?></span>
            <?php } else { ?>
              <input type="text" name="pp_pro_pf_partner" id="input-partner" value="<?php echo $pp_pro_pf_partner; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><label for="input-live-demo"><?php echo $entry_test; ?><br /><span class="help"><?php echo $help_test; ?></span></label></td>
            <td><select name="pp_pro_pf_test" id="input-live-demo">
              <?php if ($pp_pro_pf_test) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
              <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-transaction"><?php echo $entry_transaction; ?><br /><span class="help"><?php echo $help_transaction; ?></span></label></td>
            <td><select name="pp_pro_pf_transaction" id="input-transaction">
              <?php if (!$pp_pro_pf_transaction) { ?>
                <option value="0" selected="selected"><?php echo $text_authorization; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_authorization; ?></option>
              <?php } ?>
              <?php if ($pp_pro_pf_transaction) { ?>
                <option value="1" selected="selected"><?php echo $text_sale; ?></option>
              <?php } else { ?>
                <option value="1"><?php echo $text_sale; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-total"><?php echo $entry_total; ?><br /><span class="help"><?php echo $help_total; ?></span></label></td>
            <td><input type="text" name="pp_pro_pf_total" id="input-total" value="<?php echo $pp_pro_pf_total; ?>" /></td>
          </tr>
          <tr>
            <td><label for="input-total-max"><?php echo $entry_total_max; ?><br /><span class="help"><?php echo $help_total_max; ?></span></label></td>
            <td><input type="text" name="pp_pro_pf_total_max" id="input-total-max" value="<?php echo $pp_pro_pf_total_max; ?>" /></td>
          </tr>
          <tr>
            <td><label for="input-order-status"><?php echo $entry_order_status; ?></label></td>
            <td><select name="pp_pro_pf_order_status_id" id="input-order-status">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $pp_pro_pf_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-geo-zone"><?php echo $entry_geo_zone; ?></label></td>
            <td><select name="pp_pro_pf_geo_zone_id" id="input-geo-zone">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $pp_pro_pf_geo_zone_id) { ?>
                  <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><label for="input-status"><?php echo $entry_status; ?></label></td>
            <td><select name="pp_pro_pf_status" id="input-status">
              <?php if ($pp_pro_pf_status) { ?>
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
            <td><input type="text" name="pp_pro_pf_sort_order" id="input-sort-order" value="<?php echo $pp_pro_pf_sort_order; ?>" size="1" /></td>
          </tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>