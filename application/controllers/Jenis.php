<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jenis extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        cekmasuk();

        $this->load->Model('Jenis_m');
    }

    public function index()
    {
        $data['jenis'] = $this->Jenis_m->tampil_data('jenis')->result();
        $data['title'] = "Jenis Barang | Bahan Diseminasi";
        $this->load->view('template/template',$data);
		$this->load->view('DataMaster/jenis/v_jenis',$data);
        $this->load->view('template/footer',$data);
    }

    private function _validasi()
    {
        $this->form_validation->set_rules('nama_jenis', 'Nama Jenis', 'required|trim|alpha');
    }

    public function tambah()
	{
        $this-> _validasi();
		$data['title'] = 'Tambah Jenis Barang | Bahan Diseminasi';
        $this->load->view('template/template',$data);
		$this->load->view('DataMaster/jenis/v_tambahjenis',$data);
        $this->load->view('template/footer',$data);
    }

    public function tambah_aksi()
    {
        $this->form_validation->set_rules('nama_jenis', 'Nama Jenis', 'required|trim|alpha');
        if ($this->form_validation->run() == false) {
            $data['title'] = 'Tambah Jenis Barang | Bahan Diseminasi';
            $this->load->view('template/template',$data);
		    $this->load->view('DataMaster/jenis/v_tambahjenis',$data);
            $this->load->view('template/footer',$data);
        } else {
            $jenis = $this->input->post('nama_jenis');
            $data = array(
                'nama_jenis' =>$jenis,
            );
            $this->Jenis_m->input_data($data, 'jenis');
            $this->session->set_flashdata('sukses', 'Data Jenis Barang Berhasil Ditambahkan');
            redirect('jenis');
        }
    }

    public function edit($id_jenis)
    {
        $where = array('id_jenis' => $id_jenis);
        $data['jenis'] = $this->db->query("SELECT * FROM jenis WHERE id_jenis='$id_jenis'")->result();
        $data['title'] = "Edit Data Jenis Barang | Bahan Diseminasi";
        $this->load->view('template/template',$data);
		$this->load->view('DataMaster/jenis/v_editjenis',$data);
        $this->load->view('template/footer',$data);
    }

    public function update()
    {
        $id_jenis = $this->input->post('id');
        $data['jenis'] = $this->db->query("SELECT * FROM jenis WHERE id_jenis='$id_jenis'")->result();
        $jenis = $this->input->post('nama_jenis');
        $data = array(
            'nama_jenis' =>$jenis,
        );
        $where = array(
            'id_jenis' => $id_jenis
        );
        $this->load->Model('Jenis_m');
        $this->Jenis_m->update_data($where, $data, 'jenis');
        $this->session->set_flashdata('sukses', 'Data Jenis Barang Berhasil Diubah');
        redirect('jenis');
    }

    public function hapus($id_jenis)
	{
		$where = array('id_jenis' => $id_jenis);
		$this->Jenis_m->hapus_data($where, 'jenis');
        $this->session->set_flashdata('sukses', 'Data Jenis Barang Berhasil Dihapus');
		redirect('jenis');
	}
}