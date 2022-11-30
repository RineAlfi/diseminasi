<script src="<?php echo base_url("js/jquery.min.js"); ?>" type="text/javascript"></script>
<div class="main-panel">
    <div class="content-wrapper">
        <div class="row">
            <div class="col-md-12 grid-margin">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <a href="<?php echo base_url() ?>barangkeluar" class="btn btn-sm btn-warning float-right"><i class="ti ti-arrow-left"></i> Kembali ke Barang Keluar</a>
                        <h3 class="m-0 font-weight-bold">Tambah Data Barang Keluar</h3><br>
                        <div class="flash-data" id="flash" data-flash="<?= $this->session->flashdata('error'); ?>"></div>
                        <div class="col-md-12 grid-margin">
                            <?= form_open_multipart('barangkeluar/save', 'class="mt-4"'); ?>
                            <div class="form-group">
                                <label><b>Tanggal keluar</b></label><span style="color: red;"> *</span>
                                <input type="date" name="tanggal_keluar" class="form-control" required>
                                <?php echo form_error('tanggal_keluar', '<small class="text-danger">', '</small>') ?>
                            </div>
                            <div class="form-group">
                                <label><b>Nama Barang</b></label><span style="color: red;"> *</span>
                                <div class="input-group">
                                    <button class="btn btn-sm btn-outline-primary btn-fw" id="btn-tambah-form">Tambah Data Barang</button> &nbsp; &nbsp;
                                    <button type="reset" class="btn btn-sm btn-outline-danger btn-fw" id="btn-reset-form">Reset Data Barang</button>
                                </div>
                                <br>
                                <div class="form-group">
                                    <label><b>Data Barang ke 1 :</b></label>
                                        <table class="table table-bordered table-sm" style="background-color:#ffff;"> 
                                        <thead>
                                            <tr>
                                                <th style= "text-align: center;" width="50%">Nama Barang</th>
                                                <th style= "text-align: center;">Jumlah Keluar</th>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td> <select name="barang_id[]" id="barang_id" class="form-control">
                                                <option value="" selected disabled>---Pilih Barang---</option>
                                                    <?php foreach ($barang as $b) : ?>
                                                        <option <?php echo set_select('barang_id', $b['id_barang']) ?> value="<?php echo $b['id_barang'] ?>"><?php echo $b['nama_barang']. ' | Tersedia ' . $b['stok']. ' ' .$b['nama_satuan']?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                            <td><input type="number" name="jumlah_keluar[]" class="form-control" placeholder="Jumlah Keluar"  required></td>
                                        </tr>
                                    </table>
                                <br><br>
                                <div id="insert-form"></div>
                
                                <div class="form-group">
                                <label><b>Keterangan</b></label>
                                    <input type="text" name="keterangan" id="keterangan" class="form-control">
                                    <?php echo form_error('keterangan', '<small class="text-danger">', '</small>')?>
                                </div>
                                <button type="submit" class="btn btn-success">Simpan</a></button>&nbsp;&nbsp;
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<!-- Kita buat textbox untuk menampung jumlah data form -->
<input type="hidden" id="jumlah-form" value="1">
  
<script>
$(document).ready(function(){ // Ketika halaman sudah diload dan siap
$("#btn-tambah-form").click(function(){ // Ketika tombol Tambah Data Form di klik
    var jumlah = parseInt($("#jumlah-form").val()); // Ambil jumlah data form pada textbox jumlah-form
    var nextform = jumlah + 1; // Tambah 1 untuk jumlah form nya
   
    // Kita akan menambahkan form dengan menggunakan append
    // pada sebuah tag div yg kita beri id insert-form
    $("#insert-form").append("<b><label>Data Barang ke " + nextform + " :</b>"+
    "<table class='table table-bordered table-sm' style='background-color:#ffff; width:100%;'> " +
    "<thead>" +
    "<tr>" +
    "<td style='text-align: center;' width='50%'><b>Nama Barang</b></td>" +
    "<td style='text-align: center;'><b>Jumlah Keluar</b></td>" +
    "</tr>" +
    "<tr>" +
    "<td><select name='barang_id[]' id='barang_id' class='form-control'> <option value='' selected disabled>--Pilih Barang--</option> <?php foreach ($barang as $b) : ?>; <option <?php echo set_select('barang_id', $b['id_barang']) ?> value='<?php echo $b['id_barang'] ?>'><?php echo $b['nama_barang']. ' | ' . $b['stok']. ' ' .$b['nama_satuan']?></option>; <?php endforeach; ?>; </select></td>" +
    "<td><input type='text' name='jumlah_keluar[]' class='form-control' placeholder='Jumlah Keluar' required></td>" +
    "</tr>" +
    "</thead>" +
    "</table>" +
    "<br><br>");
    
    $("#jumlah-form").val(nextform); // Ubah value textbox jumlah-form dengan variabel nextform
});

// Buat fungsi untuk mereset form ke semula
$("#btn-reset-form").click(function(){
    $("#insert-form").html(""); // Kita kosongkan isi dari div insert-form
    $("#jumlah-form").val("1"); // Ubah kembali value jumlah form menjadi 1
});
});
</script>