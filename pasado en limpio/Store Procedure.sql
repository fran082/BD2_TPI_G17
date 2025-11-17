--STORE PROCEDURE.
---------------------------------------------------------------------------
--LA PREGUNTA MÁS EQUIVOCADA DE UN CUESTIONARIO A ELECCIÓN
---------------------------------------------------------------------------
CREATE PROCEDURE SP_PREGUNTA_MAS_EQUIVOCADA(
@IDCuestionario bigint
)
AS
BEGIN
  SELECT TOP 1 
    P.IDPregunta AS [ID-Pregunta],
    P.Enunciado AS Pregunta,
	P.Puntaje,
    COUNT(*) AS [Total de desaciertos]
  FROM RESPUESTAALUMNOS AS RA
  INNER JOIN OPCIONES AS OPC ON OPC.ID = RA.OpcionElegida
  INNER JOIN PREGUNTAS AS P ON P.IDPregunta = OPC.IDPregunta
  WHERE RA.Correcta = 0 AND P.IDCuestionario = @IDCuestionario
  GROUP BY P.IDPregunta, P.Enunciado, P.Puntaje
  ORDER BY COUNT(*) DESC
END;


exec SP_PREGUNTA_MAS_EQUIVOCADA 4


---------------------------------------------------------------------------
--AGREGAR ALUMNO A UN CURSO
---------------------------------------------------------------------------

create procedure SP_AgregarAlumnoaCurso
	@IdAlumno bigint,
	@IdCurso bigint
as 
Begin 
	if not exists(
		select 1 from Alumnos where IDAlumno = @IdAlumno
		) 
		begin 
			print 'El Alumno no Existe';
			return;
		end
	
	if not exists(
			select 1 from CURSOS where IDCurso = @IdCurso
		) 
		begin 
			print 'El curso no existe.';
			return;
		end
	if exists(
		select 1 from CURSOSXALUMNO 
		where IDAlumno = @IdAlumno and IDCurso = @IdCurso
	)
		begin
			print 'El Alumno ya esta inscripto al curso.';
			return;
		end

	insert into CURSOSXALUMNO (IDAlumno,IDCurso,FechaInscripcion)
	values (@IdAlumno,@IdCurso,GETDATE());
	
	print 'Se Agrego correctamente.';

end;

--exec SP_AgregarAlumnoaCurso 16,80;



---------------------------------------------------------------------------
--ELIMINAR CURSO
---------------------------------------------------------------------------
--- realiza una baja logica 

create procedure SP_BajaDeCurso
	@IdCurso int
as 
	BEGIN 
		IF NOT EXISTS(
		select 1 from CURSOS where IDCurso = @IdCurso
		) begin 
			print 'El curso no existe.'
			return;
		 end
		
		IF EXISTS (
			select 1 from CURSOS where IDCurso = @IdCurso
		) begin
			print 'El curso ya esta dado de baja'
			return;
		  end

		
		UPDATE CURSOS set Activo = 0 where IDCurso = @IdCurso

		print 'CURSO DADO DE BAJA CORRECTAMENTE.'

	END	

--exec SP_BajaDeCurso 80;