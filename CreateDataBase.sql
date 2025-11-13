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
-----------------
CREATE TABLE Comentarios(
IDComentario bigint identity(1,1) PRIMARY KEY,
IDHilo bigint NOT NULL , --FK
IDAlumno bigint NOT NULL, 
IDProfesor integer not null,--FK
Comentario varchar(1000) not null,
FechaComentario DATETIME not null,
IDRespuesta bigint null,

FOREIGN KEY (IDHilo) REFERENCES HILOS(IDHilo),
foreign key (IDAlumno) references Alumnos(IDAlumno),
foreign key (IDProfesor) references PROFESORES(IDProfesor)
);



CREATE TABLE PROFESORES(
IDProfesor integer identity(1,1) PRIMARY KEY NOT NULL,
IDUsuario bigint not null,
FechaIngreso date not null,
Sueldo money not null,
FechaFinalizacionContrato date null,
Activo bit not null

foreign key (IDUsuario) references USUARIOS(IDUsuario)
);


CREATE TABLE CURSOSXPROFESOR(
ID integer identity(1,1) PRIMARY KEY NOT NULL,
IDCurso integer not null,
IDProfesor integer not null,
Activo bit not null

foreign key (IDCurso) references Cursos(IDCurso),
foreign key (IDProfesor) references PROFESORES(IDProfesor)
);

CREATE TABLE CURSOSXALUMNO(
ID integer identity(1,1) PRIMARY KEY NOT NULL,
IDCurso integer not null,
IDAlumno bigint not null,
Activo bit not null,

foreign key (IDCurso) references Cursos(IDCurso),
foreign key (IDAlumno) references Alumnos(IDAlumno)
);


CREATE TABLE CERTIFICADOS(
IDCertificado bigint identity(1000,1) PRIMARY KEY not null,
IDAlumno bigint not null,
IDProfesor integer not null,
IDCurso integer not null,
IDCalificacion decimal (5,2) not null,
Institucion varchar(100) not null,
Certificado varchar(100) not null,
URLVerificacion varchar(100) null,

foreign key (IDAlumno) references Alumnos(IDAlumno),
foreign key (IDProfesor) references PROFESORES(IDProfesor),
foreign key (IDCurso) references Cursos(IDCurso)
--foreign key (IDCalificacion) references CALIFICACIONES(ID)
);

ALTER TABLE CERTIFICADOS
ALTER COLUMN IDCalificacion BIGINT NOT NULL;

ALTER TABLE CERTIFICADOS
ADD CONSTRAINT FK_Certificados_Calificaciones
FOREIGN KEY (IDCalificacion) REFERENCES CALIFICACIONES(ID);
