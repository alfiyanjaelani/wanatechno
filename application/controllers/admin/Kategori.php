<?php

class Kategori extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_kategori');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['mst_kategori'] = $this->m_kategori->ambil_data()->result();
        $this->load->view("admin/kategori/index",$data);
	}

	public function create()
	{
		 $this->load->view("admin/kategori/create");
	}

	public function tambah_data()
	{
		$kode_kategori="K001";
		$nama_kategori = $this->input->post('nama_kategori');
		$data = array(
			'kode_kategori' => $kode_kategori,
			'nama_kategori' => $nama_kategori
			);
		$this->m_kategori->input_data($data,'mst_kategori');
		redirect('admin/kategori/index');
	}

	public function edit($id){
		$where = array('kode_kategori' => $id);
		$data['mst_kategori'] = $this->m_kategori->edit_data($where,'mst_kategori')->result();
		$this->load->view('admin/kategori/edit',$data);
	}

	public function update(){
		$kode_kategori = $this->input->post('kode_kategori');
		$nama_kategori = $this->input->post('nama_kategori');

		$data = array(
			'kode_kategori' => $kode_kategori,
			'nama_kategori' => $nama_kategori
		);

		$where = array(
			'kode_kategori' => $kode_kategori
		);

		$this->m_kategori->update_data($where,$data,'mst_kategori');
		redirect('admin/kategori/index');
	}

	public function delete($kode_kategori){
		$where = array('kode_kategori' => $kode_kategori);
		$this->m_kategori->hapus_data($where,'mst_kategori');
		redirect('admin/kategori/index');
	}
}
