using System.ComponentModel.DataAnnotations;

namespace Sistema.Entidades.Usuarios
{
    public class Usuario
    {
        public int IDUsuario { get; set; }
        [Required]
        public int IDRol { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "El nombre no debe de tener más de {1} caracteres, ni menos de {0} caracteres.")]
        public string Nombre { get; set; }
        public string TipoDocumento { get; set; }
        public string NumeroDocumento { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public byte[] PasswordHash { get; set; }
        [Required]
        public byte[] PasswordSalt { get; set; }
        public bool Condicion { get; set; }

        public Rol rol { get; set; }
    }
}
