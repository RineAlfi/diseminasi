<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    <a href="<?php echo base_url() ?>satuan" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Satuan</a>
                    <h3 class="m-0 font-weight-bold">Data Barang kembali</h3><br>
                    <div class="flash-data" id="flash2" data-flash="<?= $this->session->flashdata('sukses'); ?>"></div>
                    <div class="flash-data" id="flash" data-flash="<?= $this->session->flashdata('error'); ?>"></div>
                    <div class="col-md-12 grid-margin">
                        <div class="card shadow mb-12">
                            <div class="col-sm-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="table-responsive pt-3 ">
                                <?php echo $this->session->flashdata('message'); ?>
                                <table id="dataTable" class="table table-striped table-bordered text-wrap" style="width:100% table-layout:fixed" cellspacing="0">
                                    <thead  class="thead-light">
                                        <tr>
                                        <th width="2%">No</th>
                                        <th width="2%" style= "text-align: center;">Tanggal Keluar</th> 
                                        <th width="10%" style= "text-align: center;">Nama Barang</th> 
                                        <th width="5%" style= "text-align: center;">&nbsp;&nbsp;&nbsp;&nbsp; Jumlah &nbsp;&nbsp;&nbsp;&nbsp;</th> 
                                        <th width="5%" style= "text-align: center;">Tanggal Kembali</th> 
                                        <th style= "text-align: center;">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                        $no = 1;
                                            foreach ($keluarkembali as $kk) {
                                            ?>
                                            <tr>
                                                <td style= "text-align: center;"><?php echo $no++; ?></td>
                                                <td><?php
                                                    foreach ($datakeluar as $dk) {
                                                        ?>
                                                         <?php
                                                        if($dk['id_barangkeluar'] == $kk->id_transaksi) {
                                                        ?>
                                                            <?php echo tgl_indo($dk['tanggal_keluar'])?>
                                                           
                                                    <?php } ?>
                                                    <?php } ?></td>
                            
                                                <?php
                                                    foreach ($barang as $bb) {
                                                        ?>
                                                         <?php
                                                        if($bb['id_barang'] == $kk->barang_id) {
                                                        ?>
                                                            <td><?php echo $bb['nama_barang']?></td>
                                                            <?php foreach ($satuan as $ss) {?>
                                                                <?php if($ss['id'] == $bb['satuan_id']) {?>
                                                                 <td><?php echo $kk->jumlah_kembali  . ' ' . $ss['nama_satuan']?></td>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    <?php } ?>
                                                <td> <?php echo tgl_indo($kk->tanggal_kembali)?></td>
                                             <td>
                                                <a class="btn btn-sm btn-warning" title="Detail Data" href="<?php echo base_url('/barangkembali/detail/' . $kk->id_barangkembali) ?>"><i class="ti ti-eye"></i></a>
                                                <a class="btn btn-sm btn-success" title="Edit Data" href="<?php echo base_url('/barangkembali/edit/' . $kk->id_barangkembali) ?>"><i class="ti ti-pencil"></i></a>
                                                <a class="btn btn-sm btn-secondary" title="Upload Berita Acara Barang Kembali" href="<?php echo base_url('/barangkembali/upload/' . $kk->id_barangkembali) ?>"><i class="ti ti-file"></i></a>
                                                <a id="hapuskembali" class="btn btn-sm btn-danger" title="Hapus Data" href="<?php echo site_url('/barangkembali/hapus/' . $kk->id_barangkembali) ?>"><i class="ti ti-trash"></i></a>
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