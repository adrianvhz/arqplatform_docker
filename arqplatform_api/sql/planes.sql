-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.9.1-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para db_arquitectura
CREATE DATABASE IF NOT EXISTS `db_arquitectura` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_arquitectura`;

-- Volcando estructura para tabla db_arquitectura.detailplanpermission
CREATE TABLE IF NOT EXISTS `detailplanpermission` (
  `idplan` int(11) DEFAULT NULL,
  `idpermiso` int(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  UNIQUE KEY `uc_plan_permiso` (`idplan`,`idpermiso`),
  UNIQUE KEY `detailplanpermission_idplan_idpermiso` (`idplan`,`idpermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_arquitectura.detailplanpermission: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `detailplanpermission` DISABLE KEYS */;
INSERT INTO `detailplanpermission` (`idplan`, `idpermiso`, `estado`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
	(1, 2, b'1', '2022-08-28 08:15:33', '2022-08-28 08:15:33', NULL),
	(1, 1, b'1', '2022-08-28 08:16:03', '2022-08-28 08:16:03', NULL),
	(7, 1, b'1', '2022-09-16 04:55:08', '2022-09-16 04:55:08', NULL),
	(7, 3, b'1', '2022-09-16 04:55:17', '2022-09-16 04:55:17', NULL),
	(8, 1, b'1', '2022-09-16 04:55:24', '2022-09-16 04:55:24', NULL),
	(8, 4, b'1', '2022-09-16 04:55:30', '2022-09-16 04:55:30', NULL);
/*!40000 ALTER TABLE `detailplanpermission` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_arquitectura.permisos: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` (`id`, `descripcion`, `estado`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
	(1, 'ACCESO ILIMITADO A TODOS A TODOS LOS COMANDOS DE TRABAJO', b'1', '2022-08-28 05:47:05', '2022-08-28 05:47:05', NULL),
	(2, 'VÁLIDO PARA UN SOLO USUARIO', b'1', '2022-08-28 05:47:56', '2022-08-28 05:47:56', NULL),
	(3, 'VÁLIDO PARA ACCESO DE CUATRO USUARIOS', b'1', '2022-09-16 04:54:00', '2022-09-16 04:54:00', NULL),
	(4, 'VÁLIDO PARA ACCESO DE 10 USUARIOS', b'1', '2022-09-16 04:54:13', '2022-09-16 04:54:13', NULL);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura.planes
CREATE TABLE IF NOT EXISTS `planes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  `vigencia` int(11) NOT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `defecto` bit(1) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla db_arquitectura.planes: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` (`id`, `descripcion`, `vigencia`, `precio`, `defecto`, `estado`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
	(1, 'SOLICITA UNA PRUEBA DEMO', 15, 0.00, b'1', b'1', '2022-08-28 05:37:54', '2022-08-28 05:37:54', NULL),
	(7, 'PLAN MENSUAL', 0, 80.00, b'0', b'1', '2022-09-16 04:53:08', '2022-09-16 04:53:08', NULL),
	(8, 'PLAN ANUAL', 0, 800.00, b'0', b'1', '2022-09-16 04:53:23', '2022-09-16 04:53:23', NULL);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sex` char(1) DEFAULT 'M',
  `profile_id` int(11) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `sex`, `profile_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'edgar', 'vasquez', 'evasquez@gmail.com', '$2a$10$.LNDWILbLKwOxKOwQtR6qup1Jn42AMqAAvsI7jqn/QI3QaDM.ys8W', NULL, 'M', 3, '2022-09-09 04:43:46', '2022-09-16 04:49:52', NULL),
	(2, 'edgar www', 'vasquez', 'wilsonew111@gmail.com', '$2a$10$3o0XMNdj9u9tqQcguT.xqe4NkfwftrNP9FlkXRM76MQUn/P3tgtXu', 'qqw23123zzqweqwe', 'M', 3, '2022-09-12 03:17:12', '2022-09-12 03:22:13', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
