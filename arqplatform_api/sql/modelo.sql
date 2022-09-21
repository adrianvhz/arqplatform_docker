CREATE TABLE Planes (
    id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descripcion varchar(150) NOT NULL,
    vigencia int NOT NULL,
    precio decimal(9,2),
    defecto bit ,
    estado bit,
    createdAt datetime DEFAULT current_timestamp(),
    updatedAt datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deletedAt datetime DEFAULT NULL
);


CREATE TABLE Permisos (
    id  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descripcion text NOT NULL,
    estado bit,
    createdAt datetime DEFAULT current_timestamp(),
    updatedAt datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deletedAt datetime DEFAULT NULL
);


CREATE TABLE DetailPlanPermission (
    idplan INT ,
    idpermiso INT,
    estado bit,
    createdAt datetime DEFAULT current_timestamp(),
    updatedAt datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deletedAt datetime DEFAULT NULL,
    CONSTRAINT uc_plan_permiso UNIQUE (idplan,idpermiso)
);

CREATE TABLE DetailUserPlan (
    iduser INT,
    idplan INT ,
    estado bit,
    createdAt datetime DEFAULT current_timestamp(),
    updatedAt datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    deletedAt datetime DEFAULT NULL,
    CONSTRAINT uc_user_plan UNIQUE (iduser,idplan)
);