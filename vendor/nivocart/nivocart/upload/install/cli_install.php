<?php
// Command Line tool for installing NivoCart
// (Currently tested on linux only)
//
// Usage:
//
//   cd install
//   php cli_install.php install
//		--db_hostname localhost \
//		--db_username root \
//		--db_password pass \
//		--db_database nivocart \
//		--username admin \
//		--password admin \
//		--email youremail@example.com \
//		--agree_tnc yes \
//		--http_server http://localhost/nivocart
//

ini_set('display_errors', 1);

error_reporting(E_ALL);

// DIR
define('DIR_APPLICATION', str_replace('\'', '/', realpath(dirname(__FILE__))) . '/');
define('DIR_SYSTEM', str_replace('\'', '/', realpath(dirname(__FILE__) . '/../')) . '/system/');
define('DIR_NIVOCART', str_replace('\\', '/', realpath(DIR_APPLICATION . '../')) . '/');
define('DIR_DATABASE', DIR_SYSTEM . 'database/');
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/template/');
define('DIR_CONFIG', DIR_SYSTEM . 'config/');

// Version
define('NC_VERSION', '1.0.4');

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);

$registry->set('load', $loader);

function errorHandler($errno, $errstr, $errfile, $errline) {
	if (0 === error_reporting()) {
		return false;
	}

	throw new ErrorException($errstr, 0, $errno, $errfile, $errline);
}

set_error_handler('errorHandler');

function usage() {
	echo "Usage:\n";
	echo "======\n";
	echo "\n";
	$options = implode(" ", array(
		'--db_hostname', 'localhost',
		'--db_username', 'root',
		'--db_password', 'pass',
		'--db_database', 'nivocart',
		'--db_driver', 'mysqli',
		'--db_port', '3306',
		'--username', 'admin',
		'--password', 'admin',
		'--email', 'email@example.com',
		'--agree_tnc', 'yes',
		'--http_server', 'http://localhost/nivocart')
	);
	echo 'php cli_install.php install ' . $options . "\n\n";
}

function getOptions($argv) {
	$defaults = array(
		'db_hostname' => 'localhost',
		'db_database' => 'nivocart',
		'db_prefix'   => 'nc_',
		'db_driver'   => 'mysqli',
		'db_port'     => '3306',
		'username'    => 'admin',
		'agree_tnc'   => 'no'
	);

	$options = array();

	$total = count($argv);

	for ($i = 0; $i < $total; $i = $i + 2) {
		$is_flag = preg_match('/^--(.*)$/', $argv[$i], $match);

		if (!$is_flag) {
			throw new Exception($argv[$i] . ' found in command line args instead of a valid option name starting with \'--\'');
		}

		$options[$match[1]] = $argv[$i+1];
	}

	return array_merge($defaults, $options);
}

function valid($options) {
	$required = array(
		'db_hostname',
		'db_username',
		'db_password',
		'db_database',
		'db_port',
		'db_prefix',
		'username',
		'password',
		'email',
		'agree_tnc',
		'http_server'
	);

	$missing = array();

	foreach ($required as $r) {
		if (!array_key_exists($r, $options)) {
			$missing[] = $r;
		}
	}

	if (!preg_match('#/$#', $options['http_server'])) {
		$options['http_server'] = $options['http_server'] . '/';
	}

	$valid = count($missing) === 0;

	return array($valid, $missing);
}

function install($options) {
	$check = checkRequirements();

	if ($check[0]) {
		setupDb($options);
		writeConfigFiles($options);
		dirPermissions();
	} else {
		echo 'FAILED! Pre-installation check failed: ' . $check[1] . "\n\n";
		exit(1);
	}
}

function checkRequirements() {
	$error = null;

	if (phpversion() < '7.0') {
		$error = 'Warning: You need to use PHP 7.0 or above for NivoCart to work!';
	}

	if (!ini_get('file_uploads')) {
		$error = 'Warning: file_uploads needs to be enabled!';
	}

	if (ini_get('session.auto_start')) {
		$error = 'Warning: NivoCart will not work with session.auto_start enabled!';
	}

	if (!extension_loaded('mysqli')) {
		$error = 'Warning: MySQLi extension needs to be loaded for NivoCart to work!';
	}

	if (!extension_loaded('gd')) {
		$error = 'Warning: GD extension needs to be loaded for NivoCart to work!';
	}

	if (!extension_loaded('curl')) {
		$error = 'Warning: Curl extension needs to be loaded for NivoCart to work!';
	}

	if (!extension_loaded('dom')) {
		$error = 'Warning: DOM extension needs to be loaded for NivoCart to work!';
	}

	if (!extension_loaded('xml')) {
		$error = 'Warning: XML extension needs to be loaded for NivoCart to work!';
	}

	if (!function_exists('openssl_encrypt')) {
		$error = 'Warning: OpenSSL Encrypt extension needs to be loaded for NivoCart to work!';
	}

	if (!extension_loaded('zlib')) {
		$error = 'Warning: ZLIB extension needs to be loaded for NivoCart to work!';
	}

	if (!extension_loaded('zip')) {
		$error = 'Warning: ZIP extension needs to be loaded for NivoCart to work!';
	}

	if (!function_exists('iconv')) {
		if (!extension_loaded('mbstring')) {
			$error = 'Warning: mbstring extension needs to be loaded for NivoCart to work!';
		}
	}

	if (!is_writable(DIR_NIVOCART . 'config.php')) {
		$error = 'Warning: config.php needs to be writable for NivoCart to be installed!';
	}

	if (!is_writable(DIR_NIVOCART . 'admin/config.php')) {
		$error = 'Warning: admin/config.php needs to be writable for NivoCart to be installed!';
	}

	if (!is_writable(DIR_SYSTEM . 'cache')) {
		$error = 'Warning: Cache directory needs to be writable for NivoCart to work!';
	}

	if (!is_writable(DIR_SYSTEM . 'logs')) {
		$error = 'Warning: Logs directory needs to be writable for NivoCart to work!';
	}

	if (!is_writable(DIR_SYSTEM . 'upload')) {
		$error = 'Warning: Upload directory needs to be writable for NivoCart to work!';
	}

	if (!is_writable(DIR_NIVOCART . 'download')) {
		$error = 'Warning: Download directory needs to be writable for NivoCart to work!';
	}

	if (!is_writable(DIR_NIVOCART . 'image')) {
		$error = 'Warning: Image directory needs to be writable for NivoCart to work!';
	}

	if (!is_writable(DIR_NIVOCART . 'image/cache')) {
		$error = 'Warning: Image cache directory needs to be writable for NivoCart to work!';
	}

	if (!is_writable(DIR_NIVOCART . 'image/data')) {
		$error = 'Warning: Image data directory needs to be writable for NivoCart to work!';
	}

	return array($error === null, $error);
}

function setupDb($data) {
	$db = new DB($data['db_driver'], htmlspecialchars_decode($data['db_hostname']), htmlspecialchars_decode($data['db_username']), htmlspecialchars_decode($data['db_password']), htmlspecialchars_decode($data['db_database']), $data['db_port']);

	$file = DIR_APPLICATION . 'nivocart.sql';

	if (!file_exists($file)) {
		exit('Could not load sql file: ' . $file);
	}

	$lines = file($file);

	if ($lines) {
		$sql = '';

		foreach ($lines as $line) {
			if ($line && (substr($line, 0, 2) != '--') && (substr($line, 0, 1) != '#')) {
				$sql .= $line;

				if (preg_match('/;\s*$/', $line)) {
					$sql = str_replace("DROP TABLE IF EXISTS `nc_", "DROP TABLE IF EXISTS `" . $data['db_prefix'], $sql);
					$sql = str_replace("CREATE TABLE `nc_", "CREATE TABLE `" . $data['db_prefix'], $sql);
					$sql = str_replace("INSERT INTO `nc_", "INSERT INTO `" . $data['db_prefix'], $sql);

					$db->query($sql);

					$sql = '';
				}
			}
		}

		$db->query("SET CHARACTER SET utf8");

		$db->query("SET @@session.sql_mode = 'MYSQL40'");

		$db->query("DELETE FROM `" . $data['db_prefix'] . "user` WHERE user_id = '1'");
		$db->query("INSERT INTO `" . $data['db_prefix'] . "user` SET user_id = '1', user_group_id = '1', username = '" . $db->escape($data['username']) . "', salt = '" . $db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '1', email = '" . $db->escape($data['email']) . "', date_added = NOW()");

		$db->query("DELETE FROM `" . $data['db_prefix'] . "setting` WHERE `key` = 'config_email'");
		$db->query("INSERT INTO `" . $data['db_prefix'] . "setting` SET `group` = 'config', `key` = 'config_email', `value` = '" . $db->escape($data['email']) . "'");

		$db->query("DELETE FROM `" . $data['db_prefix'] . "setting` WHERE `key` = 'config_url'");
		$db->query("INSERT INTO `" . $data['db_prefix'] . "setting` SET `group` = 'config', `key` = 'config_url', `value` = '" . $db->escape(HTTP_NIVOCART) . "'");

		$db->query("DELETE FROM `" . $data['db_prefix'] . "setting` WHERE `key` = 'config_encryption'");
		$db->query("INSERT INTO `" . $data['db_prefix'] . "setting` SET `group` = 'config', `key` = 'config_encryption', `value` = '" . $db->escape(hash_rand('ripemd128')) . "'");

		$db->query("INSERT INTO `" . $data['db_prefix'] . "version` SET `version` = '" . $db->escape(NC_VERSION) . "', date_added = NOW()");
	}
}

function writeConfigFiles($options) {
	// Write Catalog config.php
	$output = '<?php' . "\n";
	$output .= '// HTTP' . "\n";
	$output .= 'define(\'HTTP_SERVER\', \'' . $options['http_server'] . '\');' . "\n";
	$output .= 'define(\'HTTP_IMAGE\', \'' . $options['http_server'] . 'image/\');' . "\n";

	$output .= '// HTTPS' . "\n";
	$output .= 'define(\'HTTPS_SERVER\', \'' . $options['http_server'] . '\');' . "\n";
	$output .= 'define(\'HTTPS_IMAGE\', \'' . $options['http_server'] . 'image/\');' . "\n\n";

	$output .= '// DIR' . "\n";
	$output .= 'define(\'DIR_APPLICATION\', \'' . DIR_NIVOCART . 'catalog/\');' . "\n";
	$output .= 'define(\'DIR_SYSTEM\', \'' . DIR_NIVOCART. 'system/\');' . "\n";
	$output .= 'define(\'DIR_DATABASE\', \'' . DIR_NIVOCART . 'system/database/\');' . "\n";
	$output .= 'define(\'DIR_LANGUAGE\', \'' . DIR_NIVOCART . 'catalog/language/\');' . "\n";
	$output .= 'define(\'DIR_TEMPLATE\', \'' . DIR_NIVOCART . 'catalog/view/theme/\');' . "\n";
	$output .= 'define(\'DIR_CONFIG\', \'' . DIR_NIVOCART . 'system/config/\');' . "\n";
	$output .= 'define(\'DIR_IMAGE\', \'' . DIR_NIVOCART . 'image/\');' . "\n";
	$output .= 'define(\'DIR_CACHE\', \'' . DIR_NIVOCART . 'system/cache/\');' . "\n";
	$output .= 'define(\'DIR_UPLOAD\', \'' . DIR_NIVOCART . 'system/upload/\');' . "\n";
	$output .= 'define(\'DIR_DOWNLOAD\', \'' . DIR_NIVOCART . 'download/\');' . "\n";
	$output .= 'define(\'DIR_VQMOD\', \'' . DIR_NIVOCART . 'vqmod/\');' . "\n";
	$output .= 'define(\'DIR_LOGS\', \'' . DIR_NIVOCART . 'system/logs/\');' . "\n";

	$output .= '// DB' . "\n";
	$output .= 'define(\'DB_DRIVER\', \'mysql\');' . "\n";
	$output .= 'define(\'DB_HOSTNAME\', \'' . addslashes($options['db_hostname']) . '\');' . "\n";
	$output .= 'define(\'DB_USERNAME\', \'' . addslashes($options['db_username']) . '\');' . "\n";
	$output .= 'define(\'DB_PASSWORD\', \'' . addslashes($options['db_password']) . '\');' . "\n";
	$output .= 'define(\'DB_DATABASE\', \'' . addslashes($options['db_database']) . '\');' . "\n";
	$output .= 'define(\'DB_PORT\', \'' . addslashes($options['db_port']) . '\');' . "\n";
	$output .= 'define(\'DB_PREFIX\', \'' . addslashes($options['db_prefix']) . '\');' . "\n\n";

	$file = fopen(DIR_NIVOCART . 'config.php', 'w');

	fwrite($file, $output);

	fclose($file);

	// Write Admin config.php
	$output = '<?php' . "\n";
	$output .= '// HTTP' . "\n";
	$output .= 'define(\'HTTP_SERVER\', \'' . $options['http_server'] . 'admin/\');' . "\n";
	$output .= 'define(\'HTTP_IMAGE\', \'' . $options['http_server'] . 'image/\');' . "\n";
	$output .= 'define(\'HTTP_CATALOG\', \'' . $options['http_server'] . '\');' . "\n\n";

	$output .= '// HTTPS' . "\n";
	$output .= 'define(\'HTTPS_SERVER\', \'' . $options['http_server'] . 'admin/\');' . "\n";
	$output .= 'define(\'HTTPS_IMAGE\', \'' . $options['http_server'] . 'image/\');' . "\n";
	$output .= 'define(\'HTTPS_CATALOG\', \'' . $options['http_server'] . '\');' . "\n\n";

	$output .= '// DIR' . "\n";
	$output .= 'define(\'DIR_APPLICATION\', \'' . DIR_NIVOCART . 'admin/\');' . "\n";
	$output .= 'define(\'DIR_SYSTEM\', \'' . DIR_NIVOCART . 'system/\');' . "\n";
	$output .= 'define(\'DIR_DATABASE\', \'' . DIR_NIVOCART . 'system/database/\');' . "\n";
	$output .= 'define(\'DIR_LANGUAGE\', \'' . DIR_NIVOCART . 'admin/language/\');' . "\n";
	$output .= 'define(\'DIR_TEMPLATE\', \'' . DIR_NIVOCART . 'admin/view/template/\');' . "\n";
	$output .= 'define(\'DIR_CONFIG\', \'' . DIR_NIVOCART . 'system/config/\');' . "\n";
	$output .= 'define(\'DIR_IMAGE\', \'' . DIR_NIVOCART . 'image/\');' . "\n";
	$output .= 'define(\'DIR_CACHE\', \'' . DIR_NIVOCART . 'system/cache/\');' . "\n";
	$output .= 'define(\'DIR_UPLOAD\', \'' . DIR_NIVOCART . 'system/upload/\');' . "\n";
	$output .= 'define(\'DIR_DOWNLOAD\', \'' . DIR_NIVOCART . 'download/\');' . "\n";
	$output .= 'define(\'DIR_VQMOD\', \'' . DIR_NIVOCART . 'vqmod/\');' . "\n";
	$output .= 'define(\'DIR_LOGS\', \'' . DIR_NIVOCART . 'system/logs/\');' . "\n";
	$output .= 'define(\'DIR_CATALOG\', \'' . DIR_NIVOCART . 'catalog/\');' . "\n\n";

	$output .= '// DB' . "\n";
	$output .= 'define(\'DB_DRIVER\', \'mysql\');' . "\n";
	$output .= 'define(\'DB_HOSTNAME\', \'' . addslashes($options['db_hostname']) . '\');' . "\n";
	$output .= 'define(\'DB_USERNAME\', \'' . addslashes($options['db_username']) . '\');' . "\n";
	$output .= 'define(\'DB_PASSWORD\', \'' . addslashes($options['db_password']) . '\');' . "\n";
	$output .= 'define(\'DB_DATABASE\', \'' . addslashes($options['db_database']) . '\');' . "\n";
	$output .= 'define(\'DB_PORT\', \'' . addslashes($options['db_port']) . '\');' . "\n";
	$output .= 'define(\'DB_PREFIX\', \'' . addslashes($options['db_prefix']) . '\');' . "\n\n";

	$file = fopen(DIR_NIVOCART . 'admin/config.php', 'w');

	fwrite($file, $output);

	fclose($file);
}

function dirPermissions() {
	$dirs = array(
		DIR_NIVOCART . 'image/',
		DIR_NIVOCART . 'download/',
		DIR_SYSTEM . 'upload/',
		DIR_SYSTEM . 'cache/',
		DIR_SYSTEM . 'logs/'
	);

	exec('chmod o+w -R ' . implode(' ', $dirs));
}

$argv = $_SERVER['argv'];

$script = array_shift($argv);

$subcommand = array_shift($argv);

switch ($subcommand) {
	case "install":
		try {
			$options = getOptions($argv);

			define('HTTP_NIVOCART', $options['http_server']);

			$valid = valid($options);

			if (!$valid[0]) {
				echo "FAILED! The following inputs were missing or invalid: ";
				echo implode(', ',  $valid[1]) . "\n\n";
				exit(1);
			}

			install($options);

			echo "SUCCESS: NivoCart was successfully installed on your server!\n";

			echo "Store link: " . $options['http_server'] . "\n";
			echo "Admin link: " . $options['http_server'] . "admin/\n\n";
		} catch (ErrorException $e) {
			echo 'FAILED!: ' . $e->getMessage() . "\n";
			exit(1);
		}
		break;
	case "usage":
	default:
	echo usage();
}
