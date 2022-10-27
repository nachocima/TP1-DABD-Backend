using System;
using System.Collections.Generic;

namespace blackJack.Data
{
    public partial class Carta
    {
        public Carta()
        {
            CartasUsada = new HashSet<CartasUsada>();
            DetallesCroupiers = new HashSet<DetallesCroupier>();
            DetallesJugadors = new HashSet<DetallesJugador>();
        }

        public int Id { get; set; }
        public string Numero { get; set; } = null!;
        public string Palo { get; set; } = null!;
        public int Valor { get; set; }

        public virtual ICollection<CartasUsada> CartasUsada { get; set; }
        public virtual ICollection<DetallesCroupier> DetallesCroupiers { get; set; }
        public virtual ICollection<DetallesJugador> DetallesJugadors { get; set; }
    }
}
