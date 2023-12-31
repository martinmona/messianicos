USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[TiposDeJugadas_Update]    Script Date: 30/10/2023 10:54:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TiposDeJugadas_Update]
@Id INT
,@Nombre NVARCHAR(50)

AS

/* TEST CODE
DECLARE @Id INT = 1

SELECT * FROM [dbo].[TiposDeJugadas]
WHERE Id = @Id

DECLARE @Nombre NVARCHAR(50) = 'Penalty Kick'

EXECUTE [dbo].[TiposDeJugadas_Update]
@Id
,@Nombre

SELECT * FROM [dbo].[TiposDeJugadas]
WHERE Id = @Id


*/

BEGIN

UPDATE [dbo].[TiposDeJugadas]
   SET [Nombre] = @Nombre
 WHERE Id = @Id

 END


GO
