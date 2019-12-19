-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2019 at 06:46 PM
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
-- Database: `Red_social`
--

-- --------------------------------------------------------

--
-- Table structure for table `ConexionAmigos`
--

CREATE TABLE `ConexionAmigos` (
  `ConexionID` int(11) NOT NULL,
  `Amigo1` int(11) DEFAULT NULL,
  `Amigo2` int(11) DEFAULT NULL,
  `Conexion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Fotografias`
--

CREATE TABLE `Fotografias` (
  `FotoID` int(11) NOT NULL,
  `Lugar` int(11) NOT NULL,
  `Url` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `FotosSubidas`
--

CREATE TABLE `FotosSubidas` (
  `UsuarioID` int(11) NOT NULL,
  `FotoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `UsuarioID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Amigos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ConexionAmigos`
--
ALTER TABLE `ConexionAmigos`
  ADD PRIMARY KEY (`ConexionID`),
  ADD KEY `UsuarioID1` (`Amigo1`,`Amigo2`),
  ADD KEY `Amigo2` (`Amigo2`);

--
-- Indexes for table `Fotografias`
--
ALTER TABLE `Fotografias`
  ADD PRIMARY KEY (`FotoID`);

--
-- Indexes for table `FotosSubidas`
--
ALTER TABLE `FotosSubidas`
  ADD KEY `UsuarioID` (`UsuarioID`,`FotoID`),
  ADD KEY `FotoID` (`FotoID`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`UsuarioID`),
  ADD KEY `Amigos` (`Amigos`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ConexionAmigos`
--
ALTER TABLE `ConexionAmigos`
  MODIFY `ConexionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Fotografias`
--
ALTER TABLE `Fotografias`
  MODIFY `FotoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ConexionAmigos`
--
ALTER TABLE `ConexionAmigos`
  ADD CONSTRAINT `ConexionAmigos_ibfk_1` FOREIGN KEY (`Amigo1`) REFERENCES `Usuario` (`UsuarioID`),
  ADD CONSTRAINT `ConexionAmigos_ibfk_2` FOREIGN KEY (`Amigo2`) REFERENCES `Usuario` (`UsuarioID`);

--
-- Constraints for table `FotosSubidas`
--
ALTER TABLE `FotosSubidas`
  ADD CONSTRAINT `FotosSubidas_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `Usuario` (`UsuarioID`),
  ADD CONSTRAINT `FotosSubidas_ibfk_2` FOREIGN KEY (`FotoID`) REFERENCES `Fotografias` (`FotoID`);

--
-- Constraints for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`Amigos`) REFERENCES `ConexionAmigos` (`ConexionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
