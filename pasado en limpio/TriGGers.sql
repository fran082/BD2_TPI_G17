--TRIGGER

CREATE TRIGGER TGG_EliminarActividad on ACTIVIDADES
INSTEAD OF DELETE
AS
BEGIN
-- CÓDIGO DEL TRIGGER
		 UPDATE Act
		 SET Act.Activo = 0
		 FROM ACTIVIDADES Act
		 INNER JOIN deleted d ON Act.IDActividad = d.IDActividad
		 PRINT 'Se marcó la actividad como inactiva.';

		 DELETE Cal
		 FROM CALIFICACIONES Cal
		 INNER JOIN deleted d ON Cal.IDActividad = d.IDActividad
		 PRINT 'Se eliminaron las calificaciones asociadas.';

END;

--Por favor elimina una actividad de forma física para ver funcionar el trigger. 
--DELETE FROM ACTIVIDADES where IDActividad = 6



create trigger TR_CalcularNotaFinal 
on CALIFICACIONES AFTER insert, update 
as BEGIN
	set nocount on;
	
	UPDATE c set NotaFinal = Promedios.promedio
	from CALIFICACIONES c
	inner join (
		select IDAlumno,
			   avg(Nota) as Promedio
		from CALIFICACIONES 
		group by IDAlumno
	) as Promedios 
	on c.IDAlumno = Promedios.IDAlumno
	where c.IDAlumno in (select IDAlumno from inserted);
END;

----DISABLE TRIGGER TR_CalcularNotaFinal on CALIFICACIONES
----ENABLE TRIGGER TR_CalcularNotaFinal on CALIFICACIONES



CREATE TRIGGER TR_LimiteIntentosCuestionarios
ON RESULTADOCUESTIONARIO
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Variables para guardar los datos del INSERT
    DECLARE @IDCuestionario BIGINT;
    DECLARE @IDAlumno BIGINT;
    DECLARE @IntentosPrevios INT;
    DECLARE @IntentosPermitidos INT;

    -- valores que vienen del INSERT
    SELECT 
        @IDCuestionario = IDCuestionario,
        @IDAlumno = IDAlumno
    FROM inserted;

    -- cuántos intentos ya realizó este alumno
    SELECT @IntentosPrevios = COUNT(*)
    FROM RESULTADOCUESTIONARIO
    WHERE IDCuestionario = @IDCuestionario
      AND IDAlumno = @IDAlumno;
    
    -- intentos permite el cuestionario
    SELECT @IntentosPermitidos = Intentos
    FROM CUESTIONARIOS
    WHERE IDCuestionario = @IDCuestionario;

    -- Valida si supera el límite
    IF (@IntentosPrevios >= @IntentosPermitidos)
    BEGIN
        PRINT 'LIMITE DE INTENTOS ALCANZADOS. INTENTO "NO" REGISTRADO.';
        RETURN;
    END

    -- Inserta el intento con número REAL (IntentosPrevios + 1)
    INSERT INTO RESULTADOCUESTIONARIO
        (IDCuestionario, IDAlumno, PuntajeObtenido, PuntajeMaximo, Intento, Aprobado)
    SELECT 
        IDCuestionario,
        IDAlumno,
        PuntajeObtenido,
        PuntajeMaximo,
        @IntentosPrevios + 1,   -- << Num. de intento REAL
        Aprobado
    FROM inserted;

END;

--DISABLE TRIGGER TR_LimitesDeIntentosCuestionarios on RESULTADOCUESTIONARIO 

--ENABLE TRIGGER TR_LimitesDeIntentosCuestionarios on RESULTADOCUESTIONARIO 

SELECT IDCuestionario, Intentos FROM CUESTIONARIOS;
SELECT * FROM RESULTADOCUESTIONARIO WHERE IDCuestionario = 1 AND IDAlumno = 1;


insert into RESULTADOCUESTIONARIO(IDCuestionario,IDAlumno,PuntajeObtenido,PuntajeMaximo,Intento,Aprobado) VALUES (1,1,0.00,0.00,3,0) ;



delete RESULTADOCUESTIONARIO WHERE ID=45