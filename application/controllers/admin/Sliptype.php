<?php

class Sliptype extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_sliptype');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['mst_sliptype'] = $this->m_sliptype->ambil_data()->result();
        $this->load->view("admin/sliptype/index",$data);
	}

	public function create()
	{
		 $this->load->view("admin/sliptype/create");
	}

	public function tambah_data()
	{
		$kode_sliptype= $this->input->post('kode_sliptype');
		$nama_sliptype = $this->input->post('nama_sliptype');
		$data = array(
			'kode_sliptype' => $kode_sliptype,
			'nama_sliptype' => $nama_sliptype
			);
		$this->m_sliptype->input_data($data,'mst_sliptype');
		redirect('admin/sliptype/index');
	}

	public function edit($id){
		$where = array('kode_sliptype' => $id);
		$data['mst_sliptype'] = $this->m_sliptype->edit_data($where,'mst_sliptype')->result();
		$this->load->view('admin/sliptype/edit',$data);
	}

	public function update(){
		$kode_sliptype= $this->input->post('kode_sliptype');
		$nama_sliptype = $this->input->post('nama_sliptype');


		$data = array(
			'kode_sliptype' => $kode_sliptype,
			'nama_sliptype' => $nama_sliptype
		);

		$where = array(
			'kode_sliptype' => $kode_sliptype
		);

		$this->m_sliptype->update_data($where,$data,'mst_sliptype');
		redirect('admin/sliptype/index');
	}

	public function delete($kode_sliptype){
		$where = array('kode_sliptype' => $kode_sliptype);
		$this->m_sliptype->hapus_data($where,'mst_sliptype');
		redirect('admin/sliptype/index');
	}
}
