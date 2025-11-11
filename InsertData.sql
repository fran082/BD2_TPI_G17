INSERT INTO Cursos (CargaHoraria, Nombre) VALUES
(40, 'Curso de Manicura'),
(60, 'Curso de Masajista'),
(120, 'Secretariado Médico'),
(80, 'Auxiliar de Farmacia'),
(35, 'Curso de Pedicura'),
(50, 'Curso de Ceramista'),
(90, 'Curso de Estética Facial'),
(100, 'Curso de Peluquería'),
(70, 'Curso de Maquillaje Profesional'),
(45, 'Curso de Reflexología'),
(60, 'Reparación de Celulares'),
(100, 'Técnico en Computación'),
(80, 'Reparación de Aires Acondicionados'),
(90, 'Curso de Plomería'),
(75, 'Curso de Electricidad Domiciliaria'),
(85, 'Curso de Carpintería'),
(70, 'Curso de Soldadura Básica'),
(95, 'Curso de Mecánica de Motos'),
(110, 'Curso de Mecánica Automotriz'),
(65, 'Curso de Instalación de Redes de Internet');


INSERT INTO Comisiones (NumeroComision, Turno, CantDias, HorarioComienzo, HorarioCierre, IDCurso) VALUES
(201, 'mañana', 3, 8, 10, 50),
(202, 'mañana', 4, 9, 11, 51),
(203, 'tarde', 3, 14, 16, 52),
(204, 'tarde', 5, 15, 17, 53),
(205, 'noche', 2, 18, 20, 54),
(206, 'noche', 3, 19, 21, 55),
(207, 'mañana', 4, 10, 12, 56),
(208, 'tarde', 3, 13, 15, 57),
(209, 'noche', 2, 20, 22, 58),
(210, 'mañana', 5, 8, 10, 59),
(211, 'tarde', 4, 16, 18, 60),
(212, 'noche', 3, 19, 21, 61),
(213, 'mañana', 2, 9, 11, 62),
(214, 'tarde', 3, 14, 16, 63),
(215, 'noche', 4, 18, 20, 64),
(216, 'mañana', 5, 10, 12, 65),
(217, 'tarde', 2, 15, 17, 66),
(218, 'noche', 3, 20, 22, 67),
(219, 'mañana', 4, 8, 10, 68),
(220, 'tarde', 3, 13, 15, 69);


-- Cada comisión del 1 al 20 tendrá 3 foros
INSERT INTO Foros (IDComision) VALUES
(1), (1), (1),
(2), (2), (2),
(3), (3), (3),
(4), (4), (4),
(5), (5), (5),
(6), (6), (6),
(7), (7), (7),
(8), (8), (8),
(9), (9), (9),
(10), (10), (10),
(11), (11), (11),
(12), (12), (12),
(13), (13), (13),
(14), (14), (14),
(15), (15), (15),
(16), (16), (16),
(17), (17), (17),
(18), (18), (18),
(19), (19), (19),
(20), (20), (20);


-- Asignar nombres a los 60 foros
UPDATE Foros SET Nombre = 'Novedades' WHERE IDForo IN (1,4,7,10,13,16,19,22,25,28,31,34,37,40,43,46,49,52,55,58);
UPDATE Foros SET Nombre = 'Cafetería' WHERE IDForo IN (2,5,8,11,14,17,20,23,26,29,32,35,38,41,44,47,50,53,56,59);
UPDATE Foros SET Nombre = 'Foro de dudas' WHERE IDForo IN (3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60);


-- Foro 1 (Novedades) - 10 hilos
INSERT INTO Hilos (IDForo, Nombre) VALUES
(1, 'Nota de actividad 1'),
(1, 'Nota de actividad 2'),
(1, 'Comienzo de cursada'),
(1, 'Forma de evaluar'),
(1, 'Entrega de trabajos'),
(1, 'Examen parcial'),
(1, 'Examen final'),
(1, 'Cronograma actualizado'),
(1, 'Recordatorio de asistencia'),
(1, 'Aviso importante');

-- Foro 2 (Cafetería) - 10 hilos
INSERT INTO Hilos (IDForo, Nombre) VALUES
(2, 'Hola soy Juan'),
(2, 'Hola soy María'),
(2, 'Hola soy Pedro'),
(2, 'Hola soy Lucía'),
(2, 'Hola soy Martín'),
(2, 'Hola soy Carla'),
(2, 'Hola soy Esteban'),
(2, 'Hola soy Sofía'),
(2, 'Hola soy Nicolás'),
(2, 'Hola soy Valeria');

-- Foro 3 (Foro de dudas) - 20 hilos
INSERT INTO Hilos (IDForo, Nombre) VALUES
(3, 'Dudas sobre el ejercicio 1'),
(3, 'Dudas sobre el ejercicio 2'),
(3, 'Dudas sobre el ejercicio 3'),
(3, 'Dudas sobre el ejercicio 4'),
(3, 'Dudas sobre el ejercicio 5'),
(3, 'Dudas sobre el ejercicio 6'),
(3, 'Dudas sobre el ejercicio 7'),
(3, 'Dudas sobre el ejercicio 8'),
(3, 'Dudas sobre el ejercicio 9'),
(3, 'Dudas sobre el ejercicio 10'),
(3, 'Dudas sobre el ejercicio 11'),
(3, 'Dudas sobre el ejercicio 12'),
(3, 'Dudas sobre el ejercicio 13'),
(3, 'Dudas sobre el ejercicio 14'),
(3, 'Dudas sobre el ejercicio 15'),
(3, 'Dudas sobre el ejercicio 16'),
(3, 'Dudas sobre el ejercicio 17'),
(3, 'Dudas sobre el ejercicio 18'),
(3, 'Dudas sobre el ejercicio 19'),
(3, 'Dudas sobre el ejercicio 20');


INSERT INTO Hilos (IDForo, Nombre) VALUES
(4, 'Inicio de inscripciones'),
(4, 'Entrega de certificados'),
(4, 'Nueva actividad programada'),
(4, 'Cambio de aula'),
(4, 'Aviso de feriado');

INSERT INTO Hilos (IDForo, Nombre) VALUES
(5, 'Hola soy Daniela'),
(5, 'Hola soy Marcos'),
(5, 'Hola soy Laura'),
(5, 'Hola soy Diego'),
(5, 'Hola soy Camila');

INSERT INTO Hilos (IDForo, Nombre) VALUES
(6, 'Dudas sobre el ejercicio 1'),
(6, 'Dudas sobre el ejercicio 2'),
(6, 'Dudas sobre el ejercicio 3'),
(6, 'Dudas sobre el ejercicio 4'),
(6, 'Dudas sobre el ejercicio 5'),
(6, 'Dudas sobre el ejercicio 6'),
(6, 'Dudas sobre el ejercicio 7'),
(6, 'Dudas sobre el ejercicio 8'),
(6, 'Dudas sobre el ejercicio 9'),
(6, 'Dudas sobre el ejercicio 10');

INSERT INTO Hilos (IDForo, Nombre) VALUES
(7, 'Inicio de clases'),
(7, 'Entrega de material'),
(7, 'Cambio de profesor'),
(7, 'Nueva actividad práctica'),
(7, 'Aviso de reunión');

INSERT INTO Hilos (IDForo, Nombre) VALUES
(8, 'Hola soy Andrés'),
(8, 'Hola soy Julieta'),
(8, 'Hola soy Pablo'),
(8, 'Hola soy Florencia'),
(8, 'Hola soy Ricardo');

INSERT INTO Hilos (IDForo, Nombre) VALUES
(9, 'Dudas sobre el ejercicio 1'),
(9, 'Dudas sobre el ejercicio 2'),
(9, 'Dudas sobre el ejercicio 3'),
(9, 'Dudas sobre el ejercicio 4'),
(9, 'Dudas sobre el ejercicio 5'),
(9, 'Dudas sobre el ejercicio 6'),
(9, 'Dudas sobre el ejercicio 7'),
(9, 'Dudas sobre el ejercicio 8'),
(9, 'Dudas sobre el ejercicio 9'),
(9, 'Dudas sobre el ejercicio 10');


-- Comisión 4 (Foros 10,11,12)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(10,'Cronograma actualizado'),(10,'Recordatorio de asistencia'),(10,'Aviso de reunión'),
(11,'Hola soy Ricardo'),(11,'Hola soy Valeria'),(11,'Hola soy Nicolás'),
(12,'Dudas sobre el ejercicio 1'),(12,'Dudas sobre el ejercicio 2'),
(12,'Dudas sobre el ejercicio 3'),(12,'Dudas sobre el ejercicio 4'),
(12,'Dudas sobre el ejercicio 5');

-- Comisión 5 (Foros 13,14,15)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(13,'Examen parcial'),(13,'Examen final'),(13,'Entrega de trabajos'),
(14,'Hola soy Carla'),(14,'Hola soy Esteban'),(14,'Hola soy Sofía'),
(15,'Dudas sobre el ejercicio 1'),(15,'Dudas sobre el ejercicio 2'),
(15,'Dudas sobre el ejercicio 3'),(15,'Dudas sobre el ejercicio 4'),
(15,'Dudas sobre el ejercicio 5');

-- Comisión 6 (Foros 16,17,18)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(16,'Nueva actividad programada'),(16,'Aviso de feriado'),(16,'Cambio de profesor'),
(17,'Hola soy Martín'),(17,'Hola soy Daniela'),(17,'Hola soy Marcos'),
(18,'Dudas sobre el ejercicio 1'),(18,'Dudas sobre el ejercicio 2'),
(18,'Dudas sobre el ejercicio 3'),(18,'Dudas sobre el ejercicio 4'),
(18,'Dudas sobre el ejercicio 5');

-- Comisión 7 (Foros 19,20,21)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(19,'Inicio de inscripciones'),(19,'Entrega de certificados'),(19,'Aviso importante'),
(20,'Hola soy Julieta'),(20,'Hola soy Pablo'),(20,'Hola soy Florencia'),
(21,'Dudas sobre el ejercicio 1'),(21,'Dudas sobre el ejercicio 2'),
(21,'Dudas sobre el ejercicio 3'),(21,'Dudas sobre el ejercicio 4'),
(21,'Dudas sobre el ejercicio 5');

-- Comisión 8 (Foros 22,23,24)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(22,'Nota de actividad 2'),(22,'Comienzo de cursada'),(22,'Forma de evaluar'),
(23,'Hola soy Andrés'),(23,'Hola soy Ricardo'),(23,'Hola soy Valeria'),
(24,'Dudas sobre el ejercicio 1'),(24,'Dudas sobre el ejercicio 2'),
(24,'Dudas sobre el ejercicio 3'),(24,'Dudas sobre el ejercicio 4'),
(24,'Dudas sobre el ejercicio 5');

-- Comisión 9 (Foros 25,26,27)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(25,'Entrega de material'),(25,'Nueva actividad práctica'),(25,'Aviso de reunión'),
(26,'Hola soy Nicolás'),(26,'Hola soy Carla'),(26,'Hola soy Esteban'),
(27,'Dudas sobre el ejercicio 1'),(27,'Dudas sobre el ejercicio 2'),
(27,'Dudas sobre el ejercicio 3'),(27,'Dudas sobre el ejercicio 4'),
(27,'Dudas sobre el ejercicio 5');

-- Comisión 10 (Foros 28,29,30)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(28,'Cronograma actualizado'),(28,'Recordatorio de asistencia'),(28,'Aviso importante'),
(29,'Hola soy Sofía'),(29,'Hola soy Martín'),(29,'Hola soy Daniela'),
(30,'Dudas sobre el ejercicio 1'),(30,'Dudas sobre el ejercicio 2'),
(30,'Dudas sobre el ejercicio 3'),(30,'Dudas sobre el ejercicio 4'),
(30,'Dudas sobre el ejercicio 5');

-- Comisión 11 (Foros 31,32,33)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(31,'Inicio de clases'),(31,'Entrega de material'),(31,'Aviso importante'),
(32,'Hola soy Javier'),(32,'Hola soy Paula'),(32,'Hola soy Sergio'),
(33,'Dudas sobre el ejercicio 1'),(33,'Dudas sobre el ejercicio 2'),
(33,'Dudas sobre el ejercicio 3'),(33,'Dudas sobre el ejercicio 4'),
(33,'Dudas sobre el ejercicio 5');

-- Comisión 12 (Foros 34,35,36)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(34,'Nota de actividad 1'),(34,'Forma de evaluar'),(34,'Entrega de trabajos'),
(35,'Hola soy Mariana'),(35,'Hola soy Tomás'),(35,'Hola soy Cecilia'),
(36,'Dudas sobre el ejercicio 1'),(36,'Dudas sobre el ejercicio 2'),
(36,'Dudas sobre el ejercicio 3'),(36,'Dudas sobre el ejercicio 4'),
(36,'Dudas sobre el ejercicio 5');

-- Comisión 13 (Foros 37,38,39)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(37,'Examen parcial'),(37,'Examen final'),(37,'Aviso de reunión'),
(38,'Hola soy Facundo'),(38,'Hola soy Lorena'),(38,'Hola soy Guillermo'),
(39,'Dudas sobre el ejercicio 1'),(39,'Dudas sobre el ejercicio 2'),
(39,'Dudas sobre el ejercicio 3'),(39,'Dudas sobre el ejercicio 4'),
(39,'Dudas sobre el ejercicio 5');

-- Comisión 14 (Foros 40,41,42)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(40,'Nueva actividad programada'),(40,'Cambio de aula'),(40,'Aviso de feriado'),
(41,'Hola soy Verónica'),(41,'Hola soy Alejandro'),(41,'Hola soy Carla'),
(42,'Dudas sobre el ejercicio 1'),(42,'Dudas sobre el ejercicio 2'),
(42,'Dudas sobre el ejercicio 3'),(42,'Dudas sobre el ejercicio 4'),
(42,'Dudas sobre el ejercicio 5');

-- Comisión 15 (Foros 43,44,45)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(43,'Inicio de inscripciones'),(43,'Entrega de certificados'),(43,'Aviso importante'),
(44,'Hola soy Matías'),(44,'Hola soy Gabriela'),(44,'Hola soy Hernán'),
(45,'Dudas sobre el ejercicio 1'),(45,'Dudas sobre el ejercicio 2'),
(45,'Dudas sobre el ejercicio 3'),(45,'Dudas sobre el ejercicio 4'),
(45,'Dudas sobre el ejercicio 5');

-- Comisión 16 (Foros 46,47,48)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(46,'Nota de actividad 2'),(46,'Comienzo de cursada'),(46,'Forma de evaluar'),
(47,'Hola soy Natalia'),(47,'Hola soy Franco'),(47,'Hola soy Julieta'),
(48,'Dudas sobre el ejercicio 1'),(48,'Dudas sobre el ejercicio 2'),
(48,'Dudas sobre el ejercicio 3'),(48,'Dudas sobre el ejercicio 4'),
(48,'Dudas sobre el ejercicio 5');

-- Comisión 17 (Foros 49,50,51)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(49,'Entrega de material'),(49,'Nueva actividad práctica'),(49,'Aviso de reunión'),
(50,'Hola soy Lucas'),(50,'Hola soy Romina'),(50,'Hola soy Esteban'),
(51,'Dudas sobre el ejercicio 1'),(51,'Dudas sobre el ejercicio 2'),
(51,'Dudas sobre el ejercicio 3'),(51,'Dudas sobre el ejercicio 4'),
(51,'Dudas sobre el ejercicio 5');

-- Comisión 18 (Foros 52,53,54)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(52,'Cronograma actualizado'),(52,'Recordatorio de asistencia'),(52,'Aviso importante'),
(53,'Hola soy Florencia'),(53,'Hola soy Nicolás'),(53,'Hola soy Carla'),
(54,'Dudas sobre el ejercicio 1'),(54,'Dudas sobre el ejercicio 2'),
(54,'Dudas sobre el ejercicio 3'),(54,'Dudas sobre el ejercicio 4'),
(54,'Dudas sobre el ejercicio 5');

-- Comisión 19 (Foros 55,56,57)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(55,'Inicio de clases'),(55,'Entrega de material'),(55,'Aviso importante'),
(56,'Hola soy Martín'),(56,'Hola soy Daniela'),(56,'Hola soy Marcos'),
(57,'Dudas sobre el ejercicio 1'),(57,'Dudas sobre el ejercicio 2'),
(57,'Dudas sobre el ejercicio 3'),(57,'Dudas sobre el ejercicio 4'),
(57,'Dudas sobre el ejercicio 5');

-- Comisión 20 (Foros 58,59,60)
INSERT INTO Hilos (IDForo, Nombre) VALUES
(58,'Nota de actividad 3'),(58,'Comienzo de cursada'),(58,'Forma de evaluar'),
(59,'Hola soy Julieta'),(59,'Hola soy Pablo'),(59,'Hola soy Ricardo'),
(60,'Dudas sobre el ejercicio 1'),(60,'Dudas sobre el ejercicio 2'),
(60,'Dudas sobre el ejercicio 3'),(60,'Dudas sobre el ejercicio 4'),
(60,'Dudas sobre el ejercicio 5');


INSERT INTO USUARIOS (Nombre, Apellido, DNI, Mail, Contrasena, FechaNacimiento)
VALUES
('Juan',    'Pérez',    30111222, 'juan.perez@mail.com',     'hash_juan_01',    '1990-05-12'),
('María',   'Gómez',    28999111, 'maria.gomez@mail.com',    'hash_maria_02',   '1992-07-23'),
('Carlos',  'López',    31222333, 'carlos.lopez@mail.com',   'hash_carlos_03',  '1988-03-15'),
('Lucía',   'Fernández',27888123, 'lucia.fernandez@mail.com','hash_lucia_04',   '1995-11-02'),
('Pedro',   'Sosa',     33444555, 'pedro.sosa@mail.com',     'hash_pedro_05',   '1991-01-19'),
('Ana',     'Torres',   30011234, 'ana.torres@mail.com',     'hash_ana_06',     '1993-08-30'),
('Diego',   'Martínez', 29567890, 'diego.martinez@mail.com', 'hash_diego_07',   '1989-04-07'),
('Sofía',   'Rojas',    31004567, 'sofia.rojas@mail.com',    'hash_sofia_08',   '1996-09-14'),
('Nicolás', 'Suárez',   32233445, 'nicolas.suarez@mail.com', 'hash_nico_09',    '1994-12-01'),
('Valeria', 'Castro',   28877665, 'valeria.castro@mail.com', 'hash_vale_10',    '1997-03-22'),
('Federico','García',   29990001, 'federico.garcia@mail.com','hash_fede_11',    '1987-07-11'),
('Agustina','Molina',   31555123, 'agustina.molina@mail.com','hash_agus_12',    '1998-02-05'),
('Martín',  'Aguilar',  32567012, 'martin.aguilar@mail.com', 'hash_martin_13',  '1991-10-18'),
('Camila',  'Navarro',  28123456, 'camila.navarro@mail.com', 'hash_camila_14',  '1993-06-25'),
('Julián',  'Herrera',  30456789, 'julian.herrera@mail.com', 'hash_julian_15',  '1990-12-09');



INSERT INTO ALUMNOS (Sexo, FechaDeRegistro, Activo)
VALUES
('Masculino', GETDATE(), 1),
('Femenino',  GETDATE(), 1),
('Masculino', GETDATE(), 1),
('Femenino',  GETDATE(), 1),
('Masculino', GETDATE(), 1),
('Femenino',  GETDATE(), 1),
('Masculino', GETDATE(), 1),
('Femenino',  GETDATE(), 1),
('Masculino', GETDATE(), 1),
('Femenino',  GETDATE(), 0),
('Masculino', GETDATE(), 1),
('Femenino',  GETDATE(), 1),
('Masculino', GETDATE(), 0),
('Femenino',  GETDATE(), 1),
('Masculino', GETDATE(), 1);


--idforo,idcomision,nombre
INSERT INTO FOROS( IDComision, Nombre)
VALUES
(2,'Examen 1'),
(2,'Examen 2'),
(20,'Examen 1'),
(20,'Examen 2'),
(12,'Examen 1'),
(12,'Examen 2');


-- Actividades para curso de Masajista (Foro 51)
INSERT INTO ACTIVIDADES (IDForo, Titulo, Descripcion, FechaCreacion, FechaCierre, Activa)
VALUES
(61, 'Práctica de técnicas básicas de masaje', 'Ejercicios iniciales de relajación muscular', '2025-11-01', '2025-11-15', 1),
(62, 'Masaje terapéutico avanzado', 'Aplicación de técnicas para contracturas y lesiones leves', '2025-11-10', '2025-11-25', 1);

-- Actividades para curso de Instalación de redes de internet (Foro 69)
INSERT INTO ACTIVIDADES (IDForo, Titulo, Descripcion, FechaCreacion, FechaCierre, Activa)
VALUES
(63, 'Configuración de routers domésticos', 'Práctica de instalación y configuración básica de routers WiFi', '2025-11-05', '2025-11-20', 1),
(64, 'Cableado estructurado', 'Ejercicio de armado de red LAN con normas TIA/EIA', '2025-11-12', '2025-11-30', 1);

-- Actividades para curso de Técnico en Computación (Foro 61)
INSERT INTO ACTIVIDADES (IDForo, Titulo, Descripcion, FechaCreacion, FechaCierre, Activa)
VALUES
(65, 'Armado de PC de escritorio', 'Práctica de ensamblaje de componentes de hardware', '2025-11-03', '2025-11-18', 1),
(66, 'Instalación de sistemas operativos', 'Ejercicio de instalación de Windows y Linux en máquinas virtuales', '2025-11-08', '2025-11-25', 1);

--Para el 1er examen son 2 intentos, para el último examen son un solo intento.
INSERT INTO CUESTIONARIOS (IDActividad, Intentos)
VALUES 
(1, 2),
(2, 1),
(3, 2),
(4, 1),
(5, 2),
(6, 1);



-- Cuestionario 1: Masajista - Técnicas básicas de masaje
INSERT INTO PREGUNTAS (IDCuestionario, Enunciado, Puntaje)
VALUES
(1, '¿Cuál es el objetivo principal del masaje de relajación?', 2.00),
(1, '¿Qué parte del cuerpo suele trabajarse primero en un masaje básico?', 2.00),
(1, '¿Qué elemento se utiliza comúnmente para facilitar el masaje?', 2.00),
(1, '¿Qué efecto produce un masaje suave en la circulación sanguínea?', 2.00),
(1, '¿Qué postura debe mantener el masajista para evitar lesiones?', 2.00);

-- Cuestionario 2: Masajista - Masaje terapéutico avanzado
INSERT INTO PREGUNTAS (IDCuestionario, Enunciado, Puntaje)
VALUES
(2, '¿Qué técnica se utiliza para tratar contracturas musculares?', 2.00),
(2, '¿Qué debe evitarse en un masaje terapéutico?', 2.00),
(2, '¿Qué tipo de masaje se recomienda para lesiones deportivas?', 2.00),
(2, '¿Qué importancia tiene la comunicación con el paciente durante el masaje?', 2.00),
(2, '¿Qué precaución se debe tomar al aplicar presión profunda?', 2.00);

-- Cuestionario 3: Redes - Configuración de routers domésticos
INSERT INTO PREGUNTAS (IDCuestionario, Enunciado, Puntaje)
VALUES
(3, '¿Cuál es la dirección IP más común para acceder a un router?', 2.00),
(3, '¿Qué protocolo asigna direcciones IP automáticamente?', 2.00),
(3, '¿Qué tipo de seguridad inalámbrica es más recomendable hoy en día?', 2.00),
(3, '¿Qué significa el acrónimo SSID?', 2.00),
(3, '¿Qué comando permite verificar la conectividad en red?', 2.00);

-- Cuestionario 4: Redes - Cableado estructurado
INSERT INTO PREGUNTAS (IDCuestionario, Enunciado, Puntaje)
VALUES
(4, '¿Qué norma define el orden de colores en cables de red?', 2.00),
(4, '¿Qué herramienta se utiliza para crimpar conectores RJ45?', 2.00),
(4, '¿Qué categoría de cable se recomienda para redes gigabit?', 2.00),
(4, '¿Qué dispositivo se utiliza para probar continuidad en un cable de red?', 2.00),
(4, '¿Qué significa UTP en el contexto de cableado?', 2.00);

-- Cuestionario 5: Técnico en Computación - Armado de PC
INSERT INTO PREGUNTAS (IDCuestionario, Enunciado, Puntaje)
VALUES
(5, '¿Cuál es el primer componente que se instala en el gabinete?', 2.00),
(5, '¿Qué precaución se debe tomar al manipular hardware?', 2.00),
(5, '¿Qué componente almacena el sistema operativo?', 2.00),
(5, '¿Qué tipo de memoria es volátil?', 2.00),
(5, '¿Qué puerto se utiliza para conectar un monitor moderno?', 2.00);

-- Cuestionario 6: Técnico en Computación - Instalación de sistemas operativos
INSERT INTO PREGUNTAS (IDCuestionario, Enunciado, Puntaje)
VALUES
(6, '¿Qué herramienta se usa para crear un USB booteable?', 2.00),
(6, '¿Qué sistema operativo es de código abierto?', 2.00),
(6, '¿Qué partición se crea para instalar un sistema operativo?', 2.00),
(6, '¿Qué comando en Linux muestra la versión del kernel?', 2.00),
(6, '¿Qué utilidad de Windows permite gestionar discos y particiones?', 2.00);



-- Cuestionario 1: Masajista - Técnicas básicas de masaje
INSERT INTO OPCIONES (IDPregunta, Texto, EsCorrecta)
VALUES
(1, 'Reducir la tensión muscular', 1),
(1, 'Aumentar la fuerza', 0),
(1, 'Provocar dolor', 0),

(2, 'Espalda', 1),
(2, 'Cabeza', 0),
(2, 'Pies', 0),

(3, 'Aceite de masaje', 1),
(3, 'Alcohol', 0),
(3, 'Agua fría', 0),

(4, 'Mejora la circulación sanguínea', 1),
(4, 'Disminuye la circulación', 0),
(4, 'No tiene efecto', 0),

(5, 'Mantener postura ergonómica', 1),
(5, 'Inclinarse excesivamente', 0),
(5, 'Trabajar de pie en tensión', 0);

-- Cuestionario 2: Masajista - Terapéutico avanzado
INSERT INTO OPCIONES (IDPregunta, Texto, EsCorrecta)
VALUES
(6, 'Fricción profunda', 1),
(6, 'Golpeteo suave', 0),
(6, 'Masaje superficial', 0),

(7, 'Aplicar presión sobre zonas lesionadas', 1),
(7, 'Usar aceites naturales', 0),
(7, 'Mantener comunicación con el paciente', 0),

(8, 'Masaje deportivo', 1),
(8, 'Masaje relajante', 0),
(8, 'Masaje estético', 0),

(9, 'Permite ajustar intensidad y comodidad', 1),
(9, 'No es necesario hablar', 0),
(9, 'Debe evitarse', 0),

(10, 'Evitar zonas sensibles', 1),
(10, 'Aplicar máxima presión siempre', 0),
(10, 'Ignorar la reacción del paciente', 0);

-- Cuestionario 3: Redes - Routers
INSERT INTO OPCIONES (IDPregunta, Texto, EsCorrecta)
VALUES
(11, '192.168.0.1', 1),
(11, '127.0.0.1', 0),
(11, '255.255.255.0', 0),

(12, 'DHCP', 1),
(12, 'DNS', 0),
(12, 'FTP', 0),

(13, 'WPA2/WPA3', 1),
(13, 'WEP', 0),
(13, 'Sin contraseña', 0),

(14, 'Service Set Identifier', 1),
(14, 'Secure System ID', 0),
(14, 'Server Session ID', 0),

(15, 'PING', 1),
(15, 'COPY', 0),
(15, 'DIR', 0);

-- Cuestionario 4: Redes - Cableado
INSERT INTO OPCIONES (IDPregunta, Texto, EsCorrecta)
VALUES
(16, 'TIA/EIA-568B', 1),
(16, 'ISO 9001', 0),
(16, 'IEEE 802.11', 0),

(17, 'Crimpadora', 1),
(17, 'Multímetro', 0),
(17, 'Alicate', 0),

(18, 'Cat6', 1),
(18, 'Cat3', 0),
(18, 'Coaxial', 0),

(19, 'Tester de red', 1),
(19, 'Martillo', 0),
(19, 'Destornillador', 0),

(20, 'Unshielded Twisted Pair', 1),
(20, 'Universal Transfer Protocol', 0),
(20, 'User Terminal Port', 0);

-- Cuestionario 5: Técnico en Computación - Armado de PC
INSERT INTO OPCIONES (IDPregunta, Texto, EsCorrecta)
VALUES
(21, 'Placa madre', 1),
(21, 'Fuente de alimentación', 0),
(21, 'Disco rígido', 0),

(22, 'Usar pulsera antiestática', 1),
(22, 'Trabajar en ambiente húmedo', 0),
(22, 'Encender la PC durante el armado', 0),

(23, 'Disco duro/SSD', 1),
(23, 'Memoria RAM', 0),
(23, 'Fuente de poder', 0),

(24, 'RAM', 1),
(24, 'ROM', 0),
(24, 'Disco duro', 0),

(25, 'HDMI/DisplayPort', 1),
(25, 'PS/2', 0),
(25, 'Puerto paralelo', 0);

-- Cuestionario 6: Técnico en Computación - Sistemas operativos
INSERT INTO OPCIONES (IDPregunta, Texto, EsCorrecta)
VALUES
(26, 'Rufus', 1),
(26, 'Word', 0),
(26, 'Excel', 0),

(27, 'Linux', 1),
(27, 'Windows', 0),
(27, 'macOS', 0),

(28, 'Partición primaria', 1),
(28, 'Partición extendida', 0),
(28, 'Unidad lógica', 0),

(29, 'uname -r', 1),
(29, 'ls -l', 0),
(29, 'pwd', 0),

(30, 'Administrador de discos', 1),
(30, 'Bloc de notas', 0),
(30, 'Panel de control de sonido', 0);




INSERT INTO RESPUESTAUSUARIOS (OpcionElegida, Correcta, PuntajeObtenido)
VALUES
-- Alumno 1 (Cuestionario 1, aprueba: 3 correctas)
( 1, 1, 2.00),   -- P1 correcta
( 5, 0, 0.00),   -- P2 incorrecta
( 7, 1, 2.00),   -- P3 correcta
( 12, 0, 0.00),  -- P4 incorrecta
( 13, 1, 2.00),  -- P5 correcta

-- Alumno 2 (Cuestionario 2, desaprueba: 2 correctas)
( 16, 1, 2.00),  -- P6 correcta
( 20, 0, 0.00),  -- P7 incorrecta
( 22, 1, 2.00),  -- P8 correcta
( 26, 0, 0.00),  -- P9 incorrecta
( 29, 0, 0.00),  -- P10 incorrecta

-- Alumno 3 (Cuestionario 3, aprueba: 3 correctas)
( 31, 1, 2.00),  -- P11 correcta
( 34, 0, 0.00),  -- P12 incorrecta
( 37, 1, 2.00),  -- P13 correcta
( 40, 1, 2.00),  -- P14 correcta
( 45, 0, 0.00),  -- P15 incorrecta

-- Alumno 4 (Cuestionario 4, desaprueba: 2 correctas)
( 46, 1, 2.00),  -- P16 correcta
( 50, 0, 0.00),  -- P17 incorrecta
( 52, 1, 2.00),  -- P18 correcta
( 55, 0, 0.00),  -- P19 incorrecta
( 58, 0, 0.00),  -- P20 incorrecta

-- Alumno 5 (Cuestionario 5, aprueba: 3 correctas)
( 61, 1, 2.00),  -- P21 correcta
( 65, 0, 0.00),  -- P22 incorrecta
( 67, 1, 2.00),  -- P23 correcta
( 70, 1, 2.00),  -- P24 correcta
( 74, 0, 0.00),  -- P25 incorrecta

-- Alumno 6 (Cuestionario 6, desaprueba: 2 correctas)
( 76, 1, 2.00),  -- P26 correcta
( 80, 0, 0.00),  -- P27 incorrecta
( 82, 1, 2.00),  -- P28 correcta
( 85, 0, 0.00),  -- P29 incorrecta
( 88, 0, 0.00),  -- P30 incorrecta

-- Alumno 7 (Cuestionario 1, aprueba: 3 correctas)
( 1, 1, 2.00),   -- P1 correcta
( 6, 0, 0.00),   -- P2 incorrecta
( 7, 1, 2.00),   -- P3 correcta
( 10, 1, 2.00),  -- P4 correcta
( 15, 0, 0.00),  -- P5 incorrecta

-- Alumno 8 (Cuestionario 2, desaprueba: 2 correctas)
( 16, 1, 2.00),  -- P6 correcta
( 17, 0, 0.00),  -- P7 incorrecta
( 22, 1, 2.00),  -- P8 correcta
( 25, 0, 0.00),  -- P9 incorrecta
( 30, 0, 0.00),  -- P10 incorrecta

-- Alumno 9 (Cuestionario 3, aprueba: 3 correctas)
( 31, 1, 2.00),  -- P11 correcta
( 35, 0, 0.00),  -- P12 incorrecta
( 37, 1, 2.00),  -- P13 correcta
( 39, 0, 0.00),  -- P14 incorrecta
( 43, 1, 2.00),  -- P15 correcta

-- Alumno 10 (Cuestionario 4, desaprueba: 2 correctas)
( 46, 1, 2.00),  -- P16 correcta
( 49, 0, 0.00),  -- P17 incorrecta
( 52, 1, 2.00),  -- P18 correcta
( 55, 0, 0.00),  -- P19 incorrecta
( 57, 0, 0.00),  -- P20 incorrecta

-- Alumno 11 (Cuestionario 5, aprueba: 3 correctas)
( 61, 1, 2.00),  -- P21 correcta
( 64, 0, 0.00),  -- P22 incorrecta
( 67, 1, 2.00),  -- P23 correcta
( 70, 1, 2.00),  -- P24 correcta
( 73, 0, 0.00),  -- P25 incorrecta

-- Alumno 12 (Cuestionario 6, desaprueba: 2 correctas)
( 76, 1, 2.00),  -- P26 correcta
( 79, 0, 0.00),  -- P27 incorrecta
( 82, 1, 2.00),  -- P28 correcta
( 84, 0, 0.00),  -- P29 incorrecta
( 89, 0, 0.00),  -- P30 incorrecta

-- Alumno 13 (Cuestionario 1, aprueba: 3 correctas)
( 1, 1, 2.00),   -- P1 correcta
( 4, 1, 2.00),   -- P2 correcta
( 8, 0, 0.00),   -- P3 incorrecta
( 10, 1, 2.00),  -- P4 correcta
( 14, 0, 0.00),  -- P5 incorrecta

-- Alumno 14 (Cuestionario 2, desaprueba: 2 correctas)
( 16, 1, 2.00),  -- P6 correcta
( 19, 0, 0.00),  -- P7 incorrecta
( 22, 1, 2.00),  -- P8 correcta
( 26, 0, 0.00),  -- P9 incorrecta
( 28, 0, 0.00),  -- P10 incorrecta

-- Alumno 15 (Cuestionario 3, aprueba: 3 correctas)
( 31, 1, 2.00),  -- P11 correcta
( 33, 0, 0.00),  -- P12 incorrecta
( 37, 1, 2.00),  -- P13 correcta
( 40, 1, 2.00),  -- P14 correcta
( 44, 0, 0.00);  -- P15 incorrecta




INSERT INTO RESULTADOCUESTIONARIO (IDCuestionario, IDAlumno, PuntajeObtenido, PuntajeMaximo, Intento, Aprobado)
VALUES
-- Cuestionario 1
(1, 1, 6.00, 6.00, 1, 1),  -- Alumno 1 aprueba
(1, 7, 6.00, 6.00, 1, 1),  -- Alumno 7 aprueba
(1, 13, 6.00, 6.00, 1, 1), -- Alumno 13 aprueba

-- Cuestionario 2
(2, 2, 4.00, 4.00, 1, 0),  -- Alumno 2 desaprueba
(2, 8, 4.00, 4.00, 1, 0),  -- Alumno 8 desaprueba
(2, 14, 4.00, 4.00, 1, 0), -- Alumno 14 desaprueba

-- Cuestionario 3
(3, 3, 6.00, 6.00, 1, 1),  -- Alumno 3 aprueba
(3, 9, 6.00, 6.00, 1, 1),  -- Alumno 9 aprueba
(3, 15, 6.00, 6.00, 1, 1), -- Alumno 15 aprueba

-- Cuestionario 4
(4, 4, 4.00, 4.00, 1, 0),  -- Alumno 4 desaprueba
(4, 10, 4.00, 4.00, 1, 0), -- Alumno 10 desaprueba

-- Cuestionario 5
(5, 5, 6.00, 6.00, 1, 1),  -- Alumno 5 aprueba
(5, 11, 6.00, 6.00, 1, 1), -- Alumno 11 aprueba

-- Cuestionario 6
(6, 6, 4.00, 4.00, 1, 0),  -- Alumno 6 desaprueba
(6, 12, 4.00, 4.00, 1, 0); -- Alumno 12 desaprueba


INSERT INTO USUARIOS (Nombre, Apellido, DNI, Mail, Contrasena, FechaNacimiento)
values 
('Oscar Dardo','Robledo',10123311,'p.robledo@docente.com','hashODR','1960-10-10'),
('Juan Jeremias','Casiari',15203111,'p.casiari@docente.com','hashJJC','1975-04-04'),
('Camila','Yacomucci',22011879,'p.yacomucci@docente.com','hashCY','1999-07-07');


INSERT INTO PROFESORES (IDUsuario, FechaIngreso, Sueldo, FechaFinalizacionContrato, Activo)
VALUES
(17, '2025-03-01', 150000, '2026-03-01', 1),
(18, '2025-05-15', 175000, '2026-05-15', 1),
(19, '2025-09-10', 160000, '2026-09-10', 1);


INSERT INTO CURSOSXPROFESOR (IDCurso, IDProfesor, Activo) values
(51,3,1),
(69,2,1),
(61,1,1);


INSERT INTO CURSOSXALUMNO (IDCurso, IDAlumno, Activo) VALUES
-- Curso de masajista (IDCurso = 51)
(51, 1, 1),
(51, 7, 1),
(51, 13, 1),
(51, 2, 1),
(51, 8, 1),
(51, 14, 1),

-- Curso de instalación de redes de internet (IDCurso = 69)
(69, 3, 1),
(69, 9, 1),
(69, 15, 1),
(69, 4, 1),
(69, 10, 1),

-- Curso de técnico en computación (IDCurso = 61)
(61, 5, 1),
(61, 11, 1),
(61, 6, 1),
(61, 12, 1);


INSERT INTO CALIFICACIONES (IDAlumno, IDActividad, Nota, NotaFinal)
VALUES
-- Cuestionario 1
(1, 1, 6.00, NULL),   -- Alumno 1 aprueba
(7, 1, 6.00, NULL),   -- Alumno 7 aprueba
(13, 1, 6.00, NULL),  -- Alumno 13 aprueba

-- Cuestionario 2
(2, 2, 4.00, NULL),   -- Alumno 2 desaprueba
(8, 2, 4.00, NULL),   -- Alumno 8 desaprueba
(14, 2, 4.00, NULL),  -- Alumno 14 desaprueba

-- Cuestionario 3
(3, 3, 6.00, NULL),   -- Alumno 3 aprueba
(9, 3, 6.00, NULL),   -- Alumno 9 aprueba
(15, 3, 6.00, NULL),  -- Alumno 15 aprueba

-- Cuestionario 4
(4, 4, 4.00, NULL),   -- Alumno 4 desaprueba
(10, 4, 4.00, NULL),  -- Alumno 10 desaprueba

-- Cuestionario 5
(5, 5, 6.00, NULL),   -- Alumno 5 aprueba
(11, 5, 6.00, NULL),  -- Alumno 11 aprueba

-- Cuestionario 6
(6, 6, 4.00, NULL),   -- Alumno 6 desaprueba
(12, 6, 4.00, NULL);  -- Alumno 12 desaprueba



