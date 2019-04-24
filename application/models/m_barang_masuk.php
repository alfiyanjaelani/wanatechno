<?php
class M_barang_masuk extends CI_Model{

	function __construct()
	{
		parent::__construct();
	}

	function getdd(){
		$query = $this->db->query('SELECT * FROM mst_barang');
		return $query->result();
	}

	function getddsupplier(){
		$query = $this->db->query('SELECT * FROM mst_supplier');
		return $query->result();
	}

	function getddsliptype(){
		$query = $this->db->query('SELECT * FROM mst_sliptype');
		return $query->result();
	}

	function getdddestination(){
		$query = $this->db->query('SELECT * FROM mst_destination');
		return $query->result();
	}

	function ambil_data(){
		return $this->db->get('trx_barang_masuk');
	}

	function input_data($data,$table){
		$this->db->insert($table,$data);
	}

	function insert_barangmasukdetail($data,$table){
		$this->db->insert($table,$data);
	}

	function get_m_barang_views(){
		return $this->db->get('barang_masuk_views');
	}
	
	function selecteditstockbarang($id,$where,$stockbaru,$table){

		$this->db->distinct();
		$this->db->select('stock');
		$this->db->from('mst_barang');
		$this->db->where('part_no', $id);
		$query = $this->db->get();
		$result = $query->row();
		$result->stock;  


		// data update stock baru + stock lama
		$datadetailmasuk = array(
			'stock' => $stockbaru + $result->stock
		);


		$this->db->where($where);
		$this->db->update($table,$datadetailmasuk);
	}	
}