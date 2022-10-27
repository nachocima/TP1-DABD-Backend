using blackJack.Comandos;
using blackJack.Data;
using blackJack.Respuestas;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace blackJack.Controllers;

[ApiController]
public class UsuarioController: ControllerBase
{
    private readonly blackJack1Context _context;
    public UsuarioController(blackJack1Context context)
    {
        _context = context;
    }

    [HttpPost]
    [Route ("login")]
    public async Task<ActionResult<UserRespuesta>> login(LoginComando cmd){
        try
        {
            var user = await _context.Usuarios.Where(x=> x.Usuario1.Equals(cmd.Usuario) && x.Pass.Equals(cmd.Pass)).FirstOrDefaultAsync();

            if(user == null){
                return BadRequest("Usuario o contraseña incorrectos");
            }

            var result = new UserRespuesta{
                Id = user.Id,
                Usuario1 = user.Usuario1
            };

            return Ok(result);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPost]
    [Route("post/user")]
    public async Task<ActionResult<UserRespuesta>> postUser(LoginComando cmd){
        try{
            var existe = await _context.Usuarios.Where(x=> x.Usuario1.Equals(cmd.Usuario) && x.Pass.Equals(cmd.Pass)).FirstOrDefaultAsync();

            if(existe != null){
                return BadRequest("El usuario ya existe");
            }

            var user = new Usuario{
                Usuario1 = cmd.Usuario,
                Pass = cmd.Pass
            };

            await _context.Usuarios.AddAsync(user);
            await _context.SaveChangesAsync();

            var result = new UserRespuesta{
                Id = user.Id,
                Usuario1 = user.Usuario1
            };

            return Ok(result);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
}
