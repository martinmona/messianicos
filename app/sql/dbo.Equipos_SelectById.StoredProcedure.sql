USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Equipos_SelectById]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Equipos_SelectById]
@Id INT

AS

/* TEST CODE
DECLARE @Id INT = 1
EXECUTE [dbo].[Equipos_SelectById]
@Id
*/

BEGIN

SELECT [Id]
      ,[Nombre]
      ,[JugoMessi]
      ,[EsSeleccion]
  FROM [dbo].[Equipos]
  WHERE Id = @Id

END


GO
