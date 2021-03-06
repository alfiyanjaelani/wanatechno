<?php

class Viewreport extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_viewreport');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['barang_keluar_detail'] = $this->m_viewreport->get_m_barang_views()->result();
        $this->load->view("admin/viewreport/index",$data);

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
		$qty = $this->input->post('qty');
		$tanggal = $this->input->post('tanggal');
		$kode_destination = $this->input->post('kode_destination');
		$data = array(
			'no_document' => $no_document,
			'part_no' => $part_no,
			'kode_sliptype' => $kode_sliptype,
			'kode_supplier' => $kode_supplier,
			'qty' => $qty,
			'tanggal' => $tanggal,
			'kode_destination' => $kode_destination
		);
		$this->m_barang_keluar->input_data($data,'trx_barang_keluar');
		redirect('admin/barangkeluar/index');		
	}



}
