USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Tecnicas_SelectAll]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tecnicas_SelectAll]

AS

BEGIN 

/* TEST CODE 

EXECUTE [dbo].[Tecnicas_SelectAll]*/
SELECT [Id]
      ,[ParteDelCuerpo]
  FROM [dbo].[Tecnicas]

END

GO
