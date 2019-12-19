-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2019 at 06:21 PM
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
-- Database: `Amazon`
--

-- --------------------------------------------------------

--
-- Table structure for table `Autor`
--

CREATE TABLE `Autor` (
  `AutorID` int(11) NOT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `LibrosEscritos` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Catalogo`
--

CREATE TABLE `Catalogo` (
  `LibroID` int(11) DEFAULT NULL,
  `Unidades` smallint(6) DEFAULT NULL,
  `Precio` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Facturas`
--

CREATE TABLE `Facturas` (
  `FacturaID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `LibrosComprados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Libros`
--

CREATE TABLE `Libros` (
  `LibroID` int(11) NOT NULL,
  `Autor` int(50) DEFAULT NULL,
  `Precio` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `UsuarioID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`AutorID`);

--
-- Indexes for table `Catalogo`
--
ALTER TABLE `Catalogo`
  ADD KEY `LibroID` (`LibroID`);

--
-- Indexes for table `Facturas`
--
ALTER TABLE `Facturas`
  ADD PRIMARY KEY (`FacturaID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `LibrosComprados` (`LibrosComprados`);

--
-- Indexes for table `Libros`
--
ALTER TABLE `Libros`
  ADD PRIMARY KEY (`LibroID`),
  ADD KEY `Autor` (`Autor`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`UsuarioID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Autor`
--
ALTER TABLE `Autor`
  MODIFY `AutorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Facturas`
--
ALTER TABLE `Facturas`
  MODIFY `FacturaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Libros`
--
ALTER TABLE `Libros`
  MODIFY `LibroID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Usuario`
--
ALTER TABLE `Usuario`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Catalogo`
--
ALTER TABLE `Catalogo`
  ADD CONSTRAINT `Catalogo_ibfk_1` FOREIGN KEY (`LibroID`) REFERENCES `Libros` (`LibroID`);

--
-- Constraints for table `Facturas`
--
ALTER TABLE `Facturas`
  ADD CONSTRAINT `Facturas_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuario` (`UsuarioID`),
  ADD CONSTRAINT `Facturas_ibfk_2` FOREIGN KEY (`LibrosComprados`) REFERENCES `Libros` (`LibroID`);

--
-- Constraints for table `Libros`
--
ALTER TABLE `Libros`
  ADD CONSTRAINT `Libros_ibfk_1` FOREIGN KEY (`Autor`) REFERENCES `Autor` (`AutorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
