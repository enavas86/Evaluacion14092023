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
-- Description:	SP para obtener una empresa
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetEmpresa]
	@p_id INT
AS
BEGIN
	SELECT *
	FROM [EVA_Empresas]
	WHERE id = @p_id
END
GO
