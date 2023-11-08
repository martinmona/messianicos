USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Competiciones_SelectById]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Competiciones_SelectById]
@Id INT
AS

BEGIN

/* TEST CODE
Declare @Id INT = 1
EXECUTE [dbo].[Competiciones_SelectById]
@Id
*/

SELECT [Id]
      ,[Nombre]
  FROM [dbo].[Competiciones]
  WHERE Id = @Id
END


GO
