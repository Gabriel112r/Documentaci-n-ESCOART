-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2023 a las 23:13:25
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escoart`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritocompras`
--

CREATE TABLE `carritocompras` (
  `Id_Carrito` int(11) NOT NULL COMMENT 'Es el valor unico que tiene el carrito de compra de un usuario',
  `Id_Productos` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada producto',
  `Id_Usuarios` int(11) NOT NULL COMMENT 'Es el valor unico que representa cada usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada categoría de productos ',
  `Nom_Categoria` varchar(30) NOT NULL COMMENT 'Es el nombre que tiene cada categoría de productos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envio`
--

CREATE TABLE `envio` (
  `Id_Envio` int(11) NOT NULL COMMENT 'Es el valor unico de cada envió',
  `Estado_Envio` varchar(30) NOT NULL COMMENT 'Muestra el estado en el cual se encuentra el envio',
  `Fecha_Envio` date NOT NULL COMMENT 'Es la fecha en la cual se realizo el envio',
  `Fecha_Entrega` date NOT NULL COMMENT 'Es la fecha estimada en la cual se entregara el envio',
  `Id_Pedido` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada pedido',
  `Id_Usuario` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada usuairo',
  `Id_Estados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_Estados` int(11) NOT NULL,
  `Estados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `Id_Pedido` int(11) NOT NULL COMMENT 'Es el valor unico de cada pedido',
  `Fecha_Pedido` date NOT NULL COMMENT 'Es la fecha en la cual se realizo el pedido',
  `Estado_Pedido` varchar(30) NOT NULL COMMENT 'Es el estado actual en el cual se encuentra el pedido',
  `Id_Usuario` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_Producto` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada producto',
  `Nom_Producto` varchar(30) NOT NULL COMMENT 'Es el nombre que tiene cada producto',
  `Precio_Producto` decimal(10,0) NOT NULL COMMENT 'Es el precio que cuesta cada producto',
  `Desc_Producto` varchar(100) NOT NULL COMMENT 'Es la descripción de cada producto',
  `Id_Categoria` int(11) NOT NULL COMMENT 'Es el valor unico de cada categoria',
  `Id_Proveedor` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_Proveedor` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada proveedor',
  `Nom_Proveedor` varchar(30) NOT NULL COMMENT 'Nombre de el proveedor',
  `Tel_Proveedor` varchar(30) NOT NULL COMMENT 'Numero de teléfono del proveedor ',
  `FK id_tipoProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo proveedor`
--

CREATE TABLE `tipo proveedor` (
  `id_tipoProveedor` int(11) NOT NULL,
  `tipo_Proveedor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL COMMENT 'Es el valor unico que tiene cada usuario',
  `Nom_Usuario` varchar(30) NOT NULL COMMENT 'Nombre del usuario\r\n',
  `Primer_Apellido` varchar(30) NOT NULL COMMENT 'Apellido del usuario',
  `Segundo_Apellido` varchar(30) NOT NULL,
  `Correo_Usuario` varchar(30) NOT NULL COMMENT 'Correo electrónico del usuario',
  `Contraseña` varchar(30) NOT NULL,
  `Tel_Usuario` varchar(20) NOT NULL COMMENT 'Numero de telefono del usuario',
  `Dirreccion_Usuario` varchar(40) NOT NULL COMMENT 'Dirección de recidencia del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD PRIMARY KEY (`Id_Carrito`),
  ADD KEY `carritocompras_Id_Usuarios` (`Id_Usuarios`),
  ADD KEY `Id_Productos` (`Id_Productos`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `envio`
--
ALTER TABLE `envio`
  ADD PRIMARY KEY (`Id_Envio`),
  ADD UNIQUE KEY `Id_Estados` (`Id_Estados`),
  ADD KEY `envio_Id_Pedido` (`Id_Pedido`),
  ADD KEY `envio_Id_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_Estados`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id_Pedido`),
  ADD KEY `pedidos_Id_Usuarios` (`Id_Usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD KEY `Id_Categoria` (`Id_Categoria`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_Proveedor`),
  ADD UNIQUE KEY `FK id_tipoProveedor` (`FK id_tipoProveedor`);

--
-- Indices de la tabla `tipo proveedor`
--
ALTER TABLE `tipo proveedor`
  ADD PRIMARY KEY (`id_tipoProveedor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_Estados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo proveedor`
--
ALTER TABLE `tipo proveedor`
  MODIFY `id_tipoProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritocompras`
--
ALTER TABLE `carritocompras`
  ADD CONSTRAINT `carritocompras_Id_Usuarios` FOREIGN KEY (`Id_Usuarios`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `carritocompras_ibfk_1` FOREIGN KEY (`Id_Productos`) REFERENCES `productos` (`Id_Producto`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `envio`
--
ALTER TABLE `envio`
  ADD CONSTRAINT `envio_Id_Pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedidos` (`Id_Pedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `envio_Id_Usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`Id_Estados`) REFERENCES `estados` (`id_Estados`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_Id_Usuarios` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedor` (`Id_Proveedor`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`FK id_tipoProveedor`) REFERENCES `tipo proveedor` (`id_tipoProveedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
