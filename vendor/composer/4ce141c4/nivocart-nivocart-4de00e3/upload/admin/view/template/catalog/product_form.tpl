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
      <h1><img src="view/image/product.png" alt="" /> <?php echo $product_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button-save ripple"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save ripple"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
    <div id="tabs" class="htabs">
      <a href="#tab-general"><?php echo $tab_general; ?></a>
      <a href="#tab-data"><?php echo $tab_data; ?></a>
      <a href="#tab-links"><?php echo $tab_links; ?></a>
      <?php if ($palettes) { ?>
      <a href="#tab-colors"><?php echo $tab_colors; ?></a>
      <?php } ?>
      <?php if ($fields) { ?>
      <a href="#tab-fields"><?php echo $tab_fields; ?></a>
      <?php } ?>
      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
      <a href="#tab-option"><?php echo $tab_option; ?></a>
      <?php if ($profiles) { ?>
      <a href="#tab-profile"><?php echo $tab_profile; ?></a>
      <?php } ?>
      <a href="#tab-discount"><?php echo $tab_discount; ?></a>
      <a href="#tab-special"><?php echo $tab_special; ?></a>
      <a href="#tab-reward"><?php echo $tab_reward; ?></a>
      <a href="#tab-image"><?php echo $tab_image; ?></a>
      <a href="#tab-design"><?php echo $tab_design; ?></a>
    </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <div id="tab-general">
        <div id="languages" class="htabs">
          <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" alt="" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
          <?php } ?>
        </div>
        <?php foreach ($languages as $language) { ?>
        <div id="language<?php echo $language['language_id']; ?>">
          <table class="form">
            <tr>
              <td><span class="required">*</span> <?php echo $entry_name; ?></td>
              <td><?php if (isset($error_name[$language['language_id']])) { ?>
                <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" size="40" class="input-error" />
                <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
              <?php } else { ?>
                <input type="text" name="product_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['name'] : ''; ?>" size="40" />
              <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_meta_description; ?></td>
              <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_description]" id="meta-description<?php echo $language['language_id']; ?>" data-limit="156" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
              <span id="remaining<?php echo $language['language_id']; ?>"></span></td>
            </tr>
            <tr>
              <td><?php echo $entry_meta_keyword; ?></td>
              <td><textarea name="product_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_description; ?></td>
              <td><textarea name="product_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['description'] : ''; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_tag; ?></td>
              <td><input type="text" name="product_description[<?php echo $language['language_id']; ?>][tag]" value="<?php echo isset($product_description[$language['language_id']]) ? $product_description[$language['language_id']]['tag'] : ''; ?>" size="60" /></td>
            </tr>
          </table>
        </div>
        <?php } ?>
      </div>
      <div id="tab-data">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_model; ?></td>
            <td><?php if ($error_model) { ?>
              <input type="text" name="model" value="<?php echo $model; ?>" size="30" class="input-error" />
              <span class="error"><?php echo $error_model; ?></span>
            <?php } else { ?>
              <span><?php echo $barcode; ?></span><br />
              <input type="text" name="model" value="<?php echo $model; ?>" size="30" />
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_image; ?></td>
            <td><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
              <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
              <a onclick="image_upload('image', 'thumb');" class="button-browse"></a><a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');" class="button-recycle"></a>
            </div>
            <?php if ($error_image) { ?>
              <span class="error"><?php echo $error_image; ?></span>
            <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_label; ?></td>
            <td><div class="image"><img src="<?php echo $thumb_label; ?>" alt="" id="thumb-label" /><br />
              <input type="hidden" name="label" value="<?php echo $label; ?>" id="label" />
              <a onclick="image_upload('label', 'thumb-label');" class="button-browse"></a><a onclick="$('#thumb-label').attr('src', '<?php echo $no_image; ?>'); $('#label').attr('value', '');" class="button-recycle"></a>
            </div>
            <?php if ($error_label) { ?>
              <span class="error"><?php echo $error_label; ?></span>
            <?php } ?>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_video_code; ?></td>
            <td>youtube.com/watch?v=<input type="text" name="video_code" value="<?php echo $video_code; ?>" size="25" /> &nbsp; <a onclick="window.open('https://www.youtube.com/');" title="YouTube" class="button-form"><i class="fa fa-youtube"></i> &nbsp; YouTube</a></td>
          </tr>
          <tr>
            <td><?php echo $entry_keyword; ?></td>
            <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" size="30" /></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_local_tax_rate; ?></td>
            <td><select name="tax_local_rate_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($tax_local_rates as $tax_local_rate) { ?>
                <?php if ($tax_local_rate['tax_local_rate_id'] == $tax_local_rate_id) { ?>
                  <option value="<?php echo $tax_local_rate['tax_local_rate_id']; ?>" selected="selected"><?php echo $tax_local_rate['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $tax_local_rate['tax_local_rate_id']; ?>"><?php echo $tax_local_rate['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_tax_local_rate; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_price; ?></td>
            <td>
              <input type="text" name="price" class="excvat" value="<?php echo number_format($price, 2, '.', ''); ?>" /> &nbsp; <?php echo $text_exc_vat; ?> &nbsp; <a onclick="apply();" id="price-apply" class="button-save"><i class="fa fa-refresh"></i></a>
              <br /><br />
              <input type="text" name="incvat" class="incvat" value="<?php echo number_format(($price * $vat_rate), 2, '.', ''); ?>" /> &nbsp; <?php echo $text_inc_vat; ?> (<?php echo round($base_rate, 2); ?>%)
            </td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_cost; ?></td>
            <td><input type="text" name="cost" value="<?php echo $cost; ?>" /></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_tax_class; ?></td>
            <td><select name="tax_class_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($tax_classes as $tax_class) { ?>
                <?php if ($tax_class['tax_class_id'] == $tax_class_id) { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_tax_class; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_quote; ?></td>
            <td><select name="quote">
              <?php if ($quote) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_age_minimum; ?></td>
            <td><input type="text" name="age_minimum" value="<?php echo $age_minimum; ?>" size="2" maxlength="2" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_date_available; ?></td>
            <td><input type="text" name="date_available" value="<?php echo $date_available; ?>" class="date" size="12" />
            <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
          </tr>
          <tr>
            <td><?php echo $entry_sort_order; ?></td>
            <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="2" /></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_status; ?></td>
            <td><select name="status">
              <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
          </tr>
        </table>
        <h2><?php echo $heading_inventory; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_quantity; ?></td>
            <td><input type="text" name="quantity" value="<?php echo $quantity; ?>" size="8" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_minimum; ?></td>
            <td><input type="text" name="minimum" value="<?php echo $minimum; ?>" size="2" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_subtract; ?></td>
            <td><select name="subtract">
              <?php if ($subtract) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
              <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_stock_status; ?></td>
            <td><select name="stock_status_id">
              <?php foreach ($stock_statuses as $stock_status) { ?>
                <?php if ($stock_status['stock_status_id'] == $stock_status_id) { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_shipping; ?></td>
            <td><?php if ($shipping) { ?>
              <input type="radio" name="shipping" value="1" id="shipping-on" class="radio" checked />
              <label for="shipping-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="shipping" value="0" id="shipping-off" class="radio" />
              <label for="shipping-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="shipping" value="1" id="shipping-on" class="radio" />
              <label for="shipping-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="shipping" value="0" id="shipping-off" class="radio" checked />
              <label for="shipping-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_store_location; ?></td>
            <td><div id="location_ids" class="scrollbox-store">
              <?php $class='even'; ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array(0, $product_location)) { ?>
                  <input type="checkbox" name="product_location[]" value="0" checked="checked" />
                  <?php echo $text_default; ?>
                <?php } else { ?>
                  <input type="checkbox" name="product_location[]" value="0" />
                  <?php echo $text_default; ?>
                <?php } ?>
              </div>
              <?php foreach ($store_locations as $store_location) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($store_location['location_id'], $product_location)) { ?>
                    <input type="checkbox" name="product_location[]" value="<?php echo $store_location['location_id']; ?>" checked="checked" />
                    <?php echo $store_location['name']; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="product_location[]" value="<?php echo $store_location['location_id']; ?>" />
                    <?php echo $store_location['name']; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>
            <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="button-select"></a><a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="button-unselect"></a>
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_sku; ?></td>
            <td><input type="text" name="sku" value="<?php echo $sku; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_upc; ?></td>
            <td><input type="text" name="upc" value="<?php echo $upc; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_ean; ?></td>
            <td><input type="text" name="ean" value="<?php echo $ean; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_jan; ?></td>
            <td><input type="text" name="jan" value="<?php echo $jan; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_isbn; ?></td>
            <td><input type="text" name="isbn" value="<?php echo $isbn; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_mpn; ?></td>
            <td><input type="text" name="mpn" value="<?php echo $mpn; ?>" size="30" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_location; ?></td>
            <td><input type="text" name="location" value="<?php echo $location; ?>" size="30" /></td>
          </tr>
        </table>
        <h2><?php echo $heading_dimension; ?></h2>
        <table class="form">
          <tr>
            <td><?php echo $entry_dimension; ?></td>
            <td>
              <input type="text" name="length" value="<?php echo $length; ?>" size="10" /> x 
              <input type="text" name="width" value="<?php echo $width; ?>" size="10" /> x 
              <input type="text" name="height" value="<?php echo $height; ?>" size="10" />
            </td>
          </tr>
          <tr>
            <td><?php echo $entry_length; ?></td>
            <td><select name="length_class_id">
              <?php foreach ($length_classes as $length_class) { ?>
                <?php if ($length_class['length_class_id'] == $length_class_id) { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_length_class; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td><?php echo $entry_weight; ?></td>
            <td><input type="text" name="weight" value="<?php echo $weight; ?>" /></td>
          </tr>
          <tr>
            <td><?php echo $entry_weight_class; ?></td>
            <td><select name="weight_class_id">
              <?php foreach ($weight_classes as $weight_class) { ?>
                <?php if ($weight_class['weight_class_id'] == $weight_class_id) { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_weight_class; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
        </table>
      </div>
      <div id="tab-links">
        <table class="form">
        <?php if ($autocomplete_off) { ?>
          <tr>
            <td><?php echo $entry_manufacturer; ?></td>
            <td><select name="manufacturer_id">
              <option value="0" selected="selected"><?php echo $text_none; ?></option>
              <?php foreach ($manufacturers as $manufacturer) { ?>
                <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
                  <option value="<?php echo $manufacturer['manufacturer_id']; ?>" selected="selected"><?php echo $manufacturer['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select> &nbsp; <a href="<?php echo $configure_manufacturer; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
        <?php } else { ?>
          <tr>
            <td><?php echo $entry_manufacturer; ?><?php echo $text_autocomplete; ?></td>
            <td><input type="text" name="manufacturer" value="<?php echo $manufacturer; ?>" />
              <input type="hidden" name="manufacturer_id" value="<?php echo $manufacturer_id; ?>" />
              &nbsp; <a href="<?php echo $configure_manufacturer; ?>" class="button-form ripple" style="vertical-align:bottom;"><i class="fa fa-gear"></i></a>
            </td>
          </tr>
        <?php } ?>
          <tr>
            <td><?php echo $entry_store; ?></td>
            <td><div id="store_ids" class="scrollbox-store">
              <?php $class='even'; ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array(0, $product_store)) { ?>
                  <input type="checkbox" name="product_store[]" value="0" checked="checked" />
                  <?php echo $text_default; ?>
                <?php } else { ?>
                  <input type="checkbox" name="product_store[]" value="0" />
                  <?php echo $text_default; ?>
                <?php } ?>
              </div>
              <?php foreach ($stores as $store) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php if (in_array($store['store_id'], $product_store)) { ?>
                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="product_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>
            <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="button-select"></a><a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="button-unselect"></a>
            </td>
          </tr>
        <?php if ($autocomplete_off) { ?>
          <tr>
            <td><?php echo $entry_category; ?></td>
            <td><a href="<?php echo $configure_category; ?>" class="button-form"><i class="fa fa-gear"></i></a>
            <div class="scrollbox" style="width:500px; height:293px; margin:5px 0;">
              <?php $class='odd'; ?>
              <?php foreach ($categories as $category) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php $product_category_id = array(); ?>
                  <?php foreach ($product_categories as $product_category) { $product_category_id[] = $product_category['category_id']; } ?>
                  <?php if (in_array($category['category_id'], $product_category_id)) { ?>
                    <input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                    <?php echo $category['name']; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" />
                    <?php echo $category['name']; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>
            <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="button-select"></a><a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="button-unselect"></a>
            </td>
          </tr>
        <?php } else { ?>
          <tr>
            <td><?php echo $entry_category; ?><?php echo $text_autocomplete; ?></td>
            <td><input type="text" name="category" value="" /> &nbsp; <a href="<?php echo $configure_category; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="product-category" class="scrollbox">
              <?php $class='odd'; ?>
              <?php foreach ($product_categories as $product_category) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div id="product-category<?php echo $product_category['category_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_category['name']; ?><img src="view/image/delete.png" alt="" />
                  <input type="hidden" name="product_category[]" value="<?php echo $product_category['category_id']; ?>" />
                </div>
              <?php } ?>
            </div></td>
          </tr>
        <?php } ?>
        <?php if ($autocomplete_off) { ?>
          <tr>
            <td><?php echo $entry_filter; ?></td>
            <td><a href="<?php echo $configure_filter; ?>" class="button-form"><i class="fa fa-gear"></i></a>
            <div class="scrollbox" style="width:350px; height:155px; margin:5px 0;">
              <?php $class='odd'; ?>
              <?php foreach ($filters as $filter) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php $product_filter_id = array(); ?>
                  <?php foreach ($product_filters as $product_filter) { $product_filter_id[] = $product_filter['filter_id']; } ?>
                  <?php if (in_array($filter['filter_id'], $product_filter_id)) { ?>
                    <input type="checkbox" name="product_filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                    <?php echo $filter['name']; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="product_filter[]" value="<?php echo $filter['filter_id']; ?>" />
                    <?php echo $filter['name']; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>
            <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="button-select"></a><a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="button-unselect"></a>
            </td>
          </tr>
        <?php } else { ?>
          <tr>
            <td><?php echo $entry_filter; ?><?php echo $text_autocomplete; ?></td>
            <td><input type="text" name="filter" value="" /> &nbsp; <a href="<?php echo $configure_filter; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="product-filter" class="scrollbox">
              <?php $class='odd'; ?>
              <?php foreach ($product_filters as $product_filter) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div id="product-filter<?php echo $product_filter['filter_id']; ?>" class="<?php echo $class; ?>"><?php echo $product_filter['name']; ?><img src="view/image/delete.png" alt="" />
                  <input type="hidden" name="product_filter[]" value="<?php echo $product_filter['filter_id']; ?>" />
                </div>
              <?php } ?>
            </div></td>
          </tr>
        <?php } ?>
        <?php if ($autocomplete_off) { ?>
          <tr>
            <td><?php echo $entry_download; ?></td>
            <td><a href="<?php echo $configure_download; ?>" class="button-form"><i class="fa fa-gear"></i></a>
            <div class="scrollbox" style="width:350px; height:155px; margin:5px 0;">
              <?php $class='odd'; ?>
              <?php foreach ($downloads as $download) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div class="<?php echo $class; ?>">
                  <?php $product_download_id = array(); ?>
                  <?php foreach ($product_downloads as $product_download) { $product_download_id[] = $product_download['download_id']; } ?>
                  <?php if (in_array($download['download_id'], $product_download_id)) { ?>
                    <input type="checkbox" name="product_download[]" value="<?php echo $download['download_id']; ?>" checked="checked" />
                    <?php echo $download['name']; ?>
                  <?php } else { ?>
                    <input type="checkbox" name="product_download[]" value="<?php echo $download['download_id']; ?>" />
                    <?php echo $download['name']; ?>
                  <?php } ?>
                </div>
              <?php } ?>
            </div>
            <a onclick="$(this).parent().find(':checkbox').prop('checked', true);" class="button-select"></a><a onclick="$(this).parent().find(':checkbox').prop('checked', false);" class="button-unselect"></a>
            </td>
          </tr>
        <?php } else { ?>
          <tr>
            <td><?php echo $entry_download; ?><?php echo $text_autocomplete; ?></td>
            <td><input type="text" name="download" value="" /> &nbsp; <a href="<?php echo $configure_download; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="product-download" class="scrollbox">
              <?php $class='odd'; ?>
              <?php foreach ($product_downloads as $product_download) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div id="product-download<?php echo $product_download['download_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_download['name']; ?><img src="view/image/delete.png" alt="" />
                  <input type="hidden" name="product_download[]" value="<?php echo $product_download['download_id']; ?>" />
                </div>
              <?php } ?>
            </div></td>
          </tr>
        <?php } ?>
        <?php if ($autocomplete_off) { ?>
          <tr>
            <td><?php echo $entry_related; ?></td>
            <td>
              <table>
                <tr>
                  <td colspan="3" style="padding:0;"><select id="category" style="margin-bottom:5px;" onchange="getProducts();">
                  <?php foreach ($categories as $category) { ?>
                    <?php if (in_array($category['category_id'], $product_categories)) { ?>
                      <option value="<?php echo $category['category_id']; ?>" selected="selected"><?php echo $category['name']; ?></option>
                    <?php } else { ?>
                      <option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                  <?php } ?>
                  </select></td>
                </tr>
                <tr>
                  <td style="padding:0;"><select multiple="multiple" id="product" size="10" style="width:350px; height:153px; background:#F8F8F8; border:1px solid #CCC;"></select></td>
                  <td style="vertical-align:middle;">
                    <input type="button" class="button-move-right" value="" onclick="addRelated();" />
                    <br /><br />
                    <input type="button" class="button-move-left" value="" onclick="removeRelated();" />
                  </td>
                  <td style="padding:0;"><select multiple="multiple" id="related" size="10" style="width:350px; height:153px; border:1px solid #CCC;"></select></td>
                </tr>
              </table>
              <div id="product_related">
                <?php foreach ($product_related as $product_related) { ?>
                  <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                <?php } ?>
              </div>
            </td>
          </tr>
        <?php } else { ?>
          <tr>
            <td><?php echo $entry_related; ?><?php echo $text_autocomplete; ?></td>
            <td><input type="text" name="related" value="" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><div id="product-related" class="scrollbox">
              <?php $class='odd'; ?>
              <?php foreach ($product_related as $product_related) { ?>
                <?php $class=($class == 'even' ? 'odd' : 'even'); ?>
                <div id="product-related<?php echo $product_related['product_id']; ?>" class="<?php echo $class; ?>"> <?php echo $product_related['name']; ?><img src="view/image/delete.png" alt="" />
                  <input type="hidden" name="product_related[]" value="<?php echo $product_related['product_id']; ?>" />
                </div>
              <?php } ?>
            </div></td>
          </tr>
        <?php } ?>
        </table>
      </div>
      <?php if ($palettes) { ?>
      <div id="tab-colors">
        <table class="form">
          <tr>
            <td><?php echo $entry_palette; ?></td>
            <td><select name="palette_id">
              <option value="0"><?php echo $text_none; ?></option>
              <?php foreach ($palettes as $palette) { ?>
                <?php if ($palette['palette_id'] == $palette_id) { ?>
                  <option value="<?php echo $palette['palette_id']; ?>" selected="selected"><?php echo $palette['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $palette['palette_id']; ?>"><?php echo $palette['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select> &nbsp; <a onclick="apply();" id="color-apply" class="button-save"><i class="fa fa-refresh"></i></a> &nbsp; <a href="<?php echo $configure_palette; ?>" class="button-form"><i class="fa fa-gear"></i></a></td>
          </tr>
        </table>
        <table id="colors" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_palette_color_id; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $color_row = 0; ?>
        <?php foreach ($product_colors as $product_color) { ?>
        <tbody id="color-row<?php echo $color_row; ?>">
          <tr>
            <td class="left"><select name="product_color[<?php echo $color_row; ?>][palette_color_id]">
              <?php foreach ($colors as $color) { ?>
                <?php if ($product_color['palette_color_id'] == $color['palette_color_id']) { ?>
                  <option value="<?php echo $color['palette_color_id']; ?>" selected="selected"><?php echo $color['title']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $color['palette_color_id']; ?>"><?php echo $color['title']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
            <td class="center"><a onclick="$('#color-row<?php echo $color_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $color_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="1"></td>
            <td class="center"><a onclick="addColor();" class="button ripple"><?php echo $button_add_color; ?></a></td>
          </tr>
        </tfoot>
        </table>
      </div>
      <?php } ?>
      <?php if ($fields) { ?>
      <div id="tab-fields">
        <table id="fields" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_field; ?></td>
            <td class="left"><?php echo $column_text; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $field_row = 0; ?>
        <?php foreach ($product_fields as $product_field) { ?>
        <tbody id="field-row<?php echo $field_row; ?>">
          <tr>
            <td class="left">
              <input type="text" name="product_field[<?php echo $field_row; ?>][title]" value="<?php echo $product_field['title']; ?>" />
              <input type="hidden" name="product_field[<?php echo $field_row; ?>][field_id]" value="<?php echo $product_field['field_id']; ?>" />
              <span class="help"><?php echo $text_autocomplete; ?></span>
            </td>
            <td class="left">
              <?php foreach ($languages as $language) { ?>
                <textarea name="product_field[<?php echo $field_row; ?>][product_field_description][<?php echo $language['language_id']; ?>][text]" cols="30" rows="3"><?php echo isset($product_field['product_field_description'][$language['language_id']]) ? $product_field['product_field_description'][$language['language_id']]['text'] : ''; ?></textarea>
                <img src="view/image/flags/<?php echo $language['image']; ?>" alt="" title="<?php echo $language['name']; ?>" align="top" /><br />
              <?php } ?>
            </td>
            <td class="center"><a onclick="$('#field-row<?php echo $field_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $field_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="2"></td>
            <td class="center"><a onclick="addField();" class="button ripple"><?php echo $button_add_field; ?></a></td>
          </tr>
        </tfoot>
        </table>
      </div>
      <?php } ?>
      <div id="tab-attribute">
        <table id="attribute" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_attribute; ?></td>
            <td class="left"><?php echo $column_text; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $attribute_row = 0; ?>
        <?php foreach ($product_attributes as $product_attribute) { ?>
        <tbody id="attribute-row<?php echo $attribute_row; ?>">
          <tr>
            <td class="left">
              <input type="text" name="product_attribute[<?php echo $attribute_row; ?>][name]" value="<?php echo $product_attribute['name']; ?>" />
              <input type="hidden" name="product_attribute[<?php echo $attribute_row; ?>][attribute_id]" value="<?php echo $product_attribute['attribute_id']; ?>" />
              <span class="help"><?php echo $text_autocomplete; ?></span>
            </td>
            <td class="left">
              <?php foreach ($languages as $language) { ?>
                <img src="view/image/flags/<?php echo $language['image']; ?>" alt="" title="<?php echo $language['name']; ?>" align="top" />
                <textarea name="product_attribute[<?php echo $attribute_row; ?>][product_attribute_description][<?php echo $language['language_id']; ?>][text]" id="attribute<?php echo $attribute_row; ?><?php echo $language['language_id']; ?>"><?php echo isset($product_attribute['product_attribute_description'][$language['language_id']]) ? $product_attribute['product_attribute_description'][$language['language_id']]['text'] : ''; ?></textarea><br />
              <?php } ?>
            </td>
            <td class="center"><a onclick="$('#attribute-row<?php echo $attribute_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $attribute_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="2"></td>
            <td class="center"><a onclick="addAttribute();" class="button ripple"><?php echo $button_add_attribute; ?></a></td>
          </tr>
        </tfoot>
        </table>
      </div>
      <div id="tab-option">
        <div id="vtab-option" class="vtabs">
          <?php $option_row = 0; ?>
          <?php foreach ($product_options as $product_option) { ?>
            <a href="#tab-option-<?php echo $option_row; ?>" id="option-<?php echo $option_row; ?>"><?php echo $product_option['name']; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('#option-<?php echo $option_row; ?>').remove(); $('#tab-option-<?php echo $option_row; ?>').remove(); $('#vtabs a:first').trigger('click'); return false;" /></a>
          <?php $option_row++; ?>
          <?php } ?>
          <span id="option-add">
            <input name="option" value="" style="width:130px;" />&nbsp;<img src="view/image/add.png" alt="<?php echo $button_add_option; ?>" title="<?php echo $button_add_option; ?>" />
          </span>
        </div>
        <?php $option_row = 0; ?>
        <?php $option_value_row = 0; ?>
        <?php foreach ($product_options as $product_option) { ?>
          <div id="tab-option-<?php echo $option_row; ?>" class="vtabs-content">
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_id]" value="<?php echo $product_option['product_option_id']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][name]" value="<?php echo $product_option['name']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][option_id]" value="<?php echo $product_option['option_id']; ?>" />
            <input type="hidden" name="product_option[<?php echo $option_row; ?>][type]" value="<?php echo $product_option['type']; ?>" />
            <table class="form">
              <tr>
                <td><?php echo $entry_required; ?></td>
                <td><select name="product_option[<?php echo $option_row; ?>][required]">
                  <?php if ($product_option['required']) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
                </select></td>
              </tr>
              <?php if ($product_option['type'] == 'text') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'textarea') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><textarea name="product_option[<?php echo $option_row; ?>][option_value]" cols="40" rows="3"><?php echo $product_option['option_value']; ?></textarea></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'file') { ?>
              <tr style="display:none;">
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" /></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'date') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="date" size="12" />
                <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'time') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="time" size="12" />
                <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
              </tr>
              <?php } ?>
              <?php if ($product_option['type'] == 'datetime') { ?>
              <tr>
                <td><?php echo $entry_option_value; ?></td>
                <td><input type="text" name="product_option[<?php echo $option_row; ?>][option_value]" value="<?php echo $product_option['option_value']; ?>" class="datetime" />
                <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
              </tr>
              <?php } ?>
            </table>
            <?php if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') { ?>
            <table id="option-value<?php echo $option_row; ?>" class="list">
            <thead>
              <tr>
                <td class="right"><?php echo $column_option_value; ?></td>
                <td class="right"><?php echo $column_quantity; ?></td>
                <td class="right"><?php echo $column_subtract; ?></td>
                <td class="right"><?php echo $column_price; ?></td>
                <td class="right"><?php echo $column_option_points; ?></td>
                <td class="right"><?php echo $column_weight; ?></td>
                <td></td>
              </tr>
            </thead>
            <?php foreach ($product_option['product_option_value'] as $product_option_value) { ?>
            <tbody id="option-value-row<?php echo $option_value_row; ?>">
              <tr>
                <td class="right"><select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][option_value_id]">
                  <?php if (isset($option_values[$product_option['option_id']])) { ?>
                    <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                      <?php if ($option_value['option_value_id'] == $product_option_value['option_value_id']) { ?>
                        <option value="<?php echo $option_value['option_value_id']; ?>" selected="selected"><?php echo $option_value['name']; ?></option>
                      <?php } else { ?>
                        <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  <?php } ?>
                </select>
                <input type="hidden" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][product_option_value_id]" value="<?php echo $product_option_value['product_option_value_id']; ?>" />
                </td>
                <td class="right"><input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][quantity]" value="<?php echo $product_option_value['quantity']; ?>" size="3" /></td>
                <td class="right">
                  <select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][subtract]">
                  <?php if ($product_option_value['subtract']) { ?>
                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                    <option value="0"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
                  </select>
                </td>
                <td class="right">
                  <select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price_prefix]">
                  <?php if ($product_option_value['price_prefix'] == '+') { ?>
                    <option value="+" selected="selected">+</option>
                  <?php } else { ?>
                    <option value="+">+</option>
                  <?php } ?>
                  <?php if ($product_option_value['price_prefix'] == '-') { ?>
                    <option value="-" selected="selected">-</option>
                  <?php } else { ?>
                    <option value="-">-</option>
                  <?php } ?>
                  </select>
                  <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][price]" value="<?php echo $product_option_value['price']; ?>" size="5" />
                </td>
                <td class="right">
                  <select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points_prefix]">
                  <?php if ($product_option_value['points_prefix'] == '+') { ?>
                    <option value="+" selected="selected">+</option>
                  <?php } else { ?>
                    <option value="+">+</option>
                  <?php } ?>
                  <?php if ($product_option_value['points_prefix'] == '-') { ?>
                    <option value="-" selected="selected">-</option>
                  <?php } else { ?>
                    <option value="-">-</option>
                  <?php } ?>
                  </select>
                  <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][points]" value="<?php echo $product_option_value['points']; ?>" size="5" />
                </td>
                <td class="right">
                  <select name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight_prefix]">
                  <?php if ($product_option_value['weight_prefix'] == '+') { ?>
                    <option value="+" selected="selected">+</option>
                  <?php } else { ?>
                    <option value="+">+</option>
                  <?php } ?>
                  <?php if ($product_option_value['weight_prefix'] == '-') { ?>
                    <option value="-" selected="selected">-</option>
                  <?php } else { ?>
                    <option value="-">-</option>
                  <?php } ?>
                  </select>
                  <input type="text" name="product_option[<?php echo $option_row; ?>][product_option_value][<?php echo $option_value_row; ?>][weight]" value="<?php echo $product_option_value['weight']; ?>" size="5" />
                </td>
                <td class="center"><a onclick="$('#option-value-row<?php echo $option_value_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
              </tr>
            </tbody>
            <?php $option_value_row++; ?>
            <?php } ?>
            <tfoot>
              <tr>
                <td colspan="6"></td>
                <td class="center"><a onclick="addOptionValue('<?php echo $option_row; ?>');" class="button ripple"><?php echo $button_add_option_value; ?></a></td>
              </tr>
            </tfoot>
            </table>
            <select id="option-values<?php echo $option_row; ?>" style="display:none;">
            <?php if (isset($option_values[$product_option['option_id']])) { ?>
              <?php foreach ($option_values[$product_option['option_id']] as $option_value) { ?>
                <option value="<?php echo $option_value['option_value_id']; ?>"><?php echo $option_value['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select>
            <?php } ?>
          </div>
        <?php $option_row++; ?>
        <?php } ?>
      </div>
      <?php if ($profiles) { ?>
      <div id="tab-profile">
        <table id="profile" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_profile; ?></td>
            <td class="left"><?php echo $column_customer_group; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $profile_row = 0; ?>
        <?php foreach ($product_profiles as $product_profile) { ?>
        <tbody id="profile-row<?php echo $profile_row; ?>">
          <tr>
            <td class="left">
              <select name="product_profiles[<?php echo $profile_row; ?>][profile_id]">
              <option value=""><?php echo $text_none; ?></option>
              <?php foreach ($profiles as $profile) { ?>
                <?php if ($profile['profile_id'] == $product_profile['profile_id']) { ?>
                  <option value="<?php echo $profile['profile_id']; ?>" selected="selected"><?php echo $profile['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $profile['profile_id']; ?>"><?php echo $profile['name']; ?></option>
                <?php } ?>
              <?php } ?>
              </select>
            </td>
            <td class="left">
              <select name="product_profiles[<?php echo $profile_row; ?>][customer_group_id]">
              <?php foreach ($customer_groups as $customer_group) { ?>
                <?php if ($customer_group['customer_group_id'] == $product_profile['customer_group_id']) { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                <?php } ?>
              <?php } ?>
              </select>
            </td>
            <td class="center"><a onclick="$('#profile-row<?php echo $profile_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $profile_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="2"></td>
            <td class="center"><a onclick="addProfile()" class="button ripple"><?php echo $button_add_profile; ?></a></td>
          </tr>
        </tfoot>
        </table>
      </div>
      <?php } ?>
      <div id="tab-discount">
        <table id="discount" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_customer_group; ?></td>
            <td class="left"><?php echo $column_quantity; ?></td>
            <td class="left"><?php echo $column_priority; ?></td>
            <td class="left"><?php echo $column_price; ?></td>
            <td class="left"><?php echo $column_date_start; ?></td>
            <td class="left"><?php echo $column_date_end; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $discount_row = 0; ?>
        <?php foreach ($product_discounts as $product_discount) { ?>
        <tbody id="discount-row<?php echo $discount_row; ?>">
          <tr>
            <td class="left"><select name="product_discount[<?php echo $discount_row; ?>][customer_group_id]">
            <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $product_discount['customer_group_id']) { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select></td>
            <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][quantity]" value="<?php echo $product_discount['quantity']; ?>" size="2" /></td>
            <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][priority]" value="<?php echo $product_discount['priority']; ?>" size="2" /></td>
            <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][price]" value="<?php echo $product_discount['price']; ?>" /></td>
            <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_start]" value="<?php echo $product_discount['date_start']; ?>" class="date" size="12" />
            <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
            <td class="left"><input type="text" name="product_discount[<?php echo $discount_row; ?>][date_end]" value="<?php echo $product_discount['date_end']; ?>" class="date" size="12" />
            <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
            <td class="center"><a onclick="$('#discount-row<?php echo $discount_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $discount_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="6"></td>
            <td class="center"><a onclick="addDiscount();" class="button ripple"><?php echo $button_add_discount; ?></a></td>
          </tr>
        </tfoot>
        </table>
      </div>
      <div id="tab-special">
        <table id="special" class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_customer_group; ?></td>
            <td class="left"><?php echo $column_priority; ?></td>
            <td class="left"><?php echo $column_price; ?></td>
            <td class="left"><?php echo $column_date_start; ?></td>
            <td class="left"><?php echo $column_date_end; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $special_row = 0; ?>
        <?php foreach ($product_specials as $product_special) { ?>
        <tbody id="special-row<?php echo $special_row; ?>">
          <tr>
            <td class="left"><select name="product_special[<?php echo $special_row; ?>][customer_group_id]">
            <?php foreach ($customer_groups as $customer_group) { ?>
              <?php if ($customer_group['customer_group_id'] == $product_special['customer_group_id']) { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
              <?php } ?>
            <?php } ?>
            </select></td>
            <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][priority]" value="<?php echo $product_special['priority']; ?>" size="2" /></td>
            <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][price]" value="<?php echo $product_special['price']; ?>" /></td>
            <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_start]" value="<?php echo $product_special['date_start']; ?>" class="date" size="12" />
            <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
            <td class="left"><input type="text" name="product_special[<?php echo $special_row; ?>][date_end]" value="<?php echo $product_special['date_end']; ?>" class="date" size="12" />
            <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>
            <td class="center"><a onclick="$('#special-row<?php echo $special_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $special_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="5"></td>
            <td class="center"><a onclick="addSpecial();" class="button ripple"><?php echo $button_add_special; ?></a></td>
          </tr>
        </tfoot>
        </table>
      </div>
      <div id="tab-reward">
        <table class="form">
          <tr>
            <td><?php echo $entry_points; ?></td>
            <td><input type="text" name="points" value="<?php echo $points; ?>" /> &nbsp;&nbsp;&nbsp; <?php echo $reward_rate; ?></td>
          </tr>
        </table>
        <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_customer_group; ?></td>
            <td class="left"><?php echo $column_reward; ?></td>
          </tr>
        </thead>
        <?php foreach ($customer_groups as $customer_group) { ?>
        <tbody>
          <tr>
            <td class="left"><?php echo $customer_group['name']; ?></td>
            <td class="left"><input type="text" name="product_reward[<?php echo $customer_group['customer_group_id']; ?>][points]" value="<?php echo isset($product_reward[$customer_group['customer_group_id']]) ? $product_reward[$customer_group['customer_group_id']]['points'] : ''; ?>" /></td>
          </tr>
        </tbody>
        <?php } ?>
        </table>
      </div>
      <div id="tab-image">
        <table id="images" class="list">
          <thead>
            <tr>
              <td class="left"><span class="required">*</span> <?php echo $column_image; ?></td>
              <?php if ($palette_id) { ?>
                <td class="left"><?php echo $column_palette_color_id; ?></td>
              <?php } ?>
              <td class="left"><?php echo $column_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <?php $image_row = 0; ?>
          <?php foreach ($product_images as $product_image) { ?>
          <tbody id="image-row<?php echo $image_row; ?>">
            <tr>
              <td class="center"><div class="image"><img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" /><br />
                <input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
                <a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');" class="button-browse"></a><a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');" class="button-recycle"></a>
              </div>
              <?php if (isset($error_product_image[$image_row])) { ?>
                <span class="error"><?php echo $error_product_image[$image_row]; ?></span>
              <?php } ?>
              </td>
              <?php if ($palette_id) { ?>
              <td class="center"><select name="product_image[<?php echo $image_row; ?>][palette_color_id]">
                <option value=""><?php echo $text_none; ?></option>
                <?php if ($palette_colors) { ?>
                  <?php foreach ($palette_colors as $palette_color) { ?>
                    <?php if ((isset($product_image['palette_color_id'])) && $product_image['palette_color_id'] == $palette_color['palette_color_id']) { ?>
                      <option value="<?php echo $palette_color['palette_color_id']; ?>" selected="selected"><?php echo $palette_color['title']; ?></option>
                    <?php } else { ?>
                      <option value="<?php echo $palette_color['palette_color_id']; ?>"><?php echo $palette_color['title']; ?></option>
                    <?php } ?>
                  <?php } ?>
                <?php } ?>
              </select></td>
              <?php } ?>
              <td class="center"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" /></td>
              <td class="center"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $image_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
            <?php if ($palette_id) { ?>
              <td colspan="3"></td>
            <?php } else { ?>
              <td colspan="2"></td>
            <?php } ?>
              <td class="center"><a onclick="addImage();" class="button ripple"><?php echo $button_add_image; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </div>
      <div id="tab-design">
        <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_store; ?></td>
            <td class="left"><?php echo $column_layout; ?></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="left"><?php echo $text_default; ?></td>
            <td class="left"><select name="product_layout[0][layout_id]">
              <option value=""><?php echo $text_none; ?></option>
              <?php foreach ($layouts as $layout) { ?>
                <?php if (isset($product_layout[0]) && $product_layout[0] == $layout['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
        </tbody>
        <?php foreach ($stores as $store) { ?>
        <tbody>
          <tr>
            <td class="left"><?php echo $store['name']; ?></td>
            <td class="left"><select name="product_layout[<?php echo $store['store_id']; ?>][layout_id]">
              <option value=""><?php echo $text_none; ?></option>
              <?php foreach ($layouts as $layout) { ?>
                <?php if (isset($product_layout[$store['store_id']]) && $product_layout[$store['store_id']] == $layout['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
              <?php } ?>
            </select></td>
          </tr>
        </tbody>
        <?php } ?>
        </table>
      </div>
    </form>
    </div>
  </div>
</div>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>

<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

<?php $attribute_row = 0; ?>
<?php foreach ($product_attributes as $product_attribute) { ?>
CKEDITOR.replace('attribute<?php echo $attribute_row; ?><?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php $attribute_row++; ?>
<?php } ?>

$(document).ready(function() {
	$('#meta-description<?php echo $language['language_id']; ?>').on('load propertychange keyup input paste', function() {
		var limit = $(this).data("limit");
		var remain = limit - $(this).val().length;
		if (remain <= 0) {
			$(this).val($(this).val().substring(0, limit));
		}
		$('#remaining<?php echo $language['language_id']; ?>').text((remain <= 0) ? 0 : remain);
	});

	$('#meta-description<?php echo $language['language_id']; ?>').trigger('load');
});
<?php } ?>
//--></script>

<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';

		$.each(items, function(index, item) {
			if (item['category'] != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item['category'] + '</li>');
				currentCategory = item['category'];
			}

			self._renderItemData(ul, item);
		});
	}
});

// Manufacturer
$('input[name=\'manufacturer\']').autocomplete({
	delay: 10,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/manufacturer/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'manufacturer_id': 0,
					'name': '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.manufacturer_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'manufacturer\']').attr('value', ui.item.label);
		$('input[name=\'manufacturer_id\']').attr('value', ui.item.value);

		return false;
	},
	focus: function(event, ui) {
		return false;
	}
});

$('#product-manufacturer').delegate('img', 'click', function() {
	$(this).parent().remove();

	$('#product-manufacturer div:odd').attr('class', 'odd');
	$('#product-manufacturer div:even').attr('class', 'even');
});

// Category
$('input[name=\'category\']').autocomplete({
	delay: 10,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('#product-category' + ui.item.value).remove();

		$('#product-category').append('<div id="product-category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_category[]" value="' + ui.item.value + '" /></div>');

		$('#product-category div:odd').attr('class', 'odd');
		$('#product-category div:even').attr('class', 'even');

		return false;
	},
	focus: function(event, ui) {
		return false;
	}
});

$('#product-category').delegate('img', 'click', function() {
	$(this).parent().remove();

	$('#product-category div:odd').attr('class', 'odd');
	$('#product-category div:even').attr('class', 'even');
});

// Filter
$('input[name=\'filter\']').autocomplete({
	delay: 10,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.filter_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('#product-filter' + ui.item.value).remove();

		$('#product-filter').append('<div id="product-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_filter[]" value="' + ui.item.value + '" /></div>');

		$('#product-filter div:odd').attr('class', 'odd');
		$('#product-filter div:even').attr('class', 'even');

		return false;
	},
	focus: function(event, ui) {
		return false;
	}
});

$('#product-filter').delegate('img', 'click', function() {
	$(this).parent().remove();

	$('#product-filter div:odd').attr('class', 'odd');
	$('#product-filter div:even').attr('class', 'even');
});

// Downloads
$('input[name=\'download\']').autocomplete({
	delay: 10,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/download/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.download_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('#product-download' + ui.item.value).remove();

		$('#product-download').append('<div id="product-download' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_download[]" value="' + ui.item.value + '" /></div>');

		$('#product-download div:odd').attr('class', 'odd');
		$('#product-download div:even').attr('class', 'even');

		return false;
	},
	focus: function(event, ui) {
		return false;
	}
});

$('#product-download').delegate('img', 'click', function() {
	$(this).parent().remove();

	$('#product-download div:odd').attr('class', 'odd');
	$('#product-download div:even').attr('class', 'even');
});

// Related
$('input[name=\'related\']').autocomplete({
	delay: 10,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('#product-related' + ui.item.value).remove();

		$('#product-related').append('<div id="product-related' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_related[]" value="' + ui.item.value + '" /></div>');

		$('#product-related div:odd').attr('class', 'odd');
		$('#product-related div:even').attr('class', 'even');

		return false;
	},
	focus: function(event, ui) {
		return false;
	}
});

$('#product-related').delegate('img', 'click', function() {
	$(this).parent().remove();

	$('#product-related div:odd').attr('class', 'odd');
	$('#product-related div:even').attr('class', 'even');
});
//--></script>

<?php if ($autocomplete_off) { ?>
<script type="text/javascript"><!--
function addRelated() {
	$('#product :selected').each(function() {
		$(this).remove();

		$('#related option[value=\'' + $(this).attr('value') + '\']').remove();
		$('#related').append('<option value="' + $(this).attr('value') + '">' + $(this).text() + '</option>');

		$('#product_related input[value=\'' + $(this).attr('value') + '\']').remove();
		$('#product_related').append('<input type="hidden" name="product_related[]" value="' + $(this).attr('value') + '" />');
	});
}

function removeRelated() {
	$('#related :selected').each(function() {
		$(this).remove();

		$('#product_related input[value=\'' + $(this).attr('value') + '\']').remove();
	});
}

function getProducts() {
	$('#product option').remove();
<?php if (isset($this->request->get['product_id'])) { ?>
	var product_id = '<?php echo $this->request->get['product_id']; ?>';
<?php } else { ?>
	var product_id = 0;
<?php } ?>
	$.ajax({
		url: 'index.php?route=catalog/product/category&token=<?php echo $token; ?>&category_id=' + $('#category').attr('value'),
		dataType: 'json',
		success: function(data) {
			for (i = 0; i < data.length; i++) {
				if (data[i]['product_id'] == product_id) {
					continue;
				}

				$('#product').append('<option value="' + data[i]['product_id'] + '">' + data[i]['name'] + ' (' + data[i]['model'] + ') </option>');
			}
		}
	});
}

function getRelated() {
	$('#related option').remove();

	$.ajax({
		url: 'index.php?route=catalog/product/related&token=<?php echo $token; ?>',
		type: 'POST',
		dataType: 'json',
		data: $('#product_related input'),
		success: function(data) {
			$('#product_related input').remove();

			for (i = 0; i < data.length; i++) {
				$('#related').append('<option value="' + data[i]['product_id'] + '">' + data[i]['name'] + ' (' + data[i]['model'] + ') </option>');

				$('#product_related').append('<input type="hidden" name="product_related[]" value="' + data[i]['product_id'] + '" />');
			}
		}
	});
}

getProducts();
getRelated();
//--></script>
<?php } ?>

<script type="text/javascript"><!--
$('select[name=\'tax_local_rate_id\']').on('change', function() {
	if ($(this).val() != <?php echo $tax_local_rate_id; ?>) {
		$('#price-apply').fadeIn(500);
	} else {
		$('#price-apply').hide();
	}
});

$('select[name=\'tax_local_rate_id\']').trigger('change');
//--></script>

<script type="text/javascript"><!--
$('.incvat').on('change keydown keyup', function() {
	$('input.excvat').val(($(this).val()/<?php echo $vat_rate; ?>).toFixed(2));
});

$('.excvat').on('change keydown keyup', function() {
	$('input.incvat').val(($(this).val()*<?php echo $vat_rate; ?>).toFixed(2));
});
//--></script>

<script type="text/javascript"><!--
$('select[name=\'palette_id\']').on('change', function() {
	if ($(this).val() != <?php echo $palette_id; ?>) {
		$('#color-apply').fadeIn(500);
	} else {
		$('#color-apply').hide();
	}
});

$('select[name=\'palette_id\']').trigger('change');
//--></script>

<?php if ($palettes) { ?>
<script type="text/javascript"><!--
var color_row = <?php echo $color_row; ?>;

function addColor() {
	html  = '<tbody id="color-row' + color_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="product_color[' + color_row + '][palette_color_id]">';
	html += '      <option value=""><?php echo $text_none; ?></option>';
	<?php foreach ($colors as $color) { ?>
	html += '      <option value="<?php echo $color['palette_color_id']; ?>"><?php echo $color['title']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="center"><a onclick="$(\'#color-row' + color_row + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#colors tfoot').before(html);

	color_row++;
}
//--></script>
<?php } ?>

<?php if ($fields) { ?>
<script type="text/javascript"><!--
var field_row = <?php echo $field_row; ?>;

function addField() {
	html  = '<tbody id="field-row' + field_row + '">';
	html += '  <tr>';
	html += '    <td class="left">';
	html += '      <input type="text" name="product_field[' + field_row + '][title]" value="" />';
	html += '      <input type="hidden" name="product_field[' + field_row + '][field_id]" value="" />';
	html += '      <span class="help"><?php echo $text_autocomplete; ?></span>';
	html += '    </td>';
	html += '    <td class="left">';
	<?php foreach ($languages as $language) { ?>
	html += '      <textarea name="product_field[' + field_row + '][product_field_description][<?php echo $language['language_id']; ?>][text]" cols="30" rows="3"></textarea>';
	html += '      <img src="view/image/flags/<?php echo $language['image']; ?>" alt="" title="<?php echo $language['name']; ?>" align="top" /><br />';
	<?php } ?>
	html += '    </td>';
	html += '    <td class="center"><a onclick="$(\'#field-row' + field_row + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#fields tfoot').before(html);

	fieldAutocomplete(field_row);

	field_row++;
}

function fieldAutocomplete(field_row) {
	$('input[name=\'product_field[' + field_row + '][title]\']').catcomplete({
		delay: 10,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/field/autocomplete&token=<?php echo $token; ?>&filter_title=' + encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return [{
							category: item.category,
							label: item.title,
							value: item.field_id
						}]
					}));
				}
			});
		},
		select: function(event, ui) {
			$('input[name=\'product_field[' + field_row + '][title]\']').attr('value', ui.item.label);
			$('input[name=\'product_field[' + field_row + '][field_id]\']').attr('value', ui.item.value);

			return false;
		},
		focus: function(event, ui) {
			return false;
   		}
	});
}

$('#fields tbody').each(function(index, element) {
	fieldAutocomplete(index);
});
//--></script>
<?php } ?>

<script type="text/javascript"><!--
var attribute_row = <?php echo $attribute_row; ?>;

function addAttribute() {
	html  = '<tbody id="attribute-row' + attribute_row + '">';
	html += '  <tr>';
	html += '    <td class="left">';
	html += '      <input type="text" name="product_attribute[' + attribute_row + '][name]" value="" />';
	html += '      <input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" />';
	html += '      <span class="help"><?php echo $text_autocomplete; ?></span>';
	html += '    </td>';
	html += '    <td class="left">';
	<?php foreach ($languages as $language) { ?>
	html += '      <img src="view/image/flags/<?php echo $language['image']; ?>" alt="" title="<?php echo $language['name']; ?>" align="top" />';
	html += '      <textarea name="product_attribute[' + attribute_row + '][product_attribute_description][<?php echo $language['language_id']; ?>][text]" id="attribute[' + attribute_row + '][<?php echo $language['language_id']; ?>]"></textarea><br />';
	<?php } ?>
	html += '    </td>';
	html += '    <td class="center"><a onclick="$(\'#attribute-row' + attribute_row + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#attribute tfoot').before(html);

	attributeAutocomplete(attribute_row);

<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('attribute[' + attribute_row + '][<?php echo $language['language_id']; ?>]', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>

	attribute_row++;
}

function attributeAutocomplete(attribute_row) {
	$('input[name=\'product_attribute[' + attribute_row + '][name]\']').catcomplete({
		delay: 10,
		source: function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/attribute/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return [{
							category: item.attribute_group,
							label: item.name,
							value: item.attribute_id
						}]
					}));
				}
			});
		},
		select: function(event, ui) {
			$('input[name=\'product_attribute[' + attribute_row + '][name]\']').attr('value', ui.item.label);
			$('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').attr('value', ui.item.value);

			return false;
		},
		focus: function(event, ui) {
			return false;
   		}
	});
}

$('#attribute tbody').each(function(index, element) {
	attributeAutocomplete(index);
});
//--></script>

<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-slider-access.min.js"></script> 

<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.time').timepicker({
	timeFormat: 'HH:mm',
	addSliderAccess: true,
	sliderAccessArgs: { touchonly: false }
});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'HH:mm',
	addSliderAccess: true,
	sliderAccessArgs: { touchonly: false }
});
//--></script>

<script type="text/javascript"><!--
var option_row = <?php echo $option_row; ?>;

$('input[name=\'option\']').catcomplete({
	delay: 10,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/option/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return [{
						category: item.category,
						label: item.name,
						value: item.option_id,
						type: item.type,
						option_value: item.option_value
					}]
				}));
			}
		});
	},
	select: function(event, ui) {
		html  = '<div id="tab-option-' + option_row + '" class="vtabs-content">';
		html += '  <input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
		html += '  <input type="hidden" name="product_option[' + option_row + '][name]" value="' + ui.item.label + '" />';
		html += '  <input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + ui.item.value + '" />';
		html += '  <input type="hidden" name="product_option[' + option_row + '][type]" value="' + ui.item.type + '" />';
		html += '  <table class="form">';
		html += '    <tr>';
		html += '      <td><?php echo $entry_required; ?></td>';
		html += '      <td><select name="product_option[' + option_row + '][required]">';
		html += '        <option value="1"><?php echo $text_yes; ?></option>';
		html += '        <option value="0"><?php echo $text_no; ?></option>';
		html += '      </select></td>';
		html += '    </tr>';

		if (ui.item.type == 'text') {
			html += '    <tr>';
			html += '      <td><?php echo $entry_option_value; ?></td>';
			html += '      <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '    </tr>';
		}

		if (ui.item.type == 'textarea') {
			html += '    <tr>';
			html += '      <td><?php echo $entry_option_value; ?></td>';
			html += '      <td><textarea name="product_option[' + option_row + '][option_value]" cols="40" rows="3"></textarea></td>';
			html += '    </tr>';
		}

		if (ui.item.type == 'file') {
			html += '    <tr style="display:none;">';
			html += '      <td><?php echo $entry_option_value; ?></td>';
			html += '      <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" /></td>';
			html += '    </tr>';
		}

		if (ui.item.type == 'date') {
			html += '    <tr>';
			html += '      <td><?php echo $entry_option_value; ?></td>';
			html += '      <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="date" size="12" />';
			html += '      <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>';
			html += '    </tr>';
		}

		if (ui.item.type == 'time') {
			html += '    <tr>';
			html += '      <td><?php echo $entry_option_value; ?></td>';
			html += '      <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="time" size="12" />';
			html += '      <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>';
			html += '    </tr>';
		}

		if (ui.item.type == 'datetime') {
			html += '    <tr>';
			html += '      <td><?php echo $entry_option_value; ?></td>';
			html += '      <td><input type="text" name="product_option[' + option_row + '][option_value]" value="" class="datetime" />';
			html += '      <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td></td>';
			html += '    </tr>';
		}

		html += '  </table>';

		if (ui.item.type == 'select' || ui.item.type == 'radio' || ui.item.type == 'checkbox' || ui.item.type == 'image') {
			html += '  <table id="option-value' + option_row + '" class="list">';
			html += '    <thead>';
			html += '      <tr>';
			html += '        <td class="right"><?php echo $column_option_value; ?></td>';
			html += '        <td class="right"><?php echo $column_quantity; ?></td>';
			html += '        <td class="right"><?php echo $column_subtract; ?></td>';
			html += '        <td class="right"><?php echo $column_price; ?></td>';
			html += '        <td class="right"><?php echo $column_option_points; ?></td>';
			html += '        <td class="right"><?php echo $column_weight; ?></td>';
			html += '        <td></td>';
			html += '      </tr>';
			html += '    </thead>';
			html += '    <tfoot>';
			html += '      <tr>';
			html += '        <td colspan="6"></td>';
			html += '        <td class="center"><a onclick="addOptionValue(' + option_row + ');" class="button ripple"><?php echo $button_add_option_value; ?></a></td>';
			html += '      </tr>';
			html += '    </tfoot>';
			html += '  </table>';
			html += '  <select id="option-values' + option_row + '" style="display:none;">';

			for (i = 0; i < ui.item.option_value.length; i++) {
				html += '  <option value="' + ui.item.option_value[i]['option_value_id'] + '">' + ui.item.option_value[i]['name'] + '</option>';
			}

			html += '  </select>';
			html += '</div>';
		}

		$('#tab-option').append(html);

		$('#option-add').before('<a href="#tab-option-' + option_row + '" id="option-' + option_row + '">' + ui.item.label + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'#option-' + option_row + '\').remove(); $(\'#tab-option-' + option_row + '\').remove(); $(\'#vtab-option a:first\').trigger(\'click\'); return false;" /></a>');

		$('#vtab-option a').tabs();

		$('#option-' + option_row).trigger('click');

		$('.date').datepicker({dateFormat: 'yy-mm-dd'});
		$('.time').timepicker({
			timeFormat: 'HH:mm',
			addSliderAccess: true,
			sliderAccessArgs: { touchonly: false }
		});
		$('.datetime').datetimepicker({
			dateFormat: 'yy-mm-dd',
			timeFormat: 'HH:mm',
			addSliderAccess: true,
			sliderAccessArgs: { touchonly: false }
		});

		option_row++;

		return false;
	},
	focus: function(event, ui) {
		return false;
	}
});
//--></script>

<script type="text/javascript"><!--
var option_value_row = <?php echo $option_value_row; ?>;

function addOptionValue(option_row) {
	html  = '<tbody id="option-value-row' + option_value_row + '">';
	html += '  <tr>';
	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]">';
	html += $('#option-values' + option_row).html();
	html += '    </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
	html += '    <td class="right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" size="3" /></td>';
	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]">';
	html += '      <option value="1"><?php echo $text_yes; ?></option>';
	html += '      <option value="0"><?php echo $text_no; ?></option>';
	html += '    </select></td>';
	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" size="5" /></td>';
	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" size="5" /></td>';
	html += '    <td class="right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]">';
	html += '      <option value="+">+</option>';
	html += '      <option value="-">-</option>';
	html += '    </select>';
	html += '    <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" size="5" /></td>';
	html += '    <td class="center"><a onclick="$(\'#option-value-row' + option_value_row + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#option-value' + option_row + ' tfoot').before(html);

	option_value_row++;
};
//--></script>

<?php if ($profiles) { ?>
<script type="text/javascript"><!--
var profile_row = <?php echo $profile_row; ?>;

function addProfile() {
	html  = '<tbody id="profile-row' + profile_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="product_profiles[' + profile_row + '][profile_id]">';
	html += '      <option value=""><?php echo $text_none; ?></option>';
	<?php foreach ($profiles as $profile) { ?>
	html += '      <option value="<?php echo $profile['profile_id']; ?>"><?php echo $profile['name']; ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="product_profiles[' + profile_row + '][customer_group_id]">';
	<?php foreach ($customer_groups as $customer_group) { ?>
	html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="center"><a onclick="$(\'#profile-row' + profile_row + '\').remove()" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#profile tfoot').before(html);

	profile_row++;
};
//--></script>
<?php } ?>

<script type="text/javascript"><!--
var discount_row = <?php echo $discount_row; ?>;

function addDiscount() {
	html  = '<tbody id="discount-row' + discount_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="product_discount[' + discount_row + '][customer_group_id]">';
	<?php foreach ($customer_groups as $customer_group) { ?>
	html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" size="2" /></td>';
	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][price]" value="" /></td>';
	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" class="date" size="12" />';
	html += '    <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>';
	html += '    <td class="left"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" class="date" size="12" />';
	html += '    <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>';
	html += '    <td class="center"><a onclick="$(\'#discount-row' + discount_row + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#discount tfoot').before(html);

	$('#discount-row' + discount_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

	discount_row++;
};
//--></script>

<script type="text/javascript"><!--
var special_row = <?php echo $special_row; ?>;

function addSpecial() {
	html  = '<tbody id="special-row' + special_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="product_special[' + special_row + '][customer_group_id]">';
	<?php foreach ($customer_groups as $customer_group) { ?>
	html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][priority]" value="" size="2" /></td>';
	html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][price]" value="" /></td>';
	html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_start]" value="" class="date" size="12" />';
    html += '    <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>';
	html += '    <td class="left"><input type="text" name="product_special[' + special_row + '][date_end]" value="" class="date" size="12" />';
    html += '    <span class="form-icon"><img src="view/image/calendar.png" alt="" /></span></td>';
	html += '    <td class="center"><a onclick="$(\'#special-row' + special_row + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#special tfoot').before(html);

	$('#special-row' + special_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});

	special_row++;
};
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
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
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
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '    <td class="center"><div class="image">';
	html += '      <img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br />';
	html += '      <a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');" class="button-browse"></a><a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');" class="button-recycle"></a>';
	html += '    </div></td>';
	<?php if ($palette_id) { ?>
	html += '    <td class="center"><select name="product_image[' + image_row + '][palette_color_id]">';
	html += '      <option value=""><?php echo $text_none; ?></option>';
	<?php if ($palette_colors) { ?>
	<?php foreach ($palette_colors as $palette_color) { ?>
	html += '      <option value="<?php echo $palette_color['palette_color_id']; ?>"><?php echo addslashes($palette_color['title']); ?></option>';
	<?php } ?>
	<?php } ?>
	html += '    </select></td>';
	<?php } ?>
	html += '    <td class="center"><input type="text" name="product_image[' + image_row + '][sort_order]" value="0" size="2" /></td>';
	html += '    <td class="center"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#images tfoot').before(html);

	image_row++;
};
//--></script>

<?php if ($auto_seo_url) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	var keyword = $("input[name=keyword]");

	if (!keyword.val()) {
		$("input[name^='product_description'], input[name='name'], input[name^='model']").keyup(function() {
			// Name
			var SEOname = $("input[name^='product_description'], input[name='name']").val();

			SEOname = SEOname.replace(/^\s+|\s+$/g, '');
			SEOname = SEOname.toLowerCase();

			var from = "ảãạàáäâấầậẩẫẻẹẽèéëêềếệểễăắằẳẵặìíïîịơởỡợờớọõỏòóöôốộồổỗđưứừựửữùúüûủụùúũñcçčlľštžýnrrdçõã·/_,:;";
			var to = "aaaaaaaaaaaaeeeeeeeeeeeeaaaaaaiiiiiooooooooooooooooooduuuuuuuuuuuuuuuncccllstzynrrdcoa------";

			for (var i=0, l=from.length ; i<l ; i++) {
				SEOname = SEOname.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
			}

			SEOname = SEOname.replace(/[^a-z0-9( -]/g, '').replace(/\(/g,"-").replace(/\s+/g, '-').replace(/-+/g, '-');

			// Model
			if ($("input[name^='model']").length) {
				var SEOmodel = $("input[name^='model']").val();

				SEOmodel = SEOmodel.replace(/^\s+|\s+$/g, '');
				SEOmodel = SEOmodel.toLowerCase();

				for (var i=0, l=from.length ; i<l ; i++) {
					SEOmodel = SEOmodel.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
				}

				SEOmodel = SEOmodel.replace(/[^a-z0-9 -]/g, '').replace(/\s+/g, '-').replace(/-+/g, '-');
			}

			if (SEOmodel) {
				keyword.val(SEOname+'-'+SEOmodel);
			} else {
				keyword.val(SEOname);
			}
		});
	}
});
//--></script>
<?php } ?>

<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#languages a').tabs();
$('#vtab-option a').tabs();
//--></script>

<?php echo $footer; ?>