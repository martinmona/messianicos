USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Equipos_SelectAll]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Equipos_SelectAll]

AS

/* TEST CODE

EXECUTE [dbo].[Equipos_SelectAll]*/

BEGIN

SELECT [Id]
      ,[Nombre]
      ,[JugoMessi]
      ,[EsSeleccion]
  FROM [dbo].[Equipos]

END


GO
