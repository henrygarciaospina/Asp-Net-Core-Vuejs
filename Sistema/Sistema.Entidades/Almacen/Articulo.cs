using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sistema.Entidades.Almacen
{
    public class Articulo
    {
        public int IDArticulo { get; set; }
        [Required]
        public int IDCategoria { get; set; }
        public string Codigo { get; set; }
        [StringLength(50, MinimumLength = 3,
            ErrorMessage = "El nombre no debe de tener más de {1} caracteres, ni menos de {0} caracteres.")]
        public string Nombre { get; set; }
        [Required]
        [Column(TypeName = "decimal(11,2)")]
        public decimal PrecioVenta { get; set; }
        [Required]
        public int Stock { get; set; }
        public string Descripcion { get; set; }
        public bool Condicion { get; set; }
        public Categoria categoria { get; set; }
    }
}
