using blackJack.Comandos;
using blackJack.Data;
using blackJack.Respuestas;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace blackJack.Controllers;

[ApiController]
public class JuegoController: ControllerBase
{
    private readonly blackJack1Context _context;
    public JuegoController(blackJack1Context context)
    {
        _context = context;
    }

    [HttpGet]
    [Route ("get/mazo")]
    public async Task<ActionResult<List<CartaRespuesta>>> getMazo(int mazos){
        try
        {   var mazo = new List<Carta>();
            mazo = await _context.Cartas.ToListAsync();

            for (int i = 1; i < mazos; i++)
            {
                mazo.AddRange(await _context.Cartas.ToListAsync());
            }

            if(mazo == null){
                return BadRequest("No hay cartas");
            }

            var result = new List<CartaRespuesta>();
            foreach (var c in mazo)
            {
                var carta = new CartaRespuesta{
                    Id = c.Id,
                    Numero = c.Numero,
                    Palo = c.Palo,
                    Valor = c.Valor
                };

                result.Add(carta);
            }

            return Ok(result);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpGet]
    [Route ("get/carta")]
    public async Task<ActionResult<CartaRespuesta>> getCarta(int partida, int jugada, bool jugador, int mazos){
        try
        {
            var flag = false;
            int index = 0;
            //validacion de que la carta esta disponible
            while (!flag)
            {
                Random rnd = new Random();
                index = rnd.Next(1, 53);

                var usadas = await _context.CartasUsadas.Where(x=> x.IdPartida == partida && x.IdCarta == index).ToListAsync();

                if(usadas.Count >= mazos){
                    flag = false;
                }
                else{
                    flag = true;
                }
            }
            
            //obteniendo la carta y mapeandola para retornarla
            var carta = await _context.Cartas.Where(x=> x.Id == index).FirstAsync();
            var result = new CartaRespuesta{
                Id = carta.Id,
                Numero = carta.Numero,
                Palo = carta.Palo,
                Valor = carta.Valor
            };

            //agregando la carta a Cartas Usadas
            var cartaUsada = new CartasUsada{
                IdPartida = partida,
                IdCarta = index
            };

            await _context.CartasUsadas.AddAsync(cartaUsada);

            //Agregando la carta a la Jugada
            if(jugador){
                var detalle = new DetallesJugador{
                    IdJugada = jugada,
                    IdCarta = index
                };
                await _context.DetallesJugadors.AddAsync(detalle);
            }
            else{
                 var detalle = new DetallesCroupier{
                    IdJugada = jugada,
                    IdCarta = index
                };
                await _context.DetallesCroupiers.AddAsync(detalle);
            }

            await _context.SaveChangesAsync();
            return Ok(result);


        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpGet]
    [Route ("get/cartasUsadas")]
    public async Task<ActionResult<int>> getCartasUsadas(int partida){
        try
        {
            var cartas_dis = await _context.CartasUsadas.Where(x=> x.IdPartida == partida).ToListAsync();
            if(cartas_dis.Count > 140){
                return Ok(1);
            }
            else if(cartas_dis.Count > 125 && cartas_dis.Count < 140){
                return Ok(2);
            }
            return Ok(3);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
        
    }

    [HttpPost]
    [Route("post/partida")]
     public async Task<ActionResult<PartidaRespuesta>> postPartida(int id_user){
        try
        {
            if(id_user == 0){
                return BadRequest("Datos invalidos");
            }

            var partida = new Partida{
                IdUsuario = id_user,
                Fecha = DateTime.Now
            };

            await _context.Partidas.AddAsync(partida);
            await _context.SaveChangesAsync();

            var result = await _context.Partidas.Where(x=> x.IdUsuario == partida.IdUsuario).OrderBy(x=> x.Id).LastOrDefaultAsync();

            if(result == null){
                return BadRequest("null");
            }
            
            var result_id = new PartidaRespuesta{
                Id = result!.Id
            };

            return Ok(result_id);

        }
        catch (Exception e)
        {
            return Ok(e.Message);
        }
     }

    [HttpPost]
    [Route("post/jugada")]
    public async Task<ActionResult<JugadaRespuesta>> postJugada(int id_partida){
         try
        {
            if(id_partida == 0){
                return BadRequest("Datos invalidos");
            }

            var jugada = new Jugada{
                IdPartida = id_partida,
            };

            await _context.Jugadas.AddAsync(jugada);
            await _context.SaveChangesAsync();

            var result = await _context.Jugadas.Where(x=> x.IdPartida == jugada.IdPartida).OrderBy(x=> x.Id).LastOrDefaultAsync();;
            
            var result_id = new JugadaRespuesta{
                Id = result.Id
            };

            return Ok(result_id);

        }
        catch (Exception e)
        {
            return BadRequest(e);
        }
    }


    [HttpPut]
    [Route("put/jugada")]
     public async Task<ActionResult<JugadaPutREspuesta>> putJugada(JugadaComando cmd ){
        try{
            var jugada = await _context.Jugadas.Where(j=> j.Id == cmd.Id).FirstAsync();

            if(jugada == null){
                return BadRequest("No se ha encontrado la jugada");
            }
            
//VALIDAR JUGADA
            var result = new JugadaPutREspuesta();
            var ganador = "";

            if(cmd.PuntosJugador == 21){
                result.Ganador = "Jugador gana con 21";
                ganador = "jugador";
            }
            else if(cmd.PuntosJugador > 21 && cmd.PuntosCroupier == 0){
                result.Ganador = "Croupier gana, el jugador se ha pasado con " + cmd.PuntosJugador;
                ganador = "croupier";
            }
            else if(cmd.PuntosCroupier > 21 && cmd.PuntosJugador < 22){
                result.Ganador = "Jugador gana con " + cmd.PuntosJugador + ", el croupier se ha pasado con " + cmd.PuntosCroupier;
                 ganador = "jugador";
            }
            else if(cmd.PuntosCroupier > cmd.PuntosJugador && cmd.PuntosCroupier < 22){
                result.Ganador = "Croupier gana con " + cmd.PuntosCroupier + ", Jugador: " + cmd.PuntosJugador;
                ganador = "croupier";
            }
            else if(cmd.PuntosCroupier < cmd.PuntosJugador && cmd.PuntosJugador < 22){
                result.Ganador = "Jugador gana con " + cmd.PuntosJugador + ", Croupier: " + cmd.PuntosCroupier;
                 ganador = "jugador";
            }
            else if(cmd.PuntosJugador != 21 && cmd.PuntosCroupier == cmd.PuntosJugador){
                result.Ganador = "Empate";
                ganador = "empate";
            }

            jugada.PuntosCroupier = cmd.PuntosCroupier;
            jugada.PuntosJugador = cmd.PuntosJugador;
            jugada.Ganador = ganador;

            _context.Jugadas.Update(jugada);
            await _context.SaveChangesAsync();

            return Ok(result);
        }
        catch(Exception e){
            return BadRequest(e.Message);
        }
     }

}