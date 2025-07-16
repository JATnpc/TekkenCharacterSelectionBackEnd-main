<?php
/**
 *
 * @package Simple vQmod NivoCart install script
 * @author Jay Gilford - http://vqmod.com/
 * @copyright Jay Gilford 2011
 * @version 0.5
 * @access public
 *
 * @information
 * This file will perform all necessary file alterations for the
 * NivoCart index.php files both in the root directory and in the
 * Administration folder. Please note that if you have changed your
 * default folder name from admin to something else, you will need
 * to edit the admin/index.php in this file to install successfully
 *
 * @license
 * Permission is hereby granted, free of charge, to any person to
 * use, copy, modify, distribute, sublicense, and/or sell copies
 * of the Software, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software
 *
 * @warning
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESSED OR IMPLIED.
 *
 */

// CHANGE THIS IF YOU EDIT YOUR ADMIN FOLDER NAME
$admin = 'admin';

// Counters
$changes = 0;
$writes = 0;

// Load class required for installation
require('ugrsr.class.php');

// Get directory two above installation directory
$nivocart_path = realpath(dirname(__FILE__) . '/../../') . '/';

// Verify path is correct
if (empty($nivocart_path)) {
	die('ERROR - COULD NOT DETERMINE NIVOCART PATH CORRECTLY - ' . dirname(__FILE__));
}

$write_errors = array();

if (!is_writeable($nivocart_path . 'index.php')) {
	$write_errors[] = 'index.php not writable';
}

if (!is_writeable($nivocart_path . $admin . '/index.php')) {
	$write_errors[] = 'Administrator index.php not writable';
}

if (!empty($write_errors)) {
	die(implode('<br />', $write_errors));
}

// Create new UGRSR class
$u = new UGRSR($nivocart_path);

// Change to true to enable debugging info
$u->debug = false;

// Set file searching to off
$u->file_search = false;

// Attempt upgrade if necessary. Otherwise just continue with normal install
$u->addFile('index.php');
$u->addFile($admin . '/index.php');

$u->addPattern('~\$vqmod->~', 'VQMod::');
$u->addPattern('~\$vqmod = new VQMod\(\);~', 'VQMod::bootup();');

$result = $u->run();

if ($result['writes'] > 0) {
	if (file_exists('../mods.cache')) {
		unlink('../mods.cache');
	}
	die('UPGRADE COMPLETE');
}

$u->clearPatterns();
$u->resetFileList();

// Add catalog index files to files to include
$u->addFile('index.php');

// Pattern to add vqmod include
$u->addPattern('~// Startup~', '// VirtualQMOD
require_once(\'./vqmod/vqmod.php\');
VQMod::bootup();

// VQMODDED Startup');

$result = $u->run();
$writes += $result['writes'];
$changes += $result['changes'];

$u->clearPatterns();
$u->resetFileList();

// Add Admin index file
$u->addFile($admin . '/index.php');

// Pattern to add vqmod include
$u->addPattern('~// Startup~', '// VirtualQMOD
require_once(\'../vqmod/vqmod.php\');
VQMod::bootup();

// VQMODDED Startup');

$result = $u->run();
$writes += $result['writes'];
$changes += $result['changes'];

$u->addFile('index.php');

// Pattern to run required files through vqmod
$u->addPattern('/require_once\(DIR_SYSTEM \. \'([^\']+)\'\);/', 'require_once(VQMod::modCheck(DIR_SYSTEM . \'$1\'));');

// Get number of changes during run
$result = $u->run();
$writes += $result['writes'];
$changes += $result['changes'];

// ---------------------
// Output result to user
// ---------------------

// Load config.php required for redirect
require_once($nivocart_path . $admin . '/config.php');

$admin_link = html_entity_decode(HTTPS_SERVER . '/index.php', ENT_QUOTES, "UTF-8");

vprintf("VQMOD HAS BEEN INSTALLED ON YOUR SYSTEM! >>> YOU CAN NOW <a href='%s'><b>LOG BACK IN</b></a>", $admin_link);
