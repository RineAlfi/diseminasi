<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="box-body">
                        <blockquote>
                        <p><b>Keterangan!!</b></p>
                        <small><cite title="Source Title">- Jika barang keluar tersisa, tekan tombol biru untuk mengembalikan barang!!</cite></small><br>
                        </blockquote>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    <a href="<?php echo base_url() ?>barangkeluar" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Keluar</a>
                    <h3 class="m-0 font-weight-bold text">Detail Barang Keluar</h3><br>
                    <div class="col-md-12 grid-margin">
                        <div class="card shadow p-5 md-12">
                            <div class="col-lg-12 grid-margin stretch-card">
                            <div class="card">
                            <div class="col-lg-12 col-md-12 col-xs-9">
                            <table class="table table-no-bordered">
                                <!-- <tr>
                                    <th>ID Barang Keluar</th>
                                    <td><//?php echo $detail->id_barangkeluar?></td>
                                </tr> -->
                                <tr>
                                    <th>Tanggal Keluar</th>
                                    <td><?php echo tgl_indo($detail->tanggal_keluar)?></td>
                                </tr>
                                <tr>
                                    <th>Keterangan</th>
                                    <td><?php echo $detail->keterangan?></td>
                                </tr>
                                <th>Berita Acara</th>
                                    <td>
                                    <?php
                                        if ($detail->beritaacara) { ?>
                                            <a class="btn btn-outline-primary btn-icon-text btn-sm" href="<?= base_url() ?>assets/file/Barangkeluar/<?= $detail->beritaacara ?>" target="_blank">
                                                <i class="ti ti-download"></i> <?= $detail->beritaacara; ?>
                                            </a>
                                    <?php } ?>
                                    </td>
                                </tr>
                                <th>Dokumen</th>
                                    <td>
                                    <?php
                                        if ($dok)
                                            foreach ($dok as $detail) {
                                            ?>
                                            <a class="btn btn-outline-primary btn-icon-text btn-sm" href="<?= base_url() ?>assets/file/Barangkeluar/<?= $detail->nama_dokumen ?>" target="_blank">
                                                <i class="ti ti-download"></i> <?= $detail->nama_dokumen; ?>
                                            </a>
                                    <?php } ?>
                                    </td>
                                </tr>
                                    <td>
                                            </td>
                                    <td>
                                            </td>
                                </tr>
                            </table>
                            <label><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detail Data Barang Keluar</b></label>
                                <table class="table table-bordered table-sm" style="background-color:#ffff;"> 
                                <thead>
                                    <tr>
                                        <th style= "text-align: center;">Nama Barang</th>
                                        <th style= "text-align: center;">Jumlah Keluar</th>
                                        <th style= "text-align: center;">Satuan</th>
                                        <th style= "text-align: center;">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php
                                    if ($detailkeluar)
                                        foreach ($detailkeluar as $dk) {
                                        ?>
                                    <?php
                                            foreach ($detailbarang as $ds) {
                                                ?>
                                                <?php
                                                if($dk->barang_id == $ds->id_barang) {
                                                    ?>
                                                        <thead>
                                                        <tr>
                                                            <td style= "text-align: center;"><?php echo $ds->nama_barang; ?></td>
                                                            <td style= "text-align: center;"><?php echo $dk->jumlah_keluar; ?></td>
                                                            <td style= "text-align: center; width: 25%"><?php echo $ds->nama_satuan; ?></td>
                                                            <td style= "text-align: center; width: 25%">
                                                                <a class="btn btn-sm btn-info" title="Pengembalian Barang" href="<?php echo base_url('/barangkembali/tambah/' . $dk->id_detailkeluar) ?>"><i class="ti-back-left"></i></a>
                                                                <a class="btn btn-sm btn-success" title="Edit Data" href="<?php echo base_url('/barangkeluar/edit/' . $dk->id_detailkeluar) ?>"><i class="ti ti-pencil"></i></a>
                                                                <a id="hapuskeluar" class="btn btn-sm btn-danger" title="Hapus Data" href="<?php echo site_url('/barangkeluar/hapus/' . $dk->id_detailkeluar) ?>"><i class="ti ti-trash"></i></a>
                                                            </td>
                                                        </tr>
                                                        </thead>
                                            <?php } ?>
                                            <?php } ?></td>
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