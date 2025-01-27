-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 08:18 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `finance_income`
--

CREATE TABLE `finance_income` (
  `id_finance_income` int(5) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `jenis_income` varchar(100) NOT NULL,
  `jumlah` int(20) NOT NULL,
  `tanggal_pembayaran` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(3) NOT NULL,
  `nomor_kamar` varchar(3) NOT NULL,
  `id_kamar_tipe` int(3) NOT NULL,
  `max_dewasa` int(11) NOT NULL,
  `max_anak` int(11) NOT NULL,
  `status_kamar` varchar(20) NOT NULL DEFAULT 'TERSEDIA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `id_kamar_tipe`, `max_dewasa`, `max_anak`, `status_kamar`) VALUES
(11, '002', 2, 2, 1, 'TERSEDIA'),
(12, '001', 2, 2, 1, 'KOTOR'),
(13, '003', 2, 2, 1, 'TERSEDIA'),
(14, '004', 2, 2, 1, 'TERSEDIA'),
(16, '001', 6, 2, 2, 'TERPAKAI'),
(17, '001', 3, 0, 1, 'KOTOR'),
(18, '001', 4, 2, 3, 'KOTOR'),
(19, '002', 6, 2, 2, 'TERSEDIA'),
(20, '003', 6, 2, 2, 'TERSEDIA'),
(21, '004', 6, 2, 2, 'TERSEDIA'),
(22, '005', 6, 2, 2, 'TERSEDIA'),
(23, '002', 3, 0, 1, 'TERSEDIA'),
(24, '002', 3, 0, 1, 'TERSEDIA');

-- --------------------------------------------------------

--
-- Table structure for table `kamar_tipe`
--

CREATE TABLE `kamar_tipe` (
  `id_kamar_tipe` int(3) NOT NULL,
  `nama_kamar_tipe` varchar(50) NOT NULL,
  `harga_malam` int(3) NOT NULL,
  `harga_orang` int(3) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kamar_tipe`
--

INSERT INTO `kamar_tipe` (`id_kamar_tipe`, `nama_kamar_tipe`, `harga_malam`, `harga_orang`, `keterangan`) VALUES
(2, 'SINGLE', 150000, 0, ''),
(3, 'JUNIOR SUITE', 100000, 0, ''),
(4, 'SUPERIOR', 700000, 0, ''),
(5, 'STANDART', 200000, 0, ''),
(6, 'TWIN', 300000, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(3) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `id_layanan_kategori` int(3) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_layanan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `nama_layanan`, `id_layanan_kategori`, `satuan`, `harga_layanan`) VALUES
(1, 'NASI GORENG', 1, 'Porsi', 25000),
(2, 'MIE GORENG', 1, 'Porsi', 15000),
(3, 'KOPI TUBRUK', 2, 'Pitcher', 85000),
(4, 'HEM', 4, '1', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `layanan_kategori`
--

CREATE TABLE `layanan_kategori` (
  `id_layanan_kategori` int(3) NOT NULL,
  `nama_layanan_kategori` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layanan_kategori`
--

INSERT INTO `layanan_kategori` (`id_layanan_kategori`, `nama_layanan_kategori`, `keterangan`) VALUES
(1, 'FOOD', 'Produk makanan, snack, sarapan dan lain-lain'),
(2, 'DRINK', 'Produk minuman'),
(3, 'TRANSPORTASI', 'Fasilitas transportasi untuk kebutuhan tamu hotel'),
(4, 'LAUNDRY', 'LAUNDRY');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(100) NOT NULL,
  `nama_hotel` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(50) NOT NULL,
  `alamat_provinsi` varchar(50) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL,
  `nomor_fax` varchar(20) NOT NULL,
  `website` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `nama_hotel`, `nama_perusahaan`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `nomor_fax`, `website`, `email`) VALUES
(1, 'PRINGOMBO HOMESTAY', '', 'Jl. Johar 1 No. 69, Pringombo 3 Kel, Pringsewu Tim., Kec. Pringsewu.', 'Pringsewu', 'lampung', '081 1729 5888', '000 0000 0000', '-', 'pringombohomestay@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tamu`
--

CREATE TABLE `tamu` (
  `id_tamu` int(3) NOT NULL,
  `prefix` varchar(5) NOT NULL,
  `nama_depan` varchar(100) NOT NULL,
  `nama_belakang` varchar(100) NOT NULL,
  `tipe_identitas` varchar(20) NOT NULL,
  `nomor_identitas` varchar(20) NOT NULL,
  `warga_negara` varchar(100) NOT NULL DEFAULT 'Indonesia',
  `alamat_jalan` text NOT NULL,
  `alamat_kabupaten` varchar(100) NOT NULL,
  `alamat_provinsi` varchar(100) NOT NULL,
  `nomor_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tamu`
--

INSERT INTO `tamu` (`id_tamu`, `prefix`, `nama_depan`, `nama_belakang`, `tipe_identitas`, `nomor_identitas`, `warga_negara`, `alamat_jalan`, `alamat_kabupaten`, `alamat_provinsi`, `nomor_telp`, `email`) VALUES
(4, 'Mr', 'Bagus', 'Prasetya', 'KTP', '5121827187291892', 'WNI', 'Jalan Slamet Riyadi 92', '1202', '12', '085655580445', 'bagusprasetya96@gmail.com'),
(5, 'Mr', 'deni', 'devito', 'KTP', '123213213213213', 'WNI', 'jl kakap', '3205', '32', '213213554635464', 'deni@yashoo.com'),
(6, 'Mr', 'TEUKU', 'GADING', 'KTP', '12345678910', 'INDONESIA', 'PASAR BATANG ', '1810', '18', '085201000605', 'teuku123@gmail.com'),
(7, 'Mr', 'Joni', 'irawan', 'KTP', '18100132456718', 'WNI', 'jalan Sukaraja', '1403', '14', '089606125617', 'joniirawan32@gmail.com'),
(8, 'Mr', 'Agung', 'Supriansyah', 'KTP', '18100123986758', 'WNI', 'jalan Sunan Bonang', '1571', '15', '089612365483', 'agungsupriansyah@gmail.com'),
(9, 'Mr', 'mela', 'fareza', 'KTP', '18100132456717', 'Indonesia', 'jalan adiguna', '1802', '18', '089606125111', 'mela@gmail.com'),
(10, 'Mr', 'Pegi', 'Setiawan', 'KTP', '181001325617', 'WNI', 'Jalan KArtini', '1871', '18', '082233445517', 'pegisetiawan@gmail.com'),
(11, 'Mr', 'Rofi', 'Oviqoh', 'KTP', '1810011901000006', 'WNI', 'Jalan Kejaksaan', '1809', '18', '089612365464', 'rofi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_kamar`
--

CREATE TABLE `transaksi_kamar` (
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `nomor_invoice` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `id_tamu` int(3) NOT NULL,
  `id_kamar` int(3) NOT NULL,
  `jumlah_dewasa` int(3) NOT NULL,
  `jumlah_anak` int(3) NOT NULL,
  `tanggal_checkin` date NOT NULL,
  `waktu_checkin` time NOT NULL,
  `tanggal_checkout` date NOT NULL,
  `waktu_checkout` time NOT NULL,
  `total_biaya_kamar` int(20) NOT NULL,
  `deposit` int(20) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'CHECK IN'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_kamar`
--

INSERT INTO `transaksi_kamar` (`id_transaksi_kamar`, `id_user`, `nomor_invoice`, `tanggal`, `id_tamu`, `id_kamar`, `jumlah_dewasa`, `jumlah_anak`, `tanggal_checkin`, `waktu_checkin`, `tanggal_checkout`, `waktu_checkout`, `total_biaya_kamar`, `deposit`, `status`) VALUES
(34, 1, 'INV-20240625-76', '2024-06-25', 4, 16, 1, 0, '2024-06-25', '17:31:00', '2024-06-27', '12:00:00', 600000, 300000, 'CHECK OUT'),
(35, 1, 'INV-20240625-30', '2024-06-25', 5, 17, 0, 0, '2024-06-25', '18:03:00', '2024-06-26', '12:00:00', 100000, 100000, 'CHECK OUT'),
(36, 2, 'INV-20240626-98', '2024-06-26', 6, 12, 1, 1, '2024-06-26', '13:05:00', '2024-06-27', '07:00:00', 150000, 150000, 'CHECK OUT'),
(37, 1, 'INV-20240629-50', '2024-06-29', 11, 18, 2, 1, '2024-06-29', '00:38:00', '2024-06-30', '12:00:00', 700000, 150000, 'CHECK OUT'),
(38, 3, 'INV-20240629-50', '2024-06-29', 6, 16, 1, 1, '2024-06-29', '00:48:00', '2024-06-30', '12:00:00', 300000, 300, 'CHECK IN');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_layanan`
--

CREATE TABLE `transaksi_layanan` (
  `id_transaksi_layanan` int(3) NOT NULL,
  `id_user` int(3) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `id_transaksi_kamar` int(3) NOT NULL,
  `id_layanan` int(3) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_layanan`
--

INSERT INTO `transaksi_layanan` (`id_transaksi_layanan`, `id_user`, `tanggal`, `waktu`, `id_transaksi_kamar`, `id_layanan`, `jumlah`, `total`) VALUES
(30, 1, '2018-08-15', '18:24:00', 20, 3, 1, 85000),
(31, 1, '2018-08-15', '18:24:00', 20, 2, 2, 30000),
(32, 1, '2018-08-15', '18:24:00', 20, 1, 1, 25000),
(33, 1, '2018-08-15', '20:59:00', 24, 4, 5, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(3) NOT NULL,
  `images` varchar(100) NOT NULL DEFAULT 'default.jpg',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `id_user_role` int(5) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `nomor_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `images`, `username`, `password`, `nama`, `id_user_role`, `jabatan`, `nomor_telp`) VALUES
(1, 'default.jpg', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Arofah Nurkholizah', 1, 'Application Developer', '0800 0000 0000'),
(2, 'default.jpg', 'resepsionis', '827ccb0eea8a706c4c34a16891f84e7b', 'Resepsionis', 2, 'Resepsionis', '081565465465465'),
(3, 'default.jpg', 'rofa', 'ed992881b889b978ac0633c90c1159cf', 'Rofa Anita', 2, 'recepsionis', '334456'),
(4, 'default.jpg', 'Arofah', '0cf24b0652c23d7d00776a5a46c805d4', 'Arofah Rianti', 1, 'Aministrator', '08225432791'),
(9, 'default.jpg', 'janu', 'e10adc3949ba59abbe56e057f20f883e', 'janu', 2, 'recepsionis', '082254327913');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id_user_role` int(10) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id_user_role`, `role_name`, `keterangan`) VALUES
(1, 'ADMINISTRATOR', ''),
(2, 'RESEPSIONIS', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `finance_income`
--
ALTER TABLE `finance_income`
  ADD PRIMARY KEY (`id_finance_income`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  ADD PRIMARY KEY (`id_kamar_tipe`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indexes for table `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  ADD PRIMARY KEY (`id_layanan_kategori`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `tamu`
--
ALTER TABLE `tamu`
  ADD PRIMARY KEY (`id_tamu`);

--
-- Indexes for table `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  ADD PRIMARY KEY (`id_transaksi_kamar`);

--
-- Indexes for table `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  ADD PRIMARY KEY (`id_transaksi_layanan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_user_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `finance_income`
--
ALTER TABLE `finance_income`
  MODIFY `id_finance_income` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `kamar_tipe`
--
ALTER TABLE `kamar_tipe`
  MODIFY `id_kamar_tipe` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `layanan_kategori`
--
ALTER TABLE `layanan_kategori`
  MODIFY `id_layanan_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tamu`
--
ALTER TABLE `tamu`
  MODIFY `id_tamu` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `transaksi_kamar`
--
ALTER TABLE `transaksi_kamar`
  MODIFY `id_transaksi_kamar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `transaksi_layanan`
--
ALTER TABLE `transaksi_layanan`
  MODIFY `id_transaksi_layanan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_user_role` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
