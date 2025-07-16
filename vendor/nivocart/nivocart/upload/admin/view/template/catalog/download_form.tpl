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
    <h1><img src="view/image/download.png" alt="" /> <?php echo $download_title; ?></h1>
    <div class="buttons">
      <a onclick="$('#form').submit();" class="button-save ripple"><?php echo $button_save; ?></a>
      <a onclick="apply();" class="button-save ripple"><?php echo $button_apply; ?></a>
      <a href="<?php echo $cancel; ?>" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
    </div>
  </div>
  <div class="content">
    <div class="tooltip" style="margin:10px 0 15px 0;"><?php echo $text_upload_limit; ?></div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_name; ?></td>
          <td><?php foreach ($languages as $language) { ?>
            <?php if (isset($error_name[$language['language_id']])) { ?>
              <input type="text" name="download_description[<?php echo $language['language_id']; ?>][name]" size="30" value="<?php echo isset($download_description[$language['language_id']]) ? $download_description[$language['language_id']]['name'] : ''; ?>" class="input-error" />
              <img src="view/image/flags/<?php echo $language['image']; ?>" alt="" title="<?php echo $language['name']; ?>" /><br />
              <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
            <?php } else { ?>
              <input type="text" name="download_description[<?php echo $language['language_id']; ?>][name]" size="30" value="<?php echo isset($download_description[$language['language_id']]) ? $download_description[$language['language_id']]['name'] : ''; ?>" />
              <img src="view/image/flags/<?php echo $language['image']; ?>" alt="" title="<?php echo $language['name']; ?>" /><br />
            <?php } ?>
          <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_filename; ?><span class="help"><?php echo $help_filename; ?></span></td>
          <td><?php if ($error_filename) { ?>
            <input type="text" name="filename" value="<?php echo $filename; ?>" size="40" class="input-error" /> <a id="button-upload" class="button-form"><i class="fa fa-upload"></i> &nbsp; <?php echo $button_upload; ?></a>
            <span class="error"><?php echo $error_filename; ?></span>
          <?php } else { ?>
            <input type="text" name="filename" value="<?php echo $filename; ?>" size="40" /> <a id="button-upload" class="button-form"><i class="fa fa-upload"></i> &nbsp; <?php echo $button_upload; ?></a>
          <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_mask; ?><span class="help"><?php echo $help_mask; ?></span></td>
          <td><?php if ($error_mask) { ?>
            <input type="text" name="mask" value="<?php echo $mask; ?>" size="40" class="input-error" />
            <span class="error"><?php echo $error_mask; ?></span>
          <?php } else { ?>
            <input type="text" name="mask" value="<?php echo $mask; ?>" size="40" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_remaining; ?></td>
          <td><input type="text" name="remaining" value="<?php echo $remaining; ?>" size="6" /></td>
        </tr>
        <?php if ($download_id) { ?>
        <tr>
          <td><?php echo $entry_update; ?><span class="help"><?php echo $help_update; ?></span></td>
          <td>
            <input type="checkbox" name="update" value="1" id="push" class="checkbox" />
            <label for="push"><span></span></label>
          </td>
        </tr>
        <?php } ?>
      </table>
    </form>
  </div>
  </div>
</div>

<script type="text/javascript" src="view/javascript/jquery/ajaxupload.min.js"></script> 

<script type="text/javascript"><!--
new AjaxUpload('#button-upload', {
	action: 'index.php?route=catalog/download/upload&token=<?php echo $token; ?>',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-upload').after('<img src="view/image/loading.gif" alt="" class="loading" style="padding-left:5px;" />');
		$('#button-upload').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-upload').attr('disabled', false);

		if (json['success']) {
			alert(json['success']);

			$('input[name=\'filename\']').attr('value', json['filename']);
			$('input[name=\'mask\']').attr('value', json['mask']);
		}

		if (json['error']) {
			alert(json['error']);
		}

		$('.loading').remove();
	}
});
//--></script>

<?php echo $footer; ?>