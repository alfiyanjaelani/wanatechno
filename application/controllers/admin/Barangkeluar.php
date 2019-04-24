<?php

class Barangkeluar extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_barang_keluar');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['barang_keluar'] = $this->m_barang_keluar->get_m_barang_views()->result();
        $this->load->view("admin/barang_keluar/index",$data);
	}

	public function create()
	{
		$data['dd_barang'] = $this->m_barang_keluar->getdd();
		$data['dd_supplier'] = $this->m_barang_keluar->getddsupplier();
		$data['dd_sliptype'] = $this->m_barang_keluar->getddsliptype();
		$data['dd_destination'] = $this->m_barang_keluar->getdddestination();
		
        $this->load->view("admin/barang_keluar/create",$data);
	}

	public function tambah_data()
	{
		$no_document = $this->input->post('no_document');
		$part_no = $this->input->post('part_no');
		$kode_sliptype = $this->input->post('kode_sliptype');
		$kode_supplier = $this->input->post('kode_supplier');
		$lot_no = $this->input->post('lot_no');	
		$qty = $this->input->post('qty');
		$tanggal = date('Y-m-d', strtotime( $this->input->post('tanggal')));
		$kode_destination = $this->input->post('kode_destination');
		$petugas = $this->input->post('petugas');
		$data = array(
			'no_document' => $no_document,
			'part_no' => $part_no,
			'kode_sliptype' => $kode_sliptype,
			'kode_supplier' => $kode_supplier,
			'lot_no' => $lot_no,
			'qty' => $qty,
			'tanggal' => $tanggal,
			'petugas' => $petugas,
			'kode_destination' => $kode_destination
		);


		// data barang keluar detail
		$datadetailkeluar = array(
			'part_no' => $part_no,
			'total' => $qty,
			'kode_destination' => $kode_destination
		);

		$where = array(
			'part_no' => $part_no
		);

		$this->m_barang_keluar->selecteditstockbarang($part_no,$where,$qty,'mst_barang');

		$this->m_barang_keluar->input_data($data,'trx_barang_keluar');
		$this->m_barang_keluar->insert_barangkeluardetail($datadetailkeluar,'trx_detail_keluar');
		redirect('admin/barangkeluar/index');		
	}



}
