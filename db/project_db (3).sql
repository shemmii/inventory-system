-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2023 at 04:55 PM
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
  `qrContent` varchar(250) NOT NULL,
  `amount` int(11) NOT NULL,
  `qrImg` varchar(250) NOT NULL,
  `qrlink` text NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `qrcodes`
--

INSERT INTO `qrcodes` (`qr_id`, `login_id`, `qrUname`, `qrContent`, `amount`, `qrImg`, `qrlink`, `status`) VALUES
(43, 6, 'Lisa', '500', 50, '2043108691.png', 'localhost/qrcode2043108691.png', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

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
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `qrcodes`
--
ALTER TABLE `qrcodes`
  MODIFY `qr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
