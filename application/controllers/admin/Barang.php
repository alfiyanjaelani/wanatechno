<?php

class Barang extends CI_Controller {
    public function __construct()
    {
		parent::__construct();
		$this->load->model('m_barang');
		$this->load->helper('url');
		$this->load->library('form_validation');

	}

	public function index()
	{
		$data['mst_barang'] = $this->m_barang->ambil_data()->result();
        $this->load->view("admin/barang/index",$data);
	}

	public function create()
	{
		$data['dd_divisi'] = $this->m_barang->getdddivisi();

		 $this->load->view("admin/barang/create",$data);
	}

	public function tambah_data()
	{

		$this->form_validation->set_rules('part_name','Part Name','required');
		$this->form_validation->set_rules('satuan','Satuan','required');
		$this->form_validation->set_rules('stock','Stock','required');
		$this->form_validation->set_rules('part_no','Part No','required');

		if($this->form_validation->run() != false){
			$part_name = $this->input->post('part_name');
			$kode_divisi = $this->input->post('kode_divisi');
			$part_no= $this->input->post('part_no');
			$satuan = $this->input->post('satuan');
			$stock = $this->input->post('stock');
			$data = array(
				'part_no' => $part_no,
				'part_name' => $part_name,
				'kode_divisi' => $kode_divisi,
				'satuan' => $satuan,
				'stock' => $stock
			);
			$this->m_barang->input_data($data,'mst_barang');
			redirect('admin/barang/index');
		}else{
			$this->load->view('admin/barang/edit_error');
		}

		
	}

	public function edit($id){
		$where = array('part_no' => $id);
		$data['mst_barang'] = $this->m_barang->edit_data($where,'mst_barang')->result();
		$this->load->view('admin/barang/edit',$data);
	}

	public function update(){
		$part_no = $this->input->post('part_no');
		$part_name = $this->input->post('part_name');
		$kode_divisi = $this->input->post('kode_divisi');
		$satuan = $this->input->post('satuan');
		$stock = $this->input->post('stock');


		$data = array(
			'part_no' => $part_no,
			'part_name' => $part_name,
			'kode_divisi' => $kode_divisi,
			'satuan' => $satuan,
			'stock' => $stock
		);

		$where = array(
			'part_no' => $part_no
		);

		$this->m_barang->update_data($where,$data,'mst_barang');
		redirect('admin/barang/index');
	}

	public function delete($part_no){
		$where = array('part_no' => $part_no);
		$this->m_barang->hapus_data($where,'mst_barang');
		redirect('admin/barang/index');
	}

	public function barang_masuk()
	{
	 $this->load->view("admin/barang/barang_masuk");
	}


}
