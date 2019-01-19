using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Sistema.Datos;
using Sistema.Entidades.Ventas;
using Sistema.Web.Models.Ventas.Persona;

namespace Sistema.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonasController : ControllerBase
    {
        private readonly DbContextSistema _context;

        public PersonasController(DbContextSistema context)
        {
            _context = context;
        }

        // GET: api/Personas/ListarClientes
        [HttpGet("[action]")]
        public async Task<IEnumerable<PersonaViewModel>> ListarClientes()
        {
            var persona = await _context.Personas.Where(p => p.TipoPersona == "Cliente").ToListAsync();

            return persona.Select(p => new PersonaViewModel
            {
                IDPersona = p.IDPersona,
                TipoPersona = p.TipoPersona,
                Nombre = p.Nombre,
                TipoDocumento = p.TipoDocumento,
                NumeroDocumento = p.NumeroDocumento,
                Direccion = p.Direccion,
                Telefono = p.Telefono,
                Email = p.Email
            });

        }

        // GET: api/Personas/ListarProveedores
        [HttpGet("[action]")]
        public async Task<IEnumerable<PersonaViewModel>> ListarProveedores()
        {
            var persona = await _context.Personas.Where(p => p.TipoPersona == "Proveedor").ToListAsync();

            return persona.Select(p => new PersonaViewModel
            {
                IDPersona = p.IDPersona,
                TipoPersona = p.TipoPersona,
                Nombre = p.Nombre,
                TipoDocumento = p.TipoDocumento,
                NumeroDocumento = p.NumeroDocumento,
                Direccion = p.Direccion,
                Telefono = p.Telefono,
                Email = p.Email
            });

        }

        // POST: api/Personas/Crear
        [HttpPost("[action]")]
        public async Task<IActionResult> Crear([FromBody] CrearViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var email = model.Email.ToLower();

            if (await _context.Personas.AnyAsync(p => p.Email == email))
            {
                return BadRequest("El email ya existe");
            }

            Persona persona = new Persona
            {
                TipoPersona = model.TipoPersona,
                Nombre = model.Nombre,
                TipoDocumento = model.TipoDocumento,
                NumeroDocumento = model.NumeroDocumento,
                Direccion = model.Direccion,
                Telefono = model.Telefono,
                Email = model.Email.ToLower()
            };

            _context.Personas.Add(persona);
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

        // PUT: api/Personas/Actualizar
        [HttpPut("[action]")]
        public async Task<IActionResult> Actualizar([FromBody] ActualizarViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (model.IDPersona <= 0)
            {
                return BadRequest();
            }

            var persona = await _context.Personas.FirstOrDefaultAsync(p => p.IDPersona == model.IDPersona);

            if (persona == null)
            {
                return NotFound();
            }

            persona.TipoPersona = model.TipoPersona;
            persona.Nombre = model.Nombre;
            persona.TipoDocumento = model.TipoDocumento;
            persona.NumeroDocumento = model.NumeroDocumento;
            persona.Direccion = model.Direccion;
            persona.Telefono = model.Telefono;
            persona.Email = model.Email.ToLower();

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


        private bool PersonaExists(int id)
        {
            return _context.Personas.Any(e => e.IDPersona == id);
        }
    }
}