CREATE DATABASE Facturacion;
USE Facturacion;

CREATE TABLE t_ciudad(
    id_ciudad       INT(11) AUTO_INCREMENT NOT NULL,
    ciudad          VARCHAR(100),
    CONSTRAINT pk_ciudad PRIMARY KEY(id_ciudad)
) ENGINE=InnoDB;

INSERT INTO t_ciudad(ciudad) VALUES("Bogota");
INSERT INTO t_ciudad(ciudad) VALUES("Rosal");
INSERT INTO t_ciudad(ciudad) VALUES("Cartagena");


CREATE TABLE t_unidad(
    id_unidad       INT(11) AUTO_INCREMENT NOT NULL,
    unidad          VARCHAR(50),
    CONSTRAINT pk_unidad PRIMARY KEY(id_unidad)
) ENGINE=InnoDB;

INSERT INTO t_unidad (unidad) VALUES("UNIDAD");
INSERT INTO t_unidad (unidad) VALUES("KILO");
INSERT INTO t_unidad (unidad) VALUES("RESMA");


CREATE TABLE t_cliente(
    id_cliente      INT(11) AUTO_INCREMENT NOT NULL,
    nombre_cliente  VARCHAR(100),
    direccion       VARCHAR(100),
    id_ciudad       INT(11),
    CONSTRAINT pk_cliente PRIMARY KEY(id_cliente),
    CONSTRAINT fk_ciudad FOREIGN KEY(id_ciudad) REFERENCES t_ciudad(id_ciudad)
) ENGINE=InnoDB;


CREATE TABLE t_producto(
    id_producto     INT(11) AUTO_INCREMENT NOT NULL,
    producto        VARCHAR(100),
    valor_unitario  FLOAT(10,2),     
    id_unidad       INT(11),
    CONSTRAINT pk_producto PRIMARY KEY(id_producto),
    CONSTRAINT fk_unidad FOREIGN KEY(id_unidad) REFERENCES t_unidad(id_unidad)
) ENGINE=InnoDB;


-- PRIMERO se crea t_rol
CREATE TABLE t_rol(
    id_rol      INT(11) AUTO_INCREMENT NOT NULL,
    rol         VARCHAR(50),
    CONSTRAINT pk_rol PRIMARY KEY(id_rol)
) ENGINE=InnoDB;


-- AHORA sí t_usuario (ya existe t_rol)
CREATE TABLE t_usuario(
    id_usuario     INT(11) AUTO_INCREMENT NOT NULL,
    nombre         VARCHAR(100),
    apellido       VARCHAR(100),
    correo         VARCHAR(100),
    password       VARCHAR(100),
    id_rol         INT(11),
    CONSTRAINT pk_usuario PRIMARY KEY(id_usuario),
    CONSTRAINT fk_rol FOREIGN KEY (id_rol) REFERENCES t_rol(id_rol)
) ENGINE=InnoDB;


CREATE TABLE t_factura(
    id_factura      INT(11) AUTO_INCREMENT NOT NULL,
    fecha           DATE,
    cantidad        INT(11),
    valor_unitario  FLOAT(10,2),     
    id_cliente      INT(11),
    id_producto     INT(11),
    id_usuario      INT(11),
    CONSTRAINT pk_factura PRIMARY KEY(id_factura),
    CONSTRAINT fk_cliente FOREIGN KEY(id_cliente) REFERENCES t_cliente(id_cliente),
    CONSTRAINT fk_producto FOREIGN KEY(id_producto) REFERENCES t_producto(id_producto),
    CONSTRAINT fk_usuario FOREIGN KEY(id_usuario) REFERENCES t_usuario(id_usuario)
) ENGINE=InnoDB;




SELECT FAC.id_factura,
		FAC.fecha,
        FAC.id_usuario,
        USU.nombre,
        USU.apellido,
        FAC.id_cliente,
        CLI.direccion,
        CLI.nombre_cliente,
        PRO.producto,
        PRO.valor_unitario

FROM t_factura FAC
INNER JOIN t_usuario USU ON USU.id_usuario = FAC.id_usuario
INNER JOIN t_cliente CLI ON CLI.id_cliente = FAC.id_cliente
INNER JOIN t_producto PRO ON PRO.id_producto = PRO.id_producto
INNER JOIN t_producto PRO ON PRO.id_producto = PRO.id_producto