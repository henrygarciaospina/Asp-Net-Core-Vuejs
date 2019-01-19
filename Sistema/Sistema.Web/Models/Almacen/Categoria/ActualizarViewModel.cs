using System.ComponentModel.DataAnnotations;

namespace Sistema.Web.Models.Almacen.Categoria
{
    public class ActualizarViewModel
    {
        [Required]
        public int IDCategoria { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 3,
            ErrorMessage = "El nombre no debe tener más de {1} caracteres, ni menos de {0} caracteres")]
        public string Nombre { get; set; }
        [StringLength(256)]
        public string Descripcion { get; set; }
    }
}
