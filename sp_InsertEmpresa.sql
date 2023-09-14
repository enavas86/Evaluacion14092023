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
-- =============================================
-- Author:		Edwin Navas
-- Create date: 14.09.2023
-- Description:	SP para ingresar una nueva Empresa
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertEmpresa]
	@p_nombre VARCHAR(250),
	@p_razonSocial VARCHAR(250),
	@p_fechaRegistro DATETIME
AS
BEGIN
	DECLARE @MENS_ERROR VARCHAR(250)

	BEGIN TRAN
	
	INSERT INTO [EVA_Empresas] (nombre, razonSocial, fechaRegistro)
		VALUES (@p_nombre, @p_razonSocial, @p_fechaRegistro)

	IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			SET @MENS_ERROR = '[sp_InsertEmpresa] - Error al momento de ingresar una nueva empresa'
			RAISERROR (@MENS_ERROR, 16, 1)
		END

	COMMIT TRAN
	RETURN
END
GO
