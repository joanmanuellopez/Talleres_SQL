/*
CREATE PROCEDURE Genera_Factura
(
	@reparacion Identificador
)
AS
	-- Verifica la existencia de la reparacion
	IF NOT EXISTS (SELECT TOP 1 Reparacion_PK FROM Reparaciones WHERE Reparacion_PK = @reparacion)
	BEGIN
		PRINT 'La reparación especificada no existe.';
		RETURN;
	END
	-- Verifica que la reparacion no ha sido ya facturada
	IF (SELECT Factura_FK FROM Reparaciones
		WHERE Reparacion_PK = @reparacion) IS NOT NULL
	BEGIN
		PRINT 'La reparación ya ha sido facturada.';
		RETURN;
	END
	-- Crea un nuevo registro en la tabla de facturas
	/*INSERT INTO Facturas(Cliente,Matricula,Kilometraje,Importe)
	VALUES*/
		
*/