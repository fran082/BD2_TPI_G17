CREATE DATABASE BD2_TPI_G17
GO

USE BD2_TPI_G17 
GO

CREATE TABLE Cursos(
IDCurso integer identity(50,1) not null PRIMARY KEY,
CargaHoraria tinyint not null check (CargaHoraria > 0),
Nombre varchar(100) not null
);


CREATE TABLE Comisiones(
IDComision integer identity (1,1) PRIMARY KEY not null,
NumeroComision integer not null check(NumeroComision > 0),
Turno varchar(10) not null
check (Turno = 'mañana' OR Turno = 'tarde' OR Turno = 'noche' 
OR Turno = 'Mañana' OR Turno = 'Tarde' OR Turno = 'Noche'),
CantDias tinyint not null check (CantDias = 1 OR CantDias = 2 OR CantDias = 3 OR
CantDias = 4 OR CantDias = 5),
HorarioComienzo tinyint not null check(HorarioComienzo > 7 AND HorarioComienzo < 21),
HorarioCierre tinyint not null check(HorarioCierre > 8 AND HorarioCierre < 23
AND HorarioCierre > HorarioComienzo),
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
Comentario varchar(1000) not null CHECK (Comentario <> ''),
FechaComentario DATETIME not null DEFAULT GETDATE(),
IDRespuesta bigint null check(IDRespuesta > 0),

FOREIGN KEY (IDHilo) REFERENCES HILOS(IDHilo),
foreign key (IDAlumno) references Alumnos(IDAlumno),
foreign key (IDProfesor) references PROFESORES(IDProfesor)
);



CREATE TABLE PROFESORES(
IDProfesor integer identity(1,1) PRIMARY KEY NOT NULL,
IDUsuario bigint not null,
FechaIngreso date not null ,
Sueldo money not null CHECK(Sueldo > 0),
FechaFinalizacionContrato date null 
check (FechaFinalizacionContrato IS NULL OR FechaFinalizacionContrato > FechaIngreso),
Activo bit not null default 1

foreign key (IDUsuario) references USUARIOS(IDUsuario)
);


CREATE TABLE CURSOSXPROFESOR(
ID integer identity(1,1) PRIMARY KEY NOT NULL,
IDCurso integer not null,
IDProfesor integer not null,
Activo bit not null default 1

foreign key (IDCurso) references Cursos(IDCurso),
foreign key (IDProfesor) references PROFESORES(IDProfesor)
);

CREATE TABLE CURSOSXALUMNO(
ID integer identity(1,1) PRIMARY KEY NOT NULL,
IDCurso integer not null,
IDAlumno bigint not null,
Activo bit not null default 1,

foreign key (IDCurso) references Cursos(IDCurso),
foreign key (IDAlumno) references Alumnos(IDAlumno)
);


CREATE TABLE CERTIFICADOS(
IDCertificado bigint identity(1000,1) PRIMARY KEY not null,
IDAlumno bigint not null,
IDProfesor integer not null,
IDCurso integer not null,
IDCalificacion decimal (5,2) not null,
Institucion varchar(100) not null check(Institucion = 'Cursos del Sol'),
Certificado varchar(100) not null check(Certificado = 'certificado de finalización'),
URLVerificacion varchar(100) null,

foreign key (IDAlumno) references Alumnos(IDAlumno),
foreign key (IDProfesor) references PROFESORES(IDProfesor),
foreign key (IDCurso) references Cursos(IDCurso)
);

ALTER TABLE CERTIFICADOS
ALTER COLUMN IDCalificacion BIGINT NOT NULL;

ALTER TABLE CERTIFICADOS
ADD CONSTRAINT FK_Certificados_Calificaciones
FOREIGN KEY (IDCalificacion) REFERENCES CALIFICACIONES(ID);
