1. La migración inicial se realiza con BD limpia y sin modelos definidos (únicamente ApplicationUser:IdentityUser)
2. Menu Herramientas / Administrador de paquetes nugets / consola de administracion de paquetes
3. Seleccionar el proyecto Persistence
PM> enable-migrations
PM> add-migrations MyInitialize
// En ese momento se crea una carpeta "Migrations" con 2 clases 1 con nombre fecha y hora de migracion y el otro 'Configuration.cs'
// en la clase fechaHora_MyInitialize.cs se puede ver la estructura de las tablas en formato C#
// Verificar cadena de conexion App.config
PM> update-database
// Se puede ver que se ha actualizado la BD

// Para eliminar una migración y devolverme a un estado anterior: debo 1 eliminar la migracion de la carpeta "Migrations" y
// 2 eliminar dicho registro de la tabla "_MigrationHistory"

class x{
        [Key]
        public int Id { get; set; }

        /// <summary>
        /// Representa el codigo de departamento (campo unico)
        /// </summary>
        [Index("UQ_dep_cod", IsUnique = true)]
        [MaxLength(5)]
        public string Cod { get; set; }
        
        }