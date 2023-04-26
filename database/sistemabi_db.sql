-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 26-04-2023 a las 20:48:29
-- Versión del servidor: 8.0.30
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemabi_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `ci`, `ci_exp`, `nit`, `fono`, `correo`, `dir`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'PEDRO MARTINEZ', '231231', 'LP', '', '', NULL, '', '2023-04-26', '2023-04-26 20:00:10', '2023-04-26 20:00:10'),
(2, 'MARIA GONZALES CASAS', '1231231', 'CB', '34324111', '666666; 7777777', 'MARIA@GMAIL.COM', 'LOS OLIVOS', '2023-04-26', '2023-04-26 20:05:20', '2023-04-26 20:05:50'),
(3, 'PABLO SANCHEZ', '43434', 'CB', '111111', '', '', '', '2023-04-26', '2023-04-26 20:07:17', '2023-04-26 20:07:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `nit`, `ciudad`, `dir`, `fono`, `web`, `actividad`, `correo`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SISTEMA DE INVENTARIO Y VENTAS', 'SISTEMABI', 'EMPRESA NUEVAERA', '10000000000', 'LA PAZ', 'LA PAZ', '222222', '', 'ACTIVIDAD', '', '1681583846_logo.webp', NULL, '2023-04-15 18:39:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `id` bigint UNSIGNED NOT NULL,
  `venta_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` double NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id`, `venta_id`, `producto_id`, `cantidad`, `precio`, `subtotal`, `created_at`, `updated_at`) VALUES
(5, 3, 1, 10, 20.00, 200.00, '2023-04-26 20:47:35', '2023-04-26 20:47:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE INGRESO', 'created_at: 2023-04-17 11:04:22<br/>descripcion: <br/>id: 1<br/>nombre: INGRESO TIPO 1<br/>updated_at: 2023-04-17 11:04:22<br/>', NULL, 'TIPO DE INGRESOS', '2023-04-17', '11:04:22', '2023-04-17 15:04:22', '2023-04-17 15:04:22'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN TIPO DE INGRESO', 'created_at: 2023-04-17 11:04:22<br/>descripcion: <br/>id: 1<br/>nombre: INGRESO TIPO 1<br/>updated_at: 2023-04-17 11:04:22<br/>', 'created_at: 2023-04-17 11:04:22<br/>descripcion: <br/>id: 1<br/>nombre: INGRESO TIPO 1ASD<br/>updated_at: 2023-04-17 11:04:25<br/>', 'TIPO DE INGRESOS', '2023-04-17', '11:04:25', '2023-04-17 15:04:25', '2023-04-17 15:04:25'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN TIPO DE INGRESO', 'created_at: 2023-04-17 11:04:22<br/>descripcion: <br/>id: 1<br/>nombre: INGRESO TIPO 1ASD<br/>updated_at: 2023-04-17 11:04:25<br/>', 'created_at: 2023-04-17 11:04:22<br/>descripcion: <br/>id: 1<br/>nombre: INGRESO TIPO 1<br/>updated_at: 2023-04-17 11:04:30<br/>', 'TIPO DE INGRESOS', '2023-04-17', '11:04:30', '2023-04-17 15:04:30', '2023-04-17 15:04:30'),
(4, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>correo: <br/>fono: 777777<br/>tipo: VENDEDOR<br/>foto: default.png<br/>password: $2y$10$ZTabc8GZiG/WlSL4nJbloe3WMay9P10kVUOlfsW/aFjhqzA9mi/jS<br/>acceso: 1<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 16:23:30<br/>updated_at: 2023-04-24 16:23:30<br/>', NULL, 'USUARIOS', '2023-04-24', '16:23:31', '2023-04-24 20:23:31', '2023-04-24 20:23:31'),
(5, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PROVEEDOR', 'id: 1<br/>razon_social: PEPE S.A.<br/>nit: 3333<br/>dir: <br/>fono: 777777<br/>nombre_contacto: JOSE PAREDES<br/>descripcion: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:09:13<br/>updated_at: 2023-04-24 17:09:13<br/>', NULL, 'PROVEEDORES', '2023-04-24', '17:09:13', '2023-04-24 21:09:13', '2023-04-24 21:09:13'),
(6, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PEPE S.A.<br/>nit: 3333<br/>dir: <br/>fono: 777777<br/>nombre_contacto: JOSE PAREDES<br/>descripcion: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:09:13<br/>updated_at: 2023-04-24 17:09:13<br/>', 'id: 1<br/>razon_social: PEPE S.A.S<br/>nit: 3333<br/>dir: <br/>fono: 777777<br/>nombre_contacto: JOSE PAREDES<br/>descripcion: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:09:13<br/>updated_at: 2023-04-24 17:09:17<br/>', 'PROVEEDORES', '2023-04-24', '17:09:17', '2023-04-24 21:09:17', '2023-04-24 21:09:17'),
(7, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PROVEEDOR', 'id: 1<br/>razon_social: PEPE S.A.S<br/>nit: 3333<br/>dir: <br/>fono: 777777<br/>nombre_contacto: JOSE PAREDES<br/>descripcion: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:09:13<br/>updated_at: 2023-04-24 17:09:17<br/>', 'id: 1<br/>razon_social: PEPE S.A.<br/>nit: 3333<br/>dir: <br/>fono: 777777<br/>nombre_contacto: JOSE PAREDES<br/>descripcion: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:09:13<br/>updated_at: 2023-04-24 17:09:20<br/>', 'PROVEEDORES', '2023-04-24', '17:09:20', '2023-04-24 21:09:20', '2023-04-24 21:09:20'),
(8, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 1<br/>codigo_almacen: A001<br/>codigo_producto: P001<br/>nombre: PASTILLAS A<br/>descripcion: <br/>precio: 20<br/>stock_min: 10<br/>stock_actual: 0<br/>imagen: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:36:20<br/>updated_at: 2023-04-24 17:36:20<br/>', NULL, 'PRODUCTOS', '2023-04-24', '17:36:20', '2023-04-24 21:36:20', '2023-04-24 21:36:20'),
(9, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 2<br/>codigo_almacen: A001<br/>codigo_producto: P002<br/>nombre: GEL ANTIBACTERIAL<br/>descripcion: <br/>precio: 35<br/>stock_min: 5<br/>stock_actual: 0<br/>imagen: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:44:24<br/>updated_at: 2023-04-24 17:44:24<br/>', NULL, 'PRODUCTOS', '2023-04-24', '17:44:24', '2023-04-24 21:44:24', '2023-04-24 21:44:24'),
(10, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 3<br/>codigo_almacen: A001<br/>codigo_producto: P003<br/>nombre: PRODUCTO 3<br/>descripcion: <br/>precio: 100<br/>stock_min: 10<br/>stock_actual: 0<br/>imagen: <br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:45:17<br/>updated_at: 2023-04-24 17:45:17<br/>', NULL, 'PRODUCTOS', '2023-04-24', '17:45:17', '2023-04-24 21:45:17', '2023-04-24 21:45:17'),
(11, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 4<br/>codigo_almacen: ASD<br/>codigo_producto: ADS<br/>nombre: ASD<br/>descripcion: <br/>precio: 12<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372735_4.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:45:35<br/>updated_at: 2023-04-24 17:45:35<br/>', NULL, 'PRODUCTOS', '2023-04-24', '17:45:35', '2023-04-24 21:45:35', '2023-04-24 21:45:35'),
(12, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 5<br/>codigo_almacen: ASD<br/>codigo_producto: ASD<br/>nombre: ASDAS<br/>descripcion: <br/>precio: 12<br/>stock_min: 2<br/>stock_actual: 0<br/>imagen: 1682372808_5.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:46:48<br/>updated_at: 2023-04-24 17:46:48<br/>', NULL, 'PRODUCTOS', '2023-04-24', '17:46:48', '2023-04-24 21:46:48', '2023-04-24 21:46:48'),
(13, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 6<br/>codigo_almacen: AS<br/>codigo_producto: DASD<br/>nombre: ASD<br/>descripcion: AS<br/>precio: 12<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372843_6.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:23<br/>updated_at: 2023-04-24 17:47:23<br/>', NULL, 'PRODUCTOS', '2023-04-24', '17:47:23', '2023-04-24 21:47:23', '2023-04-24 21:47:23'),
(14, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PRODUCTO', 'id: 6<br/>codigo_almacen: AS<br/>codigo_producto: DASD<br/>nombre: ASD<br/>descripcion: AS<br/>precio: 12.00<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372843_6.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:23<br/>updated_at: 2023-04-24 17:47:23<br/>', 'id: 6<br/>codigo_almacen: AS<br/>codigo_producto: DASD<br/>nombre: ASD<br/>descripcion: AS<br/>precio: 12.00<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372848_6.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:23<br/>updated_at: 2023-04-24 17:47:28<br/>', 'PRODUCTOS', '2023-04-24', '17:47:28', '2023-04-24 21:47:28', '2023-04-24 21:47:28'),
(15, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN PRODUCTO', 'id: 7<br/>codigo_almacen: ASD<br/>codigo_producto: ASD<br/>nombre: ASD<br/>descripcion: ASD<br/>precio: 12<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372874_7.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:54<br/>updated_at: 2023-04-24 17:47:54<br/>', NULL, 'PRODUCTOS', '2023-04-24', '17:47:54', '2023-04-24 21:47:54', '2023-04-24 21:47:54'),
(16, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PRODUCTO', 'id: 7<br/>codigo_almacen: ASD<br/>codigo_producto: ASD<br/>nombre: ASD<br/>descripcion: ASD<br/>precio: 12.00<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372874_7.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:54<br/>updated_at: 2023-04-24 17:47:54<br/>', 'id: 7<br/>codigo_almacen: ASD<br/>codigo_producto: ASD<br/>nombre: ASD<br/>descripcion: ASD<br/>precio: 12.00<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372879_7.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:54<br/>updated_at: 2023-04-24 17:47:59<br/>', 'PRODUCTOS', '2023-04-24', '17:47:59', '2023-04-24 21:47:59', '2023-04-24 21:47:59'),
(17, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE INGRESO', 'created_at: 2023-04-25 10:37:56<br/>descripcion: <br/>id: 2<br/>nombre: TIPO INGRESO 2<br/>updated_at: 2023-04-25 10:37:56<br/>', NULL, 'TIPO DE INGRESOS', '2023-04-25', '10:37:57', '2023-04-25 14:37:57', '2023-04-25 14:37:57'),
(18, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN TIPO DE INGRESO', 'created_at: 2023-04-25 10:37:56<br/>descripcion: <br/>id: 2<br/>nombre: TIPO INGRESO 2<br/>updated_at: 2023-04-25 10:37:56<br/>', 'created_at: 2023-04-25 10:37:56<br/>descripcion: ASD<br/>id: 2<br/>nombre: TIPO INGRESO 2<br/>updated_at: 2023-04-25 10:38:00<br/>', 'TIPO DE INGRESOS', '2023-04-25', '10:38:00', '2023-04-25 14:38:00', '2023-04-25 14:38:00'),
(19, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN TIPO DE INGRESO', 'created_at: 2023-04-25 10:37:56<br/>descripcion: ASD<br/>id: 2<br/>nombre: TIPO INGRESO 2<br/>updated_at: 2023-04-25 10:38:00<br/>', 'created_at: 2023-04-25 10:37:56<br/>descripcion: <br/>id: 2<br/>nombre: TIPO INGRESO 2<br/>updated_at: 2023-04-25 10:38:04<br/>', 'TIPO DE INGRESOS', '2023-04-25', '10:38:04', '2023-04-25 14:38:04', '2023-04-25 14:38:04'),
(20, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE INGRESO', 'created_at: 2023-04-25 10:38:08<br/>descripcion: ASD<br/>id: 3<br/>nombre: ASD<br/>updated_at: 2023-04-25 10:38:08<br/>', NULL, 'TIPO DE INGRESOS', '2023-04-25', '10:38:08', '2023-04-25 14:38:08', '2023-04-25 14:38:08'),
(21, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN TIPO DE INGRESO', 'created_at: 2023-04-25 10:38:08<br/>descripcion: ASD<br/>id: 3<br/>nombre: ASD<br/>updated_at: 2023-04-25 10:38:08<br/>', NULL, 'TIPO DE INGRESOS', '2023-04-25', '10:38:10', '2023-04-25 14:38:10', '2023-04-25 14:38:10'),
(22, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE SALIDA', 'created_at: 2023-04-25 10:38:16<br/>descripcion: <br/>id: 1<br/>nombre: SALIDA 1<br/>updated_at: 2023-04-25 10:38:16<br/>', NULL, 'TIPO DE SALIDAS', '2023-04-25', '10:38:16', '2023-04-25 14:38:16', '2023-04-25 14:38:16'),
(23, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE SALIDA', 'created_at: 2023-04-25 10:38:21<br/>descripcion: <br/>id: 2<br/>nombre: TIPO DE SALIDA 2<br/>updated_at: 2023-04-25 10:38:21<br/>', NULL, 'TIPO DE SALIDAS', '2023-04-25', '10:38:21', '2023-04-25 14:38:21', '2023-04-25 14:38:21'),
(24, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN TIPO DE SALIDA', 'created_at: 2023-04-25 10:38:21<br/>descripcion: <br/>id: 2<br/>nombre: TIPO DE SALIDA 2<br/>updated_at: 2023-04-25 10:38:21<br/>', 'created_at: 2023-04-25 10:38:21<br/>descripcion: ASD<br/>id: 2<br/>nombre: TIPO DE SALIDA 2<br/>updated_at: 2023-04-25 10:38:23<br/>', 'TIPO DE SALIDAS', '2023-04-25', '10:38:23', '2023-04-25 14:38:23', '2023-04-25 14:38:23'),
(25, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN TIPO DE SALIDA', 'created_at: 2023-04-25 10:38:27<br/>descripcion: ASD<br/>id: 3<br/>nombre: ASD<br/>updated_at: 2023-04-25 10:38:27<br/>', NULL, 'TIPO DE SALIDAS', '2023-04-25', '10:38:27', '2023-04-25 14:38:27', '2023-04-25 14:38:27'),
(26, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UN TIPO DE SALIDA', 'created_at: 2023-04-25 10:38:27<br/>descripcion: ASD<br/>id: 3<br/>nombre: ASD<br/>updated_at: 2023-04-25 10:38:27<br/>', NULL, 'TIPO DE SALIDAS', '2023-04-25', '10:38:31', '2023-04-25 14:38:31', '2023-04-25 14:38:31'),
(27, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN TIPO DE SALIDA', 'created_at: 2023-04-25 10:38:21<br/>descripcion: ASD<br/>id: 2<br/>nombre: TIPO DE SALIDA 2<br/>updated_at: 2023-04-25 10:38:23<br/>', 'created_at: 2023-04-25 10:38:21<br/>descripcion: <br/>id: 2<br/>nombre: TIPO DE SALIDA 2<br/>updated_at: 2023-04-25 10:38:35<br/>', 'TIPO DE SALIDAS', '2023-04-25', '10:38:35', '2023-04-25 14:38:35', '2023-04-25 14:38:35'),
(28, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO DE PRODUCTO', 'cantidad: 100<br/>created_at: 2023-04-25 11:23:41<br/>descripcion: <br/>fecha_caducidad: 2025-02-02<br/>fecha_fabricacion: 2023-02-02<br/>fecha_registro: 2023-04-25<br/>id: 1<br/>lote: 1<br/>precio_compra: 20<br/>producto_id: 1<br/>proveedor_id: 1<br/>tipo_ingreso_id: 1<br/>updated_at: 2023-04-25 11:23:41<br/>', NULL, 'INGRESO DE PRODUCTOS', '2023-04-25', '11:23:41', '2023-04-25 15:23:41', '2023-04-25 15:23:41'),
(29, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO DE PRODUCTO', 'cantidad: 100<br/>created_at: 2023-04-25 11:25:58<br/>descripcion: <br/>fecha_caducidad: 2024-04-25<br/>fecha_fabricacion: 2023-04-25<br/>fecha_registro: 2023-04-25<br/>id: 2<br/>lote: 2<br/>precio_compra: 30<br/>producto_id: 2<br/>proveedor_id: 1<br/>tipo_ingreso_id: 2<br/>updated_at: 2023-04-25 11:25:58<br/>', NULL, 'INGRESO DE PRODUCTOS', '2023-04-25', '11:25:58', '2023-04-25 15:25:58', '2023-04-25 15:25:58'),
(30, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN INGRESO DE PRODUCTO', 'cantidad: 50<br/>created_at: 2023-04-25 11:28:29<br/>descripcion: <br/>fecha_caducidad: 2026-03-03<br/>fecha_fabricacion: 2023-03-03<br/>fecha_registro: 2023-04-25<br/>id: 3<br/>lote: 3<br/>precio_compra: 100<br/>producto_id: 3<br/>proveedor_id: 1<br/>tipo_ingreso_id: 1<br/>updated_at: 2023-04-25 11:28:29<br/>', NULL, 'INGRESO DE PRODUCTOS', '2023-04-25', '11:28:30', '2023-04-25 15:28:30', '2023-04-25 15:28:30'),
(31, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN INGRESO DE PRODUCTO', 'cantidad: 50<br/>created_at: 2023-04-25 11:28:29<br/>descripcion: <br/>fecha_caducidad: 2026-03-03<br/>fecha_fabricacion: 2023-03-03<br/>fecha_registro: 2023-04-25<br/>id: 3<br/>lote: 3<br/>precio_compra: 100.00<br/>producto_id: 3<br/>proveedor_id: 1<br/>tipo_ingreso_id: 1<br/>updated_at: 2023-04-25 11:28:29<br/>', 'cantidad: 70<br/>created_at: 2023-04-25 11:28:29<br/>descripcion: <br/>fecha_caducidad: 2026-03-03<br/>fecha_fabricacion: 2023-03-03<br/>fecha_registro: 2023-04-25<br/>id: 3<br/>lote: 3<br/>precio_compra: 100.00<br/>producto_id: 3<br/>proveedor_id: 1<br/>tipo_ingreso_id: 1<br/>updated_at: 2023-04-25 11:31:20<br/>', 'INGRESO DE PRODUCTOS', '2023-04-25', '11:31:20', '2023-04-25 15:31:20', '2023-04-25 15:31:20'),
(32, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SALIDA DE PRODUCTO', 'cantidad: 1<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:43:36<br/>', NULL, 'SALIDA DE PRODUCTOS', '2023-04-25', '15:43:36', '2023-04-25 19:43:36', '2023-04-25 19:43:36'),
(33, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA SALIDA DE PRODUCTO', 'cantidad: 1<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:43:36<br/>', 'cantidad: 5<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:43:51<br/>', 'SALIDA DE PRODUCTOS', '2023-04-25', '15:43:51', '2023-04-25 19:43:51', '2023-04-25 19:43:51'),
(34, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA SALIDA DE PRODUCTO', 'cantidad: 5<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:43:51<br/>', 'cantidad: 2<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:45:43<br/>', 'SALIDA DE PRODUCTOS', '2023-04-25', '15:45:43', '2023-04-25 19:45:43', '2023-04-25 19:45:43'),
(35, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SALIDA DE PRODUCTO', 'cantidad: 1<br/>created_at: 2023-04-25 15:46:09<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 2<br/>producto_id: 1<br/>tipo_salida_id: 2<br/>updated_at: 2023-04-25 15:46:09<br/>', NULL, 'SALIDA DE PRODUCTOS', '2023-04-25', '15:46:09', '2023-04-25 19:46:09', '2023-04-25 19:46:09'),
(36, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA SALIDA DE PRODUCTO', 'cantidad: 2<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:45:43<br/>', 'cantidad: 2<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-24<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:46:12<br/>', 'SALIDA DE PRODUCTOS', '2023-04-25', '15:46:12', '2023-04-25 19:46:12', '2023-04-25 19:46:12'),
(37, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA SALIDA DE PRODUCTO', 'cantidad: 2<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-24<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:46:12<br/>', 'cantidad: 1<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-24<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:46:26<br/>', 'SALIDA DE PRODUCTOS', '2023-04-25', '15:46:26', '2023-04-25 19:46:26', '2023-04-25 19:46:26'),
(38, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA SALIDA DE PRODUCTO', 'cantidad: 1<br/>created_at: 2023-04-25 15:46:09<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 2<br/>producto_id: 1<br/>tipo_salida_id: 2<br/>updated_at: 2023-04-25 15:46:09<br/>', NULL, 'SALIDA DE PRODUCTOS', '2023-04-25', '15:46:51', '2023-04-25 19:46:51', '2023-04-25 19:46:51'),
(39, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA SALIDA DE PRODUCTO', 'cantidad: 2<br/>created_at: 2023-04-25 15:47:12<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 3<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:47:12<br/>', NULL, 'SALIDA DE PRODUCTOS', '2023-04-25', '15:47:12', '2023-04-25 19:47:12', '2023-04-25 19:47:12'),
(40, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA SALIDA DE PRODUCTO', 'cantidad: 1<br/>created_at: 2023-04-25 15:43:36<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-24<br/>id: 1<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:46:26<br/>', NULL, 'SALIDA DE PRODUCTOS', '2023-04-25', '15:47:17', '2023-04-25 19:47:17', '2023-04-25 19:47:17'),
(41, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CLIENTE', 'ci: 231231<br/>ci_exp: LP<br/>correo: <br/>created_at: 2023-04-26 16:00:10<br/>dir: <br/>fecha_registro: 2023-04-26<br/>fono: <br/>id: 1<br/>nit: <br/>nombre: PEDRO MARTINEZ<br/>updated_at: 2023-04-26 16:00:10<br/>', NULL, 'CLIENTES', '2023-04-26', '16:00:10', '2023-04-26 20:00:10', '2023-04-26 20:00:10'),
(42, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CLIENTE', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777; 22222<br/>id: 2<br/>nit: 34324242<br/>nombre: MARIA GONZALES<br/>updated_at: 2023-04-26 16:05:20<br/>', NULL, 'CLIENTES', '2023-04-26', '16:05:20', '2023-04-26 20:05:20', '2023-04-26 20:05:20'),
(43, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777; 22222<br/>id: 2<br/>nit: 34324242<br/>nombre: MARIA GONZALES<br/>updated_at: 2023-04-26 16:05:20<br/>', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324242<br/>nombre: MARIA GONZALES<br/>updated_at: 2023-04-26 16:05:32<br/>', 'CLIENTES', '2023-04-26', '16:05:32', '2023-04-26 20:05:32', '2023-04-26 20:05:32'),
(44, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324242<br/>nombre: MARIA GONZALES<br/>updated_at: 2023-04-26 16:05:32<br/>', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324111<br/>nombre: MARIA GONZALES<br/>updated_at: 2023-04-26 16:05:38<br/>', 'CLIENTES', '2023-04-26', '16:05:38', '2023-04-26 20:05:38', '2023-04-26 20:05:38'),
(45, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324111<br/>nombre: MARIA GONZALES<br/>updated_at: 2023-04-26 16:05:38<br/>', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324111<br/>nombre: MARIA GONZALES MAMANI<br/>updated_at: 2023-04-26 16:05:42<br/>', 'CLIENTES', '2023-04-26', '16:05:42', '2023-04-26 20:05:42', '2023-04-26 20:05:42'),
(46, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'ci: 1231231<br/>ci_exp: LP<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324111<br/>nombre: MARIA GONZALES MAMANI<br/>updated_at: 2023-04-26 16:05:42<br/>', 'ci: 1231231<br/>ci_exp: CB<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324111<br/>nombre: MARIA GONZALES MAMANI<br/>updated_at: 2023-04-26 16:05:45<br/>', 'CLIENTES', '2023-04-26', '16:05:45', '2023-04-26 20:05:45', '2023-04-26 20:05:45'),
(47, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN CLIENTE', 'ci: 1231231<br/>ci_exp: CB<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324111<br/>nombre: MARIA GONZALES MAMANI<br/>updated_at: 2023-04-26 16:05:45<br/>', 'ci: 1231231<br/>ci_exp: CB<br/>correo: MARIA@GMAIL.COM<br/>created_at: 2023-04-26 16:05:20<br/>dir: LOS OLIVOS<br/>fecha_registro: 2023-04-26<br/>fono: 666666; 7777777<br/>id: 2<br/>nit: 34324111<br/>nombre: MARIA GONZALES CASAS<br/>updated_at: 2023-04-26 16:05:50<br/>', 'CLIENTES', '2023-04-26', '16:05:50', '2023-04-26 20:05:50', '2023-04-26 20:05:50'),
(48, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UN CLIENTE', 'ci: 43434<br/>ci_exp: CB<br/>correo: <br/>created_at: 2023-04-26 16:07:17<br/>dir: <br/>fecha_registro: 2023-04-26<br/>fono: <br/>id: 3<br/>nit: 111111<br/>nombre: PABLO SANCHEZ<br/>updated_at: 2023-04-26 16:07:17<br/>', NULL, 'CLIENTES', '2023-04-26', '16:07:17', '2023-04-26 20:07:17', '2023-04-26 20:07:17'),
(49, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ORDEN DE VENTA', '', NULL, 'ORDEN DE VENTA', '2023-04-26', '16:29:21', '2023-04-26 20:29:21', '2023-04-26 20:29:21'),
(50, 1, 'CREACIÓN', 'EL USUARIO admin REGISTRO UNA ORDEN DE VENTA', 'cliente_id: 2<br/>created_at: 2023-04-26 16:37:59<br/>descuento: 10<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 4<br/>nit: 1231231<br/>total: 310.00<br/>total_final: 279.00<br/>updated_at: 2023-04-26 16:37:59<br/>user_id: 1<br/>', NULL, 'ORDEN DE VENTA', '2023-04-26', '16:37:59', '2023-04-26 20:37:59', '2023-04-26 20:37:59'),
(51, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ORDEN DE VENTA', 'cliente_id: 2<br/>created_at: 2023-04-26 16:37:59<br/>descuento: 10<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 4<br/>nit: 1231231<br/>total: 310.00<br/>total_final: 279.00<br/>updated_at: 2023-04-26 16:37:59<br/>user_id: 1<br/>', 'cliente_id: 2<br/>created_at: 2023-04-26 16:37:59<br/>descuento: 10<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 4<br/>nit: 1231231<br/>total: 330.00<br/>total_final: 297.00<br/>updated_at: 2023-04-26 16:43:06<br/>user_id: 1<br/>', 'ORDEN DE VENTA', '2023-04-26', '16:43:06', '2023-04-26 20:43:06', '2023-04-26 20:43:06'),
(52, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ORDEN DE VENTA', 'cliente_id: 2<br/>created_at: 2023-04-26 16:37:59<br/>descuento: 10<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 4<br/>nit: 1231231<br/>total: 330.00<br/>total_final: 297.00<br/>updated_at: 2023-04-26 16:43:06<br/>user_id: 1<br/>', 'cliente_id: 2<br/>created_at: 2023-04-26 16:37:59<br/>descuento: 10<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 4<br/>nit: 1231231<br/>total: 310.00<br/>total_final: 279.00<br/>updated_at: 2023-04-26 16:43:28<br/>user_id: 1<br/>', 'ORDEN DE VENTA', '2023-04-26', '16:43:28', '2023-04-26 20:43:28', '2023-04-26 20:43:28'),
(53, 1, 'ELIMINACIÓN', 'EL USUARIO admin ELIMINÓ UNA ORDEN DE VENTA', 'cliente_id: 2<br/>created_at: 2023-04-26 16:37:59<br/>descuento: 10<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 4<br/>nit: 1231231<br/>total: 310.00<br/>total_final: 279.00<br/>updated_at: 2023-04-26 16:43:28<br/>user_id: 1<br/>', NULL, 'ORDEN DE VENTA', '2023-04-26', '16:45:18', '2023-04-26 20:45:18', '2023-04-26 20:45:18'),
(54, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA SALIDA DE PRODUCTO', 'cantidad: 2<br/>created_at: 2023-04-25 15:47:12<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 3<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-25 15:47:12<br/>', 'cantidad: 3<br/>created_at: 2023-04-25 15:47:12<br/>descripcion: <br/>fecha_registro: 2023-04-25<br/>fecha_salida: 2023-04-25<br/>id: 3<br/>producto_id: 1<br/>tipo_salida_id: 1<br/>updated_at: 2023-04-26 16:46:46<br/>', 'SALIDA DE PRODUCTOS', '2023-04-26', '16:46:46', '2023-04-26 20:46:46', '2023-04-26 20:46:46'),
(55, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ORDEN DE VENTA', 'cliente_id: 1<br/>created_at: 2023-04-26 16:29:21<br/>descuento: 0<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 3<br/>nit: 231231<br/>total: 80.00<br/>total_final: 80.00<br/>updated_at: 2023-04-26 16:29:21<br/>user_id: 1<br/>', 'cliente_id: 1<br/>created_at: 2023-04-26 16:29:21<br/>descuento: 0<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 3<br/>nit: 231231<br/>total: 0.00<br/>total_final: 80.00<br/>updated_at: 2023-04-26 16:47:13<br/>user_id: 1<br/>', 'ORDEN DE VENTA', '2023-04-26', '16:47:13', '2023-04-26 20:47:13', '2023-04-26 20:47:13'),
(56, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UNA ORDEN DE VENTA', 'cliente_id: 1<br/>created_at: 2023-04-26 16:29:21<br/>descuento: 0<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 3<br/>nit: 231231<br/>total: 0.00<br/>total_final: 80.00<br/>updated_at: 2023-04-26 16:47:13<br/>user_id: 1<br/>', 'cliente_id: 1<br/>created_at: 2023-04-26 16:29:21<br/>descuento: 0<br/>estado: CANCELADO<br/>fecha_registro: 2023-04-26<br/>id: 3<br/>nit: 231231<br/>total: 200.00<br/>total_final: 80.00<br/>updated_at: 2023-04-26 16:47:35<br/>user_id: 1<br/>', 'ORDEN DE VENTA', '2023-04-26', '16:47:35', '2023-04-26 20:47:35', '2023-04-26 20:47:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_productos`
--

CREATE TABLE `ingreso_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `proveedor_id` bigint UNSIGNED NOT NULL,
  `precio_compra` decimal(8,2) NOT NULL,
  `cantidad` double NOT NULL,
  `lote` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_fabricacion` date NOT NULL,
  `fecha_caducidad` date NOT NULL,
  `tipo_ingreso_id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ingreso_productos`
--

INSERT INTO `ingreso_productos` (`id`, `producto_id`, `proveedor_id`, `precio_compra`, `cantidad`, `lote`, `fecha_fabricacion`, `fecha_caducidad`, `tipo_ingreso_id`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 20.00, 100, '1', '2023-02-02', '2025-02-02', 1, '', '2023-04-25', '2023-04-25 15:23:41', '2023-04-25 15:23:41'),
(2, 2, 1, 30.00, 100, '2', '2023-04-25', '2024-04-25', 2, '', '2023-04-25', '2023-04-25 15:25:58', '2023-04-25 15:25:58'),
(3, 3, 1, 100.00, 70, '3', '2023-03-03', '2026-03-03', 1, '', '2023-04-25', '2023-04-25 15:28:29', '2023-04-25 15:31:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex_productos`
--

CREATE TABLE `kardex_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `lugar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_registro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` bigint UNSIGNED DEFAULT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `detalle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `tipo_is` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad_ingreso` double DEFAULT NULL,
  `cantidad_salida` double DEFAULT NULL,
  `cantidad_saldo` double NOT NULL,
  `cu` decimal(24,2) NOT NULL,
  `monto_ingreso` decimal(24,2) DEFAULT NULL,
  `monto_salida` decimal(24,2) DEFAULT NULL,
  `monto_saldo` decimal(24,2) NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `kardex_productos`
--

INSERT INTO `kardex_productos` (`id`, `lugar`, `tipo_registro`, `registro_id`, `producto_id`, `detalle`, `precio`, `tipo_is`, `cantidad_ingreso`, `cantidad_salida`, `cantidad_saldo`, `cu`, `monto_ingreso`, `monto_salida`, `monto_saldo`, `fecha`, `created_at`, `updated_at`) VALUES
(1, NULL, 'INGRESO', 1, 1, 'VALOR INICIAL', 20.00, 'INGRESO', 100, NULL, 100, 20.00, 2000.00, NULL, 2000.00, '2023-04-25', '2023-04-25 15:23:41', '2023-04-25 19:47:17'),
(2, NULL, 'INGRESO', 2, 2, 'VALOR INICIAL', 35.00, 'INGRESO', 100, NULL, 100, 35.00, 3500.00, NULL, 3500.00, '2023-04-25', '2023-04-25 15:25:58', '2023-04-26 20:45:18'),
(3, NULL, 'INGRESO', 3, 3, 'VALOR INICIAL', 100.00, 'INGRESO', 70, NULL, 70, 100.00, 7000.00, NULL, 7000.00, '2023-04-25', '2023-04-25 15:28:29', '2023-04-26 20:45:18'),
(6, NULL, 'SALIDA', 3, 1, 'SALIDA DE PRODUCTO', 20.00, 'EGRESO', NULL, 3, 97, 20.00, NULL, 60.00, 1940.00, '2023-04-25', '2023-04-25 19:47:12', '2023-04-26 20:47:13'),
(11, NULL, 'VENTA', 5, 1, 'VENTA DE PRODUCTO', 20.00, 'EGRESO', NULL, 10, 87, 20.00, NULL, 200.00, 1740.00, '2023-04-26', '2023-04-26 20:47:35', '2023-04-26 20:47:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint UNSIGNED NOT NULL,
  `codigo_almacen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_producto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `precio` decimal(24,2) NOT NULL,
  `stock_min` double NOT NULL,
  `stock_actual` double NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo_almacen`, `codigo_producto`, `nombre`, `descripcion`, `precio`, `stock_min`, `stock_actual`, `imagen`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'A001', 'P001', 'PASTILLAS A', '', 20.00, 10, 87, NULL, '2023-04-24', '2023-04-24 21:36:20', '2023-04-26 20:47:35'),
(2, 'A001', 'P002', 'GEL ANTIBACTERIAL', '', 35.00, 5, 100, NULL, '2023-04-24', '2023-04-24 21:44:24', '2023-04-26 20:45:18'),
(3, 'A001', 'P003', 'PRODUCTO 3', '', 100.00, 10, 70, NULL, '2023-04-24', '2023-04-24 21:45:17', '2023-04-26 20:45:18'),
(7, 'ASD', 'ASD', 'ASD', 'ASD', 12.00, 12, 0, '1682372879_7.jpg', '2023-04-24', '2023-04-24 21:47:54', '2023-04-24 21:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedors`
--

CREATE TABLE `proveedors` (
  `id` bigint UNSIGNED NOT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_contacto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proveedors`
--

INSERT INTO `proveedors` (`id`, `razon_social`, `nit`, `dir`, `fono`, `nombre_contacto`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'PEPE S.A.', '3333', '', '777777', 'JOSE PAREDES', '', '2023-04-24', '2023-04-24 21:09:13', '2023-04-24 21:09:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida_productos`
--

CREATE TABLE `salida_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `tipo_salida_id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salida_productos`
--

INSERT INTO `salida_productos` (`id`, `producto_id`, `cantidad`, `fecha_salida`, `tipo_salida_id`, `descripcion`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(3, 1, 3, '2023-04-25', 1, '', '2023-04-25', '2023-04-25 19:47:12', '2023-04-26 20:46:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_ingresos`
--

CREATE TABLE `tipo_ingresos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_ingresos`
--

INSERT INTO `tipo_ingresos` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'INGRESO TIPO 1', '', '2023-04-17 15:04:22', '2023-04-17 15:04:30'),
(2, 'TIPO INGRESO 2', '', '2023-04-25 14:37:56', '2023-04-25 14:38:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_salidas`
--

CREATE TABLE `tipo_salidas` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_salidas`
--

INSERT INTO `tipo_salidas` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'SALIDA 1', '', '2023-04-25 14:38:16', '2023-04-25 14:38:16'),
(2, 'TIPO DE SALIDA 2', '', '2023-04-25 14:38:21', '2023-04-25 14:38:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('ADMINISTRADOR','GERENCIA','SUPERVISOR','VENDEDOR') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceso` int NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `correo`, `fono`, `tipo`, `foto`, `password`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin', NULL, '', '', '', NULL, '', 'ADMINISTRADOR', NULL, '$2y$10$RrCZZySOwPej2gMFWsrjMe6dLzfaL5Q88h4J75I1FesEBRNPwq1x.', 1, '2023-01-11', NULL, NULL),
(2, 'JPERES', 'JUAN', 'PERES', 'MAMANI', '1234', 'LP', 'LOS OLIVOS', '', '777777', 'VENDEDOR', 'default.png', '$2y$10$ZTabc8GZiG/WlSL4nJbloe3WMay9P10kVUOlfsW/aFjhqzA9mi/jS', 1, '2023-04-24', '2023-04-24 20:23:30', '2023-04-24 20:23:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `nit` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `descuento` double(8,2) NOT NULL,
  `total_final` decimal(24,2) NOT NULL,
  `estado` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `user_id`, `cliente_id`, `nit`, `total`, `descuento`, `total_final`, `estado`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '231231', 200.00, 0.00, 80.00, 'CANCELADO', '2023-04-26', '2023-04-26 20:29:21', '2023-04-26 20:47:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ordens_orden_id_foreign` (`venta_id`),
  ADD KEY `detalle_ordens_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingreso_productos_producto_id_foreign` (`producto_id`),
  ADD KEY `ingreso_productos_proveedor_id_foreign` (`proveedor_id`),
  ADD KEY `ingreso_productos_tipo_ingreso_id_foreign` (`tipo_ingreso_id`);

--
-- Indices de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kardex_productos_producto_id_foreign` (`producto_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salida_productos_producto_id_foreign` (`producto_id`),
  ADD KEY `salida_productos_tipo_salida_id_foreign` (`tipo_salida_id`);

--
-- Indices de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_ventas_cliente_id_foreign` (`cliente_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `proveedors`
--
ALTER TABLE `proveedors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `salida_productos`
--
ALTER TABLE `salida_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
