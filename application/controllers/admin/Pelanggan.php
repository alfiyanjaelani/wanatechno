<?php

class Pelanggan extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_pelanggan');
		$this->load->helper('url');

	}

	public function index()
	{
		$data['mst_pelanggan'] = $this->m_pelanggan->ambil_data()->result();
        $this->load->view("admin/pelanggan/index",$data);
	}

	public function create()
	{
		 $this->load->view("admin/pelanggan/create");
	}

	public function tambah_data()
	{
		$kode_pelanggan="PL01";
		$nama_pelanggan = $this->input->post('nama_pelanggan');
		$alamat_pelanggan = $this->input->post('alamat_pelanggan');
		$no_tlp = $this->input->post('no_tlp');
		$status_pelanggan = $this->input->post('status_pelanggan');
		$data = array(
			'kode_pelanggan' => $kode_pelanggan,
			'nama_pelanggan' => $nama_pelanggan,
			'alamat_pelanggan' => $alamat_pelanggan,
			'no_tlp' => $no_tlp,
			'status_pelanggan' => $status_pelanggan
			);
		$this->m_pelanggan->input_data($data,'mst_pelanggan');
		redirect('admin/pelanggan/index');
	}

	public function edit($id){
		$where = array('kode_pelanggan' => $id);
		$data['mst_pelanggan'] = $this->m_pelanggan->edit_data($where,'mst_pelanggan')->result();
		$this->load->view('admin/pelanggan/edit',$data);
	}

	public function update(){
		$kode_pelanggan = $this->input->post('kode_pelanggan');
		$nama_pelanggan = $this->input->post('nama_pelanggan');
		$alamat_pelanggan = $this->input->post('alamat_pelanggan');
		$no_tlp = $this->input->post('no_tlp');
		$status_pelanggan = $this->input->post('status_pelanggan');


		$data = array(
			'kode_pelanggan' => $kode_pelanggan,
			'nama_pelanggan' => $nama_pelanggan,
			'alamat_pelanggan' => $alamat_pelanggan,
			'no_tlp' => $no_tlp,
			'status_pelanggan' => $status_pelanggan
		);

		$where = array(
			'kode_pelanggan' => $kode_pelanggan
		);

		$this->m_pelanggan->update_data($where,$data,'mst_pelanggan');
		redirect('admin/pelanggan/index');
	}

	public function delete($kode_pelanggan){
		$where = array('kode_pelanggan' => $kode_pelanggan);
		$this->m_pelanggan->hapus_data($where,'mst_pelanggan');
		redirect('admin/pelanggan/index');
	}
}
