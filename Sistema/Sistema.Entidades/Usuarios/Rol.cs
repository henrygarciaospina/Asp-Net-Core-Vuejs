using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Sistema.Entidades.Usuarios
{
    public class Rol
    {
        public int IDRol { get; set; }
        [Required]
        [StringLength(30, MinimumLength = 3, ErrorMessage = "El nombre no debe de tener más de {1} caracteres, ni menos de {0} caracteres.")]
        public string Nombre { get; set; }
        [StringLength(256)]
        public string Descripcion { get; set; }
        public bool Condicion { get; set; }

       public ICollection<Usuario> usuarios { get; set; }
    }
}
