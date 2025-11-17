--ARCHIVO DE VISTAS

--El término "target" se utiliza en marketing para describir al comprador ideal
--o al público objetivo que se desea alcanzar con una campaña publicitaria
--o un producto. 

--13/17 años	Adolescentes, exploración vocacional
--18/25 años	Jóvenes adultos, formación académica o técnica
--26/35 años	Profesionales jóvenes, desarrollo de carrera
--36/50 años	Adultos con experiencia laboral, actualización profesional
CREATE VIEW VW_TARGET_EDAD AS
SELECT 
Curs.Nombre as [Nombre del curso],
  COUNT(*) AS Inscriptos,
  SUM(
    CASE 
      WHEN DATEDIFF(YEAR, U.FechaNacimiento, GETDATE()) 
           - CASE 
               WHEN MONTH(U.FechaNacimiento) > MONTH(GETDATE()) 
                    OR (MONTH(U.FechaNacimiento) = MONTH(GETDATE()) AND DAY(U.FechaNacimiento) > DAY(GETDATE()))
               THEN 1 ELSE 0 
             END BETWEEN 18 AND 25
      THEN 1 ELSE 0 
    END
  ) AS [Personas entre 18 y 25],
  SUM(
    CASE 
      WHEN DATEDIFF(YEAR, U.FechaNacimiento, GETDATE()) 
           - CASE 
               WHEN MONTH(U.FechaNacimiento) > MONTH(GETDATE()) 
                    OR (MONTH(U.FechaNacimiento) = MONTH(GETDATE()) AND DAY(U.FechaNacimiento) > DAY(GETDATE()))
               THEN 1 ELSE 0 
             END BETWEEN 26 AND 35
      THEN 1 ELSE 0 
    END
  ) AS [Personas entre 26 y 35],
  SUM(
    CASE 
      WHEN DATEDIFF(YEAR, U.FechaNacimiento, GETDATE()) 
           - CASE 
               WHEN MONTH(U.FechaNacimiento) > MONTH(GETDATE()) 
                    OR (MONTH(U.FechaNacimiento) = MONTH(GETDATE()) AND DAY(U.FechaNacimiento) > DAY(GETDATE()))
               THEN 1 ELSE 0 
             END BETWEEN 36 AND 50
      THEN 1 ELSE 0 
    END
  ) AS [Personas entre 36 y 50]
FROM Alumnos AS Alum
INNER JOIN CURSOSXALUMNO AS CurAlum ON CurAlum.IDAlumno = Alum.IDAlumno
INNER JOIN Cursos AS Curs ON Curs.IDCurso = CurAlum.IDCurso
INNER JOIN Usuarios AS U ON U.IDUsuario = Alum.IDUsuario
GROUP BY Curs.Nombre;

--Por favor ejecutar la siguiente línea para ver la vista
  select * from VW_TARGET_EDAD

  ---------------------------------------------------------------------------------
  --_________________________________________________________________________________
--------------------------------------------------------------------------------------

CREATE VIEW VW_PORCENTAJE_APROB_DESAP_CURSO51 AS
SELECT 
  Cur.Nombre AS [Nombre del curso], 
  (SELECT COUNT(*) FROM CURSOSXALUMNO AS CA WHERE CA.IDCurso = 51 ) AS Inscriptos,
  SUM(CASE WHEN C.Nota >= 6 AND C.IDActividad = 1 THEN 1 ELSE 0 END) AS [Cant. Aprob. Examen 1],
  SUM(CASE WHEN C.Nota < 6 AND C.IDActividad = 1 THEN 1 ELSE 0 END) AS [Cant. Desap. Examen 1],
  SUM(CASE WHEN C.Nota >= 6 AND C.IDActividad = 2 THEN 1 ELSE 0 END) AS [Cant. Aprob. Examen 2],
  SUM(CASE WHEN C.Nota < 6 AND C.IDActividad = 2 THEN 1 ELSE 0 END) AS [Cant. Desap. Examen 2],
  CAST(SUM(CASE WHEN C.Nota >= 6 AND C.IDActividad = 1 THEN 1 ELSE 0 END) * 100.0 /
       NULLIF(SUM(CASE WHEN C.IDActividad = 1 THEN 1 ELSE 0 END),0) AS DECIMAL(5,2))
	   AS [Porc. Aprob. Examen 1],
  CAST(SUM(CASE WHEN C.Nota < 6 AND C.IDActividad = 1 THEN 1 ELSE 0 END) * 100.0 /
       NULLIF(SUM(CASE WHEN C.IDActividad = 1 THEN 1 ELSE 0 END),0) AS DECIMAL(5,2))
	   AS [Porc. Desap. Examen 1],
  CAST(SUM(CASE WHEN C.Nota >= 6 AND C.IDActividad = 2 THEN 1 ELSE 0 END) * 100.0 /
       NULLIF(SUM(CASE WHEN C.IDActividad = 2 THEN 1 ELSE 0 END),0) AS DECIMAL(5,2))
	   AS [Porc. Aprob. Examen 2],
  CAST(SUM(CASE WHEN C.Nota < 6 AND C.IDActividad = 2 THEN 1 ELSE 0 END) * 100.0 /
       NULLIF(SUM(CASE WHEN C.IDActividad = 2 THEN 1 ELSE 0 END),0) AS DECIMAL(5,2))
	   AS [Porc. Desap. Examen 2]
FROM CALIFICACIONES AS C
INNER JOIN Cursos AS Cur ON Cur.IDCurso = Cur.IDCurso
WHERE CUR.IDCurso = 51 AND C.IDActividad IN (1, 2)
GROUP BY Cur.Nombre;

--Por favor ejecutar la siguiente linea para ver la vista.
SELECT * FROM VW_PORCENTAJE_APROB_DESAP_CURSO51

  ---------------------------------------------------------------------------------
  --_________________________________________________________________________________
--------------------------------------------------------------------------------------
--Ranking de cursos por un año 

create view VW_RankingCursosxAño as
SELECT
	c.IDCurso,
	c.Nombre as NombreCurso,
	year (cxa.fechaInscripcion) as Año,
	count (cxa.IDCurso) as CantidadVendida
	FROM CURSOS c 
	left join CURSOSXALUMNO cxa on c.IDCurso = cxa.IDCurso
	group by c.IDCurso, 
			 c.Nombre, 
			 year (cxa.FechaInscripcion)


--Por favor ejecutar la siguiente linea para ver la vista.
select * from VW_RankingCursosxAño
where año= 2025
order by CantidadVendida desc;


