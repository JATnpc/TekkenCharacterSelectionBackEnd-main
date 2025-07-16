<?php
class ModelToolDatabase extends Model {

	public function getTables() {
		$table_data = array();

		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$table_data[] = $result['Tables_in_' . DB_DATABASE];
				}
			}
		}

		return $table_data;
	}

	public function tableOptimize() {
		$query = $this->db->query("SHOW TABLE STATUS FROM `" . DB_DATABASE . "` WHERE Data_free > 0");

		foreach ($query->rows as $result) {
			if (utf8_substr($result['Name'], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Name'])) {
					$this->db->query("OPTIMIZE TABLE " . $result['Name']);
				}
			}
		}
	}

	public function tableRepair() {
		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$this->db->query("REPAIR TABLE " . $result['Tables_in_' . DB_DATABASE]);
				}
			}
		}
	}

	public function getEngines() {
		$engines = array();

		$query = $this->db->query("SHOW TABLE STATUS FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			$engines = array('engine' => $result['Engine']);

			return $engines;
		}
	}

	public function engineInnoDB() {
		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$this->db->query("ALTER TABLE " . $result['Tables_in_' . DB_DATABASE] . " ENGINE = InnoDB");
				}
			}
		}
	}

	public function engineMyISAM() {
		$query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

		foreach ($query->rows as $result) {
			if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {
				if (isset($result['Tables_in_' . DB_DATABASE])) {
					$this->db->query("ALTER TABLE " . $result['Tables_in_' . DB_DATABASE] . " ENGINE = MyISAM");
				}
			}
		}
	}
}
