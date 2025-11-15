CREATE DATABASE Facturacion;

USE Facturacion;

CREATE TABLE t_ciudad(
    id_ciudad       int(11)     AUTO_INCREMENT NOT NULL,
    ciudad        varchar(100),
    CONSTRAINT      pk_ciudad      PRIMARY KEY(id_ciudad)
)ENGINE=InnoDb;

CREATE TABLE t_unidad(
    id_unidad       int(11)     AUTO_INCREMENT NOT NULL,
    t_unidad    varchar(50),
    CONSTRAINT      pk_unidad   PRIMARY KEY(id_unidad)
)ENGINE=InnoDb;

CREATE TABLE t_cliente(
    id_cliente      int(11)     AUTO_INCREMENT  NOT NULL,
    nombre_cliente  varchar(100),
    direccion       varchar(100),
    id_ciudad       int(11),
    CONSTRAINT      pk_cliente      PRIMARY KEY(id_cliente),
    CONSTRAINT      fk_ciudad       FOREIGN KEY(id_ciudad)  REFERENCES t_ciudad(id_ciudad)
)ENGINE=InnoDb;

CREATE TABLE t_producto(
    id_producto     int(11)     AUTO_INCREMENT  NOT NULL,
    producto        varchar(100),
    id_unidad       int(11),
    CONSTRAINT      pk_producto      PRIMARY KEY(id_producto),
    CONSTRAINT      fk_unidad       FOREIGN KEY(id_unidad)  REFERENCES t_unidad(id_unidad)
)ENGINE=InnoDb;