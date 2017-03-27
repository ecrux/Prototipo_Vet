-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 15, 2017 at 03:27 PM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id1014973_bd_proyecto`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_enfermedades`
--

CREATE TABLE `tb_enfermedades` (
  `id_enfermedad` int(11) NOT NULL,
  `enfermedad` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_enfermedades`
--

INSERT INTO `tb_enfermedades` (`id_enfermedad`, `enfermedad`, `url`) VALUES
(1, 'Bandeja Paisa', 'img/bandeja.png'),
(2, 'Arroz con Pollo', 'img/arroz_pollo.png'),
(3, 'Arroz Con leche', 'img/arroz_leche.png'),
(4, 'Huevo Perico', 'img/perico.png'),
(5, 'Hambuergueza', 'img/hamb.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_relacion`
--

CREATE TABLE `tb_relacion` (
  `id_relacion` int(11) NOT NULL,
  `id_enfermedad` int(11) NOT NULL,
  `id_sintoma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_relacion`
--

INSERT INTO `tb_relacion` (`id_relacion`, `id_enfermedad`, `id_sintoma`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 8),
(6, 2, 1),
(7, 2, 5),
(8, 3, 1),
(9, 3, 6),
(10, 3, 7),
(11, 4, 8),
(12, 4, 9),
(13, 4, 10),
(14, 5, 11),
(15, 5, 12),
(16, 5, 13),
(17, 5, 9),
(18, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sintomas`
--

CREATE TABLE `tb_sintomas` (
  `id_sintoma` int(11) NOT NULL,
  `sintomas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sintomas`
--

INSERT INTO `tb_sintomas` (`id_sintoma`, `sintomas`) VALUES
(1, 'Arroz'),
(2, 'Frijo'),
(3, 'Chorizo'),
(4, 'Aguacate'),
(5, 'Pollo'),
(6, 'Leche'),
(7, 'Canela'),
(8, 'Huevo'),
(9, 'Tomate'),
(10, 'Cebolla'),
(11, 'Carne'),
(12, 'Pan'),
(13, 'Lechuga');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_enfermedades`
--
ALTER TABLE `tb_enfermedades`
  ADD PRIMARY KEY (`id_enfermedad`);

--
-- Indexes for table `tb_relacion`
--
ALTER TABLE `tb_relacion`
  ADD PRIMARY KEY (`id_relacion`),
  ADD KEY `id_enfermedad` (`id_enfermedad`),
  ADD KEY `id_sintoma` (`id_sintoma`);

--
-- Indexes for table `tb_sintomas`
--
ALTER TABLE `tb_sintomas`
  ADD PRIMARY KEY (`id_sintoma`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_enfermedades`
--
ALTER TABLE `tb_enfermedades`
  MODIFY `id_enfermedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_relacion`
--
ALTER TABLE `tb_relacion`
  MODIFY `id_relacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tb_sintomas`
--
ALTER TABLE `tb_sintomas`
  MODIFY `id_sintoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_relacion`
--
ALTER TABLE `tb_relacion`
  ADD CONSTRAINT `tb_relacion_ibfk_2` FOREIGN KEY (`id_sintoma`) REFERENCES `tb_sintomas` (`id_sintoma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_relacion_ibfk_3` FOREIGN KEY (`id_enfermedad`) REFERENCES `tb_enfermedades` (`id_enfermedad`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
