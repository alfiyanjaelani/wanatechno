<?php

class Barangmasuk extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_barang_masuk');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['barang_masuk'] = $this->m_barang_masuk->get_m_barang_views()->result();

        $this->load->view("admin/barang_masuk/index",$data);
	}

	public function create()
	{
		$data['dd_barang'] = $this->m_barang_masuk->getdd();
		$data['dd_supplier'] = $this->m_barang_masuk->getddsupplier();
		$data['dd_sliptype'] = $this->m_barang_masuk->getddsliptype();
		$data['dd_destination'] = $this->m_barang_masuk->getdddestination();
		
        $this->load->view("admin/barang_masuk/create",$data);
	}

	public function tambah_data()
	{
		$no_document = $this->input->post('no_document');
		$lot_no = $this->input->post('lot_no');
		$part_no = $this->input->post('part_no');
		$kode_sliptype = $this->input->post('kode_sliptype');
		$kode_supplier = $this->input->post('kode_supplier');
		$qty = $this->input->post('qty');
		$tanggal = date('Y-m-d', strtotime( $this->input->post('tanggal')));
		$kode_destination = $this->input->post('kode_destination');
		$petugas = $this->input->post('petugas');
		$data = array(
			'no_document' => $no_document,
			'lot_no' => $lot_no,
			'part_no' => $part_no,
			'kode_sliptype' => $kode_sliptype,
			'kode_supplier' => $kode_supplier,
			'qty' => $qty,
			'tanggal' => $tanggal,
			'petugas'=>$petugas,
			'kode_destination' => $kode_destination
		);

		// data barang masuk detail
		$datadetailmasuk = array(
			'part_no' => $part_no,
			'total' => $qty,
			'kode_destination' => $kode_destination
		);


		$where = array(
			'part_no' => $part_no
		);

		$this->m_barang_masuk->selecteditstockbarang($part_no,$where,$qty,'mst_barang');

		$this->m_barang_masuk->input_data($data,'trx_barang_masuk');
		$this->m_barang_masuk->insert_barangmasukdetail($datadetailmasuk,'trx_detail_masuk');
		redirect('admin/barangmasuk/index');		
	}



}
