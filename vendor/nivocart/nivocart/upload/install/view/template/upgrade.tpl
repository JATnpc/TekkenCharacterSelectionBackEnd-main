<?php echo $header; ?>
<h1><?php echo $heading_upgrade; ?></h1>
<div id="content">
<?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" name="upgrade">
    <fieldset>
      <p><b><?php echo $text_follow_steps; ?></b></p>
      <ol>
        <li><?php echo $text_clear_cookie; ?></li>
        <li><?php echo $text_admin_page; ?></li>
        <li><?php echo $text_admin_user; ?></li>
        <li><?php echo $text_admin_setting; ?></li>
        <li><?php echo $text_store_front; ?></li>
      </ol>
      <br />
      <p><?php echo $text_be_patient; ?></p>
      <p id="timer" style="display:none;"></p>
	  <p id="progress" class="animated fadeIn" style="display:none;"><?php echo $text_is_upgrading; ?></p>
    </fieldset>
    <div id="start" class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_upgrade; ?>" class="button animated fadeIn" onclick="return progress();" /></div>
    </div>
  </form>
</div>

<script type="text/javascript"><!--
function progress() {
	document.getElementById('start').style.display='none';
	document.getElementById('timer').style.display='block';
	document.getElementById('progress').style.display='block';
	return true;
}
//--></script>

<?php echo $footer; ?> 