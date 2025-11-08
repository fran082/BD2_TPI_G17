CREATE DATABASE BD2_TPI_G17

GO
USE BD2_TPI_G17


CREATE TABLE Cursos(
IDCurso integer identity(50,1) not null PRIMARY KEY,
CargaHoraria tinyint not null,
Nombre varchar(100) not null
);


CREATE TABLE Comisiones(
IDComision integer identity (1,1) PRIMARY KEY not null,
NumeroComision integer not null,
Turno varchar(10) not null,
CantDias tinyint not null,
HorarioComienzo tinyint not null,
HorarioCierre tinyint not null,
IDCurso integer not null --FK

FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso)
);

CREATE TABLE Foros(
IDForo bigint identity(1,1) PRIMARY KEY not null,
IDComision integer not null --FK

FOREIGN KEY (IDComision) REFERENCES Comisiones(IDComision)
);


CREATE TABLE Hilos(
IDHilo bigint identity(1,1) PRIMARY KEY not null,
IDForo bigint not null --FK

FOREIGN KEY (IDForo) REFERENCES Foros(IDForo)
);

CREATE TABLE Comentarios(
IDComentario bigint identity(1,1) PRIMARY KEY,
IDHilo bigint NOT NULL , --FK
IDAutor bigint NOT NULL, --FK
Comentario varchar(1000) not null,
FechaComentario DATETIME not null,
IDRespuesta bigint null

FOREIGN KEY (IDHilo) REFERENCES HILOS(IDHilo)
--FOREIGN KEY (IDAutor) REFERENCES --NO LA PUEDO HACER PORQUE TODAVIA NO ESTA LA TABLA USUARIOS
);

go
create table ACTIVIDADES (
	IDActividad bigint not null primary key identity (1,1),
	IDForo bigint not null foreign key references Foros (IDForo), 
	Titulo varchar (100) not null,
	Descripcion varchar (150) not null,
	FechaCreacion date not null,
	FechaCierre date not null,
	Activa bit,

);

go 
create table CUESTIONARIOS (
	IDCuestionario bigint not null primary key identity (1,1),
	IDActividad bigint not null foreign key references ACTIVIDADES (IDActividad),
	Intentos bigint not null
);

go 
create table PREGUNTAS(
	IDPregunta bigint not null primary key identity (1,1),
	IDCuestionario bigint not null foreign key references CUESTIONARIOS (IDCuestionario),
	Enunciado varchar (300) not null, 
	Puntaje decimal (5,2) default 1.00
);

go 
create table OPCIONES(
	ID bigint not null primary key identity (1,1),
	IDPregunta bigint foreign key references PREGUNTAS (IDPregunta),
	Texto varchar (250) not null,
	EsCorrecta bit default 0
);

go 
create table RESPUESTAUSUARIOS(
	ID bigint not null primary key identity (1,1),
	--IDUsuario bigint not null foreign key references USUARIOS (IDUsurio)
	OpcionElegida bigint not null foreign key references OPCIONES (ID),
	Correcta bit,
	PuntajeObtenido decimal (5,2)
);

go 
create table RESULTADOCUESTIONARIO(
	ID bigint not null primary key identity (1,1),
	IDCuestionario bigint not null foreign key references CUESTIONARIOS (IDCuestionario),
	--IDUsuario bigint not null foreign key references USUARIOS (ID),
	PuntajeObtenido decimal (5,2),
	PuntajeMaximo decimal (5,2),
	Intento bigint,
	Aprobado bit 

);

go
create table CALIFICACIONES (
	ID bigint not null primary key identity (1,1),
	--IDUsurio bigint foreign key references USUARIO (ID),
	IDActividad bigint foreign key references ACTIVIDADES (IDActividad),
	Nota decimal (5,2),
	NotaFinal decimal (5,2)
);