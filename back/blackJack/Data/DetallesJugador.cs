using System;
using System.Collections.Generic;

namespace blackJack.Data
{
    public partial class DetallesJugador
    {
        public int Id { get; set; }
        public int IdJugada { get; set; }
        public int IdCarta { get; set; }

        public virtual Carta IdCartaNavigation { get; set; } = null!;
        public virtual Jugada IdJugadaNavigation { get; set; } = null!;
    }
}
