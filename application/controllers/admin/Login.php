<?php

class Login extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_petugas');
	}

	public function index()
	{
        // load view admin/overview.php
        $this->load->view("admin/login/login");
        $this->load->model('m_petugas');
	}

	function aksi_login(){
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$where = array(
			'nama_ptgs' => $username,
			// 'password' => md5($password)
			'password_ptgs' => $password
			);
		$cek = $this->m_petugas->cek_login("mst_petugas",$where)->num_rows();
		if($cek > 0){
 
			$data_session = array(
				'nama' => $username,
				'status' => "login"
				);
 
			$this->session->set_userdata($data_session);
 
			redirect(base_url("/index.php/admin"));
 
		}else{			
			$this->load->view('admin/login/login_error');
		}
	}

	function logout(){
		$this->session->sess_destroy();
		redirect(base_url('index.php/admin/login'));
	}
}
