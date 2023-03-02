-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2023 at 04:41 PM
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
-- Database: `arduino`
--

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
(8, 'S0X-GYEANG11000', 1),
(9, 'OPM-GYEANG11000', 1),
(10, '8MI-GYEANG15500', 1),
(11, 'OWE-GYEANG15500', 1),
(13, '4NO-GYEANG32000', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `scan_qr`
--
ALTER TABLE `scan_qr`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `scan_qr`
--
ALTER TABLE `scan_qr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
