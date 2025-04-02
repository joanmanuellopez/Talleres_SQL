-- Script de creacion de tipos personaizados

-- Tipo 1. Identificadores (hasta 2mil millones de registros)
CREATE TYPE Identificador
FROM int;

-- Tipo 2. Identificadores, pocos registros (hasta 255)
CREATE TYPE ShortID
FROM tinyint;

-- Tipo 3. ID Personal (NIF) - Formato '00000000A'
CREATE TYPE Nif
FROM char(9);

-- Tipo 4. ID Vehiculo (Matricula) - Formato '0000AAA'
CREATE TYPE Matricula
FROM char(7);

-- Tipo 5. Codigo Postal - Formato '00000'
CREATE TYPE CodigoPostal
FROM char(5);

-- Tipo 6. Telefono - Formato '000000000'
CREATE TYPE Telefono
FROM char(9);

-- Tipo 7. E-Mail
CREATE TYPE Mail
FROM varchar(50);

-- Tipo 8. Año
CREATE TYPE Anyo
FROM smallint;

-- Tipo 9. Kilometraje (prevision, hasta 500000 kilometros)
CREATE TYPE Kilometraje
FROM int;

-- Tipo 10. Valores referentes a cantidades monetarias
CREATE TYPE Monetario
FROM money;

-- Tipo 11. Textos hasta 100 caracteres
CREATE TYPE Texto100
FROM varchar(100);

-- Tipo 12. Textos hasta 50 caracteres
CREATE TYPE Texto50
FROM varchar(100);

-- Tipo 13. Textos hasta 30 caracteres
CREATE TYPE Texto30
FROM varchar(30);

-- Tipo 14. Textos largos, hasta 1000 caracteres
CREATE TYPE Comentario
FROM varchar(1000);

-- Tipo 15. Potencia de un vehículo (prevision, hasta 1000CV)
CREATE TYPE Potencia
FROM smallint;

-- Tipo 16. Fecha
CREATE TYPE Fecha
FROM date;

-- Tipo 17. Horas, permite decimales (prevision, hasta 50)
CREATE TYPE Horas
FROM float(24);