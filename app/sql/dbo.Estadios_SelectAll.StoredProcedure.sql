USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Estadios_SelectAll]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Estadios_SelectAll]

AS

/* TEST CODE

EXECUTE [dbo].[Estadios_SelectAll]
*/ 

BEGIN

SELECT [Id]
      ,[Nombre]
      ,[Ubicacion]
  FROM [dbo].[Estadios]

END


GO
