-- 1.- TABLA - Empresa
CREATE TABLE [EVA_Empresas](
	id INT IDENTITY(1, 1) PRIMARY KEY,
	nombre VARCHAR(250) NOT NULL,
	razonSocial VARCHAR(250),
	fechaRegistro DATETIME,
	usuarioIngresa VARCHAR(150) NOT NULL,
	fechaIngresa DATETIME NOT NULL,
	usuarioModifica VARCHAR(150),
	fechaModifica DATETIME
)

ALTER TABLE [EVA_Empresas]
	ADD DEFAULT (USER_NAME()) FOR [usuarioIngresa]
GO

ALTER TABLE [EVA_Empresas]
	ADD DEFAULT (GETDATE()) FOR [fechaIngresa]
GO

-- 1.- TABLA - Departamento
CREATE TABLE [EVA_Departamento](
	id INT NOT NULL PRIMARY KEY,
	idEmpresa INT NOT NULL,
	nombre VARCHAR(250),
	numeroEmpleados INT,
	nivelOrganizacion INT,
	FOREIGN KEY (idEmpresa) REFERENCES [Eva_Empresas] (id)
)

