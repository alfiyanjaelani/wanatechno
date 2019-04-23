<?php
class M_barang extends CI_Model{
	function ambil_data(){
		return $this->db->get('mst_barang');
	}
	function input_data($data,$table){
		$this->db->insert($table,$data);
	}
	function edit_data($where,$table){		
	return $this->db->get_where($table,$where);
	}

	function update_data($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}	

	function hapus_data($where,$table){
	$this->db->where($where);
	$this->db->delete($table);
	}

	function get_no_invoice($kodekategori){
        $kd = rand(0,1000);
        date_default_timezone_set('Asia/Jakarta');
        return $kodekategori.date('dmy').$kd;
	}

	function getdddivisi(){
		$query = $this->db->query('SELECT * FROM mst_divisi');
		return $query->result();
	}
}
