
/* Drop Tables */

DROP TABLE IF EXISTS public.carrera_asignatura;
DROP TABLE IF EXISTS Contenido;
DROP TABLE IF EXISTS public.planificacion;
DROP TABLE IF EXISTS public.cursos;
DROP TABLE IF EXISTS public.asignatura;
DROP TABLE IF EXISTS public.carrera;
DROP TABLE IF EXISTS public.decano;
DROP TABLE IF EXISTS public.directordepartamento;
DROP TABLE IF EXISTS public.jefecarrera;
DROP TABLE IF EXISTS public.docentes;
DROP TABLE IF EXISTS public.comuna;
DROP TABLE IF EXISTS public.escuela;
DROP TABLE IF EXISTS public.departamentos;
DROP TABLE IF EXISTS public.facultades;
DROP TABLE IF EXISTS public.provincias;
DROP TABLE IF EXISTS public.regiones;
DROP TABLE IF EXISTS public.paises;



/* Drop Sequences */

DROP SEQUENCE IF EXISTS public.comuna_pk_seq;
DROP SEQUENCE IF EXISTS public.contenido_semana_seq;
DROP SEQUENCE IF EXISTS public.cursos_pk_seq;
DROP SEQUENCE IF EXISTS public.departamentos_pk_seq;
DROP SEQUENCE IF EXISTS public.docentes_pk_seq;
DROP SEQUENCE IF EXISTS public.escuela_pk_seq;
DROP SEQUENCE IF EXISTS public.facultades_pk_seq;
DROP SEQUENCE IF EXISTS public.paises_pk_seq;
DROP SEQUENCE IF EXISTS public.planificacion_cod_clasificacion_seq;
DROP SEQUENCE IF EXISTS public.provincias_pk_seq;
DROP SEQUENCE IF EXISTS public.regiones_pk_seq;
DROP SEQUENCE IF EXISTS public.semana_pk_seq;




/* Create Sequences */

CREATE SEQUENCE public.contenido_semana_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;
CREATE SEQUENCE public.semana_pk_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;



/* Create Tables */

CREATE TABLE public.asignatura
(
	codigo varchar(8) NOT NULL,
	nombre varchar(255) NOT NULL UNIQUE,
	descripcion text,
	CONSTRAINT asignatura_pkey PRIMARY KEY (codigo)
) WITHOUT OIDS;


CREATE TABLE public.carrera
(
	codigo int NOT NULL,
	nombre varchar(255),
	escuela_fk int NOT NULL,
	jefecarrera_fk varchar(12) NOT NULL,
	CONSTRAINT carrera_pkey PRIMARY KEY (codigo)
) WITHOUT OIDS;


CREATE TABLE public.carrera_asignatura
(
	codigo_carrera int NOT NULL,
	codigo_asignatura varchar(8) NOT NULL
) WITHOUT OIDS;


CREATE TABLE public.comuna
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL UNIQUE,
	provincia_fk int NOT NULL,
	CONSTRAINT comuna_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.cursos
(
	pk serial NOT NULL,
	semestre int NOT NULL UNIQUE,
	anio int NOT NULL UNIQUE,
	docente_fk varchar(12) NOT NULL UNIQUE,
	seccion int NOT NULL,
	codigo varchar(8) NOT NULL UNIQUE,
	CONSTRAINT cursos_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.decano
(
	rut varchar(12) NOT NULL,
	facultad_fk int NOT NULL UNIQUE,
	CONSTRAINT decano_pkey PRIMARY KEY (rut)
) WITHOUT OIDS;


CREATE TABLE public.departamentos
(
	pk serial NOT NULL,
	facultad_fk int NOT NULL,
	departamento varchar(255) NOT NULL UNIQUE,
	descripcion text,
	CONSTRAINT departamentos_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.directordepartamento
(
	rut varchar(12) NOT NULL,
	departamento_fk int NOT NULL UNIQUE,
	CONSTRAINT directordepartamento_pkey PRIMARY KEY (rut)
) WITHOUT OIDS;


CREATE TABLE public.docentes
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL,
	apellidos varchar(255) NOT NULL,
	rut varchar(12) NOT NULL UNIQUE,
	fecha_nacimiento date,
	genero char(1),
	direccion varchar(255) NOT NULL,
	comuna_fk int NOT NULL,
	telefono varchar(255),
	celular varchar(255),
	email varchar(255) NOT NULL,
	departamento_fk int NOT NULL,
	jerarquia varchar(255) NOT NULL,
	contrato varchar(255) NOT NULL,
	jornada varchar(255) NOT NULL,
	grado int NOT NULL,
	funcion varchar(255) NOT NULL,
	eliminado int NOT NULL,
	CONSTRAINT docentes_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.escuela
(
	pk serial NOT NULL,
	departamento_fk int NOT NULL,
	escuela varchar(255) NOT NULL,
	descripcion text,
	CONSTRAINT escuela_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.facultades
(
	pk serial NOT NULL,
	facultad varchar(255) NOT NULL UNIQUE,
	descripcion text,
	CONSTRAINT facultades_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.jefecarrera
(
	docente_fk varchar(12) NOT NULL,
	escuela_fk int NOT NULL,
	CONSTRAINT jefecarrera_pkey PRIMARY KEY (docente_fk)
) WITHOUT OIDS;


CREATE TABLE public.paises
(
	pk serial NOT NULL,
	cod_num int NOT NULL UNIQUE,
	alfa_tres varchar(3) NOT NULL UNIQUE,
	alfa_dos varchar(2) NOT NULL UNIQUE,
	nombre varchar(255) NOT NULL UNIQUE,
	CONSTRAINT paises_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.planificacion
(
	cod_clasificacion serial NOT NULL,
	rut varchar(12) NOT NULL,
	facultad int NOT NULL,
	departamento int NOT NULL,
	escuela int NOT NULL,
	objetivo text,
	asignatura varchar(8) NOT NULL,
	semestre int,
	fecha date,
	estrategia text,
	carrera int,
	CONSTRAINT planificacion_pkey PRIMARY KEY (cod_clasificacion)
) WITHOUT OIDS;


CREATE TABLE public.provincias
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL UNIQUE,
	regiones_fk int NOT NULL,
	CONSTRAINT provincias_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE public.regiones
(
	pk serial NOT NULL,
	nombre varchar(255) NOT NULL UNIQUE,
	corfo varchar(255) NOT NULL,
	codigo varchar(5) NOT NULL UNIQUE,
	numero int NOT NULL UNIQUE,
	paises_fk int NOT NULL,
	CONSTRAINT regiones_pkey PRIMARY KEY (pk)
) WITHOUT OIDS;


CREATE TABLE Contenido
(
	ID_Contenido serial NOT NULL,
	Num_Semana_Anual int,
	Num_Sem_Semestral int,
	Fecha_InicioSemana date,
	Fecha_TerminoSemana date,
	Unidad text,
	Objetivos_Esp text,
	Contenido_Tematico text,
	Evaluaciones text,
	Cod_Clasificacion int NOT NULL UNIQUE,
	PRIMARY KEY (ID_Contenido)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE public.carrera_asignatura
	ADD CONSTRAINT carrera_asignatura_codigo_asignatura_fkey FOREIGN KEY (codigo_asignatura)
	REFERENCES public.asignatura (codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.cursos
	ADD CONSTRAINT cursos_codigo_fkey FOREIGN KEY (codigo)
	REFERENCES public.asignatura (codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.carrera_asignatura
	ADD CONSTRAINT carrera_asignatura_codigo_carrera_fkey FOREIGN KEY (codigo_carrera)
	REFERENCES public.carrera (codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.planificacion
	ADD CONSTRAINT planificacion_carrera_fkey FOREIGN KEY (carrera)
	REFERENCES public.carrera (codigo)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.docentes
	ADD CONSTRAINT docentes_comuna_fk_fkey FOREIGN KEY (comuna_fk)
	REFERENCES public.comuna (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.planificacion
	ADD CONSTRAINT planificacion_asignatura_fkey FOREIGN KEY (asignatura)
	REFERENCES public.cursos (codigo)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.directordepartamento
	ADD CONSTRAINT directordepartamento_departamento_fk_fkey FOREIGN KEY (departamento_fk)
	REFERENCES public.departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.docentes
	ADD CONSTRAINT docentes_departamento_fk_fkey FOREIGN KEY (departamento_fk)
	REFERENCES public.departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.escuela
	ADD CONSTRAINT escuela_departamento_fk_fkey FOREIGN KEY (departamento_fk)
	REFERENCES public.departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.planificacion
	ADD CONSTRAINT planificacion_departamento_fkey FOREIGN KEY (departamento)
	REFERENCES public.departamentos (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.cursos
	ADD CONSTRAINT cursos_docente_fk_fkey FOREIGN KEY (docente_fk)
	REFERENCES public.docentes (rut)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.decano
	ADD CONSTRAINT decano_rut_fkey FOREIGN KEY (rut)
	REFERENCES public.docentes (rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.directordepartamento
	ADD CONSTRAINT directordepartamento_rut_fkey FOREIGN KEY (rut)
	REFERENCES public.docentes (rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.jefecarrera
	ADD CONSTRAINT jefecarrera_docente_fk_fkey FOREIGN KEY (docente_fk)
	REFERENCES public.docentes (rut)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.planificacion
	ADD CONSTRAINT planificacion_rut_fkey FOREIGN KEY (rut)
	REFERENCES public.docentes (rut)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.carrera
	ADD CONSTRAINT carrera_escuela_fk_fkey FOREIGN KEY (escuela_fk)
	REFERENCES public.escuela (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.jefecarrera
	ADD CONSTRAINT jefecarrera_escuela_fk_fkey FOREIGN KEY (escuela_fk)
	REFERENCES public.escuela (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.planificacion
	ADD CONSTRAINT planificacion_escuela_fkey FOREIGN KEY (escuela)
	REFERENCES public.escuela (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.decano
	ADD CONSTRAINT decano_facultad_fk_fkey FOREIGN KEY (facultad_fk)
	REFERENCES public.facultades (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.departamentos
	ADD CONSTRAINT departamentos_facultad_fk_fkey FOREIGN KEY (facultad_fk)
	REFERENCES public.facultades (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.planificacion
	ADD CONSTRAINT planificacion_facultad_fkey FOREIGN KEY (facultad)
	REFERENCES public.facultades (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.carrera
	ADD CONSTRAINT carrera_jefecarrera_fk_fkey FOREIGN KEY (jefecarrera_fk)
	REFERENCES public.jefecarrera (docente_fk)
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
;


ALTER TABLE public.regiones
	ADD CONSTRAINT regiones_paises_fk_fkey FOREIGN KEY (paises_fk)
	REFERENCES public.paises (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Contenido
	ADD FOREIGN KEY (Cod_Clasificacion)
	REFERENCES public.planificacion (cod_clasificacion)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.comuna
	ADD CONSTRAINT comuna_provincia_fk_fkey FOREIGN KEY (provincia_fk)
	REFERENCES public.provincias (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE public.provincias
	ADD CONSTRAINT provincias_regiones_fk_fkey FOREIGN KEY (regiones_fk)
	REFERENCES public.regiones (pk)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



