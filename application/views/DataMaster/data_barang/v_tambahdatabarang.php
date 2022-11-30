<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <h3 class="m-0 font-weight-bold">Tambah Data Barang</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="card-body">
                    <?php echo form_open('', [], ['stok' => 0]); ?>
                    <div class="form-group">
                        <label><b>Nama Barang</b></label><span style="color: red;"> *</span>
                        <input type="text" name="nama_barang" class="form-control">
                        <?php echo form_error('nama_barang', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Jenis Barang</b></label><span style="color: red;"> *</span>
                        <select name="jenis_id" id="jenis_id" class="form-control">
                            <option value=""></option>
                            <?php foreach($jenis as $j) : ?>
                                <option <?php echo set_select('jenis_id', $j['id_jenis']) ?> value="<?= $j['id_jenis'] ?>"><?= $j['nama_jenis'] ?></option>
                            <?php endforeach; ?>
                        </select>
                        <?php echo form_error('jenis_id', '<small class="text-danger">', '</small>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Satuan Barang</b></label><span style="color: red;"> *</span>
                        <select name="satuan_id" id="satuan_id" class="form-control">
                            <option value="">--Pilih Satuan Barang--</option>
                            <?php foreach($satuan as $s) : ?>
                                <option <?php echo set_select('satuan_id', $s['id']) ?> value="<?= $s['id'] ?>"><?= $s['nama_satuan'] ?></option>
                            <?php endforeach; ?>
                        </select>
                        <?php echo form_error('satuan_id', '<small class="text-danger">', '</small>')?>
                    </div>
                    <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp; &nbsp;
                    <a href="<?php echo base_url() ?>databarang" class="btn btn-warning" >Kembali</a> 
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
$('#jenis_id').select2({
// allowClear: true,
placeholder: "---Pilih Jenis Barang---",
});
$('#satuan_id').select2({
// allowClear: true,
placeholder: "---Pilih Satuan Barang---",
});
</script>