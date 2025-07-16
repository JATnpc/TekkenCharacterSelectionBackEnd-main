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
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button-save ripple"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save ripple"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="bestseller">
        <table class="form">
        <tbody>
          <tr>
            <td><?php echo $entry_theme; ?></td>
            <td><?php if ($bestseller_theme) { ?>
              <input type="radio" name="bestseller_theme" value="1" id="theme-on" class="radio" checked />
              <label for="theme-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="bestseller_theme" value="0" id="theme-off" class="radio" />
              <label for="theme-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="bestseller_theme" value="1" id="theme-on" class="radio" />
              <label for="theme-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="bestseller_theme" value="0" id="theme-off" class="radio" checked />
              <label for="theme-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_title; ?></td>
            <td><?php foreach ($languages as $language) { ?>
              <input type="text" name="bestseller_title<?php echo $language['language_id']; ?>" id="bestseller_title<?php echo $language['language_id']; ?>" size="30" value="<?php echo ${'bestseller_title' . $language['language_id']}; ?>" />
              <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" alt="" style="vertical-align:top;" /><br />
            <?php } ?></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_viewproduct; ?></td>
            <td><?php if ($bestseller_viewproduct) { ?>
              <input type="radio" name="bestseller_viewproduct" value="1" id="viewproduct-on" class="radio" checked />
              <label for="viewproduct-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="bestseller_viewproduct" value="0" id="viewproduct-off" class="radio" />
              <label for="viewproduct-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="bestseller_viewproduct" value="1" id="viewproduct-on" class="radio" />
              <label for="viewproduct-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="bestseller_viewproduct" value="0" id="viewproduct-off" class="radio" checked />
              <label for="viewproduct-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
          <tr class="highlighted">
            <td><?php echo $entry_addproduct; ?></td>
            <td><?php if ($bestseller_addproduct) { ?>
              <input type="radio" name="bestseller_addproduct" value="1" id="addproduct-on" class="radio" checked />
              <label for="addproduct-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="bestseller_addproduct" value="0" id="addproduct-off" class="radio" />
              <label for="addproduct-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } else { ?>
              <input type="radio" name="bestseller_addproduct" value="1" id="addproduct-on" class="radio" />
              <label for="addproduct-on"><span><span></span></span><?php echo $text_yes; ?></label>
              <input type="radio" name="bestseller_addproduct" value="0" id="addproduct-off" class="radio" checked />
              <label for="addproduct-off"><span><span></span></span><?php echo $text_no; ?></label>
            <?php } ?></td>
          </tr>
        </tbody>
        </table>
        <table id="module" class="list">
          <thead>
            <tr>
              <td class="left"><?php echo $entry_style; ?></td>
              <td class="left"><?php echo $entry_limit; ?></td>
              <td class="left"><span class="required">*</span> <?php echo $entry_image; ?></td>
              <td class="left"><?php echo $entry_layout; ?></td>
              <td class="left"><?php echo $entry_position; ?></td>
              <td class="left"><?php echo $entry_status; ?></td>
              <td class="left"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
          <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
              <td class="left"><select name="bestseller_module[<?php echo $module_row; ?>][style]">
                <?php if ($module['style'] == 'box') { ?>
                  <option value="box" selected="selected"><?php echo $text_box; ?></option>
                <?php } else { ?>
                  <option value="box"><?php echo $text_box; ?></option>
                <?php } ?>
                <?php if ($module['style'] == 'list') { ?>
                  <option value="list" selected="selected"><?php echo $text_list; ?></option>
                <?php } else { ?>
                  <option value="list"><?php echo $text_list; ?></option>
                <?php } ?>
              </select></td>
              <td class="left">
                <input type="text" name="bestseller_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" size="1" />
              </td>
              <td class="left">
                <input type="text" name="bestseller_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" size="3" /> x 
                <input type="text" name="bestseller_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" size="3" /> px
                <?php if (isset($error_image[$module_row])) { ?>
                  <span class="error"><?php echo $error_image[$module_row]; ?></span>
                <?php } ?>
              </td>
              <td class="left"><select name="bestseller_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select></td>
              <td class="left"><select name="bestseller_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_higher') { ?>
                  <option value="content_higher" selected="selected"><?php echo $text_content_higher; ?></option>
                <?php } else { ?>
                  <option value="content_higher"><?php echo $text_content_higher; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_high') { ?>
                  <option value="content_high" selected="selected"><?php echo $text_content_high; ?></option>
                <?php } else { ?>
                  <option value="content_high"><?php echo $text_content_high; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_left') { ?>
                  <option value="content_left" selected="selected"><?php echo $text_content_left; ?></option>
                <?php } else { ?>
                  <option value="content_left"><?php echo $text_content_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_right') { ?>
                  <option value="content_right" selected="selected"><?php echo $text_content_right; ?></option>
                <?php } else { ?>
                  <option value="content_right"><?php echo $text_content_right; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_low') { ?>
                  <option value="content_low" selected="selected"><?php echo $text_content_low; ?></option>
                <?php } else { ?>
                  <option value="content_low"><?php echo $text_content_low; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'content_lower') { ?>
                  <option value="content_lower" selected="selected"><?php echo $text_content_lower; ?></option>
                <?php } else { ?>
                  <option value="content_lower"><?php echo $text_content_lower; ?></option>
                <?php } ?>
              </select></td>
              <td class="left"><select name="bestseller_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
              <td class="center">
                <input type="text" name="bestseller_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" />
              </td>
              <td class="center">
                <a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a>
              </td>
            </tr>
          </tbody>
        <?php $module_row++; ?>
        <?php } ?>
          <tfoot>
            <tr>
              <td colspan="7"></td>
              <td class="center"><a onclick="addModule();" class="button ripple"><?php echo $button_add_module; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="bestseller_module[' + module_row + '][style]">';
	html += '      <option value="box"><?php echo $text_box; ?></option>';
	html += '      <option value="list"><?php echo $text_list; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="bestseller_module[' + module_row + '][limit]" value="5" size="1" /></td>';
	html += '    <td class="left">';
	html += '      <input type="text" name="bestseller_module[' + module_row + '][image_width]" value="120" size="3" /> x ';
	html += '      <input type="text" name="bestseller_module[' + module_row + '][image_height]" value="120" size="3" /> px';
	html += '    </td>';
	html += '    <td class="left"><select name="bestseller_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '       <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="bestseller_module[' + module_row + '][position]">';
	html += '      <option value="content_higher"><?php echo $text_content_higher; ?></option>';
	html += '      <option value="content_high"><?php echo $text_content_high; ?></option>';
	html += '      <option value="content_left"><?php echo $text_content_left; ?></option>';
	html += '      <option value="content_right"><?php echo $text_content_right; ?></option>';
	html += '      <option value="content_low"><?php echo $text_content_low; ?></option>';
	html += '      <option value="content_lower"><?php echo $text_content_lower; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="bestseller_module[' + module_row + '][status]">';
	html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
	html += '      <option value="0"><?php echo $text_disabled; ?></option>';
	html += '    </select></td>';
	html += '    <td class="center"><input type="text" name="bestseller_module[' + module_row + '][sort_order]" value="0" size="3" /></td>';
	html += '    <td class="center"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button-delete ripple"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';

	$('#module tfoot').before(html);

	module_row++;
}
//--></script>

<?php echo $footer; ?>