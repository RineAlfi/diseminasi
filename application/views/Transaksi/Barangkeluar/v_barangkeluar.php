<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="box-body">
                        <blockquote>
                        <p><b>Keterangan!!</b></p>
                        <small><cite title="Source Title">- Tekan tombol abu-abu untuk upload dokumen dan cetak berita acara!!</cite></small><br>
                        <small><cite title="Source Title">- Tekan detail untuk melakukan hapus data barang per jumlah masuk dan edit data barang!!</cite></small>
                        </blockquote>
                    <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    <a href="<?php echo base_url() ?>satuan" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Satuan</a>
                    <h3 class="m-0 font-weight-bold">Data Barang Keluar</h3><br>
                    <div class="flash-data" id="flash" data-flash="<?= $this->session->flashdata('error'); ?>"></div>
                    <div class="flash-data" id="flash2" data-flash="<?= $this->session->flashdata('sukses'); ?>"></div>
                    <div class="col-md-4 grid-margin mb-3">
                    <a href="<?php echo base_url() ?>barangkeluar/tambah" class="btn btn-success btn-sm"><i class="ti ti-plus"></i> Tambah Barang Keluar</a></div>
                    <div class="col-md-12 grid-margin">
                        <div class="card shadow mb-12">
                            <div class="col-sm-12 grid-margin stretch-card">
                            <div class="card">
                                <table id="dataTable" class="table table-striped table-bordered text-wrap" style="width:100% table-layout:fixed" cellspacing="0">
                                    <thead  class="thead-light">
                                        <tr>
                                        <th style="width:5%">No</th>
                                        <th width="10%">Tanggal Keluar</th>
                                        <th style="width:30%; text-align: center;">Nama Barang</th>
                                        <th style= "text-align: center; width:20%">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                        $no = 1;
                                        if ($barangkeluar)
                                            foreach ($barangkeluar as $bk) {
                                            ?>
                                            <tr>
                                                <td style= "text-align: center;"><?php echo $no++; ?></td>
                                                <td><?php echo tgl_indo($bk['tanggal_keluar'])?></td>
                                                <td><?php
                                                    foreach ($detailkeluar as $ds) {
                                                        ?>
                                                         <?php
                                                        if($ds->id_transaksi == $bk['id_barangkeluar']) {
                                                        ?>
                                                            <?php echo $ds->nama_barang; ?>,
                                                           
                                                    <?php } ?>
                                                    <?php } ?></td>
                                            <td>
                                                <a class="btn btn-sm btn-warning" title="Detail Data" href="<?php echo base_url('/barangkeluar/detail/' . $bk['id_barangkeluar']) ?>"><i class="ti ti-eye"></i></a>
                                                <a class="btn btn-sm btn-secondary" title="Upload Dokumen Barang Keluar" href="<?php echo base_url('/barangkeluar/upload/' . $bk['id_barangkeluar']) ?>"><i class="ti ti-file"></i></a>
                                                <a id="hapuskeluar" class="btn btn-sm btn-danger" title="Hapus Data" href="<?php echo site_url('/barangkeluar/hapuskeluar/' . $bk['id_barangkeluar']) ?>"><i class="ti ti-trash"></i></a>
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