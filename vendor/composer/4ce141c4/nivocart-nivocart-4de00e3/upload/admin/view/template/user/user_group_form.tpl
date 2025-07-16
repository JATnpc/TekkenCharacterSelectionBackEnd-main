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
      <h1><img src="view/image/user-group.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button-save ripple"><?php echo $button_save; ?></a>
        <a onclick="apply();" class="button-save ripple"><?php echo $button_apply; ?></a>
        <a href="<?php echo $cancel; ?>" class="button-cancel ripple"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_name; ?></td>
          <td><?php if ($error_name) { ?>
            <input type="text" name="name" value="<?php echo $name; ?>" class="input-error" />
            <span class="error"><?php echo $error_name; ?></span>
          <?php } else { ?>
            <input type="text" name="name" value="<?php echo $name; ?>" />
          <?php  } ?></td>
        </tr>
        <tr class="form-counter">
          <td><?php echo $entry_access; ?></td>
          <td><div class="scrollbox" style="height:230px; margin-bottom:5px;">
            <?php $class = 'odd'; ?>
            <?php foreach ($permissions as $permission) { ?>
              <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array($permission, $access)) { ?>
                  <input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" checked="checked" />
                  <?php echo $permission; ?>
                <?php } else { ?>
                  <input type="checkbox" name="permission[access][]" value="<?php echo $permission; ?>" />
                  <?php echo $permission; ?>
                <?php } ?>
              </div>
            <?php } ?>
          </div>
          <a onclick="$(this).parent().find(':checkbox').prop('checked', true); counter();" class="button-select"></a><a onclick="$(this).parent().find(':checkbox').prop('checked', false); counter();" class="button-unselect"></a>
          </td>
        </tr>
        <tr class="form-counter">
          <td><?php echo $entry_modify; ?></td>
          <td><div class="scrollbox" style="height:230px; margin-bottom:5px;">
            <?php $class = 'odd'; ?>
            <?php foreach ($permissions as $permission) { ?>
              <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
              <div class="<?php echo $class; ?>">
                <?php if (in_array($permission, $modify)) { ?>
                  <input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" checked="checked" />
                  <?php echo $permission; ?>
                <?php } else { ?>
                  <input type="checkbox" name="permission[modify][]" value="<?php echo $permission; ?>" />
                  <?php echo $permission; ?>
                <?php } ?>
              </div>
            <?php } ?>
          </div>
          <a onclick="$(this).parent().find(':checkbox').prop('checked', true); counter();" class="button-select"></a><a onclick="$(this).parent().find(':checkbox').prop('checked', false); counter();" class="button-unselect"></a>
          </td>
        </tr>
      </table>
    </form>
    </div>
  </div>
</div>

<script type="text/javascript"><!--
function counter() {
	for (var n in { access:null, modify:null, hidden:null }) {
		var e = $('[name^="permission[' + n + ']"]'), i = che=0; e.each(function(n) { 1 == $(this).prop("checked") && (che += 1), i = n+1 }),
		$("." + n + "_cnt").remove(),
		$("#" + n).append(' <cnt class="' + n + '_cnt" style="display:block;"> ' + che + " / " + i + "</cnt>")
	}
}

$(document).ready(function() {
	$('[name^="permission[access]"]').first().parentsUntil(".form-counter").parent().find("td").first().attr("id","access"),
	$('[name^="permission[modify]"]').first().parentsUntil(".form-counter").parent().find("td").first().attr("id","modify"),
	$('[name^="permission[hidden]"]').first().parentsUntil(".form-counter").parent().find("td").first().attr("id","hidden"), counter()
}),
$("input[type=checkbox]").on("change", function() {
	counter()
});
//--></script>

<?php echo $footer; ?> 