-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Apr 2019 pada 10.30
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `control_stockingdb`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `barang_keluar_views`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `barang_keluar_views` (
`no_document` varchar(255)
,`nama_sliptype` varchar(255)
,`tanggal` date
,`part_name` varchar(255)
,`nama_supplier` varchar(255)
,`lot_no` varchar(255)
,`qty` int(11)
,`nama_destination` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `barang_masuk_views`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `barang_masuk_views` (
`no_document` varchar(255)
,`nama_sliptype` varchar(255)
,`tanggal` date
,`part_name` varchar(255)
,`nama_supplier` varchar(255)
,`lot_no` varchar(255)
,`qty` int(11)
,`nama_destination` varchar(255)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_barang`
--

CREATE TABLE `mst_barang` (
  `part_no` varchar(255) NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `kode_divisi` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_barang`
--

INSERT INTO `mst_barang` (`part_no`, `part_name`, `kode_divisi`, `satuan`, `stock`) VALUES
('3716300', 'H-KVBV RA IN (MATERIAL) ', 'D001', 'pcs', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_destination`
--

CREATE TABLE `mst_destination` (
  `kode_destination` varchar(255) NOT NULL,
  `nama_destination` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_destination`
--

INSERT INTO `mst_destination` (`kode_destination`, `nama_destination`) VALUES
('D01', 'Material Warehouse ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_divisi`
--

CREATE TABLE `mst_divisi` (
  `kode_divisi` varchar(255) NOT NULL,
  `nama_divisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_divisi`
--

INSERT INTO `mst_divisi` (`kode_divisi`, `nama_divisi`) VALUES
('D001', 'Material Warehouse'),
('D002', 'Machining');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_kategori`
--

CREATE TABLE `mst_kategori` (
  `kode_kategori` varchar(255) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_kategori`
--

INSERT INTO `mst_kategori` (`kode_kategori`, `nama_kategori`) VALUES
('K001', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_pelanggan`
--

CREATE TABLE `mst_pelanggan` (
  `kode_pelanggan` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `alamat_pelanggan` varchar(255) NOT NULL,
  `no_tlp` varchar(50) NOT NULL,
  `status_pelanggan` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_pelanggan`
--

INSERT INTO `mst_pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `no_tlp`, `status_pelanggan`) VALUES
('', '', '', '', 0),
('', '', '', '', 0),
('', '', '', '', 0),
('PL01', '2', '2', '1087 tes', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_petugas`
--

CREATE TABLE `mst_petugas` (
  `kode_ptgs` varchar(250) NOT NULL,
  `nama_ptgs` varchar(255) NOT NULL,
  `password_ptgs` varchar(50) NOT NULL,
  `status_ptgs` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_petugas`
--

INSERT INTO `mst_petugas` (`kode_ptgs`, `nama_ptgs`, `password_ptgs`, `status_ptgs`) VALUES
('', '', '', 0),
('', 'alfiyan', '123', 1),
('', 'jaelani', '123', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_sliptype`
--

CREATE TABLE `mst_sliptype` (
  `kode_sliptype` varchar(255) NOT NULL,
  `nama_sliptype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_sliptype`
--

INSERT INTO `mst_sliptype` (`kode_sliptype`, `nama_sliptype`) VALUES
('ST01', 'Pengembalian4'),
('ST03', 'Pengambilan dan Pengiriman');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mst_supplier`
--

CREATE TABLE `mst_supplier` (
  `kode_supplier` varchar(50) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL,
  `alamat_supplier` varchar(255) NOT NULL,
  `no_tlp_supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_supplier`
--

INSERT INTO `mst_supplier` (`kode_supplier`, `nama_supplier`, `alamat_supplier`, `no_tlp_supplier`) VALUES
('SP01', 'NMC (Nissin Manufacturing Co.,LTD)', '', ''),
('SP02', '(Nissin Manufacturing Thailand)', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_opname`
--

CREATE TABLE `stock_opname` (
  `no_transaksi` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_ptgs` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jumlah_awal` int(11) NOT NULL,
  `jumlah_akhir` int(11) NOT NULL,
  `selisih` int(11) NOT NULL,
  `keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_barang_keluar`
--

CREATE TABLE `trx_barang_keluar` (
  `no_document` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_ptgs` varchar(255) NOT NULL,
  `kode_supplier` varchar(255) NOT NULL,
  `part_no` varchar(255) NOT NULL,
  `lot_no` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `kode_sliptype` varchar(255) NOT NULL,
  `kode_destination` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trx_barang_keluar`
--

INSERT INTO `trx_barang_keluar` (`no_document`, `tanggal`, `kode_ptgs`, `kode_supplier`, `part_no`, `lot_no`, `qty`, `kode_sliptype`, `kode_destination`) VALUES
('tes1', '2019-04-29', '', 'SP01', '3716300', '1', 2, 'ST01', 'D01'),
('tes10', '2019-04-22', '', 'SP01', '3716300', '1000', 1000, 'ST01', 'D01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_barang_masuk`
--

CREATE TABLE `trx_barang_masuk` (
  `no_document` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `kode_ptgs` varchar(255) NOT NULL,
  `kode_supplier` varchar(255) NOT NULL,
  `part_no` varchar(255) NOT NULL,
  `kode_destination` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `kode_sliptype` varchar(255) NOT NULL,
  `lot_no` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trx_barang_masuk`
--

INSERT INTO `trx_barang_masuk` (`no_document`, `tanggal`, `kode_ptgs`, `kode_supplier`, `part_no`, `kode_destination`, `qty`, `kode_sliptype`, `lot_no`) VALUES
('tes01', '2019-04-15', '', 'SP01', '3716300', 'D01', 1000, 'ST01', '1000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_detail_keluar`
--

CREATE TABLE `trx_detail_keluar` (
  `part_no` varchar(255) NOT NULL,
  `Part Name` varchar(255) NOT NULL,
  `material_wherehouse` int(11) NOT NULL,
  `machining` int(11) NOT NULL,
  `heat_treatment_barrel` int(11) NOT NULL,
  `finishing` int(11) NOT NULL,
  `assembly` int(11) NOT NULL,
  `finishedgood_warehouse` int(11) NOT NULL,
  `scrap` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `total_all` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trx_detail_keluar`
--

INSERT INTO `trx_detail_keluar` (`part_no`, `Part Name`, `material_wherehouse`, `machining`, `heat_treatment_barrel`, `finishing`, `assembly`, `finishedgood_warehouse`, `scrap`, `total`, `total_all`) VALUES
('3716300', 'H-KVBV RA IN (MATERIAL)', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3716300', 'H-KVBV RA IN (MATERIAL)', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2186231', 'HO-KRM-N31-RA (MATERIAL)', 13, 0, 0, 0, 0, 0, 0, 13, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_detail_masuk`
--

CREATE TABLE `trx_detail_masuk` (
  `part_no` int(11) NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `material_wherehouse` int(11) NOT NULL,
  `machining` int(11) NOT NULL,
  `heat_treatment_barrel` int(11) NOT NULL,
  `finishing` int(11) NOT NULL,
  `assembly` int(11) NOT NULL,
  `finishedgood_warehouse` int(11) NOT NULL,
  `scrap` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `total_all` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trx_detail_masuk`
--

INSERT INTO `trx_detail_masuk` (`part_no`, `part_name`, `material_wherehouse`, `machining`, `heat_treatment_barrel`, `finishing`, `assembly`, `finishedgood_warehouse`, `scrap`, `total`, `total_all`) VALUES
(2186231, 'HO-KRM-N31-RA (MATERIAL)', 13, 0, 0, 0, 0, 0, 0, 13, 13),
(2908500, 'YH-BK6 RA 3', 22, 0, 0, 0, 0, 0, 0, 22, 22);

-- --------------------------------------------------------

--
-- Struktur untuk view `barang_keluar_views`
--
DROP TABLE IF EXISTS `barang_keluar_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_keluar_views`  AS  select `tbk`.`no_document` AS `no_document`,`ms`.`nama_sliptype` AS `nama_sliptype`,`tbk`.`tanggal` AS `tanggal`,`mb`.`part_name` AS `part_name`,`msup`.`nama_supplier` AS `nama_supplier`,`tbk`.`lot_no` AS `lot_no`,`tbk`.`qty` AS `qty`,`md`.`nama_destination` AS `nama_destination` from ((((`trx_barang_keluar` `tbk` left join `mst_barang` `mb` on((`mb`.`part_no` = `tbk`.`part_no`))) left join `mst_sliptype` `ms` on((`ms`.`kode_sliptype` = `tbk`.`kode_sliptype`))) left join `mst_supplier` `msup` on((`msup`.`kode_supplier` = `tbk`.`kode_supplier`))) left join `mst_destination` `md` on((`md`.`kode_destination` = `tbk`.`kode_destination`))) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `barang_masuk_views`
--
DROP TABLE IF EXISTS `barang_masuk_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_masuk_views`  AS  select `tbm`.`no_document` AS `no_document`,`ms`.`nama_sliptype` AS `nama_sliptype`,`tbm`.`tanggal` AS `tanggal`,`mb`.`part_name` AS `part_name`,`msup`.`nama_supplier` AS `nama_supplier`,`tbm`.`lot_no` AS `lot_no`,`tbm`.`qty` AS `qty`,`md`.`nama_destination` AS `nama_destination` from ((((`trx_barang_masuk` `tbm` left join `mst_barang` `mb` on((`mb`.`part_no` = `tbm`.`part_no`))) left join `mst_sliptype` `ms` on((`ms`.`kode_sliptype` = `tbm`.`kode_sliptype`))) left join `mst_supplier` `msup` on((`msup`.`kode_supplier` = `tbm`.`kode_supplier`))) left join `mst_destination` `md` on((`md`.`kode_destination` = `tbm`.`kode_destination`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
