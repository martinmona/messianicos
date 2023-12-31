USE [messianicos]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 28/10/2023 02:19:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[JugoMessi] [bit] NOT NULL,
	[EsSeleccion] [bit] NOT NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD  CONSTRAINT [CK_Equipos_Jugo] CHECK  (([JugoMessi]=(0) OR [JugoMessi]=(1)))
GO
ALTER TABLE [dbo].[Equipos] CHECK CONSTRAINT [CK_Equipos_Jugo]
GO
