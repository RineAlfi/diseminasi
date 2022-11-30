<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <a href="<?php echo base_url() ?>barangmasuk" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Masuk</a>
                <h3 class="m-0 font-weight-bold">Edit Data Barang Masuk</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="card-body">
                    <?php echo form_open_multipart('barangmasuk/simpan', []);?>
					<div class="form-group">
                        <input type="hidden" name="id" value="<?= $detail->id_barangmasuk; ?>">
                    </div>
                    <div class="form-group">
                        <label><b>Tanggal Masuk</b></label><span style="color: red;"> *</span>
                        <input type="date" name="tanggal_masuk" value="<?php echo set_value('tanggal_masuk', $barangmasuk['tanggal_masuk']); ?>" name="tanggal_masuk" type="text" class="form-control" required>
                        <?php echo form_error('tanggal_masuk', '<div class="text-small text-danger"></div>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Nama Barang</b></label><span style="color: red;"> *</span>
                        <select name="barang_id" id="barang_id" class="js-example-basic-single w-100" disabled>
                            <option value="" selected disabled>--Pilih Nama Barang--</option>
                            <?php foreach($barang as $b) : ?>
                                <option <?php echo $barangmasuk['barang_id'] == $b['id_barang'] ? 'selected' : '';?> <?php echo set_select('barang_id', $b['id_barang']) ?> value="<?php echo $b['id_barang'] ?>"><?php echo $b['nama_barang'] ?></option> 
                            <?php endforeach; ?>
                        </select>
                    <?php echo form_error('barang_id', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <label><b>Jumlah Masuk</b></label><span style="color: red;"> *</span>
                        <input type="number" name="jumlah_masuk" value="<?php echo set_value('jumlah_masuk', $barangmasuk['jumlah_masuk']); ?>" name="jumlah_masuk" class="form-control" required>
                        <?php echo form_error('jumlah_masuk', '<div class="text-small text-danger"></div>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Keterangan</b></label>
                        <input type="text" name="keterangan" value="<?php echo set_value('keterangan', $barangmasuk['keterangan']); ?>" name="keterangan" class="form-control">
                        <?php echo form_error('keterangan', '<div class="text-small text-danger"></div>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Foto Produk</b></label>
                        <input type="file" name="foto" value="<?php echo set_value('foto', $barangmasuk['foto']); ?>" name="foto" class="form-control">
                        <p class="desc">.jepg|.jpg|.png| Maksimum 3MB </p>
                        <?php echo form_error('foto', '<div class="text-small text-danger"></div>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Dokumen</b></label>
                        <input type='file' class="form-control form-control-lg" id='files' name='files[]' multiple="">
                        <p class="desc">.pdf|.docx| Maksimum 5MB </p>
                        <?php echo form_error('dokumen', '<div class="text-small text-danger"></div>')?>
                    </div>

                    <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp; &nbsp;
                    <?php echo form_close(); ?>  
                </div>
                </div>
            </div>
        </div>
    </div>
</div>