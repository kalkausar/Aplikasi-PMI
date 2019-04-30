-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2019 at 02:47 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas_sbd2_ganti`
--

-- --------------------------------------------------------

--
-- Table structure for table `tdarah`
--

CREATE TABLE `tdarah` (
  `kd_darah` varchar(10) NOT NULL,
  `gol_darah` varchar(2) NOT NULL,
  `rh` char(1) NOT NULL,
  `tgl_simpan` date NOT NULL,
  `tgl_expired` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdarah`
--

INSERT INTO `tdarah` (`kd_darah`, `gol_darah`, `rh`, `tgl_simpan`, `tgl_expired`) VALUES
('D111111111', 'O', '-', '2019-02-17', '2019-03-19'),
('D222222222', 'O', '-', '2019-04-20', '2019-05-20'),
('D333333333', 'AB', '+', '2019-02-17', '2019-03-19'),
('D444444444', 'AB', '+', '2019-04-20', '2019-05-20'),
('D555555555', 'B', '-', '2018-11-10', '2018-12-10'),
('D666666666', 'B', '-', '2019-01-12', '2019-02-11'),
('D777777777', 'B', '-', '2019-03-13', '2019-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `tdonor`
--

CREATE TABLE `tdonor` (
  `no_pend` varchar(10) NOT NULL,
  `id_pendonor` varchar(10) NOT NULL,
  `kd_darah` varchar(10) NOT NULL,
  `tgl_donor` datetime NOT NULL,
  `berat_badan` int(3) NOT NULL,
  `hb` int(3) NOT NULL,
  `tensi_sistole` int(3) NOT NULL,
  `tensi_diastole` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tdonor`
--

INSERT INTO `tdonor` (`no_pend`, `id_pendonor`, `kd_darah`, `tgl_donor`, `berat_badan`, `hb`, `tensi_sistole`, `tensi_diastole`) VALUES
('P111111111', '1111111111', 'D111111111', '2019-02-17 10:00:00', 55, 13, 110, 70),
('P222222222', '2222222222', 'D333333333', '2019-02-17 10:10:00', 93, 14, 120, 80),
('P333333333', '1111111111', 'D222222222', '2019-04-20 10:45:00', 56, 13, 120, 70),
('P444444444', '2222222222', 'D444444444', '2019-04-20 10:55:00', 95, 15, 120, 90),
('P555555555', '3333333333', 'D555555555', '2018-11-10 13:05:00', 100, 14, 120, 80),
('P666666666', '3333333333', 'D666666666', '2019-01-12 14:32:00', 101, 14, 110, 90),
('P777777777', '3333333333', 'D777777777', '2019-03-13 09:17:00', 101, 15, 120, 85);

-- --------------------------------------------------------

--
-- Table structure for table `tpendonor`
--

CREATE TABLE `tpendonor` (
  `id_pendonor` varchar(10) NOT NULL,
  `nm_pendonor` varchar(30) NOT NULL,
  `jk` char(1) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tmp_lahir` varchar(20) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `pekerjaan` varchar(20) NOT NULL,
  `penghargaan` int(3) NOT NULL,
  `donor_ke` int(3) NOT NULL,
  `tgl_terakhir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tpendonor`
--

INSERT INTO `tpendonor` (`id_pendonor`, `nm_pendonor`, `jk`, `tgl_lahir`, `tmp_lahir`, `alamat`, `pekerjaan`, `penghargaan`, `donor_ke`, `tgl_terakhir`) VALUES
('1111111111', 'Adinda', 'P', '1998-01-21', 'Bogor', 'Jalan Satu', 'Mahasiswa', 7, 10, '2019-04-20'),
('2222222222', 'Dean', 'L', '1996-05-23', 'Jakarta', 'Jalan Dua', 'Pegawai Swasta', 1, 4, '2019-04-20'),
('3333333333', 'Kausar', 'L', '1999-08-17', 'Aceh', 'Jalan Tiga', 'Pegawai Negeri', 2, 7, '2019-03-13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tdarah`
--
ALTER TABLE `tdarah`
  ADD PRIMARY KEY (`kd_darah`);

--
-- Indexes for table `tdonor`
--
ALTER TABLE `tdonor`
  ADD PRIMARY KEY (`no_pend`),
  ADD KEY `id_pendonor` (`id_pendonor`),
  ADD KEY `kd_darah` (`kd_darah`);

--
-- Indexes for table `tpendonor`
--
ALTER TABLE `tpendonor`
  ADD PRIMARY KEY (`id_pendonor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tdonor`
--
ALTER TABLE `tdonor`
  ADD CONSTRAINT `tdonor_ibfk_1` FOREIGN KEY (`id_pendonor`) REFERENCES `tpendonor` (`id_pendonor`),
  ADD CONSTRAINT `tdonor_ibfk_2` FOREIGN KEY (`kd_darah`) REFERENCES `tdarah` (`kd_darah`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
