USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Tecnicas_SelectById]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tecnicas_SelectById]
@Id INT

AS

BEGIN

/* TEST CODE
Declare @Id INT = 1
EXECUTE [dbo].[ParteDelCuerpo_SelectById]
@Id

*/

SELECT [Id]
      ,[ParteDelCuerpo]
  FROM [dbo].[Tecnicas]
  WHERE Id = @Id

END
GO
