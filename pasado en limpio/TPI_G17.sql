CREATE DATABASE BD2_TPI_G17
GO

USE BD2_TPI_G17


--------------------------------------
 --TABLAS BASE 
--------------------------------------

create table USUARIOS(
IDUsuario bigint not null identity(1,1) primary key,
Nombre varchar(50) not null,
Apellido varchar(50) not  null,
DNI bigint not null,
Mail varchar(100) not null UNIQUE,
Contrasena varchar(50) not null,
FechaNacimiento Date not null
);

create Table ALUMNOS(
IDAlumno bigint not null identity(1,1) primary key,
IDUsuario bigint not null,
Sexo varchar(9) not null check (Sexo = 'masculino' or Sexo = 'Masculino' 
or Sexo = 'Femenino' or Sexo = 'femenino'),
FechaDeRegistro DateTime not null default GETDATE(),
Activo bit not null default 1

foreign key (IDUsuario) references USUARIOS(IDUsuario)
);

CREATE TABLE PROFESORES(
IDProfesor integer identity(1,1) PRIMARY KEY NOT NULL,
IDUsuario bigint not null,
FechaIngreso date not null ,
Sueldo money not null CHECK(Sueldo > 0),
FechaFinalizacionContrato date null ,
Activo bit not null default 1

foreign key (IDUsuario) references USUARIOS(IDUsuario),
check (FechaFinalizacionContrato IS NULL OR FechaFinalizacionContrato > FechaIngreso)
);


--------------------------------------
-- CURSOS Y RELACIONADOS
--------------------------------------

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
HorarioComienzo tinyint not null ,
HorarioCierre tinyint not null,
IDCurso integer not null --FK

FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso),
check(HorarioComienzo > 7 AND HorarioComienzo < 21),
 check(HorarioCierre > 8 AND HorarioCierre < 23 AND HorarioCierre > HorarioComienzo)
);

CREATE TABLE Foros(
IDForo bigint identity(1,1) PRIMARY KEY not null,
IDComision integer not null,
Nombre varchar(75) not null,

FOREIGN KEY (IDComision) REFERENCES Comisiones(IDComision)
);

CREATE TABLE Hilos(
IDHilo bigint identity(1,1) PRIMARY KEY not null,
IDForo bigint not null,
Nombre varchar(75) not null,

FOREIGN KEY (IDForo) REFERENCES Foros(IDForo)
);

CREATE TABLE CURSOSXPROFESOR(
ID integer identity(1,1) PRIMARY KEY NOT NULL,
IDCurso integer not null,
IDProfesor integer not null,
Activo bit not null default 1

   CONSTRAINT UQ_CursoProfesor UNIQUE (IDCurso, IDProfesor)

foreign key (IDCurso) references Cursos(IDCurso),
foreign key (IDProfesor) references PROFESORES(IDProfesor)
);

CREATE TABLE CURSOSXALUMNO(
ID integer identity(1,1) PRIMARY KEY NOT NULL,
IDCurso integer not null,
IDAlumno bigint not null,
Activo bit not null default 1

   CONSTRAINT UQ_CursoAlumno UNIQUE (IDCurso, IDAlumno)

foreign key (IDCurso) references Cursos(IDCurso),
foreign key (IDAlumno) references Alumnos(IDAlumno)
);

--------------------------------------
 --COMENTARIOS / FOROS / HILOS
--------------------------------------

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


--------------------------------------
-- ACTIVIDADES / CUESTIONARIOS / PREGUNTAS
--------------------------------------

create table ACTIVIDADES (
	IDActividad bigint not null primary key identity (1,1),
	IDForo bigint not null foreign key references Foros (IDForo), 
	Titulo varchar (100) not null check (Titulo <> ''),
	Descripcion varchar (150) not null check (Descripcion <> ''),
	FechaCreacion date not null,
	FechaCierre date not null,
	Activo bit not null check (Activo = 1 or Activo = 0)
);

create table CUESTIONARIOS (
	IDCuestionario bigint not null primary key identity (1,1),
	IDActividad bigint not null foreign key references ACTIVIDADES (IDActividad),
	Intentos bigint not null check (Intentos > 0)
);

create table PREGUNTAS(
	IDPregunta bigint not null primary key identity (1,1),
	IDCuestionario bigint not null foreign key references CUESTIONARIOS (IDCuestionario),
	Enunciado varchar (300) not null check (Enunciado <> ''), 
	Puntaje decimal (5,2) default 1.00
);

create table OPCIONES(
	ID bigint not null primary key identity (1,1),
	IDPregunta bigint foreign key references PREGUNTAS (IDPregunta),
	Texto varchar (250) not null check (Texto <> ''),
	EsCorrecta bit default 0
);


--------------------------------------
 --RESPUESTAS / RESULTADOS / CALIFICACIONES
--------------------------------------

create table RESPUESTAALUMNOS(
	ID bigint not null primary key identity (1,1),
	IDAlumno bigint not null foreign key references ALUMNOS(IDAlumno),
	OpcionElegida bigint not null foreign key references OPCIONES (ID),
	Correcta bit not null,
	PuntajeObtenido decimal (5,2)
);

create table RESULTADOCUESTIONARIO(
	ID bigint not null primary key identity (1,1),
	IDCuestionario bigint not null foreign key references CUESTIONARIOS(IDCuestionario),
	IDAlumno bigint not null foreign key references ALUMNOS(IDAlumno),
	PuntajeObtenido decimal (5,2),
	PuntajeMaximo decimal (5,2),
	Intento bigint check (Intento > 0),
	Aprobado bit 
);

create table CALIFICACIONES (
	ID bigint not null primary key identity (1,1),
	IDAlumno bigint foreign key references ALUMNOS(IDAlumno),
	IDActividad bigint foreign key references ACTIVIDADES(IDActividad),
	Nota decimal (5,2),
	NotaFinal decimal (5,2)
);


--------------------------------------
-- CERTIFICADOS
--------------------------------------

CREATE TABLE CERTIFICADOS(
IDCertificado bigint identity(1000,1) PRIMARY KEY not null,
IDAlumno bigint not null,
IDProfesor integer not null,
IDCurso integer not null,
IDCalificacion bigint not null,
Institucion varchar(100) not null check(Institucion = 'Cursos del Sol'),
Certificado varchar(100) not null check(Certificado = 'certificado de finalización'),
URLVerificacion varchar(100) null,

foreign key (IDAlumno) references Alumnos(IDAlumno),
foreign key (IDProfesor) references PROFESORES(IDProfesor),
foreign key (IDCurso) references Cursos(IDCurso),
foreign key (IDCalificacion) references CALIFICACIONES(ID)
);

--ALTER TABLE Alumnos
--ADD IDUsuario INT NULL;  -- mismo tipo que Usuarios.IDUsuario

-- 2. Actualizar los datos: como coinciden, copiamos el IDAlumno
--UPDATE ALUMNOS
--SET IDUsuario = IDAlumno;

-- 3. Si todos los alumnos tienen usuario, forzamos NOT NULL
--ALTER TABLE Alumnos
--ALTER COLUMN IDUsuario INT NOT NULL;

--ALTER TABLE Alumnos
--ALTER COLUMN IDUsuario BIGINT NOT NULL;

-- 4. Crear la foreign key
--ALTER TABLE Alumnos
--ADD CONSTRAINT FK_Alumnos_Usuarios
--FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario);

--cambios del ultimo commit
--ALTER TABLE CURSOSXALUMNO 
--ADD FechaInscripcion date not null default cast (getdate() as date);

--alter table CURSOS 
--ADD Activo bit not null default 1;

