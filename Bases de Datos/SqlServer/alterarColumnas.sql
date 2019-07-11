--alter table FinProducto drop column Estregistro;
--alter table FinProducto drop CONSTRAINT UNIQ_PROD;
alter table FinProducto add  elementoId int NOT NULL;
alter table FinProducto add  marcaId int NOT NULL;
alter table FinProducto add CONSTRAINT FK_FinElementos_FinProducto FOREIGN KEY (elementoId) REFERENCES FinElementos (id);
alter table FinProducto add CONSTRAINT FK_FinMarca_FinProducto FOREIGN KEY (marcaId) REFERENCES FinMarcas (id);
GO
