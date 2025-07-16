<?php
class ControllerCatalogProduct extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product');

		$this->getList();
	}

	public function insert() {
		$this->language->load('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_product->addProduct($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->post['apply'])) {
				$product_id = $this->session->data['new_product_id'];

				if ($product_id) {
					unset($this->session->data['new_product_id']);

					$this->redirect($this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $product_id . $url, 'SSL'));
				}

			} else {
				$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_product->editProduct($this->request->get['product_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->post['apply'])) {
				$product_id = $this->request->get['product_id'];

				if ($product_id) {
					$this->redirect($this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $product_id . $url, 'SSL'));
				}

			} else {
				$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $product_id) {
				$this->model_catalog_product->deleteProduct($product_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function copy() {
		$this->language->load('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product');

		if (isset($this->request->post['selected']) && $this->validateCopy()) {
			foreach ($this->request->post['selected'] as $product_id) {
				$this->model_catalog_product->copyProduct($product_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_model'])) {
			$filter_model = $this->request->get['filter_model'];
		} else {
			$filter_model = null;
		}

		if (isset($this->request->get['filter_price'])) {
			$filter_price = $this->request->get['filter_price'];
		} else {
			$filter_price = null;
		}

		if (isset($this->request->get['filter_quantity'])) {
			$filter_quantity = $this->request->get['filter_quantity'];
		} else {
			$filter_quantity = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'pd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['enabled'] = $this->url->link('catalog/product/enable', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['disabled'] = $this->url->link('catalog/product/disable', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['insert'] = $this->url->link('catalog/product/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['copy'] = $this->url->link('catalog/product/copy', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/product/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['refresh'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL');

		// Pagination
		$this->data['navigation_hi'] = $this->config->get('config_pagination_hi');
		$this->data['navigation_lo'] = $this->config->get('config_pagination_lo');

		$this->data['products'] = array();

		$data = array(
			'filter_name'     => $filter_name,
			'filter_model'    => $filter_model,
			'filter_price'    => $filter_price,
			'filter_quantity' => $filter_quantity,
			'filter_status'   => $filter_status,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'           => $this->config->get('config_admin_limit')
		);

		// Admin user extra permissions
		$this->data['user_allowed'] = false;

		if (is_array($this->config->get('config_user_group_display'))) {
			$allowed_user = $this->user->getUserGroupId();

			if (in_array($allowed_user, $this->config->get('config_user_group_display'))) {
				$this->data['user_allowed'] = true;
			} else {
				$this->data['user_allowed'] = false;
			}
		}

		$this->load->model('tool/image');
		$this->load->model('tool/barcode');

		$admin_barcode = $this->config->get('config_admin_barcode');
		$barcode_type = $this->config->get('config_barcode_type');

		$product_total = $this->model_catalog_product->getTotalProducts($data);

		$results = $this->model_catalog_product->getProducts($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, 'SSL')
			);

			if ($result['image'] && file_exists(DIR_IMAGE . $result['image'])) {
				$image = $this->model_tool_image->resize($result['image'], 40, 40);
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', 40, 40);
			}

			$special = false;

			$product_specials = $this->model_catalog_product->getProductSpecials($result['product_id']);

			foreach ($product_specials as $product_special) {
				if (($product_special['date_start'] == '0000-00-00' || $product_special['date_start'] <= date('Y-m-d')) && ($product_special['date_end'] == '0000-00-00' || $product_special['date_end'] > date('Y-m-d'))) {
					$special = (float)$product_special['price'];
					break;
				}
			}

			$discounts = array();

			$total_discounts = $this->model_catalog_product->getTotalDiscountsByProductId($result['product_id']);

			$product_discounts = $this->model_catalog_product->getProductValidDiscounts($result['product_id']);

			foreach ($product_discounts as $product_discount) {
				$discounts[] = array(
					'product_id' => $result['product_id'],
					'quantity'   => (int)$product_discount['quantity'],
					'price'      => (float)$product_discount['price']
				);
			}

			$this->data['products'][] = array(
				'product_id' => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name'],
				'barcode'    => ($admin_barcode) ? $this->model_tool_barcode->getBarcode($result['model'], strtoupper($barcode_type), 1, 20) : '',
				'model'      => $result['model'],
				'price'      => (float)$result['price'],
				'special'    => $special,
				'discount'   => $discounts,
				'discounts'  => (int)$total_discounts,
				'quantity'   => $result['quantity'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_modified' => date($this->language->get('date_format_short'), strtotime($result['date_modified'])),
				'status'     => $result['status'],
				'selected'   => isset($this->request->post['selected']) && in_array($result['product_id'], $this->request->post['selected']),
				'action'     => $action
			);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_price_title'] = $this->language->get('text_price_title');
		$this->data['text_quantity_title'] = $this->language->get('text_quantity_title');
		$this->data['text_special_title'] = $this->language->get('text_special_title');
		$this->data['text_discount_title'] = $this->language->get('text_discount_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_confirm'] = $this->language->get('text_confirm');
		$this->data['text_confirm_delete'] = $this->language->get('text_confirm_delete');

		$this->data['column_id'] = $this->language->get('column_id');
		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_date_modified'] = $this->language->get('column_date_modified');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_enable'] = $this->language->get('button_enable');
        $this->data['button_disable'] = $this->language->get('button_disable');
		$this->data['button_copy'] = $this->language->get('button_copy');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_refresh'] = $this->language->get('button_refresh');
		$this->data['button_update_price'] = $this->language->get('button_update_price');
		$this->data['button_update_quantity'] = $this->language->get('button_update_quantity');
		$this->data['button_update_special'] = $this->language->get('button_update_special');
		$this->data['button_update_discount'] = $this->language->get('button_update_discount');
		$this->data['button_filter'] = $this->language->get('button_filter');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_name'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=pd.name' . $url, 'SSL');
		$this->data['sort_model'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.model' . $url, 'SSL');
		$this->data['sort_price'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.price' . $url, 'SSL');
		$this->data['sort_quantity'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.quantity' . $url, 'SSL');
		$this->data['sort_date_added'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.date_added' . $url, 'SSL');
		$this->data['sort_date_modified'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.date_modified' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . '&sort=p.status' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['filter_name'] = $filter_name;
		$this->data['filter_model'] = $filter_model;
		$this->data['filter_price'] = $filter_price;
		$this->data['filter_quantity'] = $filter_quantity;
		$this->data['filter_status'] = $filter_status;

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'catalog/product_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['heading_inventory'] = $this->language->get('heading_inventory');
		$this->data['heading_dimension'] = $this->language->get('heading_dimension');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_plus'] = $this->language->get('text_plus');
		$this->data['text_minus'] = $this->language->get('text_minus');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
		$this->data['text_option'] = $this->language->get('text_option');
		$this->data['text_option_value'] = $this->language->get('text_option_value');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_percent'] = $this->language->get('text_percent');
		$this->data['text_amount'] = $this->language->get('text_amount');
		$this->data['text_exc_vat'] = $this->language->get('text_exc_vat');
		$this->data['text_inc_vat'] = $this->language->get('text_inc_vat');
		$this->data['text_autocomplete'] = $this->language->get('text_autocomplete');

		$this->data['column_attribute'] = $this->language->get('column_attribute');
		$this->data['column_field'] = $this->language->get('column_field');
		$this->data['column_text'] = $this->language->get('column_text');
		$this->data['column_option_value'] = $this->language->get('column_option_value');
		$this->data['column_option_points'] = $this->language->get('column_option_points');
		$this->data['column_total_quantity'] = $this->language->get('column_total_quantity');
		$this->data['column_subtract'] = $this->language->get('column_substract');
		$this->data['column_weight'] = $this->language->get('column_weight');
		$this->data['column_profile'] = $this->language->get('column_profile');
		$this->data['column_customer_group'] = $this->language->get('column_customer_group');
		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_priority']	= $this->language->get('column_priority');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_date_start'] = $this->language->get('column_date_start');
		$this->data['column_date_end'] = $this->language->get('column_date_end');
		$this->data['column_reward'] = $this->language->get('column_reward');
		$this->data['column_image'] = $this->language->get('column_image');
		$this->data['column_palette_color_id'] = $this->language->get('column_palette_color_id');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_store'] = $this->language->get('column_store');
		$this->data['column_layout'] = $this->language->get('column_layout');
		$this->data['column_status'] = $this->language->get('column_status');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_tag'] = $this->language->get('entry_tag');

		$this->data['entry_model'] = $this->language->get('entry_model');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_label'] = $this->language->get('entry_label');
		$this->data['entry_video_code'] = $this->language->get('entry_video_code');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_local_tax_rate'] = $this->language->get('entry_local_tax_rate');
		$this->data['entry_price'] = sprintf($this->language->get('entry_price'), $this->config->get('config_currency'));
		$this->data['entry_cost'] = $this->language->get('entry_cost');
		$this->data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$this->data['entry_quote'] = $this->language->get('entry_quote');
		$this->data['entry_age_minimum'] = $this->language->get('entry_age_minimum');
		$this->data['entry_date_available'] = $this->language->get('entry_date_available');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');

		$this->data['entry_quantity'] = $this->language->get('entry_quantity');
		$this->data['entry_minimum'] = $this->language->get('entry_minimum');
		$this->data['entry_subtract'] = $this->language->get('entry_subtract');
		$this->data['entry_stock_status'] = $this->language->get('entry_stock_status');
		$this->data['entry_shipping'] = $this->language->get('entry_shipping');
		$this->data['entry_store_location'] = $this->language->get('entry_store_location');
		$this->data['entry_sku'] = $this->language->get('entry_sku');
		$this->data['entry_upc'] = $this->language->get('entry_upc');
		$this->data['entry_ean'] = $this->language->get('entry_ean');
		$this->data['entry_jan'] = $this->language->get('entry_jan');
		$this->data['entry_isbn'] = $this->language->get('entry_isbn');
		$this->data['entry_mpn'] = $this->language->get('entry_mpn');
		$this->data['entry_location'] = $this->language->get('entry_location');

		$this->data['entry_dimension'] = $this->language->get('entry_dimension');
		$this->data['entry_length'] = $this->language->get('entry_length');
		$this->data['entry_weight_class'] = $this->language->get('entry_weight_class');
		$this->data['entry_weight'] = $this->language->get('entry_weight');

		$this->data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_filter'] = $this->language->get('entry_filter');
		$this->data['entry_download'] = $this->language->get('entry_download');
		$this->data['entry_related'] = $this->language->get('entry_related');
		$this->data['entry_points'] = $this->language->get('entry_points');
		$this->data['entry_option'] = $this->language->get('entry_option');
		$this->data['entry_option_value'] = $this->language->get('entry_option_value');
		$this->data['entry_required'] = $this->language->get('entry_required');
		$this->data['entry_palette'] = $this->language->get('entry_palette');

		// Recurring
		$this->data['text_recurring_help'] = $this->language->get('text_recurring_help');
		$this->data['text_recurring_title'] = $this->language->get('text_recurring_title');
		$this->data['text_recurring_trial'] = $this->language->get('text_recurring_trial');

		$this->data['entry_recurring'] = $this->language->get('entry_recurring');
		$this->data['entry_recurring_price'] = $this->language->get('entry_recurring_price');
		$this->data['entry_recurring_freq'] = $this->language->get('entry_recurring_freq');
		$this->data['entry_recurring_cycle'] = $this->language->get('entry_recurring_cycle');
		$this->data['entry_recurring_length'] = $this->language->get('entry_recurring_length');
		$this->data['entry_trial'] = $this->language->get('entry_trial');
		$this->data['entry_trial_price'] = $this->language->get('entry_trial_price');
		$this->data['entry_trial_freq'] = $this->language->get('entry_trial_freq');
		$this->data['entry_trial_length'] = $this->language->get('entry_trial_length');
		$this->data['entry_trial_cycle'] = $this->language->get('entry_trial_cycle');

		$this->data['text_length_day'] = $this->language->get('text_length_day');
		$this->data['text_length_week'] = $this->language->get('text_length_week');
		$this->data['text_length_month'] = $this->language->get('text_length_month');
		$this->data['text_length_month_semi'] = $this->language->get('text_length_month_semi');
		$this->data['text_length_year'] = $this->language->get('text_length_year');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_apply'] = $this->language->get('button_apply');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_color'] = $this->language->get('button_add_color');
		$this->data['button_add_attribute'] = $this->language->get('button_add_attribute');
		$this->data['button_add_field'] = $this->language->get('button_add_field');
		$this->data['button_add_option'] = $this->language->get('button_add_option');
		$this->data['button_add_option_value'] = $this->language->get('button_add_option_value');
		$this->data['button_add_discount'] = $this->language->get('button_add_discount');
		$this->data['button_add_special'] = $this->language->get('button_add_special');
		$this->data['button_add_image'] = $this->language->get('button_add_image');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_add_profile'] = $this->language->get('button_add_profile');

		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_links'] = $this->language->get('tab_links');
		$this->data['tab_colors'] = $this->language->get('tab_colors');
		$this->data['tab_fields'] = $this->language->get('tab_fields');
		$this->data['tab_attribute'] = $this->language->get('tab_attribute');
		$this->data['tab_option'] = $this->language->get('tab_option');
		$this->data['tab_profile'] = $this->language->get('tab_profile');
		$this->data['tab_discount'] = $this->language->get('tab_discount');
		$this->data['tab_special'] = $this->language->get('tab_special');
		$this->data['tab_reward'] = $this->language->get('tab_reward');
		$this->data['tab_image'] = $this->language->get('tab_image');
		$this->data['tab_design'] = $this->language->get('tab_design');

		$this->data['token'] = $this->session->data['token'];

		// Errors
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

		if (isset($this->error['meta_description'])) {
			$this->data['error_meta_description'] = $this->error['meta_description'];
		} else {
			$this->data['error_meta_description'] = array();
		}

		if (isset($this->error['description'])) {
			$this->data['error_description'] = $this->error['description'];
		} else {
			$this->data['error_description'] = array();
		}

		if (isset($this->error['model'])) {
			$this->data['error_model'] = $this->error['model'];
		} else {
			$this->data['error_model'] = '';
		}

		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}

		if (isset($this->error['label'])) {
			$this->data['error_label'] = $this->error['label'];
		} else {
			$this->data['error_label'] = array();
		}

		if (isset($this->error['date_available'])) {
			$this->data['error_date_available'] = $this->error['date_available'];
		} else {
			$this->data['error_date_available'] = '';
		}

		if (isset($this->error['product_image'])) {
			$this->data['error_product_image'] = $this->error['product_image'];
		} else {
			$this->data['error_product_image'] = '';
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_model'])) {
			$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_price'])) {
			$url .= '&filter_price=' . $this->request->get['filter_price'];
		}

		if (isset($this->request->get['filter_quantity'])) {
			$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		if (isset($this->request->get['product_id'])) {
			$product_name = $this->model_catalog_product->getProductName($this->request->get['product_id']);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title') . ' :: ' . $product_name,
				'href'      => $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $this->request->get['product_id'] . $url, 'SSL'),
				'separator' => ' :: '
			);

			$this->data['product_title'] = $product_name;

		} else {
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
			);

			$this->data['product_title'] = $this->language->get('heading_title');
		}

		if (!isset($this->request->get['product_id'])) {
			$this->data['action'] = $this->url->link('catalog/product/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $this->request->get['product_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL');

		// Auto-complete
		$this->data['autocomplete_off'] = $this->config->get('config_autocomplete_product');

		// Auto Seo Urls
		$this->data['auto_seo_url'] = false;

		if (is_array($this->config->get('config_auto_seo_url'))) {
			if (in_array('Product', $this->config->get('config_auto_seo_url'))) {
				$this->data['auto_seo_url'] = true;
			}
		}

		if (isset($this->request->get['product_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$product_info = $this->model_catalog_product->getProduct($this->request->get['product_id']);
		}

		$this->load->model('localisation/language');

		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['product_description'])) {
			$this->data['product_description'] = $this->request->post['product_description'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_description'] = $this->model_catalog_product->getProductDescriptions($this->request->get['product_id']);
		} else {
			$this->data['product_description'] = array();
		}

		if (isset($this->request->post['model'])) {
			$this->data['model'] = $this->request->post['model'];
		} elseif (!empty($product_info)) {
			$this->data['model'] = $product_info['model'];
		} else {
			$this->data['model'] = '';
		}

		// Barcode
		$admin_barcode = $this->config->get('config_admin_barcode');
		$barcode_type = $this->config->get('config_barcode_type');

		if ($admin_barcode && !empty($product_info) && $product_info['model']) {
			$this->load->model('tool/barcode');

			$this->data['barcode'] = $this->model_tool_barcode->getBarcode($product_info['model'], strtoupper($barcode_type), 1, 20);
		} else {
			$this->data['barcode'] = '';
		}

		// Image
		$this->load->model('tool/image');

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.png', 120, 120);

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($product_info)) {
			$this->data['image'] = $product_info['image'];
		} else {
			$this->data['image'] = '';
		}

		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 120, 120);
		} elseif (!empty($product_info) && $product_info['image'] && file_exists(DIR_IMAGE . $product_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($product_info['image'], 120, 120);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.png', 120, 120);
		}

		// Label
		if (isset($this->request->post['label'])) {
			$this->data['label'] = $this->request->post['label'];
		} elseif (!empty($product_info)) {
			$this->data['label'] = $product_info['label'];
		} else {
			$this->data['label'] = '';
		}

		if (isset($this->request->post['label']) && file_exists(DIR_IMAGE . $this->request->post['label'])) {
			$this->data['thumb_label'] = $this->model_tool_image->resize($this->request->post['label'], 120, 120);
		} elseif (!empty($product_info) && $product_info['label'] && file_exists(DIR_IMAGE . $product_info['label'])) {
			$this->data['thumb_label'] = $this->model_tool_image->resize($product_info['label'], 120, 120);
		} else {
			$this->data['thumb_label'] = $this->model_tool_image->resize('no_image.png', 120, 120);
		}

		if (isset($this->request->post['video_code'])) {
			$this->data['video_code'] = $this->request->post['video_code'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['video_code'] = $this->model_catalog_product->getProductVideos($this->request->get['product_id']);
		} else {
			$this->data['video_code'] = '';
		}

		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($product_info)) {
			$this->data['keyword'] = $product_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		// Price
		$this->load->model('localisation/tax_local_rate');

		$this->data['tax_local_rates'] = $this->model_localisation_tax_local_rate->getTaxLocalRates(0);

		if (isset($this->request->post['tax_local_rate_id'])) {
			$tax_local_rate_id = $this->request->post['tax_local_rate_id'];
			$this->data['tax_local_rate_id'] = $tax_local_rate_id;
		} elseif (isset($this->request->get['product_id'])) {
			$tax_local_rate_id = $this->model_catalog_product->getProductTaxLocalRates($this->request->get['product_id']);
			$this->data['tax_local_rate_id'] = $tax_local_rate_id;
		} else {
			$tax_local_rate_id = 0;
			$this->data['tax_local_rate_id'] = $tax_local_rate_id;
		}

		$this->data['configure_tax_local_rate'] = $this->url->link('localisation/tax_local_rate', 'token=' . $this->session->data['token'], 'SSL');

		$base_rate = $this->model_localisation_tax_local_rate->getTaxLocalRate($tax_local_rate_id);

		if (!empty($base_rate) && $base_rate['tax_local_rate_id'] > 0 && is_numeric($base_rate['rate'])) {
			$this->data['vat_rate'] = 1 + ($base_rate['rate'] / 100);
			$this->data['base_rate'] = $base_rate['rate'];
		} else {
			$this->data['vat_rate'] = 1;
			$this->data['base_rate'] = '';
		}

		if (isset($this->request->post['price'])) {
			$this->data['price'] = $this->request->post['price'];
		} elseif (!empty($product_info)) {
			$this->data['price'] = $product_info['price'];
		} else {
			$this->data['price'] = 0;
		}

		if (isset($this->request->post['cost'])) {
			$this->data['cost'] = $this->request->post['cost'];
		} elseif (!empty($product_info)) {
			$this->data['cost'] = $product_info['cost'];
		} else {
			$this->data['cost'] = '';
		}

		$this->load->model('localisation/tax_class');

		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		if (isset($this->request->post['tax_class_id'])) {
			$this->data['tax_class_id'] = $this->request->post['tax_class_id'];
		} elseif (!empty($product_info)) {
			$this->data['tax_class_id'] = $product_info['tax_class_id'];
		} else {
			$this->data['tax_class_id'] = 0;
		}

		$this->data['configure_tax_class'] = $this->url->link('localisation/tax_class', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['quote'])) {
			$this->data['quote'] = $this->request->post['quote'];
		} elseif (!empty($product_info)) {
			$this->data['quote'] = $product_info['quote'];
		} else {
			$this->data['quote'] = 0;
		}

		if (isset($this->request->post['age_minimum'])) {
			$this->data['age_minimum'] = $this->request->post['age_minimum'];
		} elseif (!empty($product_info)) {
			$this->data['age_minimum'] = $product_info['age_minimum'];
		} else {
			$this->data['age_minimum'] = 0;
		}

		if (isset($this->request->post['date_available'])) {
			$this->data['date_available'] = $this->request->post['date_available'];
		} elseif (!empty($product_info)) {
			$this->data['date_available'] = date('Y-m-d', strtotime($product_info['date_available']));
		} else {
			$this->data['date_available'] = date('Y-m-d', time() - 86400);
		}

		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($product_info)) {
			$this->data['sort_order'] = $product_info['sort_order'];
		} else {
			$this->data['sort_order'] = 1;
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($product_info)) {
			$this->data['status'] = $product_info['status'];
		} else {
			$this->data['status'] = 1;
		}

		if (isset($this->request->post['quantity'])) {
			$this->data['quantity'] = $this->request->post['quantity'];
		} elseif (!empty($product_info)) {
			$this->data['quantity'] = $product_info['quantity'];
		} else {
			$this->data['quantity'] = 1;
		}

		if (isset($this->request->post['minimum'])) {
			$this->data['minimum'] = $this->request->post['minimum'];
		} elseif (!empty($product_info)) {
			$this->data['minimum'] = $product_info['minimum'];
		} else {
			$this->data['minimum'] = 1;
		}

		if (isset($this->request->post['subtract'])) {
			$this->data['subtract'] = $this->request->post['subtract'];
		} elseif (!empty($product_info)) {
			$this->data['subtract'] = $product_info['subtract'];
		} else {
			$this->data['subtract'] = 1;
		}

		$this->load->model('localisation/stock_status');

		$this->data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		if (isset($this->request->post['stock_status_id'])) {
			$this->data['stock_status_id'] = $this->request->post['stock_status_id'];
		} elseif (!empty($product_info)) {
			$this->data['stock_status_id'] = $product_info['stock_status_id'];
		} else {
			$this->data['stock_status_id'] = $this->config->get('config_stock_status_id');
		}

		if (isset($this->request->post['shipping'])) {
			$this->data['shipping'] = $this->request->post['shipping'];
		} elseif (!empty($product_info)) {
			$this->data['shipping'] = $product_info['shipping'];
		} else {
			$this->data['shipping'] = 1;
		}

		// Locations
		$this->load->model('localisation/location');

		$this->data['store_locations'] = $this->model_localisation_location->getLocations();

		if (isset($this->request->post['product_location'])) {
			$this->data['product_location'] = $this->request->post['product_location'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_location'] = $this->model_catalog_product->getProductLocations($this->request->get['product_id']);
		} else {
			$this->data['product_location'] = array(0);
		}

		if (isset($this->request->post['sku'])) {
			$this->data['sku'] = $this->request->post['sku'];
		} elseif (!empty($product_info)) {
			$this->data['sku'] = $product_info['sku'];
		} else {
			$this->data['sku'] = '';
		}

		if (isset($this->request->post['upc'])) {
			$this->data['upc'] = $this->request->post['upc'];
		} elseif (!empty($product_info)) {
			$this->data['upc'] = $product_info['upc'];
		} else {
			$this->data['upc'] = '';
		}

		if (isset($this->request->post['ean'])) {
			$this->data['ean'] = $this->request->post['ean'];
		} elseif (!empty($product_info)) {
			$this->data['ean'] = $product_info['ean'];
		} else {
			$this->data['ean'] = '';
		}

		if (isset($this->request->post['jan'])) {
			$this->data['jan'] = $this->request->post['jan'];
		} elseif (!empty($product_info)) {
			$this->data['jan'] = $product_info['jan'];
		} else {
			$this->data['jan'] = '';
		}

		if (isset($this->request->post['isbn'])) {
			$this->data['isbn'] = $this->request->post['isbn'];
		} elseif (!empty($product_info)) {
			$this->data['isbn'] = $product_info['isbn'];
		} else {
			$this->data['isbn'] = '';
		}

		if (isset($this->request->post['mpn'])) {
			$this->data['mpn'] = $this->request->post['mpn'];
		} elseif (!empty($product_info)) {
			$this->data['mpn'] = $product_info['mpn'];
		} else {
			$this->data['mpn'] = '';
		}

		if (isset($this->request->post['location'])) {
			$this->data['location'] = $this->request->post['location'];
		} elseif (!empty($product_info)) {
			$this->data['location'] = $product_info['location'];
		} else {
			$this->data['location'] = '';
		}

		if (isset($this->request->post['length'])) {
			$this->data['length'] = $this->request->post['length'];
		} elseif (!empty($product_info)) {
			$this->data['length'] = $product_info['length'];
		} else {
			$this->data['length'] = '';
		}

		if (isset($this->request->post['width'])) {
			$this->data['width'] = $this->request->post['width'];
		} elseif (!empty($product_info)) {
			$this->data['width'] = $product_info['width'];
		} else {
			$this->data['width'] = '';
		}

		if (isset($this->request->post['height'])) {
			$this->data['height'] = $this->request->post['height'];
		} elseif (!empty($product_info)) {
			$this->data['height'] = $product_info['height'];
		} else {
			$this->data['height'] = '';
		}

		$this->load->model('localisation/length_class');

		$this->data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();

		if (isset($this->request->post['length_class_id'])) {
			$this->data['length_class_id'] = $this->request->post['length_class_id'];
		} elseif (!empty($product_info)) {
			$this->data['length_class_id'] = $product_info['length_class_id'];
		} else {
			$this->data['length_class_id'] = $this->config->get('config_length_class_id');
		}

		$this->data['configure_length_class'] = $this->url->link('localisation/length_class', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['weight'])) {
			$this->data['weight'] = $this->request->post['weight'];
		} elseif (!empty($product_info)) {
			$this->data['weight'] = $product_info['weight'];
		} else {
			$this->data['weight'] = '';
		}

		$this->load->model('localisation/weight_class');

		$this->data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();

		if (isset($this->request->post['weight_class_id'])) {
			$this->data['weight_class_id'] = $this->request->post['weight_class_id'];
		} elseif (!empty($product_info)) {
			$this->data['weight_class_id'] = $product_info['weight_class_id'];
		} else {
			$this->data['weight_class_id'] = $this->config->get('config_weight_class_id');
		}

		$this->data['configure_weight_class'] = $this->url->link('localisation/weight_class', 'token=' . $this->session->data['token'], 'SSL');

		// Manufacturer
		$this->load->model('catalog/manufacturer');

		$this->data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();

		if (isset($this->request->post['manufacturer_id'])) {
			$this->data['manufacturer_id'] = $this->request->post['manufacturer_id'];
		} elseif (!empty($product_info)) {
			$this->data['manufacturer_id'] = $product_info['manufacturer_id'];
		} else {
			$this->data['manufacturer_id'] = 0;
		}

		if (isset($this->request->post['manufacturer'])) {
			$this->data['manufacturer'] = $this->request->post['manufacturer'];
		} elseif (!empty($product_info)) {
			$manufacturer_info = $this->model_catalog_manufacturer->getManufacturer($product_info['manufacturer_id']);

			if ($manufacturer_info) {
				$this->data['manufacturer'] = $manufacturer_info['name'];
			} else {
				$this->data['manufacturer'] = '';
			}

		} else {
			$this->data['manufacturer'] = '';
		}

		$this->data['configure_manufacturer'] = $this->url->link('catalog/manufacturer', 'token=' . $this->session->data['token'], 'SSL');

		// Stores
		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['product_store'])) {
			$this->data['product_store'] = $this->request->post['product_store'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_store'] = $this->model_catalog_product->getProductStores($this->request->get['product_id']);
		} else {
			$this->data['product_store'] = array(0);
		}

		// Categories
		$this->load->model('catalog/category');

		$this->data['categories'] = $this->model_catalog_category->getCategories(0);

		if (isset($this->request->post['product_category'])) {
			$categories = $this->request->post['product_category'];
		} elseif (isset($this->request->get['product_id'])) {
			$categories = $this->model_catalog_product->getProductCategories($this->request->get['product_id']);
		} else {
			$categories = array();
		}

		$this->data['product_categories'] = array();

		foreach ($categories as $category_id) {
			$category_info = $this->model_catalog_category->getCategory($category_id);

			if ($category_info) {
				$this->data['product_categories'][] = array(
					'category_id' => $category_info['category_id'],
					'name'        => ($category_info['path'] ? $category_info['path'] . ' &gt; ' : '') . $category_info['name']
				);
			}
		}

		$this->data['configure_category'] = $this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL');

		// Filters
		$this->load->model('catalog/filter');

		$this->data['filters'] = $this->model_catalog_filter->getAllFilters();

		if (isset($this->request->post['product_filter'])) {
			$filters = $this->request->post['product_filter'];
		} elseif (isset($this->request->get['product_id'])) {
			$filters = $this->model_catalog_product->getProductFilters($this->request->get['product_id']);
		} else {
			$filters = array();
		}

		$this->data['product_filters'] = array();

		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);

			if ($filter_info) {
				$this->data['product_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}

		$this->data['configure_filter'] = $this->url->link('catalog/filter', 'token=' . $this->session->data['token'], 'SSL');

		// Downloads
		$this->load->model('catalog/download');

		$this->data['downloads'] = $this->model_catalog_download->getDownloads(0);

		if (isset($this->request->post['product_download'])) {
			$product_downloads = $this->request->post['product_download'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_downloads = $this->model_catalog_product->getProductDownloads($this->request->get['product_id']);
		} else {
			$product_downloads = array();
		}

		$this->data['product_downloads'] = array();

		foreach ($product_downloads as $download_id) {
			$download_info = $this->model_catalog_download->getDownload($download_id);

			if ($download_info) {
				$this->data['product_downloads'][] = array(
					'download_id' => $download_info['download_id'],
					'name'        => $download_info['name']
				);
			}
		}

		$this->data['configure_download'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'], 'SSL');

		// Related
		if (isset($this->request->post['product_related'])) {
			$products = $this->request->post['product_related'];
		} elseif (isset($this->request->get['product_id'])) {
			$products = $this->model_catalog_product->getProductRelated($this->request->get['product_id']);
		} else {
			$products = array();
		}

		$this->data['product_related'] = array();

		foreach ($products as $product_id) {
			$related_info = $this->model_catalog_product->getProduct($product_id);

			if ($related_info) {
				$this->data['product_related'][] = array(
					'product_id' => $related_info['product_id'],
					'name'       => $related_info['name']
				);
			}
		}

		// Colors
		$this->load->model('catalog/palette');

		$this->data['palettes'] = $this->model_catalog_palette->getPalettes(0);

		if (isset($this->request->post['palette_id'])) {
			$this->data['palette_id'] = $this->request->post['palette_id'];
		} elseif (!empty($product_info)) {
			$this->data['palette_id'] = $product_info['palette_id'];
		} else {
			$this->data['palette_id'] = 0;
		}

		if (isset($product_info['palette_id'])) {
			$this->data['colors'] = $this->model_catalog_palette->getPaletteColorsByPaletteId($product_info['palette_id']);
		} else {
			$this->data['colors'] = $this->model_catalog_palette->getPaletteColors();
		}

		$this->data['configure_palette'] = $this->url->link('catalog/palette', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['product_color'])) {
			$product_colors = $this->request->post['product_color'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_colors = $this->model_catalog_product->getProductColors($this->request->get['product_id']);
		} else {
			$product_colors = array();
		}

		$this->data['product_colors'] = array();

		foreach ($product_colors as $product_color_id) {
			$palette_colors = $this->model_catalog_palette->getPaletteColorsByColorId($product_color_id);

			if ($palette_colors) {
				foreach ($palette_colors as $palette_color) {
					$this->data['product_colors'][] = array(
						'palette_color_id' => $palette_color['palette_color_id'],
						'color'            => $palette_color['color'],
						'title'            => $palette_color['title']
					);
				}
			}
		}

		// Fields
		$this->load->model('catalog/field');

		$this->data['fields'] = $this->model_catalog_field->getFields(0);

		if (isset($this->request->post['product_field'])) {
			$product_fields = $this->request->post['product_field'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_fields = $this->model_catalog_product->getProductFields($this->request->get['product_id']);
		} else {
			$product_fields = array();
		}

		$this->data['product_fields'] = array();

		foreach ($product_fields as $product_field) {
			$field_info = $this->model_catalog_field->getField($product_field['field_id']);

			if ($field_info) {
				$this->data['product_fields'][] = array(
					'product_field_description' => $product_field['product_field_description'],
					'field_id'                  => $product_field['field_id'],
					'title'                     => $field_info['title']
				);
			}
		}

		// Attributes
		$this->load->model('catalog/attribute');

		if (isset($this->request->post['product_attribute'])) {
			$product_attributes = $this->request->post['product_attribute'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_attributes = $this->model_catalog_product->getProductAttributes($this->request->get['product_id']);
		} else {
			$product_attributes = array();
		}

		$this->data['product_attributes'] = array();

		foreach ($product_attributes as $product_attribute) {
			$attribute_info = $this->model_catalog_attribute->getAttribute($product_attribute['attribute_id']);

			if ($attribute_info) {
				$this->data['product_attributes'][] = array(
					'product_attribute_description' => $product_attribute['product_attribute_description'],
					'attribute_id'                  => $product_attribute['attribute_id'],
					'name'                          => $attribute_info['name']
				);
			}
		}

		// Options
		$this->load->model('catalog/option');

		if (isset($this->request->post['product_option'])) {
			$product_options = $this->request->post['product_option'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_options = $this->model_catalog_product->getProductOptions($this->request->get['product_id']);
		} else {
			$product_options = array();
		}

		$this->data['product_options'] = array();

		foreach ($product_options as $product_option) {
			if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
				$product_option_value_data = array();

				foreach ($product_option['product_option_value'] as $product_option_value) {
					$product_option_value_data[] = array(
						'product_option_value_id' => $product_option_value['product_option_value_id'],
						'option_value_id'         => $product_option_value['option_value_id'],
						'quantity'                => $product_option_value['quantity'],
						'subtract'                => $product_option_value['subtract'],
						'price'                   => $product_option_value['price'],
						'price_prefix'            => $product_option_value['price_prefix'],
						'points'                  => $product_option_value['points'],
						'points_prefix'           => $product_option_value['points_prefix'],
						'weight'                  => $product_option_value['weight'],
						'weight_prefix'           => $product_option_value['weight_prefix']
					);
				}

				$this->data['product_options'][] = array(
					'product_option_id'    => $product_option['product_option_id'],
					'product_option_value' => $product_option_value_data,
					'option_id'            => $product_option['option_id'],
					'name'                 => $product_option['name'],
					'type'                 => $product_option['type'],
					'required'             => $product_option['required']
				);

			} else {
				$this->data['product_options'][] = array(
					'product_option_id' => $product_option['product_option_id'],
					'option_id'         => $product_option['option_id'],
					'name'              => $product_option['name'],
					'type'              => $product_option['type'],
					'option_value'      => $product_option['option_value'],
					'required'          => $product_option['required']
				);
			}
		}

		$this->data['option_values'] = array();

		foreach ($this->data['product_options'] as $product_option) {
			if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
				if (!isset($this->data['option_values'][$product_option['option_id']])) {
					$this->data['option_values'][$product_option['option_id']] = $this->model_catalog_option->getOptionValues($product_option['option_id']);
				}
			}
		}

		$this->load->model('sale/customer_group');

		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		$this->load->model('catalog/profile');

		$this->data['profiles'] = $this->model_catalog_profile->getProfiles();

		if (isset($this->request->post['product_profiles'])) {
			$this->data['product_profiles'] = $this->request->post['product_profiles'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_profiles'] = $this->model_catalog_product->getProfiles($this->request->get['product_id']);
		} else {
			$this->data['product_profiles'] = array();
		}

		if (isset($this->request->post['product_discount'])) {
			$this->data['product_discounts'] = $this->request->post['product_discount'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_discounts'] = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);
		} else {
			$this->data['product_discounts'] = array();
		}

		if (isset($this->request->post['product_special'])) {
			$this->data['product_specials'] = $this->request->post['product_special'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_specials'] = $this->model_catalog_product->getProductSpecials($this->request->get['product_id']);
		} else {
			$this->data['product_specials'] = array();
		}

		$this->data['reward_rate'] = sprintf($this->language->get('text_reward_rate'), $this->config->get('config_reward_rate'));

		if (isset($this->request->post['points'])) {
			$this->data['points'] = $this->request->post['points'];
		} elseif (!empty($product_info)) {
			$this->data['points'] = $product_info['points'];
		} else {
			$this->data['points'] = '';
		}

		if (isset($this->request->post['product_reward'])) {
			$this->data['product_reward'] = $this->request->post['product_reward'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_reward'] = $this->model_catalog_product->getProductRewards($this->request->get['product_id']);
		} else {
			$this->data['product_reward'] = array();
		}

		// Images
		if (isset($this->request->post['product_image'])) {
			$product_images = $this->request->post['product_image'];
		} elseif (isset($this->request->get['product_id'])) {
			$product_images = $this->model_catalog_product->getProductImages($this->request->get['product_id']);
		} else {
			$product_images = array();
		}

		$this->data['palette_colors'] = array();

		if (isset($product_info['palette_id'])) {
			$palette_colors = $this->model_catalog_palette->getPaletteColorsByPaletteId($product_info['palette_id']);

			foreach ($palette_colors as $palette_color) {
				$this->data['palette_colors'][] = array(
					'palette_color_id' => $palette_color['palette_color_id'],
					'title'            => $palette_color['title'],
					'color'            => $palette_color['color']
				);
			}
		}

		$this->data['product_images'] = array();

		foreach ($product_images as $product_image) {
			if ($product_image['image'] && file_exists(DIR_IMAGE . $product_image['image'])) {
				$image = $product_image['image'];
			} else {
				$image = 'no_image.png';
			}

			if (isset($product_image['palette_color_id']) && isset($product_info['palette_id']) && !empty($palette_colors)) {
				$palette_color_id = $product_image['palette_color_id'];
			} else {
				$palette_color_id = 0;
			}

			$this->data['product_images'][] = array(
				'image'            => $image,
				'thumb'            => $this->model_tool_image->resize($image, 100, 100),
				'palette_color_id' => $palette_color_id,
				'sort_order'       => $product_image['sort_order']
			);
		}

		if (isset($this->request->post['product_layout'])) {
			$this->data['product_layout'] = $this->request->post['product_layout'];
		} elseif (isset($this->request->get['product_id'])) {
			$this->data['product_layout'] = $this->model_catalog_product->getProductLayouts($this->request->get['product_id']);
		} else {
			$this->data['product_layout'] = array();
		}

		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'catalog/product_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	public function updatePrice() {
		$json = array();

		$this->language->load('catalog/product');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$selected = false;
			$products = array();

			if (isset($this->request->post['px_selected'])) {
				$selected = (int)$this->request->post['px_selected'] > 0;

				if ($selected) {
					if (isset($this->request->post['selected']) && is_array($this->request->post['selected'])) {
						foreach ($this->request->post['selected'] as $product_id) {
							if ((int)$product_id > 0) {
								$products[] = (int)$product_id;
							}
						}
					}
				}
			}

			if (isset($this->request->post['px_price'])) {
				$price = $this->request->post['px_price'];
			} else {
				$price = '0.0000';
			}

			if (isset($this->request->post['px_cost'])) {
				$cost = $this->request->post['px_cost'];
			} else {
				$cost = '0.0000';
			}

			if ($this->validatePriceUpdate($selected, $products)) {
				$this->load->model('catalog/product');

				$this->model_catalog_product->updateProductPrice($selected, $products, $price, $cost);

				$json['success'] = $this->language->get('text_price_success');
			}

			$json['error'] = $this->error;

		} else {
			$this->data['text_select_all'] = $this->language->get('text_select_all');
			$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
			$this->data['text_selected_yes'] = $this->language->get('text_selected_yes');
			$this->data['text_selected_no'] = $this->language->get('text_selected_no');

			$this->data['entry_px_selected'] = $this->language->get('entry_px_selected');
			$this->data['entry_px_price'] = $this->language->get('entry_px_price');
			$this->data['entry_px_cost'] = $this->language->get('entry_px_cost');

			$this->data['button_update_price'] = $this->language->get('button_update_price');
			$this->data['button_submit'] = $this->language->get('button_submit');

			$this->data['token'] = $this->session->data['token'];

			$this->template = 'catalog/product_price_form.tpl';

			$json['html'] = $this->render();
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updateQuantity() {
		$json = array();

		$this->language->load('catalog/product');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$selected = false;
			$products = array();

			if (isset($this->request->post['qt_selected'])) {
				$selected = (int)$this->request->post['qt_selected'] > 0;

				if ($selected) {
					if (isset($this->request->post['selected']) && is_array($this->request->post['selected'])) {
						foreach ($this->request->post['selected'] as $product_id) {
							if ((int)$product_id > 0) {
								$products[] = (int)$product_id;
							}
						}
					}
				}
			}

			if (isset($this->request->post['qt_quantity']) && (int)$this->request->post['qt_quantity'] >= 0) {
				$quantity = (int)$this->request->post['qt_quantity'];
			} else {
				$quantity = '0';
			}

			if (isset($this->request->post['qt_minimum']) && (int)$this->request->post['qt_minimum'] >= 0) {
				$minimum = (int)$this->request->post['qt_minimum'];
			} else {
				$minimum = '1';
			}

			if ($this->validateQuantityUpdate($selected, $products)) {
				$this->load->model('catalog/product');

				$this->model_catalog_product->updateProductQuantity($selected, $products, $quantity, $minimum);

				$json['success'] = $this->language->get('text_quantity_success');
			}

			$json['error'] = $this->error;

		} else {
			$this->data['text_select_all'] = $this->language->get('text_select_all');
			$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
			$this->data['text_selected_yes'] = $this->language->get('text_selected_yes');
			$this->data['text_selected_no'] = $this->language->get('text_selected_no');

			$this->data['entry_qt_selected'] = $this->language->get('entry_qt_selected');
			$this->data['entry_qt_quantity'] = $this->language->get('entry_qt_quantity');
			$this->data['entry_qt_minimum'] = $this->language->get('entry_qt_minimum');

			$this->data['button_update_quantity'] = $this->language->get('button_update_quantity');
			$this->data['button_submit'] = $this->language->get('button_submit');

			$this->data['token'] = $this->session->data['token'];

			$this->template = 'catalog/product_quantity_form.tpl';

			$json['html'] = $this->render();
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updateSpecial() {
		$json = array();

		$this->language->load('catalog/product');

		$periods = array(
			'today'     => $this->language->get('text_end_today'),
			'day'       => $this->language->get('text_end_day'),
			'week'      => $this->language->get('text_end_week'),
			'month'     => $this->language->get('text_end_month'),
			'undefined' => $this->language->get('text_end_undefined')
		);

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$selected = false;
			$append = false;
			$date_start = date('Y-m-d');
			$date_end = '';
			$customer_group = $this->config->get('config_customer_group_id');
			$discount = 0;
			$products = array();

			if (isset($this->request->post['sp_selected'])) {
				$selected = (int)$this->request->post['sp_selected'] > 0;

				if ($selected) {
					if (isset($this->request->post['selected']) && is_array($this->request->post['selected'])) {
						foreach ($this->request->post['selected'] as $product_id) {
							if ((int)$product_id > 0) {
								$products[] = (int)$product_id;
							}
						}
					}
				}
			}

			if (isset($this->request->post['sp_append'])) {
				$append = (int)$this->request->post['sp_append'] > 0;
			}

			if (isset($this->request->post['sp_customer_group']) && (int)$this->request->post['sp_customer_group'] > 0) {
				$customer_group = (int)$this->request->post['sp_customer_group'];
			}

			if (isset($this->request->post['sp_period']) && array_key_exists($this->request->post['sp_period'], $periods)) {
				$period = $this->request->post['sp_period'];

				if ($period == 'today') {
					$date_end = date('Y-m-d');
				} elseif ($period == 'day') {
					$date_end = date('Y-m-d', strtotime('+1 day'));
				} elseif ($period == 'week') {
					$date_end = date('Y-m-d', strtotime('+1 week'));
				} elseif ($period == 'month') {
					$date_end = date('Y-m-d', strtotime('+1 month'));
				} elseif ($period == 'undefined') {
					$date_end = '0000-00-00';
				} else {
					$date_end = '0000-00-00';
				}
			}

			if (isset($this->request->post['sp_discount']) && (int)$this->request->post['sp_discount'] > 0 && (int)$this->request->post['sp_discount'] <= 100) {
				$discount = (int)$this->request->post['sp_discount'];
			}

			if ($this->validateSpecialUpdate($selected, $products)) {
				$this->load->model('catalog/product');

				$this->model_catalog_product->updateProductSpecial($selected, $append, $products, $customer_group, $date_start, $date_end, $discount);

				$json['success'] = $this->language->get('text_special_success');
			}

			$json['error'] = $this->error;

		} else {
			$this->load->model('sale/customer_group');

			$this->data['text_select_all'] = $this->language->get('text_select_all');
			$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
			$this->data['text_selected_yes'] = $this->language->get('text_selected_yes');
			$this->data['text_selected_no'] = $this->language->get('text_selected_no');
			$this->data['text_append_yes'] = $this->language->get('text_append_yes');
			$this->data['text_append_no'] = $this->language->get('text_append_no');

			$this->data['entry_sp_selected'] = $this->language->get('entry_sp_selected');
			$this->data['entry_sp_append'] = $this->language->get('entry_sp_append');
			$this->data['entry_sp_customer_group'] = $this->language->get('entry_sp_customer_group');
			$this->data['entry_sp_period'] = $this->language->get('entry_sp_period');
			$this->data['entry_sp_discount'] = $this->language->get('entry_sp_discount');

			$this->data['button_update_special'] = $this->language->get('button_update_special');
			$this->data['button_submit'] = $this->language->get('button_submit');

			$this->data['periods'] = $periods;

			$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

			$this->data['default_customer_group'] = $this->config->get('config_customer_group_id');

			$this->data['token'] = $this->session->data['token'];

			$this->template = 'catalog/product_special_form.tpl';

			$json['html'] = $this->render();
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function updateDiscount() {
		$json = array();

		$this->language->load('catalog/product');

		$periods = array(
			'today'     => $this->language->get('text_end_today'),
			'day'       => $this->language->get('text_end_day'),
			'week'      => $this->language->get('text_end_week'),
			'month'     => $this->language->get('text_end_month'),
			'undefined' => $this->language->get('text_end_undefined')
		);

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$selected = false;
			$append = false;
			$date_start = date('Y-m-d');
			$date_end = '';
			$customer_group = $this->config->get('config_customer_group_id');
			$discount = 0;
			$products = array();

			if (isset($this->request->post['di_selected'])) {
				$selected = (int)$this->request->post['di_selected'] > 0;

				if ($selected) {
					if (isset($this->request->post['selected']) && is_array($this->request->post['selected'])) {
						foreach ($this->request->post['selected'] as $product_id) {
							if ((int)$product_id > 0) {
								$products[] = (int)$product_id;
							}
						}
					}
				}
			}

			if (isset($this->request->post['di_append'])) {
				$append = (int)$this->request->post['di_append'] > 0;
			}

			if (isset($this->request->post['di_customer_group']) && (int)$this->request->post['di_customer_group'] > 0) {
				$customer_group = (int)$this->request->post['di_customer_group'];
			}

			if (isset($this->request->post['di_period']) && array_key_exists($this->request->post['di_period'], $periods)) {
				$period = $this->request->post['di_period'];

				if ($period == 'today') {
					$date_end = date('Y-m-d');
				} elseif ($period == 'day') {
					$date_end = date('Y-m-d', strtotime('+1 day'));
				} elseif ($period == 'week') {
					$date_end = date('Y-m-d', strtotime('+1 week'));
				} elseif ($period == 'month') {
					$date_end = date('Y-m-d', strtotime('+1 month'));
				} elseif ($period == 'undefined') {
					$date_end = '0000-00-00';
				} else {
					$date_end = '0000-00-00';
				}
			}

			if (isset($this->request->post['di_quantity']) && (int)$this->request->post['di_quantity'] >= 0) {
				$quantity = (int)$this->request->post['di_quantity'];
			} else {
				$quantity = '0';
			}

			if (isset($this->request->post['di_discount']) && (int)$this->request->post['di_discount'] > 0 && (int)$this->request->post['di_discount'] <= 100) {
				$discount = (int)$this->request->post['di_discount'];
			}

			if ($this->validateSpecialUpdate($selected, $products)) {
				$this->load->model('catalog/product');

				$this->model_catalog_product->updateProductDiscount($selected, $append, $products, $customer_group, $quantity, $date_start, $date_end, $discount);

				$json['success'] = $this->language->get('text_discount_success');
			}

			$json['error'] = $this->error;

		} else {
			$this->load->model('sale/customer_group');

			$this->data['text_select_all'] = $this->language->get('text_select_all');
			$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');
			$this->data['text_selected_yes'] = $this->language->get('text_selected_yes');
			$this->data['text_selected_no'] = $this->language->get('text_selected_no');
			$this->data['text_append_yes'] = $this->language->get('text_append_yes');
			$this->data['text_append_no'] = $this->language->get('text_append_no');

			$this->data['entry_di_selected'] = $this->language->get('entry_di_selected');
			$this->data['entry_di_append'] = $this->language->get('entry_di_append');
			$this->data['entry_di_customer_group'] = $this->language->get('entry_di_customer_group');
			$this->data['entry_di_period'] = $this->language->get('entry_di_period');
			$this->data['entry_di_quantity'] = $this->language->get('entry_di_quantity');
			$this->data['entry_di_discount'] = $this->language->get('entry_di_discount');

			$this->data['button_update_discount'] = $this->language->get('button_update_discount');
			$this->data['button_submit'] = $this->language->get('button_submit');

			$this->data['periods'] = $periods;

			$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

			$this->data['default_customer_group'] = $this->config->get('config_customer_group_id');

			$this->data['token'] = $this->session->data['token'];

			$this->template = 'catalog/product_discount_form.tpl';

			$json['html'] = $this->render();
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['product_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}

		if ((utf8_strlen($this->request->post['model']) < 1) || (utf8_strlen($this->request->post['model']) > 64)) {
			$this->error['model'] = $this->language->get('error_model');
		}

		$allowed = array('jpg','jpeg','png','gif');

		if ($this->request->post['image']) {
			$ext = utf8_substr(strrchr($this->request->post['image'], '.'), 1);

			if (!in_array(strtolower($ext), $allowed)) {
				$this->error['image'] = $this->language->get('error_image_format');
			}
		}

		if ($this->request->post['label']) {
			$ext = utf8_substr(strrchr($this->request->post['label'], '.'), 1);

			if (!in_array(strtolower($ext), $allowed)) {
				$this->error['label'] = $this->language->get('error_image_format');
			}
		}

		if (isset($this->request->post['product_image'])) {
			foreach ($this->request->post['product_image'] as $product_image_id => $product_image) {
				if ($product_image['image']) {
					$extension = utf8_substr(strrchr($product_image['image'], '.'), 1);

					if (!in_array(strtolower($extension), $allowed)) {
						$this->error['product_image'][$product_image_id] = $this->language->get('error_image_format');
					}

				} else {
					$this->error['product_image'][$product_image_id] = $this->language->get('error_image');
				}
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return empty($this->error);
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return empty($this->error);
	}

	protected function validateCopy() {
		if (!$this->user->hasPermission('modify', 'catalog/product')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return empty($this->error);
	}

	protected function validatePriceUpdate($selected, $products = array()) {
		if (!$this->user->hasPermission('modify', 'catalog/product')) {
			$this->error[] = $this->language->get('error_permission');
		}

		if ($selected && empty($products)) {
			$this->error[] = $this->language->get('error_selected');
		}

		if (empty($this->request->post['px_price']) || $this->request->post['px_price'] < 0) {
			$this->error[] = $this->language->get('error_price');
		}

		return empty($this->error);
	}

	protected function validateQuantityUpdate($selected, $products = array()) {
		if (!$this->user->hasPermission('modify', 'catalog/product')) {
			$this->error[] = $this->language->get('error_permission');
		}

		if ($selected && empty($products)) {
			$this->error[] = $this->language->get('error_selected');
		}

		if (empty($this->request->post['qt_quantity']) || $this->request->post['qt_quantity'] < 0) {
			$this->error[] = $this->language->get('error_quantity');
		}

		return empty($this->error);
	}

	protected function validateSpecialUpdate($selected, $products = array()) {
		if (!$this->user->hasPermission('modify', 'catalog/product')) {
			$this->error[] = $this->language->get('error_permission');
		}

		if ($selected && empty($products)) {
			$this->error[] = $this->language->get('error_selected');
		}

		return empty($this->error);
	}

	protected function validateDiscountUpdate($selected, $products = array()) {
		if (!$this->user->hasPermission('modify', 'catalog/product')) {
			$this->error[] = $this->language->get('error_permission');
		}

		if ($selected && empty($products)) {
			$this->error[] = $this->language->get('error_selected');
		}

		return empty($this->error);
	}

	public function enable() {
		$this->language->load('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product');

		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $product_id) {
				$this->model_catalog_product->editProductStatus($product_id, 1);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function disable() {
		$this->language->load('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/product');

		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $product_id) {
				$this->model_catalog_product->editProductStatus($product_id, 0);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}

			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	// Category - Autocomplete Off
	public function category() {
		$json = array();

		$this->load->model('catalog/product');

		if (isset($this->request->get['category_id'])) {
			$category_id = $this->request->get['category_id'];
		} else {
			$category_id = 0;
		}

		$results = $this->model_catalog_product->getProductsByCategoryId($category_id);

		foreach ($results as $result) {
			$json[] = array(
				'product_id' => $result['product_id'],
				'name'       => $result['name'],
				'model'      => $result['model']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	// Filter - Autocomplete Off
	public function filter() {
		$json = array();

		$this->load->model('catalog/product');

		if (isset($this->request->post['product_filter'])) {
			$products = $this->request->post['product_filter'];
		} else {
			$products = array();
		}

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$json[] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name'],
					'model'      => $product_info['model']
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	// Download - Autocomplete Off
	public function download() {
		$json = array();

		$this->load->model('catalog/product');

		if (isset($this->request->post['product_download'])) {
			$products = $this->request->post['product_download'];
		} else {
			$products = array();
		}

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$json[] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name'],
					'model'      => $product_info['model']
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	// Related - Autocomplete Off
	public function related() {
		$json = array();

		$this->load->model('catalog/product');

		if (isset($this->request->post['product_related'])) {
			$products = $this->request->post['product_related'];
		} else {
			$products = array();
		}

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$json[] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name'],
					'model'      => $product_info['model']
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model']) || isset($this->request->get['filter_category_id'])) {
			$this->load->model('catalog/product');
			$this->load->model('catalog/option');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
			} else {
				$filter_model = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = 20;
			}

			$data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit
			);

			$results = $this->model_catalog_product->getProducts($data);

			foreach ($results as $result) {
				$option_data = array();

				$product_options = $this->model_catalog_product->getProductOptions($result['product_id']);

				foreach ($product_options as $product_option) {
					$option_info = $this->model_catalog_option->getOption($product_option['option_id']);

					if ($option_info) {
						if ($option_info['type'] == 'select' || $option_info['type'] == 'radio' || $option_info['type'] == 'checkbox' || $option_info['type'] == 'image') {
							$option_value_data = array();

							foreach ($product_option['product_option_value'] as $product_option_value) {
								$option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);

								if ($option_value_info) {
									$option_value_data[] = array(
										'product_option_value_id' => $product_option_value['product_option_value_id'],
										'option_value_id'         => $product_option_value['option_value_id'],
										'name'                    => $option_value_info['name'],
										'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
										'price_prefix'            => $product_option_value['price_prefix']
									);
								}
							}

							$option_data[] = array(
								'product_option_id' => $product_option['product_option_id'],
								'option_id'         => $product_option['option_id'],
								'name'              => $option_info['name'],
								'type'              => $option_info['type'],
								'option_value'      => $option_value_data,
								'required'          => $product_option['required']
							);

						} else {
							$option_data[] = array(
								'product_option_id' => $product_option['product_option_id'],
								'option_id'         => $product_option['option_id'],
								'name'              => $option_info['name'],
								'type'              => $option_info['type'],
								'option_value'      => $product_option['option_value'],
								'required'          => $product_option['required']
							);
						}
					}
				}

				$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
