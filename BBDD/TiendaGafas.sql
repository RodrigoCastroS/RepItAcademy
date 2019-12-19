-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 19, 2019 at 06:49 PM
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
-- Database: `TiendaGafas`
--

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE `Brand` (
  `BrandID` int(11) NOT NULL,
  `BrandName` varchar(50) NOT NULL,
  `Supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Client`
--

CREATE TABLE `Client` (
  `ClientID` int(11) NOT NULL,
  `ClientName` varchar(50) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `DateRegistered` datetime NOT NULL,
  `NewClient` tinyint(1) NOT NULL,
  `RecommendedBy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL,
  `EmployeeName` varchar(50) NOT NULL,
  `GlassesSold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Glasses`
--

CREATE TABLE `Glasses` (
  `GlassID` int(11) NOT NULL,
  `Brand` int(11) NOT NULL,
  `LeftGlassGrad` int(3) NOT NULL,
  `RightGlassGrad` int(3) NOT NULL,
  `FrameType` enum('Metal','Frameless','Acetate','') NOT NULL,
  `ColorFrame` int(11) NOT NULL,
  `RightGlassColor` int(11) NOT NULL,
  `LeftGlassColor` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `GlassesSold`
--

CREATE TABLE `GlassesSold` (
  `GlassesSoldID` int(11) NOT NULL,
  `Glasses` int(11) NOT NULL,
  `Employee` int(11) NOT NULL,
  `Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Suplier`
--

CREATE TABLE `Suplier` (
  `SuplierID` int(11) NOT NULL,
  `NameSuplier` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL,
  `number` smallint(6) NOT NULL,
  `Flat` varchar(1) NOT NULL,
  `Door` varchar(2) NOT NULL,
  `City` varchar(40) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `CountryCode` varchar(4) NOT NULL,
  `PhoneN` varchar(10) NOT NULL,
  `FaxN` varchar(10) NOT NULL,
  `NIF` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD PRIMARY KEY (`BrandID`),
  ADD KEY `Supplier` (`Supplier`);

--
-- Indexes for table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `RecommendedBy` (`RecommendedBy`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `GlassesSold` (`GlassesSold`);

--
-- Indexes for table `Glasses`
--
ALTER TABLE `Glasses`
  ADD PRIMARY KEY (`GlassID`),
  ADD KEY `Brand` (`Brand`);

--
-- Indexes for table `GlassesSold`
--
ALTER TABLE `GlassesSold`
  ADD PRIMARY KEY (`GlassesSoldID`),
  ADD KEY `Glasses` (`Glasses`),
  ADD KEY `Employee` (`Employee`),
  ADD KEY `Client` (`Client`);

--
-- Indexes for table `Suplier`
--
ALTER TABLE `Suplier`
  ADD PRIMARY KEY (`SuplierID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Client`
--
ALTER TABLE `Client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Glasses`
--
ALTER TABLE `Glasses`
  MODIFY `GlassID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Suplier`
--
ALTER TABLE `Suplier`
  MODIFY `SuplierID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Brand`
--
ALTER TABLE `Brand`
  ADD CONSTRAINT `Brand_ibfk_1` FOREIGN KEY (`Supplier`) REFERENCES `Suplier` (`SuplierID`);

--
-- Constraints for table `Client`
--
ALTER TABLE `Client`
  ADD CONSTRAINT `Client_ibfk_1` FOREIGN KEY (`RecommendedBy`) REFERENCES `Client` (`ClientID`) ON DELETE CASCADE;

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`GlassesSold`) REFERENCES `GlassesSold` (`GlassesSoldID`);

--
-- Constraints for table `Glasses`
--
ALTER TABLE `Glasses`
  ADD CONSTRAINT `Glasses_ibfk_1` FOREIGN KEY (`Brand`) REFERENCES `Brand` (`BrandID`) ON DELETE CASCADE;

--
-- Constraints for table `GlassesSold`
--
ALTER TABLE `GlassesSold`
  ADD CONSTRAINT `GlassesSold_ibfk_1` FOREIGN KEY (`Client`) REFERENCES `Client` (`ClientID`),
  ADD CONSTRAINT `GlassesSold_ibfk_2` FOREIGN KEY (`Glasses`) REFERENCES `Glasses` (`GlassID`),
  ADD CONSTRAINT `GlassesSold_ibfk_3` FOREIGN KEY (`Employee`) REFERENCES `Employee` (`EmployeeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
