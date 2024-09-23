-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2024 a las 22:48:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinariagp4`
--
CREATE DATABASE IF NOT EXISTS `veterinariagp4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinariagp4`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `contactoAlternativo` bigint(20) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `dni`, `nombre`, `apellido`, `telefono`, `direccion`, `contactoAlternativo`, `activo`) VALUES
(1, 123456789, 'Juan', 'Pérez', 9876543210, 'Calle Falsa 123', 912345678, 1),
(2, 987654321, 'Ana Maximiliano', 'Matilla', 9123456789, 'Avenida Siempre Viva 742', NULL, 1),
(3, 456789123, 'Luis', 'Martínez', 9345678901, 'Boulevard de la Libertad 56', 9234567890, 1),
(4, 321654987, 'María', 'López', 9456789012, 'Plaza Mayor 1', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idMascota` int(11) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `sexo` varchar(30) DEFAULT NULL,
  `especie` varchar(30) DEFAULT NULL,
  `raza` varchar(30) DEFAULT NULL,
  `colorPelo` varchar(50) DEFAULT NULL,
  `fechaNac` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`idMascota`, `alias`, `sexo`, `especie`, `raza`, `colorPelo`, `fechaNac`, `idCliente`, `activo`) VALUES
(1, 'Rex', 'Macho', 'Canino', 'Labrador', 'Amarillo', '2020-05-10', 1, 1),
(2, 'Luna', 'Hembra', 'Felino', 'Persa', 'Blanco', '2019-03-15', 1, 1),
(3, 'Bobby', 'Macho', 'Canino', 'Bulldog', 'Marrón', '2021-07-20', 2, 1),
(4, 'Nina', 'Hembra', 'Felino', 'Siames', 'Gris', '2022-01-25', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `descripcion` varchar(70) DEFAULT NULL,
  `medicamento` varchar(50) DEFAULT NULL,
  `importe` double DEFAULT NULL,
  `tipoTratamiento` varchar(30) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `descripcion`, `medicamento`, `importe`, `tipoTratamiento`, `activo`) VALUES
(1, 'Vacunación anual', 'Vacuna Canina A', 50, 'Preventivo', 1),
(2, 'Desparasitante interno y externo', 'Desparasitante B', 30, 'Preventivo', 1),
(3, 'Consulta general y chequeo de salud', NULL, 70, 'Consulta', 1),
(4, 'Tratamiento por alergias estacionales', 'Antihistamínico C', 40, 'Curativo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `idVisita` int(11) NOT NULL,
  `idMascota` int(11) DEFAULT NULL,
  `fechaVisita` date DEFAULT NULL,
  `detalle` varchar(50) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `idTratamiento` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idVisita`, `idMascota`, `fechaVisita`, `detalle`, `peso`, `idTratamiento`, `activo`) VALUES
(1, 1, '2024-09-30', 'Chequeo general y vacunación.', 30.5, 1, 1),
(2, 2, '2024-09-05', 'Consulta por problemas respiratorios.', 5.2, 3, 1),
(3, 3, '2024-09-25', 'Desparasitante aplicado.', 25, 2, 1),
(4, 4, '2024-09-15', 'Chequeo anual.', 4.8, 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`idVisita`),
  ADD KEY `idMascota` (`idMascota`),
  ADD KEY `idTratamiento` (`idTratamiento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `idVisita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`),
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
