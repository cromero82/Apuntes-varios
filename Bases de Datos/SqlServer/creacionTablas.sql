-----------------------------------------------------------------
-- Varios tipos de columnas, + Date con valor por defecto: Fecha del sistema. + Unique y FK
-----------------------------------------------------------------
CREATE TABLE aca_estadosMatricula (
  id int NOT NULL IDENTITY,
  tipoEstadoMatriculaId int NOT NULL,
  motivoEstadoMatriculaId int NOT NULL,  
  calendarioId int NOT NULL,
  fecha date NOT NULL DEFAULT getdate(),
  --netUserId varchar(255) not null,
  observacion varchar(300) DEFAULT NULL,
  estregistro int NOT NULL DEFAULT 1,
  PRIMARY KEY (id),  
  CONSTRAINT UNIQ_aca_estadosMatricula UNIQUE  (tipoEstadoMatriculaId),
  CONSTRAINT FK_ACA_ESTA_MATR_tipoEstadoMatriculaId FOREIGN KEY (tipoEstadoMatriculaId) REFERENCES aca_tipoestadosmatricula (id),
  CONSTRAINT FK_ACA_ESTA_MATR_motivoEstadoMatriculaId FOREIGN KEY (motivoEstadoMatriculaId) REFERENCES aca_tipoMotivoEstadosMatricula (id),
  CONSTRAINT FK_ACA_ESTA_MATR_calendarioId FOREIGN KEY (calendarioId) REFERENCES aca_calendario (id),
)   ;
GO

-----------------------------------------------------------------
-- Valor decimal con 2 dígitos
-----------------------------------------------------------------
CREATE TABLE FinCategoriaElementoImpuesto (
  id int NOT NULL IDENTITY,
  categoriaId int NOT NULL,
  calendarioId int NOT NULL,
  iva decimal(10,2) NOT NULL,
  --Retefuente, reteIva, reteIco (pendiente)
  estregistro int NOT NULL DEFAULT 1,
  CONSTRAINT FK_FinCategElemen_FinCategElemImpu FOREIGN KEY (categoriaId) REFERENCES FinCategoriaElemento (id),
  CONSTRAINT FK_FinCalendario_FinCategElemImpu FOREIGN KEY (calendarioId) REFERENCES FinCalendario (id),
  PRIMARY KEY ([id])
)  ;
