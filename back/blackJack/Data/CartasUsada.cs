using System;
using System.Collections.Generic;

namespace blackJack.Data
{
    public partial class CartasUsada
    {
        public int Id { get; set; }
        public int IdPartida { get; set; }
        public int IdCarta { get; set; }

        public virtual Carta IdCartaNavigation { get; set; } = null!;
        public virtual Partida IdPartidaNavigation { get; set; } = null!;
    }
}
