-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2019 at 01:08 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `control_stockingdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_barang`
--

CREATE TABLE IF NOT EXISTS `mst_barang` (
  `part_no` varchar(255) NOT NULL,
  `part_name` varchar(255) NOT NULL,
  `kode_divisi` varchar(255) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_barang`
--

INSERT INTO `mst_barang` (`part_no`, `part_name`, `kode_divisi`, `satuan`, `stock`) VALUES
('3716300', 'H-KVBV RA IN (MATERIAL)', 'D001', 'pcs', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mst_destination`
--

CREATE TABLE IF NOT EXISTS `mst_destination` (
  `kode_destination` varchar(255) NOT NULL,
  `nama_destination` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_destination`
--

INSERT INTO `mst_destination` (`kode_destination`, `nama_destination`) VALUES
('D01', 'Material Warehouse');

-- --------------------------------------------------------

--
-- Table structure for table `mst_divisi`
--

CREATE TABLE IF NOT EXISTS `mst_divisi` (
  `kode_divisi` varchar(255) NOT NULL,
  `nama_divisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_divisi`
--

INSERT INTO `mst_divisi` (`kode_divisi`, `nama_divisi`) VALUES
('D001', 'Material Warehouse'),
('D002', 'Machining');

-- --------------------------------------------------------

--
-- Table structure for table `mst_kategori`
--

CREATE TABLE IF NOT EXISTS `mst_kategori` (
  `kode_kategori` varchar(255) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_kategori`
--

INSERT INTO `mst_kategori` (`kode_kategori`, `nama_kategori`) VALUES
('K001', '2');

-- --------------------------------------------------------

--
-- Table structure for table `mst_pelanggan`
--

CREATE TABLE IF NOT EXISTS `mst_pelanggan` (
  `kode_pelanggan` varchar(255) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `alamat_pelanggan` varchar(255) NOT NULL,
  `no_tlp` varchar(50) NOT NULL,
  `status_pelanggan` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_pelanggan`
--

INSERT INTO `mst_pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `alamat_pelanggan`, `no_tlp`, `status_pelanggan`) VALUES
('', '', '', '', 0),
('', '', '', '', 0),
('', '', '', '', 0),
('PL01', '2', '2', '1087 tes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mst_petugas`
--

CREATE TABLE IF NOT EXISTS `mst_petugas` (
  `kode_ptgs` varchar(250) NOT NULL,
  `nama_ptgs` varchar(255) NOT NULL,
  `password_ptgs` varchar(50) NOT NULL,
  `status_ptgs` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_petugas`
--

INSERT INTO `mst_petugas` (`kode_ptgs`, `nama_ptgs`, `password_ptgs`, `status_ptgs`) VALUES
('', '', '', 0),
('', 'alfiyan', '123', 1),
('', 'jaelani', '123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_sliptype`
--

CREATE TABLE IF NOT EXISTS `mst_sliptype` (
  `kode_sliptype` varchar(255) NOT NULL,
  `nama_sliptype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_sliptype`
--

INSERT INTO `mst_sliptype` (`kode_sliptype`, `nama_sliptype`) VALUES
('ST01', 'Pengembalian2'),
('ST03', 'Pengambilan dan Pengiriman');

-- --------------------------------------------------------

--
-- Table structure for table `mst_supplier`
--

CREATE TABLE IF NOT EXISTS `mst_supplier` (
  `kode_supplier` varchar(50) NOT NULL,
  `nama_supplier` varchar(255) NOT NULL,
  `alamat_supplier` varchar(255) NOT NULL,
  `no_tlp_supplier` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mst_supplier`
--

INSERT INTO `mst_supplier` (`kode_supplier`, `nama_supplier`, `alamat_supplier`, `no_tlp_supplier`) VALUES
('SP01', 'NMC (Nissin Manufacturing Co.,LTD)', '', ''),
('SP02', '(Nissin Manufacturing Thailand)', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname`
--

CREATE TABLE IF NOT EXISTS `stock_opname` (
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
-- Table structure for table `trx_barang_keluar`
--

CREATE TABLE IF NOT EXISTS `trx_barang_keluar` (
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

-- --------------------------------------------------------

--
-- Table structure for table `trx_barang_masuk`
--

CREATE TABLE IF NOT EXISTS `trx_barang_masuk` (
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
-- Dumping data for table `trx_barang_masuk`
--

INSERT INTO `trx_barang_masuk` (`no_document`, `tanggal`, `kode_ptgs`, `kode_supplier`, `part_no`, `kode_destination`, `qty`, `kode_sliptype`, `lot_no`) VALUES
('IB19-005K/B181109-2', '0000-00-00', '', 'SP01', '2186231', 'D01', 200, 'ST03', '');

-- --------------------------------------------------------

--
-- Table structure for table `trx_detail_keluar`
--

CREATE TABLE IF NOT EXISTS `trx_detail_keluar` (
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
-- Dumping data for table `trx_detail_keluar`
--

INSERT INTO `trx_detail_keluar` (`part_no`, `Part Name`, `material_wherehouse`, `machining`, `heat_treatment_barrel`, `finishing`, `assembly`, `finishedgood_warehouse`, `scrap`, `total`, `total_all`) VALUES
('3716300', 'H-KVBV RA IN (MATERIAL)', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('3716300', 'H-KVBV RA IN (MATERIAL)', 0, 0, 0, 0, 0, 0, 0, 0, 0),
('2186231', 'HO-KRM-N31-RA (MATERIAL)', 13, 0, 0, 0, 0, 0, 0, 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `trx_detail_masuk`
--

CREATE TABLE IF NOT EXISTS `trx_detail_masuk` (
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
-- Dumping data for table `trx_detail_masuk`
--

INSERT INTO `trx_detail_masuk` (`part_no`, `part_name`, `material_wherehouse`, `machining`, `heat_treatment_barrel`, `finishing`, `assembly`, `finishedgood_warehouse`, `scrap`, `total`, `total_all`) VALUES
(2186231, 'HO-KRM-N31-RA (MATERIAL)', 13, 0, 0, 0, 0, 0, 0, 13, 13),
(2908500, 'YH-BK6 RA 3', 22, 0, 0, 0, 0, 0, 0, 22, 22);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
