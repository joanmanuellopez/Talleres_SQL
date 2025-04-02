-- Script de creacion de la tablas de la BBDD Taller
USE [Taller];

/*
CREATE TABLE Autores
(
	PRIMARY KEY (Autor_PK),
	Autor_PK tinyint NOT NULL IDENTITY(1,1),  --Primer ID de autor 1, incremento de 1 en 1
	Autor varchar(50)
);
*/

-- Tabla 1. Combustibles
CREATE TABLE Combustibles
(
	PRIMARY KEY (Combustible_PK),
	Combustible_PK ShortID NOT NULL IDENTITY(1,1),  -- Primer ID de combustible 1, incremento de 1 en 1
	Descripcion Texto30
);

-- Tabla 2. Cambios
CREATE TABLE Cambios
(
	PRIMARY KEY (Cambio_PK),
	Cambio_PK ShortID NOT NULL IDENTITY(1,1),  -- Primer ID de cambio 1, incremento de 1 en 1
	Descripcion Texto30
);

-- Tabla 3. Clientes
CREATE TABLE Clientes
(
	PRIMARY KEY (Cliente_Nif),
	Cliente_Nif Nif NOT NULL,
	Nombre Texto30,
	Apellidos Texto50,
	Direccion Texto100,
	Poblacion Texto50,
	CodigoPostal CodigoPostal,
	Telefono Telefono,
	Email Mail,
	Adjuntos Texto50     -- Ruta de la ubicacion del documento adjunto
);

-- Tabla 4. Vehículos
CREATE TABLE Vehiculos
(
	PRIMARY KEY (Matricula),
	Matricula Matricula NOT NULL,
	Marca Texto30,
	Modelo Texto30,
	Año Anyo,
	Kilometros Kilometraje,
	Combustible_FK ShortID CONSTRAINT FK_veh_comb FOREIGN KEY (Combustible_FK) REFERENCES Combustibles(Combustible_PK),
	Cambio_FK ShortID CONSTRAINT FK_veh_camb FOREIGN KEY (Cambio_FK) REFERENCES Cambios(Cambio_PK),
	Potencia Potencia,
	Propietario Nif CONSTRAINT FK_veh_prop FOREIGN KEY (Propietario) REFERENCES Clientes(Cliente_Nif)
);

-- Tabla 5. Facturas
CREATE TABLE Facturas
(
	PRIMARY KEY (Factura_PK),
	Factura_PK Identificador NOT NULL IDENTITY(1,1),  -- Primer ID de factura 1, incremento de 1 en 1
	Fecha Fecha NOT NULL DEFAULT getdate(),
	Cliente Nif CONSTRAINT FK_fact_cli FOREIGN KEY (Cliente) REFERENCES Clientes(Cliente_Nif),
	Matricula Matricula CONSTRAINT FK_fact_veh FOREIGN KEY (Matricula) REFERENCES Vehiculos(Matricula),
	Kilometraje Kilometraje,
	Importe Monetario,
	Iva AS Importe*0.21 PERSISTED,
	Importe_Total AS Importe+Iva PERSISTED
);

-- Tabla 6. Reparaciones
CREATE TABLE Reparaciones
(
	PRIMARY KEY (Reparacion_PK),
	Reparacion_PK Identificador NOT NULL IDENTITY(1,1),  -- Primer ID de reparacion 1, incremento de 1 en 1
	Fecha Fecha NOT NULL DEFAULT getdate(),
	Matricula Matricula CONSTRAINT FK_rep_veh FOREIGN KEY (Matricula) REFERENCES Vehiculos(Matricula),
	Descripcion Comentario,
	Valor_materiales Monetario,
	Horas Horas NOT NULL DEFAULT 0.5,
	Precio_Mano_Obra Monetario,
	Importe AS (Valor_materiales+Horas*Precio_Mano_Obra) PERSISTED,
	Factura_FK Identificador CONSTRAINT FK_rep_fact FOREIGN KEY (Factura_FK) REFERENCES Facturas(Factura_PK)
)
