<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                <h3 class="m-0 font-weight-bold">Edit Data Barang</h3><br>
                <div class="col-md-12 grid-margin">
                <div class="card-body">
                    <?php echo form_open('', [], ['stok' => 0, 'id_barang' => $barang['id_barang']]); ?>
                    <div class="form-group">
                        <label><b>Nama Barang</b></label><span style="color: red;"> *</span>
                        <input value="<?php echo set_value('nama_barang', $barang['nama_barang']); ?>" name="nama_barang" id="nama_barang" type="text" class="form-control" required>
                        <?php echo form_error('nama_barang', '<div class="text-small text-danger"></div>')?>
                    </div>
                    <div class="form-group">
                        <label><b>Jenis Barang</b></label><span style="color: red;"> *</span>
                        <select name="jenis_id" id="jenis_id" class="form-control" required>
                            <option value="" selected disabled>--Pilih Jenis Barang--</optiion>
                            <?php foreach($jenis as $j) : ?>
                                <option <?php echo $barang['jenis_id'] == $j['id_jenis'] ? 'selected' : '';?> <?php echo set_select('jenis_id', $j['id_jenis']) ?> value="<?php echo $j['id_jenis'] ?>"><?php echo $j['nama_jenis'] ?></option> 
                            <?php endforeach; ?>
                        </select>
                    <?php echo form_error('jenis_id', '<small class="text-danger">', '</small>'); ?>
                    </div>
                    <div class="form-group">
                        <label><b>Satuan Barang</b></label><span style="color: red;"> *</span>
                        <select name="satuan_id" id="satuan_id" class="form-control" required>
                            <option value="" selected disabled>--Pilih Satuan Barang--</optiion>
                            <?php foreach($satuan as $s) : ?>
                                <option <?php echo $barang['satuan_id'] == $s['id'] ? 'selected' : '';?> <?php echo set_select('satuan_id', $s['id']) ?> value="<?php echo $s['id'] ?>"> <?php echo $s['nama_satuan'] ?></option> 
                            <?php endforeach; ?>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp &nbsp
                    <a href="<?php echo base_url() ?>databarang" class="btn btn-warning" >Kembali</a>
                    <?php echo form_close(); ?>  
                </div>
                </div>
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