USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[TiposDeJugadas_SelectAll]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TiposDeJugadas_SelectAll]

as

BEGIN

/* TEST CODE

EXECUTE [dbo].[TiposDeJugadas_SelectAll]*/ 
SELECT [Id]
      ,[Nombre]
  FROM [dbo].[TiposDeJugadas]

END


GO
