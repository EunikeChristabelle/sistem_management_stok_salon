-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 06:09 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_inventori`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_account`
--

CREATE TABLE `tb_account` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(15000) NOT NULL,
  `type` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_account`
--

INSERT INTO `tb_account` (`id`, `name`, `email`, `username`, `password`, `type`, `date`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '$2y$10$2BgUnGCd/E3G3AbMacEoaeMRwPMSc9XvXmgLCtvB349AzsVhnWTe6', 'Admin', '2023-08-08 07:04:55'),
(4, 'Test', 'test123@gmail.com', 'test123', '$2y$10$Od3hRPY8fZOmkMWWdchHpeS4HWyYB/IV1.M3yja//iVm7Y2ZhP0Pe', 'Gudang', '2024-05-28 03:41:37'),
(5, 'Kasir', 'kasir123@gmail.com', 'kasir123', '$2y$10$dMMyTNkYntq4LBqIu34FXuRLmr/km1ze6LLz..vYHmOMs5HxDYQfa', 'Kasir', '2023-08-03 11:53:05'),
(6, 'gudang', 'gudang@gmail.com', 'gudang', '$2y$10$kW/oZin84vJ1X03l.uZZYeU74JdfYuKhsBm1CkdU9GODzLTcZE/wi', 'Gudang', '2024-03-26 09:24:24');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`id`, `category`, `date`, `user`) VALUES
(3, 'Alat salon', '2024-05-28 10:55:55', 1),
(6, 'Shampoo', '2024-03-12 12:19:56', 1),
(7, 'Conditioner', '2024-05-28 10:56:16', 1),
(8, 'Kutek', '2024-05-28 10:57:16', 1),
(9, 'Sisir rambut', '2024-05-28 10:59:18', 1),
(10, 'Hairdryer', '2024-05-28 10:57:51', 1),
(11, 'Semir', '2024-05-28 10:58:05', 1),
(12, 'Sabun', '2024-05-28 10:58:10', 1),
(13, 'Catok', '2024-05-28 10:58:18', 1),
(14, 'Roll rambut', '2024-05-28 10:59:10', 1),
(15, 'Hairdryer Panasonic', '2024-05-30 10:52:31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_incoming_stock`
--

CREATE TABLE `tb_incoming_stock` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_incoming_stock`
--

INSERT INTO `tb_incoming_stock` (`id`, `name`, `supplier`, `amount`, `description`, `date`, `user`) VALUES
(15, 11, 11, 5, '', '2024-05-28 04:21:22', 1),
(16, 19, 15, 10, '', '2024-05-30 03:56:34', 1),
(17, 15, 6, 8, '', '2024-05-30 03:57:21', 1),
(18, 13, 14, 7, '', '2024-05-30 03:57:34', 1),
(19, 17, 6, 90, '', '2024-05-30 03:57:48', 1),
(20, 14, 9, 15, '', '2024-05-30 03:57:59', 1),
(21, 20, 6, 80, '', '2024-05-30 03:58:10', 1),
(22, 11, 11, 7, '', '2024-05-30 03:58:21', 1),
(23, 12, 8, 8, '', '2024-05-30 03:58:44', 1),
(24, 16, 12, 90, '', '2024-05-30 03:59:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_item`
--

CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` int(11) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_item`
--

INSERT INTO `tb_item` (`id`, `name`, `category`, `description`, `date`, `user`) VALUES
(11, ' Philips KeraShine Straightener', 13, 'Produksi philips\r\n', '2024-05-28 04:20:18', 1),
(12, ' Pantene Smooth &amp; Soft Care Conditioner', 7, '', '2024-05-30 03:46:26', 1),
(13, 'Revlon Nail Enamel Polish', 8, '', '2024-05-30 03:47:06', 1),
(14, 'Head and shoulders menthol shampoo', 6, '', '2024-05-30 03:48:03', 1),
(15, 'Cultusia Color Cream', 11, '', '2024-05-30 03:48:29', 1),
(16, ' L’Oreal Paris Excellence Creme', 11, '', '2024-05-30 03:48:57', 1),
(17, 'Wet brush', 9, '', '2024-05-30 03:49:21', 1),
(18, 'Hair Dryer Panasonic', 10, '', '2024-05-30 03:49:50', 1),
(19, 'Panasonic Nanoe Hair Dryer EH-NA27PN415', 15, '', '2024-05-30 03:52:48', 1),
(20, 'Soft Hair Rollers', 14, '', '2024-05-30 03:50:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_outstock`
--

CREATE TABLE `tb_outstock` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `description` varchar(1500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_outstock`
--

INSERT INTO `tb_outstock` (`id`, `name`, `supplier`, `amount`, `description`, `date`, `user`) VALUES
(7, 11, 11, 2, '', '2024-05-28 04:21:41', 1),
(8, 16, 12, 6, '', '2024-05-30 03:59:30', 1),
(9, 14, 9, 100, '', '2024-05-30 03:59:42', 1),
(10, 19, 15, 2, '', '2024-05-30 03:59:53', 1),
(11, 12, 8, 5, '', '2024-05-30 04:00:02', 1),
(12, 15, 6, 7, '', '2024-05-30 04:00:11', 1),
(13, 18, 15, 60, '', '2024-05-30 04:00:23', 1),
(15, 17, 6, 88, '', '2024-05-30 04:01:11', 1),
(16, 13, 14, 70, '', '2024-05-30 04:01:25', 1),
(17, 20, 6, 150, '', '2024-05-30 04:03:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_reset_token`
--

CREATE TABLE `tb_reset_token` (
  `id` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `token` varchar(250) NOT NULL,
  `expdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_reset_token`
--

INSERT INTO `tb_reset_token` (`id`, `email`, `token`, `expdate`) VALUES
(2, 1, '768e78024aa8fdb9b8fe87be86f64745f7b7d5a463', '2024-03-13 15:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stock`
--

CREATE TABLE `tb_stock` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `supplier` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_stock`
--

INSERT INTO `tb_stock` (`id`, `item`, `supplier`, `stock`, `date`, `user`) VALUES
(12, 11, 11, 10, '2024-05-28 04:20:55', 1),
(13, 18, 15, -60, '2024-05-30 03:53:22', 1),
(14, 14, 9, -85, '2024-05-30 03:53:39', 1),
(15, 12, 8, 3, '2024-05-30 03:54:07', 1),
(16, 20, 6, -70, '2024-05-30 03:54:24', 1),
(17, 15, 6, 1, '2024-05-30 03:54:35', 1),
(18, 17, 6, 2, '2024-05-30 03:54:49', 1),
(19, 19, 15, -26, '2024-05-30 03:55:05', 1),
(20, 13, 14, -63, '2024-05-30 03:55:27', 1),
(21, 16, 12, 84, '2024-05-30 03:55:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id`, `name`, `address`, `telephone`, `description`, `date`, `user`) VALUES
(5, 'PT. Unilever Indonesia', 'Jl. BSD Boulevard Barat Green Office Park Kavling 3, BSD City, Tangerang ', '087709963421', 'PT. Unilever Indonesia menyediakan shampoo dan lain-lain.\r\nSalah satunya sunsilk yang merupakan shampoo yang mengandung bahan-bahan natural untuk menjaga keindahan rambut, khususnya perempuan Indonesia. Sunsilk hadir di pasar Indonesia sejak tahun 1952.\r\nWebsite kami: www.unilever.co.id ', '2024-05-28 04:15:49', 1),
(6, 'PT Alat Salon Indonesia', 'JL Belimbing Indah Megah, Malang', '089394872847', 'Mendistribusi Alat-alat salon', '2024-05-28 03:52:10', 1),
(7, 'PT Johnson', ' Perkantoran Daan Mogot Baru, Jl. Bedugul 3A No. 10. Cengkareng, Jakarta Barat. 11840', '08912837461', 'Mengimpor produk shampoo untuk bayi', '2024-05-28 03:48:18', 1),
(8, 'PT Pantene', 'Blok M Jakarta ', '0839499248', 'MISI PANTENE ADALAH MEMBANTU LEBIH BANYAK ORANG UNTUK MEMILIKI RAMBUT INDAH, KARENA RAMBUT LEBIH DARI “SEKADAR RAMBUT”!\r\nMenyediakan Conditioner ', '2024-05-28 03:54:46', 1),
(9, 'PT Head and shoulders', 'Jakarta, Indonesia', '089992288312', 'Head &amp; Shoulders adalah merek Shampo Anti Ketombe no. 1 di dunia. Dapetin shampo anti-ketombe dan kondisioner untuk rambut halus, lembut dan bebas ketombe!\r\n\r\n', '2024-05-28 04:04:26', 1),
(10, 'PT Rejoice', 'Tangerang', '08239746262', 'ert Plus serta Rejoice adalah dua merek perawatan rambut yang berbeda.\r\nPert Plus dikenal sebagai merek sampo dan kondisioner 2-in-1 yang pertama kali diperkenalkan pada tahun 1987 oleh Procter &amp; Gamble.', '2024-05-28 04:06:13', 1),
(11, ' PT Philips Indonesia', 'Jl. Buncit Raya Kav 99-100 Jakarta 12510. Indonesia', '089277362323', 'Mendistribusikan catok dan haridryer dengan kualitas tinggi', '2024-05-28 04:12:05', 1),
(12, 'PT Zoya', 'Surabaya, Indonesia', '08393746232', 'Zoya sebagai local brand hadir dengan inovasi produk kutek yang bersertifikasi halal dan siap mempercantik kukumu', '2024-05-28 04:13:54', 1),
(13, 'Paul Mitchell ', 'Amerika serikat', '08293874782', 'Paul Mitchell adalah brand perawatan rambut dan peralatan styling untuk salon kecantikan yang telah diluncurkan sejak tahun 1980 dan berbasis di California, Amerika Serikat. Brand perawatan rambut terkenal ini mempunyai ciri khas dengan botol atau kemasannya yang didominasi warna hitam dan putih. Produk-produk original Paul Mitchel yang pertama kali diperkenalkan kepada konsumen yaitu Paul Mitchel Shampoo One, Paul Mitchel Shampoo Two, dan Paul Mitchel The Conditioner.', '2024-05-28 04:13:43', 1),
(14, 'Khaokhotalaypu', 'Bangkok, Thailand', '082777263517', 'Thailand&#039;s leading brand of Herbal Shampoo and Personal Care products. SHOP NOW. Khaokho Talaypu is Thailand&#039;s leading brand of natural shampoos', '2024-05-28 04:15:06', 1),
(15, 'PT Panasonic', 'Jakarta, Indonesia', '08988673782', '', '2024-05-30 03:51:50', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_account`
--
ALTER TABLE `tb_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USER` (`user`);

--
-- Indexes for table `tb_incoming_stock`
--
ALTER TABLE `tb_incoming_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NAME` (`name`),
  ADD KEY `USER` (`user`),
  ADD KEY `SUPPLIER` (`supplier`) USING BTREE;

--
-- Indexes for table `tb_item`
--
ALTER TABLE `tb_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USER` (`user`),
  ADD KEY `CATEGORY` (`category`);

--
-- Indexes for table `tb_outstock`
--
ALTER TABLE `tb_outstock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `NAME` (`name`),
  ADD KEY `USER` (`user`) USING BTREE,
  ADD KEY `SUPPLIER` (`supplier`) USING BTREE;

--
-- Indexes for table `tb_reset_token`
--
ALTER TABLE `tb_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EMAIL` (`email`);

--
-- Indexes for table `tb_stock`
--
ALTER TABLE `tb_stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SUPPLIER` (`supplier`) USING BTREE,
  ADD KEY `ITEM` (`item`),
  ADD KEY `USER` (`user`) USING BTREE;

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `USER` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_account`
--
ALTER TABLE `tb_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_incoming_stock`
--
ALTER TABLE `tb_incoming_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_outstock`
--
ALTER TABLE `tb_outstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_reset_token`
--
ALTER TABLE `tb_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_stock`
--
ALTER TABLE `tb_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD CONSTRAINT `tb_category_ibfk_1` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_incoming_stock`
--
ALTER TABLE `tb_incoming_stock`
  ADD CONSTRAINT `tb_incoming_stock_ibfk_1` FOREIGN KEY (`name`) REFERENCES `tb_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_incoming_stock_ibfk_2` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_incoming_stock_ibfk_3` FOREIGN KEY (`supplier`) REFERENCES `tb_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_item`
--
ALTER TABLE `tb_item`
  ADD CONSTRAINT `tb_item_ibfk_1` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_item_ibfk_2` FOREIGN KEY (`category`) REFERENCES `tb_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_outstock`
--
ALTER TABLE `tb_outstock`
  ADD CONSTRAINT `tb_outstock_ibfk_1` FOREIGN KEY (`name`) REFERENCES `tb_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_outstock_ibfk_2` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_outstock_ibfk_3` FOREIGN KEY (`supplier`) REFERENCES `tb_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_reset_token`
--
ALTER TABLE `tb_reset_token`
  ADD CONSTRAINT `tb_reset_token_ibfk_1` FOREIGN KEY (`email`) REFERENCES `tb_account` (`id`);

--
-- Constraints for table `tb_stock`
--
ALTER TABLE `tb_stock`
  ADD CONSTRAINT `tb_stock_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `tb_supplier` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stock_ibfk_3` FOREIGN KEY (`item`) REFERENCES `tb_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stock_ibfk_4` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD CONSTRAINT `tb_supplier_ibfk_1` FOREIGN KEY (`user`) REFERENCES `tb_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
