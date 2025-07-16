<?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div style="margin-bottom:10px;">
  <img src="https://cdn.klarna.com/public/images/<?php echo $iso_code_2; ?>/badges/v1/invoice/<?php echo $iso_code_2; ?>_invoice_badge_std_blue.png?width=150&eid=<?php echo $merchant; ?>" alt="" />
</div>
<div id="payment">
  <div style="margin-bottom:3px;"><b><?php echo $text_additional; ?></b></div>
  <div class="content">
    <table class="form">
      <?php if (!$company) { ?>
        <?php if ($iso_code_3 == 'DEU' || $iso_code_3 == 'NLD') { ?>
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-dob"><?php echo $entry_dob; ?></label></td>
            <td>
              <select name="pno_day" id="input-dob">
                <option value=""><?php echo $text_day; ?></option>
                <?php foreach ($days as $day) { ?>
                  <option value="<?php echo $day['value']; ?>"><?php echo $day['text']; ?></option>
                <?php } ?>
              </select>
              <select name="pno_month">
                <option value=""><?php echo $text_month; ?></option>
                <?php foreach ($months as $month) { ?>
                  <option value="<?php echo $month['value']; ?>"><?php echo $month['text']; ?></option>
                <?php } ?>
              </select>
              <select name="pno_year">
                <option value=""><?php echo $text_year; ?></option>
                <?php foreach ($years as $year) { ?>
                  <option value="<?php echo $year['value']; ?>"><?php echo $year['text']; ?></option>
                <?php } ?>
              </select>
            </td>
          </tr>
        <?php } else { ?>
          <tr>
            <td><span class="required">*</span>&nbsp;<label for="input-pno"><?php echo $entry_pno; ?></label></td>
            <td><input type="text" name="pno" id="input-pno" value="" /></td>
          </tr>
        <?php } ?>
      <?php } else { ?>
        <tr>
          <td><span class="required">*</span>&nbsp;<label for="input-company"><?php echo $entry_company; ?></label></td>
          <td><input type="text" name="pno" id="input-company" value="" /></td>
        </tr>
      <?php } ?>
      <?php if ($iso_code_3 == 'DEU' || $iso_code_3 == 'NLD') { ?>
        <tr>
          <td><span class="required">*</span>&nbsp;<?php echo $entry_gender; ?></td>
          <td>
            <input type="radio" name="gender" value="1" id="male" />
            <label for="male"><?php echo $text_male; ?></label>
            <input type="radio" name="gender" value="0" id="female" />
            <label for="female"><?php echo $text_female; ?></label>
          </td>
        </tr>
        <tr>
          <td><span class="required">*</span>&nbsp;<label for="input-street"><?php echo $entry_street; ?></label></td>
          <td><input type="text" name="street" id="input-street" value="<?php echo $street; ?>" /></td>
        </tr>
        <tr>
          <td><span class="required">*</span>&nbsp;<label for="input-house-no"><?php echo $entry_house_no; ?></label></td>
          <td><input type="text" name="house_no" id="input-house-no" value="<?php echo $street_number; ?>" /></td>
        </tr>
      <?php } ?>
      <?php if ($iso_code_3 == 'NLD') { ?>
        <tr>
          <td><label for="input-house-ext"><?php echo $entry_house_ext; ?></label></td>
          <td><input type="text" name="house_ext" id="input-house-ext" value="<?php echo $street_extension; ?>" /></td>
        </tr>
      <?php } ?>
      <tr>
        <td><span class="required">*</span>&nbsp;<label for="input-phone-no"><?php echo $entry_phone_no; ?></label></td>
        <td><input type="text" name="phone_no" id="input-phone-no" value="<?php echo $phone_number; ?>" /></td>
      </tr>
      <?php if ($iso_code_3 == 'DEU') { ?>
        <tr>
          <td colspan="2"><input type="checkbox" name="deu_terms" value="1" />
            Mit der Übermittlung der für die Abwicklung des Rechnungskaufes und einer Identitäts - und Bonitätsprüfung erforderlichen
            Daten an Klarna bin ich einverstanden. Meine <a href="https://online.klarna.com/consent_de.yaws" target="_blank">Einwilligung</a> kann ich jederzeit mit Wirkung für die Zukunft widerrufen.
          </td>
        </tr>
      <?php } ?>
    </table>
  </div>
</div>
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" />
  </div>
</div>

<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		url: 'index.php?route=payment/klarna_invoice/send',
		type: 'post',
		data: $('#payment input[type=\'text\'], #payment input[type=\'checkbox\']:checked, #payment input[type=\'radio\']:checked, #payment select'),
		dataType: 'json',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').prop('disabled', true);
			$('.warning, .error').remove();
			$('#payment').before('<div class="attention"><img src="catalog/view/theme/<?php echo $template; ?>/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-confirm').prop('disabled', false);
			$('.attention').remove();
		},
		success: function(json) {
			$('.warning, .error').remove();

			if (json['error']) {
				$('#payment').before('<div class="warning">' + json['error'] + '</div>');
			}

			if (json['redirect']) {
				location = json['redirect'];
			}
		}
	});
});
//--></script>