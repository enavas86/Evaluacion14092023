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
-- Description:	SP para actualizar una Empresa
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateEmpresa]
	@p_id INT,
	@p_nombre VARCHAR(250),
	@p_razonSocial VARCHAR(250),
	@p_fechaRegistro DATETIME
AS
BEGIN
	DECLARE @MENS_ERROR VARCHAR(250)

	BEGIN TRAN
	
	UPDATE [EVA_Empresas]
		SET	nombre = @p_nombre,
			razonSocial = @p_razonSocial,
			fechaRegistro = @p_fechaRegistro,
			usuarioModifica = USER_NAME(),
			fechaModifica = GETDATE()
	WHERE id = @p_id

	IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			SET @MENS_ERROR = '[sp_UpdateEmpresa] - Error al momento de actualizar una empresa'
			RAISERROR (@MENS_ERROR, 16, 1)
		END

	COMMIT TRAN
	RETURN
END
GO
