using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Sistema.Web.Models.Almacen.Articulo
{
    public class ActualizarViewModel
    {
        [Required]
        public int IDArticulo { get; set; }
        [Required]
        public int IDCategoria { get; set; }
        public string Codigo { get; set; }
        [StringLength(50, MinimumLength = 3,
        ErrorMessage = "El nombre no debe tener más de {1} caracteres, ni menos de {0} caracteres")]
        public string Nombre { get; set; }
        [Required]
        [Column(TypeName = "decimal(11,2)")]
        public decimal PrecioVenta { get; set; }
        public int Stock { get; set; }
        public string Descripcion { get; set; }
    }
}
