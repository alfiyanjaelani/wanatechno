<?php

class Divisi extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_divisi');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['mst_divisi'] = $this->m_divisi->ambil_data()->result();
        $this->load->view("admin/divisi/index",$data);
	}

	public function create()
	{
		 $this->load->view("admin/divisi/create");
	}

	public function tambah_data()
	{
		$kode_divisi= $this->input->post('kode_divisi');
		$nama_divisi = $this->input->post('nama_divisi');
		$data = array(
			'kode_divisi' => $kode_divisi,
			'nama_divisi' => $nama_divisi
			);
		$this->m_divisi->input_data($data,'mst_divisi');
		redirect('admin/divisi/index');
	}

	public function edit($id){
		$where = array('kode_divisi' => $id);
		$data['mst_divisi'] = $this->m_divisi->edit_data($where,'mst_divisi')->result();

		$this->load->view('admin/divisi/edit',$data);
	}

	public function update(){
		$kode_divisi= $this->input->post('kode_divisi');
		$nama_divisi = $this->input->post('nama_divisi');


		$data = array(
			'kode_divisi' => $kode_divisi,
			'nama_divisi' => $nama_divisi
		);

		$where = array(
			'kode_divisi' => $kode_divisi
		);

		$this->m_divisi->update_data($where,$data,'mst_divisi');
		redirect('admin/divisi/index');
	}

	public function delete($kode_divisi){
		$where = array('kode_divisi' => $kode_divisi);
		$this->m_divisi->hapus_data($where,'mst_divisi');
		redirect('admin/divisi/index');
	}
}
