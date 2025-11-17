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



--select * from CALIFICACIONES where IDAlumno=1
--UPDATE CALIFICACIONES SET NotaFinal = 0 WHERE IDAlumno=1 
--DISABLE TRIGGER TR_CalcularNotaFinal on CALIFICACIONES


--ENABLE TRIGGER TR_CalcularNotaFinal on CALIFICACIONES
--UPDATE CALIFICACIONES SET Nota = 9.00 WHERE IDAlumno= 1 AND IDActividad = 2




CREATE TRIGGER TR_LimiteIntentosCuestionarios
ON RESULTADOCUESTIONARIO
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @IDCuestionario BIGINT;
    DECLARE @IDAlumno BIGINT;
    DECLARE @IntentosPrevios INT;
    DECLARE @IntentosPermitidos INT;

    SELECT 
        @IDCuestionario = IDCuestionario,
        @IDAlumno = IDAlumno
    FROM inserted;

    SELECT @IntentosPrevios = COUNT(*)
    FROM RESULTADOCUESTIONARIO
    WHERE IDCuestionario = @IDCuestionario
      AND IDAlumno = @IDAlumno;
    
    SELECT @IntentosPermitidos = Intentos
    FROM CUESTIONARIOS
    WHERE IDCuestionario = @IDCuestionario;

    IF (@IntentosPrevios >= @IntentosPermitidos)
    BEGIN
        PRINT 'LIMITE DE INTENTOS ALCANZADOS. INTENTO "NO" REGISTRADO.';
        RETURN;
    END
    INSERT INTO RESULTADOCUESTIONARIO
        (IDCuestionario, IDAlumno, PuntajeObtenido, PuntajeMaximo, Intento, Aprobado)
    SELECT 
        IDCuestionario,
        IDAlumno,
        PuntajeObtenido,
        PuntajeMaximo,
        @IntentosPrevios + 1,   
        Aprobado
    FROM inserted;

END;

--SELECT IDCuestionario, Intentos FROM CUESTIONARIOS;
--SELECT * FROM RESULTADOCUESTIONARIO WHERE IDCuestionario = 1 AND IDAlumno = 2;

--insert into RESULTADOCUESTIONARIO(IDCuestionario,IDAlumno,PuntajeObtenido,PuntajeMaximo,Intento,Aprobado) VALUES (1,2,5.00,10.00,3,0);