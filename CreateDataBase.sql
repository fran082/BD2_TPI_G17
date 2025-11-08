CREATE DATABASE BD2_TPI_G17
GO

USE BD2_TPI_G17 
GO

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
IDComision integer not null, --FK
Nombre varchar(75) not null

FOREIGN KEY (IDComision) REFERENCES Comisiones(IDComision)
);


CREATE TABLE Hilos(
IDHilo bigint identity(1,1) PRIMARY KEY not null,
IDForo bigint not null, --FK
Nombre varchar(75) not null

FOREIGN KEY (IDForo) REFERENCES Foros(IDForo)
);

CREATE TABLE Comentarios(
IDComentario bigint identity(1,1) PRIMARY KEY,
IDHilo bigint NOT NULL , --FK
IDAutor bigint NOT NULL, 
IDProfesor integer not null,--FK
Comentario varchar(1000) not null,
FechaComentario DATETIME not null,
IDRespuesta bigint null

FOREIGN KEY (IDHilo) REFERENCES HILOS(IDHilo)
--FOREIGN KEY (IDAutor) REFERENCES --NO LA PUEDO HACER PORQUE TODAVIA NO ESTA LA TABLA Alumno
--FOREIGN KEY (IDProfesor) REFERENCES --NO LA PUEDO HACER PORQUE TODAVIA NO ESTA LA TABLA Profesor
);


