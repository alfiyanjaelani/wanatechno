<?php

class Register extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_petugas');
		$this->load->helper('url');

	}

	public function index()
	{
        // load view admin/overview.php
        $this->load->view("admin/login/register");
	}

	public function tambah_data()
	{
		$nama = $this->input->post('nama_ptgs');
		$passwordptgs = $this->input->post('password_ptgs');
		$statusptgs = $this->input->post('status_ptgs');

		$data = array(
			'nama_ptgs' => $nama,
			'password_ptgs' => $passwordptgs,
			'status_ptgs' => $statusptgs
			);
		$this->m_petugas->input_data($data,'mst_petugas');
		redirect('admin/login/index');
	}
}
