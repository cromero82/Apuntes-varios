-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Afiliaciones'
ALTER TABLE [dbo].[Afiliaciones]
ADD CONSTRAINT [PK_Afiliaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Areas'
ALTER TABLE [dbo].[Areas]
ADD CONSTRAINT [PK_Areas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Creditos'
ALTER TABLE [dbo].[Creditos]
ADD CONSTRAINT [PK_Creditos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Departamentos'
ALTER TABLE [dbo].[Departamentos]
ADD CONSTRAINT [PK_Departamentos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Movimientos'
ALTER TABLE [dbo].[Movimientos]
ADD CONSTRAINT [PK_Movimientos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Municipios'
ALTER TABLE [dbo].[Municipios]
ADD CONSTRAINT [PK_Municipios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Personas'
ALTER TABLE [dbo].[Personas]
ADD CONSTRAINT [PK_Personas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Prestadores'
ALTER TABLE [dbo].[Prestadores]
ADD CONSTRAINT [PK_Prestadores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TDocumentos'
ALTER TABLE [dbo].[TDocumentos]
ADD CONSTRAINT [PK_TDocumentos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TEstados'
ALTER TABLE [dbo].[TEstados]
ADD CONSTRAINT [PK_TEstados]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TGeneros'
ALTER TABLE [dbo].[TGeneros]
ADD CONSTRAINT [PK_TGeneros]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TPeriodos'
ALTER TABLE [dbo].[TPeriodos]
ADD CONSTRAINT [PK_TPeriodos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PrestadorId] in table 'Afiliaciones'
ALTER TABLE [dbo].[Afiliaciones]
ADD CONSTRAINT [FK_Afiliaciones_Prestador]
    FOREIGN KEY ([PrestadorId])
    REFERENCES [dbo].[Prestadores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Afiliaciones_Prestador'
CREATE INDEX [IX_FK_Afiliaciones_Prestador]
ON [dbo].[Afiliaciones]
    ([PrestadorId]);
GO

-- Creating foreign key on [MunicipioId] in table 'Areas'
ALTER TABLE [dbo].[Areas]
ADD CONSTRAINT [FK_Areas_Municipio]
    FOREIGN KEY ([MunicipioId])
    REFERENCES [dbo].[Municipios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Areas_Municipio'
CREATE INDEX [IX_FK_Areas_Municipio]
ON [dbo].[Areas]
    ([MunicipioId]);
GO

-- Creating foreign key on [AreaId] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_Clientes_Area]
    FOREIGN KEY ([AreaId])
    REFERENCES [dbo].[Areas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
