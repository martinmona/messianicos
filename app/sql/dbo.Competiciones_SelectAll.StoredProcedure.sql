USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Competiciones_SelectAll]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Competiciones_SelectAll]

AS

/* TEST CODE

EXECUTE [dbo].[Competiciones_SelectAll] */

BEGIN

SELECT [Id]
      ,[Nombre]
  FROM [dbo].[Competiciones]

END


GO
