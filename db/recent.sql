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
-- Table structure for table `recent`
--

CREATE TABLE `recent` (
  `id` int(11) NOT NULL,
  `r_qrUname` varchar(255) NOT NULL,
  `r_qrVolume` varchar(255) NOT NULL,
  `r_amount` varchar(255) NOT NULL,
  `r_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recent`
--

INSERT INTO `recent` (`id`, `r_qrUname`, `r_qrVolume`, `r_amount`, `r_status`) VALUES
(37, 'S0X-GYEANG11000', '7000', '7', 'delivered'),
(38, 'OPM-GYEANG11000', '7000', '7', 'pending'),
(42, '8MI-GYEANG15500', '10000', '10', 'pending'),
(44, 'S0X-GYEANG11000', '7000', '7', 'delivered'),
(50, 'OPM-GYEANG11000', '7000', '7', 'pending'),
(51, '8MI-GYEANG15500', '10000', '10', 'delivered'),
(52, 'OWE-GYEANG15500', '10000', '10', 'delivered'),
(53, '4NO-GYEANG32000', '19000', '25', 'delivered');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recent`
--
ALTER TABLE `recent`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recent`
--
ALTER TABLE `recent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
