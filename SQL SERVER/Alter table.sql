-- Permitir columna null en tabla
alter table [dbo].[AspNetUsers] alter column Discriminator nvarchar(128) null;

-- Agregar columna
alter table [dbo].[GenEstudiante] add  DiscapacidadId int not null;