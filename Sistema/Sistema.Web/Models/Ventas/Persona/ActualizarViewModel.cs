using System.ComponentModel.DataAnnotations;

namespace Sistema.Web.Models.Ventas.Persona
{
    public class ActualizarViewModel
    {
        [Required]
        public int IDPersona { get; set; }
        [Required]
        public string TipoPersona { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre de la persona debe tener más de {1} caracteres y menos de {0} caracteres")]
        public string Nombre { get; set; }
        public string TipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
    }
}
