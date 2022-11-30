-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2022 at 05:49 AM
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
(7, 'Pulpen Tali', 2, 72, 4),
(8, 'Info Agroklimat dan Hidrologi', 2, 0, 1),
(10, 'Tas Blacu', 4, 15, 2),
(11, 'Buku Tahunan', 2, 64, 2),
(12, 'Buletin Agroklimat dan Hidrologi', 2, 13, 1),
(13, 'Tumblr', 3, 1, 4),
(17, 'Juknis', 2, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_barangkeluar` varchar(25) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah_keluar` int(25) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `dokumen` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `beritaacara` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_barangkeluar`, `tanggal_keluar`, `barang_id`, `jumlah_keluar`, `keterangan`, `foto`, `dokumen`, `status`, `beritaacara`) VALUES
('BK2203031', '2022-03-22', 0, 0, '', NULL, NULL, '', NULL),
('BK2203032', '2022-03-26', 0, 0, '', NULL, NULL, '', NULL),
('BK2203034', '2022-03-23', 0, 0, '', NULL, NULL, '', 'disposisi_surat_1001.pdf'),
('BK2203035', '2022-03-22', 0, 0, 'Untuk kegiatan expo', NULL, NULL, '', NULL),
('BK2203037', '2022-03-24', 0, 0, 'Barang Sesuai', NULL, NULL, '', NULL),
('BK2204001', '2022-04-03', 0, 0, 'Bismillah', NULL, NULL, '', NULL);

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `update_stok_keluar` BEFORE INSERT ON `barang_keluar` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` - NEW.jumlah_keluar WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_keluar_edit` AFTER UPDATE ON `barang_keluar` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` - NEW.jumlah_keluar + OLD.jumlah_keluar WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_keluar_hapus` AFTER DELETE ON `barang_keluar` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` + OLD.jumlah_keluar WHERE `barang`.`id_barang` = OLD.barang_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_kembali`
--

CREATE TABLE `barang_kembali` (
  `id_barangkembali` varchar(25) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `jumlah_kembali` int(25) NOT NULL,
  `keterangankembali` varchar(255) NOT NULL,
  `barang_idkeluar` varchar(25) NOT NULL,
  `fotokembali` varchar(255) DEFAULT NULL,
  `dokumenkembali` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_kembali`
--

INSERT INTO `barang_kembali` (`id_barangkembali`, `tanggal_kembali`, `jumlah_kembali`, `keterangankembali`, `barang_idkeluar`, `fotokembali`, `dokumenkembali`) VALUES
('60', '2022-03-15', 1, 'gf', '15', 'default.png', ''),
('62', '2022-04-01', 1, 'gf', '17', 'default.png', ''),
('63', '2022-03-26', 1, 'gfh', '14', 'default.png', ''),
('65', '2022-03-03', 2, 'Barang Sesuai', '12', 'default.png', ''),
('67', '2022-03-12', 1, 'Barang Sesuai', '13', 'default.png', ''),
('70', '2022-03-12', 2, 'Barang Baik', '17', 'fococlipping-20220105-530571.png', ''),
('73', '2022-03-02', 1, '-', '16', 'default.png', ''),
('74', '2022-03-04', 1, '-', '19', 'default.png', ''),
('75', '2022-03-06', 1, '-', '16', 'default.png', ''),
('76', '2022-03-07', 1, 'Barang Sesuai', '1', 'default.png', ''),
('77', '2022-03-09', 1, 'Barang Baik', '21', 'default.png', NULL),
('BK2203034', '2022-03-21', 1, 'ok', 'BK2203034', NULL, NULL),
('BKM2203001', '2022-03-08', 1, '-', '21', 'default.png', NULL),
('BKM2203004', '2022-03-11', 1, '', 'BK2203006', 'default.png', NULL),
('BKM2203005', '2022-03-12', 1, '-', 'BK2203009', 'default.png', NULL),
('BKM2203006', '2022-03-26', 5, '-', 'BK2203012', 'default.png', NULL),
('BKM2203007', '2022-03-20', 1, '-', '31', 'default.png', NULL),
('BKM2203008', '2022-03-19', 2, '', '28', 'default.png', NULL),
('BKM2203012', '2022-03-23', 1, '', '34', 'default.png', NULL),
('BKM2203013', '2022-03-30', 2, 'Barang Baik', '33', 'default.png', NULL),
('BKM2203014', '2022-03-31', 1, '-', '35', 'default.png', NULL),
('BKM2203015', '2022-03-26', 3, 'Bismillah', '33', 'default.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barangmasuk` varchar(255) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `dokumen` varchar(255) DEFAULT NULL,
  `keterangan` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_barangmasuk`, `tanggal_masuk`, `barang_id`, `jumlah_masuk`, `foto`, `dokumen`, `keterangan`) VALUES
('36', '2022-02-19', 7, 54, '', '', '-'),
('37', '2022-02-22', 8, 2, '', '', '-'),
('38', '2022-02-22', 10, 8, 'WhatsApp Image 2021-12-11 at 09.15.08 (1).jpeg', 'file_form_master_form__FRM012_docx.docx', '-'),
('39', '2022-02-22', 11, 3, 'shopping-bag.png', '', '-'),
('41', '2022-02-26', 12, 2, 'icon3.png', 'file_form_master_form__FRM012_docx_(1)1.docx', '-'),
('42', '2022-03-01', 17, 7, 'box.png', '', 'Barang Sesuai'),
('BM2203001', '2022-03-10', 10, 10, 'bd8e8bc7c930275605186264b57ebd54.jpg', NULL, 'Barang Baik'),
('BM2203002', '2022-03-26', 8, 8, 'icon4.png', NULL, 'Barang Sesuai'),
('BM2203003', '2022-03-10', 13, 2, 'default.png', NULL, '');

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `update_stok_masuk` BEFORE INSERT ON `barang_masuk` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` + NEW.jumlah_masuk WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_masuk_edit` AFTER UPDATE ON `barang_masuk` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` + NEW.jumlah_masuk - OLD.jumlah_masuk WHERE `barang`.`id_barang` = NEW.barang_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_stok_masuk_hapus` AFTER DELETE ON `barang_masuk` FOR EACH ROW UPDATE `barang` SET `barang`.`stok` = `barang`.`stok` - OLD.jumlah_masuk WHERE `barang`.`id_barang` = OLD.barang_id
$$
DELIMITER ;

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
  `foto` varchar(255) NOT NULL,
  `id_golongan` int(11) DEFAULT NULL,
  `id_status_peg` int(11) NOT NULL,
  `id_pangkat` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_divisi` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `no_whatsapp` varchar(20) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_pegawai`
--

INSERT INTO `data_pegawai` (`nip`, `nama_pegawai`, `foto`, `id_golongan`, `id_status_peg`, `id_pangkat`, `id_jabatan`, `id_divisi`, `nik`, `email`, `password`, `no_whatsapp`, `role`) VALUES
('195805161993032002', 'Dr. Nani Heryani', 'fix_kolokium211.jpg', 17, 1, 2, 2, 2, '3271055605580006', 'lugasmunayasika@gmail.com', '123', '6281235062988  ', 'User'),
('196401211990031002', 'Dr. Ir. A. Arivin Rivaie, M.Sc', 'images6.jpg', 17, 1, 10, 1, 2, '3271062101640004', 'lugasmunaya@gmail.com', '12345678', '6281235062988  ', 'Admin ASN'),
('196411291990032002', 'Dr. Ir. Popi Redjekiningrum D M', 'DSCF5201-removebg-preview111.png', 17, 1, 2, 2, 2, '3201296911640001', 'adminbogorfood@gmail.com', '123', '6281235062988  ', 'User'),
('196901241998032001', 'Dr. Elza Surmaini', 'default.png', 16, 1, 13, 2, 2, '3271066401690004', 'admins@gmail.com', '123', '6281973034079 ', 'Admin Inventaris');

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
(49, 'BM2203005', '2547-5647-1-SM.pdf'),
(50, 'BM2203005', 'SKRIPSI_BAB_III_.pdf'),
(51, 'BM2203005', '10__BAB_II_-_SBCK_terbaru.pdf'),
(52, 'BM2203005', 'BAB_21.pdf'),
(53, 'BM2203005', 'Manajemen_Agribisnis_5-1.pdf'),
(54, 'BM2203005', 'kwu-tpb-modul5.pdf'),
(55, '43', 'Isi_Artikel_772230091805.pdf'),
(62, 'BK2203002', 'IMG-20190428-WA0023.jpg'),
(63, 'BK2203002', 'line_48299435944985.jpg'),
(64, 'BK2203001', 'Screenshot_(1).png'),
(65, 'BK2203001', 'Screenshot_(2).png'),
(66, 'BK2203003', 'Screenshot_(7).png'),
(67, 'BK2203003', 'Screenshot_(8).png'),
(68, 'BK2203003', 'Screenshot_(11).png'),
(69, 'BK2203003', 'Screenshot_(12).png'),
(70, 'BK2203004', 'Screenshot_(16).png'),
(71, 'BK2203004', 'Screenshot_(19).png'),
(72, 'BK2203004', 'Screenshot_(23).png'),
(73, 'BK2203004', 'Screenshot_(24).png'),
(76, 'BK2203005', 'Screenshot_(44).png'),
(77, 'BK2203005', 'Screenshot_(45).png'),
(93, 'BK2203008', 'laporan_transaksi_barang_masuk_3.pdf'),
(94, 'BK2203008', 'laporan_transaksi_barang_masuk_2.pdf'),
(106, 'BK2203009', 'laporan_transaksi_barang_keluar3.pdf'),
(179, 'BK2203010', 'disposisi_surat_80.pdf'),
(186, 'BK2203011', 'disposisi_surat_85.pdf'),
(187, 'BK2203011', 'disposisi_surat_84.pdf'),
(191, 'BKM2203005', 'disposisi_surat_65.pdf'),
(194, 'BM2203002', 'laporan_transaksi_barang_keluar.pdf'),
(195, 'BM2203002', 'laporan_transaksi_barang_masuk_10.pdf'),
(196, 'BM2203003', 'disposisi_surat_82.pdf'),
(197, 'BK2203012', 'laporan_transaksi_barang_masuk_11.pdf'),
(198, 'BK2203012', 'disposisi_surat_83.pdf'),
(199, 'BKM2203006', 'disposisi_surat_81.pdf'),
(200, 'BKM2203007', 'laporan_transaksi_barang_kembali_5.pdf'),
(201, 'BKM2203007', 'laporan_transaksi_barang_masuk_11.pdf'),
(202, 'BKM2203018', 'laporan_transaksi_barang_keluar_9.pdf'),
(203, 'BKM2203018', 'laporan_transaksi_barang_keluar_8.pdf'),
(213, 'BK2203034', 'berita_acara_barang_diseminasi_4.pdf'),
(214, 'BK2203034', 'berita_acara_barang_diseminasi_31.pdf'),
(215, 'BKM2203019', 'berita_acara_barang_diseminasi_18.pdf'),
(216, 'BKM2203019', 'laporan_transaksi_barang_keluar_91.pdf'),
(217, 'BKM2203019', 'laporan_transaksi_barang_keluar_92.pdf'),
(218, 'BKM2203019', 'laporan_transaksi_barang_keluar_81.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `detail_keluar`
--

CREATE TABLE `detail_keluar` (
  `id_detailkeluar` int(11) NOT NULL,
  `id_transaksi` varchar(25) NOT NULL,
  `barang_id` varchar(50) NOT NULL,
  `jumlah_keluar` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_keluar`
--

INSERT INTO `detail_keluar` (`id_detailkeluar`, `id_transaksi`, `barang_id`, `jumlah_keluar`) VALUES
(1, '', 'BK2203013', 5678),
(2, '', 'BK2203013', 3464),
(3, '', 'BK2203013', 2131),
(4, '', 'BK2203013', 12123),
(5, '', 'BK2203013', 713),
(6, '', 'BK2203013', 2131),
(7, '', 'BK2203013', 1231),
(8, '', 'BK2203014', 0),
(9, 'BK2203018', '8', 1),
(10, 'BK2203018', '13', 3),
(11, 'BK2203020', '11', 2),
(12, 'BK2203020', '14', 1),
(13, 'BK2203022', '10', 3),
(14, 'BK2203022', '7', 1),
(15, 'BK2203023', '7', 3),
(16, 'BK2203023', '8', 1),
(17, 'BK2203025', '11', 8),
(18, 'BK2203025', '7', 1),
(19, 'BK2203026', '11', 8),
(20, 'BK2203027', '11', 8),
(21, 'BK2203028', '11', 5),
(22, 'BK2203028', '7', 1),
(23, 'BK2203030', '7', 8),
(24, 'BK2203030', '12', 1),
(25, 'BK2203030', '11', 2),
(26, 'BK2203030', '13', 1),
(27, 'BK2203031', '7', 1),
(28, 'BK2203032', '11', 3),
(31, 'BK2203032', '12', 1),
(32, 'BK2203032', '14', 2),
(33, 'BK2203034', '7', 5),
(34, 'BK2203034', '10', 1),
(35, 'BK2203034', '11', 2),
(36, 'BK2203035', '7', 5),
(37, 'BK2203035', '10', 5),
(38, 'BK2203037', '7', 5),
(39, 'BK2203037', '11', 2),
(40, 'BK2204001', '7', 1),
(41, 'BK2204001', '11', 2);

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
(8, 'Cenderamata'),
(12, '');

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
(1, 'Lembar'),
(2, 'Pcs'),
(4, 'Unit'),
(5, 'Lusin');

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
  ADD PRIMARY KEY (`id_barang`);

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
  ADD PRIMARY KEY (`id_barangmasuk`);

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
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `detail_keluar`
--
ALTER TABLE `detail_keluar`
  MODIFY `id_detailkeluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `detail_tugas`
--
ALTER TABLE `detail_tugas`
  MODIFY `id_detail_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jenis`
--
ALTER TABLE `jenis`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sifat_surat`
--
ALTER TABLE `sifat_surat`
  MODIFY `id_sifatsurat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `status_kepegawaian`
--
ALTER TABLE `status_kepegawaian`
  MODIFY `id_status_peg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_jadwal_gaji_berkala`
--
ALTER TABLE `data_jadwal_gaji_berkala`
  ADD CONSTRAINT `nip_pegawai_jadwal_gajiberkala` FOREIGN KEY (`nip`) REFERENCES `data_pegawai` (`nip`);

--
-- Constraints for table `data_jadwal_naik_pangkat`
--
ALTER TABLE `data_jadwal_naik_pangkat`
  ADD CONSTRAINT `id_golongan_berikutnya_jadwal_pangkat` FOREIGN KEY (`id_golongan_berikutnya`) REFERENCES `data_golongan` (`id_golongan`),
  ADD CONSTRAINT `id_pangkat_berikutnya_jadwalkp` FOREIGN KEY (`id_pangkat_berikutnya`) REFERENCES `data_pangkat` (`id_pangkat`),
  ADD CONSTRAINT `nip_peg_jadwalkp` FOREIGN KEY (`nip`) REFERENCES `data_pegawai` (`nip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
