using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sistema.Web.Models.Almacen.Articulo
{
    public class ArticuloViewModel
    {
        public int IDArticulo { get; set; }
        public int IDCategoria { get; set; }
        public string Categoria { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public decimal PrecioVenta { get; set; }
        public int Stock { get; set; }
        public string Descripcion { get; set; }
        public bool Condicion { get; set; }
    }
}