USE [Taller];

-- Crea una consulta para saber el valor de todas las reparaciones de un vehículo.
SELECT Matricula, SUM(Importe) AS Importe_Total FROM Reparaciones
WHERE Matricula='9393SBD'
GROUP BY Matricula;

-- Crea una consulta para saber las reparaciones pendientes de facturar.
SELECT Reparacion_PK AS Pendientes_Fact FROM Reparaciones
WHERE Factura_FK IS NULL;

-- Crea una consulta para saber qué vehículos aún no han sido reparados.
SELECT Matricula FROM Vehiculos
WHERE Matricula NOT IN
	(SELECT Matricula FROM Reparaciones
	 WHERE Factura_FK IS NULL);
