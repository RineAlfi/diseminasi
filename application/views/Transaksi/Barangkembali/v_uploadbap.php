<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="box-body">
                        <blockquote>
                        <p><b>Keterangan!!</b></p>
                        <small><cite title="Source Title">- Silahkan upload berita acara jika sudah mencetak dan melengkapi data berita acara!!</cite></small><br>
                        </blockquote>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <a href="<?php echo base_url() ?>barangkembali" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Kembali</a>
                <h3 class="m-0 font-weight-bold">Berita Acara Barang Kembali</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="card-body">
                    <?php echo $this->session->flashdata('pesan'); ?>
                    <?php echo form_open_multipart('barangkembali/uploaddok', []);?>
                    <div class="form-group">
                        <input type="hidden" name="id" value="<?= $barangkembali['id_barangkembali']; ?>">
                    </div>
                    <div>
                        <a class="btn btn-outline-primary btn-icon-text btn-sm" title="Cetak Berita Acara" href="<?php echo base_url('/barangkembali/pdf/' . $barangkembali['id_barangkembali']) ?>"><i class="ti ti-printer"></i> Cetak Berita Acara</a>
                    </div>
                    <br>
                    <div class="form-group">
                        <label><b>Berita Acara</b></label>
                        <input type="file" class="form-control form-control-lg" id="beritakembali" name="beritakembali">
                        <p class="desc">.pdf|.docx| Maksimum 5MB </p>
                        <?php echo form_error('beritaacarakembali', '<small class="text-danger">', '</small>')?>
                    </div>
                    <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp;&nbsp;
                    <?php echo form_close(); ?>  
                </div>
            </div>
            </div>
        </div>
    </div>
</div>   