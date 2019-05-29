[HttpPost]
[ValidateAntiForgeryToken]
public JsonResult RegistrarGlosaPost(GlosasModel model)
{
    if (!ModelState.IsValid ) return new CommonController().SalidaModeloInvalido();
    if ((model.AmbitoGlosa == "Medicamento") && (model.MedicamentoId == null))
    {
        return new CommonController().SalidaModeloInvalido("Debe seleccionar un medicamento sobre el cual va a plicar la glosa o novedad");
    }
    var transTotales = Bl.GetPrecalcularValoresGlosa(model);
    return new CommonController().SalidaBlStandar(transTotales);
}