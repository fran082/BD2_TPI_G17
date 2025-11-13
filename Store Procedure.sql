--STORE PROCEDURE.

ALTER PROCEDURE SP_PREGUNTA_MAS_EQUIVOCADA(
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