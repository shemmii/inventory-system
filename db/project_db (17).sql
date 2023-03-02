-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2023 at 11:35 AM
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
(8, '2023-01-30', 0, 468, 0),
(646, '2023-02-01', 0, 7, 0),
(776, '2023-02-02', 0, 50, 0);

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
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `price_id` int(11) NOT NULL,
  `volume` varchar(50) NOT NULL,
  `value` float NOT NULL,
  `container_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`price_id`, `volume`, `value`, `container_price`) VALUES
(19, '7 Liters', 11000, 7),
(20, '10 Liters', 15500, 10),
(21, '5 Gallon', 32000, 25),
(27, '1 liter', 1500, 1);

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
(318, 6, 'OPM-GYEANG11000', '', '11000', 7, '1018962192.png', 'localhost/qrcode1018962192.png', 'Delivered', '2023-01-30 14:30:26'),
(419, 6, 'H0E-GYEANG1500', '1 liter', '1500', 1, '185245754.png', 'localhost/qrcode185245754.png', 'Pending', '2023-02-07 09:39:03'),
(418, 6, 'WHB-GYEANG1500', '1 liter', '1500', 1, '1810210435.png', 'localhost/qrcode1810210435.png', 'Pending', '2023-02-07 09:37:59'),
(417, 6, 'IFR-GYEANG1500', '1 liter', '1500', 1, '467240761.png', 'localhost/qrcode467240761.png', 'Pending', '2023-02-07 09:34:32'),
(416, 6, 'UHP-GYEANG1500', '1 liter', '1500', 1, '1396743747.png', 'localhost/qrcode1396743747.png', 'Pending', '2023-02-07 09:18:22'),
(415, 6, 'PX6-GYEANG1500', '1 liter', '1500', 1, '1656574239.png', 'localhost/qrcode1656574239.png', 'Pending', '2023-02-07 09:11:49'),
(414, 6, '6A1-GYEANG32000', '5 Gallon', '32000', 25, '655683629.png', 'localhost/qrcode655683629.png', 'Pending', '2023-02-01 07:20:25'),
(413, 6, 'AQO-GYEANG11000', '7 Liters', '11000', 7, '737235410.png', 'localhost/qrcode737235410.png', 'Pending', '2023-02-01 07:06:44'),
(393, 6, 'HYA-GYEANG32000', '5 Gallons  ', '32000', 25, '582152090.png', 'localhost/qrcode582152090.png', 'Delivered', '2023-02-01 17:01:34'),
(392, 6, 'ZQM-GYEANG11000', '7 Liters', '11000', 7, '2132850946.png', 'localhost/qrcode2132850946.png', 'Delivered', '2023-02-01 17:01:34'),
(391, 6, 'S14-GYEANG32000', '5 Gallons  ', '32000', 25, '216217314.png', 'localhost/qrcode216217314.png', 'Delivered', '2023-01-31 17:00:44'),
(390, 6, 'LHY-GYEANG15500', '10 liters ', '15500', 10, '773014867.png', 'localhost/qrcode773014867.png', 'Delivered', '2023-01-31 17:00:44'),
(387, 6, 'G3D-GYEANG32000', '5 Gallons ', '32000', 40, '782345454.png', 'localhost/qrcode782345454.png', 'Delivered', '2023-01-31 19:37:02'),
(388, 6, 'AF8-GYEANG32000', '5 Gallons  ', '32000', 25, '889051255.png', 'localhost/qrcode889051255.png', 'Delivered', '2023-02-01 16:58:28'),
(389, 6, 'XJJ-GYEANG32000', '5 Gallons  ', '32000', 25, '782736063.png', 'localhost/qrcode782736063.png', 'Delivered', '2023-02-01 16:58:28'),
(384, 6, 'TEM-GYEANG11000', '7 Liters', '11000', 7, '1486830024.png', 'localhost/qrcode1486830024.png', 'Delivered', '2023-01-31 17:40:17'),
(420, 6, 'CH3-GYEANG1500', '1 liter', '1500', 1, '396376773.png', 'localhost/qrcode396376773.png', 'Pending', '2023-02-07 09:50:52'),
(421, 6, '8EI-GYEANG1500', '1 liter', '1500', 1, '1080970538.png', 'localhost/qrcode1080970538.png', 'Pending', '2023-02-07 09:51:58'),
(422, 6, 'KE6-GYEANG1500', '1 liter', '1500', 1, '380236853.png', 'localhost/qrcode380236853.png', 'Pending', '2023-02-07 10:29:04');

-- --------------------------------------------------------

--
-- Table structure for table `recent`
--

CREATE TABLE `recent` (
  `id` int(11) NOT NULL,
  `r_qrUname` varchar(255) NOT NULL,
  `container_volume` varchar(255) NOT NULL,
  `r_qrVolume` varchar(255) NOT NULL,
  `r_amount` varchar(255) NOT NULL,
  `r_status` varchar(255) NOT NULL,
  `tx_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recent`
--

INSERT INTO `recent` (`id`, `r_qrUname`, `container_volume`, `r_qrVolume`, `r_amount`, `r_status`, `tx_date`) VALUES
(1, '', '', '8000', '10', 'Delivered', '2023-02-04 15:52:19'),
(2, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(3, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(4, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(5, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(6, '', '', '5000', '6', 'Delivered', '2023-02-04 15:52:19'),
(7, '', '', '8000', '10', 'Delivered', '2023-02-04 15:52:19'),
(8, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(9, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(10, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(11, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(12, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(13, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(14, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(15, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(16, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(17, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(18, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(19, '', '', '500000', '625', 'Delivered', '2023-02-04 15:52:19'),
(20, '', '', '500', '1', 'Delivered', '2023-02-04 15:52:19'),
(21, '', '', '745', '1', 'Delivered', '2023-02-04 15:52:19'),
(32, '', '', '8000', '10', 'Delivered', '2023-02-04 15:53:37'),
(33, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(34, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(35, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(36, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(37, '', '', '5000', '6', 'Delivered', '2023-02-04 15:53:37'),
(38, '', '', '8000', '10', 'Delivered', '2023-02-04 15:53:37'),
(39, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(40, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(41, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(42, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(43, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(44, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(45, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(46, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(47, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(48, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(49, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(50, '', '', '500000', '625', 'Delivered', '2023-02-04 15:53:37'),
(51, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:37'),
(52, '', '', '745', '1', 'Delivered', '2023-02-04 15:53:37'),
(63, '', '', '8000', '10', 'Delivered', '2023-02-04 15:53:44'),
(64, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(65, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(66, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(67, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(68, '', '', '5000', '6', 'Delivered', '2023-02-04 15:53:44'),
(69, '', '', '8000', '10', 'Delivered', '2023-02-04 15:53:44'),
(70, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(71, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(72, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(73, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(74, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(75, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(76, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(77, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(78, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(79, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(80, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(81, '', '', '500000', '625', 'Delivered', '2023-02-04 15:53:44'),
(82, '', '', '500', '1', 'Delivered', '2023-02-04 15:53:44'),
(83, '', '', '745', '1', 'Delivered', '2023-02-04 15:53:44'),
(94, '', '', '8000', '10', 'Delivered', '2023-02-04 15:54:00'),
(95, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(96, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(97, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(98, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(99, '', '', '5000', '6', 'Delivered', '2023-02-04 15:54:00'),
(100, '', '', '8000', '10', 'Delivered', '2023-02-04 15:54:00'),
(101, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(102, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(103, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(104, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(105, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(106, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(107, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(108, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(109, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(110, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(111, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(112, '', '', '500000', '625', 'Delivered', '2023-02-04 15:54:00'),
(113, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:00'),
(114, '', '', '745', '1', 'Delivered', '2023-02-04 15:54:00'),
(125, '', '', '8000', '10', 'Delivered', '2023-02-04 15:54:03'),
(126, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:03'),
(127, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:03'),
(128, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:03'),
(129, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:03'),
(130, '', '', '5000', '6', 'Delivered', '2023-02-04 15:54:03'),
(131, '', '', '8000', '10', 'Delivered', '2023-02-04 15:54:03'),
(132, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:03'),
(133, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:03'),
(134, '', '', '500', '1', 'Delivered', '2023-02-04 15:54:03'),
(135, '', '', '500', '1555', 'Delivered', '2023-02-03 13:47:56'),
(136, 'SDS-GYEANG32000', '', '500', '1', 'Delivered', '2023-02-05 15:13:34'),
(137, 'AAS-GYEANG10500', '', '500', '1', 'Delivered', '2023-02-05 15:13:25'),
(138, 'BHJ--GYEANG32000', '', '500', '1', 'Delivered', '2023-02-05 15:13:16'),
(139, '40G-GYEANG1000', '', '500', '555', 'Delivered', '2023-02-05 15:11:10'),
(140, 'NGH-GYEANG2000', '', '500', '1799', 'Delivered', '2023-02-05 15:13:04'),
(141, 'FGH-GYEANG3000', '', '500', '1', 'Delivered', '2023-02-05 15:12:55'),
(142, 'ASA-GYEANG32000', '', '500', '1000', 'Delivered', '2023-02-05 15:12:48'),
(143, 'HYU-GYEANG32000', '', '500000', '1555', 'Delivered', '2023-02-05 15:12:29'),
(144, 'TYR-GYEANG1500S', '7 literss', '500', '1', 'Delivered', '2023-02-05 15:11:54'),
(145, 'ERT-GYEANG32000', '', '745', '1', 'Delivered', '2023-02-05 15:12:18'),
(156, '40G-GYEANG1000', '1000', '1000', '1', 'Delivered', '2023-02-05 15:59:30'),
(157, 'SJ2-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-05 15:59:30'),
(158, 'YZ7-GYEANG11000', '7000', '11000', '7', 'Delivered', '2023-02-05 15:59:30'),
(159, '8S3-GYEANG15500', '10000', '15500', '10', 'Delivered', '2023-02-05 15:40:52'),
(160, '80Z-GYEANG15500', '10 liters ', '15500', '10', 'Delivered', '2023-02-05 15:40:52'),
(161, 'G3D-GYEANG32000', '5 Gallons ', '32000', '40', 'Delivered', '2023-02-05 13:51:39'),
(162, 'HYA-GYEANG32000', '5 Gallons  ', '32000', '25', 'Delivered', '2023-02-05 13:52:31'),
(163, 'C49-GYEANG11000', '7 Liters', '11000', '7', 'Delivered', '2023-02-05 13:53:34'),
(164, 'WHD-GYEANG32000', '5 Gallons', '32000', '25', 'Delivered', '2023-02-05 13:54:07'),
(165, 'OCV-GYEANG500', '500', '500', '1', 'Delivered', '2023-02-05 16:21:53'),
(166, '40G-GYEANG1000', '1000', '1000', '1', 'Delivered', '2023-02-05 16:21:53'),
(167, 'YZ7-GYEANG11000', '7000', '11000', '7', 'Delivered', '2023-02-05 16:21:53'),
(168, '7LJ-GYEANG15500', '10 liters ', '15500', '10', 'Delivered', '2023-02-05 16:21:53'),
(169, '5OO-GYEANG15500', '10 liters ', '15500', '10', 'Delivered', '2023-02-05 16:21:53'),
(170, '7LJ-GYEANG15500', '10 liters ', '15500', '10', 'Delivered', '2023-02-05 16:21:53'),
(171, '8S3-GYEANG15500', '10000', '15500', '10', 'Delivered', '2023-02-05 16:21:53'),
(179, 'L3H-GYEANG11000', '7 Liters', '11000', '7', 'Delivered', '2023-02-01 06:55:25'),
(180, '14Z-GYEANG15500', '10 Liters', '15500', '10', 'Delivered', '2023-02-01 06:55:25'),
(193, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:05:43'),
(194, 'AQO-GYEANG11000', '7 Liters', '11000', '7', 'Delivered', '2023-02-07 08:05:43'),
(195, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:19:51'),
(196, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:19:51'),
(197, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:29:20'),
(198, 'AQO-GYEANG11000', '7 Liters', '11000', '7', 'Delivered', '2023-02-07 08:29:20'),
(199, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:29:20'),
(200, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:29:20'),
(201, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:29:20'),
(202, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:29:26'),
(204, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:43:56'),
(205, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:43:56'),
(206, 'AQO-GYEANG11000', '7 Liters', '11000', '7', 'Delivered', '2023-02-07 08:43:56'),
(207, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:43:56'),
(208, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:50:17'),
(209, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:50:17'),
(210, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 08:50:23'),
(211, '6A1-GYEANG32000', '5 Gallon', '32000', '25', 'Delivered', '2023-02-07 09:07:27'),
(214, 'PX6-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 09:15:10'),
(215, 'UHP-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 09:19:28'),
(216, 'IFR-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 09:35:45'),
(217, 'WHB-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 09:40:56'),
(220, 'PX6-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 10:01:07'),
(221, 'PX6-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 10:01:07'),
(222, 'PX6-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 10:01:07'),
(223, 'UHP-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 10:03:20'),
(224, 'KE6-GYEANG1500', '1 liter', '1500', '1', 'delivered', '2023-02-07 10:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `scan_qr`
--

CREATE TABLE `scan_qr` (
  `id` int(11) NOT NULL,
  `qr` varchar(255) NOT NULL,
  `sstatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scan_qr`
--

INSERT INTO `scan_qr` (`id`, `qr`, `sstatus`) VALUES
(16, 'ZQM-GYEANG11000', 1),
(17, 'PI0-GYEANG15500', 1),
(18, 'HYA-GYEANG32000', 1),
(19, '3M2-GYEANG11000', 1),
(20, '5OO-GYEANG15500', 1),
(21, 'ORX-GYEANG500', 1),
(22, 'OPM-GYEANG11000', 1),
(23, 'OPM-GYEANG11000', 1),
(24, 'OPM-GYEANG11000OPM-GYEANG11000', 1),
(25, '000', 1),
(26, 'OPM-GYEANG11000', 1),
(27, 'OPM-GYEANG11000', 1),
(28, 'U4C-GYEANG32000', 1),
(29, '80Z-GYEANG15500', 1),
(30, '72E-GYEANG11000', 1),
(31, '6GR-GYEANG15500', 1),
(32, 'SQ4-GYEANG15500', 1),
(33, '7LJ-GYEANG15500', 1),
(34, '3LT-GYEANG11000', 1),
(35, 'SQ4-GYEANG15500', 1),
(36, 'RTU-GYEANG500', 1),
(37, 'RTU-GYEANG500', 1),
(38, 'GYEANG1000', 1),
(39, '7LJ-GYEANG15500', 1),
(40, '3LT-GYEANG11000', 1),
(41, '6GR-GYEANG15500', 1),
(42, '6GR-GYEANG15500', 1),
(43, '3LT-GYEANG11000', 1),
(44, '6GR-GYEANG15500', 1),
(45, '6GR-GYEANG15500', 1),
(46, '8S3-GYEANG15500', 1),
(47, '7LJ-GYEANG15500', 1),
(48, 'SQ4-GYEANG15500', 1),
(49, 'YZ7-GYEANG11000', 1),
(50, 'SJ2-GYEANG32000', 1),
(51, '600', 1),
(52, 'WS500', 1),
(53, 'WS250', 1),
(54, 'IRL-GYEANG250', 1),
(55, 'RTU-GYEANG500', 1),
(56, 'WS250', 1),
(57, 'IRL-GYEANG250', 1),
(58, 'IRL-GYEANG250', 1),
(59, 'OCV-GYEANG500', 1),
(60, 'OCV-GYEANG500', 1),
(61, 'IRL-GYEANG250', 1),
(62, 'N1U-GYEANG250', 1),
(63, 'OCV-GYEANG500', 1),
(64, '40G-GYEANG1000', 1),
(65, 'N1U-GYEANG250', 1),
(66, 'N1U-GYEANG250', 1),
(67, 'N1U-GYEANG250', 1),
(68, 'OCV-GYEANG500', 1),
(69, '40G-GYEANG1000', 1),
(70, '40G-GYEANG1000', 1),
(71, 'N1U-GYEANG250', 1),
(72, 'OCV-GYEANG500', 1),
(73, 'N1U-GYEANG250', 1),
(74, 'N1U-GYEANG250', 1),
(75, 'OCV-GYEANG500', 1),
(76, 'OCV-GYEANG500', 1),
(77, '40G-GYEANG1000', 1),
(78, 'N1U-GYEANG250', 1),
(79, 'OCV-GYEANG500', 1),
(80, 'OCV-GYEANG500', 1),
(81, '40G-GYEANG1000', 1),
(82, 'N1U-GYEANG250', 1),
(83, 'N1U-GYEANG250', 1),
(84, 'OCV-GYEANG500', 1),
(85, 'OCV-GYEANG500', 1),
(86, 'N1U-GYEANG250', 1),
(87, 'N1U-GYEANG250', 1),
(88, 'OCV-GYEANG500', 1),
(89, 'N1U-GYEANG250', 1),
(90, 'N1U-GYEANG250', 1),
(91, 'N1U-GYEANG250', 1),
(92, 'N1U-GYEANG250', 1),
(93, 'N1U-GYEANG250', 1),
(94, 'N1U-GYEANG250', 1),
(95, 'N1U-GYEANG250', 1),
(96, 'N1U-GYEANG250', 1),
(97, 'N1U-GYEANG250', 1),
(98, 'OCV-GYEANG500', 1),
(99, '40G-GYEANG1000', 1),
(100, '40G-GYEANG1000', 1),
(101, '40G-GYEANG1000', 1),
(102, 'OCV-GYEANG500', 1),
(103, 'N1U-GYEANG250', 1),
(104, 'N1U-GYEANG250', 1),
(105, 'OCV-GYEANG500', 1),
(106, 'N1U-GYEANG250', 1),
(107, 'OCV-GYEANG500', 1),
(108, '40G-GYEANG1000', 1),
(109, 'OCV-GYEANG500', 1),
(110, '40G-GYEANG1000', 1),
(111, 'OCV-GYEANG500', 1),
(112, 'N1U-GYEANG250', 1),
(113, 'OCV-GYEANG500', 1),
(114, 'N1U-GYEANG250', 1),
(115, 'N1U-GYEANG250', 1),
(116, '40G-GYEANG1000', 1),
(117, 'OCV-GYEANG500', 1),
(118, '40G-GYEANG1000', 1),
(119, 'N1U-GYEANG250', 1),
(120, '40G-GYEANG1000', 1),
(121, '40G-GYEANG1000', 1),
(122, 'N1U-GYEANG250', 1),
(123, 'N1U-GYEANG250', 1),
(124, '7LJ-GYEANG15500', 1),
(125, 'YZ7-GYEANG11000', 1),
(126, '40G-GYEANG1000', 1),
(127, 'OCV-GYEANG500', 1),
(128, '8S3-GYEANG15500', 1),
(129, 'YZ7-GYEANG11000', 1),
(130, '3LT-GYEANG11000', 1),
(131, 'SQ4-GYEANG15500', 1),
(132, '6GR-GYEANG15500', 1),
(133, '72E-GYEANG11000', 1),
(134, '80Z-GYEANG15500', 1),
(135, 'U4C-GYEANG32000', 1),
(136, '5OO-GYEANG15500', 1),
(137, '40G-GYEANG1000', 1),
(138, 'OCV-GYEANG500', 1),
(139, '40G-GYEANG1000', 1),
(140, 'OCV-GYEANG500', 1),
(141, 'OCV-GYEANG500', 1),
(142, 'N1U-GYEANG250', 1),
(143, '40G-GYEANG1000', 1),
(144, 'OCV-GYEANG500', 1),
(145, '40G-GYEANG1000', 1),
(146, 'OCV-GYEANG500', 1),
(147, '40G-GYEANG1000', 1),
(148, 'OCV-GYEANG500', 1),
(149, 'N1U-GYEANG250', 1),
(150, 'SJ2-GYEANG32000', 1),
(151, '40G-GYEANG1000', 1),
(152, 'OCV-GYEANG500', 1),
(153, '40G-GYEANG1000', 1),
(154, 'N1U-GYEANG250', 1),
(155, '40G-GYEANG1000', 1),
(156, '40G-GYEANG1000', 1),
(157, '40G-GYEANG1000', 1),
(158, 'N1U-GYEANG250', 1),
(159, 'SJ2-GYEANG32000', 1),
(160, 'SJ2-GYEANG32000', 1),
(161, 'SJ2-GYEANG32000', 1),
(162, 'OCV-GYEANG500', 1),
(163, 'TEM-GYEANG11000', 1),
(164, 'G3D-GYEANG32000', 1),
(165, 'XJJ-GYEANG32000', 1),
(166, 'XJJ-GYEANG32000', 1),
(167, 'XJJ-GYEANG32000', 1),
(168, 'XJJ-GYEANG32000', 1),
(169, 'XJJ-GYEANG32000', 1),
(170, 'XJJ-GYEANG32000', 1),
(171, 'AF8-GYEANG32000', 1),
(172, 'AF8-GYEANG32000', 1),
(173, 'G3D-GYEANG32000', 1),
(174, 'AF8-GYEANG32000', 1),
(175, 'G3D-GYEANG32000', 1),
(176, 'AF8-GYEANG32000', 1),
(177, 'G3D-GYEANG32000', 1),
(178, 'AF8-GYEANG32000', 1),
(179, 'LHY-GYEANG15500', 1),
(180, 'XJJ-GYEANG32000', 1),
(181, '40G-GYEANG1000', 1),
(182, 'N1U-GYEANG250', 1),
(183, 'SJ2-GYEANG32000', 1),
(184, 'YZ7-GYEANG11000', 1),
(185, '8S3-GYEANG15500', 1),
(186, '80Z-GYEANG15500', 1),
(187, 'S14-GYEANG32000', 1),
(188, 'G3D-GYEANG32000', 1),
(189, 'TEM-GYEANG11000', 1),
(190, 'OPM-GYEANG11000', 1),
(191, 'HYA-GYEANG32000', 1),
(192, 'C49-GYEANG11000', 1),
(193, 'C49-GYEANG11000', 1),
(194, 'WHD-GYEANG32000', 1),
(195, '40G-GYEANG1000', 1),
(196, 'OCV-GYEANG500', 1),
(197, 'OCV-GYEANG500', 1),
(198, '40G-GYEANG1000', 1),
(199, '5OO-GYEANG15500', 1),
(200, '3M2-GYEANG11000', 1),
(201, 'RTU-GYEANG500', 1),
(202, 'E7K-GYEANG11000', 1),
(203, 'L3H-GYEANG11000', 1),
(204, '14Z-GYEANG15500', 1),
(205, '14Z-GYEANG15500', 1),
(206, '14Z-GYEANG15500', 1),
(207, 'E7K-GYEANG11000', 1),
(208, 'L3H-GYEANG11000', 1),
(209, '14Z-GYEANG15500', 1),
(210, 'L3H-GYEANG11000', 1),
(211, 'E7K-GYEANG11000', 1),
(212, 'L3H-GYEANG11000', 1),
(213, '14Z-GYEANG15500', 1),
(214, 'L3H-GYEANG11000', 1),
(215, '14Z-GYEANG15500', 1),
(216, 'L3H-GYEANG11000', 1),
(217, 'E7K-GYEANG11000', 1),
(218, 'L3H-GYEANG11000', 1),
(219, '14Z-GYEANG15500', 1),
(220, 'AQO-GYEANG11000', 1),
(221, 'AQO-GYEANG11000', 1),
(222, 'AQO-GYEANG11000', 1),
(223, '6A1-GYEANG32000', 1),
(224, '6A1-GYEANG32000', 1),
(225, '6A1-GYEANG32000', 1),
(226, 'AQO-GYEANG11000', 1),
(227, 'AQO-GYEANG11000', 1),
(228, '6A1-GYEANG32000', 1),
(229, '6A1-GYEANG32000', 1),
(230, '6A1-GYEANG32000', 1),
(231, 'AQO-GYEANG11000', 1),
(232, '6A1-GYEANG32000', 1),
(233, 'AQO-GYEANG11000', 1),
(234, '6A1-GYEANG32000', 1),
(235, 'AQO-GYEANG11000', 1),
(236, '6A1-GYEANG32000', 1),
(237, '6A1-GYEANG32000', 1),
(238, 'AQO-GYEANG11000', 1),
(239, '6A1-GYEANG32000', 1),
(240, '6A1-GYEANG32000', 1),
(241, '6A1-GYEANG32000', 1),
(242, '6A1-GYEANG32000', 1),
(243, '6A1-GYEANG32000', 1),
(244, '6A1-GYEANG32000', 1),
(245, '6A1-GYEANG32000', 1),
(246, '6A1-GYEANG32000', 1),
(247, 'AQO-GYEANG11000', 1),
(248, 'AQO-GYEANG11000', 1),
(249, '6A1-GYEANG32000', 1),
(250, '6A1-GYEANG32000', 1),
(251, '6A1-GYEANG32000', 1),
(252, '6A1-GYEANG32000', 1),
(253, '6A1-GYEANG32000', 1),
(254, 'AQO-GYEANG11000', 1),
(255, '6A1-GYEANG32000', 1),
(256, 'AQO-GYEANG11000', 1),
(257, '6A1-GYEANG32000', 1),
(258, 'AQO-GYEANG11000', 1),
(259, '6A1-GYEANG32000', 1),
(260, '6A1-GYEANG32000', 1),
(261, '6A1-GYEANG32000', 1),
(262, '6A1-GYEANG32000', 1),
(263, '6A1-GYEANG32000', 1),
(264, '6A1-GYEANG32000', 1),
(265, '6A1-GYEANG32000', 1),
(266, '6A1-GYEANG32000', 1),
(267, 'AQO-GYEANG11000', 1),
(268, '6A1-GYEANG32000', 1),
(269, 'AQO-GYEANG11000', 1),
(270, '600', 1),
(271, '600', 1),
(272, '600', 1),
(273, '6A1-GYEANG32000', 1),
(274, '6A1-GYEANG32000', 1),
(275, '6A1-GYEANG32000', 1),
(276, '6A1-GYEANG32000', 1),
(277, '6A1-GYEANG32000', 1),
(278, 'AQO-GYEANG11000', 1),
(279, 'PX6-GYEANG1500', 1),
(280, 'UHP-GYEANG1500', 1),
(281, 'IFR-GYEANG1500', 1),
(282, 'IFR-GYEANG1500', 1),
(283, 'WHB-GYEANG1500', 1),
(284, 'PX6-GYEANG1500', 1),
(285, 'PX6-GYEANG1500', 1),
(286, 'PX6-GYEANG1500', 1),
(287, 'PX6-GYEANG1500', 1),
(288, 'PX6-GYEANG1500', 1),
(289, 'PX6-GYEANG1500', 1),
(290, 'UHP-GYEANG1500', 1),
(291, 'KE6-GYEANG1500', 1);

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
-- Indexes for table `recent`
--
ALTER TABLE `recent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan_qr`
--
ALTER TABLE `scan_qr`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `daily_amount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2749;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `qr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `recent`
--
ALTER TABLE `recent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=225;

--
-- AUTO_INCREMENT for table `scan_qr`
--
ALTER TABLE `scan_qr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT for table `try`
--
ALTER TABLE `try`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
