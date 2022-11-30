<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    <a href="<?php echo base_url() ?>barangkembali" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Kembali</a>
                    <h3 class="m-0 font-weight-bold text">Detail Barang Kembali</h3><br>
                    <div class="col-md-12 grid-margin">
                        <div class="card shadow p-5 md-12">
                            <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                            <div class="text-center">
                                <img src="<?php echo base_url() ?>assets/file/barangkembali/<?php echo $detaildata->fotokembali ?>" alt="" class="img-thumbnail" style="height: 210px; width:200px">
                            </div><br>
                            <div class="col-lg-12 col-md-12 col-xs-9">
                            <table class="table table-no-bordered">
                                <tr>
                                    <th>Nama Barang</th>
                                    <td><?php echo $detailbarang->nama_barang?></td>
                                </tr>
                                <tr>
                                <tr>
                                    <th>Tanggal Kembali</th>
                                    <td><?php echo tgl_indo($detaildata->tanggal_kembali)?></td>
                                </tr>
                                <tr>
                                    <th>Jumlah Kembali</th>
                                    <td><?php echo $detaildata->jumlah_kembali?></td>
                                </tr>
                                <tr>
                                    <th>Satuan</th>
                                    <td><?php echo $detailbarang->nama_satuan?></td>
                                </tr>
                                <tr>
                                    <th>Jenis Barang</th>
                                    <td><?php echo $detailbarang->nama_jenis?></td>
                                </tr>
                                <tr>
                                    <th>Keterangan Kembali</th>
                                    <td><?php echo $detaildata->keterangankembali?></td>
                                </tr>
                                <th>Berita Acara</th>
                                    <td>
                                    <?php
                                        if ($detaildata->beritakembali) { ?>
                                            <a class="btn btn-outline-primary btn-icon-text btn-sm" href="<?= base_url() ?>assets/file/Barangkembali/<?= $detaildata->beritakembali ?>" target="_blank">
                                                <i class="ti ti-download"></i> <?= $detaildata->beritakembali; ?>
                                            </a>
                                    <?php } ?>
                                    </td>
                                </tr>
                                <th>Dokumen</th>
                                    <td>
                                    <?php
                                        if ($dok)
                                            foreach ($dok as $detaildata) {
                                            ?>
                                            <a class="btn btn-outline-primary btn-icon-text btn-sm" href="<?= base_url() ?>assets/file/Barangkembali/<?= $detaildata->nama_dokumen ?>" target="_blank">
                                                <i class="ti ti-download"></i> <?= $detaildata->nama_dokumen; ?>
                                            </a>
                                    <?php } ?>
                                    </td>
                                </tr>
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