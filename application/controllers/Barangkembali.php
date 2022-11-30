<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barangkembali extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        cekmasuk();

        $this->load->model('Barangkembali_m');
        $this->load->library('form_validation', 'upload');
    }
    public function index()
    {
        $data['title'] = "Barang kembali | Bahan Diseminasi";
        $data['keluarkembali'] = $this->Barangkembali_m->join2inner();
        $data['datakeluar'] = $this->Barangkembali_m->get('barang_keluar');
        $data['barang'] = $this->Barangkembali_m->get('barang');
        $data['satuan'] = $this->Barangkembali_m->get('satuan');
       
        $this->load->view('template/template', $data);
		$this->load->view('Transaksi/barangkembali/v_barangkembali', $data);
        $this->load->view('template/footer', $data);
    }

    public function tambah($id_detailkeluar)
    {
        $data['detailkeluar'] = $this->Barangkembali_m->get('detail_keluar', ['id_detailkeluar' => $id_detailkeluar]);
        $data['barangkeluar'] = $this->Barangkembali_m->get('barang_keluar', ['id_barangkeluar' => $data['detailkeluar']['id_transaksi']]);
        $data['barangkembali'] = $this->Barangkembali_m->get('barang_kembali');
        $ket1 = 'barang.id_barang = detail_keluar.barang_id';
        $ket2 = 'detail_keluar.id_detailkeluar';
        $data['barang'] = $this->Barangkembali_m->join2('detail_keluar', 'barang', $ket1, $ket2, $id_detailkeluar);

        $stokbarang = $data['barang']->jumlah_keluar;
        $stok_valid = $stokbarang + 1;
        
        $this->form_validation->set_rules('tanggal_kembali', 'Tanggal', 'required');
        $this->form_validation->set_rules('jumlah_kembali', 'Jumlah Kembali', 'required');
        $this->form_validation->set_rules(
            'jumlah_kembali',
            'Jumlah Kembali',
            "required|trim|numeric|greater_than[0]|less_than[{$stok_valid}]",
            [
                'less_than' => "Jumlah Kembali tidak boleh lebih dari {$stokbarang}"
            ]
        );
        
        if ($this->form_validation->run() == false) {
            $data['title'] = 'Tambah Data Barang Kembali | Bahan Diseminasi';
            $this->load->view('template/template', $data);
            $this->load->view('Transaksi/Barangkembali/v_tambahbarangkembali', $data);
            $this->load->view('template/footer', $data);

        } else {
            $id_barangkembali = $this->Barangkembali_m->idbkm();
            
            $foto = $_FILES['fotokembali']['name'];
            if ($foto) {
                $config['upload_path'] = './assets/file/barangkembali';
                $config['allowed_types'] = 'jepg|jpg|png';
                $config['max_size']     = '3000';
                $this->load->library('upload', $config);
                if ($this->upload->do_upload('fotokembali')) {
                    $foto = $this->upload->data('file_name');
                } else {
                    $this->session->set_flashdata('error', 'Tipe atau Ukuran Dokumen Tidak Sesuai!');
                    redirect('barangkembali');
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
        
                $config['upload_path'] = './assets/file/Barangkembali';
                $config['allowed_types'] = 'pdf|docx';
                $config['max_size'] = '5000';
                $config['file_name'] = $_FILES['files']['name'][$i];
         
                $this->load->library('upload',$config); 
                $this->upload->initialize($config);
                
                if($this->upload->do_upload('file')){
                    $uploadData = $this->upload->data();
                    $filename = $uploadData['file_name'];
                    $data1[$i] = [
                            'id_transaksi' => $id_barangkembali,
                            'nama_dokumen' => $filename,
                        ];
                    $this->Barangkembali_m->input_data($data1[$i], 'detail_dokumen');
                } else {
                    $this->session->set_flashdata('error', 'Tipe atau Ukuran Dokumen Tidak Sesuai!');
                    redirect('barangkembali');
                }
              }
            } 
            //ambil data  detail barang keluar
            $keluar = $this->Barangkembali_m->get('detail_keluar', ['id_detailkeluar' => $id_detailkeluar]);
            //ambil barang yang sesuai sama detail keluar
            $getbarang = $this->Barangkembali_m->get('barang', ['id_barang' => $keluar['barang_id']]);
            //hitung seluruh jumlah keluar yang idnya sama dengan detail keluar
            $data['jumlahkk'] = $this->Barangkembali_m->sum('barang_kembali', 'jumlah_kembali', $id_detailkeluar);
            $jumlahvalid = $data['jumlahkk'] + $this->input->post('jumlah_kembali');
            // var_dump( $data['jumlahkk'], $keluar['jumlah_keluar']);
            if($jumlahvalid > $keluar['jumlah_keluar']){
                $this->session->set_flashdata('error', 'Barang Kembali Sudah Dikembalikan!');
                redirect('barangkembali');
            }else{
                $databkm = [
                        'id_barangkembali' => $id_barangkembali,
                        'barang_idkeluar'=> $id_detailkeluar,
                        'tanggal_kembali' => $this->input->post('tanggal_kembali'),
                        'jumlah_kembali' => $this->input->post('jumlah_kembali'),
                        'keterangankembali' => $this->input->post('keterangankembali'),
                        'fotokembali' => $foto,
                    ];
                $this->db->insert('barang_kembali', $databkm);
                $where2 = ['id_barang' =>$getbarang['id_barang']];
                $updatestok =  $getbarang['stok'];
                $data2 = [
                        'stok' => (int) $updatestok + $this->input->post('jumlah_kembali')
                    ];
                
                    $this->Barangkembali_m->update_data_stok($where2, $data2, 'barang');
                    $this->session->set_flashdata('sukses', 'Data Barang Kembali Berhasil Ditambahkan');
                    redirect('barangkembali');   
            }
        }
    }

    private function _validasi()
    {
        $this->form_validation->set_rules('tanggal_kembali', 'Tanggal Kembali', 'required|trim');
        $this->form_validation->set_rules('jumlah_kembali', 'Jumlah Kembali', 'required|trim|numeric|greater_than[0]');
    }

    public function edit($id_barangkembali)
    {
        $this-> _validasi();
        $data['detail'] = $this->Barangkembali_m->getDetail($id_barangkembali);
        $data['barang'] = $this->Barangkembali_m->get('barang');
        $ket = 'barang_kembali.id_barangkembali';
        $detaildata = $this->Barangkembali_m->join2innerdetail($ket, $id_barangkembali);
        $data['barangkembali'] = $detaildata;
        $data['barangkeluar'] = $this->Barangkembali_m->get('barang_keluar',['id_barangkeluar'=> $detaildata->id_transaksi] );
        
        $data['title'] = 'Edit Data Barang kembali | Bahan Diseminasi';
        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangkembali/v_editbarangkembali', $data);
        $this->load->view('template/footer', $data);
    }

    public function simpan()
    {
        $id_barangkembali = $this->input->post('id');
        $ket = ['id_barangkembali' => $id_barangkembali];
        $detail = $this->Barangkembali_m->detailupdate('barang_kembali', $ket);
        var_dump($detail);
        $ket2 = ['id_transaksi' => $id_barangkembali];
        
        $foto = $_FILES['fotokembali']['name'];
            if ($foto) {
                $config['upload_path']   = './assets/file/Barangkembali';
                $config['allowed_types'] = 'jepg|jpg|png';
                $config['max_size']      = '3000';
                $this->load->library('upload', $config);
                if ($this->upload->do_upload('fotokembali')) {
                    $foto_lama = $detail->fotokembali;
                    if($foto_lama != 'default.png'){
                    unlink(FCPATH.'/assets/file/Barangkembali/'.$foto_lama);
                    }
                    $foto = $this->upload->data('file_name');
                } else {
                    echo "Unggah file gagal!";
                }
            } else {
                $foto = $detail->fotokembali;
            }

            $data['barangkembali'] = $this->Barangkembali_m->get('barang_kembali', ['id_barangkembali' => $id_barangkembali]);
            $id_barangkeluar = $data['barangkembali']['barang_idkeluar'];
            
            $data = [];
            $count = count($_FILES['files']['name']);

            if(!empty($_FILES['files']['name'][0])){
                $this->Barangkembali_m->hapus_data($ket2, 'detail_dokumen');
          
                for($i=0;$i<$count;$i++){
                    if(!empty($_FILES['files']['name'][$i])){
            
                    $_FILES['file']['name'] = $_FILES['files']['name'][$i];
                    $_FILES['file']['type'] = $_FILES['files']['type'][$i];
                    $_FILES['file']['tmp_name'] = $_FILES['files']['tmp_name'][$i];
                    $_FILES['file']['error'] = $_FILES['files']['error'][$i];
                    $_FILES['file']['size'] = $_FILES['files']['size'][$i];
            
                    $config['upload_path'] = './assets/file/Barangkembali';
                    $config['allowed_types'] = 'pdf|docx';
                    $config['max_size'] = '5000';
                    $config['file_name'] = $_FILES['files']['name'][$i];
            
                    $this->load->library('upload',$config); 
                    $this->upload->initialize($config);
                   
                    if($this->upload->do_upload('file')){
                        $uploadData = $this->upload->data();
                        $filename = $uploadData['file_name'];
                        $data1[$i] = [
                                'id_transaksi' => $detail->id_barangkembali,
                                'nama_dokumen' => $filename,
                            ];
                        $this->Barangkembali_m->input_data($data1[$i], 'detail_dokumen');
                    }
                    }
                }
            } 

        $databkm = [
            'tanggal_kembali' => $this->input->post('tanggal_kembali'),
            'barang_idkeluar' => $detail->barang_idkeluar,
            'jumlah_kembali' => $this->input->post('jumlah_kembali'),
            'keterangankembali' => $this->input->post('keterangankembali'),
            'fotokembali' => $foto,
        ]; 
        $keta = 'detail_keluar.id_detailkeluar = barang_kembali.barang_idkeluar';
        $ketb = 'barang_kembali.id_barangkembali';
        $barang = $this->Barangkembali_m->join2('barang_kembali', 'detail_keluar', $keta, $ketb, $id_barangkembali);
        $barang_id = $barang->barang_id;
        $detailbarang = $this->Barangkembali_m->get('barang', ['id_barang' => $barang_id]);
        $stok = $detailbarang['stok'];
        $jmlhkembali = $barang->jumlah_kembali;
        $where2 = ['id_barang' => $barang_id];
        $data2 = [
            'stok' => (int) $stok - $jmlhkembali + $this->input->post('jumlah_kembali')
        ];
        $this->Barangkembali_m->update_data_stok($where2, $data2, 'barang');
        $this->Barangkembali_m->update('barang_kembali', $databkm, $ket);
        $this->session->set_flashdata('sukses', 'Data Barang kembali Berhasil Diubah');
        redirect('barangkembali');
    }

    public function detail($id_detailkeluar)
    {
        $data['title'] = 'Detail Data Barang Kembali | Bahan Diseminasi';
        $ket = 'barang_kembali.id_barangkembali';
        $detaildata = $this->Barangkembali_m->join2innerdetail($ket, $id_detailkeluar);
        $data['detaildata'] = $detaildata;
        $barang_id = $detaildata->barang_id;
        $ket1 = 'jenis.id_jenis = barang.jenis_id';
        $ket2 = 'satuan.id = barang.satuan_id';
        $ket3 = 'barang.id_barang';
        $detailbarang = $this->Barangkembali_m->join3('barang', 'jenis', 'satuan', $ket1, $ket2, $ket3, $detaildata->barang_id);
        $data['detailbarang'] = $detailbarang;
        $data['keluar'] = $this->Barangkembali_m->get('barang_keluar');
        $keta = ['id_transaksi' => $id_detailkeluar];
        $data['dok'] = $this->Barangkembali_m->get2('detail_dokumen', $keta);

        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangkembali/v_detailbarangkembali', $data);
        $this->load->view('template/footer', $data);
    }

    public function hapus($id_barangkembali)
	{
        $keta = 'detail_keluar.id_detailkeluar = barang_kembali.barang_idkeluar';
        $ketb = 'barang_kembali.id_barangkembali';
        $barang = $this->Barangkembali_m->join2('barang_kembali', 'detail_keluar', $keta, $ketb, $id_barangkembali);
        $barang_id = $barang->barang_id;
        $detailbarang = $this->Barangkembali_m->get('barang', ['id_barang' => $barang_id]);
        $stok = $detailbarang['stok'];
        $jmlhkembali = $barang->jumlah_kembali;
        $where2 = ['id_barang' => $barang_id];
        $data2 = [
            'stok' => (int) $stok - $jmlhkembali
        ];

        $this->Barangkembali_m->update_data_stok($where2, $data2, 'barang');
        $where = array('id_barangkembali' => $id_barangkembali);
		$this->Barangkembali_m->hapus_data($where, 'barang_kembali');
        $this->session->set_flashdata('sukses', 'Data Barang kembali Berhasil Dihapus');
		redirect('barangkembali');
	}

    public function pdf($id_barangkembali)
    {
        // Ambil Data Barang Keluar
        $kop = $this->Barangkembali_m->getkop('data_header_surat');
        $this->data['kop'] = $kop;
        $detail = $this->Barangkembali_m->detail_data($id_barangkembali);
        $this->data['detail'] = $detail;
        $barang_id = $detail->barang_id;
        $ket1 = 'jenis.id_jenis = barang.jenis_id';
        $ket2 = 'satuan.id = barang.satuan_id';
        $ket3 = 'barang.id_barang';
        $detailbarang = $this->Barangkembali_m->join3km('barang', 'jenis', 'satuan', $ket1, $ket2, $ket3, $barang_id);
        $this->data['detailbarang'] = $detailbarang;
        
        // var_dump($detail);
        // var_dump($detailbarang);
        // var_dump($barang_id);

        // panggil library yang kita buat sebelumnya yang bernama pdfgenerator
        $this->load->library('pdfgenerator');
        
        // title dari pdf
        $this->data['title_pdf'] = 'Berita Acara Bahan Diseminasi';
        
        // filename dari pdf ketika didownload
        $file_pdf = 'berita_acara_barang_diseminasi';

        // setting paper
        $paper = 'A4';

        //orientasi paper potrait / landscape
        $orientation = "portrait";
        
		$html=$this->load->view('pdf/v_beritaacarakembali', $this->data, true);	    
        
        // run dompdf
        $this->pdfgenerator->generate($html, $file_pdf,$paper,$orientation);
    }

    public function upload($id_barangkembali)
    {
        $data['title'] = 'Tambah Berita Acara Barang Kembali | Bahan Diseminasi';
        $data['barangkembali'] = $this->Barangkembali_m->get('barang_kembali', ['id_barangkembali'=>$id_barangkembali]);
       
        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangkembali/v_uploadbap', $data);
        $this->load->view('template/footer', $data);
    }

    public function uploaddok()
    {
        $id_barangkembali = $this->input->post('id');
        $ket = ['id_barangkembali' => $id_barangkembali];
        $detail = $this->Barangkembali_m->detailupdate('barang_kembali', $ket);
        $beritakembali = $_FILES['beritakembali']['name'];
        if ($beritakembali) {
            $config['upload_path'] = './assets/file/barangkembali';
            $config['allowed_types'] = 'pdf|docx';
            $config['max_size']     = '50000';
            $this->load->library('upload', $config);
            if ($this->upload->do_upload('beritakembali')) {
                $beritaacara1 = $this->upload->data('file_name');
            } else {
                $this->session->set_flashdata('error', 'Tipe atau Ukuran Dokumen Tidak Sesuai!');
                redirect('barangkembali');
            }
        } else {
            $beritaacara1 = $detail->beritaacara;
        }
        $databk = [
            'id_barangkembali' => $id_barangkembali,
            'beritakembali' => $beritaacara1
        ];
       
        $this->Barangkembali_m->update('barang_kembali', $databk, $ket);
        $this->session->set_flashdata('sukses', 'Berita Acara Barang Kembali Berhasil Ditambahkan');
        redirect('barangkembali');
    }
}
