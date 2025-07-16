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
      <h1><img src="view/image/theme.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button-save ripple"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save ripple"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <div class="toggler" style="padding:0 0 10px 10px;">
        <fieldset><p><?php echo $text_administration; ?></p></fieldset>
      </div>
      <table class="form">
        <tr class="highlighted">
          <td><span class="required">*</span> <?php echo $entry_name; ?></td>
          <td><?php if ($error_name) { ?>
            stylesheet_<input type="text" name="name" value="<?php echo $name; ?>" size="20" class="input-error" />.css
            <span class="error"><?php echo $error_name; ?></span>
          <?php } else { ?>
            stylesheet_<input type="text" name="name" value="<?php echo $name; ?>" size="20" />.css
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_contrast; ?><span class="help"><?php echo $help_contrast; ?></span></td>
          <td><select name="contrast">
            <?php if (isset($contrast)) { $selected = "selected"; ?>
              <option value="light" <?php if ($contrast == 'light') { echo $selected; } ?>><?php echo $text_light; ?></option>
              <option value="dark" <?php if ($contrast == 'dark') { echo $selected; } ?>><?php echo $text_dark; ?></option>
            <?php } else { ?>
              <option value="light"><?php echo $text_light; ?></option>
              <option value="dark"><?php echo $text_dark; ?></option>
            <?php } ?>
          </select></td>
          </tr>
      </table>
    </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.toggler').hide().before('<a id="<?php echo 'toggler'; ?>" class="button ripple" style="margin:15px 0 15px 10px;"><i class="fa fa-info-circle"></i> &nbsp; <?php echo $button_info; ?></a>');
	$('#<?php echo 'toggler'; ?>').click(function() {
		$('.toggler').slideToggle(600);
		return false;
	});
});
//--></script>

<?php echo $footer; ?>