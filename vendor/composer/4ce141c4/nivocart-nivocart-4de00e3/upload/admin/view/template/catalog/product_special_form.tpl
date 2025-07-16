<div id="special-notifications"></div>
<table id="special-table" class="form-modal">
  <tr>
    <td><?php echo $entry_sp_selected; ?></td>
    <td><select name="sp_selected">
      <option value="1" selected="selected"><?php echo $text_selected_yes; ?></option>
      <option value="0"><?php echo $text_selected_no; ?></option>
    </select></td>
  </tr>
  <tr>
    <td><?php echo $entry_sp_append; ?></td>
    <td><select name="sp_append">
      <option value="1" selected="selected"><?php echo $text_append_yes; ?></option>
      <option value="0"><?php echo $text_append_no; ?></option>
    </select></td>
  </tr>
  <tr>
    <td><?php echo $entry_sp_customer_group; ?></td>
    <td><select name="sp_customer_group">
      <?php foreach ($customer_groups as $customer_group) { ?>
        <?php if ($customer_group['customer_group_id'] == $default_customer_group) { ?>
          <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
        <?php } else { ?>
          <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
        <?php } ?>
      <?php } ?>
    </select></td>
  </tr>
  <tr>
    <td><?php echo $entry_sp_period; ?></td>
    <td><select name="sp_period">
      <?php foreach ($periods as $period_id => $period_name) { ?>
        <option value="<?php echo $period_id; ?>"><?php echo $period_name; ?></option>
      <?php } ?>
    </select></td>
  </tr>
  <tr>
    <td><?php echo $entry_sp_discount; ?></td>
    <td><select name="sp_discount">
      <?php for ($i = 0; $i < 100; $i = $i+1) { ?>
        <option value="<?php echo $i; ?>">-<?php echo $i; ?>%</option>
      <?php } ?>
    </select></td>
  </tr>
</table>
<div style="margin:20px; text-align:right;">
  <img src="view/image/loading.gif" alt="" id="img-special-update" style="display:none;" /> 
  <a id="button-special-update" class="button ripple" style="font-size:12px; color:#FFF;"><?php echo $button_submit; ?></a>
</div>

<script type="text/javascript"><!--
$('body').on('click', '#button-special-update', function() {
	$('#special-notifications').html('');
	$('#img-special-update').show();
	$('div.success').remove();

	$.ajax({
		url:'index.php?route=catalog/product/updateSpecial&token=<?php echo $token; ?>',
		type:'post',
		dataType: 'json',
		data: $.param($('#update-special-dialog').find('input[type="hidden"], select')) + '&' + $('#form').serialize(),
		success: function(json) {
			$('#img-special-update').hide();

			if (json['success']) {
				$('#update-special-dialog').dialog('close');

				$('.box').before('<div class="success">' + json['success'] + '</div>');
			} else if (json['error']) {
				var error = '';

				if (json['error'] instanceof Array) {
					for (var i=0; i<json['error'].length; i++) {
						error += '<div>' + json['error'][i] + '</div>';
					}
				} else {
					error = json['error'];
				}
				$('#special-notifications').html('<div class="warning">' + error + '</div>');
			} else {
				alert('Unsupported response!');
			}
		},
		failure: function() {
			$('#img-special-update').hide();
			alert('Ajax failure!');
		}
	});
});
//--></script>