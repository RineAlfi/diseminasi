<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $title_pdf;?></title>
    <style>
        table tr .text2  {
            text-align: center;
        }

        #table tr td {
            font-size: 13px;
        }

        table tr .text{
            text-align: right;
            font-size: 13px;
        }
    </style>
</head>
<body>
        <table width="100%">
            <tr>
                <td><img src="<?= base_url('assets'); ?>/images/logo.png" width="90" height="90"></td>
                <td width="100%">
                    <center>
                        <font size="3"><?php echo $kop->nama_kementerian?></font><br>
                        <font size="3"><?php echo $kop->eslon_satu?></font><br> 
                        <font size="4"><?php echo $kop->eslon_dua?></font><br>
                        <font size="2"><?php echo $kop->eslon_tiga?></font><br>
                        <font size="2"><?php echo $kop->alamat?></font><br>
                        <font size="2"><?php echo $kop->kontak?></font><br>
                        <font size="2"><?php echo $kop->web_email?></font><br>
                    </center>
                </td>
            </tr>
            <tr>
                <td colspan="2"><hr></td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td class=text>Bogor, <?php echo tgl_indo(date('Y-m-d'));?></td>
            </tr>
        </table>
        <br>
        <table width="100%">
            <tr>
                <td>
                    <center>
                        <font size="3">BERITA ACARA SERAH TERIMA</font><br>
                        <font size="3">BARANG DISEMINASI</font><br>
                    </center>
                </td>
            </tr>
        </table>
        <br>
        <table style="width:100%; table-layout:fixed">
            <tr>
                <td width='20%'>Telah diterima dari</td>
                <td width='80%'>: </td>
            </tr>
        </table>
        <table style="width:100%; table-layout:fixed">
            <tr>
                <td width='20%'>Kepada</td>
                <td width='80%'>: Balai Penelitian Agroklimat dan Hidrologi</td>
            </tr>
        </table>
        <table style="width:100%; table-layout:fixed">
            <tr>
                <td width='20%'>Diserahkan pada</td>
                <td width='80%'>: <?php echo tgl_indo($detail->tanggal_kembali)?></td>
            </tr>
        </table>
        <table style="width:100%; table-layout:fixed">
            <tr>
                <td width='20%'>Keterangan</td>
                <td width='80%'>: <?php echo $detail->keterangankembali ?></td>
            </tr>
        </table>
        <table style="width:100%; table-layout:fixed">
            <tr>
                <td width='20%'>Nama Barang</td>
                <td width='80%'>: <?php echo $detailbarang->nama_barang?></td>
            </tr>
        </table>
        <table style="width:100%; table-layout:fixed">
            <tr>
                <td width='20%'>Jumlah Kembali</td>
                <td width='80%'>: <?php echo $detail->jumlah_kembali . ' ' . $detailbarang->nama_satuan; ?></td>
            </tr>
        </table>
        <br>
        <br>
        <table width="100%">
            <tr>
                <td width="25"class="text2">Yang Menyerahkan<br><br><br><br><br><br><br><hr> </td>
                <td width="50"></td>
                <td width="25" class="text2">Yang Menerima<br><br><br><br><br><br><br><hr> </td>
            </tr>
        </table>
</body>
</html>
<?php
function tgl_indo($tanggal){
	$bulan = array (
		1 =>   'Januari',
		'Februari',
		'Maret',
		'April',
		'Mei',
		'Juni',
		'Juli',
		'Agustus',
		'September',
		'Oktober',
		'November',
		'Desember'
	);
	$pecahkan = explode('-', $tanggal);
    return $pecahkan[2] . ' ' . $bulan[ (int)$pecahkan[1] ] . ' ' . $pecahkan[0];
	
	// variabel pecahkan 0 = tanggal
	// variabel pecahkan 1 = bulan
	// variabel pecahkan 2 = tahun
}
?>