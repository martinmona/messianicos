USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Estadios_Update]    Script Date: 30/10/2023 10:54:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Estadios_Update]
@Id INT
,@Nombre NVARCHAR(50)
,@Ubicacion NVARCHAR(50)
AS

/* TEST CODE
DECLARE @Id INT = 1

SELECT * FROM [dbo].[Estadios]
WHERE Id = @Id

Declare @Nombre NVARCHAR(50) = 'Monumental'
,@Ubicacion NVARCHAR(50) = 'Buenos Aires'

EXECUTE [dbo].[Estadios_Update]
@Id
,@Nombre
,@Ubicacion

SELECT * FROM [dbo].[Estadios]
WHERE Id = @Id
*/

BEGIN

UPDATE [dbo].[Estadios]
   SET [Nombre] = @Nombre
      ,[Ubicacion] = @Ubicacion
 WHERE Id = @Id

END


GO
