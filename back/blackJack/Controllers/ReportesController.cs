using blackJack.Data;
using blackJack.Respuestas;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace blackJack.Controllers;

[ApiController]
public class ReportesController: ControllerBase
{
    private readonly blackJack1Context _context;
    public ReportesController(blackJack1Context context)
    {
        _context = context;
    }

/*Indice de victorias por parte del croupier*/
    [HttpGet]
    [Route("reportes/reporte1")]
    public async Task<ActionResult<Reporte1>> reporte1(){
        try
        {
            var jugadas = _context.Jugadas.Count();
            if(jugadas > 0){
                double indiceC = (await _context.Jugadas.Where(j=> j.Ganador!.Equals("croupier")).CountAsync() * 100) / jugadas;
                double indiceJ = (await _context.Jugadas.Where(j=> j.Ganador!.Equals("jugador")).CountAsync() * 100) / jugadas;
                double indiceE = (await _context.Jugadas.Where(j=> j.Ganador!.Equals("empate")).CountAsync() * 100) / jugadas;

                var result = new Reporte1{
                    IndiceCroupier = indiceC,
                    IndiceJugador = indiceJ,
                    IndiceEmpate = indiceE,
                    TotalJugadas = jugadas
                };

                return Ok(result);
            }
            return BadRequest("No hay jugadas");

        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
/*Cantidad de juegos por día.*//*Cantidad de jugadores por día.*/
    [HttpGet]
    [Route("reportes/reporte2")]
    public async Task<ActionResult<Reporte2>> reporte2(){
        try
        {   
            var dias = await _context.Partidas.Select(x=> x.Fecha.Date).Distinct().CountAsync();
            var partidas = await _context.Partidas.Select(x=> x.Id).Distinct().CountAsync() / dias;
            var jugadores = await _context.Partidas.Select(x=> x.IdUsuario).Distinct().CountAsync() / dias;

            var result = new Reporte2{
                PartidasDia = partidas,
                JugadoresDia = jugadores,
                Dias = dias
            };

            return Ok(result);
        }
        catch (Exception e){
            return BadRequest(e.Message);
        }
    }

    /*Promedio de jugadas con puntaje 21 divididas por croupier y jugadores*/
    [HttpGet]
    [Route("reportes/reporte3")]
    public async Task<ActionResult<Reporte3>> reporte3(int idUser){
        try
        {
            var jugadas = await _context.Jugadas.Join(_context.Partidas, j=> j.IdPartida, p=> p.Id, (j, p)=> new {j, p}).Where(x=> x.p.IdUsuario == idUser).CountAsync();

            var jugador = await _context.Jugadas.Join(_context.Partidas, j=> j.IdPartida, p=> p.Id, (j, p)=> new {j, p}).Where(x=> x.p.IdUsuario == idUser && x.j.PuntosJugador == 21 && x.j.Ganador.Equals("jugador")).CountAsync();

            var croupier = await _context.Jugadas.Join(_context.Partidas, j=> j.IdPartida, p=> p.Id, (j, p)=> new {j, p}).Where(x=> x.p.IdUsuario == idUser && x.j.PuntosCroupier == 21 && x.j.Ganador.Equals("croupier")).CountAsync();

            var result = new Reporte3{
                Jugadas = jugadas,
                Jugador = jugador,
                Croupier = croupier
            };

            return Ok(result);
        }
        catch (Exception e){
            return BadRequest(e.Message);
        }
    }
}
