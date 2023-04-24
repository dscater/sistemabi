-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-04-2023 a las 21:49:11
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
  `dir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Estructura de tabla para la tabla `detalle_ordens`
--

CREATE TABLE `detalle_ordens` (
  `id` bigint UNSIGNED NOT NULL,
  `orden_id` bigint UNSIGNED NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `sucursal_stock_id` bigint UNSIGNED NOT NULL,
  `cantidad` int NOT NULL,
  `venta_mayor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(24,2) NOT NULL,
  `subtotal` decimal(24,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(16, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN PRODUCTO', 'id: 7<br/>codigo_almacen: ASD<br/>codigo_producto: ASD<br/>nombre: ASD<br/>descripcion: ASD<br/>precio: 12.00<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372874_7.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:54<br/>updated_at: 2023-04-24 17:47:54<br/>', 'id: 7<br/>codigo_almacen: ASD<br/>codigo_producto: ASD<br/>nombre: ASD<br/>descripcion: ASD<br/>precio: 12.00<br/>stock_min: 12<br/>stock_actual: 0<br/>imagen: 1682372879_7.jpg<br/>fecha_registro: 2023-04-24<br/>created_at: 2023-04-24 17:47:54<br/>updated_at: 2023-04-24 17:47:59<br/>', 'PRODUCTOS', '2023-04-24', '17:47:59', '2023-04-24 21:47:59', '2023-04-24 21:47:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_productos`
--

CREATE TABLE `ingreso_productos` (
  `id` bigint UNSIGNED NOT NULL,
  `lugar` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `proveedor_id` bigint UNSIGNED NOT NULL,
  `precio_compra` decimal(8,2) NOT NULL,
  `cantidad` int NOT NULL,
  `tipo_ingreso_id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'A001', 'P001', 'PASTILLAS A', '', 20.00, 10, 0, NULL, '2023-04-24', '2023-04-24 21:36:20', '2023-04-24 21:36:20'),
(2, 'A001', 'P002', 'GEL ANTIBACTERIAL', '', 35.00, 5, 0, NULL, '2023-04-24', '2023-04-24 21:44:24', '2023-04-24 21:44:24'),
(3, 'A001', 'P003', 'PRODUCTO 3', '', 100.00, 10, 0, NULL, '2023-04-24', '2023-04-24 21:45:17', '2023-04-24 21:45:17'),
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
  `lugar` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_id` bigint UNSIGNED NOT NULL,
  `cantidad` int NOT NULL,
  `tipo_salida_id` bigint UNSIGNED NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'INGRESO TIPO 1', '', '2023-04-17 15:04:22', '2023-04-17 15:04:30');

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
  `caja_id` bigint UNSIGNED NOT NULL,
  `cliente_id` bigint UNSIGNED NOT NULL,
  `nit` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(24,2) NOT NULL,
  `descuento` double(8,2) NOT NULL,
  `total_final` decimal(24,2) NOT NULL,
  `tipo_venta` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(155) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indices de la tabla `detalle_ordens`
--
ALTER TABLE `detalle_ordens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_ordens_orden_id_foreign` (`orden_id`),
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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_ordens`
--
ALTER TABLE `detalle_ordens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardex_productos`
--
ALTER TABLE `kardex_productos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_ingresos`
--
ALTER TABLE `tipo_ingresos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipo_salidas`
--
ALTER TABLE `tipo_salidas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
