
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


select * from VW_RankingCursosxAño
where año= 2025
order by CantidadVendida desc;


