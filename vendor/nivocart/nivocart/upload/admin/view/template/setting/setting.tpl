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
  <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="location='<?php echo $themes; ?>';" class="button ripple"><i class="fa fa-magic"></i> &nbsp; <?php echo $button_themes; ?></a>
        <a onclick="$('#form').submit();" class="button-save ripple"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save ripple"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <div id="tabs" class="htabs">
        <a href="#tab-general"><?php echo $tab_general; ?></a>
        <a href="#tab-store"><?php echo $tab_store; ?></a>
        <a href="#tab-local"><?php echo $tab_local; ?></a>
        <a href="#tab-checkout"><?php echo $tab_checkout; ?></a>
        <a href="#tab-option"><?php echo $tab_option; ?></a>
        <a href="#tab-preference"><?php echo $tab_preference; ?></a>
        <a href="#tab-image"><?php echo $tab_image; ?></a>
        <a href="#tab-ftp"><?php echo $tab_ftp; ?></a>
        <a href="#tab-mail"><?php echo $tab_mail; ?></a>
        <a href="#tab-media"><?php echo $tab_media; ?></a>
        <a href="#tab-server"><?php echo $tab_server; ?></a>
      </div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <div id="tab-general">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><?php if ($error_name) { ?>
              <input type="text" name="config_name" value="<?php echo $config_name; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_name; ?></span>
            <?php } else { ?>
              <input type="text" name="config_name" value="<?php echo $config_name; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_owner; ?></td>
            <td><?php if ($error_owner) { ?>
              <input type="text" name="config_owner" value="<?php echo $config_owner; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_owner; ?></span>
            <?php } else { ?>
              <input type="text" name="config_owner" value="<?php echo $config_owner; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_address; ?></td>
            <td><?php if ($error_address) { ?>
              <textarea name="config_address" cols="40" rows="5" class="input-error"><?php echo $config_address; ?></textarea>
              <span class="error"><?php echo $error_address; ?></span>
            <?php } else { ?>
              <textarea name="config_address" cols="40" rows="5"><?php echo $config_address; ?></textarea>
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_email; ?></td>
            <td><?php if ($error_email) { ?>
              <input type="text" name="config_email" value="<?php echo $config_email; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_email; ?></span>
            <?php } else { ?>
              <input type="text" name="config_email" value="<?php echo $config_email; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_email_noreply; ?></td>
            <td><?php if ($error_email_noreply) { ?>
              <input type="text" name="config_email_noreply" value="<?php echo $config_email_noreply; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_email_noreply; ?></span>
            <?php } else { ?>
              <input type="text" name="config_email_noreply" value="<?php echo $config_email_noreply; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
            <td><?php if ($error_telephone) { ?>
              <input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" class="input-error" />
              <span class="error"><?php echo $error_telephone; ?></span>
            <?php } else { ?>
              <input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_fax; ?></td>
            <td><input type="text" name="config_fax" value="<?php echo $config_fax; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_company_id; ?></td>
            <td><input type="text" name="config_company_id" value="<?php echo $config_company_id; ?>" size="40" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_company_tax_id; ?></td>
            <td><input type="text" name="config_company_tax_id" value="<?php echo $config_company_tax_id; ?>" size="40" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_bank_name; ?></td>
            <td><input type="text" name="config_bank_name" value="<?php echo $config_bank_name; ?>" size="40" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_bank_sort_code; ?></td>
            <td><input type="text" name="config_bank_sort_code" value="<?php echo $config_bank_sort_code; ?>" size="40" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_bank_account; ?></td>
            <td><input type="text" name="config_bank_account" value="<?php echo $config_bank_account; ?>" size="40" /></td>
          </tr>
        </table>
      </div>
      <div id="tab-store">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_title; ?></td>
            <td><?php if ($error_title) { ?>
              <input type="text" name="config_title" value="<?php echo $config_title; ?>" size="40" class="input-error" />
              <span class="error"><?php echo $error_title; ?></span>
            <?php } else { ?>
              <input type="text" name="config_title" value="<?php echo $config_title; ?>" size="40" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_meta_description; ?></td>
            <td><textarea name="config_meta_description" id="meta-description" data-limit="156" cols="40" rows="5"><?php echo isset($config_meta_description) ? $config_meta_description : ''; ?></textarea>
            <span id="remaining"></span></td>
          </tr>
          <tr>
            <td><?php echo $entry_meta_keyword; ?><span class="help"><?php echo $help_meta_keyword; ?></span></td>
            <td><textarea name="config_meta_keyword" cols="40" rows="5"><?php echo isset($config_meta_keyword) ? $config_meta_keyword : ''; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_template; ?></td>
            <td><select name="config_template">
            <?php foreach ($templates as $template) { ?>
              <?php if ($template['name'] == $config_template) { ?>
                <option value="<?php echo $template['name']; ?>" selected="selected"><?php echo $template['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $template['name']; ?>"><?php echo $template['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_theme; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td></td>
            <td><?php foreach ($templates as $template) { ?>
              <?php echo ($template['name'] == $config_template) ? '<img src="' . $template['image'] . '" alt="" style="border:1px solid #EEE;" />' : ''; ?>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_layout; ?></td>
            <td><select name="config_layout_id">
            <?php foreach ($layouts as $layout) { ?>
              <?php if ($layout['layout_id'] == $config_layout_id) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_layout; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
        </table>
      </div>
      <div id="tab-local">
        <table class="form">
          <tr>
            <td><?php echo $entry_country; ?></td>
            <td><select name="config_country_id">
            <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $config_country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_zone; ?></td>
            <td><select name="config_zone_id">
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_language; ?></td>
            <td><select name="config_language">
            <?php foreach ($languages as $language) { ?>
              <?php if ($language['code'] == $config_language) { ?>
                <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_language; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_admin_language; ?></td>
            <td><select name="config_admin_language">
            <?php foreach ($languages as $language) { ?>
              <?php if ($language['code'] == $config_admin_language) { ?>
                <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_length_class; ?></td>
            <td><select name="config_length_class_id">
            <?php foreach ($length_classes as $length_class) { ?>
              <?php if ($length_class['length_class_id'] == $config_length_class_id) { ?>
                <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
              <?php } ?>
            <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_length_class; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_weight_class; ?></td>
            <td><select name="config_weight_class_id">
            <?php foreach ($weight_classes as $weight_class) { ?>
              <?php if ($weight_class['weight_class_id'] == $config_weight_class_id) { ?>
                <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
              <?php } ?>
            <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_weight_class; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
        </table>
        <h2><?php echo $text_currencies; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_currency; ?><span class="help"><?php echo $help_currency; ?></span></td>
            <td><select name="config_currency">
            <?php foreach ($currencies as $currency) { ?>
              <?php if ($currency['code'] == $config_currency) { ?>
                <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
              <?php } ?>
            <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_currency; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_currency_auto; ?><span class="help"><?php echo $help_currency_auto; ?></span></td>
            <td><?php if ($config_currency_auto) { ?>
              <input type="radio" name="config_currency_auto" value="1" id="currency-auto-on" class="radio" checked />
              <label for="currency-auto-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_currency_auto" value="0" id="currency-auto-off" class="radio" />
              <label for="currency-auto-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_currency_auto" value="1" id="currency-auto-on" class="radio" />
              <label for="currency-auto-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_currency_auto" value="0" id="currency-auto-off" class="radio" checked />
              <label for="currency-auto-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_alpha_vantage; ?><span class="help"><?php echo $help_alpha_vantage; ?></span></td>
            <td><input id="key_alpha_vantage" name="config_alpha_vantage" value="<?php echo isset($config_alpha_vantage) ? $config_alpha_vantage : ''; ?>" size="30" /> &nbsp;
              <a onclick="window.open('https://www.alphavantage.co/');" title="Alpha Vantage" class="button-form"><i class="fa fa-play-circle"></i> &nbsp; Alpha Vantage</a>
            </td>
          </tr>
        </table>
        <h2><?php echo $text_datetime; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_date_format; ?><span class="help"><?php echo $help_date_format; ?></span></td>
            <td><select name="config_date_format">
              <?php foreach ($date_formats as $date_format) { ?>
                <?php if ($config_date_format == $date_format['format']) { ?>
                  <option value="<?php echo $date_format['format']; ?>" selected="selected"><?php echo $date_format['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $date_format['format']; ?>"><?php echo $date_format['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_time_offset; ?><span class="help"><?php echo $help_time_offset; ?></span></td>
            <td><select name="config_time_offset">
              <?php foreach ($time_offsets as $time_offset) { ?>
                <?php if ($config_time_offset == $time_offset) { ?>
                  <option value="<?php echo $time_offset; ?>" selected="selected"><?php echo $time_offset; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $time_offset; ?>"><?php echo $time_offset; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
        </table>
        <h2><?php echo $text_location; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_store_address; ?><span class="help"><?php echo $help_store_address; ?></span></td>
            <td><?php if ($config_store_address) { ?>
              <input type="radio" name="config_store_address" value="1" id="store-address-on" class="radio" checked />
              <label for="store-address-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_store_address" value="0" id="store-address-off" class="radio" />
              <label for="store-address-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_store_address" value="1" id="store-address-on" class="radio" />
              <label for="store-address-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_store_address" value="0" id="store-address-off" class="radio" checked />
              <label for="store-address-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_store_latitude; ?><span class="help"><?php echo $help_store_latitude; ?></span></td>
            <td><input id="location_store_latitude" name="config_store_latitude" value="<?php echo isset($config_store_latitude) ? $config_store_latitude : ''; ?>" size="30" /> &deg; N</td>
          </tr>
          <tr>
            <td><?php echo $entry_store_longitude; ?><span class="help"><?php echo $help_store_longitude; ?></span></td>
            <td><input id="location_store_longitude" name="config_store_longitude" value="<?php echo isset($config_store_longitude) ? $config_store_longitude : ''; ?>" size="30" /> &deg; E</td>
          </tr>
          <tr>
            <td><?php echo $entry_store_location; ?><span class="help"><?php echo $help_store_location; ?></span></td>
            <td><?php if ($config_store_location) { ?>
              <input type="radio" name="config_store_location" value="1" id="store-location-on" class="radio" checked />
              <label for="store-location-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_store_location" value="0" id="store-location-off" class="radio" />
              <label for="store-location-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_store_location" value="1" id="store-location-on" class="radio" />
              <label for="store-location-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_store_location" value="0" id="store-location-off" class="radio" checked />
              <label for="store-location-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_map_code; ?><span class="help"><?php echo $help_map_code; ?></span></td>
            <td><a onclick="window.open('https://developers.google.com/maps/documentation/embed/');" title="Google Maps" class="button-form"><i class="fa fa-map-marker"></i> &nbsp; Google Maps</a>
              <br /><br />
              <textarea name="config_map_code" cols="50" rows="7"><?php echo $config_map_code; ?></textarea>
            </td>
          </tr>
          <?php if (!empty($config_map_code)) { ?>
          <tr>
            <td><?php echo $text_preview; ?></td>
            <td><?php echo html_entity_decode($config_map_code, ENT_QUOTES, 'UTF-8'); ?></td>
          </tr>
          <?php } ?>
          <tr>
            <td><?php echo $entry_map_display; ?><span class="help"><?php echo $help_map_display; ?></span></td>
            <td><?php if ($config_map_display) { ?>
              <input type="radio" name="config_map_display" value="1" id="map-display-on" class="radio" checked />
              <label for="map-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_map_display" value="0" id="map-display-off" class="radio" />
              <label for="map-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_map_display" value="1" id="map-display-on" class="radio" />
              <label for="map-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_map_display" value="0" id="map-display-off" class="radio" checked />
              <label for="map-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
      </div>
      <div id="tab-checkout">
        <table class="form">
          <tr>
            <td><?php echo $entry_checkout; ?><span class="help"><?php echo $help_checkout; ?></span></td>
            <td><select name="config_checkout_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($informations as $information) { ?>
                <?php if ($information['information_id'] == $config_checkout_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_invoice_prefix; ?><span class="help"><?php echo $help_invoice_prefix; ?></span></td>
            <td><input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_auto_invoice; ?><span class="help"><?php echo $help_auto_invoice; ?></span></td>
            <td><?php if ($config_auto_invoice) { ?>
              <input type="radio" name="config_auto_invoice" value="1" id="auto-invoice-on" class="radio" checked />
              <label for="auto-invoice-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_auto_invoice" value="0" id="auto-invoice-off" class="radio" />
              <label for="auto-invoice-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_auto_invoice" value="1" id="auto-invoice-on" class="radio" />
              <label for="auto-invoice-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_auto_invoice" value="0" id="auto-invoice-off" class="radio" checked />
              <label for="auto-invoice-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_cart_weight; ?><span class="help"><?php echo $help_cart_weight; ?></span></td>
            <td><?php if ($config_cart_weight) { ?>
              <input type="radio" name="config_cart_weight" value="1" id="cart-weight-on" class="radio" checked />
              <label for="cart-weight-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_cart_weight" value="0" id="cart-weight-off" class="radio" />
              <label for="cart-weight-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_cart_weight" value="1" id="cart-weight-on" class="radio" />
              <label for="cart-weight-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_cart_weight" value="0" id="cart-weight-off" class="radio" checked />
              <label for="cart-weight-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_tax_breakdown; ?><span class="help"><?php echo $help_tax_breakdown; ?></span></td>
            <td><?php if ($config_tax_breakdown) { ?>
              <input type="radio" name="config_tax_breakdown" value="1" id="tax-breakdown-on" class="radio" checked />
              <label for="tax-breakdown-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_tax_breakdown" value="0" id="tax-breakdown-off" class="radio" />
              <label for="tax-breakdown-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_tax_breakdown" value="1" id="tax-breakdown-on" class="radio" />
              <label for="tax-breakdown-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_tax_breakdown" value="0" id="tax-breakdown-off" class="radio" checked />
              <label for="tax-breakdown-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_order_edit; ?><span class="help"><?php echo $help_order_edit; ?></span></td>
            <td><input type="text" name="config_order_edit" value="<?php echo $config_order_edit; ?>" size="3" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_order_status; ?><span class="help"><?php echo $help_order_status; ?></span></td>
            <td><select name="config_order_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_complete_status; ?><span class="help"><?php echo $help_complete_status; ?></span></td>
            <td><select name="config_complete_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $config_complete_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_abandoned_cart; ?><span class="help"><?php echo $help_abandoned_cart; ?></span></td>
            <td><input type="text" name="config_abandoned_cart" value="<?php echo $config_abandoned_cart; ?>" size="3" /></td>
          </tr>
        </table>
        <h2><?php echo $text_standard; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_guest_checkout; ?><span class="help"><?php echo $help_guest_checkout; ?></span></td>
            <td><?php if ($config_guest_checkout) { ?>
              <input type="radio" name="config_guest_checkout" value="1" id="guest-checkout-on" class="radio" checked />
              <label for="guest-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_guest_checkout" value="0" id="guest-checkout-off" class="radio" />
              <label for="guest-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_guest_checkout" value="1" id="guest-checkout-on" class="radio" />
              <label for="guest-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_guest_checkout" value="0" id="guest-checkout-off" class="radio" checked />
              <label for="guest-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_express; ?></h2>
        <table class="form">
          <tr>
            <td colspan="2"><img src="view/image/tooltip.png" alt="" /> &nbsp; <?php echo $info_express; ?></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_express_checkout; ?><span class="help"><?php echo $help_express_checkout; ?></span></td>
            <td><?php if ($config_express_checkout) { ?>
              <input type="radio" name="config_express_checkout" value="1" id="express-checkout-on" class="radio" checked />
              <label for="express-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_checkout" value="0" id="express-checkout-off" class="radio" />
              <label for="express-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_express_checkout" value="1" id="express-checkout-on" class="radio" />
              <label for="express-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_checkout" value="0" id="express-checkout-off" class="radio" checked />
              <label for="express-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            <?php if ($error_multiple_checkout) { ?>
              <span class="error"><?php echo $error_multiple_checkout; ?></span>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_autofill; ?><span class="help"><?php echo $help_express_autofill; ?></span></td>
            <td><?php if ($config_express_autofill) { ?>
              <input type="radio" name="config_express_autofill" value="1" id="express-autofill-on" class="radio" checked />
              <label for="express-autofill-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_autofill" value="0" id="express-autofill-off" class="radio" />
              <label for="express-autofill-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_express_autofill" value="1" id="express-autofill-on" class="radio" />
              <label for="express-autofill-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_autofill" value="0" id="express-autofill-off" class="radio" checked />
              <label for="express-autofill-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_password; ?><span class="help"><?php echo $help_express_password; ?></span></td>
            <td><select name="config_express_password">
              <?php if (isset($config_express_password)) { $selected = "selected"; ?>
                <option value="0" <?php if ($config_express_password == '0') { echo $selected; } ?>><?php echo $text_no; ?></option>
                <option value="1" <?php if ($config_express_password == '1') { echo $selected; } ?>><?php echo $text_yes; ?></option>
                <option value="2" <?php if ($config_express_password == '2') { echo $selected; } ?>><?php echo $text_hide; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="2"><?php echo $text_hide; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_phone; ?></td>
            <td><select name="config_express_phone">
              <?php if (isset($config_express_phone)) { $selected = "selected"; ?>
                <option value="0" <?php if ($config_express_phone == '0') { echo $selected; } ?>><?php echo $text_no; ?></option>
                <option value="1" <?php if ($config_express_phone == '1') { echo $selected; } ?>><?php echo $text_yes; ?></option>
                <option value="2" <?php if ($config_express_phone == '2') { echo $selected; } ?>><?php echo $text_required; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="2"><?php echo $text_required; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_billing; ?><span class="help"><?php echo $help_express_billing; ?></span></td>
            <td><?php if ($config_express_billing) { ?>
              <input type="radio" name="config_express_billing" value="1" id="express-billing-on" class="radio" checked />
              <label for="express-billing-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_billing" value="0" id="express-billing-off" class="radio" />
              <label for="express-billing-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_express_billing" value="1" id="express-billing-on" class="radio" />
              <label for="express-billing-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_billing" value="0" id="express-billing-off" class="radio" checked />
              <label for="express-billing-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_comment; ?><span class="help"><?php echo $help_express_comment; ?></span></td>
            <td><?php if ($config_express_comment) { ?>
              <input type="radio" name="config_express_comment" value="1" id="express-comment-on" class="radio" checked />
              <label for="express-comment-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_comment" value="0" id="express-comment-off" class="radio" />
              <label for="express-comment-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_express_comment" value="1" id="express-comment-on" class="radio" />
              <label for="express-comment-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_comment" value="0" id="express-comment-off" class="radio" checked />
              <label for="express-comment-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_newsletter; ?></td>
            <td><select name="config_express_newsletter">
              <?php if (isset($config_express_newsletter)) { $selected = "selected"; ?>
                <option value="0" <?php if ($config_express_newsletter == '0') { echo $selected; } ?>><?php echo $text_no; ?></option>
                <option value="1" <?php if ($config_express_newsletter == '1') { echo $selected; } ?>><?php echo $text_yes; ?></option>
                <option value="2" <?php if ($config_express_newsletter == '2') { echo $selected; } ?>><?php echo $text_choice; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="2"><?php echo $text_choice; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_coupon; ?></td>
            <td><?php if ($config_express_coupon) { ?>
              <input type="radio" name="config_express_coupon" value="1" id="express-coupon-on" class="radio" checked />
              <label for="express-coupon-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_coupon" value="0" id="express-coupon-off" class="radio" />
              <label for="express-coupon-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_express_coupon" value="1" id="express-coupon-on" class="radio" />
              <label for="express-coupon-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_coupon" value="0" id="express-coupon-off" class="radio" checked />
              <label for="express-coupon-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_voucher; ?></td>
            <td><?php if ($config_express_voucher) { ?>
              <input type="radio" name="config_express_voucher" value="1" id="express-voucher-on" class="radio" checked />
              <label for="express-voucher-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_voucher" value="0" id="express-voucher-off" class="radio" />
              <label for="express-voucher-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_express_voucher" value="1" id="express-voucher-on" class="radio" />
              <label for="express-voucher-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_express_voucher" value="0" id="express-voucher-off" class="radio" checked />
              <label for="express-voucher-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_express_point; ?></td>
            <td><select name="config_express_point">
              <?php if (isset($config_express_point)) { $selected = "selected"; ?>
                <option value="0" <?php if ($config_express_point == '0') { echo $selected; } ?>><?php echo $text_no; ?></option>
                <option value="1" <?php if ($config_express_point == '1') { echo $selected; } ?>><?php echo $text_yes; ?></option>
                <option value="2" <?php if ($config_express_point == '2') { echo $selected; } ?>><?php echo $text_automatic; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="2"><?php echo $text_automatic; ?></option>
              <?php } ?>
            </select></td>
          </tr>
        </table>
        <h2><?php echo $text_one_page; ?></h2>
        <table class="form">
          <tr>
            <td colspan="2"><img src="view/image/tooltip.png" alt="" /> &nbsp; <?php echo $info_one_page; ?></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_one_page_checkout; ?><span class="help"><?php echo $help_one_page_checkout; ?></span></td>
            <td><?php if ($config_one_page_checkout) { ?>
              <input type="radio" name="config_one_page_checkout" value="1" id="one-page-checkout-on" class="radio" checked />
              <label for="one-page-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_one_page_checkout" value="0" id="one-page-checkout-off" class="radio" />
              <label for="one-page-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_one_page_checkout" value="1" id="one-page-checkout-on" class="radio" />
              <label for="one-page-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_one_page_checkout" value="0" id="one-page-checkout-off" class="radio" checked />
              <label for="one-page-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            <?php if ($error_multiple_checkout) { ?>
              <span class="error"><?php echo $error_multiple_checkout; ?></span>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_one_page_phone; ?></td>
            <td><select name="config_one_page_phone">
              <?php if (isset($config_one_page_phone)) { $selected = "selected"; ?>
                <option value="0" <?php if ($config_one_page_phone == '0') { echo $selected; } ?>><?php echo $text_no; ?></option>
                <option value="1" <?php if ($config_one_page_phone == '1') { echo $selected; } ?>><?php echo $text_yes; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <option value="1"><?php echo $text_yes; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_one_page_newsletter; ?></td>
            <td><select name="config_one_page_newsletter">
              <?php if (isset($config_one_page_newsletter)) { $selected = "selected"; ?>
                <option value="0" <?php if ($config_one_page_newsletter == '0') { echo $selected; } ?>><?php echo $text_no; ?></option>
                <option value="1" <?php if ($config_one_page_newsletter == '1') { echo $selected; } ?>><?php echo $text_yes; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <option value="1"><?php echo $text_yes; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_one_page_coupon; ?></td>
            <td><?php if ($config_one_page_coupon) { ?>
              <input type="radio" name="config_one_page_coupon" value="1" id="one-page-coupon-on" class="radio" checked />
              <label for="one-page-coupon-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_one_page_coupon" value="0" id="one-page-coupon-off" class="radio" />
              <label for="one-page-coupon-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_one_page_coupon" value="1" id="one-page-coupon-on" class="radio" />
              <label for="one-page-coupon-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_one_page_coupon" value="0" id="one-page-coupon-off" class="radio" checked />
              <label for="one-page-coupon-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_one_page_voucher; ?></td>
            <td><?php if ($config_one_page_voucher) { ?>
              <input type="radio" name="config_one_page_voucher" value="1" id="one-page-voucher-on" class="radio" checked />
              <label for="one-page-voucher-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_one_page_voucher" value="0" id="one-page-voucher-off" class="radio" />
              <label for="one-page-voucher-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_one_page_voucher" value="1" id="one-page-voucher-on" class="radio" />
              <label for="one-page-voucher-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_one_page_voucher" value="0" id="one-page-voucher-off" class="radio" checked />
              <label for="one-page-voucher-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_one_page_point; ?></td>
            <td><select name="config_one_page_point">
              <?php if (isset($config_one_page_point)) { $selected = "selected"; ?>
                <option value="0" <?php if ($config_one_page_point == '0') { echo $selected; } ?>><?php echo $text_no; ?></option>
                <option value="1" <?php if ($config_one_page_point == '1') { echo $selected; } ?>><?php echo $text_yes; ?></option>
                <option value="2" <?php if ($config_one_page_point == '2') { echo $selected; } ?>><?php echo $text_automatic; ?></option>
              <?php } else { ?>
                <option value="0"><?php echo $text_no; ?></option>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="2"><?php echo $text_automatic; ?></option>
              <?php } ?>
            </select></td>
          </tr>
        </table>
      </div>
      <div id="tab-option">
        <table class="form">
          <tr>
            <td><?php echo $entry_empty_category; ?><span class="help"><?php echo $help_empty_category; ?></span></td>
            <td><?php if ($config_empty_category) { ?>
              <input type="radio" name="config_empty_category" value="1" id="empty-category-on" class="radio" checked />
              <label for="empty-category-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_empty_category" value="0" id="empty-category-off" class="radio" />
              <label for="empty-category-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_empty_category" value="1" id="empty-category-on" class="radio" />
              <label for="empty-category-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_empty_category" value="0" id="empty-category-off" class="radio" checked />
              <label for="empty-category-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_product_count; ?><span class="help"><?php echo $help_product_count; ?></span></td>
            <td><?php if ($config_product_count) { ?>
              <input type="radio" name="config_product_count" value="1" id="product-count-on" class="radio" checked />
              <label for="product-count-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_product_count" value="0" id="product-count-off" class="radio" />
              <label for="product-count-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_product_count" value="1" id="product-count-on" class="radio" />
              <label for="product-count-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_product_count" value="0" id="product-count-off" class="radio" checked />
              <label for="product-count-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_download; ?></td>
            <td><?php if ($config_download) { ?>
              <input type="radio" name="config_download" value="1" id="download-on" class="radio" checked />
              <label for="download-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_download" value="0" id="download-off" class="radio" />
              <label for="download-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_download" value="1" id="download-on" class="radio" />
              <label for="download-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_download" value="0" id="download-off" class="radio" checked />
              <label for="download-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_review; ?><span class="help"><?php echo $help_review; ?></span></td>
            <td><?php if ($config_review_status) { ?>
              <input type="radio" name="config_review_status" value="1" id="review-status-on" class="radio" checked />
              <label for="review-status-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_review_status" value="0" id="review-status-off" class="radio" />
              <label for="review-status-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_review_status" value="1" id="review-status-on" class="radio" />
              <label for="review-status-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_review_status" value="0" id="review-status-off" class="radio" checked />
              <label for="review-status-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_review_login; ?><span class="help"><?php echo $help_review_login; ?></span></td>
            <td><?php if ($config_review_login) { ?>
              <input type="radio" name="config_review_login" value="1" id="review-login-on" class="radio" checked />
              <label for="review-login-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_review_login" value="0" id="review-login-off" class="radio" />
              <label for="review-login-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_review_login" value="1" id="review-login-on" class="radio" />
              <label for="review-login-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_review_login" value="0" id="review-login-off" class="radio" checked />
              <label for="review-login-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_tax; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_tax; ?></td>
            <td><?php if ($config_tax) { ?>
              <input type="radio" name="config_tax" value="1" id="tax-on" class="radio" checked />
              <label for="tax-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_tax" value="0" id="tax-off" class="radio" />
              <label for="tax-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_tax" value="1" id="tax-on" class="radio" />
              <label for="tax-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_tax" value="0" id="tax-off" class="radio" checked />
              <label for="tax-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_vat; ?><span class="help"><?php echo $help_vat; ?></span></td>
            <td><?php if ($config_vat) { ?>
              <input type="radio" name="config_vat" value="1" id="vat-on" class="radio" checked />
              <label for="vat-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_vat" value="0" id="vat-off" class="radio" />
              <label for="vat-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_vat" value="1" id="vat-on" class="radio" />
              <label for="vat-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_vat" value="0" id="vat-off" class="radio" checked />
              <label for="vat-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_tax_default; ?><span class="help"><?php echo $help_tax_default; ?></span></td>
            <td><select name="config_tax_default">
              <option value=""><?php echo $text_none; ?></option>
              <?php if ($config_tax_default == 'shipping') { ?>
                <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
              <?php } else { ?>
                <option value="shipping"><?php echo $text_shipping; ?></option>
              <?php } ?>
              <?php if ($config_tax_default == 'payment') { ?>
                <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
              <?php } else { ?>
                <option value="payment"><?php echo $text_payment; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_tax_customer; ?><span class="help"><?php echo $help_tax_customer; ?></span></td>
            <td><select name="config_tax_customer">
              <option value=""><?php echo $text_none; ?></option>
              <?php if ($config_tax_customer == 'shipping') { ?>
                <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
              <?php } else { ?>
                <option value="shipping"><?php echo $text_shipping; ?></option>
              <?php } ?>
              <?php if ($config_tax_customer == 'payment') { ?>
                <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
              <?php } else { ?>
                <option value="payment"><?php echo $text_payment; ?></option>
              <?php } ?>
            </select></td>
          </tr>
        </table>
        <h2><?php echo $text_stock; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_stock_display; ?><span class="help"><?php echo $help_stock_display; ?></span></td>
            <td><?php if ($config_stock_display) { ?>
              <input type="radio" name="config_stock_display" value="1" id="stock-display-on" class="radio" checked />
              <label for="stock-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_stock_display" value="0" id="stock-display-off" class="radio" />
              <label for="stock-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_stock_display" value="1" id="stock-display-on" class="radio" />
              <label for="stock-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_stock_display" value="0" id="stock-display-off" class="radio" checked />
              <label for="stock-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_stock_warning; ?><span class="help"><?php echo $help_stock_warning; ?></span></td>
            <td><?php if ($config_stock_warning) { ?>
              <input type="radio" name="config_stock_warning" value="1" id="stock-warning-on" class="radio" checked />
              <label for="stock-warning-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_stock_warning" value="0" id="stock-warning-off" class="radio" />
              <label for="stock-warning-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_stock_warning" value="1" id="stock-warning-on" class="radio" />
              <label for="stock-warning-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_stock_warning" value="0" id="stock-warning-off" class="radio" checked />
              <label for="stock-warning-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_stock_checkout; ?><span class="help"><?php echo $help_stock_checkout; ?></span></td>
            <td><?php if ($config_stock_checkout) { ?>
              <input type="radio" name="config_stock_checkout" value="1" id="stock-checkout-on" class="radio" checked />
              <label for="stock-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_stock_checkout" value="0" id="stock-checkout-off" class="radio" />
              <label for="stock-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_stock_checkout" value="1" id="stock-checkout-on" class="radio" />
              <label for="stock-checkout-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_stock_checkout" value="0" id="stock-checkout-off" class="radio" checked />
              <label for="stock-checkout-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_stock_status; ?><span class="help"><?php echo $help_stock_status; ?></span></td>
            <td><select name="config_stock_status_id">
              <?php foreach ($stock_statuses as $stock_status) { ?>
                <?php if ($stock_status['stock_status_id'] == $config_stock_status_id) { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
        </table>
        <h2><?php echo $text_supplier; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_supplier_group; ?><span class="help"><?php echo $help_supplier_group; ?></span></td>
            <td><select name="config_supplier_group_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($supplier_groups as $supplier_group) { ?>
                <?php if ($supplier_group['supplier_group_id'] == $config_supplier_group_id) { ?>
                  <option value="<?php echo $supplier_group['supplier_group_id']; ?>" selected="selected"><?php echo $supplier_group['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $supplier_group['supplier_group_id']; ?>"><?php echo $supplier_group['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
        </table>
        <h2><?php echo $text_account; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_customer_online; ?><span class="help"><?php echo $help_customer_online; ?></span></td>
            <td><?php if ($config_customer_online) { ?>
              <input type="radio" name="config_customer_online" value="1" id="customer-online-on" class="radio" checked />
              <label for="customer-online-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_online" value="0" id="customer-online-off" class="radio" />
              <label for="customer-online-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_customer_online" value="1" id="customer-online-on" class="radio" />
              <label for="customer-online-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_online" value="0" id="customer-online-off" class="radio" checked />
              <label for="customer-online-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_approval; ?></td>
            <td><?php echo $help_customer_approval; ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_group; ?><span class="help"><?php echo $help_customer_group; ?></span></td>
            <td><select name="config_customer_group_id">
            <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select> &nbsp; <a href="<?php echo $customer_approval; ?>" class="button"><i class="fa fa-group"></i></a></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_customer_group_display; ?><span class="help"><?php echo $help_customer_group_display; ?></span></td>
            <td><div class="scrollbox-store">
              <?php $class = 'odd'; ?>
              <?php foreach ($customer_groups as $customer_group) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                    <?php echo $customer_group['name']; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                    <?php echo $customer_group['name']; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>
            <?php if ($error_customer_group_display) { ?>
              <span class="error"><?php echo $error_customer_group_display; ?></span>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_price; ?><span class="help"><?php echo $help_customer_price; ?></span></td>
            <td><?php if ($config_customer_price) { ?>
              <input type="radio" name="config_customer_price" value="1" id="customer-price-on" class="radio" checked />
              <label for="customer-price-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_price" value="0" id="customer-price-off" class="radio" />
              <label for="customer-price-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_customer_price" value="1" id="customer-price-on" class="radio" />
              <label for="customer-price-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_price" value="0" id="customer-price-off" class="radio" checked />
              <label for="customer-price-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_redirect; ?><span class="help"><?php echo $help_customer_redirect; ?></span></td>
            <td><?php if ($config_customer_redirect) { ?>
              <input type="radio" name="config_customer_redirect" value="1" id="customer-redirect-on" class="radio" checked />
              <label for="customer-redirect-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_redirect" value="0" id="customer-redirect-off" class="radio" />
              <label for="customer-redirect-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_customer_redirect" value="1" id="customer-redirect-on" class="radio" />
              <label for="customer-redirect-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_redirect" value="0" id="customer-redirect-off" class="radio" checked />
              <label for="customer-redirect-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_fax; ?></td>
            <td><?php if ($config_customer_fax) { ?>
              <input type="radio" name="config_customer_fax" value="1" id="customer-fax-on" class="radio" checked />
              <label for="customer-fax-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_fax" value="0" id="customer-fax-off" class="radio" />
              <label for="customer-fax-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_customer_fax" value="1" id="customer-fax-on" class="radio" />
              <label for="customer-fax-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_fax" value="0" id="customer-fax-off" class="radio" checked />
              <label for="customer-fax-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_gender; ?></td>
            <td><?php if ($config_customer_gender) { ?>
              <input type="radio" name="config_customer_gender" value="1" id="customer-gender-on" class="radio" checked />
              <label for="customer-gender-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_gender" value="0" id="customer-gender-off" class="radio" />
              <label for="customer-gender-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_customer_gender" value="1" id="customer-gender-on" class="radio" />
              <label for="customer-gender-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_gender" value="0" id="customer-gender-off" class="radio" checked />
              <label for="customer-gender-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_customer_dob; ?><span class="help"><?php echo $help_customer_dob; ?></span></td>
            <td><?php if ($config_customer_dob) { ?>
              <input type="radio" name="config_customer_dob" value="1" id="customer-dob-on" class="radio" checked />
              <label for="customer-dob-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_dob" value="0" id="customer-dob-off" class="radio" />
              <label for="customer-dob-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_customer_dob" value="1" id="customer-dob-on" class="radio" />
              <label for="customer-dob-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_customer_dob" value="0" id="customer-dob-off" class="radio" checked />
              <label for="customer-dob-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_picklist_status; ?><span class="help"><?php echo $help_picklist_status; ?></span></td>
            <td><?php if ($config_picklist_status) { ?>
              <input type="radio" name="config_picklist_status" value="1" id="picklist-status-on" class="radio" checked />
              <label for="picklist-status-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_picklist_status" value="0" id="picklist-status-off" class="radio" />
              <label for="picklist-status-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_picklist_status" value="1" id="picklist-status-on" class="radio" />
              <label for="picklist-status-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_picklist_status" value="0" id="picklist-status-off" class="radio" checked />
              <label for="picklist-status-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_account_captcha; ?><span class="help"><?php echo $help_account_captcha; ?></span></td>
            <td><?php if ($config_account_captcha) { ?>
              <input type="radio" name="config_account_captcha" value="1" id="account-captcha-on" class="radio" checked />
              <label for="account-captcha-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_account_captcha" value="0" id="account-captcha-off" class="radio" />
              <label for="account-captcha-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_account_captcha" value="1" id="account-captcha-on" class="radio" />
              <label for="account-captcha-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_account_captcha" value="0" id="account-captcha-off" class="radio" checked />
              <label for="account-captcha-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_account; ?><span class="help"><?php echo $help_account; ?></span></td>
            <td><select name="config_account_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($informations as $information) { ?>
                <?php if ($information['information_id'] == $config_account_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_force_delete; ?><span class="help"><?php echo $help_force_delete; ?></span></td>
            <td><?php if ($config_force_delete) { ?>
              <input type="radio" name="config_force_delete" value="1" id="force-delete-on" class="radio" checked />
              <label for="force-delete-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_force_delete" value="0" id="force-delete-off" class="radio" />
              <label for="force-delete-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_force_delete" value="1" id="force-delete-on" class="radio" />
              <label for="force-delete-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_force_delete" value="0" id="force-delete-off" class="radio" checked />
              <label for="force-delete-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_affiliate; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_affiliate_approval; ?><span class="help"><?php echo $help_affiliate_approval; ?></span></td>
            <td><?php if ($config_affiliate_approval) { ?>
              <input type="radio" name="config_affiliate_approval" value="1" id="affiliate-approval-on" class="radio" checked />
              <label for="affiliate-approval-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_approval" value="0" id="affiliate-approval-off" class="radio" />
              <label for="affiliate-approval-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_affiliate_approval" value="1" id="affiliate-approval-on" class="radio" />
              <label for="affiliate-approval-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_approval" value="0" id="affiliate-approval-off" class="radio" checked />
              <label for="affiliate-approval-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_affiliate_auto; ?><span class="help"><?php echo $help_affiliate_auto; ?></span></td>
            <td><?php if ($config_affiliate_auto) { ?>
              <input type="radio" name="config_affiliate_auto" value="1" id="affiliate-auto-on" class="radio" checked />
              <label for="affiliate-auto-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_auto" value="0" id="affiliate-auto-off" class="radio" />
              <label for="affiliate-auto-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_affiliate_auto" value="1" id="affiliate-auto-on" class="radio" />
              <label for="affiliate-auto-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_auto" value="0" id="affiliate-auto-off" class="radio" checked />
              <label for="affiliate-auto-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_affiliate_commission; ?><span class="help"><?php echo $help_affiliate_commission; ?></span></td>
            <td><input type="text" name="config_affiliate_commission" value="<?php echo $config_affiliate_commission; ?>" size="3" /></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_login_attempts; ?><span class="help"><?php echo $help_login_attempts; ?></span></td>
            <td><input type="text" name="config_login_attempts" value="<?php echo $config_login_attempts; ?>" size="3" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_affiliate; ?><span class="help"><?php echo $help_affiliate; ?></span></td>
            <td><select name="config_affiliate_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($informations as $information) { ?>
                <?php if ($information['information_id'] == $config_affiliate_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_affiliate_mail; ?><span class="help"><?php echo $help_affiliate_mail; ?></span></td>
            <td><?php if ($config_affiliate_mail) { ?>
              <input type="radio" name="config_affiliate_mail" value="1" id="affiliate-mail-on" class="radio" checked />
              <label for="affiliate-mail-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_mail" value="0" id="affiliate-mail-off" class="radio" />
              <label for="affiliate-mail-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_affiliate_mail" value="1" id="affiliate-mail-on" class="radio" />
              <label for="affiliate-mail-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_mail" value="0" id="affiliate-mail-off" class="radio" checked />
              <label for="affiliate-mail-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_affiliate_fax; ?></td>
            <td><?php if ($config_affiliate_fax) { ?>
              <input type="radio" name="config_affiliate_fax" value="1" id="affiliate-fax-on" class="radio" checked />
              <label for="affiliate-fax-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_fax" value="0" id="affiliate-fax-off" class="radio" />
              <label for="affiliate-fax-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_affiliate_fax" value="1" id="affiliate-fax-on" class="radio" />
              <label for="affiliate-fax-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_fax" value="0" id="affiliate-fax-off" class="radio" checked />
              <label for="affiliate-fax-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_affiliate_activity; ?><span class="help"><?php echo $help_affiliate_activity; ?></span></td>
            <td><?php if ($config_affiliate_activity) { ?>
              <input type="radio" name="config_affiliate_activity" value="1" id="affiliate-activity-on" class="radio" checked />
              <label for="affiliate-activity-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_activity" value="0" id="affiliate-activity-off" class="radio" />
              <label for="affiliate-activity-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_affiliate_activity" value="1" id="affiliate-activity-on" class="radio" />
              <label for="affiliate-activity-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_activity" value="0" id="affiliate-activity-off" class="radio" checked />
              <label for="affiliate-activity-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_affiliate_disable; ?><span class="help"><?php echo $help_affiliate_disable; ?></span></td>
            <td><?php if ($config_affiliate_disable) { ?>
              <input type="radio" name="config_affiliate_disable" value="1" id="affiliate-disable-on" class="radio" checked />
              <label for="affiliate-disable-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_disable" value="0" id="affiliate-disable-off" class="radio" />
              <label for="affiliate-disable-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_affiliate_disable" value="1" id="affiliate-disable-on" class="radio" />
              <label for="affiliate-disable-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_affiliate_disable" value="0" id="affiliate-disable-off" class="radio" checked />
              <label for="affiliate-disable-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_return; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_return; ?><span class="help"><?php echo $help_return; ?></span></td>
            <td><select name="config_return_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($informations as $information) { ?>
                <?php if ($information['information_id'] == $config_return_id) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_return_status; ?><span class="help"><?php echo $help_return_status; ?></span></td>
            <td><select name="config_return_status_id">
              <?php foreach ($return_statuses as $return_status) { ?>
                <?php if ($return_status['return_status_id'] == $config_return_status_id) { ?>
                  <option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_return_disable; ?><span class="help"><?php echo $help_return_disable; ?></span></td>
            <td><?php if ($config_return_disable) { ?>
              <input type="radio" name="config_return_disable" value="1" id="return-disable-on" class="radio" checked />
              <label for="return-disable-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_return_disable" value="0" id="return-disable-off" class="radio" />
              <label for="return-disable-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_return_disable" value="1" id="return-disable-on" class="radio" />
              <label for="return-disable-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_return_disable" value="0" id="return-disable-off" class="radio" checked />
              <label for="return-disable-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_reward; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_reward_rate; ?><span class="help"><?php echo $help_reward_rate; ?></span></td>
            <td><?php if ($error_reward_rate) { ?>
              <input type="text" name="config_reward_rate" value="<?php echo $config_reward_rate; ?>" class="input-error" /> = 1.00
              <span class="error"><?php echo $error_reward_rate; ?></span>
            <?php } else { ?>
              <input type="text" name="config_reward_rate" value="<?php echo $config_reward_rate; ?>" /> = 1.00
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_reward_display; ?></td>
            <td><?php if ($config_reward_display) { ?>
              <input type="radio" name="config_reward_display" value="1" id="reward-display-on" class="radio" checked />
              <label for="reward-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_reward_display" value="0" id="reward-display-off" class="radio" />
              <label for="reward-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_reward_display" value="1" id="reward-display-on" class="radio" />
              <label for="reward-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_reward_display" value="0" id="reward-display-off" class="radio" checked />
              <label for="reward-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            </td>
          </tr>
        </table>
        <h2><?php echo $text_coupon ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_coupon_special; ?><span class="help"><?php echo $help_coupon_special; ?></span></td>
            <td><?php if ($config_coupon_special) { ?>
              <input type="radio" name="config_coupon_special" value="1" id="coupon-special-on" class="radio" checked />
              <label for="coupon-special-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_coupon_special" value="0" id="coupon-special-off" class="radio" />
              <label for="coupon-special-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_coupon_special" value="1" id="coupon-special-on" class="radio" />
              <label for="coupon-special-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_coupon_special" value="0" id="coupon-special-off" class="radio" checked />
              <label for="coupon-special-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            </td>
          </tr>
        </table>
        <h2><?php echo $text_voucher; ?></h2>
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_voucher_min; ?><span class="help"><?php echo $help_voucher_min; ?></span></td>
            <td><?php if ($error_voucher_min) { ?>
              <input type="text" name="config_voucher_min" value="<?php echo $config_voucher_min; ?>" class="input-error" />
              <span class="error"><?php echo $error_voucher_min; ?></span>
            <?php } else { ?>
              <input type="text" name="config_voucher_min" value="<?php echo $config_voucher_min; ?>" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_voucher_max; ?><span class="help"><?php echo $help_voucher_max; ?></span></td>
            <td><?php if ($error_voucher_max) { ?>
              <input type="text" name="config_voucher_max" value="<?php echo $config_voucher_max; ?>" class="input-error" />
              <span class="error"><?php echo $error_voucher_max; ?></span>
            <?php } else { ?>
              <input type="text" name="config_voucher_max" value="<?php echo $config_voucher_max; ?>" />
            <?php } ?></td>
          </tr>
        </table>
      </div>
      <div id="tab-preference">
        <table class="form">
          <tr class="highlighted">
            <td><?php echo $entry_admin_stylesheet; ?></td>
            <td><select name="config_admin_stylesheet">
              <?php foreach ($admin_stylesheets as $admin_stylesheet) { ?>
                <?php if ($config_admin_stylesheet == $admin_stylesheet['name']) { ?>
                  <option value="<?php echo $admin_stylesheet['name']; ?>" selected="selected"><?php echo ucfirst($admin_stylesheet['name']); ?></option>
                <?php } else { ?>
                  <option value="<?php echo $admin_stylesheet['name']; ?>"><?php echo ucfirst($admin_stylesheet['name']); ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_admin_width_limit; ?><span class="help"><?php echo $help_admin_width_limit; ?></span></td>
            <td><?php if ($config_admin_width_limit) { ?>
              <input type="radio" name="config_admin_width_limit" value="1" id="width-limit-on" class="radio" checked />
              <label for="width-limit-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_admin_width_limit" value="0" id="width-limit-off" class="radio" />
              <label for="width-limit-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_admin_width_limit" value="1" id="width-limit-on" class="radio" />
              <label for="width-limit-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_admin_width_limit" value="0" id="width-limit-off" class="radio" checked />
              <label for="width-limit-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_admin_menu_icons; ?></td>
            <td><?php if ($config_admin_menu_icons) { ?>
              <input type="radio" name="config_admin_menu_icons" value="1" id="menu-icons-on" class="radio" checked />
              <label for="menu-icons-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_admin_menu_icons" value="0" id="menu-icons-off" class="radio" />
              <label for="menu-icons-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_admin_menu_icons" value="1" id="menu-icons-on" class="radio" />
              <label for="menu-icons-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_admin_menu_icons" value="0" id="menu-icons-off" class="radio" checked />
              <label for="menu-icons-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_admin_limit; ?><span class="help"><?php echo $help_admin_limit; ?></span></td>
            <td><?php if ($error_admin_limit) { ?>
              <input type="text" name="config_admin_limit" value="<?php echo $config_admin_limit; ?>" size="3" class="input-error" />
              <span class="error"><?php echo $error_admin_limit; ?></span>
            <?php } else { ?>
              <input type="text" name="config_admin_limit" value="<?php echo $config_admin_limit; ?>" size="3" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_catalog_limit; ?><span class="help"><?php echo $help_catalog_limit; ?></span></td>
            <td><?php if ($error_catalog_limit) { ?>
              <input type="text" name="config_catalog_limit" value="<?php echo $config_catalog_limit; ?>" size="3" class="input-error" />
              <span class="error"><?php echo $error_catalog_limit; ?></span>
            <?php } else { ?>
              <input type="text" name="config_catalog_limit" value="<?php echo $config_catalog_limit; ?>" size="3" />
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_forms; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_pagination_hi; ?><span class="help"><?php echo $help_pagination_hi; ?></span></td>
            <td><?php if ($config_pagination_hi) { ?>
              <input type="radio" name="config_pagination_hi" value="1" id="pagination-hi-on" class="radio" checked />
              <label for="pagination-hi-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_pagination_hi" value="0" id="pagination-hi-off" class="radio" />
              <label for="pagination-hi-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_pagination_hi" value="1" id="pagination-hi-on" class="radio" />
              <label for="pagination-hi-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_pagination_hi" value="0" id="pagination-hi-off" class="radio" checked />
              <label for="pagination-hi-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            <?php if ($error_preference_pagination) { ?>
              <span class="error"><?php echo $error_preference_pagination; ?></span>
            <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_pagination_lo; ?><span class="help"><?php echo $help_pagination_lo; ?></span></td>
            <td><?php if ($config_pagination_lo) { ?>
              <input type="radio" name="config_pagination_lo" value="1" id="pagination-lo-on" class="radio" checked />
              <label for="pagination-lo-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_pagination_lo" value="0" id="pagination-lo-off" class="radio" />
              <label for="pagination-lo-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_pagination_lo" value="1" id="pagination-lo-on" class="radio" />
              <label for="pagination-lo-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_pagination_lo" value="0" id="pagination-lo-off" class="radio" checked />
              <label for="pagination-lo-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            <?php if ($error_preference_pagination) { ?>
              <span class="error"><?php echo $error_preference_pagination; ?></span>
            <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_autocomplete_category; ?><span class="help"><?php echo $help_autocomplete_category; ?></span></td>
            <td><?php if ($config_autocomplete_category) { ?>
              <input type="radio" name="config_autocomplete_category" value="1" id="autocomplete-category-on" class="radio" checked />
              <label for="autocomplete-category-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_autocomplete_category" value="0" id="autocomplete-category-off" class="radio" />
              <label for="autocomplete-category-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_autocomplete_category" value="1" id="autocomplete-category-on" class="radio" />
              <label for="autocomplete-category-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_autocomplete_category" value="0" id="autocomplete-category-off" class="radio" checked />
              <label for="autocomplete-category-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_autocomplete_product; ?><span class="help"><?php echo $help_autocomplete_product; ?></span></td>
            <td><?php if ($config_autocomplete_product) { ?>
              <input type="radio" name="config_autocomplete_product" value="1" id="autocomplete-product-on" class="radio" checked />
              <label for="autocomplete-product-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_autocomplete_product" value="0" id="autocomplete-product-off" class="radio" />
              <label for="autocomplete-product-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_autocomplete_product" value="1" id="autocomplete-product-on" class="radio" />
              <label for="autocomplete-product-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_autocomplete_product" value="0" id="autocomplete-product-off" class="radio" checked />
              <label for="autocomplete-product-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_autocomplete_offer; ?><span class="help"><?php echo $help_autocomplete_offer; ?></span></td>
            <td><?php if ($config_autocomplete_offer) { ?>
              <input type="radio" name="config_autocomplete_offer" value="1" id="autocomplete-offer-on" class="radio" checked />
              <label for="autocomplete-offer-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_autocomplete_offer" value="0" id="autocomplete-offer-off" class="radio" />
              <label for="autocomplete-offer-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_autocomplete_offer" value="1" id="autocomplete-offer-on" class="radio" />
              <label for="autocomplete-offer-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_autocomplete_offer" value="0" id="autocomplete-offer-off" class="radio" checked />
              <label for="autocomplete-offer-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_auto_seo_url; ?><span class="help"><?php echo $help_auto_seo_url; ?></span></td>
            <td><div class="scrollbox-store">
              <?php $class = 'odd'; ?>
              <?php foreach ($seo_url_pages as $seo_url_page) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($seo_url_page, $config_auto_seo_url)) { ?>
                    <input type="checkbox" name="config_auto_seo_url[]" value="<?php echo $seo_url_page; ?>" checked="checked" />
                    <?php echo $seo_url_page; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="config_auto_seo_url[]" value="<?php echo $seo_url_page; ?>" />
                    <?php echo $seo_url_page; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div></td>
          </tr>
          <tr>
            <td><?php echo $entry_user_group_display; ?><span class="help"><?php echo $help_user_group_display; ?></span></td>
            <td><div class="scrollbox-store">
              <?php $class = 'odd'; ?>
              <?php foreach ($user_groups as $user_group) { ?>
                <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($user_group['user_group_id'], $config_user_group_display)) { ?>
                    <input type="checkbox" name="config_user_group_display[]" value="<?php echo $user_group['user_group_id']; ?>" checked="checked" />
                    <?php echo $user_group['name']; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="config_user_group_display[]" value="<?php echo $user_group['user_group_id']; ?>" />
                    <?php echo $user_group['name']; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div></td>
          </tr>
        </table>
        <h2><?php echo $text_product; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_catalog_barcode; ?><span class="help"><?php echo $help_catalog_barcode; ?></span></td>
            <td><?php if ($config_catalog_barcode) { ?>
              <input type="radio" name="config_catalog_barcode" value="1" id="catalog-barcode-on" class="radio" checked />
              <label for="catalog-barcode-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_catalog_barcode" value="0" id="catalog-barcode-off" class="radio" />
              <label for="catalog-barcode-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_catalog_barcode" value="1" id="catalog-barcode-on" class="radio" />
              <label for="catalog-barcode-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_catalog_barcode" value="0" id="catalog-barcode-off" class="radio" checked />
              <label for="catalog-barcode-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_admin_barcode; ?><span class="help"><?php echo $help_admin_barcode; ?></span></td>
            <td><?php if ($config_admin_barcode) { ?>
              <input type="radio" name="config_admin_barcode" value="1" id="admin-barcode-on" class="radio" checked />
              <label for="admin-barcode-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_admin_barcode" value="0" id="admin-barcode-off" class="radio" />
              <label for="admin-barcode-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_admin_barcode" value="1" id="admin-barcode-on" class="radio" />
              <label for="admin-barcode-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_admin_barcode" value="0" id="admin-barcode-off" class="radio" checked />
              <label for="admin-barcode-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_barcode_type; ?></td>
            <td><select name="config_barcode_type">
              <?php foreach ($barcode_types as $barcode_type) { ?>
                <?php if ($config_barcode_type == $barcode_type['format']) { ?>
                  <option value="<?php echo $barcode_type['format']; ?>" selected="selected"><?php echo $barcode_type['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $barcode_type['format']; ?>"><?php echo $barcode_type['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_buy_now; ?><span class="help"><?php echo $help_buy_now; ?></span></td>
            <td><?php if ($config_buy_now) { ?>
              <input type="radio" name="config_buy_now" value="1" id="buy-now-on" class="radio" checked />
              <label for="buy-now-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_buy_now" value="0" id="buy-now-off" class="radio" />
              <label for="buy-now-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_buy_now" value="1" id="buy-now-on" class="radio" />
              <label for="buy-now-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_buy_now" value="0" id="buy-now-off" class="radio" checked />
              <label for="buy-now-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_lightbox; ?><span class="help"><?php echo $help_lightbox; ?></span></td>
            <td><select name="config_lightbox">
              <?php if (isset($config_lightbox)) { $selected = "selected"; ?>
                <option value="magnific" <?php if ($config_lightbox == 'magnific') { echo $selected; } ?>>Magnific <?php echo $text_default; ?></option>
                <option value="fancybox" <?php if ($config_lightbox == 'fancybox') { echo $selected; } ?>>Fancybox</option>
                <option value="colorbox" <?php if ($config_lightbox == 'colorbox') { echo $selected; } ?>>Colorbox</option>
                <option value="viewbox" <?php if ($config_lightbox == 'viewbox') { echo $selected; } ?>>Viewbox</option>
                <option value="zoomlens" <?php if ($config_lightbox == 'zoomlens') { echo $selected; } ?>>ZoomLens</option>
              <?php } else { ?>
                <option value="magnific">Magnific <?php echo $text_default; ?></option>
                <option value="fancybox">Fancybox</option>
                <option value="colorbox">Colorbox</option>
                <option value="viewbox">Viewbox</option>
                <option value="zoomlens">ZoomLens</option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_share_addthis; ?><span class="help"><?php echo $help_share_addthis; ?></span></td>
            <td><?php if ($config_share_addthis) { ?>
              <input type="radio" name="config_share_addthis" value="1" id="share-addthis-on" class="radio" checked />
              <label for="share-addthis-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_share_addthis" value="0" id="share-addthis-off" class="radio" />
              <label for="share-addthis-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_share_addthis" value="1" id="share-addthis-on" class="radio" />
              <label for="share-addthis-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_share_addthis" value="0" id="share-addthis-off" class="radio" checked />
              <label for="share-addthis-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_price_free; ?><span class="help"><?php echo $help_price_free; ?></span></td>
            <td><?php if ($config_price_free) { ?>
              <input type="radio" name="config_price_free" value="1" id="price-free-on" class="radio" checked />
              <label for="price-free-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_price_free" value="0" id="price-free-off" class="radio" />
              <label for="price-free-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_price_free" value="1" id="price-free-on" class="radio" />
              <label for="price-free-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_price_free" value="0" id="price-free-off" class="radio" checked />
              <label for="price-free-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_price_hide; ?><span class="help"><?php echo $help_price_hide; ?></span></td>
            <td><?php if ($config_price_hide) { ?>
              <input type="radio" name="config_price_hide" value="1" id="price-hide-on" class="radio" checked />
              <label for="price-hide-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_price_hide" value="0" id="price-hide-off" class="radio" />
              <label for="price-hide-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_price_hide" value="1" id="price-hide-on" class="radio" />
              <label for="price-hide-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_price_hide" value="0" id="price-hide-off" class="radio" checked />
              <label for="price-hide-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_captcha; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_captcha_font; ?><span class="help"><?php echo $help_captcha_font; ?></span></td>
            <td><select name="config_captcha_font">
            <?php foreach ($fontnames as $fontname) { ?>
              <?php if ($fontname == $config_captcha_font) { ?>
                <option value="<?php echo $fontname; ?>" selected="selected"><?php echo $fontname; ?></option>
              <?php } else { ?>
                <option value="<?php echo $fontname; ?>"><?php echo $fontname; ?></option>
              <?php } ?>
            <?php } ?>
            </select></td>
          </tr>
        </table>
        <h2><?php echo $text_cookies; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_cookie_consent; ?></td>
            <td><?php if ($config_cookie_consent) { ?>
              <input type="radio" name="config_cookie_consent" value="1" id="cookie-consent-on" class="radio" checked />
              <label for="cookie-consent-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_cookie_consent" value="0" id="cookie-consent-off" class="radio" />
              <label for="cookie-consent-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_cookie_consent" value="1" id="cookie-consent-on" class="radio" />
              <label for="cookie-consent-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_cookie_consent" value="0" id="cookie-consent-off" class="radio" checked />
              <label for="cookie-consent-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_cookie_theme; ?></td>
            <td><select name="config_cookie_theme">
              <?php if (isset($config_cookie_theme)) { $selected = "selected"; ?>
                <option value="dark" <?php if ($config_cookie_theme == 'dark') { echo $selected; } ?>><?php echo $text_black; ?> <?php echo $text_default; ?></option>
                <option value="light" <?php if ($config_cookie_theme == 'light') { echo $selected; } ?>><?php echo $text_white; ?></option>
              <?php } else { ?>
                <option value="dark"><?php echo $text_black; ?> <?php echo $text_default; ?></option>
                <option value="light"><?php echo $text_white; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_cookie_position; ?></td>
            <td><select name="config_cookie_position">
              <?php if (isset($config_cookie_position)) { $selected = "selected"; ?>
                <option value="top" <?php if ($config_cookie_position == 'top') { echo $selected; } ?>><?php echo $text_top; ?> <?php echo $text_default; ?></option>
                <option value="bottom" <?php if ($config_cookie_position == 'bottom') { echo $selected; } ?>><?php echo $text_bottom; ?></option>
              <?php } else { ?>
                <option value="top"><?php echo $text_top; ?> <?php echo $text_default; ?></option>
                <option value="bottom"><?php echo $text_bottom; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_cookie_privacy; ?><span class="help"><?php echo $help_cookie_privacy; ?></span></td>
            <td><select name="config_cookie_privacy">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($information_pages as $information) { ?>
                <?php if ($information['information_id'] == $config_cookie_privacy) { ?>
                  <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_cookie_age; ?><span class="help"><?php echo $help_cookie_age; ?></span></td>
            <td><input type="text" name="config_cookie_age" value="<?php echo $config_cookie_age; ?>" size="5" /></td>
          </tr>
        </table>
        <h2><?php echo $text_news; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_news_addthis; ?><span class="help"><?php echo $help_news_addthis; ?></span></td>
            <td><?php if ($config_news_addthis) { ?>
              <input type="radio" name="config_news_addthis" value="1" id="news-addthis-on" class="radio" checked />
              <label for="news-addthis-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_news_addthis" value="0" id="news-addthis-off" class="radio" />
              <label for="news-addthis-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_news_addthis" value="1" id="news-addthis-on" class="radio" />
              <label for="news-addthis-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_news_addthis" value="0" id="news-addthis-off" class="radio" checked />
              <label for="news-addthis-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_news_chars; ?><span class="help"><?php echo $help_news_chars; ?></span></td>
            <td><input type="text" name="config_news_chars" value="<?php echo $config_news_chars; ?>" size="5" /> <?php echo $text_characters; ?></td>
          </tr>
        </table>
        <h2><?php echo $text_notifications; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_notifications; ?></td>
            <td><?php if ($config_notifications) { ?>
              <input type="radio" name="config_notifications" value="1" id="notifications-on" class="radio" checked />
              <label for="notifications-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notifications" value="0" id="notifications-off" class="radio" />
              <label for="notifications-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notifications" value="1" id="notifications-on" class="radio" />
              <label for="notifications-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notifications" value="0" id="notifications-off" class="radio" checked />
              <label for="notifications-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_pending; ?></td>
            <td><?php if ($config_notification_pending) { ?>
              <input type="radio" name="config_notification_pending" value="1" id="notification-pending-on" class="radio" checked />
              <label for="notification-pending-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_pending" value="0" id="notification-pending-off" class="radio" />
              <label for="notification-pending-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_pending" value="1" id="notification-pending-on" class="radio" />
              <label for="notification-pending-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_pending" value="0" id="notification-pending-off" class="radio" checked />
              <label for="notification-pending-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_complete; ?></td>
            <td><?php if ($config_notification_complete) { ?>
              <input type="radio" name="config_notification_complete" value="1" id="notification-complete-on" class="radio" checked />
              <label for="notification-complete-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_complete" value="0" id="notification-complete-off" class="radio" />
              <label for="notification-complete-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_complete" value="1" id="notification-complete-on" class="radio" />
              <label for="notification-complete-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_complete" value="0" id="notification-complete-off" class="radio" checked />
              <label for="notification-complete-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_return; ?><span class="help"><?php echo $help_notification_return; ?></span></td>
            <td><?php if ($config_notification_return) { ?>
              <input type="radio" name="config_notification_return" value="1" id="notification-return-on" class="radio" checked />
              <label for="notification-return-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_return" value="0" id="notification-return-off" class="radio" />
              <label for="notification-return-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_return" value="1" id="notification-return-on" class="radio" />
              <label for="notification-return-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_return" value="0" id="notification-return-off" class="radio" checked />
              <label for="notification-return-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_online; ?><span class="help"><?php echo $help_notification_online; ?></span></td>
            <td><?php if ($config_notification_online) { ?>
              <input type="radio" name="config_notification_online" value="1" id="notification-online-on" class="radio" checked />
              <label for="notification-online-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_online" value="0" id="notification-online-off" class="radio" />
              <label for="notification-online-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_online" value="1" id="notification-online-on" class="radio" />
              <label for="notification-online-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_online" value="0" id="notification-online-off" class="radio" checked />
              <label for="notification-online-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_deleted; ?></td>
            <td><?php if ($config_notification_deleted) { ?>
              <input type="radio" name="config_notification_deleted" value="1" id="notification-deleted-on" class="radio" checked />
              <label for="notification-deleted-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_deleted" value="0" id="notification-deleted-off" class="radio" />
              <label for="notification-deleted-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_deleted" value="1" id="notification-deleted-on" class="radio" />
              <label for="notification-deleted-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_deleted" value="0" id="notification-deleted-off" class="radio" checked />
              <label for="notification-deleted-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_approval; ?></td>
            <td><?php if ($config_notification_approval) { ?>
              <input type="radio" name="config_notification_approval" value="1" id="notification-approval-on" class="radio" checked />
              <label for="notification-approval-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_approval" value="0" id="notification-approval-off" class="radio" />
              <label for="notification-approval-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_approval" value="1" id="notification-approval-on" class="radio" />
              <label for="notification-approval-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_approval" value="0" id="notification-approval-off" class="radio" checked />
              <label for="notification-approval-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_stock; ?></td>
            <td><?php if ($config_notification_stock) { ?>
              <input type="radio" name="config_notification_stock" value="1" id="notification-stock-on" class="radio" checked />
              <label for="notification-stock-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_stock" value="0" id="notification-stock-off" class="radio" />
              <label for="notification-stock-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_stock" value="1" id="notification-stock-on" class="radio" />
              <label for="notification-stock-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_stock" value="0" id="notification-stock-off" class="radio" checked />
              <label for="notification-stock-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_low; ?></td>
            <td><?php if ($config_notification_low) { ?>
              <input type="radio" name="config_notification_low" value="1" id="notification-low-on" class="radio" checked />
              <label for="notification-low-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_low" value="0" id="notification-low-off" class="radio" />
              <label for="notification-low-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_low" value="1" id="notification-low-on" class="radio" />
              <label for="notification-low-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_low" value="0" id="notification-low-off" class="radio" checked />
              <label for="notification-low-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_review; ?><span class="help"><?php echo $help_notification_review; ?></span></td>
            <td><?php if ($config_notification_review) { ?>
              <input type="radio" name="config_notification_review" value="1" id="notification-review-on" class="radio" checked />
              <label for="notification-review-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_review" value="0" id="notification-review-off" class="radio" />
              <label for="notification-review-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_review" value="1" id="notification-review-on" class="radio" />
              <label for="notification-review-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_review" value="0" id="notification-review-off" class="radio" checked />
              <label for="notification-review-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_affiliate; ?><span class="help"><?php echo $help_notification_affiliate; ?></span></td>
            <td><?php if ($config_notification_affiliate) { ?>
              <input type="radio" name="config_notification_affiliate" value="1" id="notification-affiliate-on" class="radio" checked />
              <label for="notification-affiliate-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_affiliate" value="0" id="notification-affiliate-off" class="radio" />
              <label for="notification-affiliate-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_affiliate" value="1" id="notification-affiliate-on" class="radio" />
              <label for="notification-affiliate-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_affiliate" value="0" id="notification-affiliate-off" class="radio" checked />
              <label for="notification-affiliate-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_notification_comment; ?><span class="help"><?php echo $help_notification_comment; ?></span></td>
            <td><?php if ($config_notification_comment) { ?>
              <input type="radio" name="config_notification_comment" value="1" id="notification-comment-on" class="radio" checked />
              <label for="notification-comment-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_comment" value="0" id="notification-comment-off" class="radio" />
              <label for="notification-comment-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_notification_comment" value="1" id="notification-comment-on" class="radio" />
              <label for="notification-comment-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_notification_comment" value="0" id="notification-comment-off" class="radio" checked />
              <label for="notification-comment-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
      </div>
      <div id="tab-image">
        <table class="form">
          <tr>
            <td><?php echo $entry_logo; ?></td>
            <td><div class="image"><img src="<?php echo $logo; ?>" alt="" id="thumb-logo" /><br />
              <input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="logo" />
              <a onclick="image_upload('logo', 'thumb-logo');" class="button-browse"></a><a onclick="$('#thumb-logo').attr('src', '<?php echo $no_image; ?>'); $('#logo').attr('value', '');" class="button-recycle"></a>
            </div></td>
          </tr>
          <tr>
            <td><?php echo $entry_icon; ?><span class="help"><?php echo $help_icon; ?></span></td>
            <td><div class="image"><img src="<?php echo $icon; ?>" alt="" id="thumb-icon" /><br />
              <input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="icon" />
              <a onclick="image_upload('icon', 'thumb-icon');" class="button-browse"></a><a onclick="$('#thumb-icon').attr('src', '<?php echo $no_image; ?>'); $('#icon').attr('value', '');" class="button-recycle"></a>
            </div></td>
          </tr>
        </table>
        <h2><?php echo $text_image_resize; ?></h2>
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_category; ?><span class="help"><?php echo $help_image_category; ?></span></td>
            <td><?php if ($error_image_category) { ?>
              <input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_category; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" size="3" /> x
              <input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_thumb; ?><span class="help"><?php echo $help_image_thumb; ?></span></td>
            <td><?php if ($error_image_thumb) { ?>
              <input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_thumb; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" size="3" /> x
              <input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_popup; ?><span class="help"><?php echo $help_image_popup; ?></span></td>
            <td><?php if ($error_image_popup) { ?>
              <input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_popup; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" size="3" /> x
              <input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_product; ?><span class="help"><?php echo $help_image_product; ?></span></td>
            <td><?php if ($error_image_product) { ?>
              <input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_product; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" size="3" /> x
              <input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_additional; ?><span class="help"><?php echo $help_image_additional; ?></span></td>
            <td><?php if ($error_image_additional) { ?>
              <input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_additional; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" size="3" /> x
              <input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_brand; ?><span class="help"><?php echo $help_image_brand; ?></span></td>
            <td><?php if ($error_image_brand) { ?>
              <input type="text" name="config_image_brand_width" value="<?php echo $config_image_brand_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_brand_height" value="<?php echo $config_image_brand_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_brand; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_brand_width" value="<?php echo $config_image_brand_width; ?>" size="3" /> x
              <input type="text" name="config_image_brand_height" value="<?php echo $config_image_brand_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_related; ?><span class="help"><?php echo $help_image_related; ?></span></td>
            <td><?php if ($error_image_related) { ?>
              <input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_related; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" size="3" /> x
              <input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_compare; ?><span class="help"><?php echo $help_image_compare; ?></span></td>
            <td><?php if ($error_image_compare) { ?>
              <input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_compare; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" size="3" /> x
              <input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_wishlist; ?><span class="help"><?php echo $help_image_wishlist; ?></span></td>
            <td><?php if ($error_image_wishlist) { ?>
              <input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_wishlist; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" size="3" /> x
              <input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_newsthumb; ?><span class="help"><?php echo $help_image_newsthumb; ?></span></td>
            <td><?php if ($error_image_newsthumb) { ?>
              <input type="text" name="config_image_newsthumb_width" value="<?php echo $config_image_newsthumb_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_newsthumb_height" value="<?php echo $config_image_newsthumb_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_newsthumb; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_newsthumb_width" value="<?php echo $config_image_newsthumb_width; ?>" size="3" /> x
              <input type="text" name="config_image_newsthumb_height" value="<?php echo $config_image_newsthumb_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_newspopup; ?><span class="help"><?php echo $help_image_newspopup; ?></span></td>
            <td><?php if ($error_image_newspopup) { ?>
              <input type="text" name="config_image_newspopup_width" value="<?php echo $config_image_newspopup_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_newspopup_height" value="<?php echo $config_image_newspopup_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_newspopup; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_newspopup_width" value="<?php echo $config_image_newspopup_width; ?>" size="3" /> x
              <input type="text" name="config_image_newspopup_height" value="<?php echo $config_image_newspopup_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_image_cart; ?><span class="help"><?php echo $help_image_cart; ?></span></td>
            <td><?php if ($error_image_cart) { ?>
              <input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" size="3" class="input-error" /> x
              <input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" size="3" class="input-error" /> px
              <span class="error"><?php echo $error_image_cart; ?></span>
            <?php } else { ?>
              <input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" size="3" /> x
              <input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" size="3" /> px
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_image_labels; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_label_size_ratio; ?><span class="help"><?php echo $help_label_size_ratio; ?></span></td>
            <td><select name="config_label_size_ratio">
              <?php foreach ($label_ratios as $label_ratio) { ?>
                <?php if ($config_label_size_ratio == $label_ratio['ratio']) { ?>
                  <option value="<?php echo $label_ratio['ratio']; ?>" selected="selected"><?php echo $label_ratio['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $label_ratio['ratio']; ?>"><?php echo $label_ratio['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_label_stock; ?><span class="help"><?php echo $help_label_stock; ?></span></td>
            <td><div class="image"><img src="<?php echo $label_stock; ?>" alt="" id="thumb-label-stock" /><br />
              <input type="hidden" name="config_label_stock" value="<?php echo $config_label_stock; ?>" id="label-stock" />
              <a onclick="image_upload('label-stock', 'thumb-label-stock');" class="button-browse"></a><a onclick="$('#thumb-label-stock').attr('src', '<?php echo $no_image; ?>'); $('#label-stock').attr('value', '');" class="button-recycle"></a>
            </div></td>
          </tr>
          <tr>
            <td><?php echo $entry_label_offer; ?><span class="help"><?php echo $help_label_offer; ?></span></td>
            <td><div class="image"><img src="<?php echo $label_offer; ?>" alt="" id="thumb-label-offer" /><br />
              <input type="hidden" name="config_label_offer" value="<?php echo $config_label_offer; ?>" id="label-offer" />
              <a onclick="image_upload('label-offer', 'thumb-label-offer');" class="button-browse"></a><a onclick="$('#thumb-label-offer').attr('src', '<?php echo $no_image; ?>'); $('#label-offer').attr('value', '');" class="button-recycle"></a>
            </div></td>
          </tr>
          <tr>
            <td><?php echo $entry_label_special; ?><span class="help"><?php echo $help_label_special; ?></span></td>
            <td><div class="image"><img src="<?php echo $label_special; ?>" alt="" id="thumb-label-special" /><br />
              <input type="hidden" name="config_label_special" value="<?php echo $config_label_special; ?>" id="label-special" />
              <a onclick="image_upload('label-special', 'thumb-label-special');" class="button-browse"></a><a onclick="$('#thumb-label-special').attr('src', '<?php echo $no_image; ?>'); $('#label-special').attr('value', '');" class="button-recycle"></a>
            </div></td>
          </tr>
        </table>
      </div>
      <div id="tab-ftp">
        <table class="form">
          <tr>
            <td><?php echo $entry_ftp_status; ?></td>
            <td><?php if ($config_ftp_status) { ?>
              <input type="radio" name="config_ftp_status" value="1" id="ftp-status-on" class="radio" checked />
              <label for="ftp-status-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_ftp_status" value="0" id="ftp-status-off" class="radio" />
              <label for="ftp-status-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_ftp_status" value="1" id="ftp-status-on" class="radio" />
              <label for="ftp-status-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_ftp_status" value="0" id="ftp-status-off" class="radio" checked />
              <label for="ftp-status-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_ftp_host; ?></td>
            <td><?php if ($error_ftp_host) { ?>
              <input type="text" name="config_ftp_host" value="<?php echo $config_ftp_host; ?>" size="30" class="input-error" />
              <span class="error"><?php echo $error_ftp_host; ?></span>
            <?php } else { ?>
              <input type="text" name="config_ftp_host" value="<?php echo $config_ftp_host; ?>" size="30" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_ftp_port; ?></td>
            <td><?php if ($error_ftp_port) { ?>
              <input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" class="input-error" />
              <span class="error"><?php echo $error_ftp_port; ?></span>
            <?php } else { ?>
              <input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_ftp_username; ?></td>
            <td><?php if ($error_ftp_username) { ?>
              <input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" size="30" class="input-error" />
              <span class="error"><?php echo $error_ftp_username; ?></span>
            <?php } else { ?>
              <input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" size="30" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_ftp_password; ?></td>
            <td><?php if ($error_ftp_password) { ?>
              <input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" class="input-error" />
              <span class="error"><?php echo $error_ftp_password; ?></span>
            <?php } else { ?>
              <input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_ftp_root; ?><span class="help"><?php echo $help_ftp_root; ?></span></td>
            <td><input type="text" name="config_ftp_root" value="<?php echo $config_ftp_root; ?>" /></td>
          </tr>
        </table>
      </div>
      <div id="tab-mail">
        <table class="form">
          <tbody>
          <tr>
            <td><?php echo $entry_mail_protocol; ?><span class="help"><?php echo $help_mail_protocol; ?></span></td>
            <td><select name="config_mail_protocol">
              <?php if ($config_mail_protocol == 'mail') { ?>
                <option value="mail" selected="selected"><?php echo $text_mail; ?></option>
              <?php } else { ?>
                <option value="mail"><?php echo $text_mail; ?></option>
              <?php } ?>
              <?php if ($config_mail_protocol == 'smtp') { ?>
                <option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
              <?php } else { ?>
                <option value="smtp"><?php echo $text_smtp; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          </tbody>
          <tbody id="protocol-mail" class="protocol">
          <tr>
            <td><?php echo $entry_mail_parameter; ?><span class="help"><?php echo $help_mail_parameter; ?></span></td>
            <td><input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" size="30" /></td>
          </tr>
          </tbody>
          <tbody id="protocol-smtp" class="protocol">
          <tr>
            <td><?php echo $entry_smtp_host; ?></td>
            <td><input type="text" name="config_smtp_host" value="<?php echo $config_smtp_host; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_smtp_username; ?></td>
            <td><input type="text" name="config_smtp_username" value="<?php echo $config_smtp_username; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_smtp_password; ?></td>
            <td><input type="text" name="config_smtp_password" value="<?php echo $config_smtp_password; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_smtp_port; ?></td>
            <td><input type="text" name="config_smtp_port" value="<?php echo $config_smtp_port; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_smtp_timeout; ?></td>
            <td><input type="text" name="config_smtp_timeout" value="<?php echo $config_smtp_timeout; ?>" /></td>
          </tr>
          </tbody>
          <tr>
            <td><?php echo $entry_alert_mail; ?><span class="help"><?php echo $help_alert_mail; ?></span></td>
            <td><?php if ($config_alert_mail) { ?>
              <input type="radio" name="config_alert_mail" value="1" id="alert-mail-on" class="radio" checked />
              <label for="alert-mail-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_alert_mail" value="0" id="alert-mail-off" class="radio" />
              <label for="alert-mail-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_alert_mail" value="1" id="alert-mail-on" class="radio" />
              <label for="alert-mail-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_alert_mail" value="0" id="alert-mail-off" class="radio" checked />
              <label for="alert-mail-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_account_mail; ?><span class="help"><?php echo $help_account_mail; ?></span></td>
            <td><?php if ($config_account_mail) { ?>
              <input type="radio" name="config_account_mail" value="1" id="account-mail-on" class="radio" checked />
              <label for="account-mail-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_account_mail" value="0" id="account-mail-off" class="radio" />
              <label for="account-mail-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_account_mail" value="1" id="account-mail-on" class="radio" />
              <label for="account-mail-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_account_mail" value="0" id="account-mail-off" class="radio" checked />
              <label for="account-mail-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_alert_emails; ?><span class="help"><?php echo $help_alert_emails; ?></span></td>
            <td><textarea name="config_alert_emails" cols="40" rows="5"><?php echo $config_alert_emails; ?></textarea></td>
          </tr>
        </table>
      </div>
      <div id="tab-media">
        <table class="form">
          <tr>
            <td><?php echo $entry_facebook; ?></td>
            <td><input name="config_facebook" type="text" size="60" value="<?php echo $config_facebook; ?>" /></td>
          <tr>
          <tr>
            <td><?php echo $entry_twitter; ?></td>
            <td><input name="config_twitter" type="text" size="60" value="<?php echo $config_twitter; ?>" /></td>
          <tr>
          <tr>
            <td><?php echo $entry_google; ?></td>
            <td><input name="config_google" type="text" size="60" value="<?php echo $config_google; ?>" /></td>
          <tr>
          <tr>
            <td><?php echo $entry_pinterest; ?></td>
            <td><input name="config_pinterest" type="text" size="60" value="<?php echo $config_pinterest; ?>" /></td>
          <tr>
          <tr>
            <td><?php echo $entry_instagram; ?></td>
            <td><input name="config_instagram" type="text" size="60" value="<?php echo $config_instagram; ?>" /></td>
          <tr>
          <tr>
            <td><?php echo $entry_skype; ?></td>
            <td><input name="config_skype" type="text" size="50" value="<?php echo $config_skype; ?>" /></td>
          <tr>
          <tr>
            <td><?php echo $entry_addthis; ?><span class="help"><?php echo $help_addthis; ?></span></td>
            <td>#pubid=<input name="config_addthis" type="text" size="30" value="<?php echo $config_addthis; ?>" /></td>
          <tr>
        </table>
        <h2><?php echo $text_verification; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_meta_google; ?><span class="help"><?php echo $help_meta_google; ?></span></td>
            <td><input type="text" name="config_meta_google" value="<?php echo $config_meta_google; ?>" size="50" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_meta_bing; ?><span class="help"><?php echo $help_meta_bing; ?></span></td>
            <td><input type="text" name="config_meta_bing" value="<?php echo $config_meta_bing; ?>" size="50" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_meta_yandex; ?><span class="help"><?php echo $help_meta_yandex; ?></span></td>
            <td><input type="text" name="config_meta_yandex" value="<?php echo $config_meta_yandex; ?>" size="50" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_meta_baidu; ?><span class="help"><?php echo $help_meta_baidu; ?></span></td>
            <td><input type="text" name="config_meta_baidu" value="<?php echo $config_meta_baidu; ?>" size="50" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_meta_alexa; ?><span class="help"><?php echo $help_meta_alexa; ?></span></td>
            <td><input type="text" name="config_meta_alexa" value="<?php echo $config_meta_alexa; ?>" size="50" /></td>
          </tr>
        </table>
        <h2><?php echo $text_analytic; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_google_analytics; ?><span class="help"><?php echo $help_google_analytics; ?></span></td>
            <td><textarea name="config_google_analytics" cols="50" rows="10"><?php echo $config_google_analytics; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_alexa_analytics; ?><span class="help"><?php echo $help_alexa_analytics; ?></span></td>
            <td><textarea name="config_alexa_analytics" cols="50" rows="10"><?php echo $config_alexa_analytics; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_matomo_analytics; ?><span class="help"><?php echo $help_matomo_analytics; ?></span></td>
            <td><textarea name="config_matomo_analytics" cols="50" rows="10"><?php echo $config_matomo_analytics; ?></textarea></td>
          </tr>
        </table>
        <div>
          <table width="100%">
            <tr>
              <td>
                <a onclick="window.open('<?php echo $google_web; ?>');" title="Google Webmaster Tools"><img src="view/image/engines/google-web.gif" alt="Google" /></a> &nbsp;
                <a onclick="window.open('<?php echo $bing_web; ?>');" title="Bing Webmaster Tools"><img src="view/image/engines/bing-web.gif" alt="Bing" /></a> &nbsp;
                <a onclick="window.open('<?php echo $yandex_web; ?>');" title="Yandex Webmaster Tools"><img src="view/image/engines/yandex-web.gif" alt="Yandex" /></a> &nbsp;
                <a onclick="window.open('<?php echo $baidu_web; ?>');" title="Baidu Webmaster Tools"><img src="view/image/engines/baidu-web.gif" alt="Baidu" /></a> &nbsp;
                <a onclick="window.open('<?php echo $alexa_web; ?>');" title="Alexa Analytics"><img src="view/image/engines/alexa-web.gif" alt="Alexa" /></a> &nbsp;
                <a onclick="window.open('<?php echo $matomo_web; ?>');" title="Matomo Analytics"><img src="view/image/engines/matomo-web.gif" alt="Matomo" /></a> &nbsp;
              </td>
            </tr>
          </table>
        </div>
        <div class="tooltip" style="margin:10px 5px 10px 3px;"><?php echo $info_meta_name; ?></div>
      </div>
      <div id="tab-server">
        <table class="form">
          <tr>
            <td><?php echo $entry_maintenance; ?><span class="help"><?php echo $help_maintenance; ?></span></td>
            <td><?php if ($config_maintenance) { ?>
              <input type="radio" name="config_maintenance" value="1" id="maintenance-on" class="radio" checked />
              <label for="maintenance-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_maintenance" value="0" id="maintenance-off" class="radio" />
              <label for="maintenance-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_maintenance" value="1" id="maintenance-on" class="radio" />
              <label for="maintenance-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_maintenance" value="0" id="maintenance-off" class="radio" checked />
              <label for="maintenance-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_seo_url; ?><span class="help"><?php echo $help_seo_url; ?></span></td>
            <td><?php if ($config_seo_url) { ?>
              <input type="radio" name="config_seo_url" value="1" id="seo-url-on" class="radio" checked />
              <label for="seo-url-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_seo_url" value="0" id="seo-url-off" class="radio" />
              <label for="seo-url-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_seo_url" value="1" id="seo-url-on" class="radio" />
              <label for="seo-url-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_seo_url" value="0" id="seo-url-off" class="radio" checked />
              <label for="seo-url-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_seo_url_cache; ?><span class="help"><?php echo $help_seo_url_cache; ?></span></td>
            <td><?php if ($config_seo_url_cache) { ?>
              <input type="radio" name="config_seo_url_cache" value="1" id="seo-cache-on" class="radio" checked />
              <label for="seo-cache-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_seo_url_cache" value="0" id="seo-cache-off" class="radio" />
              <label for="seo-cache-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_seo_url_cache" value="1" id="seo-cache-on" class="radio" />
              <label for="seo-cache-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_seo_url_cache" value="0" id="seo-cache-off" class="radio" checked />
              <label for="seo-cache-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_encryption; ?><span class="help"><?php echo $help_encryption; ?></span></td>
            <td><?php if ($error_encryption) { ?>
              <input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" size="42" class="input-error" />
              <span class="error"><?php echo $error_encryption; ?></span>
            <?php } else { ?>
              <input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" size="42" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_compression; ?><span class="help"><?php echo $help_compression; ?></span></td>
            <td><input type="text" name="config_compression" value="<?php echo $config_compression; ?>" size="3" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_error_display; ?></td>
            <td><?php if ($config_error_display) { ?>
              <input type="radio" name="config_error_display" value="1" id="error-display-on" class="radio" checked />
              <label for="error-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_error_display" value="0" id="error-display-off" class="radio" />
              <label for="error-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_error_display" value="1" id="error-display-on" class="radio" />
              <label for="error-display-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_error_display" value="0" id="error-display-off" class="radio" checked />
              <label for="error-display-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_error_log; ?></td>
            <td><?php if ($config_error_log) { ?>
              <input type="radio" name="config_error_log" value="1" id="error-log-on" class="radio" checked />
              <label for="error-log-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_error_log" value="0" id="error-log-off" class="radio" />
              <label for="error-log-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_error_log" value="1" id="error-log-on" class="radio" />
              <label for="error-log-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_error_log" value="0" id="error-log-off" class="radio" checked />
              <label for="error-log-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_error_filename; ?></td>
            <td><?php if ($error_error_filename) { ?>
              <input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" class="input-error" />
              <span class="error"><?php echo $error_error_filename; ?></span>
            <?php } else { ?>
              <input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_mail_filename; ?></td>
            <td><?php if ($error_mail_filename) { ?>
              <input type="text" name="config_mail_filename" value="<?php echo $config_mail_filename; ?>" class="input-error" />
              <span class="error"><?php echo $error_mail_filename; ?></span>
            <?php } else { ?>
              <input type="text" name="config_mail_filename" value="<?php echo $config_mail_filename; ?>" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo $entry_quote_filename; ?></td>
            <td><?php if ($error_quote_filename) { ?>
              <input type="text" name="config_quote_filename" value="<?php echo $config_quote_filename; ?>" class="input-error" />
              <span class="error"><?php echo $error_quote_filename; ?></span>
            <?php } else { ?>
              <input type="text" name="config_quote_filename" value="<?php echo $config_quote_filename; ?>" />
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_security; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_secure; ?><span class="help"><?php echo $help_secure; ?></span></td>
            <td><?php if ($config_secure) { ?>
              <input type="radio" name="config_secure" value="1" id="secure-on" class="radio" checked />
              <label for="secure-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_secure" value="0" id="secure-off" class="radio" />
              <label for="secure-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_secure" value="1" id="secure-on" class="radio" />
              <label for="secure-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_secure" value="0" id="secure-off" class="radio" checked />
              <label for="secure-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_shared; ?><span class="help"><?php echo $help_shared; ?></span></td>
            <td><?php if ($config_shared) { ?>
              <input type="radio" name="config_shared" value="1" id="shared-on" class="radio" checked />
              <label for="shared-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_shared" value="0" id="shared-off" class="radio" />
              <label for="shared-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_shared" value="1" id="shared-on" class="radio" />
              <label for="shared-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_shared" value="0" id="shared-off" class="radio" checked />
              <label for="shared-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_robots; ?><span class="help"><?php echo $help_robots; ?></span></td>
            <td><textarea name="config_robots" cols="40" rows="8"><?php echo $config_robots; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_robots_online; ?><span class="help"><?php echo $help_robots_online; ?></span></td>
            <td><?php if ($config_robots_online) { ?>
              <input type="radio" name="config_robots_online" value="1" id="robots-online-on" class="radio" checked />
              <label for="robots-online-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_robots_online" value="0" id="robots-online-off" class="radio" />
              <label for="robots-online-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_robots_online" value="1" id="robots-online-on" class="radio" />
              <label for="robots-online-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_robots_online" value="0" id="robots-online-off" class="radio" checked />
              <label for="robots-online-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_password; ?><span class="help"><?php echo $help_password; ?></span></td>
            <td><?php if ($config_password) { ?>
              <input type="radio" name="config_password" value="1" id="password-on" class="radio" checked />
              <label for="password-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_password" value="0" id="password-off" class="radio" />
              <label for="password-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_password" value="1" id="password-on" class="radio" />
              <label for="password-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_password" value="0" id="password-off" class="radio" checked />
              <label for="password-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_ban_page; ?><span class="help"><?php echo $help_ban_page; ?></span></td>
            <td><select name="config_ban_page">
              <?php if (isset($config_ban_page)) { $selected = "selected"; ?>
                <option value="search" <?php if ($config_ban_page == 'search') { echo $selected; } ?>><?php echo $text_search_page; ?></option>
                <option value="block" <?php if ($config_ban_page == 'block') { echo $selected; } ?>><?php echo $text_block_page; ?></option>
              <?php } else { ?>
                <option value="search"><?php echo $text_search_page; ?></option>
                <option value="block"><?php echo $text_block_page; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_sitemap_links; ?><span class="help"><?php echo $help_sitemap_links; ?></span></td>
            <td><?php if ($config_sitemap_links) { ?>
              <input type="radio" name="config_sitemap_links" value="1" id="sitemap-links-on" class="radio" checked />
              <label for="sitemap-links-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_sitemap_links" value="0" id="sitemap-links-off" class="radio" />
              <label for="sitemap-links-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="config_sitemap_links" value="1" id="sitemap-links-on" class="radio" />
              <label for="sitemap-links-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="config_sitemap_links" value="0" id="sitemap-links-off" class="radio" checked />
              <label for="sitemap-links-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </table>
        <h2><?php echo $text_upload; ?></h2>
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_file_max_size; ?><span class="help"><?php echo $help_file_max_size; ?></span></td>
            <td><?php if ($error_file_max_size) { ?>
              <input type="text" name="config_file_max_size" value="<?php echo $config_file_max_size; ?>" class="input-error" /> bytes
              <span class="error"><?php echo $error_file_max_size; ?></span>
            <?php } else { ?>
              <input type="text" name="config_file_max_size" value="<?php echo $config_file_max_size; ?>" /> bytes
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_file_extension_allowed; ?><span class="help"><?php echo $help_file_extension_allowed; ?></span></td>
            <td><textarea name="config_file_extension_allowed" cols="40" rows="8"><?php echo $config_file_extension_allowed; ?></textarea></td>
          </tr>
          <tr>
            <td><?php echo $entry_file_mime_allowed; ?><span class="help"><?php echo $help_file_mime_allowed; ?></span></td>
            <td><textarea name="config_file_mime_allowed" cols="50" rows="8"><?php echo $config_file_mime_allowed; ?></textarea></td>
          </tr>
        </table>
      </div>
    </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#meta-description').on('load propertychange keyup input paste', function() {
		var limit = $(this).data("limit");
		var remain = limit - $(this).val().length;
		if (remain <= 0) {
			$(this).val($(this).val().substring(0, limit));
		}
		$('#remaining').text((remain <= 0) ? 0 : remain);
	});

	$('#meta-description').trigger('load');
});
//--></script>

<script type="text/javascript"><!--
$('select[name=\'config_country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}

			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'config_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_country_id\']').trigger('change');
//--></script>

<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();

	$('#content').prepend('<div id="dialog" style="padding:3px 0 0 0;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin:0; display:block; width:100%; height:100%;" frameborder="no" scrolling="auto"></iframe></div>');

	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function(event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},
		bgiframe: false,
		width: <?php echo ($this->browser->checkMobile()) ? 580 : 760; ?>,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script>

<script type="text/javascript"><!--
$('select[name=\'config_mail_protocol\']').on('change', function() {
	$('.protocol').hide();
	$('#protocol-' + this.value).show();
});

$('select[name=\'config_mail_protocol\']').trigger('change');
//--></script>

<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>

<?php echo $footer; ?>