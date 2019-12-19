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
-- Database: `Stube`
--

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `Email` varchar(52) DEFAULT NULL,
  `Password` varchar(52) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `VideoList`
--

CREATE TABLE `VideoList` (
  `UserID` int(11) DEFAULT NULL,
  `VideoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Videos`
--

CREATE TABLE `Videos` (
  `VideoID` int(11) NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Url` varchar(200) DEFAULT NULL,
  `CreatorVid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `VideoList`
--
ALTER TABLE `VideoList`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `VideoID` (`VideoID`);

--
-- Indexes for table `Videos`
--
ALTER TABLE `Videos`
  ADD PRIMARY KEY (`VideoID`),
  ADD KEY `CreatorVid` (`CreatorVid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `VideoList`
--
ALTER TABLE `VideoList`
  ADD CONSTRAINT `VideoList_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Usuario` (`UserID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `VideoList_ibfk_2` FOREIGN KEY (`VideoID`) REFERENCES `Videos` (`VideoID`) ON UPDATE SET NULL;

--
-- Constraints for table `Videos`
--
ALTER TABLE `Videos`
  ADD CONSTRAINT `Videos_ibfk_1` FOREIGN KEY (`CreatorVid`) REFERENCES `Usuario` (`UserID`) ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
