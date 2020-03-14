// crear la solucion
> dotnet new sln -n AprendeGenial

// Crea proyecto web api
> dotnet new webapi -n WebApi

// necesario pasarse al proyecto para ejecutarlo, compilarlo o agregar paquetes o referencias
// > cd WebApi
 
// ejecuta proyecto
> dotnet run
 
// comprobar que esta funcionando 
 https://localhost:5001/WeatherForecast
 

 // pack de extensiones
 https://www.campusmvp.es/recursos/post/visual-studio-code-las-15-extensiones-indispensables-para-programar-con-c-y-net-core.aspx
 
 // Installing package '.NET Core Debugger (Windows / x64)'
 
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
