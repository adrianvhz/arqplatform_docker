ALTER TABLE types_projects ADD COLUMN `slug` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
ALTER TABLE types_projects ADD COLUMN `show` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci';

ALTER TABLE projects ADD COLUMN `coordenadas` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
ALTER TABLE projects ADD COLUMN	`tipologia` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
ALTER TABLE projects ADD COLUMN	`distrito` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
ALTER TABLE projects ADD COLUMN	`puntos` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
ALTER TABLE projects ADD COLUMN	`ambientes` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
ALTER TABLE projects ADD COLUMN	`aforo` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_bin',
ALTER TABLE projects ADD COLUMN	CONSTRAINT `puntos` CHECK (json_valid(`puntos`)),
ALTER TABLE projects ADD COLUMN	CONSTRAINT `ambientes` CHECK (json_valid(`ambientes`))


