<?php
class ControllerStep2 extends Controller {
	private $error = array();

	public function index() {
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->response->redirect($this->url->link('step_3', '', 'SSL'));
		}

		$this->document->setTitle($this->language->get('heading_step_2'));

		$this->data['heading_step_2'] = $this->language->get('heading_step_2');

		$this->data['text_install_php'] = $this->language->get('text_install_php');
		$this->data['text_install_extension'] = $this->language->get('text_install_extension');
		$this->data['text_install_file'] = $this->language->get('text_install_file');
		$this->data['text_install_directory'] = $this->language->get('text_install_directory');
		$this->data['text_setting'] = $this->language->get('text_setting');
		$this->data['text_current'] = $this->language->get('text_current');
		$this->data['text_required'] = $this->language->get('text_required');
		$this->data['text_extension'] = $this->language->get('text_extension');
		$this->data['text_file'] = $this->language->get('text_file');
		$this->data['text_directory'] = $this->language->get('text_directory');
		$this->data['text_status'] = $this->language->get('text_status');
		$this->data['text_on'] = $this->language->get('text_on');
		$this->data['text_off'] = $this->language->get('text_off');
		$this->data['text_missing'] = $this->language->get('text_missing');
		$this->data['text_writable'] = $this->language->get('text_writable');
		$this->data['text_unwritable'] = $this->language->get('text_unwritable');
		$this->data['text_version'] = $this->language->get('text_version');
		$this->data['text_global'] = $this->language->get('text_global');
		$this->data['text_magic'] = $this->language->get('text_magic');
		$this->data['text_file_upload'] = $this->language->get('text_file_upload');
		$this->data['text_session'] = $this->language->get('text_session');
		$this->data['text_global'] = $this->language->get('text_global');
		$this->data['text_db'] = $this->language->get('text_db');
		$this->data['text_mysqli'] = $this->language->get('text_mysqli');
		$this->data['text_mpdo'] = $this->language->get('text_mpdo');
		$this->data['text_pgsql'] = $this->language->get('text_pgsql');
		$this->data['text_gd'] = $this->language->get('text_gd');
		$this->data['text_curl'] = $this->language->get('text_curl');
		$this->data['text_dom'] = $this->language->get('text_dom');
		$this->data['text_xml'] = $this->language->get('text_xml');
		$this->data['text_mcrypt'] = $this->language->get('text_mcrypt');
		$this->data['text_openssl'] = $this->language->get('text_openssl');
		$this->data['text_zlib'] = $this->language->get('text_zlib');
		$this->data['text_zip'] = $this->language->get('text_zip');
		$this->data['text_mbstring'] = $this->language->get('text_mbstring');

		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_back'] = $this->language->get('button_back');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['action'] = $this->url->link('step_2');

		$this->data['php_version'] = phpversion();
		$this->data['register_globals'] = ini_get('register_globals');
		$this->data['magic_quotes_gpc'] = ini_get('magic_quotes_gpc');
		$this->data['file_uploads'] = ini_get('file_uploads');
		$this->data['session_auto_start'] = ini_get('session_auto_start');

		if (!array_filter(array('mysqli', 'pdo', 'pgsql'), 'extension_loaded')) {
			$this->data['db'] = false;
		} else {
			$this->data['db'] = true;
		}

		$this->data['gd'] = extension_loaded('gd');
		$this->data['curl'] = extension_loaded('curl');
		$this->data['dom'] = extension_loaded('dom');
		$this->data['xml'] = extension_loaded('xml');
		$this->data['mcrypt_encrypt'] = function_exists('mcrypt_encrypt');
		$this->data['openssl_encrypt'] = function_exists('openssl_encrypt');
		$this->data['zlib'] = extension_loaded('zlib');
		$this->data['zip'] = extension_loaded('zip');
		$this->data['iconv'] = function_exists('iconv');
		$this->data['mbstring'] = extension_loaded('mbstring');

		$this->data['config_catalog'] = DIR_NIVOCART . 'config.php';
		$this->data['config_admin'] = DIR_NIVOCART . 'admin/config.php';

		$this->data['cache'] = DIR_SYSTEM . 'cache';
		$this->data['logs'] = DIR_SYSTEM . 'logs';
		$this->data['upload'] = DIR_SYSTEM . 'upload';
		$this->data['download'] = DIR_NIVOCART . 'download';
		$this->data['image'] = DIR_NIVOCART . 'image';
		$this->data['image_cache'] = DIR_NIVOCART . 'image/cache';
		$this->data['image_data'] = DIR_NIVOCART . 'image/data';
		$this->data['vqmod'] = DIR_NIVOCART . 'vqmod';
		$this->data['vqmod_xml'] = DIR_NIVOCART . 'vqmod/xml';

		$this->data['back'] = $this->url->link('step_1', '', 'SSL');

		$this->template = 'step_2.tpl';
		$this->children = array(
			'header',
			'footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		$php_version = phpversion();

		if (version_compare($php_version, '7.0', '<')) {
			$this->error['warning'] = $this->language->get('error_php_version');
		}

		if (!ini_get('file_uploads')) {
			$this->error['warning'] = $this->language->get('error_php_uploads');
		}

		if (ini_get('session.auto_start')) {
			$this->error['warning'] = $this->language->get('error_php_session');
		}

		if (!array_filter(array('mysqli', 'pdo', 'pgsql'), 'extension_loaded')) {
			$this->error['warning'] = $this->language->get('error_php_extension');
		}

		if (!extension_loaded('gd')) {
			$this->error['warning'] = $this->language->get('error_php_gd');
		}

		if (!extension_loaded('curl')) {
			$this->error['warning'] = $this->language->get('error_php_curl');
		}

		if (!extension_loaded('dom')) {
			$this->error['warning'] = $this->language->get('error_php_dom');
		}

		if (!extension_loaded('xml')) {
			$this->error['warning'] = $this->language->get('error_php_xml');
		}

		if ($php_version >= '7.1') {
			if (!function_exists('openssl_encrypt')) {
				$this->error['warning'] = $this->language->get('error_php_openssl');
			}
		} else {
			if (!function_exists('mcrypt_encrypt')) {
				$this->error['warning'] = $this->language->get('error_php_mcrypt');
			}
		}

		if (!extension_loaded('zlib')) {
			$this->error['warning'] = $this->language->get('error_php_zlib');
		}

		if (!extension_loaded('zip')) {
			$this->error['warning'] = $this->language->get('error_php_zip');
		}

		if (!function_exists('iconv')) {
			if (!extension_loaded('mbstring')) {
				$this->error['warning'] = $this->language->get('error_php_mbstring');
			}
		}

		if (!file_exists(DIR_NIVOCART . 'config.php')) {
			$this->error['warning'] = $this->language->get('error_config_rename');
		} elseif (!is_writable(DIR_NIVOCART . 'config.php')) {
			$this->error['warning'] = $this->language->get('error_config_write');
		}

		if (!file_exists(DIR_NIVOCART . 'admin/config.php')) {
			$this->error['warning'] = $this->language->get('error_config_rename');
		} elseif (!is_writable(DIR_NIVOCART . 'admin/config.php')) {
			$this->error['warning'] = $this->language->get('error_config_write');
		}

		if (!is_writable(DIR_SYSTEM . 'cache')) {
			$this->error['warning'] = $this->language->get('error_cache_write');
		}

		if (!is_writable(DIR_SYSTEM . 'logs')) {
			$this->error['warning'] = $this->language->get('error_logs_write');
		}

		if (!is_writable(DIR_SYSTEM . 'upload')) {
			$this->error['warning'] = $this->language->get('error_upload_write');
		}

		if (!is_writable(DIR_NIVOCART . 'download')) {
			$this->error['warning'] = $this->language->get('error_download_write');
		}

		if (!is_writable(DIR_NIVOCART . 'image')) {
			$this->error['warning'] = $this->language->get('error_image_write');
		}

		if (!is_writable(DIR_NIVOCART . 'image/cache')) {
			$this->error['warning'] = $this->language->get('error_imagecache_write');
		}

		if (!is_writable(DIR_NIVOCART . 'image/data')) {
			$this->error['warning'] = $this->language->get('error_imagedata_write');
		}

		clearstatcache();

		return empty($this->error);
	}
}
