<h2><?php echo $text_payment_info; ?></h2>
<div class="success" id="firstdata-transaction-msg" style="display:none;"></div>
<table class="form">
  <tr>
    <td><?php echo $text_order_ref; ?></td>
    <td><?php echo $firstdata_order['order_ref']; ?></td>
  </tr>
  <tr>
    <td><?php echo $text_order_total; ?></td>
    <td><?php echo $firstdata_order['total_formatted']; ?></td>
  </tr>
  <tr>
    <td><?php echo $text_total_captured; ?></td>
    <td id="firstdata-total-captured"><?php echo $firstdata_order['total_captured_formatted']; ?></td>
  </tr>
  <tr>
    <td><?php echo $text_capture_status; ?></td>
    <td id="capture_status"><?php if ($firstdata_order['capture_status'] == 1 ) { ?>
      <span class="capture_text"><?php echo $text_yes; ?></span>
      <?php } else { ?>
      <span class="capture_text"><?php echo $text_no; ?></span>&nbsp;&nbsp;
      <?php if ($firstdata_order['void_status'] == 0) { ?>
      <a class="button" id="button-capture"><?php echo $button_capture; ?></a> <img src="view/image/loading.gif" alt="" id="img-loading-capture" style="display:none;" />
      <?php } ?>
    <?php } ?></td>
  </tr>
  <tr>
    <td><?php echo $text_void_status; ?></td>
    <td id="void_status"><?php if ($firstdata_order['void_status'] == 1) { ?>
      <span class="void_text"><?php echo $text_yes; ?></span>
      <?php } else { ?>
      <span class="void_text"><?php echo $text_no; ?></span>&nbsp;&nbsp;
      <?php if ($firstdata_order['capture_status'] == 0 ) { ?>
      <a class="button" id="button-void"><?php echo $button_void; ?></a> <img src="view/image/loading.gif" alt="" id="img_loading_void" style="display:none;" />
      <?php } ?>
   <?php } ?></td>
  </tr>
  <tr>
    <td><?php echo $text_refund_status; ?></td>
    <td id="refund_status"><?php if ($firstdata_order['refund_status'] == 1) { ?>
      <span class="refund_text"><?php echo $text_yes; ?></span>
      <?php } else { ?>
      <span class="refund_text"><?php echo $text_no; ?></span>&nbsp;&nbsp; <a class="btn btn-primary" id="button-refund" <?php if ($firstdata_order['capture_status'] == 0 || $firstdata_order['void_status'] == 1) { echo 'style="display:none;"'; } ?>><?php echo $button_refund; ?></a> <img src="view/image/loading.gif" alt="" id="img-loading-refund" style="display:none;" />
      <?php } ?></td>
  </tr>
  <tr>
    <td><?php echo $text_transactions; ?>:</td>
    <td><table id="firstdata-transactions">
      <thead>
        <tr>
          <td class="left"><strong><?php echo $text_column_date_added; ?></strong></td>
          <td class="left"><strong><?php echo $text_column_type; ?></strong></td>
          <td class="left"><strong><?php echo $text_column_amount; ?></strong></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach($firstdata_order['transactions'] as $transaction) { ?>
        <tr>
          <td class="left"><?php echo $transaction['date_added']; ?></td>
          <td class="left"><?php echo $transaction['type']; ?></td>
          <td class="left"><?php echo $transaction['amount']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table></td>
  </tr>
</table>

<script type="text/javascript"><!--
$('#button-void').bind('click', function() {
  if (confirm('<?php echo $text_confirm_void; ?>')) {
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: 'order_id=<?php echo $order_id; ?>',
      url: 'index.php?route=payment/firstdata_remote/void&token=<?php echo $token; ?>',
      beforeSend: function() {
        $('#button-void').hide();
        $('#img_loading_void').show();
        $('#firstdata-transaction-msg').hide();
      },
      success: function(data) {
        if (data['error'] == false) {
          html = '';
          html += '<tr>';
          html += '<td class="left">' + data.data.date_added + '</td>';
          html += '<td class="left">void</td>';
          html += '<td class="left">0.00</td>';
          html += '</tr>';

          $('.void_text').text('<?php echo $text_yes; ?>');

          $('#firstdata-transactions').append(html);

          $('#button-capture').hide();

          if (data.msg != '') {
            $('#firstdata-transaction-msg').empty().html(data.msg).fadeIn();
          }
        }

        if (data['error'] == true) {
          alert(data['msg']);
          $('#button-void').show();
        }

        $('#img_loading_void').hide();
      }
    });
  }
});

$('#button-capture').bind('click', function() {
  if (confirm('<?php echo $text_confirm_capture; ?>')) {
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: {'order_id': <?php echo $order_id; ?> },
      url: 'index.php?route=payment/firstdata_remote/capture&token=<?php echo $token; ?>',
      beforeSend: function() {
        $('#button-capture').hide();
        $('#img-loading-capture').show();
        $('#firstdata-transaction-msg').hide();
      },
      success: function(data) {
        if (data.error == false) {
          html = '';
          html += '<tr>';
          html += '<td class="left">' + data.data.date_added + '</td>';
          html += '<td class="left">payment</td>';
          html += '<td class="left">' + data.data.amount + '</td>';
          html += '</tr>';

          $('#firstdata-transactions').append(html);
          $('#firstdata-total-captured').text(data.data.total_formatted);

          if (data.data.capture_status == 1) {
            $('#button-void').hide();
            $('#button-refund').show();
            $('.capture_text').text('<?php echo $text_yes; ?>');
          } else {
            $('#button-capture').show();
          }

          if (data.msg != '') {
            $('#firstdata-transaction-msg').empty().html(data.msg).fadeIn();
          }
        }

        if (data.error == true) {
          alert(data.msg);
          $('#button-capture').show();
        }

        $('#img-loading-capture').hide();
      }
    });
  }
});

$('#button-refund').bind('click', function() {
  if (confirm('<?php echo $text_confirm_refund; ?>')) {
    $.ajax({
      type: 'POST',
      dataType: 'json',
      data: {'order_id': <?php echo $order_id; ?> },
      url: 'index.php?route=payment/firstdata_remote/refund&token=<?php echo $token; ?>',
      beforeSend: function() {
        $('#button-refund').hide();
        $('#img-loading-refund').show();
        $('#firstdata-transaction-msg').hide();
      },
      success: function(data) {
        if (data.error == false) {
          html = '';
          html += '<tr>';
          html += '<td class="left">' + data.data.date_added + '</td>';
          html += '<td class="left">refund</td>';
          html += '<td class="left">' + data.data.amount + '</td>';
          html += '</tr>';

          $('#firstdata-transactions').append(html);
          $('#firstdata-total-captured').text(data.data.total_captured);

          if (data.data.refund_status == 1) {
            $('.refund_text').text('<?php echo $text_yes; ?>');
          } else {
            $('#button-refund').show();
          }

          if (data.msg != '') {
            $('#firstdata-transaction-msg').empty().html(data.msg).fadeIn();
          }
        }

        if (data.error == true) {
          alert(data.msg);
          $('#button-refund').show();
        }

        $('#img-loading-refund').hide();
      }
    });
  }
});
//--></script>