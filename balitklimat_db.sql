-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2022 at 05:58 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `balitklimat_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jenis_id` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `satuan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jenis_id`, `stok`, `satuan_id`) VALUES
(1, 'Tas Blacu', 4, 2, 2),
(2, 'Pulpen Tali', 2, 2, 1),
(3, 'Tumblr', 3, 4, 3),
(4, 'Juknis', 2, 3, 4),
(6, 'Notebook', 2, 0, 2),
(10, 'Buletin Agroklimat', 2, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barangkeluar` varchar(25) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `keterangan` longtext NOT NULL,
  `beritaacara` varchar(255) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barangkeluar`, `tanggal_keluar`, `keterangan`, `beritaacara`, `barang_id`) VALUES
('BK2204008', '2022-04-09', '', NULL, NULL),
('BK2204009', '2022-04-09', '', NULL, NULL),
('BK2204010', '2022-04-12', 'Barang Sesuai', 'berita_acara_barang_diseminasi_105.pdf', NULL),
('BK2204011', '2022-04-13', 'Barang Sesuai', 'berita_acara_barang_diseminasi_106.pdf', NULL),
('BK2205001', '2022-04-19', 'Barang Sesuai', NULL, NULL),
('BK2205002', '2022-05-27', 'Barang Sesuai', NULL, NULL),
('BK2205003', '2022-05-28', 'Barang Sesuai', NULL, NULL),
('BK2205004', '2022-05-28', '', 'Extreme_Programming_untuk_rancang_bangun_aplikasi_.pdf', NULL),
('BK2206001', '2022-06-20', 'Barang Sesuai', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barang_kembali`
--

CREATE TABLE `barang_kembali` (
  `id_barangkembali` varchar(25) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `jumlah_kembali` int(11) NOT NULL,
  `keterangankembali` longtext NOT NULL,
  `barang_idkeluar` int(11) NOT NULL,
  `fotokembali` varchar(255) DEFAULT NULL,
  `beritakembali` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_kembali`
--

INSERT INTO `barang_kembali` (`id_barangkembali`, `tanggal_kembali`, `jumlah_kembali`, `keterangankembali`, `barang_idkeluar`, `fotokembali`, `beritakembali`) VALUES
('BKM2204004', '2022-04-09', 2, '', 54, 'default.png', NULL),
('BKM2204005', '2022-04-08', 2, '', 54, 'default.png', NULL),
('BKM2204009', '2022-04-09', 3, '', 56, 'default.png', NULL),
('BKM2204010', '2022-04-12', 2, 'Barang Baik', 60, 'default.png', 'berita_acara_barang_diseminasi_126.pdf'),
('BKM2206001', '2022-06-13', 1, 'Barang Baik', 91, 'default.png', NULL),
('BKM2206002', '2022-06-14', 1, '', 91, 'default.png', NULL),
('BKM2206003', '2022-06-15', 2, '', 92, 'default.png', NULL),
('BKM2206004', '2022-06-14', 2, '', 90, 'default.png', NULL),
('BKM2206005', '2022-06-21', 2, 'Barang Baik', 93, 'default.png', 'berita_acara_barang_diseminasi_121.pdf'),
('BKM2206006', '2022-06-22', 1, '', 93, 'default.png', 'laporan_transaksi_barang_keluar_64.pdf'),
('BKM2206007', '2022-06-23', 1, '', 93, 'default.png', 'berita_acara_barang_diseminasi_108.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barangmasuk` varchar(25) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `keterangan` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barangmasuk`, `tanggal_masuk`, `barang_id`, `jumlah_masuk`, `foto`, `keterangan`) VALUES
('BM2204003', '2022-04-06', 3, 10, 'default.png', ''),
('BM2204004', '2022-04-10', 2, 2, 'c8eb9aa7da5afe6664127cb4b7fc651e.jpg', 'Barang Baik'),
('BM2204005', '2022-04-12', 4, 5, 'product.png', 'Barang Sesuai'),
('BM2205001', '2022-05-27', 10, 5, 'return.png', 'Barang Sesuai'),
('BM2205002', '2022-05-27', 3, 2, 'default.png', 'Barang Sesuai'),
('BM2207001', '2022-07-08', 1, 2, 'product2.png', 'Barang Sesuai');

-- --------------------------------------------------------

--
-- Table structure for table `buku_tamu`
--

CREATE TABLE `buku_tamu` (
  `id_buku_tamu` varchar(20) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `nama_lengkap` varchar(256) NOT NULL,
  `asal_instansi` varchar(256) NOT NULL,
  `email` varchar(256) DEFAULT NULL,
  `no_wa` varchar(20) DEFAULT NULL,
  `id_divisi` varchar(256) NOT NULL,
  `pegawai_nip` varchar(20) DEFAULT NULL,
  `keperluan` text NOT NULL,
  `alasan` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `laporan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku_tamu`
--

INSERT INTO `buku_tamu` (`id_buku_tamu`, `jenis`, `tanggal`, `waktu`, `nama_lengkap`, `asal_instansi`, `email`, `no_wa`, `id_divisi`, `pegawai_nip`, `keperluan`, `alasan`, `keterangan`, `laporan`) VALUES
('BT220223001', 'A', '2022-02-25', '20:37:00', 'AZZAHRA RAMADIANA ARIFANI', 'ipb', 'azzahrara.0210@gmail.com', '2147483647', 'yantek', '12345678', 'KEP01', NULL, 'test 1', ''),
('BT220223002', 'A', '2022-02-23', '20:39:00', 'fee', 'xsda', 'feliia@gmail.com', '11111', 'yantek', NULL, 'KEP02', NULL, '', ''),
('BT220223003', 'B', '2022-02-23', '20:40:00', 'sehun', 'sm', 'sehun@gmail.com', '242111', 'tu', '12345678', 'KEP02', NULL, '', ''),
('BT220223004', 'B', '2022-02-23', '20:42:00', 'alasannnnnnnnnnnnnn', 'ipb', '10969zrazzahra@apps.ipb.ac.id', '812334123', 'tu', NULL, 'KEP02', 'ALS03', 'testsssssssssssssssssss', ''),
('BT220304001', 'Tidak Bertemu', '2022-03-04', '10:26:00', 'Azzahra Ramadiana Arifani', 'xsda', 'azzahrara.0210@gmail.com', '11111', 'tu', '196401211990031002', 'keperluannanana', 'alasannana', 'aa', 'edit'),
('BT220311001', 'Bertemu', '2022-03-12', '22:07:00', 'AZZAHRA RAMADIANA ARIFANI', 'dfad', 'azzahrara.0210@gmail.com', '2147483647', '4', '', 'keperluannanana', '', '', ''),
('BT220311002', 'Tidak Bertemu', '2022-03-12', '10:09:00', 'AZZAHRA RAMADIANA ARIFANI', 'asal instansi edit', 'azzahrara.0210@gmail.com', '2147483647', '196401211990031002', '', 'asa', 'alasannana', '', ''),
('BT220311004', 'Tidak Bertemu', '2022-03-12', '21:11:00', 'Amaira', 'asal instansi', 'feliia@gmail.com', '0', '2', '195805161993032002', 'asa', 'alasannana', 'a', ''),
('BT220311005', 'Bertemu', '2022-03-18', '11:12:00', 'Azzahra Ramadiana Arifani', 'dfad', 'lugasmunaya@gmail.com', '11111', '2', '195805161993032002', 'asa', '', '', ''),
('BT220311006', 'Tidak Bertemu', '2022-03-05', '11:13:00', 'Amaira', 'sm', '', '0', '2', '195805161993032002', 'keperluannanana', 'alasannana', '', ''),
('BT220311007', 'Bertemu', '2022-03-05', '09:15:00', 'test', 'dfad', '', '', '2', '195805161993032002', 'keperluannanana', '', '', ''),
('BT220311008', 'Bertemu', '2022-04-08', '11:18:00', 'test', 'asal instansi edit', 'azzahrara.0210@gmail.com', '11111', '1', '196401211990031002', 'keperluannanana', '', 'Have a bunch of buttons that all trigger the same modal with slightly different contents? Use event.relatedTarget and HTML data-* attributes (possibly via jQuery) to vary the contents of the modal depending on which button was clicked.\r\n\r\nBelow is a live demo followed by example HTML and JavaScript. For more information, read the modal events docs for details on relatedTarget.', 'fffd'),
('BT220311011', 'Bertemu', '2022-03-30', '13:50:00', 'AzzahraRamadi ana Arifani YAYAYA', 'asal instansi edit', 'fb.ipin@gmail.com', '2434234234', '1', '196401211990031002', 'keperluannanana', '', 'ASA', '');

-- --------------------------------------------------------

--
-- Table structure for table `data_anggota_perjadin`
--

CREATE TABLE `data_anggota_perjadin` (
  `id_anggota_perjadin` int(11) NOT NULL,
  `id_perjalanan_dinas` int(11) NOT NULL,
  `nip_anggota_perjadin` varchar(18) NOT NULL,
  `no_sppd2` varchar(25) NOT NULL,
  `no_kas` int(11) DEFAULT NULL,
  `uang_harian` int(11) NOT NULL,
  `uang_transportasi` int(11) DEFAULT NULL,
  `hari1` int(11) DEFAULT NULL,
  `hari2` int(11) DEFAULT NULL,
  `hari3` int(11) DEFAULT NULL,
  `biaya1` int(11) DEFAULT NULL,
  `biaya2` int(11) DEFAULT NULL,
  `biaya3` int(11) DEFAULT NULL,
  `uang_penginapan` int(11) DEFAULT NULL,
  `total_pendapatan` int(11) NOT NULL,
  `status_perjalanan_dinas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_anggota_perjadin`
--

INSERT INTO `data_anggota_perjadin` (`id_anggota_perjadin`, `id_perjalanan_dinas`, `nip_anggota_perjadin`, `no_sppd2`, `no_kas`, `uang_harian`, `uang_transportasi`, `hari1`, `hari2`, `hari3`, `biaya1`, `biaya2`, `biaya3`, `uang_penginapan`, `total_pendapatan`, `status_perjalanan_dinas`) VALUES
(1, 24, '196710081994032013', '/SPPD/I.8.3/03/2022', NULL, 1290000, 0, 0, 0, 0, 0, 0, 0, 0, 1290000, 'Belum Berangkat');

-- --------------------------------------------------------

--
-- Table structure for table `data_divisi`
--

CREATE TABLE `data_divisi` (
  `id_divisi` int(11) NOT NULL,
  `divisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_divisi`
--

INSERT INTO `data_divisi` (`id_divisi`, `divisi`) VALUES
(1, 'Tidak Ada'),
(2, 'Jasa Penelitian');

-- --------------------------------------------------------

--
-- Table structure for table `data_golongan`
--

CREATE TABLE `data_golongan` (
  `id_golongan` int(11) NOT NULL,
  `golongan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_golongan`
--

INSERT INTO `data_golongan` (`id_golongan`, `golongan`) VALUES
(1, 'Tidak Ada'),
(3, 'II C'),
(4, 'II D'),
(5, 'III A'),
(7, 'III B'),
(8, 'III C'),
(9, 'III D'),
(10, 'IV A'),
(15, 'IV B'),
(16, 'IV C'),
(17, 'IV D');

-- --------------------------------------------------------

--
-- Table structure for table `data_header_surat`
--

CREATE TABLE `data_header_surat` (
  `id_header_surat` varchar(10) NOT NULL,
  `nama_kementerian` varchar(50) NOT NULL,
  `eslon_satu` varchar(50) NOT NULL,
  `eslon_dua` varchar(50) NOT NULL,
  `eslon_tiga` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kontak` varchar(100) NOT NULL,
  `web_email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_header_surat`
--

INSERT INTO `data_header_surat` (`id_header_surat`, `nama_kementerian`, `eslon_satu`, `eslon_dua`, `eslon_tiga`, `alamat`, `kontak`, `web_email`) VALUES
('h01', 'KEMENTERIAN PERTANIAN', 'BADAN PENELITIAN DAN PENGEMBANGAN PERTANIAN', 'BALAI BESAR LITBANG SUMBERDAYA LAHAN PERTANIAN', 'BALAI PENELITIAN AGROKLIMAT DAN HIDROLOGI', 'Jl. Tentara Pelajar No. 1A, Kampus Penelitian Pertanian Cimanggu Bogor 16111', 'Telepon (0251) 8312760, Faksimili (0251) 8323909', 'Website  http://balitklimat.litbang.pertanian.go.id  E-MAIL : balitklimat@litbang.pertanian.go,id');

-- --------------------------------------------------------

--
-- Table structure for table `data_jabatan`
--

CREATE TABLE `data_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_jabatan`
--

INSERT INTO `data_jabatan` (`id_jabatan`, `jabatan`) VALUES
(1, 'Plt. Kepala Balai'),
(2, 'Peneliti Ahli Utama'),
(3, 'Peneliti Ahli Madya'),
(4, 'Plh.Kepala Balai');

-- --------------------------------------------------------

--
-- Table structure for table `data_jadwal_gaji_berkala`
--

CREATE TABLE `data_jadwal_gaji_berkala` (
  `kode_kgb` varchar(14) NOT NULL,
  `tgl_penjadwalan` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nip` varchar(18) NOT NULL,
  `gaji_lama` int(11) NOT NULL,
  `gaji_baru` int(11) NOT NULL,
  `tmt_gaji_1` date DEFAULT NULL,
  `tmt_gaji_2` date DEFAULT NULL,
  `tmt_gaji_3` date DEFAULT NULL,
  `tmt_gaji_4` date DEFAULT NULL,
  `tmt_gaji_5` date DEFAULT NULL,
  `jadwal_kgb` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_jadwal_gaji_berkala`
--

INSERT INTO `data_jadwal_gaji_berkala` (`kode_kgb`, `tgl_penjadwalan`, `nip`, `gaji_lama`, `gaji_baru`, `tmt_gaji_1`, `tmt_gaji_2`, `tmt_gaji_3`, `tmt_gaji_4`, `tmt_gaji_5`, `jadwal_kgb`) VALUES
('030322001', '2022-03-03 14:26:21', '196401211990031002', 4000000, 45000000, '2022-03-03', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '2026-03-03'),
('050322001', '2022-03-05 12:08:06', '196411291990032002', 4000000, 45000000, '2022-03-05', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '2022-04-09'),
('060322001', '2022-03-06 13:27:57', '195805161993032002', 4000000, 5500000, '2022-03-06', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '2022-04-09');

-- --------------------------------------------------------

--
-- Table structure for table `data_jadwal_naik_pangkat`
--

CREATE TABLE `data_jadwal_naik_pangkat` (
  `kode_kp` varchar(14) NOT NULL,
  `tgl_penjadwalan` timestamp NULL DEFAULT current_timestamp(),
  `nip` varchar(18) NOT NULL,
  `id_pangkat_berikutnya` int(11) NOT NULL,
  `id_golongan_berikutnya` int(11) NOT NULL,
  `tmt_pangkat_1` date DEFAULT NULL,
  `tmt_pangkat_2` date DEFAULT NULL,
  `tmt_pangkat_3` date DEFAULT NULL,
  `tmt_pangkat_4` date DEFAULT NULL,
  `tmt_pangkat_5` date DEFAULT NULL,
  `jadwal_kp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_jadwal_naik_pangkat`
--

INSERT INTO `data_jadwal_naik_pangkat` (`kode_kp`, `tgl_penjadwalan`, `nip`, `id_pangkat_berikutnya`, `id_golongan_berikutnya`, `tmt_pangkat_1`, `tmt_pangkat_2`, `tmt_pangkat_3`, `tmt_pangkat_4`, `tmt_pangkat_5`, `jadwal_kp`) VALUES
('050322001', '2022-03-05 07:12:26', '195805161993032002', 6, 4, '2022-03-05', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '2022-04-08'),
('050322002', '2022-03-05 10:05:04', '196411291990032002', 8, 9, '2022-03-18', '0000-00-00', '0000-00-00', '0000-00-00', '0000-00-00', '2022-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `data_jenis_keg`
--

CREATE TABLE `data_jenis_keg` (
  `id_jenis_keg` int(11) NOT NULL,
  `jenis_keg` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_jenis_keg`
--

INSERT INTO `data_jenis_keg` (`id_jenis_keg`, `jenis_keg`) VALUES
(9, 'Kerjasama'),
(10, 'APBN');

-- --------------------------------------------------------

--
-- Table structure for table `data_kegiatan`
--

CREATE TABLE `data_kegiatan` (
  `kode_kegiatan` varchar(10) NOT NULL,
  `judul_kegiatan` varchar(50) NOT NULL,
  `id_jenis_keg` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `nip_pj_kegiatan` varchar(18) NOT NULL,
  `nip_pj_rrr` varchar(18) NOT NULL,
  `biaya_pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_kegiatan`
--

INSERT INTO `data_kegiatan` (`kode_kegiatan`, `judul_kegiatan`, `id_jenis_keg`, `tahun`, `nip_pj_kegiatan`, `nip_pj_rrr`, `biaya_pengeluaran`) VALUES
('RPTP1', 'Pemetaan Lahan Pertanian Indonesia', 9, 2022, '196901241998032001', '196803301994031001', 1290000);

-- --------------------------------------------------------

--
-- Table structure for table `data_kendaraan`
--

CREATE TABLE `data_kendaraan` (
  `id_kendaraan` int(11) NOT NULL,
  `no_polisi` varchar(15) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_kendaraan`
--

INSERT INTO `data_kendaraan` (`id_kendaraan`, `no_polisi`, `merk`, `jenis`, `status`) VALUES
(1, 'F 6409 GR', 'Toyota Innova', 'Roda 4', 1),
(2, 'F 4326 AQ', 'Mitsubishi Kuda', 'Roda 4', 2),
(4, 'F 1020 MB', 'Toyota Innova', 'Roda 4', 2),
(5, 'F 6409 G', 'Toyota Innova', 'Roda 4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `data_kota`
--

CREATE TABLE `data_kota` (
  `id_kota` int(11) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `id_sbuh` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_kota`
--

INSERT INTO `data_kota` (`id_kota`, `kota`, `id_sbuh`) VALUES
(6, 'Kota Medan', 3),
(7, 'Banda Aceh', 1),
(8, 'Kabupaten Aceh Barat', 1),
(9, 'Kota Bogor', 13),
(10, 'Kabupaten Bogor', 13),
(11, 'Kota Bandung', 13),
(12, 'Jakarta Selatan', 14),
(13, 'Jakarta Timur', 14),
(14, 'Kabupaten Magetan', 17);

-- --------------------------------------------------------

--
-- Table structure for table `data_mak`
--

CREATE TABLE `data_mak` (
  `kode_mak` varchar(15) NOT NULL,
  `judul_mak` varchar(50) NOT NULL,
  `tahun` int(11) NOT NULL,
  `banyak_anggaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_mak`
--

INSERT INTO `data_mak` (`kode_mak`, `judul_mak`, `tahun`, `banyak_anggaran`) VALUES
('C2.003.145', 'Biaya Perjalanan Dinas Dalam Negeri', 2022, 52710000),
('C2.003.146', 'Biaya Perjalanan Dinas Luar Negeri', 2022, 67000000);

-- --------------------------------------------------------

--
-- Table structure for table `data_notifikasi`
--

CREATE TABLE `data_notifikasi` (
  `id_notifikasi` int(11) NOT NULL,
  `nip` varchar(18) NOT NULL,
  `pesan` text NOT NULL,
  `jenis_notif` varchar(255) NOT NULL,
  `tgl_notif` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_notifikasi`
--

INSERT INTO `data_notifikasi` (`id_notifikasi`, `nip`, `pesan`, `jenis_notif`, `tgl_notif`) VALUES
(14, '195805161993032002', 'Waktunya naik pangkat pada tanggal 2022-04-08', 'notif_kp', '2022-03-09 08:33:05'),
(17, '196411291990032002', 'Waktunya naik pangkat pada tanggal 2022-06-04', 'notif_kgb', '2022-03-09 08:48:10'),
(18, '196710081994032013', 'Waktunya naik pangkat pada tanggal 2022-04-08', 'notif_kp', '2022-03-13 16:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `data_pangkat`
--

CREATE TABLE `data_pangkat` (
  `id_pangkat` int(11) NOT NULL,
  `pangkat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pangkat`
--

INSERT INTO `data_pangkat` (`id_pangkat`, `pangkat`) VALUES
(1, 'Tidak ada'),
(2, 'Pembina Utama'),
(4, 'Pembina'),
(6, 'Penata'),
(7, 'Penata Tk I'),
(8, 'Pengatur Tk I'),
(10, 'Pembina Tk I'),
(13, 'Pembina Utama Muda');

-- --------------------------------------------------------

--
-- Table structure for table `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `nip` varchar(18) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_golongan` int(11) DEFAULT NULL,
  `id_status_peg` int(11) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_divisi` int(11) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `email` varchar(62) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `no_whatsapp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pegawai`
--

INSERT INTO `data_pegawai` (`nip`, `nama_pegawai`, `foto`, `id_golongan`, `id_status_peg`, `id_pangkat`, `id_jabatan`, `id_divisi`, `nik`, `email`, `password`, `no_whatsapp`) VALUES
('196401211990031002', 'Dr. Ir. A. Arivin Rivaie, M.Sc', 'images6.jpg', 23, 3, 2, 2, 2, '3271062101640004', 'likelomba1@gmail.com', '9de21d5186a0a2ffba24b34c3a085445', '6281235062988     '),
('196505281991032001', 'Ir. Erni Susanti, M.Sc', 'fix_kolokium213.jpg', 20, 3, 7, 5, 8, '3271046805650004', 'lugasmunayasika@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281235062988'),
('196710081994032013', 'Dr. Woro Estiningtyas', 'default.png', 22, 3, 2, 5, 2, '3201294810670003', 'likelomba2@gmail.com', '73d56121acabf8381308a34ab18d7711', '6281235062988     '),
('196803301994031001', 'Dr. Budi Kartiwa', 'WhatsApp_Image_2022-01-14_at_14_30_572.jpeg', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
('196901241998032001', 'Dr. Elza Surmaini', 'fix_kolokium11.jpg', 22, 3, 6, 5, 2, '3271066401690004', 'lugasmunaya@gmail.com', '011a20a4d84069b353e5ae50cdcda680', '6281235062988     '),
('198007242005011001', 'Fadhullah Ramadhani, S.Kom, M.Sc', 'default.png', 18, 4, 8, 6, 2, '3271062407800008', 'lugas_munayasikalugas@apps.ipb.ac.id', '579646aad11fae4dd295812fb4526245', '6281235062988  '),
('HNR901241998032002', 'Daeng Muda Panglima', 'default.png', 1, 8, 1, 23, 4, '3520036004010222', 'likelomba3@gmail.com', 'fb373e40d050f61b55aa9387d59bedae', '6281235062988    '),
('HNR901241998032003', 'Imam Susilo', 'default.png', 1, 8, 1, 25, 8, '3520036004020004', 'robbihably1@gmail.com', 'a970a7e3b359f88a4732b56050822888', '6281235028999  ');

-- --------------------------------------------------------

--
-- Table structure for table `data_role`
--

CREATE TABLE `data_role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_role`
--

INSERT INTO `data_role` (`id_role`, `role`) VALUES
(1, 'Admin ASN'),
(2, 'Admin Perjalanan Dinas'),
(3, 'Admin Inventaris'),
(5, 'Admin Disposisi'),
(6, 'Admin Laporan Magang'),
(7, 'Admin Buku Tamu'),
(8, 'Admin Bahan Diseminasi'),
(9, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `data_tugas`
--

CREATE TABLE `data_tugas` (
  `id_tugas` int(11) NOT NULL,
  `penugasan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_tugas`
--

INSERT INTO `data_tugas` (`id_tugas`, `penugasan`) VALUES
(3, 'Pemegang Uang Muka Kerja'),
(11, 'Kuasa Pengguna Anggaran'),
(12, 'PJ RPTP'),
(13, 'PJ RDHP'),
(14, 'PJ RKTM');

-- --------------------------------------------------------

--
-- Table structure for table `detail_disposisi`
--

CREATE TABLE `detail_disposisi` (
  `id_kepada` int(11) NOT NULL,
  `suratmasuk_id` varchar(11) NOT NULL,
  `kepada` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_disposisi`
--

INSERT INTO `detail_disposisi` (`id_kepada`, `suratmasuk_id`, `kepada`) VALUES
(34, 'SM220301', 'Kepala Sub Bagian Tata Usaha'),
(35, 'SM220301', 'Pejabat Pembuat Komitmen'),
(36, 'SM220302', 'Subkoordinator Jasa Penelitian'),
(37, 'SM220302', 'Bendahara Penerimaan'),
(38, 'SM220303', 'Subkoordinator Pelayanan Teknis'),
(39, 'SM220303', 'Pejabat Pembuat Komitmen'),
(40, 'SM220303', 'Bendahara Pengeluaran'),
(41, 'SM220308', 'Kepala Sub Bagian Tata Usaha'),
(42, 'SM220308', 'Subkoordinator Pelayanan Teknis'),
(43, 'SM220308', 'Bendahara Penerimaan'),
(44, 'SM220310', 'Kepala Sub Bagian Tata Usaha'),
(45, 'SM220310', 'Pejabat Pembuat Komitmen'),
(46, 'SM220310', 'OH'),
(47, 'SM220306', 'Subkoordinator Pelayanan Teknis'),
(48, 'SM220306', 'Bendahara Pengeluaran'),
(49, 'SM220306', 'Jaslit'),
(50, 'SM220401', 'Kepala Sub Bagian Tata Usaha'),
(51, 'SM220401', 'Subkoordinator Pelayanan Teknis'),
(52, 'SM220401', 'Pejabat Pembuat Komitmen'),
(53, 'SM220401', 'TA'),
(54, 'SM220401', 'Subkoordinator Jasa Penelitian'),
(55, 'SM220401', 'Pejabat Pembuat Komitmen'),
(56, 'SM220401', 'TA'),
(57, 'SM220401', 'OH'),
(58, 'SM220401', 'Jaslit'),
(59, 'SM220402', 'Kepala Sub Bagian Tata Usaha'),
(60, 'SM220402', 'Bendahara Pengeluaran'),
(61, 'SM220402', 'Bendahara Penerimaan'),
(62, 'SM220402', 'TA'),
(63, 'SM220402', 'OH'),
(64, 'SM220402', '');

-- --------------------------------------------------------

--
-- Table structure for table `detail_dokumen`
--

CREATE TABLE `detail_dokumen` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` varchar(255) NOT NULL,
  `nama_dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_dokumen`
--

INSERT INTO `detail_dokumen` (`id_detail`, `id_transaksi`, `nama_dokumen`) VALUES
(222, 'BKM2204004', 'berita_acara_barang_diseminasi_41.pdf'),
(234, 'BM2204002', 'berita_acara_barang_diseminasi_35.pdf'),
(241, 'BK2204001', 'berita_acara_barang_diseminasi_40.pdf'),
(242, 'BK2204001', 'berita_acara_barang_diseminasi_37.pdf'),
(243, 'BK2204001', 'berita_acara_barang_diseminasi_42.pdf'),
(246, 'BK2204002', 'disposisi_surat_1362.pdf'),
(249, 'BM2204004', 'laporan_transaksi_barang_keluar_16.pdf'),
(250, 'BK2204010', 'laporan_transaksi_barang_keluar_22.pdf'),
(251, 'BK2204010', 'laporan_transaksi_barang_masuk_18.pdf'),
(253, 'BKM2204011', 'berita_acara_barang_diseminasi_57.pdf'),
(254, 'BKM2204011', 'berita_acara_barang_diseminasi_56.pdf'),
(257, 'BM2204005', 'disposisi_surat_137.pdf'),
(258, 'BK2204011', 'laporan_transaksi_barang_keluar_14.pdf'),
(259, 'BK2204011', 'berita_acara_barang_diseminasi_44.pdf'),
(260, 'BM2205001', 'disposisi_surat_10.pdf'),
(261, 'BM2205001', 'disposisi_surat_9.pdf'),
(262, 'BKM2205001', 'Satuan_Barang_Bahan_Diseminasi.pdf'),
(277, 'BM2205001', 'BAHAN2.docx'),
(278, 'BM2205001', 'Bahan.pdf'),
(279, 'BK2205004', '957-2393-1-PB_(1).pdf'),
(281, 'BKM2206005', 'berita_acara_barang_diseminasi_124.pdf'),
(282, 'BKM2206006', 'BAB_2_3.pdf'),
(283, 'BKM2206007', 'laporan_transaksi_barang_masuk_23.pdf'),
(284, 'BM2207001', 'disposisi_surat_157.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `detail_keluar`
--

CREATE TABLE `detail_keluar` (
  `id_detailkeluar` int(11) NOT NULL,
  `id_transaksi` varchar(25) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_keluar`
--

INSERT INTO `detail_keluar` (`id_detailkeluar`, `id_transaksi`, `barang_id`, `jumlah_keluar`) VALUES
(54, 'BK2204008', 3, 2),
(56, 'BK2204009', 2, 3),
(60, 'BK2204010', 2, 3),
(61, 'BK2204011', 3, 3),
(82, 'BK2205001', 3, 3),
(83, 'BK2205001', 2, 5),
(86, 'BK2205002', 3, 2),
(87, 'BK2205002', 2, 1),
(88, 'BK2205003', 3, 1),
(89, 'BK2205003', 1, 5),
(90, 'BK2205004', 2, 5),
(93, 'BK2206001', 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `detail_role`
--

CREATE TABLE `detail_role` (
  `id_detail_role` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `role` varchar(55) NOT NULL,
  `nip` varchar(18) NOT NULL,
  `nama_pegawai` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_golongan` int(11) NOT NULL,
  `id_status_peg` int(11) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_divisi` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `email` varchar(62) NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_whatsapp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_role`
--

INSERT INTO `detail_role` (`id_detail_role`, `id_role`, `role`, `nip`, `nama_pegawai`, `foto`, `id_golongan`, `id_status_peg`, `id_pangkat`, `id_jabatan`, `id_divisi`, `nik`, `email`, `password`, `no_whatsapp`) VALUES
(1, 1, 'Admin ASN', '196803301994031001', 'Dr. Budi Kartiwa', 'WhatsApp_Image_2022-01-14_at_14_30_572.jpeg', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
(26, 9, 'User', '196803301994031001', 'Dr. Budi Kartiwa', 'default.png', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
(28, 2, 'Admin Perjalanan Dinas', '196803301994031001', 'Dr. Budi Kartiwa', 'default.png', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
(29, 3, 'Admin Inventaris', '196803301994031001', 'Dr. Budi Kartiwa', 'default.png', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
(30, 6, 'Admin Laporan Magang', '196803301994031001', 'Dr. Budi Kartiwa', 'default.png', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
(31, 5, 'Admin Disposisi', '196803301994031001', 'Dr. Budi Kartiwa', 'default.png', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
(32, 7, 'Admin Buku Tamu', '196803301994031001', 'Dr. Budi Kartiwa', 'default.png', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079'),
(33, 9, 'User', '196710081994032013', 'Dr. Woro Estiningtyas', 'default.png', 22, 3, 2, 5, 2, '3201294810670003', 'likelomba2@gmail.com', '73d56121acabf8381308a34ab18d7711', '6281235062988     '),
(56, 1, 'Admin ASN', '196901241998032001', 'Dr. Elza Surmaini', 'default.png', 22, 3, 6, 5, 2, '3271066401690004', 'lugasmunaya@gmail.com', 'b0fedbe42d05e4158e239a8ad8c9b1ae', '6281235062988     '),
(59, 9, 'User', 'HNR901241998032002', 'Daeng Muda Panglima', 'default.png', 1, 8, 1, 23, 4, '3520036004010222', 'likelomba3@gmail.com', 'fb373e40d050f61b55aa9387d59bedae', '6281235062988    '),
(60, 9, 'User', 'HNR901241998032003', 'Imam Susilo', 'default.png', 1, 8, 1, 25, 8, '3520036004020004', 'robbihably1@gmail.com', 'a970a7e3b359f88a4732b56050822888', '6281235028999  '),
(64, 9, 'User', '196401211990031002', 'Dr. Ir. A. Arivin Rivaie, M.Sc', 'images6.jpg', 23, 3, 2, 2, 2, '3271062101640004', 'likelomba1@gmail.com', '9de21d5186a0a2ffba24b34c3a085445', '6281235062988     '),
(100, 9, 'User', '196901241998032001', 'Dr. Elza Surmaini', 'fix_kolokium11.jpg', 22, 3, 6, 5, 2, '3271066401690004', 'lugasmunaya@gmail.com', 'b0fedbe42d05e4158e239a8ad8c9b1ae', '6281235062988     '),
(106, 9, 'User', '196505281991032001', 'Ir. Erni Susanti, M.Sc', 'default.png', 20, 3, 7, 5, 8, '3271046805650004', 'lugasmunayasika@gmail.com', '1a674ffa14bf2db92223b23d35593dbb', '6281235062988'),
(107, 9, 'User', '198007242005011001', 'Fadhullah Ramadhani, S.Kom, M.Sc', 'default.png', 18, 4, 8, 6, 2, '3271062407800008', 'lugas_munayasikalugas@apps.ipb.ac.id', '579646aad11fae4dd295812fb4526245', '6281235062988  '),
(113, 9, 'User', '198007242005011001', 'Fadhullah Ramadhani, S.Kom, M.Sc', 'default.png', 18, 4, 8, 6, 2, '3271062407800008', 'lugas_munayasikalugas@apps.ipb.ac.id', '579646aad11fae4dd295812fb4526245', '6281235062988  '),
(115, 9, 'User', 'HNR901241998032003', 'Imam Susilo', 'default.png', 1, 8, 1, 25, 8, '3520036004020004', 'robbihably1@gmail.com', 'a970a7e3b359f88a4732b56050822888', '6281235028999  '),
(117, 8, 'Admin Bahan Diseminasi', '196803301994031001', 'Dr. Budi Kartiwa', 'WhatsApp_Image_2022-01-14_at_14_30_572.jpeg', 21, 3, 4, 5, 4, '3201293003680001', 'asn.balitklimat@gmail.com', '25d55ad283aa400af464c76d713c07ad', '6281973034079');

-- --------------------------------------------------------

--
-- Table structure for table `detail_tugas`
--

CREATE TABLE `detail_tugas` (
  `id_detail_tugas` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `nip` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_tugas`
--

INSERT INTO `detail_tugas` (`id_detail_tugas`, `id_tugas`, `nip`) VALUES
(41, 3, '196401211990031002'),
(43, 3, '195805161993032002');

-- --------------------------------------------------------

--
-- Table structure for table `jenis`
--

CREATE TABLE `jenis` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis`
--

INSERT INTO `jenis` (`id_jenis`, `nama_jenis`) VALUES
(2, 'Alat Tulis'),
(3, 'Alat Makan'),
(4, 'Tas'),
(20, 'Kaos');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_disposisi`
--

CREATE TABLE `riwayat_disposisi` (
  `id_riwayat` int(11) NOT NULL,
  `suratmasuk_id` varchar(25) NOT NULL,
  `isi` varchar(255) NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `nip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_disposisi`
--

INSERT INTO `riwayat_disposisi` (`id_riwayat`, `suratmasuk_id`, `isi`, `catatan`, `user`, `nip`) VALUES
(23, '3', 'Minta Saran/Pendapat/Komentar', '-', '', '195805161993032002'),
(24, '3', 'Untuk Dibicarakan Khusus', 'Mohon ', '', '196401211990031002'),
(25, '0', 'Harap Mewakili Saya', '-', '', '196401211990031002'),
(28, '1', 'Harap Mewakili Saya', 'asas', '', '196401211990031002'),
(40, 'SM220310', 'Harap Penyelesaian Selanjutnya', '-', 'Dr. Nani Heryani', '196401211990031002'),
(41, 'SM220309', 'Untuk Dibicarakan Khusus', '-', 'Dr. Ir. A. Arivin Rivaie, M.Sc', '195805161993032002'),
(42, 'SM220308', 'Minta Saran/Pendapat/Komentar', '-', 'Dr. Ir. A. Arivin Rivaie, M.Sc', ''),
(43, 'SM220310', 'Harap Penyelesaian Selanjutnya', 'Baik', 'Dr. Ir. A. Arivin Rivaie, M.Sc', ''),
(44, 'SM220306', 'Minta Saran/Pendapat/Komentar', 'Segera', 'Dr. Ir. A. Arivin Rivaie, M.Sc', ''),
(45, 'SM220401', 'Untuk Dibicarakan Khusus', 'Segera dilaksanakan', 'Dr. Ir. A. Arivin Rivaie, M.Sc', ''),
(46, 'SM220401', 'Harap Penyelesaian Selanjutnya', 'Ya', 'Dr. Ir. A. Arivin Rivaie, M.Sc', ''),
(47, 'SM220402', 'Minta Saran/Pendapat/Komentar', 'yap', 'Dr. Ir. A. Arivin Rivaie, M.Sc', '');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_surat`
--

CREATE TABLE `riwayat_surat` (
  `id_riwayatsurat` int(11) NOT NULL,
  `suratmasuk_id` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `riwayat_surat`
--

INSERT INTO `riwayat_surat` (`id_riwayatsurat`, `suratmasuk_id`) VALUES
(1, 'SM22030304'),
(2, 'SM22030305'),
(3, 'SM220301'),
(4, 'SM220304'),
(5, 'SM220305'),
(6, 'SM220306'),
(7, 'SM220307'),
(8, 'SM220308'),
(9, 'SM220309'),
(10, 'SM220310'),
(11, 'SM220401'),
(12, 'SM220402');

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(11) NOT NULL,
  `nama_satuan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `nama_satuan`) VALUES
(1, 'Lusin'),
(2, 'Pcs'),
(3, 'Kodi'),
(4, 'Rim'),
(37, 'Dus');

-- --------------------------------------------------------

--
-- Table structure for table `sifat_surat`
--

CREATE TABLE `sifat_surat` (
  `id_sifatsurat` int(11) NOT NULL,
  `sifat_surat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sifat_surat`
--

INSERT INTO `sifat_surat` (`id_sifatsurat`, `sifat_surat`) VALUES
(1, 'Penting'),
(3, 'Rahasia'),
(4, 'Segera');

-- --------------------------------------------------------

--
-- Table structure for table `status_kepegawaian`
--

CREATE TABLE `status_kepegawaian` (
  `id_status_peg` int(11) NOT NULL,
  `status_kepegawaian` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_kepegawaian`
--

INSERT INTO `status_kepegawaian` (`id_status_peg`, `status_kepegawaian`) VALUES
(1, 'PNS'),
(3, 'PNS/TB'),
(4, 'CPNS'),
(5, 'PPNPN');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_suratmasuk` varchar(25) NOT NULL,
  `sifatsurat_id` int(11) NOT NULL,
  `kode` varchar(11) NOT NULL,
  `no_surat` int(11) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `asal_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `dokumen` varchar(255) DEFAULT NULL,
  `tanggal_input` date NOT NULL,
  `no_urut` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `surat_masuk`
--

INSERT INTO `surat_masuk` (`id_suratmasuk`, `sifatsurat_id`, `kode`, `no_surat`, `tanggal_surat`, `asal_surat`, `perihal`, `dokumen`, `tanggal_input`, `no_urut`, `status`) VALUES
('SM220301', 1, 'HM.141', 4, '2022-03-04', 'Balitklimat', '-', '', '2022-03-04', 4, 'Belum Disposisi'),
('SM22030301', 1, 'HM.140', 1, '2022-03-03', 'Kementan', 'Undangan', '', '2022-03-03', 2, ''),
('SM22030302', 1, 'HM.144', 5, '2022-03-03', 'Balitklimat', 'Undangan Zoom', '', '2022-03-03', 4, ''),
('SM22030303', 3, 'HM.144', 4, '2022-03-03', 'Balai', 'Undangan Diklat', '', '2022-03-03', 4, ''),
('SM22030304', 1, 'HM.141', 5, '2022-03-03', 'Balitklimat', '-', '', '2022-03-03', 2, ''),
('SM22030305', 1, 'HM.140', 4, '2022-03-03', 'Balitklimat', '-', '', '2022-03-03', 2, ''),
('SM220304', 3, 'HM.144', 6, '2022-03-04', 'Kementan', 'undangan expo', '', '2022-03-04', 6, 'Belum Disposisi'),
('SM220305', 3, 'HM.141', 7, '2022-03-05', 'Balai', 'undangan', '', '2022-03-05', 7, 'Belum Disposisi'),
('SM220306', 3, 'HM.141', 9, '2022-03-13', 'Balitklimat', 'baik', '', '2022-03-13', 9, ''),
('SM220308', 3, 'HM.144', 11, '2022-03-07', 'Balitklimat', '-', '', '2022-03-07', 11, ''),
('SM220310', 3, 'HM.142', 13, '2022-03-09', 'Kementan', '-', 'disposisi_surat_74.pdf', '2022-03-09', 13, ''),
('SM220401', 3, 'HM.19', 19, '2022-04-02', 'Pertanian', 'Undangan Zoom', 'disposisi_surat_134.pdf', '2022-04-02', 19, ''),
('SM220402', 3, 'HM.15', 15, '2022-04-02', 'Balitklimat', 'Undangan', '', '2022-04-02', 15, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `jenisbarang` (`jenis_id`),
  ADD KEY `satuan` (`satuan_id`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_barangkeluar`);

--
-- Indexes for table `barang_kembali`
--
ALTER TABLE `barang_kembali`
  ADD PRIMARY KEY (`id_barangkembali`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barangmasuk`),
  ADD KEY `barang` (`barang_id`);

--
-- Indexes for table `data_divisi`
--
ALTER TABLE `data_divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indexes for table `data_golongan`
--
ALTER TABLE `data_golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indexes for table `data_header_surat`
--
ALTER TABLE `data_header_surat`
  ADD PRIMARY KEY (`id_header_surat`);

--
-- Indexes for table `data_jabatan`
--
ALTER TABLE `data_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `data_jadwal_gaji_berkala`
--
ALTER TABLE `data_jadwal_gaji_berkala`
  ADD PRIMARY KEY (`kode_kgb`),
  ADD KEY `nip_pegawai_jadwal_gajiberkala` (`nip`);

--
-- Indexes for table `data_jadwal_naik_pangkat`
--
ALTER TABLE `data_jadwal_naik_pangkat`
  ADD PRIMARY KEY (`kode_kp`),
  ADD KEY `id_golongan_berikutnya_jadwal_pangkat` (`id_golongan_berikutnya`),
  ADD KEY `id_pangkat_berikutnya_jadwalkp` (`id_pangkat_berikutnya`),
  ADD KEY `nip_peg_jadwalkp` (`nip`);

--
-- Indexes for table `data_notifikasi`
--
ALTER TABLE `data_notifikasi`
  ADD PRIMARY KEY (`id_notifikasi`),
  ADD KEY `nip_notif_peg` (`nip`);

--
-- Indexes for table `data_pangkat`
--
ALTER TABLE `data_pangkat`
  ADD PRIMARY KEY (`id_pangkat`);

--
-- Indexes for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `id_gol_peg` (`id_golongan`),
  ADD KEY `id_status_datapeg` (`id_status_peg`),
  ADD KEY `id_pangkat_peg` (`id_pangkat`),
  ADD KEY `id_jabatan_peg` (`id_jabatan`),
  ADD KEY `id_divisi_peg` (`id_divisi`);

--
-- Indexes for table `data_role`
--
ALTER TABLE `data_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `data_tugas`
--
ALTER TABLE `data_tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `detail_disposisi`
--
ALTER TABLE `detail_disposisi`
  ADD PRIMARY KEY (`id_kepada`);

--
-- Indexes for table `detail_dokumen`
--
ALTER TABLE `detail_dokumen`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `detail_keluar`
--
ALTER TABLE `detail_keluar`
  ADD PRIMARY KEY (`id_detailkeluar`);

--
-- Indexes for table `detail_role`
--
ALTER TABLE `detail_role`
  ADD PRIMARY KEY (`id_detail_role`),
  ADD KEY `id_role_detail` (`id_role`);

--
-- Indexes for table `detail_tugas`
--
ALTER TABLE `detail_tugas`
  ADD PRIMARY KEY (`id_detail_tugas`),
  ADD KEY `detail_nip_tugas` (`nip`),
  ADD KEY `detail_id_tugas` (`id_tugas`);

--
-- Indexes for table `jenis`
--
ALTER TABLE `jenis`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `riwayat_disposisi`
--
ALTER TABLE `riwayat_disposisi`
  ADD PRIMARY KEY (`id_riwayat`);

--
-- Indexes for table `riwayat_surat`
--
ALTER TABLE `riwayat_surat`
  ADD PRIMARY KEY (`id_riwayatsurat`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sifat_surat`
--
ALTER TABLE `sifat_surat`
  ADD PRIMARY KEY (`id_sifatsurat`);

--
-- Indexes for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  ADD PRIMARY KEY (`id_status_peg`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_suratmasuk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `data_divisi`
--
ALTER TABLE `data_divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `data_golongan`
--
ALTER TABLE `data_golongan`
  MODIFY `id_golongan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `data_jabatan`
--
ALTER TABLE `data_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_notifikasi`
--
ALTER TABLE `data_notifikasi`
  MODIFY `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `data_pangkat`
--
ALTER TABLE `data_pangkat`
  MODIFY `id_pangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `data_role`
--
ALTER TABLE `data_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `data_tugas`
--
ALTER TABLE `data_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `detail_disposisi`
--
ALTER TABLE `detail_disposisi`
  MODIFY `id_kepada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `detail_dokumen`
--
ALTER TABLE `detail_dokumen`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- AUTO_INCREMENT for table `detail_keluar`
--
ALTER TABLE `detail_keluar`
  MODIFY `id_detailkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `detail_role`
--
ALTER TABLE `detail_role`
  MODIFY `id_detail_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `detail_tugas`
--
ALTER TABLE `detail_tugas`
  MODIFY `id_detail_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `riwayat_disposisi`
--
ALTER TABLE `riwayat_disposisi`
  MODIFY `id_riwayat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `riwayat_surat`
--
ALTER TABLE `riwayat_surat`
  MODIFY `id_riwayatsurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sifat_surat`
--
ALTER TABLE `sifat_surat`
  MODIFY `id_sifatsurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  MODIFY `id_status_peg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `jenisbarang` FOREIGN KEY (`jenis_id`) REFERENCES `jenis` (`id_jenis`),
  ADD CONSTRAINT `satuan` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`);

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `data_jadwal_gaji_berkala`
--
ALTER TABLE `data_jadwal_gaji_berkala`
  ADD CONSTRAINT `nip_pegawai_jadwal_gajiberkala` FOREIGN KEY (`nip`) REFERENCES `data_pegawai_2` (`nip`);

--
-- Constraints for table `data_jadwal_naik_pangkat`
--
ALTER TABLE `data_jadwal_naik_pangkat`
  ADD CONSTRAINT `id_golongan_berikutnya_jadwal_pangkat` FOREIGN KEY (`id_golongan_berikutnya`) REFERENCES `data_golongan` (`id_golongan`),
  ADD CONSTRAINT `id_pangkat_berikutnya_jadwalkp` FOREIGN KEY (`id_pangkat_berikutnya`) REFERENCES `data_pangkat` (`id_pangkat`),
  ADD CONSTRAINT `nip_peg_jadwalkp` FOREIGN KEY (`nip`) REFERENCES `data_pegawai_2` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
