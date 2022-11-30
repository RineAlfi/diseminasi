<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <a href="<?php echo base_url() ?>barangkeluar/detail/<?=$detail->id_transaksi?>" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Detail Barang Keluar</a>
                <h3 class="m-0 font-weight-bold">Edit Data Barang Keluar</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="card-body">
                    <?php echo $this->session->flashdata('pesan'); ?>
                    <?php echo form_open_multipart('barangkeluar/simpan', []);?>
                    <div class="form-group">
                        <input type="hidden" name="id" value="<?= $detail->id_detailkeluar; ?>">
                    </div>
                    <div class="form-group">
                        <label><b>Tanggal keluar</b></label><span style="color: red;"> *</span>
                        <input type="date" name="tanggal_keluar" value="<?php echo set_value('tanggal_keluar', $datakeluar->tanggal_keluar); ?>" name="tanggal_keluar" type="text" class="form-control" readonly>
                        <?php echo form_error('tanggal_keluar', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Nama Barang</b></label><span style="color: red;"> *</span>
                        <select name="barang_id" id="barang_id" class="js-example-basic-single w-100" disabled>
                            <option value="" selected disabled>--Pilih Nama Barang--</optiion>
                            <?php foreach($barang as $b) : ?>
                                <option <?php echo $detailkeluar['barang_id'] == $b['id_barang'] ? 'selected' : '';?> <?php echo set_select('barang_id', $b['id_barang']) ?> value="<?php echo $b['id_barang'] ?>"><?php echo $b['nama_barang'] ?></option> 
                            <?php endforeach; ?>
                        </select>
                    <?php echo form_error('barang_id', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <label><b>Jumlah keluar</b></label><span style="color: red;"> *</span>
                        <input type="number" name="jumlah_keluar" value="<?php echo set_value('jumlah_keluar', $detailkeluar['jumlah_keluar']); ?>" name="jumlah_keluar" class="form-control">
                        <?php echo form_error('jumlah_keluar', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Keterangan</b></label>
                        <input type="text" name="keterangan" value="<?php echo set_value('keterangan', $datakeluar->keterangan); ?>" name="keterangan" class="form-control" readonly>
                        <?php echo form_error('keterangan', '<small class="text-danger">', '</small>')?>
                    </div>

                    <button type="submit" class="btn btn-success">Simpan</a></button> &nbsp;&nbsp;
                    <?php echo form_close(); ?>  
                </div>
            </div>
            </div>
        </div>
    </div>
</div>   