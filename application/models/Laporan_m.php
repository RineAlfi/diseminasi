<?php
class Laporan_m extends CI_model
{
	public function get($table, $data = null, $where = null)
    {
        if ($data != null) {
            return $this->db->get_where($table, $data)->row_array();
        } else {
            return $this->db->get_where($table, $where)->result_array();
        }
    }

    public function getkop($table)
    {
        return $this->db->get_where($table)->row();
    }

    public function getBarangKeluar($limit = null, $id_barang = null, $range = null)
    {
        $this->db->select('*');
        $this->db->join('barang_keluar ds', 'bk.id_transaksi = ds.id_barangkeluar');
        $this->db->join('barang b', 'bk.barang_id = b.id_barang');
        $this->db->join('satuan s', 'b.satuan_id = s.id');

        if ($limit != null) {
            $this->db->limit($limit);
        }
        if ($id_barang != null) {
            $this->db->where('id_barang', $id_barang);
        }
        if ($range != null) {
            $this->db->where('tanggal_keluar' . ' >=', $range['mulai']);
            $this->db->where('tanggal_keluar' . ' <=', $range['akhir']);
        }
        $this->db->order_by('id_transaksi', 'DESC');
        return $this->db->get('detail_keluar bk')->result_array();
    }

    public function getBarangMasuk($limit = null, $id_barang = null, $range = null)
    {
        $this->db->select('*');
        $this->db->join('barang b', 'bm.barang_id = b.id_barang');
        $this->db->join('satuan s', 'b.satuan_id = s.id');
        if ($limit != null) {
            $this->db->limit($limit);
        }

        if ($id_barang != null) {
            $this->db->where('id_barang', $id_barang);
        }

        if ($range != null) {
            $this->db->where('tanggal_masuk' . ' >=', $range['mulai']);
            $this->db->where('tanggal_masuk' . ' <=', $range['akhir']);
        }

        $this->db->order_by('id_barangmasuk', 'DESC');
        return $this->db->get('barang_masuk bm')->result_array();
    }

    public function getBarangKembali($limit = null, $id_detailkeluar = null, $range = null)
    {
        $this->db->select('*');
        $this->db->join('detail_keluar', 'detail_keluar.id_detailkeluar = barang_kembali.barang_idkeluar');
        $this->db->join('barang_keluar', 'barang_keluar.id_barangkeluar = detail_keluar.id_transaksi');
        $this->db->join('barang', 'barang.id_barang = detail_keluar.barang_id');
        $this->db->join('satuan', 'barang.satuan_id = satuan.id');
    
        if ($limit != null) {
            $this->db->limit($limit);
        }

        if ($id_detailkeluar != null) {
            $this->db->where('id_detailkeluar', $id_detailkeluar);
        }

        if ($range != null) {
            $this->db->where('tanggal_kembali' . ' >=', $range['mulai']);
            $this->db->where('tanggal_kembali' . ' <=', $range['akhir']);
        }

        $this->db->order_by('id_barangkembali', 'DESC');
        return $this->db->get('barang_kembali')->result_array();
    }
}