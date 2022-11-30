<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barangmasuk extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        cekmasuk();
        
        $this->load->model('Barangmasuk_m');
        $this->load->model('Databarang_m');
        $this->load->library('form_validation', 'upload');
    }
    public function index()
    {
        $data['title'] = "Barang Masuk | Bahan Diseminasi";
        $data['barangmasuk'] = $this->Barangmasuk_m->getBarangMasuk();
        $this->load->view('template/template', $data);
		$this->load->view('Transaksi/barangmasuk/v_barangmasuk', $data);
        $this->load->view('template/footer', $data);
    }

    private function _validasi()
    {
        $this->form_validation->set_rules('tanggal_masuk', 'Tanggal Masuk', 'required|trim');
        $this->form_validation->set_rules('barang_id', 'Barang', 'required');
        $this->form_validation->set_rules('jumlah_masuk', 'Jumlah Masuk', 'required|trim|numeric|greater_than[0]');
    }
    
    public function tambah()
    {
        $barang = $this->Barangmasuk_m->get('barang');
        $data['barang'] = $barang;

        $data['title'] = 'Tambah Barang Masuk | Bahan Diseminasi';
        $this->form_validation->set_rules('tanggal_masuk', 'Tanggal', 'required');
        $this->form_validation->set_rules('barang_id', 'barang', 'required');
        $this->form_validation->set_rules('jumlah_masuk', 'jumlah masuk', 'required');

        if ($this->form_validation->run() == false) {
            $this->load->view('template/template', $data);
            $this->load->view('Transaksi/Barangmasuk/v_tambahbarangmasuk', $data);
            $this->load->view('template/footer', $data);
        } else {
            $id_barangmasuk = $this->Barangmasuk_m->idsm();
            
            $foto = $_FILES['foto']['name'];
            if ($foto) {
                $config['upload_path'] = './assets/file/Barangmasuk';
                $config['allowed_types'] = 'jepg|jpg|png';
                $config['max_size']     = '3000';
                $this->load->library('upload', $config);
                if ($this->upload->do_upload('foto')) {
                    $foto = $this->upload->data('file_name');
                } else {
                    $this->session->set_flashdata('error', 'Tipe atau Ukuran Dokumen Tidak Sesuai!');
                    redirect('barangmasuk/tambah');
                }
            } else {
                $foto = 'default.png';
            }

            $data = [];
            $count = count($_FILES['files']['name']);
          
            for($i=0;$i<$count;$i++){
              if(!empty($_FILES['files']['name'][$i])){
          
                $_FILES['file']['name'] = $_FILES['files']['name'][$i];
                $_FILES['file']['type'] = $_FILES['files']['type'][$i];
                $_FILES['file']['tmp_name'] = $_FILES['files']['tmp_name'][$i];
                $_FILES['file']['error'] = $_FILES['files']['error'][$i];
                $_FILES['file']['size'] = $_FILES['files']['size'][$i];
        
                $config['upload_path'] = './assets/file/Barangmasuk';
                $config['allowed_types'] = 'pdf|docx';
                $config['max_size'] = '5000';
                $config['file_name'] = $_FILES['files']['name'][$i];
         
                $this->load->library('upload',$config); 
                $this->upload->initialize($config);
               
                if($this->upload->do_upload('file')){
                    $uploadData = $this->upload->data();
                    $filename = $uploadData['file_name'];
                    $data1[$i] = [
                            'id_transaksi' =>$id_barangmasuk,
                            'nama_dokumen' => $filename,
                        ];
                    $this->Barangmasuk_m->input_data($data1[$i], 'detail_dokumen');
                } else {
                    $this->session->set_flashdata('error', 'Tipe atau Ukuran Dokumen Tidak Sesuai!');
                    redirect('barangmasuk/tambah');
                }
              }
            }
        
            $databm = [
                'id_barangmasuk' => $id_barangmasuk,
                'tanggal_masuk' => $this->input->post('tanggal_masuk'),
                'barang_id' => $this->input->post('barang_id'),
                'jumlah_masuk' => $this->input->post('jumlah_masuk'),
                'foto' => $foto,
                'keterangan' => $this->input->post('keterangan')
            ];
            $this->db->insert('barang_masuk', $databm);
            $barang_id = $this->input->post('barang_id');
            $where2 = ['id_barang' => $barang_id];
            $barangbr = $this->barangmasuk_m->get('barang', ['id_barang' => $barang_id]);
            $stokskg = $barangbr['stok'];
            $jumlahmasuk = $this->input->post('jumlah_masuk');
            $data2 = [
                'stok' => (int) $stokskg + $jumlahmasuk
            ];
            
            $this->Barangmasuk_m->update_data_stok($where2, $data2, 'barang');
            $this->session->set_flashdata('sukses', 'Data Barang Masuk Berhasil Ditambahkan');
            redirect('barangmasuk');
        }
    }
    
	public function edit($id_barangmasuk)
    {
        $this->_validasi();
        $data['detail'] = $this->Barangmasuk_m->getDetail($id_barangmasuk);
        $data['barang'] = $this->Barangmasuk_m->get('barang');
        $data['barangmasuk'] = $this->Barangmasuk_m->get('barang_masuk', ['id_barangmasuk' => $id_barangmasuk]);

        $data['title'] = 'Edit Data Barang Masuk | Bahan Diseminasi';
        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangmasuk/v_editbarangmasuk', $data);
        $this->load->view('template/footer', $data);
    }

    public function simpan()
    {
        $id_barangmasuk = $this->input->post('id');
        $ket = ['id_barangmasuk' => $id_barangmasuk];
        $ket2 = ['id_transaksi' => $id_barangmasuk];
        $detail = $this->Barangmasuk_m->detailupdate('barang_masuk', $ket);
        
        $foto = $_FILES['foto']['name'];
        if ($foto) {
            $config['upload_path']   = './assets/file/Barangmasuk';
            $config['allowed_types'] = 'jepg|jpg|png';
            $config['max_size']      = '3000';
            $this->load->library('upload', $config);
            if ($this->upload->do_upload('foto')) {
                $foto_lama = $detail->foto;
                if($foto_lama != 'default.png'){
                unlink(FCPATH.'/assets/file/Barangmasuk/'.$foto_lama);
                }
                $foto = $this->upload->data('file_name');
            } else {
                echo "Unggah file gagal!";
            }
        } else {
            $foto = $detail->foto;
        }
        
        $data = [];
        $count = count($_FILES['files']['name']);
        $id_barangmasuk = $this->Barangmasuk_m->idsm();

        if(!empty($_FILES['files']['name'][0])){
            $this->Barangmasuk_m->hapus_data($ket2, 'detail_dokumen');
        
            for($i=0;$i<$count;$i++){
                if(!empty($_FILES['files']['name'][$i])){
            
                $_FILES['file']['name'] = $_FILES['files']['name'][$i];
                $_FILES['file']['type'] = $_FILES['files']['type'][$i];
                $_FILES['file']['tmp_name'] = $_FILES['files']['tmp_name'][$i];
                $_FILES['file']['error'] = $_FILES['files']['error'][$i];
                $_FILES['file']['size'] = $_FILES['files']['size'][$i];
        
                $config['upload_path'] = './assets/file/Barangmasuk';
                $config['allowed_types'] = 'pdf|docx';
                $config['max_size'] = '5000';
                $config['file_name'] = $_FILES['files']['name'][$i];
            
                $this->load->library('upload',$config); 
                $this->upload->initialize($config);
                
                if($this->upload->do_upload('file')){
                    $uploadData = $this->upload->data();
                    $filename = $uploadData['file_name'];
                    $data1[$i] = [
                            'id_transaksi' =>$detail->id_barangmasuk,
                            'nama_dokumen' => $filename,
                        ];
                    $this->Barangmasuk_m->input_data($data1[$i], 'detail_dokumen');
                } 
                }
            }
        }
        
        $databm = [
            'tanggal_masuk' => $this->input->post('tanggal_masuk'),
            'barang_id' => $detail->barang_id,
            'jumlah_masuk' => $this->input->post('jumlah_masuk'),
            'keterangan' => $this->input->post('keterangan'),
            'foto' => $foto,
        ];
        $barang_id = $detail->barang_id;
        $databarang = $this->Barangmasuk_m->get('barang', ['id_barang'=>$barang_id]);
            $where2 = ['id_barang' => $barang_id];
            $stokbarang = $databarang['stok'];
            $jumlahmasuk = $this->input->post('jumlah_masuk');
            $data2 = [
                'stok' => (int) $stokbarang - $detail->jumlah_masuk + $jumlahmasuk
            ];
        $this->Barangmasuk_m->update_data_stok($where2, $data2, 'barang');
        $this->Barangmasuk_m->update('barang_masuk', $databm, $ket);
        $this->session->set_flashdata('sukses', 'Data Barang Masuk Berhasil Diubah');
        redirect('barangmasuk');
    }
    
    public function detail($id_barangmasuk)
    {
        $data['title'] = 'Detail Data Barang Masuk | Bahan Diseminasi';
        $detail = $this->Barangmasuk_m->detail_data($id_barangmasuk);
        $data['detail'] = $detail;
        $barang_id = $detail->barang_id;
        $ket1 = 'jenis.id_jenis = barang.jenis_id';
        $ket2 = 'satuan.id = barang.satuan_id';
        $ket3 = 'barang.id_barang';
        $detailbarang = $this->Barangmasuk_m->join3('barang', 'jenis', 'satuan', $ket1, $ket2, $ket3, $barang_id);
        $data['detailbarang'] = $detailbarang;
        $ket = ['id_transaksi' => $id_barangmasuk];
        $data['dok'] = $this->Barangmasuk_m->get2('detail_dokumen', $ket);
        
        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangmasuk/v_detailbarangmasuk', $data);
        $this->load->view('template/footer', $data);
    }

    function hapus($id_barangmasuk)
	{
        $ket = ['id_barangmasuk' => $id_barangmasuk];
        $detail = $this->Barangmasuk_m->detailupdate('barang_masuk', $ket);
		$where = array('id_barangmasuk' => $id_barangmasuk);
		$this->Databarang_m->hapus_data($where, 'barang_masuk');
        $barang_id = $detail->barang_id;
        $databarang = $this->barangmasuk_m->get('barang', ['id_barang'=>$barang_id]);
            $where2 = ['id_barang' => $barang_id];
            $stokbarang = $databarang['stok'];
            $data2 = [
                'stok' => (int) $stokbarang - $detail->jumlah_masuk
            ];
        $this->Barangmasuk_m->update_data_stok($where2, $data2, 'barang');
        $this->session->set_flashdata('sukses', 'Data Barang Masuk Berhasil Dihapus');
		redirect('barangmasuk');
	}

}