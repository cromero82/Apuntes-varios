#region Documentación
/************************************************************************************************************************
 * Propiedad intelectual de CODALTEC
 ************************************************************************************************************************
 * Unidad        : StockVM                                                         
 * Descripcion   : Modelo creado para administrar las reservas de canasta de productos de pqx 
 * 
 * Autor         : Carlos Andrés Romero Parrado
 * Fecha         : 30-08-2017
 * Fecha         Autor          Modificación                                                                 
 * ===========   ============   =========================================================================================   
 * 30-08-2017    Carlos Romero  Creación inicial
 ***********************************************************************************************************************/
#endregion

#region Librerias
using SaludSis.Areas.PQX.Models.ValoracionPreQuirurgica;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
#endregion 


namespace SaludSis.Areas.PQX.Models
{    
    /// <summary>
    /// Modelo para la vista de canasta quirúrgica de sala de cirgía
    /// </summary>
    public class CanastaQuirurgicaVM
    {
        [Required]
        public long AutorizacionId { get; set; }                    
        public long PersonasId { get; set; }                    
        public long PacienteId { get; set; }
        
        // Usuario logueado
        public long UsuariosId { get; set; }        

        public long UorgId { get; set; }
        public string Estado { get; set; }
        
        public List<CupsSolicitudVM> Procedimientos { get; set; }

        public ConductaPreQuirurgicaVM InformacionPrequirurgica { get; set; }

        public long? ProductocirugiaId { get; set; }
    }

    /// <summary>
    /// Modelo para listado de cups de formulados en cirugía
    /// </summary>
    public class CupsSolicitudVM
    {
        [Display(Name ="Código")]
        public string Codigo { get; set; }

        [Display(Name = "Procedimiento")]
        public string Nombre { get; set; }

        public string Observaciones { get; set; }
    }

    /// <summary>
    /// Modelo para productos de la canasta quirúrgica
    /// </summary>
    public class ProductosCanastaVM : ProductosPqxVM
    {          
        public long? ProductocirugiaId { get; set; }

        // Id de detalle de reserva de productos
        public long DproductocirugiaId { get; set; }

        public long AutorizacionId { get; set; }

        [ValidacionProductoSeleccionado]
        //[Required]
        public int? InventariosId { get; set; }

        [ValidacionProductoSeleccionado]
        //[Required]
        public int? InventariosCodigoBarrasId { get; set; }

        [Required]
        [Display(Name ="Cantidad reserva")]
        //  Cantidad reserva para cirugía
        public int? CantidadReservaCirugia { get; set; }

        [Required]
        public string Destino { get; set; }

        [Display(Name ="Observación")]
        public string Observacionreserva { get; set; }
    }

    [AttributeUsage(AttributeTargets.Property, AllowMultiple = false, Inherited = false)]
    public class ValidacionProductoSeleccionado : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var InventariosId = validationContext.ObjectType.GetProperty("InventariosId").GetValue(validationContext.ObjectInstance, null);

            var InventariosCodigoBarrasId = validationContext.ObjectType.GetProperty("InventariosCodigoBarrasId").GetValue(validationContext.ObjectInstance, null);

            //check at least one has a value
            if ( Convert.ToInt64(InventariosId) == 0 &&  Convert.ToInt64(InventariosCodigoBarrasId) == 0)
                return new ValidationResult("Debe seleccionar un producto");

            return ValidationResult.Success;
        }
    }

    /// <summary>
    /// Modelo para productos de la canasta quirúrgica
    /// </summary>
    public class ProductosEdicionCanastaVM : ProductosCanastaVM
    {        
        [Required]
        public int CantidadNuevaReserva { get; set; }        
    }

}