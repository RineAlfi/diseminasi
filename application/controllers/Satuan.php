<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Satuan extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->Model('Satuan_m');
        $this->load->helper('url');
        $this->load->library('session');
        if ($this->session->userdata('logged_in') == false) {
            redirect('masuk');
        }
    }
    
    public function index()
    {
        $data['satuan'] = $this->Satuan_m->tampil_data('satuan')->result();
        $data['title'] = "Satuan Barang | Bahan Diseminasi";
        $this->load->view('template/template',$data);
		$this->load->view('DataMaster/satuan/v_satuan',$data);
        $this->load->view('template/footer',$data);
    }

    public function tambah()
	{
		$data['title'] = 'Tambah Satuan Barang | Bahan Diseminasi';
        $this->load->view('template/template',$data);
		$this->load->view('DataMaster/satuan/v_tambahsatuan',$data);
        $this->load->view('template/footer',$data);
    }

    public function tambah_aksi()
    {
        $this->form_validation->set_rules('nama_satuan', 'Nama Satuan', 'required|alpha');
        if ($this->form_validation->run() == false) {
            $data['title'] = 'Tambah Satuan Barang | Bahan Diseminasi';
            $this->load->view('template/template',$data);
		    $this->load->view('DataMaster/satuan/v_tambahsatuan',$data);
            $this->load->view('template/footer',$data);
        } else {
            $satuan = $this->input->post('nama_satuan');
            $data = array(
                'nama_satuan' =>$satuan,
            );
            $this->Satuan_m->input_data($data, 'satuan');
            $this->session->set_flashdata('sukses', 'Data Satuan Barang Berhasil Ditambahkan');
            redirect('satuan');
        }
    }

    public function edit($id)
    {
        $where = array('id' => $id);
        $data['satuan'] = $this->db->query("SELECT * FROM satuan WHERE id='$id'")->result();
        $data['title'] = "Edit Data Satuan Barang | Bahan Diseminasi";
        $this->load->view('template/template',$data);
		$this->load->view('DataMaster/satuan/v_editsatuan',$data);
        $this->load->view('template/footer',$data);
    }

    public function update()
    {
        $id = $this->input->post('id');
        $data['satuan'] = $this->db->query("SELECT * FROM satuan WHERE id='$id'")->result();
        $satuan = $this->input->post('nama_satuan');
        $data = array(
            'nama_satuan' =>$satuan,
        );
        $where = array(
            'id' => $id
        );
        $this->load->Model('satuan_m');
        $this->Satuan_m->update_data($where, $data, 'satuan');
        $this->session->set_flashdata('sukses', 'Data Satuan Barang Berhasil Diubah');
        redirect('satuan');
    }
    
    public function hapus($id)
	{
		$where = array('id' => $id);
		$this->Satuan_m->hapus_data($where, 'satuan');
        $this->session->set_flashdata('sukses', 'Data Satuan Barang Berhasil Dihapus');
		redirect('satuan');
	}

    public function keluarsistem()
    {
        $this->session->unset_userdata('email');
        $this->session->unset_userdata('role');
        $data = [
            'email' => '',
            'logged_in' => false,
            'role' => '',
        ];
        $this->session->sess_destroy();
        redirect('masuk');
    }
}