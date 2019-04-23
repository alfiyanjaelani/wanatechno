<?php

class Destination extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_destination');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['mst_destination'] = $this->m_destination->ambil_data()->result();
        $this->load->view("admin/destination/index",$data);
	}

	public function create()
	{
		 $this->load->view("admin/destination/create");
	}

	public function tambah_data()
	{
		$kode_destination= $this->input->post('kode_destination');
		$nama_destination = $this->input->post('nama_destination');
		$data = array(
			'kode_destination' => $kode_destination,
			'nama_destination' => $nama_destination
			);
		$this->m_destination->input_data($data,'mst_destination');
		redirect('admin/destination/index');
	}

	public function edit($id){
		$where = array('kode_destination' => $id);
		$data['mst_destination'] = $this->m_destination->edit_data($where,'mst_destination')->result();
		$this->load->view('admin/destination/edit',$data);
	}

	public function update(){
		$kode_destination= $this->input->post('kode_destination');
		$nama_destination = $this->input->post('nama_destination');


		$data = array(
			'kode_destination' => $kode_destination,
			'nama_destination' => $nama_destination
		);

		$where = array(
			'kode_destination' => $kode_destination
		);

		$this->m_destination->update_data($where,$data,'mst_destination');
		redirect('admin/destination/index');
	}

	public function delete($kode_destination){
		$where = array('kode_destination' => $kode_destination);
		$this->m_destination->hapus_data($where,'mst_destination');
		redirect('admin/destination/index');
	}
}
