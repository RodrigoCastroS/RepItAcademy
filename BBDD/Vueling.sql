-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2019 at 06:20 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Vueling`
--

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE `plane` (
  `idPlane` int(11) NOT NULL,
  `planeModel` int(11) NOT NULL,
  `maxSeats` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `planeModel`
--

CREATE TABLE `planeModel` (
  `idPlaneModel` int(11) NOT NULL,
  `idPlane` int(11) NOT NULL,
  `maxFuel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Seat`
--

CREATE TABLE `Seat` (
  `idSeat` int(11) NOT NULL,
  `idPlane` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`idPlane`),
  ADD UNIQUE KEY `idPlane` (`idPlane`);

--
-- Indexes for table `planeModel`
--
ALTER TABLE `planeModel`
  ADD PRIMARY KEY (`idPlaneModel`),
  ADD UNIQUE KEY `idPlane` (`idPlane`),
  ADD KEY `idPlane_2` (`idPlane`);

--
-- Indexes for table `Seat`
--
ALTER TABLE `Seat`
  ADD PRIMARY KEY (`idSeat`),
  ADD KEY `idPlane` (`idPlane`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `planeModel`
--
ALTER TABLE `planeModel`
  ADD CONSTRAINT `planeModel_ibfk_1` FOREIGN KEY (`idPlane`) REFERENCES `plane` (`idPlane`) ON DELETE CASCADE;

--
-- Constraints for table `Seat`
--
ALTER TABLE `Seat`
  ADD CONSTRAINT `Seat_ibfk_1` FOREIGN KEY (`idPlane`) REFERENCES `plane` (`idPlane`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
