CREATE DATABASE logogenial
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Colombia.1252'
    LC_CTYPE = 'Spanish_Colombia.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE logogenial
    IS 'Base de datos del proyecto Logogenia, como parte del proyecto de grado de especialización ing software UAN.';
	
	
CREATE TABLE public."Persona"
(
    id integer,
    nombres varchar(50),
    apellidos varchar(50),
    telefono varchar(11),
    correo varchar(40),
    direccion varchar(40) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public."Persona"
    OWNER to postgres;
COMMENT ON TABLE public."Persona"
    IS 'Personas';

-- Sequencia autoincremental
CREATE SEQUENCE persona_seq start with 1;
alter table "Persona"
	alter column id set default nextval('persona_seq');	
