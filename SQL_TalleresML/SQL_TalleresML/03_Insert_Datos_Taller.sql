-- Query de insercion de datos en las tablas
USE [Taller];

-- Datos de las tablas Cambios y Combustibles
 --tipo de combustible (, diesel, hibrido, eléctrico), tipo de cambio (Manual o automático)
 INSERT INTO Combustibles (Descripcion)
 VALUES ('Gasolina'),('Diesel'),('Híbrido'),('Eléctrico');

 INSERT INTO Cambios(Descripcion)
 VALUES ('Manual'),('Automático');

-- Alta de 4 clientes
INSERT INTO Clientes(Cliente_Nif, Nombre, Apellidos, Direccion, Poblacion, CodigoPostal, Telefono, Email, Adjuntos)
VALUES
	('00111222J','Pepe','Perez Peris','Avenida C, 25','Terrassa','08220','699887665','pepe@mail.com','Documentos/00111222J/doc.pdf'),
	('99888777S','Maria','Garcia Vis','Avenida H, 42','Terrassa','08220','666010525','mari@mail.com','Documentos/99888777S/doc.pdf'),
	('44666535Z','Cesar','Mir Tost','Calle 3, 21','Sabadell','08200','646121757','cesar@mail.com','Documentos/44666535Z/doc.pdf'),
	('76112122H','Ana','Crusa Font','Calle 24, 15','Terrassa','08220','688993303','ana@mail.com','Documentos/76112122H/doc.pdf');

-- Alta de 4 vehículos
INSERT INTO Vehiculos(Matricula, Marca, Modelo, Año, Kilometros, Combustible_FK, Cambio_FK, Potencia, Propietario)
VALUES
	('2345AAA','Seat','Leon',2022,25313,1,1,120,'00111222J'),
	('0000TRS','Renault','Megane',2021,19033,1,2,95,'99888777S'),
	('9393SBD','Toyota','Yaris',2022,33456,3,1,85,'44666535Z'),
	('6291BCN','Ford','Tourneo',2018,58913,1,1,120,'76112122H');

-- Alta de 4 reparaciones a 2 vehículos
INSERT INTO Reparaciones(Matricula,Descripcion,Valor_materiales,Horas,Precio_Mano_Obra)
VALUES
	('9393SBD','Revision general, cambio de aceite, cambio de pastillas de frenos, sustitucion lampara delantera',244.76,3,50),
	('2345AAA','Revision general, plancha y pintura',115.22,1.5,50),
	('9393SBD','Ruidito al hacer cambio de tercera a cuarta',61.46,0.75,25),
	('2345AAA','Intermitentes al reves',25.03,0.5,35);


-- Insert Into alternativos a la Stored Procedure, en caso de fallo
-- Facturo las reparaciones con ID 3 y 4 y les añado el codigo de la factura generada
INSERT INTO Facturas(Cliente,Matricula,Kilometraje,Importe)
VALUES
	('44666535Z','9393SBD',33456,80.21),
	('00111222J','2345AAA',25313,42.53);


UPDATE Reparaciones SET Factura_FK=1 WHERE Reparacion_PK=3;
UPDATE Reparaciones SET Factura_FK=2 WHERE Reparacion_PK=4;
