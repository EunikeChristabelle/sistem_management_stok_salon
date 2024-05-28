-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2024 at 02:53 AM
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
(4, 'Test', 'test123@gmail.com', 'test123', '$2y$10$5YVX5EBteLv/NTCdCau.lurQNnEkyetniY/2QdM4CBXwOECTSnNCu', 'Gudang', '2023-08-03 11:53:37'),
(5, 'Kasir', 'kasir123@gmail.com', 'kasir123', '$2y$10$dMMyTNkYntq4LBqIu34FXuRLmr/km1ze6LLz..vYHmOMs5HxDYQfa', 'Kasir', '2023-08-03 11:53:05');

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
(3, 'Other', '2023-03-15 22:02:07', 1),
(6, 'Shampoo', '2024-03-12 12:19:56', 1);

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
(11, 6, 5, 1000, 'warna orange', '2024-03-12 06:50:36', 1),
(12, 7, 5, 1000, 'tambah stok', '2024-03-12 12:41:36', 4);

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
(6, 'Makarizo', 6, 'varian abc', '2024-03-12 05:20:35', 1),
(7, 'conditioner', 3, '-', '2024-03-12 06:51:24', 1);

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
(5, 7, 5, 5, '', '2024-03-12 06:52:18', 1);

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
-- yg ini hanya ada setelah berbentuk app
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
(10, 6, 5, 1000, '2024-03-12 06:50:07', 1),
(11, 7, 5, 995, '2024-03-12 06:51:58', 1);

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
(5, 'PT shampoo', 'JL abcz', '0808080808', 'Distribusi shampoo buatan negara xyz', '2024-03-12 12:37:57', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_incoming_stock`
--
ALTER TABLE `tb_incoming_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_outstock`
--
ALTER TABLE `tb_outstock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_reset_token`
--
ALTER TABLE `tb_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_stock`
--
ALTER TABLE `tb_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
