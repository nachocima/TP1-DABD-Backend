using System;
using System.Collections.Generic;

namespace blackJack.Data
{
    public partial class Partida
    {
        public Partida()
        {
            CartasUsada = new HashSet<CartasUsada>();
            Jugada = new HashSet<Jugada>();
        }

        public int Id { get; set; }
        public int IdUsuario { get; set; }
        public DateTime Fecha { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; } = null!;
        public virtual ICollection<CartasUsada> CartasUsada { get; set; }
        public virtual ICollection<Jugada> Jugada { get; set; }
    }
}
