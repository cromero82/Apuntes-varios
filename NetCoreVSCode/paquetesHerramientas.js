 // agrega herramienta para usar EntityFrameworkCore en vscode
> dotnet tool install --global dotnet-ef
 
// ================== AGREGANDO POSTGRESQL =======================

// agrega paquetes al proyecto para usar EntityFrameworkCore con base de datos Postgres
> dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL --version 3.1.0
> dotnet add package NpgSql.EntityFrameworkCore.PostgreSQL.Design
> dotnet add package Microsoft.EntityFrameworkCore
> dotnet add package Microsoft.EntityFrameworkCore.Tools

// Realiza scaffold de la bd (Ingenieria inversa o databaseFirst)
dotnet ef dbcontext scaffold "Server=localhost;Database=logogenial;User Id=postgres;Password=espingsoftware*;Port=5432" Npgsql.EntityFrameworkCore.PostgreSQL --output-dir ModelsEntities --force --context ApplicationDbContext


// 2. Generador de Controladores y vistas 
dotnet tool install --global dotnet-aspnet-codegenerator --version 3.1.1

// agregar paquete necesario para ejecutar generador de controladores y vistas
dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design

dotnet aspnet-codegenerator controller -name PersonaController -actions -api -outDir Controllers
