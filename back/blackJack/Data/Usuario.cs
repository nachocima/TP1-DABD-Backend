using System;
using System.Collections.Generic;

namespace blackJack.Data
{
    public partial class Usuario
    {
        public Usuario()
        {
            Partida = new HashSet<Partida>();
        }

        public int Id { get; set; }
        public string Usuario1 { get; set; } = null!;
        public string Pass { get; set; } = null!;

        public virtual ICollection<Partida> Partida { get; set; }
    }
}
