<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <a href="<?php echo base_url() ?>barangkeluar/?>" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Keluar</a>
                <h3 class="m-0 font-weight-bold">Tambah Data Barang Kembali</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="flash-data" id="flash" data-flash="<?= $this->session->flashdata('error'); ?>"></div>
                <div class="card-body">
                    <?php echo $this->session->flashdata('pesan'); ?>
                    <?php echo form_open_multipart('', []);?>
                    <div class="form-group">
                        <label><b>Tanggal Keluar</b></label>
                        <input type="date" name="tanggal_keluar" value="<?php echo set_value('tanggal_keluar', $barangkeluar['tanggal_keluar']); ?>" name="tanggal_keluar" type="text" class="form-control" readonly required>
                        <?php echo form_error('tanggal_keluar', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Nama Barang</b></label>
                        <select name="barang_idkeluar" id="barang_idkeluar" class="js-example-basic-single w-100" disabled required>
                            <option value="" selected disabled><?php echo $barang->nama_barang?></option>
                        </select>
                    <?php echo form_error('barang_id', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <label><b>Jumlah Keluar</b></label>
                        <input type="number" name="jumlah_keluar" value="<?php echo set_value('jumlah_keluar', $detailkeluar['jumlah_keluar']); ?>" name="jumlah_keluar" class="form-control" readonly required>
                        <?php echo form_error('jumlah_keluar', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Keterangan</b></label>
                        <input type="text" name="keterangan" value="<?php echo set_value('keterangan', $barangkeluar['keterangan']); ?>" name="keterangan" class="form-control" readonly required>
                        <?php echo form_error('keterangan', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Tanggal Kembali</b></label><span style="color: red;"> *</span>
                        <input type="date" name="tanggal_kembali" class="form-control">
                        <?php echo form_error('tanggal_kembali', '<small class="text-danger">', '</small>') ?>
                    </div>
                    <div class="form-group">
                        <label><b>Jumlah Kembali</b></label><span style="color: red;"> *</span>
                        <input type="number" name="jumlah_kembali" class="form-control">
                        <?php echo form_error('jumlah_kembali', '<small class="text-danger">', '</small>') ?>
                    </div>
                    <div class="form-group">
                        <label><b>Keterangan Kembali</b></label>
                        <input type="text" name="keterangankembali" id="keterangankembali" class="form-control">
                        <?php echo form_error('keterangankembali', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Foto Produk</b></label>
                        <input type="file" class="form-control form-control-lg" id="fotokembali" name="fotokembali">
                        <p class="desc">.jepg|.jpg|.png| Maksimum 3MB </p>
                        <?php echo form_error('foto', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <label><b>Dokumen</b></label>
                        <input type='file' class="form-control form-control-lg" id='files' name='files[]' multiple="">
                        <p class="desc">.pdf|.docx| Maksimum 5MB </p>
                        <?php echo form_error('dokumen', '<small class="text-danger">', '</small>'); ?>
                    </div>

                    <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp; &nbsp;
                    <?php echo form_close(); ?>  
                </div>
            </div>
            </div>
        </div>
    </div>
</div>   