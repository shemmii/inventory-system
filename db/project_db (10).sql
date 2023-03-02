-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2023 at 07:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `containers_filled` int(255) NOT NULL,
  `total_amount` int(255) NOT NULL,
  `total_volume` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daily_amount`
--

INSERT INTO `daily_amount` (`daily_amount_id`, `tx_date`, `containers_filled`, `total_amount`, `total_volume`) VALUES
(1, '2023-01-23', 0, 620, 0),
(2, '2023-01-24', 0, 475, 0),
(3, '2023-01-25', 0, 345, 0),
(4, '2023-01-26', 0, 1084, 0),
(5, '2023-01-27', 0, 295, 0),
(6, '2023-01-28', 0, 957, 0),
(7, '2023-01-29', 0, 165, 0),
(8, '2023-01-30', 0, 468, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `price_id` int(11) NOT NULL,
  `ml` int(50) NOT NULL,
  `amount_ml` float NOT NULL,
  `container_amount` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`price_id`, `ml`, `amount_ml`, `container_amount`) VALUES
(1, 7, 0.000636364, '7 Liters'),
(2, 10, 0.00645161, '10 Liters'),
(3, 1, 0.00078125, '5 Gallons');

-- --------------------------------------------------------

--
-- Table structure for table `qrcodes`
--

CREATE TABLE `qrcodes` (
  `qr_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `qrUname` varchar(250) NOT NULL,
  `container_volume` varchar(255) NOT NULL,
  `qrVolume` varchar(250) NOT NULL,
  `amount` float NOT NULL,
  `qrImg` varchar(250) NOT NULL,
  `qrlink` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `tx_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qrcodes`
--

INSERT INTO `qrcodes` (`qr_id`, `login_id`, `qrUname`, `container_volume`, `qrVolume`, `amount`, `qrImg`, `qrlink`, `status`, `tx_date`) VALUES
(88, 6, 'Jennie kim', '', '  600', 520, '327954980.png', 'localhost/qrcode327954980.png', 'Delivered', '2023-01-22 20:00:51'),
(115, 6, 'Lisa', '', '  500', 50, '683260908.png', 'localhost/qrcode683260908.png', 'Delivered', '2023-01-24 17:04:03'),
(116, 6, 'Lisa', '', '  500', 50, '1342005941.png', 'localhost/qrcode1342005941.png', 'Delivered', '2023-01-23 11:20:46'),
(81, 6, 'Lisa', '', ' GYEANG  500', 700, '2132833289.png', 'localhost/qrcode2132833289.png', 'Delivered', '2023-01-25 17:01:12'),
(82, 6, 'Jennie kim', '', ' GYEANG  500', 88, '1638349952.png', 'localhost/qrcode1638349952.png', 'Delivered', '2023-01-25 17:02:48'),
(80, 6, 'three', '', ' GYEANG  700', 50, '783547242.png', 'localhost/qrcode783547242.png', 'Delivered', '2023-01-22 17:18:49'),
(79, 6, 'two', '', ' GYEANG  500', 70, '248969052.png', 'localhost/qrcode248969052.png', 'Delivered', '2023-01-23 16:40:29'),
(78, 6, 'one', '', ' GYEANG  500', 50, '1753664044.png', 'localhost/qrcode1753664044.png', 'Delivered', '2023-01-23 16:40:36'),
(90, 6, 'dd', '', 'GYEANG  ', 400, '1299554968.png', 'localhost/qrcode1299554968.png', 'Delivered', '2023-01-29 16:23:51'),
(174, 6, 'one', '', '800', 150, '796409087.png', 'localhost/qrcode796409087.png', 'Delivered', '2023-01-24 16:59:03'),
(180, 6, 'Jennie kim', '', '500', 50, '822266741.png', 'localhost/qrcode822266741.png', 'Delivered', '2023-01-24 17:37:18'),
(178, 6, 'Jennie kim', '', '788', 50, '1706792748.png', 'localhost/qrcode1706792748.png', 'Delivered', '2023-01-25 19:22:20'),
(179, 6, 'Shemaiah Gem M Panganiban', '', '655', 45, '998444623.png', 'localhost/qrcode998444623.png', 'Delivered', '2023-01-24 16:59:03'),
(181, 6, 'Lisa', '', '700', 50, '362418495.png', 'localhost/qrcode362418495.png', 'Delivered', '2023-01-25 16:45:27'),
(182, 6, 'Lisa', '', '789', 50, '233324704.png', 'localhost/qrcode233324704.png', 'Delivered', '2023-01-26 19:32:42'),
(183, 6, 'Jennie kim', '', '868', 52, '671639608.png', 'localhost/qrcode671639608.png', 'Delivered', '2023-01-27 19:31:52'),
(184, 6, 'Jennie kim', '', '555', 55, '1067586349.png', 'localhost/qrcode1067586349.png', 'Delivered', '2023-01-28 19:33:29'),
(185, 6, 'Lisa', '', '658', 50, '1957427591.png', 'localhost/qrcode1957427591.png', 'Delivered', '2023-01-26 15:30:14'),
(164, 6, 'one', '', '450', 50, '861919869.png', 'localhost/qrcode861919869.png', '', '2023-01-23 16:24:16'),
(165, 6, 'Lisa', '', '500', 50, '1723418013.png', 'localhost/qrcode1723418013.png', 'Delivered', '2023-01-23 17:41:22'),
(168, 6, 'one', '', '500', 50, '1725551405.png', 'localhost/qrcode1725551405.png', 'Delivered', '2023-01-23 17:54:52'),
(169, 6, 'Lisa', '', '500', 50, '120847385.png', 'localhost/qrcode120847385.png', 'Delivered', '2023-01-23 17:59:40'),
(170, 6, 'Lisa', '', '600', 50, '1486879942.png', 'localhost/qrcode1486879942.png', 'Delivered', '2023-01-23 17:56:09'),
(171, 6, 'Lisa', '', '500', 50, '1856820452.png', 'localhost/qrcode1856820452.png', 'Delivered', '2023-01-24 16:30:22'),
(172, 6, 'two', '', '820', 55, '1980821415.png', 'localhost/qrcode1980821415.png', 'Delivered', '2023-01-24 15:30:36'),
(186, 6, 'one', '', '699', 50, '110823684.png', 'localhost/qrcode110823684.png', 'Delivered', '2023-01-26 15:30:14'),
(187, 6, 'shem', '', '658', 68, '1905900659.png', 'localhost/qrcode1905900659.png', 'Delivered', '2023-01-29 19:35:07'),
(188, 6, 'two', '', '858', 88, '362663372.png', 'localhost/qrcode362663372.png', 'Delivered', '2023-01-27 19:32:26'),
(189, 6, 'shem', '', '887', 50, '707675638.png', 'localhost/qrcode707675638.png', 'Delivered', '2023-01-26 19:30:22'),
(190, 6, 'Lisa', '', '796', 50, '588479314.png', 'localhost/qrcode588479314.png', 'Delivered', '2023-01-26 19:30:22'),
(191, 6, 'shem', '', '888', 88, '1156970064.png', 'localhost/qrcode1156970064.png', 'Delivered', '2023-01-26 19:29:21'),
(192, 6, 'five', '', '444', 1, '1423244940.png', 'localhost/qrcode1423244940.png', 'Delivered', '2023-01-26 19:32:42'),
(158, 6, 'Lisa', '', '33', 33, '52405235.png', 'localhost/qrcode52405235.png', 'Delivered', '2023-12-23 17:52:05'),
(166, 6, 'Lisa', '', '850', 50, '1521496722.png', 'localhost/qrcode1521496722.png', 'Delivered', '2023-01-23 17:41:14'),
(173, 6, 'try', '', '500', 50, '1732856991.png', 'localhost/qrcode1732856991.png', 'Delivered', '2023-01-25 19:22:20'),
(167, 6, 'one', '', '500', 50, '1238765622.png', 'localhost/qrcode1238765622.png', 'Delivered', '2023-01-23 17:53:33'),
(193, 6, 'Lisa    ', '', '15000', 0, '415433660.png', 'localhost/qrcode415433660.png', 'Delivered', '2023-01-26 19:32:42'),
(195, 6, 'Jennie kim ', '', '20000 ', 26, '547673629.png', 'localhost/qrcode547673629.png', 'Delivered', '2023-01-26 15:30:05'),
(196, 6, 'Lisa', '', '888', 1, '453390979.png', 'localhost/qrcode453390979.png', 'Delivered', '2023-01-26 15:29:22'),
(197, 6, 'Jennie kim', '', '15000', 19, '399948981.png', 'localhost/qrcode399948981.png', 'Delivered', '2023-01-26 15:29:22'),
(204, 6, 'Lisa', '', '800', 1, '987365386.png', 'localhost/qrcode987365386.png', 'Delivered', '2023-01-26 19:32:42'),
(202, 6, 'Jennie kim  ', '', '20000', 30, '1624547020.png', 'localhost/qrcode1624547020.png', 'Delivered', '2023-01-26 19:32:42'),
(200, 6, 'Lisa', '', '15000', 23, '533293596.png', 'localhost/qrcode533293596.png', 'Delivered', '2023-01-26 19:32:42'),
(205, 6, 'Lisa', '', '1000', 2, '2109397057.png', 'localhost/qrcode2109397057.png', 'Delivered', '2023-01-26 19:32:42'),
(206, 6, 'one', '', '500', 1, '2106282638.png', 'localhost/qrcode2106282638.png', 'Delivered', '2023-01-27 17:33:58'),
(207, 6, 'Lisa', '', '6666', 10, '1706936201.png', 'localhost/qrcode1706936201.png', 'Delivered', '2023-01-27 18:07:42'),
(208, 6, 'Lisa', '', '10000', 15, '148722979.png', 'localhost/qrcode148722979.png', 'Delivered', '2023-01-27 18:07:42'),
(209, 6, 'Jennie kim', '', '18000', 27, '131789953.png', 'localhost/qrcode131789953.png', 'Delivered', '2023-01-27 18:22:43'),
(210, 6, 'Lisa', '', '20000', 30, '468164856.png', 'localhost/qrcode468164856.png', 'Delivered', '2023-01-27 19:27:15'),
(211, 6, 'Lisa ', '', '20000 ', 25, '506140036.png', 'localhost/qrcode506140036.png', 'Delivered', '2023-01-27 19:27:15'),
(212, 6, 'Lisa', '', '15000', 19, '2072303037.png', 'localhost/qrcode2072303037.png', 'Delivered', '2023-01-27 19:18:55'),
(213, 6, '', '', '8000', 10, '1749666073.png', 'localhost/qrcode1749666073.png', 'Delivered', '2023-01-27 22:32:05'),
(214, 6, '', '', '500', 1, '1430382152.png', 'localhost/qrcode1430382152.png', 'Delivered', '2023-01-27 22:32:05'),
(215, 6, '', '', '500', 1, '349533284.png', 'localhost/qrcode349533284.png', 'Delivered', '2023-01-27 22:32:05'),
(216, 6, '', '', '500', 1, '96534589.png', 'localhost/qrcode96534589.png', 'Delivered', '2023-01-27 22:32:05'),
(217, 6, '', '', '500', 1, '581287801.png', 'localhost/qrcode581287801.png', 'Delivered', '2023-01-27 22:32:05'),
(218, 6, '', '', '5000', 6, '331652671.png', 'localhost/qrcode331652671.png', 'Delivered', '2023-01-27 22:32:05'),
(219, 6, '', '', '8000', 10, '816942183.png', 'localhost/qrcode816942183.png', 'Delivered', '2023-01-27 22:32:05'),
(220, 6, '', '', '500', 1, '895012202.png', 'localhost/qrcode895012202.png', 'Delivered', '2023-01-27 22:32:05'),
(221, 6, 'WI4-GYEANG', '', '500', 1, '1770962778.png', 'localhost/qrcode1770962778.png', 'Delivered', '2023-01-28 16:45:14'),
(222, 6, '', '', '500', 1, '2099266395.png', 'localhost/qrcode2099266395.png', 'Delivered', '2023-01-27 22:32:05'),
(223, 6, '', '', '500', 1, '913193636.png', 'localhost/qrcode913193636.png', 'Delivered', '2023-01-27 22:32:05'),
(224, 6, '', '', '500', 1, '13460474.png', 'localhost/qrcode13460474.png', 'Delivered', '2023-01-27 22:32:05'),
(225, 6, '', '', '500', 1, '1851657090.png', 'localhost/qrcode1851657090.png', 'Delivered', '2023-01-27 22:32:05'),
(226, 6, '', '', '500', 1, '1285242323.png', 'localhost/qrcode1285242323.png', 'Delivered', '2023-01-27 22:32:05'),
(227, 6, '', '', '500', 1, '642174931.png', 'localhost/qrcode642174931.png', 'Delivered', '2023-01-27 22:32:05'),
(228, 6, '', '', '500', 1, '1475595676.png', 'localhost/qrcode1475595676.png', 'Delivered', '2023-01-27 22:32:05'),
(229, 6, '', '', '500', 1, '1662816735.png', 'localhost/qrcode1662816735.png', 'Delivered', '2023-01-27 22:32:05'),
(230, 6, '', '', '500', 1, '1384434364.png', 'localhost/qrcode1384434364.png', 'Delivered', '2023-01-27 22:32:05'),
(231, 6, '', '', '500', 1, '1109856686.png', 'localhost/qrcode1109856686.png', 'Delivered', '2023-01-27 22:32:05'),
(232, 6, 'mrk', '', '500', 1, '1267947411.png', 'localhost/qrcode1267947411.png', 'Delivered', '2023-01-28 16:45:14'),
(233, 6, '2iv', '', '500', 1, '1778481031.png', 'localhost/qrcode1778481031.png', 'Delivered', '2023-01-28 16:45:14'),
(234, 6, '5qv', '', '500', 1, '1189393345.png', 'localhost/qrcode1189393345.png', 'Delivered', '2023-01-28 16:45:14'),
(235, 6, '4dc', '', '500', 1, '317944348.png', 'localhost/qrcode317944348.png', 'Delivered', '2023-01-28 16:45:14'),
(236, 6, '43f', '', '500', 1, '2111466145.png', 'localhost/qrcode2111466145.png', 'Delivered', '2023-01-28 16:44:41'),
(237, 6, '6bv', '', '6000', 8, '1621797977.png', 'localhost/qrcode1621797977.png', 'Delivered', '2023-01-28 16:44:41'),
(238, 6, 'o4u', '', '8000', 10, '329766572.png', 'localhost/qrcode329766572.png', 'Delivered', '2023-01-28 16:44:41'),
(239, 6, 'GGC-GYEANG', '', '6500', 8, '1256490267.png', 'localhost/qrcode1256490267.png', 'Delivered', '2023-01-28 16:44:41'),
(240, 6, 'G9R-GYEANG', '', '630', 1, '1147174675.png', 'localhost/qrcode1147174675.png', 'Delivered', '2023-01-28 16:44:41'),
(241, 6, 'G9R-GYEANG', '', '630', 1, '1309085169.png', 'localhost/qrcode1309085169.png', 'Delivered', '2023-01-28 16:44:41'),
(242, 6, 'HZR-GYEANG', '', '630', 1, '1094341288.png', 'localhost/qrcode1094341288.png', 'Delivered', '2023-01-28 16:44:41'),
(243, 6, 'XZW-GYEANG', '', '630', 1, '1957559042.png', 'localhost/qrcode1957559042.png', 'Delivered', '2023-01-28 16:44:41'),
(244, 6, 'QKJ-GYEANG', '', '7800', 10, '270541064.png', 'localhost/qrcode270541064.png', 'Delivered', '2023-01-27 21:10:02'),
(245, 6, '', '', '500000', 625, '1663140801.png', 'localhost/qrcode1663140801.png', 'Delivered', '2023-01-27 21:10:02'),
(246, 6, '', '', '500', 1, '499112867.png', 'localhost/qrcode499112867.png', 'Delivered', '2023-01-27 21:10:02'),
(247, 6, 'HLG-GYEANG  ', '', '866', 1, '1900502397.png', 'localhost/qrcode1900502397.png', 'Delivered', '2023-01-28 16:44:41'),
(248, 6, 'MIG-GYEANG  ', '', '50000', 63, '272823256.png', 'localhost/qrcode272823256.png', 'Delivered', '2023-01-28 16:44:41'),
(249, 6, 'FO3-GYEANG  ', '', '999', 1, '649507897.png', 'localhost/qrcode649507897.png', 'Delivered', '2023-01-28 16:44:41'),
(250, 6, 'O1A-GYEANG  ', '', '444', 1, '1484004178.png', 'localhost/qrcode1484004178.png', 'Delivered', '2023-01-28 16:44:41'),
(251, 6, 'W2P-GYEANG  ', '', '999', 1, '41387735.png', 'localhost/qrcode41387735.png', 'Delivered', '2023-01-28 16:44:41'),
(252, 6, 'E3H-GYEANG  ', '', '899', 1, '2002375816.png', 'localhost/qrcode2002375816.png', 'Delivered', '2023-01-28 16:44:41'),
(253, 6, 'WNA-GYEANG  ', '', '799', 1, '1354365463.png', 'localhost/qrcode1354365463.png', 'Delivered', '2023-01-28 16:44:41'),
(254, 6, '9EW-GYEANG  ', '', '900', 1, '935917943.png', 'localhost/qrcode935917943.png', 'Delivered', '2023-01-28 16:44:41'),
(255, 6, 'RHF-GYEANG  ', '', '663', 1, '856067761.png', 'localhost/qrcode856067761.png', 'Delivered', '2023-01-28 16:44:41'),
(256, 6, '3SH-GYEANG  ', '', '788', 1, '259228332.png', 'localhost/qrcode259228332.png', 'Delivered', '2023-01-28 16:44:41'),
(257, 6, '', '', '745', 1, '1809298118.png', 'localhost/qrcode1809298118.png', 'Delivered', '2023-01-27 22:32:05'),
(258, 6, 'QMJ-GYEANG', '', '896', 1, '2107155282.png', 'localhost/qrcode2107155282.png', 'Delivered', '2023-01-28 16:17:03'),
(259, 6, 'DOF-GYEANG333', '', '333', 0, '1095185471.png', 'localhost/qrcode1095185471.png', 'Delivered', '2023-01-28 16:17:03'),
(260, 6, 'PXG-GYEANG455', '', '455', 1, '1377930560.png', 'localhost/qrcode1377930560.png', 'Delivered', '2023-01-27 22:31:42'),
(261, 6, 'CSY-GYEANG969', '', '969', 1, '1465545554.png', 'localhost/qrcode1465545554.png', 'Delivered', '2023-01-27 22:35:23'),
(262, 6, 'MGX-GYEANG3000', '', '3000', 4, '1869239978.png', 'localhost/qrcode1869239978.png', 'Delivered', '2023-01-27 22:36:25'),
(263, 6, '6K3-GYEANG5000', '', '5000', 6, '1175392251.png', 'localhost/qrcode1175392251.png', 'Delivered', '2023-01-27 22:38:23'),
(264, 6, 'OJB-GYEANG899', '', '899', 1, '405090035.png', 'localhost/qrcode405090035.png', 'Delivered', '2023-01-28 16:44:41'),
(265, 6, 'DCF-GYEANG789', '', '789', 1, '1875673377.png', 'localhost/qrcode1875673377.png', 'Delivered', '2023-01-29 14:06:06'),
(266, 6, 'YFO-GYEANG5666', '', '5666', 7, '1089197881.png', 'localhost/qrcode1089197881.png', 'Delivered', '2023-01-28 17:31:16'),
(267, 6, '2JV-GYEANG500', '', '500', 1, '313321127.png', 'localhost/qrcode313321127.png', 'Delivered', '2023-01-29 14:06:06'),
(268, 6, 'R97-GYEANG10000', '', '10000', 13, '654486466.png', 'localhost/qrcode654486466.png', 'Delivered', '2023-01-29 14:06:06'),
(269, 6, 'GZL-GYEANG500', '', '500', 1, '1129899250.png', 'localhost/qrcode1129899250.png', 'Delivered', '2023-01-29 14:06:06'),
(270, 6, 'ZIQ-GYEANG2000', '', '2000', 3, '1286708823.png', 'localhost/qrcode1286708823.png', 'Delivered', '2023-01-29 14:06:06'),
(271, 6, 'KUR-GYEANG250', '', '250', 0, '1596466953.png', 'localhost/qrcode1596466953.png', 'Delivered', '2023-01-29 14:06:06'),
(272, 6, 'N68-GYEANG1000', '', '1000', 1, '509102946.png', 'localhost/qrcode509102946.png', 'Delivered', '2023-01-29 14:06:06'),
(273, 6, 'YTL-GYEANG1250', '', '1250', 2, '1119661313.png', 'localhost/qrcode1119661313.png', 'Delivered', '2023-01-29 14:05:53'),
(274, 6, 'OUC-GYEANG2500', '', '2500', 3, '1982507952.png', 'localhost/qrcode1982507952.png', 'Delivered', '2023-01-29 14:05:53'),
(275, 6, 'AXB-GYEANG3750', '', '3750', 5, '1925437090.png', 'localhost/qrcode1925437090.png', 'Delivered', '2023-01-29 14:05:53'),
(276, 6, '1W6-GYEANG4000', '', '4000', 5, '904016287.png', 'localhost/qrcode904016287.png', 'Delivered', '2023-01-29 14:05:53'),
(277, 6, 'GYN-GYEANG5000', '', '5000', 6, '2087949807.png', 'localhost/qrcode2087949807.png', 'Delivered', '2023-01-29 14:05:53'),
(278, 6, 'HOP-GYEANG12000', '', '12000', 15, '766505760.png', 'localhost/qrcode766505760.png', 'Delivered', '2023-01-29 14:05:53'),
(284, 6, 'NW5-GYEANG1500', '', '1500', 2, '967488668.png', 'localhost/qrcode967488668.png', 'Delivered', '2023-01-29 14:49:13'),
(285, 6, '2XX-GYEANG1375', '', '1375', 2, '1014119892.png', 'localhost/qrcode1014119892.png', 'Delivered', '2023-01-29 14:49:13'),
(286, 6, '7EN-GYEANG', '', '', 0, '881009952.png', 'localhost/qrcode881009952.png', 'Delivered', '2023-01-29 14:49:13'),
(287, 6, 'CVH-GYEANG', '', '', 0, '1581778932.png', 'localhost/qrcode1581778932.png', 'Delivered', '2023-01-29 14:49:13'),
(288, 6, 'CVH-GYEANG', '', '', 0, '205511589.png', 'localhost/qrcode205511589.png', 'Delivered', '2023-01-29 14:49:13'),
(289, 6, 'QJS-GYEANG', '', '', 0, '1378580377.png', 'localhost/qrcode1378580377.png', 'Delivered', '2023-01-29 14:49:13'),
(290, 6, 'QJS-GYEANG', '', '', 0, '664206441.png', 'localhost/qrcode664206441.png', 'Delivered', '2023-01-29 14:49:13'),
(291, 6, 'QJS-GYEANG', '', '', 0, '1513013946.png', 'localhost/qrcode1513013946.png', 'Delivered', '2023-01-29 14:49:13'),
(292, 6, 'QJS-GYEANG', '', '', 0, '1274097262.png', 'localhost/qrcode1274097262.png', 'Delivered', '2023-01-29 14:49:13'),
(293, 6, 'QJS-GYEANG', '', '', 0, '2105739939.png', 'localhost/qrcode2105739939.png', 'Delivered', '2023-01-29 14:49:13'),
(294, 6, 'QJS-GYEANG', '', '', 0, '76235038.png', 'localhost/qrcode76235038.png', 'Delivered', '2023-01-29 14:48:53'),
(295, 6, 'QJS-GYEANG', '', '', 0, '1633798828.png', 'localhost/qrcode1633798828.png', 'Delivered', '2023-01-29 14:48:53'),
(296, 6, 'HXX-GYEANG15500', '', '15500', 19, '2138430394.png', 'localhost/qrcode2138430394.png', 'Delivered', '2023-01-29 14:48:53'),
(297, 6, 'VSO-GYEANG11000', '', '11000', 14, '1518549442.png', 'localhost/qrcode1518549442.png', 'Delivered', '2023-01-29 14:48:53'),
(298, 6, 'OWE-GYEANG15500', '', '15500', 19, '376573162.png', 'localhost/qrcode376573162.png', 'Delivered', '2023-01-29 14:48:53'),
(299, 6, '4NO-GYEANG32000', '', '32000', 40, '1786506590.png', 'localhost/qrcode1786506590.png', 'Delivered', '2023-01-29 14:48:53'),
(300, 6, 'PED-GYEANG11000', '', '11000', 14, '1269578915.png', 'localhost/qrcode1269578915.png', 'Delivered', '2023-01-29 14:48:53'),
(301, 6, 'NJY-GYEANG32000', '', '32000', 40, '946220885.png', 'localhost/qrcode946220885.png', 'Delivered', '2023-01-29 14:48:53'),
(302, 6, 'LIH-GYEANG11000', '', '11000', 14, '1083629589.png', 'localhost/qrcode1083629589.png', 'Delivered', '2023-01-29 15:47:12'),
(303, 6, '6O4-GYEANG15500', '', '15500', 19, '1517922971.png', 'localhost/qrcode1517922971.png', 'Delivered', '2023-01-29 15:47:12'),
(304, 6, '8OU-GYEANG32000', '', '32000', 40, '289435058.png', 'localhost/qrcode289435058.png', 'Delivered', '2023-01-29 15:47:12'),
(305, 6, '1S2-GYEANG11000', '', '11000', 14, '1958891527.png', 'localhost/qrcode1958891527.png', 'Delivered', '2023-01-29 16:13:43'),
(306, 6, 'D57-GYEANG15500', '', '15500', 19, '625046943.png', 'localhost/qrcode625046943.png', 'Delivered', '2023-01-29 16:14:14'),
(307, 6, '7JJ-GYEANG32000', '', '32000', 40, '19161352.png', 'localhost/qrcode19161352.png', 'Delivered', '2023-01-29 16:17:30'),
(308, 6, '5RL-GYEANG11000', '', '11000', 14, '1195560908.png', 'localhost/qrcode1195560908.png', 'Delivered', '2023-01-30 04:12:24'),
(309, 6, 'WHD-GYEANG32000', '5 Gallons', '32000', 25, '1165378137.png', 'localhost/qrcode1165378137.png', 'Delivered', '2023-01-30 04:12:24'),
(310, 6, 'CH9-GYEANG11000', '', '11000', 9, '85389944.png', 'localhost/qrcode85389944.png', 'Delivered', '2023-01-30 04:12:24'),
(311, 6, 'VPJ-GYEANG15500', '', '15500', 12, '1512415338.png', 'localhost/qrcode1512415338.png', 'Delivered', '2023-01-30 04:12:24'),
(312, 6, 'C49-GYEANG11000', '7 Liters', '11000', 7, '413003768.png', 'localhost/qrcode413003768.png', 'Delivered', '2023-01-30 04:12:15'),
(313, 6, '8MI-GYEANG15500', '10 Liters', '15500', 10, '241122729.png', 'localhost/qrcode241122729.png', 'Delivered', '2023-01-30 04:12:15'),
(314, 6, 'MML-GYEANG15500', '', '15500', 10, '594785630.png', 'localhost/qrcode594785630.png', 'Delivered', '2023-01-30 04:12:15'),
(315, 6, 'PWK-GYEANG15500', '', '15500', 10, '1949905865.png', 'localhost/qrcode1949905865.png', 'Delivered', '2023-01-30 14:30:26'),
(316, 6, 'S0X-GYEANG11000', '', '11000', 7, '97764113.png', 'localhost/qrcode97764113.png', 'Delivered', '2023-01-30 14:30:26'),
(317, 6, 'OPM-GYEANG11000', '', '11000', 7, '34532040.png', 'localhost/qrcode34532040.png', 'Delivered', '2023-01-30 14:30:26'),
(318, 6, 'OPM-GYEANG11000', '', '11000', 7, '1018962192.png', 'localhost/qrcode1018962192.png', 'Delivered', '2023-01-30 14:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `try`
--

CREATE TABLE `try` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `try`
--

INSERT INTO `try` (`id`, `status`, `time`) VALUES
(1, '0', '01:32:40'),
(2, '0', '01:33:05'),
(3, '1500', '02:27:38'),
(4, '1500', '02:28:17'),
(5, '0', '02:30:05'),
(6, '0', '02:30:28'),
(7, '0', '02:31:18'),
(8, '1500', '02:31:34'),
(9, '1000', '02:31:51'),
(10, '1500', '03:20:31'),
(11, '1500', '03:21:40'),
(12, '1500', '03:23:44'),
(13, '1500', '03:23:49'),
(14, '1500', '03:23:55');

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
  ADD PRIMARY KEY (`daily_amount_id`),
  ADD UNIQUE KEY `tx_date` (`tx_date`);

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
  MODIFY `daily_amount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

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
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `qr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT for table `try`
--
ALTER TABLE `try`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
