using PerdiNoCampus.API.Models;

namespace PerdiNoCampus.API.Contracts
{
    public class CreateItemRequest
    {
        public string Nome { get; set; }
        public ECategoriaItem CategoriaItem { get; set; }
        public string LocalEncontrado { get; set; }
        public ETurno TurnoEncontrado { get; set; }
        public string UsarioNomeLocalizou { get; set; }
        public int Matricula { get; set; }
        public string ImagemUrl { get; set; }
        public bool? FoiEntregueAPrefeitura { get; set; }
    }
}
