<div id="login">
  <div style="margin-bottom:15px;">
    <h2><?php echo $text_checkout_account; ?></h2>
  </div>
  <?php echo $entry_express_email; ?>
  <input type="text" id="email" name="email" value="" size="30" autocomplete="off" />
  <span id="express-hide1" style="display:none; text-align:left;">
    <br />
    <br />
	<?php echo $text_express_hello; ?> <b><span id="express-name"></span></b> !
	<br />
    <br />
    <?php echo $entry_express_password; ?>
    <input type="password" name="password" value="" autocomplete="off" />
  </span>
  <span id="express-hide2" style="display:none; margin-left:10px;">
    <a href="<?php echo $forgotten; ?>" style="text-decoration:none;"><?php echo $text_express_remind; ?></a>
  </span>
  <br />
  <br />
  <br />
  <div class="buttons">
    <div id="check-email" class="left">
      <input type="submit" value="<?php echo $button_express_go; ?>" id="button-express" class="button" />
    </div>
    <div id="check-login" class="left" style="display:none;">
      <input type="submit" value="<?php echo $button_express_go; ?>" id="button-login" class="button" />
    </div>
  </div>
</div>

<script type="text/javascript"><!--
$('input[name=\'email\']').on('change keydown keyup', function() {
	$('#button-express').attr('disabled', false);
	$('#express-hide1').hide();
	$('#express-hide2').hide();
	$('#check-email').show();
	$('#check-login').hide();
});
$('input[name=\'password\']').on('change keydown keyup', function() {
	$('#check-email').hide();
	$('#check-login').show();
});
//--></script>