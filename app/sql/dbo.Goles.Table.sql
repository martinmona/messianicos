USE [messianicos]
GO
/****** Object:  Table [dbo].[Goles]    Script Date: 28/10/2023 02:19:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EquipoId] [int] NOT NULL,
	[RivalId] [int] NOT NULL,
	[CompeticionId] [int] NOT NULL,
	[EstadioId] [int] NOT NULL,
	[TecnicaId] [int] NOT NULL,
	[TipoDeJugadaId] [int] NOT NULL,
	[Video] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Goles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Competiciones] FOREIGN KEY([CompeticionId])
REFERENCES [dbo].[Competiciones] ([Id])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Competiciones]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Equipos] FOREIGN KEY([EquipoId])
REFERENCES [dbo].[Equipos] ([Id])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Equipos]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Equipos1] FOREIGN KEY([RivalId])
REFERENCES [dbo].[Equipos] ([Id])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Equipos1]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Estadios] FOREIGN KEY([EstadioId])
REFERENCES [dbo].[Estadios] ([Id])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Estadios]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_Tecnicas] FOREIGN KEY([TecnicaId])
REFERENCES [dbo].[Tecnicas] ([Id])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_Tecnicas]
GO
ALTER TABLE [dbo].[Goles]  WITH CHECK ADD  CONSTRAINT [FK_Goles_TiposDeJugadas] FOREIGN KEY([TipoDeJugadaId])
REFERENCES [dbo].[TiposDeJugadas] ([Id])
GO
ALTER TABLE [dbo].[Goles] CHECK CONSTRAINT [FK_Goles_TiposDeJugadas]
GO
