<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <a href="<?php echo base_url() ?>barangkembali" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Kembali</a>
                <h3 class="m-0 font-weight-bold">Edit Data Barang Kembali</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="card-body">
                    <?php echo $this->session->flashdata('pesan'); ?>
                    <?php echo form_open_multipart('barangkembali/simpan', []);?>
                    <div class="form-group">
                        <input type="hidden" name="id" value="<?= $detail->id_barangkembali; ?>">
                    </div>
                    <div class="form-group">
                        <label><b>Tanggal Keluar</b></label>
                        <input type="date" name="tanggal_keluar" value="<?php echo set_value('tanggal_keluar', $barangkeluar['tanggal_keluar']); ?>" name="tanggal_keluar" type="text" class="form-control" readonly required>
                        <?php echo form_error('tanggal_keluar', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Nama Barang</b></label>
                        <select name="barang_id" id="barang_id" class="js-example-basic-single w-100" disabled required>
                            <option value="" selected disabled>--Pilih Nama Barang--</option>
                            <?php foreach($barang as $db) : ?>
                                <option <?php echo $barangkembali->barang_id == $db['id_barang'] ? 'selected' : '';?> <?php echo set_select('barang_id', $db['id_barang']) ?> value="<?php echo $db['id_barang'] ?>"><?php echo $db['nama_barang'] ?></option> 
                            <?php endforeach; ?>
                        </select>
                    <?php echo form_error('barang_id', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <label><b>Tanggal Kembali</b></label><span style="color: red;"> *</span>
                        <input type="date" name="tanggal_kembali" value="<?php echo set_value('tanggal_kembali', $barangkembali->tanggal_kembali); ?>" class="form-control">
                        <?php echo form_error('tanggal_kembali', '<small class="text-danger">', '</small>') ?>
                    </div>
                    <div class="form-group">
                        <label><b>Jumlah Kembali</b></label><span style="color: red;"> *</span>
                        <input type="number" name="jumlah_kembali" value="<?php echo set_value('jumlah_kembali', $barangkembali->jumlah_kembali); ?>" name="jumlah_kembali" class="form-control" required>
                        <?php echo form_error('jumlah_kembali', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Keterangan Kembali</b></label>
                        <input type="text" name="keterangankembali" value="<?php echo set_value('keterangankembali', $barangkembali->keterangankembali); ?>" name="keterangankembali" class="form-control">
                        <?php echo form_error('keterangankembali', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Foto Produk</b></label>
                        <input type="file" name="fotokembali" value="<?php echo set_value('foto', $barangkembali->fotokembali); ?>" name="fotokembali" class="form-control">
                        <p class="desc">.jepg|.jpg|.png| Maksimum 3MB </p>
                        <?php echo form_error('fotokembali', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Dokumen</b></label>
                        <input type='file' class="form-control form-control-lg" id='files' name='files[]' multiple="">
                        <p class="desc">.pdf|.docx| Maksimum 5MB </p>
                        <?php echo form_error('dokumenkembali', '<small class="text-danger">', '</small>')?>
                    </div>

                    <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp; &nbsp;
                    <?php echo form_close(); ?>  
                </div>
            </div>
            </div>
        </div>
    </div>
</div>   