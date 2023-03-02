-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2023 at 09:32 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(25) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `fullname`, `username`, `email`) VALUES
(1, 'Shemaiah Gem Panganiban', '', 'shemaiahgem.panganiban@tup.edu.ph'),
(2, 'Lisa', '', 'lissa@gmail.com'),
(3, 'Jen', 'jenjen', 'kimjennie.jennie16@gmail.com'),
(4, 'Shemaiah Gem Panganiban', 'shemaiah', 'shemiahgempanganiban@gmail.com'),
(5, 'Shemaiah Gem M Panganiban', 'admin', 'kim@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `daily_amount`
--

CREATE TABLE `daily_amount` (
  `daily_amount_id` int(11) NOT NULL,
  `tx_date` varchar(30) DEFAULT NULL,
  `total_amount` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_amount`
--

INSERT INTO `daily_amount` (`daily_amount_id`, `tx_date`, `total_amount`) VALUES
(1, '2023-01-23', 620),
(2, '2023-01-24', 475),
(3, '2023-01-25', 345),
(4, '2023-01-26', 1084),
(5, '2023-01-27', 188),
(6, '2023-01-28', 140),
(7, '2023-01-29', 55);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `admin_id`, `username`, `password`) VALUES
(5, 4, 'shemaiah', 'bf9661defa3daecacfde5bde0214c4a439351d4d'),
(6, 5, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997');

-- --------------------------------------------------------

--
-- Table structure for table `monthly_amount`
--

CREATE TABLE `monthly_amount` (
  `monthly_id` int(11) NOT NULL,
  `total_monthly` int(255) NOT NULL,
  `container` int(255) NOT NULL,
  `monthly_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `price_id` int(11) NOT NULL,
  `ml` int(50) NOT NULL,
  `amount_ml` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`price_id`, `ml`, `amount_ml`) VALUES
(1, 1, 0.0015);

-- --------------------------------------------------------

--
-- Table structure for table `qrcodes`
--

CREATE TABLE `qrcodes` (
  `qr_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `qrUname` varchar(250) NOT NULL,
  `qrVolume` varchar(250) NOT NULL,
  `amount` float NOT NULL,
  `qrImg` varchar(250) NOT NULL,
  `qrlink` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `tx_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `qrcodes`
--

INSERT INTO `qrcodes` (`qr_id`, `login_id`, `qrUname`, `qrVolume`, `amount`, `qrImg`, `qrlink`, `status`, `tx_date`) VALUES
(88, 6, 'Jennie kim', '  600', 520, '327954980.png', 'localhost/qrcode327954980.png', 'Delivered', '2023-01-22 20:00:51'),
(115, 6, 'Lisa', '  500', 50, '683260908.png', 'localhost/qrcode683260908.png', 'Delivered', '2023-01-24 17:04:03'),
(116, 6, 'Lisa', '  500', 50, '1342005941.png', 'localhost/qrcode1342005941.png', 'Delivered', '2023-01-23 11:20:46'),
(81, 6, 'Lisa', ' GYEANG  500', 700, '2132833289.png', 'localhost/qrcode2132833289.png', 'Delivered', '2023-01-25 17:01:12'),
(82, 6, 'Jennie kim', ' GYEANG  500', 88, '1638349952.png', 'localhost/qrcode1638349952.png', 'Delivered', '2023-01-25 17:02:48'),
(80, 6, 'three', ' GYEANG  700', 50, '783547242.png', 'localhost/qrcode783547242.png', 'Delivered', '2023-01-22 17:18:49'),
(79, 6, 'two', ' GYEANG  500', 70, '248969052.png', 'localhost/qrcode248969052.png', 'Delivered', '2023-01-23 16:40:29'),
(78, 6, 'one', ' GYEANG  500', 50, '1753664044.png', 'localhost/qrcode1753664044.png', 'Delivered', '2023-01-23 16:40:36'),
(90, 6, 'dd', 'GYEANG  ', 400, '1299554968.png', 'localhost/qrcode1299554968.png', 'Delivered', '2023-01-29 16:23:51'),
(174, 6, 'one', '800', 150, '796409087.png', 'localhost/qrcode796409087.png', 'Delivered', '2023-01-24 16:59:03'),
(180, 6, 'Jennie kim', '500', 50, '822266741.png', 'localhost/qrcode822266741.png', 'Delivered', '2023-01-24 17:37:18'),
(178, 6, 'Jennie kim', '788', 50, '1706792748.png', 'localhost/qrcode1706792748.png', 'Delivered', '2023-01-25 19:22:20'),
(179, 6, 'Shemaiah Gem M Panganiban', '655', 45, '998444623.png', 'localhost/qrcode998444623.png', 'Delivered', '2023-01-24 16:59:03'),
(181, 6, 'Lisa', '700', 50, '362418495.png', 'localhost/qrcode362418495.png', 'Delivered', '2023-01-25 16:45:27'),
(182, 6, 'Lisa', '789', 50, '233324704.png', 'localhost/qrcode233324704.png', 'Delivered', '2023-01-26 19:32:42'),
(183, 6, 'Jennie kim', '868', 52, '671639608.png', 'localhost/qrcode671639608.png', 'Delivered', '2023-01-27 19:31:52'),
(184, 6, 'Jennie kim', '555', 55, '1067586349.png', 'localhost/qrcode1067586349.png', 'Delivered', '2023-01-28 19:33:29'),
(185, 6, 'Lisa', '658', 50, '1957427591.png', 'localhost/qrcode1957427591.png', 'Delivered', '2023-01-26 15:30:14'),
(164, 6, 'one', '450', 50, '861919869.png', 'localhost/qrcode861919869.png', '', '2023-01-23 16:24:16'),
(165, 6, 'Lisa', '500', 50, '1723418013.png', 'localhost/qrcode1723418013.png', 'Delivered', '2023-01-23 17:41:22'),
(168, 6, 'one', '500', 50, '1725551405.png', 'localhost/qrcode1725551405.png', 'Delivered', '2023-01-23 17:54:52'),
(169, 6, 'Lisa', '500', 50, '120847385.png', 'localhost/qrcode120847385.png', 'Delivered', '2023-01-23 17:59:40'),
(170, 6, 'Lisa', '600', 50, '1486879942.png', 'localhost/qrcode1486879942.png', 'Delivered', '2023-01-23 17:56:09'),
(171, 6, 'Lisa', '500', 50, '1856820452.png', 'localhost/qrcode1856820452.png', 'Delivered', '2023-01-24 16:30:22'),
(172, 6, 'two', '820', 55, '1980821415.png', 'localhost/qrcode1980821415.png', 'Delivered', '2023-01-24 15:30:36'),
(186, 6, 'one', '699', 50, '110823684.png', 'localhost/qrcode110823684.png', 'Delivered', '2023-01-26 15:30:14'),
(187, 6, 'shem', '658', 68, '1905900659.png', 'localhost/qrcode1905900659.png', 'Delivered', '2023-01-29 19:35:07'),
(188, 6, 'two', '858', 88, '362663372.png', 'localhost/qrcode362663372.png', 'Delivered', '2023-01-27 19:32:26'),
(189, 6, 'shem', '887', 50, '707675638.png', 'localhost/qrcode707675638.png', 'Delivered', '2023-01-26 19:30:22'),
(190, 6, 'Lisa', '796', 50, '588479314.png', 'localhost/qrcode588479314.png', 'Delivered', '2023-01-26 19:30:22'),
(191, 6, 'shem', '888', 88, '1156970064.png', 'localhost/qrcode1156970064.png', 'Delivered', '2023-01-26 19:29:21'),
(192, 6, 'five', '444', 1, '1423244940.png', 'localhost/qrcode1423244940.png', 'Delivered', '2023-01-26 19:32:42'),
(158, 6, 'Lisa', '33', 33, '52405235.png', 'localhost/qrcode52405235.png', 'Delivered', '2023-12-23 17:52:05'),
(166, 6, 'Lisa', '850', 50, '1521496722.png', 'localhost/qrcode1521496722.png', 'Delivered', '2023-01-23 17:41:14'),
(173, 6, 'try', '500', 50, '1732856991.png', 'localhost/qrcode1732856991.png', 'Delivered', '2023-01-25 19:22:20'),
(167, 6, 'one', '500', 50, '1238765622.png', 'localhost/qrcode1238765622.png', 'Delivered', '2023-01-23 17:53:33'),
(193, 6, 'Lisa    ', '15000', 0, '415433660.png', 'localhost/qrcode415433660.png', 'Delivered', '2023-01-26 19:32:42'),
(195, 6, 'Jennie kim ', '20000 ', 26, '547673629.png', 'localhost/qrcode547673629.png', 'Delivered', '2023-01-26 15:30:05'),
(196, 6, 'Lisa', '888', 1, '453390979.png', 'localhost/qrcode453390979.png', 'Delivered', '2023-01-26 15:29:22'),
(197, 6, 'Jennie kim', '15000', 19, '399948981.png', 'localhost/qrcode399948981.png', 'Delivered', '2023-01-26 15:29:22'),
(204, 6, 'Lisa', '800', 1, '987365386.png', 'localhost/qrcode987365386.png', 'Delivered', '2023-01-26 19:32:42'),
(202, 6, 'Jennie kim  ', '20000', 30, '1624547020.png', 'localhost/qrcode1624547020.png', 'Delivered', '2023-01-26 19:32:42'),
(200, 6, 'Lisa', '15000', 23, '533293596.png', 'localhost/qrcode533293596.png', 'Delivered', '2023-01-26 19:32:42'),
(205, 6, 'Lisa', '1000', 2, '2109397057.png', 'localhost/qrcode2109397057.png', 'Delivered', '2023-01-26 19:32:42'),
(206, 6, 'one', '500', 1, '2106282638.png', 'localhost/qrcode2106282638.png', 'Pending', '2023-01-26 19:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `try`
--

CREATE TABLE `try` (
  `id` int(11) NOT NULL,
  `status` int(50) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `try`
--

INSERT INTO `try` (`id`, `status`, `time`) VALUES
(1, 0, '01:32:40'),
(2, 0, '01:33:05'),
(3, 1500, '02:27:38'),
(4, 1500, '02:28:17'),
(5, 0, '02:30:05'),
(6, 0, '02:30:28'),
(7, 0, '02:31:18'),
(8, 1500, '02:31:34'),
(9, 1000, '02:31:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `daily_amount`
--
ALTER TABLE `daily_amount`
  ADD PRIMARY KEY (`daily_amount_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `monthly_amount`
--
ALTER TABLE `monthly_amount`
  ADD PRIMARY KEY (`monthly_id`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`price_id`);

--
-- Indexes for table `qrcodes`
--
ALTER TABLE `qrcodes`
  ADD PRIMARY KEY (`qr_id`);

--
-- Indexes for table `try`
--
ALTER TABLE `try`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `daily_amount`
--
ALTER TABLE `daily_amount`
  MODIFY `daily_amount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `monthly_amount`
--
ALTER TABLE `monthly_amount`
  MODIFY `monthly_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `qr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `try`
--
ALTER TABLE `try`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
