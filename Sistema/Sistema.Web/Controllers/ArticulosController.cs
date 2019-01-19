using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Sistema.Datos;
using Sistema.Entidades.Almacen;
using Sistema.Web.Models.Almacen.Articulo;

namespace Sistema.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArticulosController : ControllerBase
    {
        private readonly DbContextSistema _context;

        public ArticulosController(DbContextSistema context)
        {
            _context = context;
        }

        // GET: api/Articulos/Listar
        [HttpGet("[action]")]
        public async Task<IEnumerable<ArticuloViewModel>> Listar()
        {
            var articulo = await _context.Articulos.Include(a => a.categoria).ToListAsync();

            return articulo.Select(a => new ArticuloViewModel
            {
                IDArticulo = a.IDArticulo,
                IDCategoria = a.IDCategoria,
                Categoria = a.categoria.Nombre,
                Codigo = a.Codigo,
                Nombre = a.Nombre,
                Stock = a.Stock,
                PrecioVenta = a.PrecioVenta,
                Descripcion = a.Descripcion,
                Condicion = a.Condicion
            });

        }

        // GET: api/Articulos/Mostrar/1
        [HttpGet("[action]/{id}")]
        public async Task<IActionResult> Mostrar([FromRoute] int id)
        {

            var articulo = await _context.Articulos.Include(a=>a.categoria).
                SingleOrDefaultAsync(a=> a.IDArticulo == id);

            if (articulo == null)
            {
                return NotFound();
            }

            return Ok(new ArticuloViewModel
            {
                IDArticulo = articulo.IDArticulo,
                IDCategoria = articulo.IDCategoria,
                Categoria = articulo.categoria.Nombre,
                Codigo = articulo.Codigo,
                Nombre = articulo.Nombre,
                Stock = articulo.Stock,
                PrecioVenta = articulo.PrecioVenta,
                Descripcion = articulo.Descripcion,
                Condicion = articulo.Condicion
            });
        }


        // PUT: api/Articulos/Actualizar
        [HttpPut("[action]")]
        public async Task<IActionResult> Actualizar([FromBody] ActualizarViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (model.IDArticulo <= 0)
            {
                return BadRequest();
            }

            var articulo = await _context.Articulos.FirstOrDefaultAsync(a => a.IDArticulo == model.IDArticulo);

            if (articulo == null)
            {
                return NotFound();
            }

            articulo.IDCategoria = model.IDCategoria;
            articulo.Codigo = model.Codigo;
            articulo.Nombre = model.Nombre;
            articulo.PrecioVenta = model.PrecioVenta;
            articulo.Stock = model.Stock;
            articulo.Descripcion = model.Descripcion;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // Guardar Excepción
                return BadRequest();
            }

            return Ok();
        }

        // POST: api/Articulos/Crear
        [HttpPost("[action]")]
        public async Task<IActionResult> Crear([FromBody] CrearViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            Articulo articulo = new Articulo
            {
                IDCategoria = model.IDCategoria,
                Codigo = model.Codigo,
                Nombre = model.Nombre,
                PrecioVenta = model.PrecioVenta,
                Stock = model.Stock,
                Descripcion = model.Descripcion,
                Condicion = true
            };

            _context.Articulos.Add(articulo);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                return BadRequest();
            }

            return Ok();
        }

        // PUT: api/Articulos/Desactivar/1
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Desactivar([FromRoute] int id)
        {

            if (id <= 0)
            {
                return BadRequest();
            }

            var articulo = await _context.Articulos.FirstOrDefaultAsync(a => a.IDArticulo == id);

            if (articulo == null)
            {
                return NotFound();
            }

            articulo.Condicion = false;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // Guardar Excepción
                return BadRequest();
            }

            return Ok();
        }

        // PUT: api/Articulos/Activar/1
        [HttpPut("[action]/{id}")]
        public async Task<IActionResult> Activar([FromRoute] int id)
        {

            if (id <= 0)
            {
                return BadRequest();
            }

            var articulo = await _context.Articulos.FirstOrDefaultAsync(a => a.IDArticulo == id);

            if (articulo == null)
            {
                return NotFound();
            }

            articulo.Condicion = true;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                // Guardar Excepción
                return BadRequest();
            }

            return Ok();
        }
        private bool ArticuloExists(int id)
        {
            return _context.Articulos.Any(e => e.IDArticulo == id);
        }
    }
}