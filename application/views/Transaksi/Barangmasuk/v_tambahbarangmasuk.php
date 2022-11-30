<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    <a href="<?php echo base_url() ?>barangmasuk" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Masuk</a>
                        <h3 class="m-0 font-weight-bold">Tambah Data Barang Masuk</h3><br>
                        <div class="flash-data" id="flash" data-flash="<?= $this->session->flashdata('error'); ?>"></div>
                        <div class="col-md-12 grid-margin">
                            <div class="card-body">
                            <?= form_open_multipart('', [], 'barangmasuk/tambah', 'class="mt-4"'); ?>
                            <div class="form-group">
                                <label><b>Tanggal Masuk</b></label><span style="color: red;"> *</span>
                                    <input type="date" name="tanggal_masuk" class="form-control">
                                    <?php echo form_error('tanggal_masuk', '<small class="text-danger">', '</small>') ?>
                                </div>
                            <div class="form-group">
                            <label><b>Nama Barang</b></label><span style="color: red;"> *</span>
                                    <div class="input-group">
                                        <select name="barang_id" id="barang_id" class="form-control">
                                            <option value=""></option>
                                            <?php foreach ($barang as $b) : ?>
                                                <option <?php echo set_select('barang_id', $b['id_barang']) ?> value="<?php echo $b['id_barang'] ?>"><?php echo $b['nama_barang']?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                    <?php echo form_error('barang_id', '<small class="text-danger">', '</small>'); ?>
                            </div>
                            <div class="form-group">
                                <label><b>Stok</b></label>
                                <div class="col-md-15">
                                    <input readonly="readonly" id="stok" name="stok" type="number" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label><b>Jumlah Masuk</b></label><span style="color: red;"> *</span>
                                <div class="col-md-15">
                                    <div class="input-group">
                                        <input value="<?php echo set_value('jumlah_masuk');?>" name="jumlah_masuk" id="jumlah_masuk" type="number" class="form-control">
                                        <div class="input-group-append" >
                                            <span><input readonly="readonly" id="satuan" name="satuan" type="text" class="form-control" placeholder=Satuan ></span>
                                        </div>
                                    </div>
                                    <?php echo form_error('jumlah_masuk', '<small class="text-danger">', '</small>'); ?>
                                </div>
                            </div>
                            <div class="form-group">
                            <label><b>Keterangan</b></label>
                                <input type="text" name="keterangan" id="keterangan" class="form-control">
                                <?php echo form_error('keterangan', '<small class="text-danger">', '</small>')?>
                            </div>
                            <div class="form-group">
                                <label><b>Foto Produk</b></label>
                                <input type="file" class="form-control form-control-lg" id="foto" name="foto">
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
                            <?= form_close(); ?>
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
$('#barang_id').select2({
    // allowClear: true,
    placeholder: "---Pilih Barang---",
});
    $('#barang_id').on('input',function(){
    
    var barang_id=$(this).val();
    $.ajax({
        type : "POST",
        url  : "<?php echo base_url('databarang/get_barang')?>",
        dataType : "JSON",
        data : {barang_id: barang_id},
        cache:false,
        success: function(data){
            $.each(data,function(barang_id, stok, nama_satuan){
                $('[name="barang_id"]').val(data.barang_id);
                $('[name="stok"]').val(data.stok);
                $('[name="satuan"]').val(data.nama_satuan);
                
            });
            
        }
    });
    return false;
});
</script>