USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Competiciones_Update]    Script Date: 30/10/2023 10:54:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Competiciones_Update]
@Id INT
,@Nombre NVARCHAR(50)
AS

BEGIN

/* TEST CODE 
Declare @Id INT = 1

SELECT * FROM [dbo].[Competiciones]
WHERE Id = @Id

Declare @Nombre NVARCHAR(50) = 'Mundial'
Execute [dbo].[Competiciones_Update]
@Id
,@Nombre

SELECT * FROM [dbo].[Competiciones]
WHERE Id = @Id
*/

UPDATE [dbo].[Competiciones]
   SET [Nombre] = @Nombre
 WHERE Id = @Id

END


GO
