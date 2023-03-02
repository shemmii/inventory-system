-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2023 at 07:49 PM
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
  `total_amount` int(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `qrcodes`
--

CREATE TABLE `qrcodes` (
  `qr_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `qrUname` varchar(250) NOT NULL,
  `qrVolume` varchar(250) NOT NULL,
  `amount` int(11) NOT NULL,
  `qrImg` varchar(250) NOT NULL,
  `qrlink` text NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'Pending',
  `tx_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `qrcodes`
--

INSERT INTO `qrcodes` (`qr_id`, `login_id`, `qrUname`, `qrVolume`, `amount`, `qrImg`, `qrlink`, `status`, `tx_date`) VALUES
(88, 6, 'Jennie kim', '  600', 50, '327954980.png', 'localhost/qrcode327954980.png', 'Pending', '2023-01-22 16:12:39'),
(115, 6, 'Lisa', '  500', 50, '683260908.png', 'localhost/qrcode683260908.png', 'Pending', '2023-01-22 17:04:03'),
(116, 6, 'Lisa', '  500', 50, '1342005941.png', 'localhost/qrcode1342005941.png', 'Pending', '2023-01-22 17:09:22'),
(81, 6, 'Lisa', ' GYEANG  500', 700, '2132833289.png', 'localhost/qrcode2132833289.png', 'Delivered', '2023-01-22 17:01:12'),
(82, 6, 'Jennie kim', ' GYEANG  500', 88, '1638349952.png', 'localhost/qrcode1638349952.png', 'Delivered', '2023-01-22 17:02:48'),
(122, 6, 'Lisa', '  500', 50, '295581507.png', 'localhost/qrcode295581507.png', 'Pending', '2023-01-22 17:24:58'),
(118, 6, 'Jennie kim', '  500', 50, '1129197837.png', 'localhost/qrcode1129197837.png', 'Pending', '2023-01-22 17:12:05'),
(117, 6, 'shem', '  500', 70, '724251016.png', 'localhost/qrcode724251016.png', 'Pending', '2023-01-22 17:11:03'),
(80, 6, 'three', ' GYEANG  700', 50, '783547242.png', 'localhost/qrcode783547242.png', 'Delivered', '2023-01-22 17:18:49'),
(79, 6, 'two', ' GYEANG  500', 70, '248969052.png', 'localhost/qrcode248969052.png', 'Delivered', '2023-01-21 16:40:29'),
(78, 6, 'one', ' GYEANG  500', 50, '1753664044.png', 'localhost/qrcode1753664044.png', 'Delivered', '2023-01-21 16:40:36'),
(89, 6, 'Lisa', '  500', 500, '392308037.png', 'localhost/qrcode392308037.png', 'Pending', '2023-01-22 16:14:39'),
(90, 6, 'dd', 'GYEANG  ', 400, '1299554968.png', 'localhost/qrcode1299554968.png', 'Pending', '2023-01-22 16:23:51'),
(91, 6, 'ss', 'GYEANG  ', 35, '1785176131.png', 'localhost/qrcode1785176131.png', 'Pending', '2023-01-22 16:25:13'),
(92, 6, 'Lisa', '  500', 50, '1179096698.png', 'localhost/qrcode1179096698.png', 'Pending', '2023-01-22 16:25:45'),
(93, 6, 'Lisa', '  500', 50, '1442389483.png', 'localhost/qrcode1442389483.png', 'Pending', '2023-01-22 16:29:05'),
(94, 6, 'Lisa', '  500', 50, '504037062.png', 'localhost/qrcode504037062.png', 'Pending', '2023-01-22 16:30:16'),
(95, 6, 'Lisa', 'Lisa', 50, '1131471351.png', 'localhost/qrcode1131471351.png', 'Pending', '2023-01-22 16:31:57'),
(96, 6, 'Jennie kim', ' 500 ', 50, '1145818607.png', 'localhost/qrcode1145818607.png', 'Pending', '2023-01-22 16:32:38'),
(97, 6, 'Lisa', '  500', 50, '1371351052.png', 'localhost/qrcode1371351052.png', 'Pending', '2023-01-22 16:32:58'),
(98, 6, 'one', '  500', 50, '218056144.png', 'localhost/qrcode218056144.png', 'Pending', '2023-01-22 16:34:12'),
(99, 6, 'Lisa', '  600', 50, '1114345472.png', 'localhost/qrcode1114345472.png', 'Pending', '2023-01-22 16:34:59'),
(100, 6, 'Lisa', '  600', 50, '1279544643.png', 'localhost/qrcode1279544643.png', 'Pending', '2023-01-22 16:36:40'),
(121, 6, 'Lisa', '  500', 50, '2116980183.png', 'localhost/qrcode2116980183.png', 'Pending', '2023-01-22 17:24:22'),
(102, 6, 'Lisa', '  500', 50, '616698301.png', 'localhost/qrcode616698301.png', 'Pending', '2023-01-22 16:41:47'),
(103, 6, 'Lisa', '  600', 50, '895714413.png', 'localhost/qrcode895714413.png', 'Pending', '2023-01-22 16:45:37'),
(104, 6, 'one', '  500', 50, '1833087274.png', 'localhost/qrcode1833087274.png', 'Pending', '2023-01-22 16:46:59'),
(105, 6, 'Lisa', '  600', 70, '1512296787.png', 'localhost/qrcode1512296787.png', 'Pending', '2023-01-22 16:49:16'),
(106, 6, 'shem', '', 70, '1039492694.png', 'localhost/qrcode1039492694.png', 'Pending', '2023-01-22 16:50:09'),
(107, 6, 'one', 'one', 50, '270406085.png', 'localhost/qrcode270406085.png', 'Pending', '2023-01-22 16:50:47'),
(108, 6, 'shem', 'shem', 80, '1178151055.png', 'localhost/qrcode1178151055.png', 'Pending', '2023-01-22 16:52:11'),
(109, 6, 'one', '  500', 70, '1892397448.png', 'localhost/qrcode1892397448.png', 'Pending', '2023-01-22 16:52:33'),
(110, 6, 'Jennie kim', 'Jennie kim', 50, '226459965.png', 'localhost/qrcode226459965.png', 'Pending', '2023-01-22 16:53:37'),
(111, 6, 'Lisa', '  500', 50, '1722709888.png', 'localhost/qrcode1722709888.png', 'Pending', '2023-01-22 16:54:41'),
(112, 6, 'one', '  500', 50, '368260564.png', 'localhost/qrcode368260564.png', 'Pending', '2023-01-22 16:55:21'),
(119, 6, 'Jennie kim', '  500', 50, '1541759509.png', 'localhost/qrcode1541759509.png', 'Pending', '2023-01-22 17:12:18'),
(120, 6, 'Lisa', '  500', 50, '629779477.png', 'localhost/qrcode629779477.png', 'Pending', '2023-01-22 17:22:19'),
(123, 6, 'Lisa', '  500', 50, '223120827.png', 'localhost/qrcode223120827.png', 'Pending', '2023-01-22 17:25:25'),
(124, 6, 'Lisa', '  500', 50, '185609972.png', 'localhost/qrcode185609972.png', 'Pending', '2023-01-22 17:26:12'),
(125, 6, 'Lisa', '  500', 50, '1399784526.png', 'localhost/qrcode1399784526.png', 'Pending', '2023-01-22 17:26:27'),
(126, 6, 'Lisa', '  500', 50, '2142880920.png', 'localhost/qrcode2142880920.png', 'Pending', '2023-01-22 17:29:33'),
(127, 6, 'Lisa', '  500', 70, '2004007892.png', 'localhost/qrcode2004007892.png', 'Pending', '2023-01-22 17:41:13'),
(128, 6, 'Lisa', '  500', 50, '1028471432.png', 'localhost/qrcode1028471432.png', 'Pending', '2023-01-22 17:41:59'),
(129, 6, 'Lisa', '  500', 50, '444812566.png', 'localhost/qrcode444812566.png', 'Pending', '2023-01-22 17:42:51'),
(130, 6, 'Jennie kim', '  500', 50, '1905618357.png', 'localhost/qrcode1905618357.png', 'Pending', '2023-01-22 17:44:40'),
(131, 6, 'Jennie kim', '  500', 50, '327916616.png', 'localhost/qrcode327916616.png', 'Pending', '2023-01-22 17:50:14'),
(132, 6, 'Jennie kim', '  500', 50, '270970657.png', 'localhost/qrcode270970657.png', 'Pending', '2023-01-22 17:50:47'),
(133, 6, 'Jennie kim', '  500', 50, '865596047.png', 'localhost/qrcode865596047.png', 'Pending', '2023-01-22 17:51:15'),
(134, 6, 'Lisa', '  500', 50, '276936436.png', 'localhost/qrcode276936436.png', 'Pending', '2023-01-22 17:59:10'),
(135, 6, 'Lisa', '  500', 50, '263201670.png', 'localhost/qrcode263201670.png', 'Pending', '2023-01-22 17:59:51'),
(136, 6, 'Jennie kim', '  500', 50, '231707700.png', 'localhost/qrcode231707700.png', 'Pending', '2023-01-22 18:00:30'),
(137, 6, 'Jennie kim', '  500', 50, '605701436.png', 'localhost/qrcode605701436.png', 'Pending', '2023-01-22 18:00:50'),
(138, 6, 'Jennie kim', '  500', 50, '7283957.png', 'localhost/qrcode7283957.png', 'Pending', '2023-01-22 18:01:45'),
(139, 6, 'Jennie kim', '    500', 50, '587227260.png', 'localhost/qrcode587227260.png', 'Pending', '2023-01-22 18:01:54'),
(140, 6, 'Lisa', '  600', 70, '1147858183.png', 'localhost/qrcode1147858183.png', 'Pending', '2023-01-22 18:02:23'),
(141, 6, 'Lisa', '  600', 50, '1467857010.png', 'localhost/qrcode1467857010.png', 'Pending', '2023-01-22 18:02:54'),
(142, 6, 'Jennie kim', '  500', 50, '1260437907.png', 'localhost/qrcode1260437907.png', 'Pending', '2023-01-22 18:06:04'),
(143, 6, 'Lisa', '  500', 50, '1302353595.png', 'localhost/qrcode1302353595.png', 'Pending', '2023-01-22 18:12:48'),
(144, 6, 'Lisa', '  500', 70, '2086936574.png', 'localhost/qrcode2086936574.png', 'Pending', '2023-01-22 18:13:29'),
(145, 6, 'Jennie kim', '  500', 50, '1665230482.png', 'localhost/qrcode1665230482.png', 'Pending', '2023-01-22 18:13:46'),
(146, 6, 'Jennie kim', '  500', 50, '201468517.png', 'localhost/qrcode201468517.png', 'Pending', '2023-01-22 18:13:58'),
(147, 6, 'Jennie kim', '    500', 50, '926290680.png', 'localhost/qrcode926290680.png', 'Pending', '2023-01-22 18:14:06'),
(148, 6, 'Jennie kim', '  500', 50, '1354320364.png', 'localhost/qrcode1354320364.png', 'Pending', '2023-01-22 18:16:54'),
(149, 6, 'Jennie kim', '  500', 50, '1609785884.png', 'localhost/qrcode1609785884.png', 'Pending', '2023-01-22 18:17:33'),
(150, 6, 'Lisa', '  500', 50, '1304367674.png', 'localhost/qrcode1304367674.png', 'Pending', '2023-01-22 18:18:47'),
(151, 6, 'Lisa', '500', 50, '1586285455.png', 'localhost/qrcode1586285455.png', 'Pending', '2023-01-22 18:21:47'),
(152, 6, 'Jennie kim', '200', 20, '1776193808.png', 'localhost/qrcode1776193808.png', 'Pending', '2023-01-22 18:22:15'),
(153, 6, 'Lisa', '500', 55, '335399157.png', 'localhost/qrcode335399157.png', 'Pending', '2023-01-22 18:22:38'),
(154, 6, 'Lisa', '500', 52, '936382532.png', 'localhost/qrcode936382532.png', 'Pending', '2023-01-22 18:24:14'),
(155, 6, 'Lisa', '500', 50, '1972297446.png', 'localhost/qrcode1972297446.png', 'Pending', '2023-01-22 18:24:53'),
(156, 6, 'Lisa', '500', 50, '1101842448.png', 'localhost/qrcode1101842448.png', 'Pending', '2023-01-22 18:25:34'),
(157, 6, 'try', '250', 60, '13675483.png', 'localhost/qrcode13675483.png', 'Pending', '2023-01-22 18:27:04'),
(158, 6, 'Lisa', '33', 33, '52405235.png', 'localhost/qrcode52405235.png', 'Pending', '2023-01-22 18:27:46'),
(159, 6, 'Lisa', '33', 33, '677134054.png', 'localhost/qrcode677134054.png', 'Pending', '2023-01-22 18:28:24'),
(160, 6, 'Lisa', '33', 50, '1481755885.png', 'localhost/qrcode1481755885.png', 'Pending', '2023-01-22 18:28:26'),
(161, 6, 'Lisa', '33', 50, '1353941005.png', 'localhost/qrcode1353941005.png', 'Pending', '2023-01-22 18:28:36'),
(162, 6, 'one', '255', 69, '1409643291.png', 'localhost/qrcode1409643291.png', 'Pending', '2023-01-22 18:29:20');

-- --------------------------------------------------------

--
-- Table structure for table `tblsales`
--

CREATE TABLE `tblsales` (
  `SalesId` int(11) NOT NULL,
  `Product` varchar(90) NOT NULL,
  `TotalSales` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsales`
--

INSERT INTO `tblsales` (`SalesId`, `Product`, `TotalSales`) VALUES
(1, 'Surf Powder', 1400),
(2, 'Mr clean poweder', 7000),
(3, 'Tide Powder', 5052),
(4, 'Ariel Powder', 8032),
(5, 'shampoo', 4500),
(6, 'conditioner', 5200),
(7, 'downy', 3655);

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
-- Indexes for table `qrcodes`
--
ALTER TABLE `qrcodes`
  ADD PRIMARY KEY (`qr_id`);

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
  MODIFY `daily_amount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `qr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
