<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    <a href="<?php echo base_url() ?>satuan" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Satuan</a>
                    <h3 class="m-0 font-weight-bold">Data Barang Masuk</h3><br>
                    <div class="flash-data" id="flash2" data-flash="<?= $this->session->flashdata('sukses'); ?>"></div>
                    <div class="col-md-4 grid-margin mb-3">
                    <a href="<?php echo base_url() ?>barangmasuk/tambah" class="btn btn-success btn-sm"><i class="ti ti-plus"></i> Tambah Barang Masuk</a></div>
                    <div class="col-md-12 grid-margin">
                        <div class="card shadow mb-12">
                            <div class="col-sm-12 grid-margin stretch-card">
                            <div class="card mb-3">
                                <table id="dataTable" class="table table-striped table-bordered text-wrap" style="width:100% table-layout:fixed" cellspacing="0">
                                    <thead class="thead-light">
                                        <tr>
                                        <th style="width:2%">No</th>
                                        <th style="width:2%">Tanggal Masuk</th>
                                        <th style= "text-align: center;">Nama Barang</th>
                                        <th style="width:5%">Jumlah Masuk</th>
                                        <th style= "text-align: center; width:30%">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                        $no = 1;
                                        if ($barangmasuk)
                                            foreach ($barangmasuk as $bm) {
                                            ?>
                                            <tr>
                                                <td style= "text-align: center;"><?php echo $no++; ?></td>
                                                <td><?php echo tgl_indo($bm['tanggal_masuk'])?></td>
                                                <td><?php echo $bm['nama_barang']; ?></td>
                                                <td><?php echo $bm['jumlah_masuk'] . ' ' . $bm['nama_satuan']; ?></td>
                                            <td>
                                                <a class="btn btn-sm btn-warning" title="Detail Data" href="<?php echo base_url('/barangmasuk/detail/' . $bm['id_barangmasuk']) ?>"><i class="ti ti-eye"></i></a>
                                                <a class="btn btn-sm btn-success" title="Edit Data" href="<?php echo base_url('/barangmasuk/edit/' . $bm['id_barangmasuk']) ?>"><i class="ti ti-pencil"></i></a>
                                                <a id="hapusmasuk" class="btn btn-sm btn-danger" title="Hapus Data" href="<?php echo site_url('/barangmasuk/hapus/' . $bm['id_barangmasuk']) ?>"><i class="ti ti-trash"></i></a>
                                            </td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
            </div> 
    </div>                   
</div>
</div>

<?php
function tgl_indo($tanggal){
	$bulan = array (
		1 =>   'Januari',
		'Februari',
		'Maret',
		'April',
		'Mei',
		'Juni',
		'Juli',
		'Agustus',
		'September',
		'Oktober',
		'November',
		'Desember'
	);
	$pecahkan = explode('-', $tanggal);
    return $pecahkan[2] . ' ' . $bulan[ (int)$pecahkan[1] ] . ' ' . $pecahkan[0];
	
	// variabel pecahkan 0 = tanggal
	// variabel pecahkan 1 = bulan
	// variabel pecahkan 2 = tahun
}
?>