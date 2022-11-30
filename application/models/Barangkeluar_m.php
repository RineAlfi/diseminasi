<?php
class Barangkeluar_m extends CI_model
{
	public function get($table, $data = null, $where = null)
    {
        if ($data != null) {
            return $this->db->get_where($table, $data)->row_array();
        } else {
            return $this->db->get_where($table, $where)->result_array();
        }
    }
     
    public function get2($table, $ket)
    {
        return $this->db->get_where($table, $ket)->result();
    }

    public function getkop($table)
    {
        return $this->db->get_where($table)->row();
    }

    public function getDetail($id)
	{
		return $this->db->where('id_detailkeluar', $id)->get('detail_keluar')->row();
	}

    public function input_data($data, $table)
	{
		$this->db->insert($table, $data);
	}

    public function insert($table, $data, $batch = false)
    {
        return $batch ? $this->db->insert_batch($table, $data) : $this->db->insert($table, $data);
    }

    public function save_batch($data)
    {
        return $this->db->insert_batch('detail_keluar', $data);
    }

    public function detail_data($barang_id)
    {
        $this->db->select('*');
        $this->db->from('barang_keluar');
        $this->db->join('barang', 'barang.id_barang = barang_keluar.barang_id', 'left');
        $this->db->where('barang_keluar.id_barangkeluar', $barang_id);
        $query = $this->db->get();
        return $query->row();
	}

    public function update($table, $data, $ket)
    {
        $this->db->where($ket);
        $this->db->update($table, $data);
    }   

    public function update_data_stok($where, $data, $table)
    {
		$this->db->where($where);
		$this->db->update($table,$data);
	}
    
    public function detailupdate($table, $ket){
        $query = $this->db->get_where($table, $ket)->row();
        return $query;
    }

    public function detailupdatekeluar($table, $ket){
        $query = $this->db->get_where($table, $ket)->result();
        return $query;
    }

    public function hapus_data($where,$table)
    {
        $this->db->where($where);
		$this->db->delete($table);
	}

    public function join3($table, $table2, $table3, $ktabel21, $ktable31)
    {
        $this->db->select('*');
        $this->db->from($table);
        $this->db->join($table2, $ktabel21, 'inner');
        $this->db->join($table3, $ktable31, 'inner');
        $query = $this->db->get();
        return $query->result();
    }

    public function join2inner()
    {
        $this->db->select('*');
        $this->db->from('detail_keluar');
        $this->db->join('barang', 'barang.id_barang = detail_keluar.barang_id', 'inner');
        $query = $this->db->get();
        $this->db->order_by('id_barangkeluar', 'DESC');
        return $query->result();
    }

    public function join2stok()
    {
        $this->db->select('*');
        $this->db->from('detail_keluar');
        $this->db->join('barang', 'barang.id_barang = detail_keluar.barang_id', 'inner');
        $query = $this->db->get();
        return $query->row();
    }

    public function join2satuan2()
    {
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->join('satuan', 'satuan.id = barang.satuan_id', 'inner');
        $this->db->where(['stok >' => 0]);
        $query = $this->db->get();
        return $query->result_array();
    }

    public function join2bkeluar($id_barangkeluar)
    {
        $this->db->select('*');
        $this->db->from('detail_keluar');
        $this->db->join('barang', 'barang.id_barang = detail_keluar.barang_id', 'inner');
        $this->db->where('id_transaksi', $id_barangkeluar);
        $query = $this->db->get();
        return $query->result();
    }

    public function join2keluar($ket, $param)
    {
        $this->db->select('*');
        $this->db->from('detail_keluar');
        $this->db->join('barang_keluar', 'barang_keluar.id_barangkeluar = detail_keluar.id_transaksi', 'inner');
        $this->db->where($ket, $param);
        $query = $this->db->get();
        return $query->row();
    }

    public function idbk()
    {
        $sql = "SELECT MAX(MID(id_barangkeluar,7,3)) AS nokeluar FROM barang_keluar
                WHERE MID(id_barangkeluar,3,4) = DATE_FORMAT(CURDATE(), '%y%m')";
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0) {
            $row = $query->row();
            $nom = ((int)$row->nokeluar) + 1;
            $no = sprintf("%'.03d", $nom);
        } else {
            $no = "001";
        }
        $id_barangkeluar = "BK" .date('ym') . $no;
        return $id_barangkeluar;
    }

}