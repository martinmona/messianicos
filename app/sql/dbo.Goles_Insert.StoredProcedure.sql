USE [messianicos]
GO
/****** Object:  StoredProcedure [dbo].[Goles_Insert]    Script Date: 28/10/2023 02:19:05 p. m. ******/
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
    
    -- Verificar si el equipo ya existe en la tabla Equipos
    SELECT @EquipoID = ID FROM Equipos WHERE Nombre = @EquipoNombre;
    
    -- Si el equipo no existe, insertarlo
    IF @EquipoID IS NULL
    BEGIN
        INSERT INTO Equipos (Nombre, JugoMessi, EsSeleccion) VALUES (@EquipoNombre, 1, 0);
        SET @EquipoID = SCOPE_IDENTITY();
    END;
    
    -- Verificar si el rival ya existe en la tabla Equipos
    SELECT @RivalID = ID FROM Equipos WHERE Nombre = @RivalNombre;
    
    -- Si el rival no existe, insertarlo
    IF @RivalID IS NULL
    BEGIN
        INSERT INTO Equipos (Nombre, JugoMessi, EsSeleccion) VALUES (@RivalNombre, 0, 0);
        SET @RivalID = SCOPE_IDENTITY();
    END;
    
    -- Verificar si la competición ya existe en la tabla Competiciones
    SELECT @CompeticionID = ID FROM Competiciones WHERE Nombre = @CompeticionNombre;
    
    -- Si la competición no existe, insertarla
    IF @CompeticionID IS NULL
    BEGIN
        INSERT INTO Competiciones (Nombre) VALUES (@CompeticionNombre);
        SET @CompeticionID = SCOPE_IDENTITY();
    END;

    -- Verificar si el estadio ya existe en la tabla Estadios
    SELECT @EstadioID = ID FROM Estadios WHERE Nombre = @EstadioNombre;
    
    -- Si el estadio no existe, insertarlo
    IF @EstadioID IS NULL
    BEGIN
        INSERT INTO Estadios (Nombre, Ubicacion) VALUES (@EstadioNombre, 'Argentina');
        SET @EstadioID = SCOPE_IDENTITY();
    END;

    -- Verificar si la técnica ya existe en la tabla Tecnicas
    SELECT @TecnicaID = ID FROM Tecnicas WHERE ParteDelCuerpo = @TecnicaNombre;
    
    -- Si la técnica no existe, insertarla
    IF @TecnicaID IS NULL
    BEGIN
        INSERT INTO Tecnicas (ParteDelCuerpo) VALUES (@TecnicaNombre);
        SET @TecnicaID = SCOPE_IDENTITY();
    END;

    -- Verificar si el tipo de jugada ya existe en la tabla TiposDeJugadas
    SELECT @TipoDeJugadaID = ID FROM TiposDeJugadas WHERE Nombre = @TipoDeJugadaNombre;
    
    -- Si el tipo de jugada no existe, insertarlo

    IF @TipoDeJugadaID IS NULL
    BEGIN
        INSERT INTO TiposDeJugadas (Nombre) VALUES (@TipoDeJugadaNombre);
        SET @TipoDeJugadaID = SCOPE_IDENTITY();
    END;
    
    -- Insertar el registro de gol
    INSERT INTO Goles (EquipoId, RivalId, CompeticionId, EstadioId, TecnicaId, TipoDeJugadaId, Video)
    VALUES (@EquipoID, @RivalID, @CompeticionID, @EstadioID, @TecnicaID, @TipoDeJugadaID, @Video);

	SET @Id = SCOPE_IDENTITY()
END

GO
