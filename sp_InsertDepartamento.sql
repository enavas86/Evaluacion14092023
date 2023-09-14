-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Edwin Navas
-- Create date: 14.09.2023
-- Description:	SP para ingresar un nuevo Departamento
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertDepartamento]
	@p_idEmpresa INT,
	@p_nombre VARCHAR(250),
	@p_numeroEmpleado INT,
	@p_nivelOrganizacion INT
AS
BEGIN
	DECLARE @MENS_ERROR VARCHAR(250)

	BEGIN TRAN
	
	INSERT INTO [EVA_Departamento] (id, idEmpresa, nombre, numeroEmpleados, nivelOrganizacion)
		VALUES (IIF((SELECT COUNT(*) FROM [EVA_Departamento] WHERE idEmpresa = @p_idEmpresa) > 0, (SELECT MAX(ID) + 1 FROM [EVA_Departamento] WHERE idEmpresa = @p_idEmpresa), 1), @p_idEmpresa, @p_nombre, @p_numeroEmpleado, @p_nivelOrganizacion)

	IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			SET @MENS_ERROR = '[sp_InsertEmpresa] - Error al momento de ingresar un nuevo departamento'
			RAISERROR (@MENS_ERROR, 16, 1)
		END

	COMMIT TRAN
	RETURN
END
GO
