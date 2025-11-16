--CREATE DATABASE BD2_TPI_G17
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
Sexo varchar(9) not null,
FechaDeRegistro DateTime not null,
Activo bit not null
);

CREATE TABLE PROFESORES(
IDProfesor integer identity(1,1) PRIMARY KEY NOT NULL,
IDUsuario bigint not null,
FechaIngreso date not null,
Sueldo money not null,
FechaFinalizacionContrato date null,
Activo bit not null,

foreign key (IDUsuario) references USUARIOS(IDUsuario)
);


--------------------------------------
-- CURSOS Y RELACIONADOS
--------------------------------------

CREATE TABLE CURSOS(
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
IDCurso integer not null,

FOREIGN KEY (IDCurso) REFERENCES Cursos(IDCurso)
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
Activo bit not null,

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


--------------------------------------
 --COMENTARIOS / FOROS / HILOS
--------------------------------------

CREATE TABLE Comentarios(
IDComentario bigint identity(1,1) PRIMARY KEY,
IDHilo bigint NOT NULL,
IDAlumno bigint NOT NULL, 
IDProfesor integer not null,
Comentario varchar(1000) not null,
FechaComentario DATETIME not null,
IDRespuesta bigint null,

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
	Titulo varchar (100) not null,
	Descripcion varchar (150) not null,
	FechaCreacion date not null,
	FechaCierre date not null,
	Activa bit
);

create table CUESTIONARIOS (
	IDCuestionario bigint not null primary key identity (1,1),
	IDActividad bigint not null foreign key references ACTIVIDADES (IDActividad),
	Intentos bigint not null
);

create table PREGUNTAS(
	IDPregunta bigint not null primary key identity (1,1),
	IDCuestionario bigint not null foreign key references CUESTIONARIOS (IDCuestionario),
	Enunciado varchar (300) not null, 
	Puntaje decimal (5,2) default 1.00
);

create table OPCIONES(
	ID bigint not null primary key identity (1,1),
	IDPregunta bigint foreign key references PREGUNTAS (IDPregunta),
	Texto varchar (250) not null,
	EsCorrecta bit default 0
);


--------------------------------------
 --RESPUESTAS / RESULTADOS / CALIFICACIONES
--------------------------------------

create table RESPUESTAALUMNOS(
	ID bigint not null primary key identity (1,1),
	IDAlumno bigint not null foreign key references ALUMNOS(IDAlumno),
	OpcionElegida bigint not null foreign key references OPCIONES (ID),
	Correcta bit,
	PuntajeObtenido decimal (5,2)
);

create table RESULTADOCUESTIONARIO(
	ID bigint not null primary key identity (1,1),
	IDCuestionario bigint not null foreign key references CUESTIONARIOS(IDCuestionario),
	IDAlumno bigint not null foreign key references ALUMNOS(IDAlumno),
	PuntajeObtenido decimal (5,2),
	PuntajeMaximo decimal (5,2),
	Intento bigint,
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
Institucion varchar(100) not null,
Certificado varchar(100) not null,
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


