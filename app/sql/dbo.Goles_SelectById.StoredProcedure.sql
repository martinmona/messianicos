USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Goles_SelectById]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Goles_SelectById]
@Id int

as

BEGIN

/* TEST CODE

Declare @Id INT = 1
Execute [dbo].[Goles_SelectById]
@Id
*/

SELECT g.Id
      ,eq.Nombre
      ,ri.Nombre
      ,c.Nombre
      ,es.Nombre
      ,t.ParteDelCuerpo
      ,j.Nombre
      ,g.Video
  FROM [dbo].[Goles] as g
  INNER JOIN dbo.Equipos as eq 
  ON EquipoId = eq.Id
  INNER JOIN dbo.Equipos as ri
  ON RivalId = ri.Id
  INNER JOIN dbo.Competiciones as c
  ON CompeticionId = c.Id
  INNER JOIN dbo.Estadios as es
  ON EstadioId = es.Id
  INNER JOIN dbo.Tecnicas as t
  ON TecnicaId = t.Id
  INNER JOIN dbo.TiposDeJugadas as j
  ON TipoDeJugadaId = j.Id

  WHERE g.Id = @Id

END


GO
