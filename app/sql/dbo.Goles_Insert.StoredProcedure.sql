USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Goles_Insert]    Script Date: 29/10/2023 09:04:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Goles_Insert]
    @EquipoNombre NVARCHAR(50)
    ,@RivalNombre NVARCHAR(50)
    ,@CompeticionNombre NVARCHAR(50)
    ,@EstadioNombre NVARCHAR(50)
    ,@TecnicaNombre NVARCHAR(50)
    ,@TipoDeJugadaNombre NVARCHAR(50)
    ,@Video NVARCHAR(MAX)

AS

/* TEST CODE 

Declare 
@EquipoNombre NVARCHAR(50) = 'Barcelona'
,@RivalNombre NVARCHAR(50) = 'Getafe'
,@CompeticionNombre NVARCHAR(50) = 'Champions League'
,@EstadioNombre NVARCHAR(50) = 'Camp Nou'
,@TecnicaNombre NVARCHAR(50) = 'Tiro Libre'
,@TipoDeJugadaNombre NVARCHAR(50) = 'Jugada'
,@Video NVARCHAR(50) = 'messi.yotube'

EXECUTE [dbo].[Goles_Insert]
@EquipoNombre
,@RivalNombre
,@CompeticionNombre
,@EstadioNombre
,@TecnicaNombre
,@TipoDeJugadaNombre
,@Video

Select * from Goles

*/

BEGIN
    DECLARE 
	@Id INT
	,@EquipoID INT
    ,@RivalID INT
    ,@CompeticionID INT
    ,@EstadioID INT
    ,@TecnicaID INT
    ,@TipoDeJugadaID INT
    
    SELECT @EquipoID = ID FROM Equipos WHERE Nombre = @EquipoNombre;
    
    IF @EquipoID IS NULL
    BEGIN
        INSERT INTO Equipos (Nombre, JugoMessi, EsSeleccion) VALUES (@EquipoNombre, 1, 0);
        SET @EquipoID = SCOPE_IDENTITY();
    END;

    SELECT @RivalID = ID FROM Equipos WHERE Nombre = @RivalNombre;
    
    IF @RivalID IS NULL
    BEGIN
        INSERT INTO Equipos (Nombre, JugoMessi, EsSeleccion) VALUES (@RivalNombre, 0, 0);
        SET @RivalID = SCOPE_IDENTITY();
    END;
    
    SELECT @CompeticionID = ID FROM Competiciones WHERE Nombre = @CompeticionNombre;
    
    IF @CompeticionID IS NULL
    BEGIN
        INSERT INTO Competiciones (Nombre) VALUES (@CompeticionNombre);
        SET @CompeticionID = SCOPE_IDENTITY();
    END;

    SELECT @EstadioID = ID FROM Estadios WHERE Nombre = @EstadioNombre;
    
    IF @EstadioID IS NULL
    BEGIN
        INSERT INTO Estadios (Nombre, Ubicacion) VALUES (@EstadioNombre, 'Argentina');
        SET @EstadioID = SCOPE_IDENTITY();
    END;

    SELECT @TecnicaID = ID FROM Tecnicas WHERE ParteDelCuerpo = @TecnicaNombre;
    
    IF @TecnicaID IS NULL
    BEGIN
        INSERT INTO Tecnicas (ParteDelCuerpo) VALUES (@TecnicaNombre);
        SET @TecnicaID = SCOPE_IDENTITY();
    END;

    SELECT @TipoDeJugadaID = ID FROM TiposDeJugadas WHERE Nombre = @TipoDeJugadaNombre;
    
    IF @TipoDeJugadaID IS NULL
    BEGIN
        INSERT INTO TiposDeJugadas (Nombre) VALUES (@TipoDeJugadaNombre);
        SET @TipoDeJugadaID = SCOPE_IDENTITY();
    END;
    
    INSERT INTO Goles (EquipoId, RivalId, CompeticionId, EstadioId, TecnicaId, TipoDeJugadaId, Video)
    VALUES (@EquipoID, @RivalID, @CompeticionID, @EstadioID, @TecnicaID, @TipoDeJugadaID, @Video);

	SET @Id = SCOPE_IDENTITY()
END

GO
