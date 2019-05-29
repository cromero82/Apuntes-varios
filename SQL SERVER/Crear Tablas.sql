---------------------------------------
--- CREACIÓN TABLA CON TODOS LOS JUGUETES
---------------------------------------
USE [ControlcBD]
GO

/****** Object:  Table [dbo].[GenPersona]    Script Date: 01/05/2018 18:50:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GenPersona](
	[ID] [int] IDENTITY(1,1) NOT NULL ,
	[TdocumentoId] [int] NULL,
	[NumDoc] [nchar](20) NULL,
	[PrimerNombre] [nchar](10) NULL,
	[SegundoNombre] [nchar](10) NULL,
	[PrimerApellido] [nchar](10) NULL,
	[SegundoApellido] [nchar](10) NULL,
	[Direccion] [nchar](10) NULL,
	[Telefono] [nchar](10) NULL,
	[TmunicipioId] [nchar](10) NULL,
	[CorreoElectronico] [nchar](10) NULL,
	[Telefono2] [nchar](10) NULL,
	[Estregistro] [int] NULL
 CONSTRAINT [PK_GenPersona] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GenPersona]  WITH CHECK ADD  CONSTRAINT [FK_TDOC_GPER] FOREIGN KEY([TdocumentoId])
REFERENCES [dbo].[Tdocumentos] ([Id])
GO

ALTER TABLE [dbo].[GenPersona] CHECK CONSTRAINT [FK_TDOC_GPER]
GO

ALTER TABLE [dbo].[GenPersona]  WITH CHECK ADD  CONSTRAINT [CK_GPerso_Estregistro] CHECK  (([Estregistro]=(0) OR [Estregistro]=(1) OR [Estregistro]=(2)))
GO

ALTER TABLE [dbo].[GenPersona] CHECK CONSTRAINT [CK_GPerso_Estregistro]
GO

---------------------------------------
--- FIN TABLAS CON TODOS LOS JUGUETES
---------------------------------------



-- Creating table 'Areas'
CREATE TABLE [dbo].[Areas] (
    [Id] int  NOT NULL,
    [MunicipioId] int  NOT NULL,
    [Latitud] decimal(15,2)  NOT NULL,
    [Longitud] decimal(15,2)  NOT NULL,
    [EstRegistro] tinyint  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int  NOT NULL,
    [PersonaId] int  NOT NULL,
    [AreaId] int  NOT NULL,
    [EstadoId] int  NOT NULL,
    [EstRegistro] tinyint  NOT NULL
);
GO

-- Creating table 'Creditos'
CREATE TABLE [dbo].[Creditos] (
    [Id] int  NOT NULL,
    [ClienteId] int  NOT NULL,
    [PrestadorId] int  NOT NULL,
    [ValorTotal] decimal(15,2)  NOT NULL,
    [Porcentaje] decimal(5,2)  NOT NULL,
    [PeriodoId] int  NOT NULL,
    [Observacion] varchar(max)  NULL
);
GO

-- Creating table 'Departamentos'
CREATE TABLE [dbo].[Departamentos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Sigla] nvarchar(5)  NOT NULL,
    [EstRegistro] tinyint  NOT NULL
);
GO

-- Creating table 'Movimientos'
CREATE TABLE [dbo].[Movimientos] (
    [Id] int  NOT NULL,
    [CreditoId] int  NOT NULL,
    [ValorCancelado] decimal(15,2)  NOT NULL,
    [ValorPendiente] decimal(15,2)  NOT NULL,
    [Observacion] varchar(max)  NULL
);
GO

-- Creating table 'Municipios'
CREATE TABLE [dbo].[Municipios] (
    [Id] int  NOT NULL,
    [DepartamentoId] int  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Sigla] nvarchar(5)  NOT NULL,
    [EstRegistro] tinyint  NOT NULL
);
GO

-- Creating table 'Personas'
CREATE TABLE [dbo].[Personas] (
    [Id] int  NOT NULL,
    [TdocumentoId] int  NULL,
    [numeroDocumento] varchar(20)  NOT NULL,
    [fechaNacimiento] datetime  NULL,
    [TGeneroId] int  NULL,
    [nombres] varchar(50)  NOT NULL,
    [apellidos] varchar(50)  NOT NULL,
    [direccion] varchar(50)  NULL,
    [telefono] varchar(20)  NOT NULL,
    [observaciones] varchar(500)  NULL,
    [AreaId] int  NULL
);
GO

-- Creating table 'Prestadores'
CREATE TABLE [dbo].[Prestadores] (
    [Id] int  NOT NULL,
    [PersonaId] int  NOT NULL,
    [EstRegistro] tinyint  NOT NULL
);
GO

-- Creating table 'TDocumentos'
CREATE TABLE [dbo].[TDocumentos] (
    [Id] int  NOT NULL,
    [Nombre] nvarchar(50)  NOT NULL,
    [Sigla] nvarchar(5)  NOT NULL,
    [EstRegistro] tinyint  NOT NULL
);
GO