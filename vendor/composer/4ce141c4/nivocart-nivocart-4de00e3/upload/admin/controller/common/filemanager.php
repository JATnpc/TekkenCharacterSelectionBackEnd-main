<?php
class ControllerCommonFileManager extends Controller {

	public function index() {
		$this->language->load('common/filemanager');

		$this->data['title'] = $this->language->get('heading_title');

		if ((isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) || ($this->request->server['HTTPS'] == '443')) {
			$this->data['base'] = HTTPS_SERVER;
			$this->data['directory'] = HTTPS_IMAGE . 'data/';
		} elseif (isset($this->request->server['HTTP_X_FORWARDED_PROTO']) && $this->request->server['HTTP_X_FORWARDED_PROTO'] == 'https') {
			$this->data['base'] = HTTPS_SERVER;
			$this->data['directory'] = HTTPS_IMAGE . 'data/';
		} else {
			$this->data['base'] = HTTP_SERVER;
			$this->data['directory'] = HTTP_IMAGE . 'data/';
		}

		$this->data['heading_info'] = $this->language->get('heading_info');

		$this->data['entry_folder'] = $this->language->get('entry_folder');
		$this->data['entry_move'] = $this->language->get('entry_move');
		$this->data['entry_copy'] = $this->language->get('entry_copy');
		$this->data['entry_rename'] = $this->language->get('entry_rename');

		$this->data['button_folder'] = $this->language->get('button_folder');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_move'] = $this->language->get('button_move');
		$this->data['button_copy'] = $this->language->get('button_copy');
		$this->data['button_rename'] = $this->language->get('button_rename');
		$this->data['button_upload'] = $this->language->get('button_upload');
		$this->data['button_refresh'] = $this->language->get('button_refresh');
		$this->data['button_info'] = $this->language->get('button_info');
		$this->data['button_submit'] = $this->language->get('button_submit');
		$this->data['button_expand'] = $this->language->get('button_expand');
		$this->data['button_collapse'] = $this->language->get('button_collapse');
		$this->data['button_view_text'] = $this->language->get('button_view_text');
		$this->data['button_view_list'] = $this->language->get('button_view_list');
		$this->data['button_view_thumb'] = $this->language->get('button_view_thumb');

		$this->data['text_loading'] = $this->language->get('text_loading');
		$this->data['text_no_file_found'] = $this->language->get('text_no_file_found');
		$this->data['text_confirm'] = $this->language->get('text_confirm');
		$this->data['text_folder_delete'] = $this->language->get('text_folder_delete');
		$this->data['text_folder_action'] = $this->language->get('text_folder_action');
		$this->data['text_folder_content'] = $this->language->get('text_folder_content');
		$this->data['text_file_delete'] = $this->language->get('text_file_delete');
		$this->data['text_file_action'] = $this->language->get('text_file_action');
		$this->data['text_no_image']	= $this->language->get('text_no_image');
		$this->data['text_select_image'] = $this->language->get('text_select_image');
		$this->data['text_update_image'] = $this->language->get('text_update_image');
		$this->data['text_yes_execute']= $this->language->get('text_yes_execute');
		$this->data['text_yes_delete'] = $this->language->get('text_yes_delete');
		$this->data['text_no_cancel'] = $this->language->get('text_no_cancel');
		$this->data['text_upload_plus'] = $this->language->get('text_upload_plus');
		$this->data['text_no_selection'] = $this->language->get('text_no_selection');
		$this->data['text_allowed'] = $this->language->get('text_allowed');

		$this->data['error_directory'] = $this->language->get('error_directory');

		$this->data['token'] = $this->session->data['token'];

		$this->load->model('tool/image');

		$this->data['no_image'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->get['field'])) {
			$this->data['field'] = $this->request->get['field'];
		} else {
			$this->data['field'] = '';
		}

		if (isset($this->request->get['CKEditorFuncNum'])) {
			$this->data['fckeditor'] = $this->request->get['CKEditorFuncNum'];
		} else {
			$this->data['fckeditor'] = false;
		}

		$this->template = 'common/filemanager.tpl';

		$this->response->setOutput($this->render());
	}

	public function image($filename = '') {
		$this->load->model('tool/image');

		$this->data['token'] = $this->session->data['token'];

		$return = true;

		if (!empty($this->request->get['image'])) {
			$filename = $this->request->get['image'];
			$return = false;
		}

		if (strpos($filename, 'data/') == false) {
			$filename = 'data/' . $filename;
		}

		$filename = str_replace('//', '/', $filename);
		$filename = str_replace('data/data', 'data', $filename);

		$ext = utf8_substr(strrchr($filename, '.'), 1);

		$file_images = array('mp3','mp4','oga','ogv','ogg','webm','m4a','m4v','wav','wma','wmv','zip','rar','pdf','swf','flv');

		if (in_array(strtolower($ext), $file_images)) {
			$filename = strtolower($ext) . '.png';
		}

		if ($return) {
			return htmlspecialchars($this->model_tool_image->resize(html_entity_decode($filename, ENT_QUOTES, 'UTF-8'), 100, 100), ENT_QUOTES, 'UTF-8');
		} else {
			$this->response->setOutput(htmlspecialchars($this->model_tool_image->resize(html_entity_decode($filename, ENT_QUOTES, 'UTF-8'), 120, 120), ENT_QUOTES, 'UTF-8'));
		}
	}

	public function directory() {
		$json = array();

		if (isset($this->request->post['directory'])) {
			$directories = glob(rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['directory'], ENT_QUOTES, 'UTF-8')), '/') . '/*', GLOB_ONLYDIR);

			if ($directories) {
				$i = 0;

				foreach ($directories as $directory) {
					$json[$i]['data'] = htmlspecialchars(basename($directory), ENT_QUOTES, 'UTF-8');
					$json[$i]['attributes']['directory'] = htmlspecialchars(utf8_substr($directory, strlen(DIR_IMAGE . 'data/')), ENT_QUOTES, 'UTF-8');

					$children = glob(rtrim($directory, '/') . '/*', GLOB_ONLYDIR);

					if ($children) {
						$json[$i]['children'] = ' ';
					}

					$i++;
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function files() {
		$this->data['token'] = $this->session->data['token'];

		$json = array();

		if (!empty($this->request->post['directory'])) {
			$directory = DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['directory'], ENT_QUOTES, 'UTF-8'));
		} else {
			$directory = DIR_IMAGE . 'data/';
		}

		$allowed = array('jpg','jpeg','png','gif','mp3','mp4','oga','ogv','ogg','webm','m4a','m4v','wav','wma','wmv','zip','rar','pdf','swf','flv');

		$files = glob(rtrim($directory, '/') . '/*');

		if ($files) {
			foreach ($files as $file) {
				if (is_file($file)) {
					$ext = utf8_substr(strrchr($file, '.'), 1);
				} else {
					$ext = '';
				}

				if (in_array(strtolower($ext), $allowed)) {
					$size = filesize($file);

					$i = 0;

					$suffix = array('B','KB','MB','GB','TB','PB','EB','ZB','YB');

					while (($size / 1024) > 1) {
						$size = $size / 1024;
						$i++;
					}

					$filename_path_data = htmlspecialchars(utf8_substr($file, utf8_strlen(DIR_IMAGE . 'data/')), ENT_QUOTES, 'UTF-8');

					$json[] = array(
						'filename' => htmlspecialchars(basename($file), ENT_QUOTES, 'UTF-8'),
						'file'     => $filename_path_data,
						'size'     => round(utf8_substr($size, 0, utf8_strpos($size, '.') + 4), 2) . $suffix[$i],
						'image'    => $this->image($filename_path_data)
					);
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function create() {
		$this->language->load('common/filemanager');

		$json = array();

		if (isset($this->request->post['directory'])) {
			if (isset($this->request->post['name']) || $this->request->post['name']) {
				$directory = rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['directory'], ENT_QUOTES, 'UTF-8')), '/');

				if (!is_dir($directory)) {
					$json['error'] = $this->language->get('error_directory');
				}

				if (file_exists($directory . '/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8')))) {
					$json['error'] = $this->language->get('error_exists');
				}

			} else {
				$json['error'] = $this->language->get('error_name');
			}

		} else {
			$json['error'] = $this->language->get('error_directory');
		}

		if (!$this->user->hasPermission('modify', 'common/filemanager')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!isset($json['error'])) {
			mkdir($directory . '/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8')), 0777);

			$json['success'] = $this->language->get('text_create');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete() {
		$this->language->load('common/filemanager');

		$json = array();

		if (isset($this->request->post['path'])) {
			$path = rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['path'], ENT_QUOTES, 'UTF-8')), '/');

			if (!file_exists($path)) {
				$json['error'] = $this->language->get('error_select');
			}

			if ($path == rtrim(DIR_IMAGE . 'data/', '/')) {
				$json['error'] = $this->language->get('error_delete');
			}

		} else {
			$json['error'] = $this->language->get('error_select');
		}

		if (!$this->user->hasPermission('modify', 'common/filemanager')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!isset($json['error'])) {
			if (is_file($path)) {
				unlink($path);
			} elseif (is_dir($path)) {
				$this->recursiveDelete($path);
			}

			$json['success'] = $this->language->get('text_delete');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function recursiveDelete($directory) {
		if (is_dir($directory)) {
			$handle = opendir($directory);
		}

		if (!$handle) {
			return false;
		}

		while (false !== ($file = readdir($handle))) {
			if ($file != '.' && $file != '..') {
				if (!is_dir($directory . '/' . $file)) {
					unlink($directory . '/' . $file);
				} else {
					$this->recursiveDelete($directory . '/' . $file);
				}
			}
		}

		closedir($handle);

		rmdir($directory);

		return true;
	}

	public function move() {
		$this->language->load('common/filemanager');

		$json = array();

		if (isset($this->request->post['from']) && isset($this->request->post['to'])) {
			$from = rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['from'], ENT_QUOTES, 'UTF-8')), '/');

			if (!file_exists($from)) {
				$json['error'] = $this->language->get('error_missing');
			}

			if ($from == DIR_IMAGE . 'data') {
				$json['error'] = $this->language->get('error_default');
			}

			$to = rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['to'], ENT_QUOTES, 'UTF-8')), '/');

			if (!file_exists($to)) {
				$json['error'] = $this->language->get('error_move');
			}

			if (file_exists($to . '/' . basename($from))) {
				$json['error'] = $this->language->get('error_exists');
			}

		} else {
			$json['error'] = $this->language->get('error_directory');
		}

		if (!$this->user->hasPermission('modify', 'common/filemanager')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!isset($json['error'])) {
			rename($from, $to . '/' . basename($from));

			$json['success'] = $this->language->get('text_move');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function copy() {
		$this->language->load('common/filemanager');

		$json = array();

		if (isset($this->request->post['path']) && isset($this->request->post['name'])) {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 255)) {
				$json['error'] = $this->language->get('error_filename');
			}

			$old_name = rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['path'], ENT_QUOTES, 'UTF-8')), '/');

			if (!file_exists($old_name) || $old_name == DIR_IMAGE . 'data') {
				$json['error'] = $this->language->get('error_copy');
			}

			if (is_file($old_name)) {
				$ext = strrchr($old_name, '.');
			} else {
				$ext = '';
			}

			$new_name = dirname($old_name) . '/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8') . $ext);

			if (file_exists($new_name)) {
				$json['error'] = $this->language->get('error_exists');
			}

		} else {
			$json['error'] = $this->language->get('error_select');
		}

		if (!$this->user->hasPermission('modify', 'common/filemanager')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!isset($json['error'])) {
			if (is_file($old_name)) {
				copy($old_name, $new_name);
			} else {
				$this->recursiveCopy($old_name, $new_name);
			}

			$json['success'] = $this->language->get('text_copy');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	protected function recursiveCopy($source, $destination) {
		$directory = opendir($source);

		@mkdir($destination);

		while (false !== ($file = readdir($directory))) {
			if (($file != '.') && ($file != '..')) {
				if (is_dir($source . '/' . $file)) {
					$this->recursiveCopy($source . '/' . $file, $destination . '/' . $file);
				} else {
					copy($source . '/' . $file, $destination . '/' . $file);
				}
			}
		}

		closedir($directory);
	}

	public function folders() {
		$this->response->setOutput($this->recursiveFolders(DIR_IMAGE . 'data/'));
	}

	protected function recursiveFolders($directory) {
		$output = '';

		$output .= '<option value="' . htmlspecialchars(utf8_substr($directory, strlen(DIR_IMAGE . 'data/')), ENT_QUOTES, 'UTF-8') . '">' . htmlspecialchars(utf8_substr($directory, strlen(DIR_IMAGE . 'data/')), ENT_QUOTES, 'UTF-8') . '</option>';

		$directories = glob(rtrim(str_replace(array('../', '..\\', '..'), '', $directory), '/') . '/*', GLOB_ONLYDIR);

		foreach ($directories as $directory) {
			$output .= $this->recursiveFolders($directory);
		}

		return $output;
	}

	public function rename() {
		$this->language->load('common/filemanager');

		$json = array();

		if (isset($this->request->post['path']) && isset($this->request->post['name'])) {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 255)) {
				$json['error'] = $this->language->get('error_filename');
			}

			$old_name = rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['path'], ENT_QUOTES, 'UTF-8')), '/');

			if (!file_exists($old_name) || $old_name == DIR_IMAGE . 'data') {
				$json['error'] = $this->language->get('error_rename');
			}

			if (is_file($old_name)) {
				$ext = strrchr($old_name, '.');
			} else {
				$ext = '';
			}

			$new_name = dirname($old_name) . '/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->post['name'], ENT_QUOTES, 'UTF-8') . $ext);

			if (file_exists($new_name)) {
				$json['error'] = $this->language->get('error_exists');
			}
		}

		if (!$this->user->hasPermission('modify', 'common/filemanager')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!isset($json['error'])) {
			rename($old_name, $new_name);

			$json['success'] = $this->language->get('text_rename');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function multi() {
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Pragma: no-cache");

		$targetDir = rtrim(DIR_IMAGE . 'data/' . str_replace(array('../', '..\\', '..'), '', html_entity_decode($this->request->get['directory'], ENT_QUOTES, 'UTF-8')), '/');

		$chunk = isset($_REQUEST["chunk"]) ? $_REQUEST["chunk"] : 0;
		$chunks = isset($_REQUEST["chunks"]) ? $_REQUEST["chunks"] : 0;
		$filename = isset($_REQUEST["name"]) ? $_REQUEST["name"] : '';

		$fileName = htmlspecialchars(basename(html_entity_decode($filename, ENT_QUOTES, 'UTF-8')), ENT_QUOTES, 'UTF-8');

		if ($chunks < 2 && file_exists($targetDir . DIRECTORY_SEPARATOR . $fileName)) {
			$ext = strrpos($fileName, '.');
			$fileName_a = substr($fileName, 0, $ext);
			$fileName_b = substr($fileName, $ext);

			$count = 1;

			while (file_exists($targetDir . DIRECTORY_SEPARATOR . $fileName_a . '_' . $count . $fileName_b)) {
				$count++;
			}

			$fileName = $fileName_a . '_' . $count . $fileName_b;
		}

		if (!file_exists($targetDir)) {
			@mkdir($targetDir);
		}

		if (isset($_SERVER["HTTP_CONTENT_TYPE"])) {
			$contentType = $_SERVER["HTTP_CONTENT_TYPE"];
		}

		if (isset($_SERVER["CONTENT_TYPE"])) {
			$contentType = $_SERVER["CONTENT_TYPE"];
		}

		$file_max_size = 98304; // 96Mb

		if (strpos($contentType, "multipart") !== false) {
			if (isset($_FILES['file']['tmp_name']) && is_uploaded_file($_FILES['file']['tmp_name'])) {
				$out = fopen($targetDir . DIRECTORY_SEPARATOR . $fileName, $chunk == 0 ? "wb" : "ab");

				if ($out) {
					$in = fopen($_FILES['file']['tmp_name'], "rb");

					if ($in) {
						while ($buff = fread($in, (int)$file_max_size)) {
							fwrite($out, $buff);
						}
					} else {
						die('{"jsonrpc" : "2.0", "error" : {"code": 101, "message": "Failed to open input stream."}, "id" : "id"}');
					}

					fclose($in);
					fclose($out);

					@unlink($_FILES['file']['tmp_name']);

				} else {
					die('{"jsonrpc" : "2.0", "error" : {"code": 102, "message": "Failed to open output stream."}, "id" : "id"}');
				}

			} else {
				die('{"jsonrpc" : "2.0", "error" : {"code": 103, "message": "Failed to move uploaded file."}, "id" : "id"}');
			}

		} else {
			$out = fopen($targetDir . DIRECTORY_SEPARATOR . $fileName, $chunk == 0 ? "wb" : "ab");

			if ($out) {
				$in = fopen("php://input", "rb");

				if ($in) {
					while ($buff = fread($in, (int)$file_max_size)) {
						fwrite($out, $buff);
					}
				} else {
					die('{"jsonrpc" : "2.0", "error" : {"code": 101, "message": "Failed to open input stream."}, "id" : "id"}');
				}

				fclose($in);
				fclose($out);

			} else {
				die('{"jsonrpc" : "2.0", "error" : {"code": 102, "message": "Failed to open output stream."}, "id" : "id"}');
			}
		}

		die('{"jsonrpc" : "2.0", "result" : null, "id" : "id"}');
	}

	public function information() {
		$json = array();

		$this->language->load('common/filemanager');

		$this->data['info_title'] = $this->language->get('info_title');
		$this->data['info_copyright'] = $this->language->get('info_copyright');

		$this->data['text_info_version'] = $this->language->get('text_info_version');
		$this->data['text_info_author'] = $this->language->get('text_info_author');
		$this->data['text_info_credit'] = $this->language->get('text_info_credit');
		$this->data['text_info_scripts'] = $this->language->get('text_info_scripts');
		$this->data['text_info_license'] = $this->language->get('text_info_license');
		$this->data['text_info_files'] = $this->language->get('text_info_files');

		$this->data['info_version'] = $this->language->get('info_version');
		$this->data['info_author'] = $this->language->get('info_author');
		$this->data['info_credit'] = $this->language->get('info_credit');
		$this->data['info_scripts'] = $this->language->get('info_scripts');
		$this->data['info_license'] = $this->language->get('info_license');
		$this->data['info_files'] = $this->language->get('info_files');

		$this->data['token'] = $this->session->data['token'];

		$this->template = 'common/filemanager_info.tpl';

		$json['html'] = $this->render();

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
