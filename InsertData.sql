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


