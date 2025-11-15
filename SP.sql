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