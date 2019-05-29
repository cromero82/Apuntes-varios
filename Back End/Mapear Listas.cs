public void Mapear() {
    // varios elementos lista de datos
    var list = trans.Result.ListaMedicamentos as IList<IDictionary<string, object>>;
    model.MedicamentosFormulados = list.Select(item => Slapper.AutoMapper.Map<MedicamentosFormulados>(item)).ToList();
            
    // un elemento de (cursor o lista de datos)
    var elementoFormulacion = trans.Result.ListaFormulacion[0] as IDictionary<string, object>;
    model.Formulacion = Slapper.AutoMapper.Map<ListFormulasGridModel>(elementoFormulacion); 
}