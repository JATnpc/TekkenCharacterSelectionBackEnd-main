<?php echo $header; ?>
<?php echo $content_higher; ?>
<?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($this->config->get($template . '_breadcrumbs')) { ?>
  <div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
  </div>
<?php } ?>
<?php echo $content_left; ?><?php echo $content_right; ?>
<div id="content"><?php echo $content_high; ?>
  <div style="float:right;"><img src="<?php echo $thumb; ?>" alt="" /></div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="buttons">
    <div class="left"><h4><?php echo $firstname; ?> <?php echo $lastname; ?> &nbsp; (<?php echo $email; ?>)</h4></div>
    <div class="right">
    <?php if ($cart_exist) { ?>
      <a href="<?php echo $my_cart; ?>" class="button"><i class="fa fa-shopping-cart"></i> &nbsp; <?php echo $button_my_cart; ?></a> &nbsp;
    <?php } ?>
      <a href="<?php echo $logout; ?>" class="button"><i class="fa fa-sign-out"></i> &nbsp; <?php echo $button_logout; ?></a>
    </div>
  </div>
  <?php if (!$addresses) { ?>
    <div class="attention"><?php echo $text_no_address; ?></div>
  <?php } ?>
  <h2><?php echo $text_my_account; ?></h2>
  <div class="content">
    <div class="box-account">
      <ul>
        <li><a href="<?php echo $edit; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/account.png" alt="" /><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/password.png" alt="" /><?php echo $text_password; ?></a></li>
      <?php if (!$addresses) { ?>
        <li><a href="<?php echo $address; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/address.png" alt="" /><?php echo $text_address; ?> &nbsp; <i class="fa fa-warning"></i></a></li>
      <?php } else { ?>
        <li><a href="<?php echo $address; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/address.png" alt="" /><?php echo $text_address; ?></a></li>
      <?php } ?>
        <li><a href="<?php echo $wishlist; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/wishlist.png" alt="" /><?php echo $text_wishlist; ?></a></li>
      </ul>
    </div>
  </div>
  <h2><?php echo $text_my_orders; ?></h2>
  <div class="content">
    <div class="box-account">
      <ul>
        <li><a href="<?php echo $order; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/history.png" alt="" /><?php echo $text_order; ?></a></li>
        <li><a href="<?php echo $download; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/download.png" alt="" /><?php echo $text_download; ?></a></li>
        <?php if ($reward) { ?>
          <li><a href="<?php echo $reward; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/reward.png" alt="" /><?php echo $text_reward; ?></a></li>
        <?php } ?>
        <li><a href="<?php echo $transaction; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/transaction.png" alt="" /><?php echo $text_transaction; ?></a></li>
        <?php if ($allow_return) { ?>
          <li><a href="<?php echo $return; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/return.png" alt="" /><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $addreturn; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/addreturn.png" alt="" /><?php echo $text_addreturn; ?></a></li>
        <?php } ?>
        <?php if ($profile_exist) { ?>
          <li><a href="<?php echo $recurring; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/recurring.png" alt="" /><?php echo $text_recurring; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <h2><?php echo $text_my_newsletter; ?></h2>
  <div class="content">
    <div class="box-account">
      <ul>
        <li><a href="<?php echo $newsletter; ?>"><img src="catalog/view/theme/<?php echo $template; ?>/image/account/newsletter.png" alt="" /><?php echo $text_newsletter; ?></a></li>
      </ul>
    </div>
  </div>
  <?php echo $content_low; ?>
</div>
<?php echo $content_lower; ?>
<?php echo $footer; ?>