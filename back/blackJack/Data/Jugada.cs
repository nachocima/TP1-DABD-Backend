using System;
using System.Collections.Generic;

namespace blackJack.Data
{
    public partial class Jugada
    {
        public Jugada()
        {
            DetallesCroupiers = new HashSet<DetallesCroupier>();
            DetallesJugadors = new HashSet<DetallesJugador>();
        }

        public int Id { get; set; }
        public int IdPartida { get; set; }
        public int PuntosJugador { get; set; }
        public int PuntosCroupier { get; set; }
        public string? Ganador { get; set; }

        public virtual Partida IdPartidaNavigation { get; set; } = null!;
        public virtual ICollection<DetallesCroupier> DetallesCroupiers { get; set; }
        public virtual ICollection<DetallesJugador> DetallesJugadors { get; set; }
    }
}
