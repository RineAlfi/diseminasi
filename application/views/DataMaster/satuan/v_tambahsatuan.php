<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <h3 class="m-0 font-weight-bold">Tambah Data Satuan Barang</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="card-body">
                <form method="POST" action="<?php echo base_url('satuan/tambah_aksi') ?>">
                    <div class="form-group">
                        <label>Data Satuan Barang</label><span style="color: red;"> *</span>
                        <input type="text" name="nama_satuan" class="form-control" required>
                        <?php echo form_error('nama_satuan', '<small class="text-danger">', '</small>') ?>
                    </div>
                    <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp; &nbsp;
                    <a href="<?php echo base_url() ?>satuan" class="btn btn-warning" >Kembali</a>
                </form>
            </div>
        </div>                   
</div>
</div>