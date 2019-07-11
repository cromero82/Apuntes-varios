--alter table FinProducto drop column Estregistro;
alter table FinProducto add  elementoId int NOT NULL;
alter table FinProducto add  marcaId int NOT NULL;
GO
