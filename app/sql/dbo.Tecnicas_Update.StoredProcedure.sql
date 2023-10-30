USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Tecnicas_Update]    Script Date: 30/10/2023 10:54:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tecnicas_Update]
@Id INT
,@ParteDelCuerpo NVARCHAR(50)

AS

BEGIN

/* TEST CODE

DECLARE @Id INT = 1

SELECT * FROM [dbo].[Tecnicas]
WHERE Id = @Id

DECLARE @ParteDelCuerpo NVARCHAR(50) = 'Cabeza'

EXECUTE [dbo].[Tecnicas_Update]
@Id
,@ParteDelCuerpo

SELECT * FROM [dbo].[Tecnicas]
WHERE Id = @Id
*/


UPDATE [dbo].[Tecnicas]
   SET [ParteDelCuerpo] = @ParteDelCuerpo
 WHERE Id = @Id

END


GO
