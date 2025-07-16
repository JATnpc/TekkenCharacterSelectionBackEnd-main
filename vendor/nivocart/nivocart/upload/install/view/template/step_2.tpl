<?php echo $header; ?>
<h1>2<span style="font-size:16px;">/4</span> - <?php echo $heading_step_2; ?></h1>
<div id="content">
<?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" name="checks">
    <p><?php echo $text_install_php; ?></p>
    <fieldset>
      <table>
        <tr>
          <th width="35%" style="text-align:left;"><?php echo $text_setting; ?></th>
          <th width="25%" style="text-align:left;"><?php echo $text_current; ?></th>
          <th width="25%" style="text-align:left;"><?php echo $text_required; ?></th>
          <th width="15%" style="text-align:center;"><?php echo $text_status; ?></th>
        </tr>
        <tr>
          <td><?php echo $text_version; ?></td>
          <td><?php echo $php_version; ?></td>
          <td>7.0+</td>
          <td style="text-align:center;"><?php if ($php_version >= '7.0') { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_global; ?></td>
          <td><?php if ($register_globals) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_off; ?></td>
          <td style="text-align:center;"><?php if (!$register_globals) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_magic; ?></td>
          <td><?php if ($magic_quotes_gpc) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_off; ?></td>
          <td style="text-align:center;"><?php if (!$magic_quotes_gpc) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_file_upload; ?></td>
          <td><?php if ($file_uploads) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($file_uploads) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_session; ?></td>
          <td><?php if ($session_auto_start) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_off; ?></td>
          <td style="text-align:center;"><?php if (!$session_auto_start) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
      </table>
    </fieldset>
    <p><?php echo $text_install_extension; ?></p>
    <fieldset>
      <table>
        <tr>
          <th width="35%" style="text-align:left;"><?php echo $text_extension; ?></th>
          <th width="25%" style="text-align:left;"><?php echo $text_current; ?></th>
          <th width="25%" style="text-align:left;"><?php echo $text_required; ?></th>
          <th width="15%" style="text-align:center;"><?php echo $text_status; ?></th>
        </tr>
        <tr>
          <td><?php echo $text_db; ?></td>
          <td><?php if ($db) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($db) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_gd; ?></td>
          <td><?php if ($gd) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($gd) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_curl; ?></td>
          <td><?php if ($curl) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($curl) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_dom; ?></td>
          <td><?php if ($dom) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($dom) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_xml; ?></td>
          <td><?php if ($xml) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($xml) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
      <?php if ($php_version >= '7.1') { ?>
        <tr>
          <td><?php echo $text_openssl; ?></td>
          <td><?php if ($openssl_encrypt) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($openssl_encrypt) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
      <?php } else { ?>
        <tr>
          <td><?php echo $text_mcrypt; ?></td>
          <td><?php if ($mcrypt_encrypt) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($mcrypt_encrypt) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
      <?php } ?>
        <tr>
          <td><?php echo $text_zlib; ?></td>
          <td><?php if ($zlib) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($zlib) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $text_zip; ?></td>
          <td><?php if ($zip) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($zip) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
      <?php if (!$iconv) { ?>
        <tr>
          <td><?php echo $text_mbstring; ?></td>
          <td><?php if ($mbstring) { ?>
            <?php echo $text_on; ?>
          <?php } else { ?>
            <?php echo $text_off; ?>
          <?php } ?></td>
          <td><?php echo $text_on; ?></td>
          <td style="text-align:center;"><?php if ($mbstring) { ?>
            <img src="view/image/good.png" alt="Good" />
          <?php } else { ?>
            <img src="view/image/bad.png" alt="Bad" />
          <?php } ?></td>
        </tr>
      <?php } ?>
      </table>
    </fieldset>
    <p><?php echo $text_install_file; ?></p>
    <fieldset>
      <table>
        <tr>
          <th style="text-align:left;"><?php echo $text_file; ?></th>
          <th style="text-align:left;"><?php echo $text_status; ?></th>
        </tr>
        <tr>
          <td><?php echo $config_catalog; ?></td>
          <td><?php if (!file_exists($config_catalog)) { ?>
            <span class="bad"><?php echo $text_missing; ?></span>
          <?php } elseif (!is_writable($config_catalog)) { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } else { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $config_admin; ?></td>
          <td><?php if (!file_exists($config_admin)) { ?>
            <span class="bad"><?php echo $text_missing; ?></span>
          <?php } elseif (!is_writable($config_admin)) { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } else { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } ?></td>
        </tr>
      </table>
    </fieldset>
    <p><?php echo $text_install_directory; ?></p>
    <fieldset>
      <table>
        <tr>
          <th style="text-align:left;"><?php echo $text_directory; ?></th>
          <th style="text-align:left;"><?php echo $text_status; ?></th>
        </tr>
        <tr>
          <td><?php echo $cache . '/'; ?></td>
          <td><?php if (is_writable($cache)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $logs . '/'; ?></td>
          <td><?php if (is_writable($logs)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $upload . '/'; ?></td>
          <td><?php if (is_writable($upload)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $download . '/'; ?></td>
          <td><?php if (is_writable($download)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $image . '/'; ?></td>
          <td><?php if (is_writable($image)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $image_cache . '/'; ?></td>
          <td><?php if (is_writable($image_cache)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $image_data . '/'; ?></td>
          <td><?php if (is_writable($image_data)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $vqmod . '/'; ?></td>
          <td><?php if (is_writable($vqmod)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $vqmod_xml . '/'; ?></td>
          <td><?php if (is_writable($vqmod_xml)) { ?>
            <span class="good"><?php echo $text_writable; ?></span>
          <?php } else { ?>
            <span class="bad"><?php echo $text_unwritable; ?></span>
          <?php } ?></td>
        </tr>
      </table>
    </fieldset>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button-cancel animated fadeIn"><?php echo $button_back; ?></a></div>
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button animated fadeIn" /></div>
    </div>
  </form>
</div>
<?php echo $footer; ?>