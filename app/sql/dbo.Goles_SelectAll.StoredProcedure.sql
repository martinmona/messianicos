USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Goles_SelectAll]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Goles_SelectAll]

AS

/* TEST CODE

EXECUTE [dbo].[Goles_SelectAll]

*/ 

BEGIN

--SELECT [Id]
--      ,[EquipoId]
--      ,[RivalId]
--      ,[CompeticionId]
--      ,[EstadioId]
--      ,[TecnicaId]
--      ,[TipoDeJugadaId]
--      ,[Video]
--  FROM [dbo].[Goles]

SELECT 
	   eq.Nombre
	  ,ri.Nombre
	  ,c.Nombre
	  ,es.Nombre
	  ,es.Ubicacion
	  ,t.ParteDelCuerpo
	  ,j.Nombre
	  ,Video
FROM [dbo].[Goles]
INNER JOIN [dbo].[Equipos] as eq
ON EquipoId = eq.Id
INNER JOIN [dbo].[Equipos] as ri
ON RivalId = ri.Id
INNER JOIN [dbo].[Competiciones] as c
ON CompeticionId = c.Id
INNER JOIN [dbo].[Estadios] as es
ON CompeticionId = es.Id
INNER JOIN [dbo].[Tecnicas] as t
ON TecnicaId = t.Id
INNER JOIN [dbo].[TiposDeJugadas] as j
ON TecnicaId = j.Id


END



GO
