<?php
class ControllerAffiliateSuccess extends Controller {

	public function index() {
		$this->language->load('affiliate/success');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', '', 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('affiliate/account', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_success'),
			'href'      => $this->url->link('affiliate/success', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		if (!$this->config->get('config_affiliate_approval')) {
			$this->data['text_message'] = sprintf($this->language->get('text_message'), $this->config->get('config_name'), $this->url->link('information/contact', '', 'SSL'));
		} else {
			$this->data['text_message'] = sprintf($this->language->get('text_approval'), $this->config->get('config_name'), $this->url->link('information/contact', '', 'SSL'));
		}

		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->data['continue'] = $this->url->link('affiliate/account', '', 'SSL');

		// Theme
		$this->data['template'] = $this->config->get('config_template');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
		}

		$this->children = array(
			'common/content_higher',
			'common/content_high',
			'common/content_left',
			'common/content_right',
			'common/content_low',
			'common/content_lower',
			'common/footer',
			'common/header'
		);

		$this->response->setOutput($this->render());
	}
}
