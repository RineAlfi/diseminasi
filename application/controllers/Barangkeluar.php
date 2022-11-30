<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barangkeluar extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        cekmasuk();

        $this->load->model('Barangkeluar_m');
        $this->load->library('form_validation', 'upload');
    }
    public function index()
    {
        $data['title'] = "Barang Keluar | Bahan Diseminasi";
        $data['detailkeluar'] = $this->Barangkeluar_m->join2inner();
        $data['barangkeluar'] = $this->Barangkeluar_m->get('barang_keluar');
        $this->load->view('template/template', $data);
		$this->load->view('Transaksi/barangkeluar/v_barangkeluar', $data);
        $this->load->view('template/footer', $data);
    }

    public function tambah()
    {
        $data['barang'] = $this->Barangkeluar_m->join2satuan2();
      
        $this->form_validation->set_rules('tanggal_keluar', 'Tanggal', 'required');

        if ($this->form_validation->run() == false) {
            $data['title'] = 'Tambah Barang Keluar | Bahan Diseminasi';
            $this->load->view('template/template', $data);
            $this->load->view('Transaksi/Barangkeluar/v_tambahbarangkeluar', $data);
            $this->load->view('template/footer', $data);
        } else {
        }
    }

    public function save()
    {
        $id_barangkeluar = $this->Barangkeluar_m->idbk();
        $databk = [
            'id_barangkeluar' => $id_barangkeluar,
            'tanggal_keluar' => $this->input->post('tanggal_keluar'),
            'keterangan' => $this->input->post('keterangan')
        ];
        $barang_id = $_POST['barang_id'];
        $jumlah_keluar = $_POST['jumlah_keluar']; 
        $data = array();
        
        $index = 0;
        foreach($barang_id as $bi){ 
            $ket = ['id_barang' => $barang_id[$index]];
            $databarang = $this->Barangkeluar_m->get('barang',$ket);
            $stokbarang = $databarang['stok'];
       
           if($jumlah_keluar[$index] > $stokbarang){
            $this->session->set_flashdata('error', 'Stok Kurang!');
            redirect('barangkeluar/tambah');
            die;
           }
            
            $index++;
        }

        $index2 = 0;
        foreach($barang_id as $bi){ 
            $ket = ['id_barang' => $barang_id[$index2]];
            $databarang = $this->Barangkeluar_m->get('barang',$ket);
            $stokbarang = $databarang['stok'];
            $inputstok = $stokbarang - $jumlah_keluar[$index2];
            $datastok = ['stok'=> $inputstok];
            $this->Barangkeluar_m->update_data_stok($ket, $datastok, 'barang');

               array_push($data, array(
                   'id_transaksi'=>$id_barangkeluar,  
                   'barang_id'=>$barang_id[$index2],
                   'jumlah_keluar'=>$jumlah_keluar[$index2],
               ));
            
            $index2++;
        }
        
        $this->db->insert('barang_keluar', $databk);
        $sql = $this->Barangkeluar_m->save_batch($data);
        if($sql){ // Jika sukses
            $this->session->set_flashdata('sukses', 'Data Barang Keluar Berhasil Ditambahkan');
            redirect('barangkeluar');
        }else{ // Jika gagal
            $this->session->set_flashdata('error', 'Data Barang Keluar Gagal Ditambahkan!');
            redirect('barangkeluar/v_tambahbarangkeluar');
        }
    }

    public function edit($id_detailkeluar)
    {
        $data['title'] = 'Edit Data Barang Keluar | Bahan Diseminasi';
        $data['detail'] = $this->Barangkeluar_m->getDetail($id_detailkeluar);
        $data['barang'] = $this->Barangkeluar_m->get('barang');
        $data['detailkeluar'] = $this->Barangkeluar_m->get('detail_keluar', ['id_detailkeluar' => $id_detailkeluar]);
        $ket = 'detail_keluar.id_detailkeluar';
        $data['datakeluar'] = $this->Barangkeluar_m->join2keluar($ket, $id_detailkeluar);
        $detailstok = $this->Barangkeluar_m->join2stok();
        $data['detailstok'] = $detailstok;
        $stokbarang = $detailstok->stok;
        $stok_valid = $stokbarang + 1;
        
        $this->form_validation->set_rules(
            'jumlah_keluar',
            'Jumlah Keluar',
            "required|trim|numeric|greater_than[0]|less_than[{$stok_valid}]",
            [
                'less_than' => "Jumlah Keluar tidak boleh lebih dari {$stokbarang}"
            ]
        );

        if ($this->form_validation->run() == false) {
            $data['title'] = 'Edit Data Barang keluar | Bahan Diseminasi';
            $this->load->view('template/template', $data);
            $this->load->view('Transaksi/Barangkeluar/v_editbarangkeluar', $data);
            $this->load->view('template/footer', $data);

        } else {
        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangkeluark/v_editbarangkeluar', $data);
        $this->load->view('template/footer', $data);
        }
    }

    public function simpan()
    {
        $id_detailkeluar = $this->input->post('id');
        $ket = ['id_detailkeluar' => $id_detailkeluar];
        $detail = $this->Barangkeluar_m->detailupdate('detail_keluar', $ket);
        
        $databk = [
            'barang_id' => $detail->barang_id,
            'jumlah_keluar' => $this->input->post('jumlah_keluar'),
        ];
        $barang_id = $detail->barang_id;
        $databarangkeluar = $this->Barangkeluar_m->get('barang', ['id_barang'=>$barang_id]);
        $where2 = ['id_barang' => $barang_id];
        $stokbarang = $databarangkeluar['stok'];
        $jumlahkeluar = $this->input->post('jumlah_keluar');
        $data2 = [
            'stok' => (int) $stokbarang + $detail->jumlah_keluar - $jumlahkeluar
        ];
       
        $this->Barangkeluar_m->update('detail_keluar', $databk, $ket);
        $this->Barangkeluar_m->update_data_stok($where2, $data2, 'barang');
        $this->session->set_flashdata('sukses', 'Data Barang Keluar Berhasil Diubah');
        redirect('barangkeluar');
    }

    public function detail($id_barangkeluar)
    {
        $data['title'] = 'Detail Data Barang Keluar | Bahan Diseminasi';
        $detail = $this->Barangkeluar_m->detail_data($id_barangkeluar);
        $data['detail'] = $detail;
        $barang_id = $detail->barang_id;
        $ket1 = 'jenis.id_jenis = barang.jenis_id';
        $ket2 = 'satuan.id = barang.satuan_id';
        $ket3 = 'barang.id_barang';
        $detailbarang = $this->Barangkeluar_m->join3('barang', 'jenis', 'satuan', $ket1, $ket2);
        $data['detailbarang'] = $detailbarang;
        $ket = ['id_transaksi' => $id_barangkeluar];
        $data['dok'] = $this->Barangkeluar_m->get2('detail_dokumen', $ket);
        $data['detailkeluar'] = $this->Barangkeluar_m->get2('detail_keluar', $ket);
       
        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangkeluar/v_detailbarangkeluar', $data);
        $this->load->view('template/footer', $data);

    }

    public function hapus($id_detailkeluar)
	{
        $ket = ['id_detailkeluar' => $id_detailkeluar];
        $detail = $this->Barangkeluar_m->detailupdate('detail_keluar', $ket);
		$where = array('id_detailkeluar' => $id_detailkeluar);
		$this->Databarang_m->hapus_data($where, 'detail_keluar');
        $barang_id = $detail->barang_id;
        $databarang = $this->Barangkeluar_m->get('barang', ['id_barang'=>$barang_id]);
        $where2 = ['id_barang' => $barang_id];
        $stokbarang = $databarang['stok'];
        $jumlahkeluar = $this->input->post('jumlah_keluar');
        $data2 = [
            'stok' => (int) $stokbarang + $detail->jumlah_keluar
        ];
      
        $this->Barangkeluar_m->update_data_stok($where2, $data2, 'barang');
        $this->session->set_flashdata('sukses', 'Data Barang Keluar Berhasil Dihapus');
		redirect('barangkeluar');
	}

    public function hapuskeluar($id_barangkeluar)
	{
        $ket = ['id_transaksi' => $id_barangkeluar];
        $detail = $this->Barangkeluar_m->detailupdatekeluar('detail_keluar', $ket);

        $count = count($detail);
        $index2 = 0;
        foreach($detail as $bi){ 
           $id_barang = $detail[$index2]->barang_id;
           $ket = ['id_barang' => $id_barang];
           $barang = $this->Barangkeluar_m->detailupdate('barang', $ket);
           $stokbarang = $barang->stok;
           $datastok = ['stok' => $stokbarang + $detail[$index2]->jumlah_keluar];
           $where2 = ['id_barang' => $id_barang];
           $this->Barangkeluar_m->update_data_stok($where2, $datastok, 'barang');
            $index2++;
        }

		$where1 = array('id_transaksi' => $id_barangkeluar);
		$this->Databarang_m->hapus_data($where1, 'detail_keluar');
		$where = array('id_barangkeluar' => $id_barangkeluar);
		$this->Databarang_m->hapus_data($where, 'barang_keluar');
        $this->session->set_flashdata('sukses', 'Data Barang Keluar Berhasil Dihapus');
		redirect('barangkeluar');
	}

    public function pdf($id_barangkeluar)
    {
        // Ambil Data Barang Keluar
        $kop = $this->Barangkeluar_m->getkop('data_header_surat');
        $this->data['kop'] = $kop;
        $detail = $this->Barangkeluar_m->detail_data($id_barangkeluar);
        $this->data['detail'] = $detail;
        $detailkeluar = $this->Barangkeluar_m->get('detail_keluar', ['id_transaksi'=>$id_barangkeluar]);
        $this->data['detailkeluar'] = $detailkeluar;
        $barang_id = $detail->barang_id;
        $ket1 = 'jenis.id_jenis = barang.jenis_id';
        $ket2 = 'satuan.id = barang.satuan_id';
        $ket3 = 'barang.id_barang';
        $detailbarang = $this->Barangkeluar_m->join3('barang', 'jenis', 'satuan', $ket1, $ket2, $ket3, $barang_id);
        $this->data['detailbarang'] = $detailbarang;
        $barangkeluar = $this->Barangkeluar_m->get('barang_keluar', ['id_barangkeluar' => $id_barangkeluar]);
        $this->data['barangkeluar'] = $barangkeluar;
        $detailstok = $this->Barangkeluar_m->join2bkeluar($id_barangkeluar);
        $this->data['detailstok'] = $detailstok;
        $satuan = $this->Barangkeluar_m->get('satuan');
        $this->data['satuan'] = $satuan;

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
        
		$html=$this->load->view('pdf/v_beritaacara', $this->data, true);	    
        
        // run dompdf
        $this->pdfgenerator->generate($html, $file_pdf,$paper,$orientation);
    }

    public function upload($id_barangkeluar)
    {
        $data['title'] = 'Tambah Dokumen Barang Keluar | Bahan Diseminasi';
        $data['barangkeluar'] = $this->Barangkeluar_m->get('barang_keluar', ['id_barangkeluar'=>$id_barangkeluar]);
       
        $this->load->view('template/template', $data);
        $this->load->view('Transaksi/Barangkeluar/v_uploaddokumen', $data);
        $this->load->view('template/footer', $data);
    }

    public function uploaddok()
    {
        $id_barangkeluar = $this->input->post('id');
        $ket = ['id_barangkeluar' => $id_barangkeluar];
        $detail = $this->Barangkeluar_m->detailupdate('barang_keluar', $ket);
        $beritaacara = $_FILES['beritaacara']['name'];
        if ($beritaacara) {
            $config['upload_path'] = './assets/file/barangkeluar';
            $config['allowed_types'] = 'pdf|docx';
            $config['max_size']     = '50000';
            $this->load->library('upload', $config);
            if ($this->upload->do_upload('beritaacara')) {
                $beritaacara1 = $this->upload->data('file_name');
            } else {
                $this->session->set_flashdata('error', 'Tipe atau Ukuran Dokumen Tidak Sesuai!');
                redirect('barangkeluar');
            }
        } else {
            $beritaacara1 = $detail->beritaacara;
        }
        $databk = [
            'id_barangkeluar' => $id_barangkeluar,
            'beritaacara' => $beritaacara1
        ];
       
        $this->Barangkeluar_m->update('barang_keluar', $databk, $ket);

        $data = [];
        $count = count($_FILES['files']['name']);
      
        for($i=0;$i<$count;$i++){
          if(!empty($_FILES['files']['name'][$i])){
      
            $_FILES['file']['name'] = $_FILES['files']['name'][$i];
            $_FILES['file']['type'] = $_FILES['files']['type'][$i];
            $_FILES['file']['tmp_name'] = $_FILES['files']['tmp_name'][$i];
            $_FILES['file']['error'] = $_FILES['files']['error'][$i];
            $_FILES['file']['size'] = $_FILES['files']['size'][$i];
    
            $config['upload_path'] = './assets/file/Barangkeluar';
            $config['allowed_types'] = 'pdf|docx';
            $config['max_size'] = '5000';
            $config['file_name'] = $_FILES['files']['name'][$i];
     
            $this->load->library('upload',$config); 
            $this->upload->initialize($config);
           
            if($this->upload->do_upload('file')){
                $uploadData = $this->upload->data();
                $filename = $uploadData['file_name'];
                $data1[$i] = [
                        'id_transaksi' => $id_barangkeluar,
                        'nama_dokumen' => $filename,
                    ];
                $this->Barangkeluar_m->input_data($data1[$i], 'detail_dokumen');
            } else {
                $this->session->set_flashdata('error', 'Tipe atau Ukuran Dokumen Tidak Sesuai!');
                redirect('barangkeluar');
            }
          }
        }

        $this->session->set_flashdata('sukses', 'Data Barang Keluar Berhasil Diubah');
        redirect('barangkeluar');
    }

}