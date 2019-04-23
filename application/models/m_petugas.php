<?php
class M_petugas extends CI_Model{
	function ambil_data(){
		return $this->db->get('mst_petugas');
	}
	function input_data($data,$table){
		$this->db->insert($table,$data);
	}
	function cek_login($table,$where){		
		return $this->db->get_where($table,$where);
	}	
}
