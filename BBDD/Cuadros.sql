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
-- Database: `Cuadros`
--

-- --------------------------------------------------------

--
-- Table structure for table `Compradores`
--

CREATE TABLE `Compradores` (
  `CompradoresID` int(11) NOT NULL,
  `Nombre` varchar(200) DEFAULT NULL,
  `Apellido` varchar(200) DEFAULT NULL,
  `DNI` varchar(9) DEFAULT NULL,
  `VentasID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Compradores`
--

INSERT INTO `Compradores` (`CompradoresID`, `Nombre`, `Apellido`, `DNI`, `VentasID`) VALUES
(6128763, 'juan', 'kjasd', '18731278Q', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Cuadros`
--

CREATE TABLE `Cuadros` (
  `CuadrosID` int(11) NOT NULL,
  `Precio` decimal(4,2) NOT NULL,
  `AutorNombre` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Ventas`
--

CREATE TABLE `Ventas` (
  `VentasID` int(11) NOT NULL,
  `CuadrosID` int(11) DEFAULT NULL,
  `CompradoresID` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Compradores`
--
ALTER TABLE `Compradores`
  ADD PRIMARY KEY (`CompradoresID`),
  ADD KEY `VentasID` (`VentasID`);

--
-- Indexes for table `Cuadros`
--
ALTER TABLE `Cuadros`
  ADD PRIMARY KEY (`CuadrosID`);

--
-- Indexes for table `Ventas`
--
ALTER TABLE `Ventas`
  ADD PRIMARY KEY (`VentasID`),
  ADD KEY `CuadroID` (`CuadrosID`),
  ADD KEY `CompradoresID` (`CompradoresID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Compradores`
--
ALTER TABLE `Compradores`
  ADD CONSTRAINT `Compradores_ibfk_1` FOREIGN KEY (`VentasID`) REFERENCES `Ventas` (`VentasID`);

--
-- Constraints for table `Ventas`
--
ALTER TABLE `Ventas`
  ADD CONSTRAINT `Ventas_ibfk_1` FOREIGN KEY (`CuadrosID`) REFERENCES `Cuadros` (`CuadrosID`),
  ADD CONSTRAINT `Ventas_ibfk_2` FOREIGN KEY (`CompradoresID`) REFERENCES `Compradores` (`CompradoresID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
