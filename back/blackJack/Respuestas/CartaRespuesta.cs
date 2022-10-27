namespace blackJack.Respuestas;

public class CartaRespuesta
{
    public int Id { get; set; }
    public string Numero { get; set; } = null!;
    public string Palo { get; set; } = null!;
    public int Valor { get; set; }
}
