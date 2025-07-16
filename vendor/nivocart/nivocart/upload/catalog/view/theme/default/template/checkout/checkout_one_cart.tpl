<?php if ($products) { ?>
<div class="checkout-product">
  <table>
    <thead>
      <tr>
        <td class="name"><?php echo $column_name; ?></td>
        <td class="model"><?php echo $column_model; ?></td>
        <td class="quantity"><?php echo $column_quantity; ?></td>
        <td class="price"><?php echo $column_price; ?></td>
      <?php if ($tax_breakdown) { ?>
        <td class="price"><?php echo $column_tax_value; ?></td>
        <td class="price"><?php echo $column_tax_percent; ?></td>
      <?php } ?>
        <td class="total"><?php echo $column_total; ?></td>
      </tr>
    </thead>
    <tbody>
      <?php $tax_colspan_plus = $tax_colspan + 1; ?>
      <?php foreach ($products as $product) { ?>
        <?php if ($product['recurring']) { ?>
          <tr>
            <td colspan="<?php echo $tax_colspan_plus; ?>" style="border:none; line-height:18px; margin-left:10px;">
              <img src="catalog/view/theme/<?php echo $template; ?>/image/account/reorder.png" alt="" title="" style="float:left; margin-right:8px;" />
              <strong><?php echo $text_recurring_item; ?></strong>
              <?php echo $product['profile_description']; ?>
            </td>
          </tr>
        <?php } ?>
        <tr>
          <td class="name">
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a><?php echo $product['age_minimum']; ?>
            <?php if (!$product['stock']) { ?>
              <span class="stock">***</span>
            <?php } ?>
            <div>
              <?php foreach ($product['option'] as $option) { ?>
                - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
              <?php } ?>
              <?php if ($product['recurring']) { ?>
                - <small><?php echo $text_payment_profile; ?>: <?php echo $product['profile_name']; ?></small>
              <?php } ?>
            </div>
          </td>
          <td class="model"><?php echo $product['model']; ?></td>
          <td class="quantity"><?php echo $product['quantity']; ?></td>
          <td class="price"><?php echo $product['price']; ?></td>
        <?php if ($tax_breakdown) { ?>
          <td class="price"><?php echo $product['tax_value']; ?></td>
          <td class="price"><?php echo $product['tax_percent']; ?>%</td>
        <?php } ?>
          <td class="total"><?php echo $product['total']; ?></td>
        </tr>
      <?php } ?>
      <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="name"><?php echo $voucher['description']; ?></td>
          <td class="model"></td>
          <td class="quantity">1</td>
          <td class="price"><?php echo $voucher['amount']; ?></td>
        <?php if ($tax_breakdown) { ?>
          <td class="price">0.00</td>
          <td class="price">0%</td>
        <?php } ?>
          <td class="total"><?php echo $voucher['amount']; ?></td>
        </tr>
      <?php } ?>
    </tbody>
    <tfoot>
      <?php foreach ($totals as $total) { ?>
        <tr>
          <td colspan="<?php echo $tax_colspan; ?>" class="price"><b><?php echo $total['title']; ?>:</b></td>
          <td class="total"><?php echo $total['text']; ?></td>
        </tr>
      <?php } ?>
    </tfoot>
  </table>
</div>
<?php } ?>