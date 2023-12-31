USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Goles_Update]    Script Date: 30/10/2023 10:54:50 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Goles_Update]
@Id INT
,@EquipoId INT
,@RivalId INT
,@CompeticionId INT
,@EstadioId INT
,@TecnicaId INT
,@TipoDeJugadaId INT
,@Video NVARCHAR(MAX)

AS

/* TEST CODE
DECLARE @Id INT = 1

EXECUTE [dbo].[Goles_SelectById]
@Id

DECLARE @EquipoId INT = 2
,@RivalId INT = 2
,@CompeticionId INT = 1
,@EstadioId INT = 2
,@TecnicaId INT = 1
,@TipoDeJugadaId INT = 2
,@Video NVARCHAR(MAX) = 'messi.video'

EXECUTE [dbo].[Goles_Update]
@Id
,@EquipoId
,@RivalId
,@CompeticionId
,@EstadioId
,@TecnicaId
,@TipoDeJugadaId
,@Video

EXECUTE [dbo].[Goles_SelectById]
@Id

*/

BEGIN

UPDATE [dbo].[Goles]
   SET [EquipoId] = @EquipoId
      ,[RivalId] = @RivalId
      ,[CompeticionId] = @CompeticionId
      ,[EstadioId] = @EstadioId
      ,[TecnicaId] = @TecnicaId
      ,[TipoDeJugadaId] = @TipoDeJugadaId
      ,[Video] = @Video
 WHERE Id = @Id

 END


GO
