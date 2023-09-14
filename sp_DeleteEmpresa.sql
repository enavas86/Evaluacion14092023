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
-- Description:	SP para eliminar una empresa
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteEmpresa] 
	@p_id INT
AS
BEGIN
	DECLARE @MENS_ERROR VARCHAR(250)

	BEGIN TRAN
	
	DELETE FROM [EVA_Empresas] WHERE id = @p_id

	IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			SET @MENS_ERROR = '[sp_DeleteEmpresa] - Error al momento de eliminar una empresa'
			RAISERROR (@MENS_ERROR, 16, 1)
		END

	COMMIT TRAN
	RETURN
END
GO
