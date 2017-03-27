-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2017 a las 15:55:55
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_ayuda`
--

CREATE TABLE `tb_ayuda` (
  `id_ayuda` int(11) NOT NULL,
  `ayuda` varchar(100) NOT NULL,
  `texto` text NOT NULL,
  `url` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_ayuda`
--

INSERT INTO `tb_ayuda` (`id_ayuda`, `ayuda`, `texto`, `url`) VALUES
(1, 'Casos de uso', 'Un caso de uso es una descripción de los pasos o las actividades que deberán realizarse para llevar a cabo algún proceso.', 'img/caso.png'),
(2, 'Caso de uso documentado', 'La plantilla siguiente es una muestra de una fuente estándar del sector y puede utilizarse para documentar casos de uso.', 'img/documentacion.png'),
(3, 'Modelo entidad relación (MER)', 'Es una herramienta para el modelado de datos que permite representar las entidades relevantes de un sistema de información así como sus interrelaciones y propiedades.', 'img/mer.png'),
(4, 'UML - Clases', 'En la ingeniería de software , un diagrama de clases en el Lenguaje de Modelado Unificado (UML) es un tipo de diagrama de estructura estática que describe la estructura de un sistema mostrando del sistema de clases , sus atributos, operaciones (o métodos), y las relaciones entre los objetos.', 'img/clases.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_enfermedades`
--

CREATE TABLE `tb_enfermedades` (
  `id_enfermedad` int(11) NOT NULL,
  `enfermedad` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_enfermedades`
--

INSERT INTO `tb_enfermedades` (`id_enfermedad`, `enfermedad`, `url`) VALUES
(1, 'Bandeja Paisa', 'img/bandeja.png'),
(2, 'Arroz con Pollo', 'img/arroz_pollo.png'),
(3, 'Arroz Con leche', 'img/arroz_leche.png'),
(4, 'Huevo Perico', 'img/perico.png'),
(5, 'Hambuergueza', 'img/hamb.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_relacion`
--

CREATE TABLE `tb_relacion` (
  `id_relacion` int(11) NOT NULL,
  `id_enfermedad` int(11) NOT NULL,
  `id_sintoma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_relacion`
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
-- Estructura de tabla para la tabla `tb_sintomas`
--

CREATE TABLE `tb_sintomas` (
  `id_sintoma` int(11) NOT NULL,
  `sintomas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_sintomas`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `documento` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_relacion` int(11) NOT NULL,
  `id_ayuda` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_ayuda`
--
ALTER TABLE `tb_ayuda`
  ADD PRIMARY KEY (`id_ayuda`);

--
-- Indices de la tabla `tb_enfermedades`
--
ALTER TABLE `tb_enfermedades`
  ADD PRIMARY KEY (`id_enfermedad`);

--
-- Indices de la tabla `tb_relacion`
--
ALTER TABLE `tb_relacion`
  ADD PRIMARY KEY (`id_relacion`),
  ADD KEY `id_enfermedad` (`id_enfermedad`),
  ADD KEY `id_sintoma` (`id_sintoma`);

--
-- Indices de la tabla `tb_sintomas`
--
ALTER TABLE `tb_sintomas`
  ADD PRIMARY KEY (`id_sintoma`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `id_ayuda` (`id_ayuda`),
  ADD KEY `id_relacion` (`id_relacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_ayuda`
--
ALTER TABLE `tb_ayuda`
  MODIFY `id_ayuda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tb_enfermedades`
--
ALTER TABLE `tb_enfermedades`
  MODIFY `id_enfermedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tb_relacion`
--
ALTER TABLE `tb_relacion`
  MODIFY `id_relacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `tb_sintomas`
--
ALTER TABLE `tb_sintomas`
  MODIFY `id_sintoma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_relacion`
--
ALTER TABLE `tb_relacion`
  ADD CONSTRAINT `tb_relacion_ibfk_2` FOREIGN KEY (`id_sintoma`) REFERENCES `tb_sintomas` (`id_sintoma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_relacion_ibfk_3` FOREIGN KEY (`id_enfermedad`) REFERENCES `tb_enfermedades` (`id_enfermedad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_ibfk_1` FOREIGN KEY (`id_relacion`) REFERENCES `tb_relacion` (`id_relacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_usuario_ibfk_2` FOREIGN KEY (`id_ayuda`) REFERENCES `tb_ayuda` (`id_ayuda`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
