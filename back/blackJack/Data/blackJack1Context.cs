using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace blackJack.Data
{
    public partial class blackJack1Context : DbContext
    {

        public blackJack1Context(DbContextOptions<blackJack1Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Carta> Cartas { get; set; } = null!;
        public virtual DbSet<CartasUsada> CartasUsadas { get; set; } = null!;
        public virtual DbSet<DetallesCroupier> DetallesCroupiers { get; set; } = null!;
        public virtual DbSet<DetallesJugador> DetallesJugadors { get; set; } = null!;
        public virtual DbSet<Jugada> Jugadas { get; set; } = null!;
        public virtual DbSet<Partida> Partidas { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("server=localhost;database=blackJack1;uid=root;pwd=2548", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.30-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("utf8mb4_0900_ai_ci")
                .HasCharSet("utf8mb4");

            modelBuilder.Entity<Carta>(entity =>
            {
                entity.ToTable("cartas");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Numero)
                    .HasMaxLength(3)
                    .HasColumnName("numero");

                entity.Property(e => e.Palo)
                    .HasMaxLength(12)
                    .HasColumnName("palo");

                entity.Property(e => e.Valor).HasColumnName("valor");
            });

            modelBuilder.Entity<CartasUsada>(entity =>
            {
                entity.ToTable("cartas_usadas");

                entity.HasIndex(e => e.IdCarta, "id_carta");

                entity.HasIndex(e => e.IdPartida, "id_partida");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.IdCarta).HasColumnName("id_carta");

                entity.Property(e => e.IdPartida).HasColumnName("id_partida");

                entity.HasOne(d => d.IdCartaNavigation)
                    .WithMany(p => p.CartasUsada)
                    .HasForeignKey(d => d.IdCarta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("cartas_usadas_ibfk_2");

                entity.HasOne(d => d.IdPartidaNavigation)
                    .WithMany(p => p.CartasUsada)
                    .HasForeignKey(d => d.IdPartida)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("cartas_usadas_ibfk_1");
            });

            modelBuilder.Entity<DetallesCroupier>(entity =>
            {
                entity.ToTable("detalles_croupier");

                entity.HasIndex(e => e.IdCarta, "id_carta");

                entity.HasIndex(e => e.IdJugada, "id_jugada");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.IdCarta).HasColumnName("id_carta");

                entity.Property(e => e.IdJugada).HasColumnName("id_jugada");

                entity.HasOne(d => d.IdCartaNavigation)
                    .WithMany(p => p.DetallesCroupiers)
                    .HasForeignKey(d => d.IdCarta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("detalles_croupier_ibfk_2");

                entity.HasOne(d => d.IdJugadaNavigation)
                    .WithMany(p => p.DetallesCroupiers)
                    .HasForeignKey(d => d.IdJugada)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("detalles_croupier_ibfk_1");
            });

            modelBuilder.Entity<DetallesJugador>(entity =>
            {
                entity.ToTable("detalles_jugador");

                entity.HasIndex(e => e.IdCarta, "id_carta");

                entity.HasIndex(e => e.IdJugada, "id_jugada");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.IdCarta).HasColumnName("id_carta");

                entity.Property(e => e.IdJugada).HasColumnName("id_jugada");

                entity.HasOne(d => d.IdCartaNavigation)
                    .WithMany(p => p.DetallesJugadors)
                    .HasForeignKey(d => d.IdCarta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("detalles_jugador_ibfk_2");

                entity.HasOne(d => d.IdJugadaNavigation)
                    .WithMany(p => p.DetallesJugadors)
                    .HasForeignKey(d => d.IdJugada)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("detalles_jugador_ibfk_1");
            });

            modelBuilder.Entity<Jugada>(entity =>
            {
                entity.ToTable("jugadas");

                entity.HasIndex(e => e.IdPartida, "id_partida");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.IdPartida).HasColumnName("id_partida");

                entity.Property(e => e.PuntosCroupier).HasColumnName("puntos_croupier");

                entity.Property(e => e.PuntosJugador).HasColumnName("puntos_jugador");

                entity.Property(e => e.Ganador)
                    .HasMaxLength(60)
                    .HasColumnName("ganador");

                entity.HasOne(d => d.IdPartidaNavigation)
                    .WithMany(p => p.Jugada)
                    .HasForeignKey(d => d.IdPartida)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("jugadas_ibfk_1");
            });

            modelBuilder.Entity<Partida>(entity =>
            {
                entity.ToTable("partidas");

                entity.HasIndex(e => e.IdUsuario, "id_usuario");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Fecha)
                    .HasColumnType("datetime")
                    .HasColumnName("fecha");

                entity.Property(e => e.IdUsuario).HasColumnName("id_usuario");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.Partida)
                    .HasForeignKey(d => d.IdUsuario)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("partidas_ibfk_1");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.ToTable("usuarios");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Pass)
                    .HasMaxLength(60)
                    .HasColumnName("pass");

                entity.Property(e => e.Usuario1)
                    .HasMaxLength(60)
                    .HasColumnName("usuario");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
