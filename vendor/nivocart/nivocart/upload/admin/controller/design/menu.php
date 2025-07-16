<?php
class ControllerDesignMenu extends Controller {
	private $error = array();
	private $_name = 'menu';

	public function index() {
		$this->language->load('design/' . $this->_name);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/menu');

		$this->getList();
	}

	public function insert() {
		$this->language->load('design/' . $this->_name);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/menu');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$menu_id = $this->model_design_menu->addMenu($this->request->post);

			$this->session->data['success'] = $this->language->get('text_insert_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->post['apply'])) {
				$menu_id = $this->session->data['new_menu_id'];

				if ($menu_id) {
					unset($this->session->data['new_menu_id']);

					$this->redirect($this->url->link('design/menu/update', 'token=' . $this->session->data['token'] . '&menu_id=' . $menu_id . $url, 'SSL'));
				}

			} else {
				$this->redirect($this->url->link('design/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('design/' . $this->_name);

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('design/menu');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_design_menu->editMenu($this->request->get['menu_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_update_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->post['apply'])) {
				$menu_id = $this->request->get['menu_id'];

				if ($menu_id) {
					$this->redirect($this->url->link('design/menu/update', 'token=' . $this->session->data['token'] . '&menu_id=' . $menu_id . $url, 'SSL'));
				}

			} else {
				$this->redirect($this->url->link('design/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('design/' . $this->_name);

		$this->load->model('design/menu');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $menu_id) {
				$this->model_design_menu->deleteMenu($menu_id);
			}

			$this->session->data['success'] = $this->language->get('text_delete_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('design/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

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
			'href'      => $this->url->link('design/menu', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		$this->data['module_vertical'] = $this->url->link('module/menu_vertical', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['module_horizontal'] = $this->url->link('module/menu_horizontal', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['insert'] = $this->url->link('design/menu/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('design/menu/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		// Pagination
		$this->data['navigation_hi'] = $this->config->get('config_pagination_hi');
		$this->data['navigation_lo'] = $this->config->get('config_pagination_lo');

		$this->data['menus'] = array();

		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$this->load->model('design/menu_items');

		$menu_total = $this->model_design_menu->getTotalMenus();

		$menu_data = $this->model_design_menu->getMenus($data);

		if ($menu_data) {
			foreach ($menu_data as $result) {
				$action = array();

				$action[] = array(
					'text' => $this->language->get('text_menu_edit'),
					'href' => $this->url->link('design/menu/update', 'token=' . $this->session->data['token'] . '&menu_id=' . $result['menu_id'] . $url, 'SSL')
				);

				$count_menu_item = $this->model_design_menu_items->getTotalMenuItems($result['menu_id'], $data);

				$menu_item_add = '<a href="' . $this->url->link('design/menu_items/insert', 'token=' . $this->session->data['token'] . '&menu_id=' . $result['menu_id'] . $url, 'SSL') . '" class="button-save ripple">' . $this->language->get('text_menu_item_add') . '</a>';
				$menu_item_view = $count_menu_item ? '<a href="' . $this->url->link('design/menu_items', 'token=' . $this->session->data['token'] . '&menu_id=' . $result['menu_id'] . $url, 'SSL') . '" class="button ripple">' . $this->language->get('text_menu_item_view') . '</a>' : '';

				$this->data['menus'][] = array(
					'menu_id'        => $result['menu_id'],
					'title'          => $result['title'],
					'menu_items'     => $count_menu_item,
					'selected'       => isset($this->request->post['selected']) && in_array($result['menu_id'], $this->request->post['selected']),
					'status'         => $result['status'],
					'menu_item_add'  => $menu_item_add,
					'menu_item_view' => $menu_item_view,
					'action'         => $action
				);
			}
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_menu_items'] = $this->language->get('text_menu_items');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_confirm'] = $this->language->get('text_confirm');
		$this->data['text_menu_info'] = $this->language->get('text_menu_info');
		$this->data['text_confirm_delete'] = $this->language->get('text_confirm_delete');

		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_menu_items'] = $this->language->get('column_menu_items');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_vertical'] = $this->language->get('button_vertical');
		$this->data['button_horizontal'] = $this->language->get('button_horizontal');
		$this->data['button_info'] = $this->language->get('button_info');

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

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$pagination = new Pagination();
		$pagination->total = $menu_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('design/menu', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->template = 'design/menu_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_select_all'] = $this->language->get('text_select_all');
		$this->data['text_unselect_all'] = $this->language->get('text_unselect_all');

		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_status'] = $this->language->get('entry_status');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_apply'] = $this->language->get('button_apply');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('design/menu', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['menu_id'])) {
			$this->data['action'] = $this->url->link('design/menu/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('design/menu/update', 'token=' . $this->session->data['token'] . '&menu_id=' . $this->request->get['menu_id'], 'SSL');
		}

		$this->data['cancel'] = $this->url->link('design/menu', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['menu_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$menu_info = $this->model_design_menu->getMenu($this->request->get['menu_id']);
		}

		if (isset($this->request->post['title'])) {
			$this->data['title'] = $this->request->post['title'];
		} elseif (!empty($menu_info)) {
			$this->data['title'] = $menu_info['title'];
		} else {
			$this->data['title'] = '';
		}

		$this->load->model('setting/store');

		$this->data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['menu_store'])) {
			$this->data['menu_store'] = $this->request->post['menu_store'];
		} elseif (isset($this->request->get['menu_id'])) {
			$this->data['menu_store'] = $this->model_design_menu->getMenuStores($this->request->get['menu_id']);
		} else {
			$this->data['menu_store'] = array(0);
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($menu_info)) {
			$this->data['status'] = $menu_info['status'];
		} else {
			$this->data['status'] = 1;
		}

		$this->template = 'design/menu_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'design/menu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['title']) < 2) || (utf8_strlen($this->request->post['title']) > 32)) {
			$this->error['title'] = $this->language->get('error_title');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return empty($this->error);
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'design/menu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return empty($this->error);
	}
}
