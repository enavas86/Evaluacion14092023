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
-- Description:	SP para eliminar un Departamento
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteDepartamento] 
	@p_id INT,
	@p_idEmpresa INT
AS
BEGIN
	DECLARE @MENS_ERROR VARCHAR(250)

	BEGIN TRAN
	
	DELETE FROM [EVA_Departamento] WHERE id = @p_id AND idEmpresa = @p_idEmpresa

	IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			SET @MENS_ERROR = '[sp_DeleteEmpresa] - Error al momento de eliminar un Departamento'
			RAISERROR (@MENS_ERROR, 16, 1)
		END

	COMMIT TRAN
	RETURN
END
GO
