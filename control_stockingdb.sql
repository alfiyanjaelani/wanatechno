-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Apr 2019 pada 12.08
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
('3716300', 'H-KVBV RA IN (MATERIAL) ', 'D001', 'pcs', 7070000);

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
-- Struktur dari tabel `mst_stock_alert`
--

CREATE TABLE `mst_stock_alert` (
  `kode_stock_alert` varchar(255) NOT NULL,
  `nama_stock_alert` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mst_stock_alert`
--

INSERT INTO `mst_stock_alert` (`kode_stock_alert`, `nama_stock_alert`) VALUES
('KSA01', 'Urgent'),
('MSA02', 'NORMAL');

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
-- Struktur dari tabel `trx_barang_keluar`
--

CREATE TABLE `trx_barang_keluar` (
  `no_document` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `petugas` varchar(255) NOT NULL,
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

INSERT INTO `trx_barang_keluar` (`no_document`, `tanggal`, `petugas`, `kode_supplier`, `part_no`, `lot_no`, `qty`, `kode_sliptype`, `kode_destination`) VALUES
('W00087', '2019-04-24', '', 'SP01', '3716300', '0', 1000, 'ST03', 'D01'),
('W00087', '2019-04-24', '', 'SP01', '3716300', '0', 400, 'ST01', 'D01'),
('W00087', '2019-04-24', 'jaelani', 'SP01', '3716300', '0', 9000, 'ST01', 'D01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_barang_masuk`
--

CREATE TABLE `trx_barang_masuk` (
  `no_document` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `petugas` varchar(255) NOT NULL,
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

INSERT INTO `trx_barang_masuk` (`no_document`, `tanggal`, `petugas`, `kode_supplier`, `part_no`, `kode_destination`, `qty`, `kode_sliptype`, `lot_no`) VALUES
('IB19-005K/B181109-2', '2019-04-24', '', 'SP01', '3716300', 'D01', 200000, 'ST03', '0'),
('TMCL-190208/B181106-1', '2019-04-24', '', 'SP01', '3716300', 'D01', 3880400, 'ST03', '0'),
('B181203-1', '2019-04-24', 'jaelani', 'SP01', '3716300', 'D01', 1000000, 'ST03', '0'),
('B181203-1', '2019-04-23', 'jaelani', 'SP01', '3716300', 'D01', 2000000, 'ST03', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_detail_keluar`
--

CREATE TABLE `trx_detail_keluar` (
  `part_no` varchar(255) NOT NULL,
  `kode_destination` varchar(255) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trx_detail_keluar`
--

INSERT INTO `trx_detail_keluar` (`part_no`, `kode_destination`, `total`) VALUES
('3716300', 'D01', 1000),
('3716300', 'D01', 400),
('3716300', 'D01', 9000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `trx_detail_masuk`
--

CREATE TABLE `trx_detail_masuk` (
  `part_no` int(11) NOT NULL,
  `kode_destination` varchar(255) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `trx_detail_masuk`
--

INSERT INTO `trx_detail_masuk` (`part_no`, `kode_destination`, `total`) VALUES
(3716300, 'D01', 200000),
(3716300, 'D01', 3880400),
(3716300, 'D01', 1000000),
(3716300, 'D01', 2000000);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `viewsbarang`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `viewsbarang` (
`part_no` varchar(255)
,`part_name` varchar(255)
,`Other` int(11)
,`MC` int(11)
,`HT` int(11)
,`Finishing` int(11)
,`Assy` int(11)
,`QC` int(11)
,`CN` int(11)
,`Scrap` int(11)
,`Stock` int(11)
,`Presentase_Stock` int(11)
,`Stock_Alert` varchar(6)
);

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

-- --------------------------------------------------------

--
-- Struktur untuk view `viewsbarang`
--
DROP TABLE IF EXISTS `viewsbarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewsbarang`  AS  select `tb`.`part_no` AS `part_no`,`mb`.`part_name` AS `part_name`,`tdk`.`total` AS `Other`,`tdk`.`total` AS `MC`,`tdk`.`total` AS `HT`,`tdk`.`total` AS `Finishing`,`tdk`.`total` AS `Assy`,`tdk`.`total` AS `QC`,`tdk`.`total` AS `CN`,`tdk`.`total` AS `Scrap`,`mb`.`stock` AS `Stock`,`tb`.`qty` AS `Presentase_Stock`,'urgent' AS `Stock_Alert` from (((`trx_detail_keluar` `tdk` left join `trx_barang_keluar` `tb` on((`tdk`.`part_no` = `tb`.`part_no`))) left join `mst_barang` `mb` on((`tdk`.`part_no` = `mb`.`part_no`))) left join `mst_divisi` `md` on((`mb`.`kode_divisi` = `md`.`kode_divisi`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
