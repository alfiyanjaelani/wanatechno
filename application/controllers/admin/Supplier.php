<?php

class Supplier extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_supplier');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['mst_supplier'] = $this->m_supplier->ambil_data()->result();
        $this->load->view("admin/supplier/index",$data);
	}

	public function create()
	{
		 $this->load->view("admin/supplier/create");
	}

	public function tambah_data()
	{
		$kode_supplier="P001";
		$nama_supplier = $this->input->post('nama_supplier');
		$alamat_supplier = $this->input->post('alamat_supplier');
		$no_tlp_supplier = $this->input->post('no_tlp_supplier');
		$data = array(
			'kode_supplier' => $kode_supplier,
			'nama_supplier' => $nama_supplier,
			'alamat_supplier' => $alamat_supplier,
			'no_tlp_supplier' => $no_tlp_supplier
			);
		$this->m_supplier->input_data($data,'mst_supplier');
		redirect('admin/supplier/index');
	}

	public function edit($id){
		$where = array('kode_supplier' => $id);
		$data['mst_supplier'] = $this->m_supplier->edit_data($where,'mst_supplier')->result();
		$this->load->view('admin/supplier/edit',$data);
	}

	public function update(){
		$kode_supplier = $this->input->post('kode_supplier');
		$nama_supplier = $this->input->post('nama_supplier');
		$alamat_supplier = $this->input->post('alamat_supplier');
		$no_tlp_supplier = $this->input->post('no_tlp_supplier');


		$data = array(
			'kode_supplier' => $kode_supplier,
			'nama_supplier' => $nama_supplier,
			'alamat_supplier' => $alamat_supplier,
			'no_tlp_supplier' => $no_tlp_supplier
		);

		$where = array(
			'kode_supplier' => $kode_supplier
		);

		$this->m_supplier->update_data($where,$data,'mst_supplier');
		redirect('admin/supplier/index');
	}

	public function delete($kode_supplier){
		$where = array('kode_supplier' => $kode_supplier);
		$this->m_supplier->hapus_data($where,'mst_supplier');
		redirect('admin/supplier/index');
	}
}
