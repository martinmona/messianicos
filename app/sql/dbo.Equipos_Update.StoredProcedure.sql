USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Equipos_Update]    Script Date: 30/10/2023 10:54:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Equipos_Update]
@Id INT
,@Nombre NVARCHAR(50)
,@JugoMessi BIT
,@EsSeleccion BIT

AS

BEGIN
/* TEST CODE

DECLARE @Id INT = 1

SELECT * FROM dbo.Equipos
WHERE Id = @Id

DECLARE @Nombre NVARCHAR(50) = 'Argentina'
,@JugoMessi BIT = 1
,@EsSeleccion BIT = 1

EXECUTE [dbo].[Equipos_Update]
@Id
,@Nombre
,@JugoMessi
,@EsSeleccion

SELECT * FROM dbo.Equipos
WHERE Id = @Id
*/

UPDATE [dbo].[Equipos]
   SET [Nombre] = @Nombre
      ,[JugoMessi] = @JugoMessi
      ,[EsSeleccion] = @EsSeleccion
 WHERE Id = @Id

 END


GO
