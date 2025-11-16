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