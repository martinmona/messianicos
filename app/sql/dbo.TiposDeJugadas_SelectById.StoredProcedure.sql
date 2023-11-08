USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[TiposDeJugadas_SelectById]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TiposDeJugadas_SelectById]
@Id INT

AS

BEGIN

/* TEST CODE 
DECLARE @Id INT = 1
EXECUTE [dbo].[TiposDeJugadas_SelectById]
@Id
*/

SELECT [Id]
      ,[Nombre]
  FROM [dbo].[TiposDeJugadas]
  WHERE Id = @Id

  END


GO
