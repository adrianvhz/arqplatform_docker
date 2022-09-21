-- --------------------------------------------------------
-- Host:                         3.16.106.121
-- Versión del servidor:         10.4.13-MariaDB - MariaDB Server
-- SO del servidor:              Linux
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla db_arquitectura_design.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.companies: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Prodesign', NULL, '2021-11-25 13:25:44', '2021-11-25 13:25:44', NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.levels
CREATE TABLE IF NOT EXISTS `levels` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.levels: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'inicial', 1, '2022-01-03 12:54:24', '2022-01-03 12:54:39', NULL),
	(2, 'primaria', 1, '2022-01-03 12:54:29', '2022-01-03 12:54:40', NULL),
	(3, 'secundaria', 1, '2022-01-03 12:54:36', '2022-01-03 12:54:40', NULL);
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.levels_zones
CREATE TABLE IF NOT EXISTS `levels_zones` (
  `level_id` int(11) DEFAULT 0,
  `zone_id` int(11) DEFAULT 0,
  `floor` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.levels_zones: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `levels_zones` DISABLE KEYS */;
INSERT INTO `levels_zones` (`level_id`, `zone_id`, `floor`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, '2022-01-03 13:01:29', '2022-01-03 13:02:04', NULL),
	(1, 2, 1, '2022-01-03 13:01:55', '2022-01-03 13:02:13', NULL),
	(1, 3, 1, '2022-01-03 13:02:21', '2022-01-03 13:02:29', NULL),
	(2, 1, 2, '2022-01-03 13:02:39', '2022-01-03 13:03:44', NULL),
	(2, 2, 1, '2022-01-03 13:02:42', '2022-01-03 13:03:43', NULL),
	(2, 3, 1, '2022-01-03 13:02:45', '2022-01-03 13:03:42', NULL),
	(3, 1, 3, '2022-01-03 13:02:49', '2022-01-03 13:03:38', NULL),
	(3, 2, 2, '2022-01-03 13:02:52', '2022-01-03 13:03:36', NULL),
	(3, 3, 1, '2022-01-03 13:02:54', '2022-01-03 13:03:34', NULL);
/*!40000 ALTER TABLE `levels_zones` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT 0,
  `slug` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT 0,
  `company_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.menus: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.profiles: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.projects
CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT 0,
  `client` varchar(255) DEFAULT NULL,
  `ubication` varchar(255) DEFAULT NULL,
  `coordenadas` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `student` int(11) DEFAULT 0,
  `tipologia` varchar(255) DEFAULT NULL,
  `distrito` varchar(255) DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `sublevel` varchar(255) DEFAULT NULL,
  `public` int(11) DEFAULT 0,
  `room` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `type_id` int(11) DEFAULT 0,
  `company_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.projects: ~33 rows (aproximadamente)
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` (`id`, `name`, `code`, `capacity`, `client`, `ubication`, `manager`, `parent_id`, `student`, `zone`, `level`, `sublevel`, `public`, `room`, `height`, `width`, `user_id`, `type_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Propuesta remota', NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, 1, '2021-11-25 15:11:32', '2021-11-25 15:11:49', '2021-11-25 15:11:49'),
	(2, 'Aplica', NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, 1, '2021-11-25 15:12:02', '2021-12-01 17:11:04', '2021-12-01 17:11:04'),
	(3, 'Especializaciones', NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, 1, '2021-11-25 15:55:13', '2021-12-01 17:11:09', '2021-12-01 17:11:09'),
	(4, 'estética corporal', NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, 1, '2021-11-25 15:55:33', '2021-12-01 17:11:14', '2021-12-01 17:11:14'),
	(5, 'Soluciona', NULL, 0, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, 1, '2021-11-25 16:44:52', '2021-12-01 17:11:18', '2021-12-01 17:11:18'),
	(6, 'proyecto nuevo', NULL, 500, 'Plaindes', 'Lima', 'Jose mamani', 0, 22, 'urbano', 'primaria', NULL, 0, NULL, 400, 600, 1, 1, 1, '2021-11-30 17:35:08', '2022-01-03 13:57:01', NULL),
	(7, 'VERSIÓN 1: HOME', NULL, 500, 'Plaindes', 'Lima', 'Jose mamani', 6, 22, 'urbano', 'primaria', NULL, 0, NULL, 400, 600, 1, 1, 1, '2021-11-30 17:35:08', '2022-01-03 13:56:59', NULL),
	(8, 'terreno cuadrado', NULL, 500, 'Plaindes', 'Lima', 'Jose mamani', 6, 30, 'urbano', 'secundaria', NULL, 0, NULL, 400, 600, 1, 1, 1, '2021-11-30 12:41:43', '2022-01-03 13:56:58', NULL),
	(9, 'Propuesta remota', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 0, 30, 'urbano', 'secundaria', NULL, 0, NULL, 400, 600, 1, 1, 1, '2021-12-01 22:15:02', '2022-01-03 13:56:56', NULL),
	(10, 'VERSIÓN 1: HOME', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 9, 30, 'urbano', 'secundaria', NULL, 0, NULL, 400, 600, 1, 1, 1, '2021-12-01 22:15:02', '2022-01-03 13:56:55', NULL),
	(11, 'Proyecto 2', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 9, 30, 'urbano', 'secundaria', NULL, 0, NULL, 400, 600, 1, 1, 1, '2021-12-01 17:15:45', '2022-01-03 13:56:53', NULL),
	(12, 'Proyecto colegio', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 0, 20, 'urbano', 'primaria', 'unidocente', 0, NULL, 400, 600, 1, 1, 1, '2021-12-02 20:14:34', '2022-01-03 13:56:52', NULL),
	(13, 'VERSIÓN 1: HOME', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 12, 20, 'urbano', 'primaria', 'unidocente', 0, NULL, 400, 600, 1, 1, 1, '2021-12-02 20:14:34', '2022-01-03 13:56:50', NULL),
	(14, 'Version 2', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 12, 20, 'urbano', 'primaria', 'unidocente', 0, NULL, 400, 600, 1, 1, 1, '2021-12-02 15:15:25', '2022-01-03 13:56:48', NULL),
	(15, 'colegio 300', NULL, 300, 'Plaindes', 'Lima', 'Frank Yupanqui', 0, 25, 'urbano', 'primaria', 'polidocente multigrado', 0, NULL, 400, 600, 1, 1, 1, '2021-12-13 14:17:03', '2022-01-03 13:56:47', NULL),
	(16, 'VERSIÓN 1: HOME', NULL, 300, 'Plaindes', 'Lima', 'Frank Yupanqui', 15, 25, 'urbano', 'primaria', 'polidocente multigrado', 0, 12, 400, 600, 1, 1, 1, '2021-12-13 14:17:03', '2022-01-03 15:45:08', NULL),
	(17, 'colegio 400', NULL, 400, 'Plaindes', 'Lima', 'Frank Yupanqui', 15, 25, 'urbano', 'primaria', 'polidocente multigrado', 0, 35, 400, 600, 1, 1, 1, '2021-12-13 09:22:06', '2022-01-21 10:21:26', NULL),
	(18, 'colegio', NULL, 350, 'pedro', 'lima', 'martin', 0, 25, 'urbano', 'primaria', 'polidocente multigrado', 0, NULL, 400, 600, 4, 1, 1, '2021-12-14 21:22:54', '2022-01-03 13:56:43', NULL),
	(19, 'VERSIÓN 1: HOME', NULL, 350, 'pedro', 'lima', 'martin', 18, 25, 'urbano', 'primaria', 'polidocente multigrado', 0, 50, 400, 600, 4, 1, 1, '2021-12-14 21:22:54', '2022-01-11 16:37:22', NULL),
	(20, 'Propuesta remota', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 0, 25, 'rural', 'primaria', 'polidocente completo', 0, NULL, 6000, 4000, 1, 1, 1, '2022-01-21 15:16:49', '2022-01-21 15:16:49', NULL),
	(21, 'VERSIÓN 1: HOME', NULL, 500, 'Plaindes', 'Lima', 'Frank Yupanqui', 20, 25, 'rural', 'primaria', 'polidocente completo', 0, 35, 500, 600, 1, 1, 1, '2022-01-21 15:16:49', '2022-01-21 10:19:14', NULL),
	(22, 'Proyecto 1', NULL, 350, 'pedro', 'lima', 'martin', 0, 30, 'urbano', 'primaria', 'polidocente completo', 0, NULL, 40, 60, 4, 1, 1, '2022-01-26 17:49:27', '2022-01-26 17:49:27', NULL),
	(23, 'VERSIÓN 1: HOME', NULL, 350, 'pedro', 'lima', 'martin', 22, 30, 'urbano', 'primaria', 'polidocente completo', 0, 50, 400, 600, 4, 1, 1, '2022-01-26 17:49:27', '2022-01-26 12:58:35', NULL),
	(24, 'Prueba 1', NULL, 100, 'Newsystem', 'Lima, Miraflores', 'Luis Miguel', 0, 20, 'urbano', 'primaria', 'unidocente', 0, NULL, 300, 500, 2, 1, 1, '2022-03-08 18:28:33', '2022-03-08 18:28:33', NULL),
	(25, 'VERSIÓN 1: HOME', NULL, 100, 'Newsystem', 'Lima, Miraflores', 'Luis Miguel', 24, 20, 'urbano', 'primaria', 'unidocente', 0, 11, 500, 100, 2, 1, 1, '2022-03-08 18:28:33', '2022-05-25 16:06:37', NULL),
	(26, '003', NULL, 100, 'luz flores', 'lima', 'jose flores', 0, 30, 'urbano', 'secundaria', NULL, 0, NULL, 15, 50, 1, 1, 1, '2022-04-20 15:35:54', '2022-04-20 15:35:54', NULL),
	(27, 'VERSIÓN 1: HOME', NULL, 100, 'luz flores', 'lima', 'jose flores', 26, 30, 'urbano', 'secundaria', NULL, 0, 20, 300, 500, 1, 1, 1, '2022-04-20 15:35:54', '2022-06-14 17:56:04', NULL),
	(28, 'colegio 10050', NULL, 300, 'Plaindes', 'Lima', 'Jose mamani', 0, 25, 'urbano', 'primaria', 'polidocente multigrado', 0, NULL, 80, 60, 1, 1, 1, '2022-04-25 22:22:05', '2022-04-25 22:22:05', NULL),
	(29, 'VERSIÓN 1: HOME', NULL, 300, 'Plaindes', 'Lima', 'Jose mamani', 28, 25, 'urbano', 'primaria', 'polidocente multigrado', 0, 50, 300, 500, 1, 1, 1, '2022-04-25 22:22:05', '2022-06-14 17:55:52', NULL),
	(30, 'Anali Salazar', NULL, 150, 'R', 'lima', 'A', 0, 30, 'urbano', 'secundaria', NULL, 0, NULL, 40, 50, 2, 1, 1, '2022-04-28 21:53:56', '2022-04-29 11:41:23', '2022-04-29 11:41:23'),
	(31, 'VERSIÓN 1: HOME', NULL, 150, 'R', 'lima', 'A', 30, 30, 'urbano', 'secundaria', NULL, 0, 5, 40, 50, 2, 1, 1, '2022-04-28 21:53:56', '2022-04-28 17:54:05', NULL),
	(32, 'COLEGIO 1', NULL, 200, 'CH Ingenieros', 'Lima', 'Julio', 0, 0, 'rural', 'secundaria', NULL, 0, NULL, 80, 50, 2, 1, 1, '2022-07-20 16:25:03', '2022-07-20 16:25:03', NULL),
	(33, 'VERSIÓN 1: HOME', NULL, 200, 'CH Ingenieros', 'Lima', 'Julio', 32, 0, 'rural', 'secundaria', NULL, 0, NULL, 80, 50, 2, 1, 1, '2022-07-20 16:25:03', '2022-07-20 16:25:03', NULL);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.types_projects
CREATE TABLE IF NOT EXISTS `types_projects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.types_projects: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `types_projects` DISABLE KEYS */;
INSERT INTO `types_projects` (`id`, `name`, `icon`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Colegios', 'fas fa-school', 0, '2021-11-25 14:41:03', '2021-11-25 14:41:36', NULL);
/*!40000 ALTER TABLE `types_projects` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.users
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.users: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `lastname`, `email`, `password`, `image`, `sex`, `profile_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Master', 'Usuario', 'master@prodesign.com', 'cGpaSjFWNFhJMG42TkVQenpaRFV4QT09OjoRwIEI1k2zegZZVh+EORaT', NULL, 'M', 1, '2021-11-25 13:24:18', '2021-11-25 13:25:02', NULL),
	(2, 'Jorge', 'Flores', 'admin@prodesign.com', 'cGpaSjFWNFhJMG42TkVQenpaRFV4QT09OjoRwIEI1k2zegZZVh+EORaT', NULL, 'M', 2, '2021-11-25 13:24:18', '2021-11-25 13:25:06', NULL),
	(4, 'Usuario', 'Usuario', 'user@prodesign.com', 'cGpaSjFWNFhJMG42TkVQenpaRFV4QT09OjoRwIEI1k2zegZZVh+EORaT', NULL, 'M', 3, '2021-11-25 13:24:18', '2021-11-25 13:25:02', NULL),
	(5, 'isabel', NULL, 'iarevalo@cmideas.com.pe', 'dmhzMm04cWcyOHZUM1ZBNFNRWkppUT09Ojo3lDmDKsTt3lUAsg+WHI2z', NULL, 'M', 3, '2022-04-20 10:16:48', '2022-04-20 10:16:48', NULL),
	(6, 'Alexander Zegarra', NULL, 'azegarra@softdynamic.org', 'QVh5ZVkvcUpaWXNCbmNTVGlmb3VmZz09OjoFzvh6cq+tQdcVBcPZYfCb', NULL, 'M', 3, '2022-07-22 11:04:33', '2022-07-22 11:04:33', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla db_arquitectura_design.zones
CREATE TABLE IF NOT EXISTS `zones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db_arquitectura_design.zones: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'urbano', 1, '2022-01-03 12:54:51', '2022-01-03 12:55:18', NULL),
	(2, 'rural', 1, '2022-01-03 12:55:00', '2022-01-03 12:55:19', NULL),
	(3, 'aislada', 1, '2022-01-03 12:55:10', '2022-01-03 12:55:20', NULL);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
